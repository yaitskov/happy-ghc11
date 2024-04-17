{ pkgs, haskell, lib, sources }:

let
  inherit (haskell.lib) doJailbreak dontCheck doHaddock;

  # 'fakeSha256' is helpful when adding new packages
  #
  # Set 'sha256 = fakeSha256', then replace the SHA with the one reported by
  # Nix when the build fails with a SHA mismatch error.
  inherit (lib) fakeSha256 nameValuePair listToAttrs;

in hfinal: hprev:

(listToAttrs (map (a:
  nameValuePair a.name
    (dontCheck (hfinal.callCabal2nix a.name a.source { }))) [
      # { name = "cmdargs";
      #   source = sources.cmdargs;
      # }
      # { name = "commutative-semigroups";
      #   source = sources.commutative-semigroups;
      # }
      # { name = "generically";
      #   source = sources.generically;
      # }
      { name = "ghc-trace-events";
        source = sources.ghc-trace-events;
      }
      { name = "primitive";
        source = sources.primitive;
      }

      # { name = "indexed-traversable";
      #   source = sources.indexed-traversable + "/indexed-traversable";
      # }
      # { name = "happy-backend-glr";
      #   source = sources.happy + "/packages/backend-glr";
      # }
      # { name = "happy-backend-lalr";
      #   source = sources.happy + "/packages/backend-lalr";
      # }
      # { name = "happy-codegen-common";
      #   source = sources.happy + "/packages/codegen-common";
      # }
      # { name = "happy-frontend";
      #   source = sources.happy + "/packages/frontend";
      # }
      # { name = "splitmix";
      #   source = sources.splitmix;
      # }

      # { name = "happy-grammar";
      #   source = sources.happy + "/packages/grammar";
      # }
      # { name = "happy-tabular";
      #   source = sources.happy + "/packages/tabular";
      # }
      # { name = "happy";
      #   source = sources.happy;
      # }
    ])) // rec {
      # splitmix = (dontCheck (hfinal.callCabal2nix "splitmix" sources.splitmix {testu01 = null;}));
      # commutative-semigroups = (hprev.commutative-semigroups.overrideAttrs(oa: { configurePhase = ''echo DDDDDDDDDDDDDDDDDDDDDDD; exit 1''; }));
      # happy-grammar = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   } + "/packages/grammar"; #  sources.happy;
      #   configurePhase = ''echo DDDDDDDDDDDDDDD; echo ZZZZZZZZZZZZZZZZZZ>LICENSE; '' + oa.configurePhase;
      # }));

      # happy-tabular = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   } + "/packages/tabular"; #  sources.happy;
      #   buildInputs = [ happy-grammar ];
      #   configurePhase = ''echo ZZZZZZZZZZZZZZZZZZ>LICENSE; '' + oa.configurePhase;
      # }));

      # happy-codegen-common = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   } + "/packages/codegen-common"; #  sources.happy;
      #   buildInputs = [ happy-grammar ];
      #   configurePhase = ''echo ZZZZZZZZZZZZZZZZZZ>LICENSE; '' + oa.configurePhase;
      # }));

      # happy-backend-glr = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   } + "/packages/backend-glr"; #  sources.happy;
      #   buildInputs = [ happy-grammar happy-tabular happy-codegen-common ];
      #   configurePhase = ''echo YYYYYYYYYYYYYYYYYYYYYY>LICENSE; '' + oa.configurePhase;
      # }));

      # happy = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   }; #  sources.happy;
      #   buildInputs = [happy-backend-glr];
      #   configurePhase = ''echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD>LICENSE; '' + oa.configurePhase;
      # }));
      # happy = (hprev.happy.overrideAttrs(oa: {
      #   src = pkgs.fetchgit {
      #     url="https://github.com/yaitskov/happy.git";
      #     rev="78dcc03336d74822d58b8474e9639c6281c1a422";
      #     hash="sha256-zfZk1bNlhzixzWoLgt7/hHVPYyY+Hm3d4GwCsxUA4ks=";
      #   }; #  sources.happy;
      #   # buildInputs = oa.buildInputs; # + [happy-backend-glr];
      #   configurePhase = ''echo DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD>LICENSE; '' + oa.configurePhase;
      # }));

      #   src = ./.; #sources.happy;
      #   configurePhase = ''echo check ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddphase;exit 1;'';
      #   checkPhase = ''echo check ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddphase;exit 1;''; }));
  # "happy": {
  #   "branch": "master",
  #   "repo": "https://github.com/yaitskov/happy.git",
  #   "rev": "78dcc03336d74822d58b8474e9639c6281c1a422",
  #   "type": "git"
  # },

      th-abstraction = dontCheck( hfinal.callHackageDirect {
       pkg = "th-abstraction";
       ver = "0.7.0.0";
       sha256 = "sha256-BVNW4gxs4Dw4cakEQ1jDiukVd9+Cu7RDAgv6te15DEN=";
      } {});

      # happy = dontCheck( hfinal.callHackageDirect {
      #  pkg = "happy";
      #  ver = "1.21.0";
      #  sha256 = "sha256-BVNW4gxs4Dw4cakEQ1jDiukVd9+Cu7RDAgv6te15DEM=";
      # } {
      #   mkDerivation = x: hfinal.mkDerivation (x // {  });
      # }).overrideAttrs(oa: {buildInputs = []});
      # happy = dontCheck( hfinal.callHackageDirect {
      #  pkg = "happy";
      #  ver = "1.20.1.1";
      #  sha256 = "sha256-BVNW4gxs4Dw4cakEQ1jDiukVd9+Cu7RDAgv6te15DEN=";
      # } {});
      code-page = dontCheck( hfinal.callHackageDirect {
       pkg = "code-page";
       ver = "0.2.1";
       sha256 = "sha256-lrPtzTWPVi6AVJLg3GgM9fDdv/wS9h3MCsJCnKFuyrw=";
      } {});
      # file-embed = dontCheck( hfinal.callHackageDirect {
      #  pkg = "file-embed";
      #  ver = "0.0.16.0";
      #  sha256 = "sha256-KHJ9gZKmykJFhKliPP3Ks1CL9ZJ+25cnAE1RCCmTYk4=";
      # } {});
      # foundation = dontCheck( hfinal.callHackageDirect {
      #  pkg = "foundation";
      #  ver = "0.0.30";
      #  sha256 = "sha256-KHJ9gZKmykJFhKliPP3Ks1CL9ZJ+25cnAE1RCCmTYk7=";
      # } {});
      # primitive = dontCheck( hfinal.callHackageDirect {
      #  pkg = "primitive";
      #  ver = "0.9.1.0";
      #  sha256 = "sha256-M8f3PrCOuBaXwT04lSjIe7WCE9+BdlIdqZ65r9VedmQ=";
      # } {});

      # memory = dontCheck( hfinal.callHackageDirect {
      #  pkg = "memory";
      #  ver = "0.18.0";
      #  sha256 = "sha256-XnvlTcUPoaJaWwg5XKqm0X3EnIddz1ihg1U6LslMtBg=";
      # } {});
    }
