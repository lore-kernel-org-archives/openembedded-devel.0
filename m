Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 758BBC00144
	for <webhook@archiver.kernel.org>; Mon,  1 Aug 2022 08:41:47 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web11.22253.1659343305499296627
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:41:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fYiH58tD;
 spf=pass (domain: gmail.com, ip: 209.85.208.53,
 mailfrom: alex.kiernan@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id e15so12818276edj.2
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Aug 2022 01:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=i02tivCWsP4A+c8eHSxIUDM5Sa76rf/P8rMfSXMa648=;
        b=fYiH58tDqO8I9DBnAv2vk53quxF3ZhOBVeaaU8jcuL4nMhuEejTFdkDEvekfmbHMDR
         C0U/+TF+NODbyjDhGK9i79Anryo2DlK1vYzoRpjHQygkobtvujrXZ/jRIZ2UpfUr8h4p
         qZcMC+T0E1lG+mXUhUyzVp6c0Ptaltf0S0FIdmk6tFkUhSm4J/XIhLoJVkBg8TwI0MWI
         f6y0pHr5grW56NL9Irsm/VW3Y4YWwgAPdwG+Rj1SefIy6W8B3CYINU7eeOZP6SuDZUw+
         NKs0ooIxePShiPkQ+zyZM4ir2aXLvul2HcAbGDyafux/v5ywfv7xHrPSyUdufzpPL3jd
         PEMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=i02tivCWsP4A+c8eHSxIUDM5Sa76rf/P8rMfSXMa648=;
        b=th7/hMiQ6A0Lo4Z23uthJ6USr12IMUv2e1gBux90FnsODhkigQFsUzPK5Ixc3o6TrL
         Cm3kV7KQdN6CUdBgVDbwFRFLu2XrbQzBQSqIRv2vcWlj3PdqNXCOTAwIDaL6mncd+uw8
         kEQPRurs+msigwdTDCavp+vMDcdZZ8ZcthdJBYFSEJsHzxKMIjkVHYpzDrQhZeizH+xs
         ZgBA9qDd6BKG1pwAKSi3gUq/u93HQfkcskD3F4wNq40iqISAO79CinoJO4bl0MkOlByE
         aQqo1KVZYf63Fp8aDGmIbmWjLXDqLZjyn+9gZPXNk8+wTZL7oQAyRpfL/+2zraoZSifW
         XKWw==
X-Gm-Message-State: AJIora98SGrmtkwlMFeMbLiob9OPUJo2Q46CKv5GaZP0WyzYtMeMLy/I
	NK7IUP+SNWMSnejme/JR9d1pX/VguJ0=
X-Google-Smtp-Source: 
 AGRyM1vOtCedt4TUGvW4n1So50OZXZaP6XZdxf2zCSfzbMg8I8xGQlMFEtqTn96ZgbCrRMvM/gTe6A==
X-Received: by 2002:a05:6402:3707:b0:437:61f9:57a9 with SMTP id
 ek7-20020a056402370700b0043761f957a9mr14533491edb.1.1659343302964;
        Mon, 01 Aug 2022 01:41:42 -0700 (PDT)
Received: from localhost.localdomain (cust246-dsl91-135-6.idnet.net.
 [91.135.6.246])
        by smtp.gmail.com with ESMTPSA id
 ku26-20020a170907789a00b00730979f568fsm74911ejc.150.2022.08.01.01.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Aug 2022 01:41:42 -0700 (PDT)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [meta-oe][PATCH] ostree: Upgrade 2022.2 -> 2022.5
Date: Mon,  1 Aug 2022 09:41:37 +0100
Message-Id: <20220801084137.19843-1-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Aug 2022 08:41:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98070

  15740d042c9c Release 2022.5
  6cb1227177dc docs add debos to readme distribution build tools
  e0417957ea15 rust: Add a test case for ed25519
  83e6357186be sign/ed25519: Verify signatures are minimum length
  7db2fe8cba2a Update doc about adding new function to libostree
  60853219d5a7 sysroot: Add a few more assertions about `boot_fd`
  75aa7a22f6d6 sysroot: Have `ensure_writable` also always initialize
  2c716552052c deploy: Ensure sysroot is initialized for kargs in place
  8f24e0826ac3 Add test to verify `ostree admin kargs edit-in-place` working
  7b7b6d741bda Fix `ostree admin kargs edit-in-place` fails issue
  22946e9d963f Fix link to rust bindings
  d3762be9b3c8 deny: Sync with rpm-ostree
  d7107e3036ff ostree-repo: bls-append-except-default followup
  becc18936ff7 lib: Stop using old `ostree_sysroot_get_repo()` API
  a98487123773 lib/prune: speed up pruning by retrieving only commits
  e98988ba176e tests/inst: Port to cap-std
  52d6f4e79078 tests/staged-deploy.sh: Hack around cosa systemd unit check
  14a7c0c74bc0 s390x: rename sd-boot to sdboot
  be2075eef006 repo: Metadata return values from `load_file` are not nullable
  7814d9339e7a tests/inst/destructive: stop disabling fedora-coreos-pinger
  63499747b938 Bump to cap-std 0.25 and io-lifetimes 0.7
  b87c8a8e23b7 rust: Bump semver to 0.15
  37d0ca41b65b Fix clippy lint in cap-std bits
  001839b35f3c ci/rust: Change MSRV to `cargo check`
  ed98a7904c95 ci/rust: Enable `cap-std-apis` in default build, add a no-feature build
  3bc59a52068e RFE: Add a hidden option to `ostree admin kargs edit-in-place` to update all existing deployments in place
  7ee2d1b1376e Drop `.packit.yaml`
  ce428c1f60b6 test-basic-c: Don't assert that extended attributes are available
  9bdf3861ad08 cli/refs: Port to C99 style
  2f1c9a727e59 cli/remote-list: Port to C99 style
  a0ae2f915698 cli/gpg-sign: Port to C99 style
  43b712951d8f cli/diff: Port to C99 style
  f8403f46dc19 cli/config: Port to C99 style
  4e356d0e8fde cli/unlock: Port to C99 style
  588b07e55421 cli/undeploy: Port to C99 style
  46e1db392d59 cli/os-init: Port to C99 style
  eee0eea58b0d rust-bindings: Wire up `tests/`
  436ff11a008b fsck: Use `load_variant_if_exists`
  bd030a96f26e fsck: Move most commit processing into helper function
  2fe0ea73955c fsck: De-indent loop
  6981633f9c91 fsck: Don't load all object names into memory
  a13d81236863 repo: Document non-obvious way to list all commits
  93e3784b66f5 rust: Use inline `format!` variables in a few places
  76071a2b1184 ci: Bump MSRV
  99c122d21900 rust: Switch to 2021 edition
  d7802c27ddd6 rust-bindings: Update cargo package list
  61dd54f94091 rust-bindings: use correct README.md
  dc13645299df rust-bindings: Fix repository reference
  2688d7d2611d tests/inst: Bump the version of ostree-ext
  145d91d1c967 lib: Fix symbol versioning inheritance
  fffb11163399 prune: Also use object set API in `ostree_repo_prune_from_reachable()`
  5341a13b33d4 ci: Add a flow that does a git libostree + git rust-bindings
  a71915e4367f repo: Further optimize `ostree_repo_list_objects_set()`
  4806d84f568f rust: Bump semver, add feature for current release
  c2baa6d10b18 repo: Optimize memory use of `ostree_repo_list_objects()`
  664c41329982 configure: post-release version bump
  5fa364d3997a Release 2022.4
  fa3b6c9872b2 rust-bindings: Update to latest git
  70c8499a3890 rust-bindings: Use OSTree-1.0.gir from our own builddir
  21901c2d36b2 rust-bindings: Delete committed gir files
  3e645ad950c3 Drop `OSTREE_BUILT_FEATURES` from introspection
  32ee82133bba Rename ostree-cmdprivate to drop out of introspection
  e69321176dcc gitignore: Add ci-build/
  199ef821c827 ci: Add a codestyle.sh
  aea20704b5b7 ci: Drop an unused files
  2838f42eec54 ci: Drop libsoup build in jenkins
  03d592b11696 Fix annotations on ostree_mutable_tree_lookup()
  972f00e48350 s390x: do not unpack existing initrd, just append LUKS keys to its copy
  2e564aef074a copr: mark git checkout as safe
  b03fa626f1c3 s390x: fail on error during reading of SecureExecution sysfs flag
  b024ce5eeb41 Remove dup "--os=OSNAME" line in output of "ostree admin config-diff --help"
  606459ad2614 Fix GNU style of two spaces for indent in https://github.com/ostreedev/ostree/pull/2612
  d0005698596f s390x: ensure SecureExecution is enabled before sd-boot generation
  87afaced37d5 man: Fix ostree-admin-instutil subcommands
  0ba3bfe4fd0c Teach --karg-delete option to ostree admin deploy
  248b2936ace8 man/ostree.repo-config.xml: add docs for bls-append-except-default key
  326d89752a77 ostree-systroot-deploy: parse bls-append-except-default key
  7a5c604ca339 s390x: generate sd-boot at its own partition
  1c201d6be410 ci: Move codestyle and min build to GH actions
  87cf46bbd92f ci: Drop all `runAsUser: 0` in builds
  41b9f8ff9716 ci: Drop gcc `-fanalyzer` by default
  6a055f802ffb sysroot: Strengthen several `g_return_if_fail` into `g_assert()`
  e27fed45fd12 sysroot: Quiet one gcc `-fanalyzer` warning
  245666c99fa1 build(deps): bump libglnx from `c71f7ae` to `c59eb27`
  9f8d026f8280 ci: use cargo-deny
  60404565e541 rust-bindings: Remove some unused CI/test bits
  e9141e97c1c7 ci: Move rust-bindings CI to toplevel
  ee2c31badd02 tests/inst: Add .gitignore
  9db45cad5ae1 ci: Work around GH actions `container:` + git + security bug
  558d966420e0 tests/inst: Fix install rules for ostree-rs merger
  f79b2cea91fc Add APIs to get xattrs from disk
  d72f1684a0ab cfg.mk: Don't even look at rust-bindings/
  ffb3b2bc7ad8 docs/ima: Also link the SUSE docs
  252060906b65 build-sys: Adjust for merge of ostree-rs
  a5ef4cd5cc4c Add a `repo()` accessor to `TransactionGuard`
  1541c5eb2efd lib: Run `cargo fmt`
  d1fad37d1a78 ostree: release 0.13.7
  04c8e3e9f3ad ostree: manually patch generated files
  dd0cfc6d4b8e ostree: refresh after gir bump
  3fc55a524bf8 ostree/cargo: bump to ostree-sys 0.9.2
  61b4629b37c1 ostree-sys: release 0.9.2
  cf5462178c73 ostree-sys: refresh after gir bump
  1cb07e0ca59c gir-files: bump to v2022.2
  887f5b09be09 repo: Add `query_file` API
  1199ae9bbca1 Add manual bindings for MutableTree reading
  46b4a12b23ce Release 0.13.6
  ecbe3ba0f89a Fast-track fix for `ostree_gpg_verify_result_get_all()`
  dde1a7b43f0d Release 0.13.5
  9250effa8f95 Add `COMMIT_META_CONTAINER_CMD` constant
  19224a411af0 repo: Add two more cap-std APIs
  6940896c4e4e Add a `cap-std-apis` feature with open/create
  4f7eea6aa7de Release 0.13.4
  d1731d0ea82a repo: Add an API to read and parse directory metadata
  f01c847a682b ci: add jobs for MSRV checks and linting
  83b03d2996a9 lib: run rustfmt
  810e86d4fbe6 lib: fix new clippy warnings
  86295e3bfe79 sys/cargo: refresh manifest
  1bd6e2fc0621 Update impl Display, omit to_string, change wording
  2ab55beb988e add ObjectDetails-struct and use it in list_objects-function
  81ea92566f46 update result type
  f6c1e0cb82dc switch from if-else to match
  16a4dddd9027 implement list_objects-function an test
  51a03e199c21 sysroot: support create and load actions on builder
  ec572d786ea8 sysroot: add a builder object
  440d872f68dc repo: Add `require_rev` method
  faaf0457fdfd (cargo-release) start next development iteration 0.13.4-alpha.0
  34147475b50d (cargo-release) version 0.13.3
  0432bd48b938 Bump ostree-sys version
  99ac68cb317e Update to 2021.5
  349933ab16a8 (cargo-release) version 0.13.3-alpha.1
  c3141df56df2 (cargo-release) version 0.13.2
  f8852ca94569 repo: Add `auto_transaction` and `TransactionGuard`
  69950574f715 (cargo-release) start next development iteration 0.13.2-alpha.0
  507787161ce0 (cargo-release) version 0.13.1
  955f0ddb9db3 repo: Expose dfd_as_file()
  e33767cc2a3d Make `SePolicy` have `Send`
  7b47de7a1485 lib: Reexport libc::AT_FDCWD
  2bfbfe3c6f69 sys: Release 0.9.0
  09ef16fdbf6e Release 0.13
  b17f3b37f0ea Release 0.12.3
  0f7a1d9c0cff Cargo.toml: Bump to glib 0.14.4
  f9a91bfabd6b lib: Export ffi too
  9a5f14ce683e Release 0.12.2
  9b57bda60773 Use glib-sys via re-exported `glib::ffi` (and similar for gio)
  709b35bf1159 Fix build with --features=v2021_3, use in CI by default
  abec2a9e34b6 Add more documentation for --features=v2021_3
  83c829eaad8a Add new GLib 0.14 variant types for metadata types
  48e0d334b86d Deny unused results, warn on missing docs (except auto/)
  f3df1175f8fa cargo: bump ostree-sys to 0.8.1
  b2c6dd61a196 ostree: release 0.12.1
  fdfaea186402 cargo: point to docs.rs and clean up
  20a025a0ebf9 lib: fix 'dox' feature
  712570b9b7ae cargo: fix version in features chain
  deedffde068c Re-export glib, gio
  6303229c4eff Add 2021.3 feature
  04a42dff1e33 Bump versions
  8a5ac02822d9 Update to glib 0.14
  f276c040bd21 ci: Fix buildroot to use new official image
  ae189bec804d Mark src/auto/* as generated
  78ca01c4e353 repo_transaction_stats: move to a manual implementation
  bd843b2eae25 Bump sys version requirement
  42110ce01ba4 Bump versions
  7d15179670f3 Update to 2021.2
  9bb0dd3c4d0c ci: Add GH action to build
  b5496f70f640 repo: Add concurrency=send
  0718f433a27d Update rustdoc-stripper
  6043e5ffc1ea Bump all versions
  674ad14ccec9 Regenerate
  a96be52f1d42 Switch to patched ostree gir
  0e9a16f4c10e Regenerate
  c55459463f1a Update OSTree-1.0.gir to 2021.1
  be8dbd701b66 Fix ostree gir file update
  0c33d6331da1 Update common gir files
  b526f511653e Bump versions
  900973b61f9c Remove outdated sentence in readme
  2caf0264c713 src: fix tests
  e18919e0efad src: manually implement SysrootDeployTreeOpts
  7576363329a9 ci: fix rawhide stages?
  d345ea0110a4 Switch to patched ostree gir
  75848b26ef02 Regenerate based on new gir
  4cbbbf2daa9e gir: update OSTree gir
  e686a0bed6a2 gir: update misc gir files
  fe03ad1feeee Update gir file to 2020.6
  1ab87e6b9792 conf: anchor function name patterns to avoid unexpected exclusions
  8ef294b62763 Bump versions
  5ae1a4005ce3 conf: ignore some more special-cased functions
  86897a520c68 src: add Checksum::from_bytes
  6f05869713d9 conf: annotate ignores better
  19076fe6d8b3 src: reimplement checksum hex and base64 en/decoding
  f3b0bbe64ceb src: add support for write_deployments_with_options
  f45bfa2c5a3f Makefile: only depend on gir bin in gir-report
  4e7abb3101a4 conf: remove some unfixable TODOs
  5b1bc5041890 src: add CommitSizesEntry
  3d8d5ce53e08 Disable some irrelevant functions
  e49ee07373b7 Update to OSTree 2020.5
  26f4170b0173 conf: disable internal Sign subtypes
  a39328a4ebb0 sign: add sanity check for sign API
  cefbccaee788 gir: fix another out parameter
  24b514837492 gir: fix out parameters not being marked correctly
  d900c5814867 gir: add missing version tag
  be67b37336d7 gir: start fixing OSTree.Sign
  977b51ed3961 gir: switch to gir based on patched upstream source
  d8838109f55f Switch ostree source to git
  e76a6b48ffbf PATCH: versions on ostree_sign_* functions
  65122a5a97a9 PATCH: version on OSTREE_SIGN_NAME_ED25519
  7c72d297efce PATCH: version on ostree_repo_commit_modifier_set_sepolicy_from_commit
  2504c97a8d75 ci: try different Fedora image?
  1010581c48f9 Update docs
  cd36d8b7e4e4 Add feature levels to Cargo.toml
  aee92d14a82e Update to OSTree 2020.4
  d7156df1da31 Add script to get OSTree-1.0.gir from libostree source build
  d7848fe8bf3d Fix indentation in readme
  cc1b862ae55f Bump versions
  0b267b2dc079 Add Vagrantfile
  b082362df405 Also remove OSTree-1.0.gir when cleaning gir files
  7ef8668f0ab7 Add command to grab latest OSTree-1.0.gir from Fedora Rawhide
  409527e23231 ci: update readme (and pipeline)
  28c8a3e77ac8 ci: refactor pipeline
  253f46e8466f Update rustdoc-stripper
  dc69966a9fe9 ci: change docs build command
  2c3c976828eb Switch back to upstream gir
  be60eb7e6695 ci: test building for non-x86 target
  66a16b13b9d3 ci: use --workspace instead of --all
  296768c2b077 ci: update sccache
  66f928df83d3 src: use libc::c_char to improve non-x86 compatibility
  de0cee4ecd70 tests: use RepoMode::Archive (seems to be less finicky)
  990bbe290a67 Use forked gir with updated shell-words and cleaned-up build.rs
  d7b785c4d318 sys: remove pkg-config dependency
  c36ee94f9b9b conf: disable RepoFinder methods that don't autogenerate correctly
  05e86a6b42d8 gir: patch ostree_repo_finder_avahi_new
  c38d832dfcb1 Bump dependency versions
  37f9e3599afd Switch from lazy_static to once_cell
  130f0c283988 Update gir version and regenerate
  c040aa4736b7 Regenerate with new gir files
  ec2476b518cc Start adding more update instructions to README
  3be9cb518fc3 gir: update bundled gir files
  fddff04204bd Change branch name references
  9af7577b0f04 Add LICENSE to ostree-sys
  7c2410382c48 Ignore ci-cached directories so they don't interfere with the publish
  a9d7623a4c2e Bump version
  ddb781f39943 repo_checkout_at_options: fix version flags
  935cbf416243 ci: simplify pipeline a bit maybe
  175649141ed1 ci: install fewer things
  6a077fff858b ci: build every feature level separately
  6ab1e997eefb ci: ignore gir differences in version files
  24379017c615 gir-files: update to 2020.3
  8530365ccf47 Bump ostree version
  5a852bd0487e Bump versions
  7c56e3c49e7b Regenerate for OSTree 2020.2
  8636b7173dff gir: update to OSTree 2020.2 gir
  f0d617228f0b ci: disable clippy warnings for the moment
  1d262ca279c4 Remove repo hash from versions.txt
  a4cee3c94d27 Revert "ci: ignore changes in versions.txt lines"
  8576adff1d66 ci: ignore changes in versions.txt lines
  31c80cb22bff Bump versions
  3290d5c2d196 Rewrite handwritten futures functions
  3e70feb75f55 Start taking out futures feature
  241806b75783 Update glib + gir and regenerate
  28407036b155 Bump versions
  3f438a9c3ff2 Add 2019.6 feature
  5bfc5d12d0c4 Regenerate files
  5ecc8a0e4fc1 gir: update OSTree-1.0.gir
  59f9b69989d9 Bump versions
  f0ef98a71af1 Add some ignored types
  bf27ba5dc0e8 Fix lint in tests
  d2e384a39fbe Update gir file
  f5c255b4b493 Update bundled glib gir files
  366e9b729f4e Add feature alias for the latest OSTree version
  14b511d32b87 ci: fix setup, again
  53f9c1a3aa6a ci: install sccache during docs build
  2014336b03b6 ci: install make
  ad6e0569be49 ci: don't reformat -sys
  486c60489ad8 Set up cargo workspace
  75ab3f50cda2 Fix clippy issue
  4bdb7b876058 ci: switch to Fedora Rawhide
  bdf749b0e683 ci: update sccache
  febbd00c2795 ci: run crates.io publish on release tags
  376dc2896c15 ci: fix build
  d801cacb5d90 Bump crate versions
  f640444986d2 checksum: implement more traits and functions
  2fdf020645f4 checksum: implement conversion from string and to base64
  ad26abaa7e05 Implement ostree::checksum_file_at
  815b8563d54f Implement ostree::checksum_file_async
  14f2ff43df7b Implement ostree::checksum_file_from_input
  7f3bd56d0dba Implement ostree::checksum_file
  4cd981d01b04 Use pointer coercion instead of messing with -sys
  d55d1b1d4393 Fix file mode
  6bc1a1d99552 Add SePolicy::fscreatecon_cleanup
  e424800f05a2 Implement Repo::write_metadata_async
  8002e06e2575 Implement Repo::write_content_async
  bb4e0c597850 Implement Repo::write_metadata
  78a14d15a3eb Implement Repo::write_content
  17a9d7c85541 Implement Checksum type for binary checksums
  6ef9ab2558fc kernel_args: fix feature flags
  3bfb805288b3 kernel_args: enable and fix argv methods
  12d976d45d43 Make kernel_args compile
  32173d5b81a5 Add generated KernelArgs (not working yet)
  8f223aca1a10 ci: bump used version
  e6a1fddc8c9b Regenerate main crate
  377b7ae20270 Clean up docs.rs sections in Cargo.tomls
  5980af7b420b Ignore BUILT_FEATURES from main crate
  d2525da221b4 Regenerate -sys
  0e3b567b194e Disable build features constant
  d51861e80cbd Update OSTree-1.0.gir
  3951ac14b800 Update gir files
  f7d769c0c490 ci: fix feature flags
  b94af875895e Revert "Enable some functions that seem to work now"
  13556fde44dc Enable some functions that seem to work now
  160bdaeb5c40 Add features for docs.rs build
  75ce6dfcac81 Update gir version
  7f61aeb779af ci: use libostree from unstable
  dee049082968 ci: fix
  14577daf7f82 ci: I guess we did need CMake
  110b09e1cd5f ci: fix features for -sys
  35fde6031815 ci: still need before_script for docs
  e4c82f6e8ec9 ci: clean up image
  39532d4160c1 ci: remove separate futures build
  3597c3c38b21 ci: include `futures` in docs
  d7ea8af665ff Fix tests on nightly (by avoiding UB, even)
  27ac97df879c ci: fix futures job maybe
  48de8595821e conf: remove a problematic function that was fixed in gir
  43c779189022 ci: add job for futures feature
  8d9aa7a85734 Enable futures feature
  2c0730209771 Update to new glib-rs versions
  5b6991af9ce8 Bump gir version
  b1a41e90bd33 Add notes about releases and tags
  1a301faa59be Bump version
  6a86340e9fc6 conf: add some more loose types
  7f8f32e4d03d conf: clean up comments a bit
  9e8192fec87c lib: add some glib types to generate more functions
  b44202fa9021 ci: add Makefile target to run gir -m not_bound
  b51b81dfddf4 lib: generate some additional classes
  01ae586f9598 lib: brush up some docs
  87b34be855b0 lib: catch unwinds in RepoCheckoutFilter
  315cd5394e67 lib: fix clippy
  d74c0fc04f98 lib: add docs and safety notes to RepoCheckoutFilter
  e39f8d7461c6 lib: add repo_checkout_filter function for better ergonomics
  903bd86e5268 lib: clean up types for RepoCheckoutFilter
  94b524b21f5e lib: split out RepoCheckoutFilter
  6776c819f101 tests: reorganise repo tests so they have fewer feature flags
  eb602d8546e1 tests: fix imports with default features
  19fdf706d5ca lib: implement CheckoutOptions::filter (hackishly)
  a521c838f519 ci: run clippy with default features as well
  54be07c6b90a tests: fix checkout_at tests
  4bab406a1a7a lib: satisfy clippy
  aef78f3985b9 lib: handle ino cache and sepolicy options
  eec4a2287d0b lib: RepoCheckoutAtOptions
  16718eb1552d Revert "Simplify docs build"
  1c7df84de182 Simplify docs build
  a7079e543fde Consolidate some pipeline stages
  b5fba187ffc9 Fix clippy issues
  dfcaf3eede62 Ignore clippy issues in generated code
  4cfda21ff951 Disallow clippy warnings
  feca7ddae6cf Oh wait, check doesn't actually do anything useful for us...
  8982c1914ee9 Force clippy to run even after check
  0c076163424c ci: use sccache
  87bf13574f3c Update version in README and add some notes on version bumps
  d12b506f8666 Bump version
  82ccc6065b1d Remove extraneous generated files
  06489f492696 Check that we haven't included extraneous generated files
  3483927f4052 Add copies of the various LGPL versions and notes about their relevance
  faef3562b8c2 collection_ref: add accessors for collection_id and ref_name
  91dc91661507 Document ObjectName
  2892430fa733 Ignore deprecated (and reportedly unsafe) method
  7ac82e5d1b90 Clean up some comments
  1e744239cbe6 Document Repo::new_for_path
  8fc327296e27 Improve doc blurb a bit
  1f2072166453 We don't need to patch the hand-written Repo symbols any more
  0fe1b0d951bd Add ignored test for empty FileInfo crash
  80de2aa2eaa3 Add test for checkout_tree
  1068d4f619fc Adjust CI check flags
  fa1bf6cbb8e8 Add more checks to the pipeline
  66cf9b288fcf Move extra Repo methods to plain impl as well
  493ba2e2f5e6 Update gir and regenerate
  0b85551588d1 Change gir targets
  40a7eecbf6e3 Fix docs publish
  ebbf285f28d1 Build docs more smartly
  15c8e6376d97 Add html_root_url
  b24197c2517a Don't fmt and check for now
  a3bcc237f538 Fix gitlab-ci
  2c7761047a76 Add fmt check, check, clippy
  f1a7507ee4e3 Also cache docs
  b218a5b6c502 Try caching
  0d33525815ea Suppress unused import warnings in generated code
  c7f158ad94c2 Disable CollectionRef tests on too-old features
  f5375f36b68b Don't separately build ostree-sys with nightly
  f5b4d7edcda3 Add other interesting pipeline stages
  0e23ed73e6a9 Don't allow nightly runs to fail
  c89270969ce1 Refactor tests and add test for traverse_commit
  ff3e268a3b88 Add some more unsorted types
  ab3e2c908e1c Switch ObjectName to GString
  475cd53c43de Add docs for methods that were moved to RepoExtManual
  f7963d86ad6b Fix
  2452dee27986 Clarify reasons for async exclude
  3decba546e8e Switch to generated CollectionRef
  60960612a316 Reorganise test code
  bf488d226665 Build with older libostree version for now
  61e205b5c3d3 Regenerate and update to new gir and glib-rs version
  df2d708f3068 Add missing version features
  bc0a8a04d361 sys: regenerate with new gir
  0f0ccb898d35 Update gir version
  c41cc620bbd8 Add version features
  8d19e94d6ae0 sys: regenerate with external version file
  82b61d0bae00 Add more types
  31eccf004ee4 Pin rustdoc-stripper version
  7b9bdf143cf8 Add some explanatory comments to gir config
  0bf8f3f52e82 Fix some issues with RepoFile
  26b5729c536e Add some tests for Repo
  cfcc97d5f77d Fix a few more missing methods
  04bd81be0fc4 Sanity test for ObjectName
  c3f120e8b6ce Add some sanity tests for CollectionRef
  8561eaaa8c2e Fix return type for CollectionRef::new
  8bfefa2b146e Build CollectionRef manually
  13c61a9329ea Fix features in Repo
  8afba7f5ab8a Add explanatory comments to ostree-sys.toml
  7871c600e0ea Test sys with v2018_9 until I can get 2019.2 for CI
  3fa9378a5e48 Update OSTree gir and regenerate
  91df5067a5e6 Update base gir files
  c6b0ebaf6e73 Add note about crate rename
  999d239c5907 Rename libostree to ostree
  77697b10f741 Rename libostree to ostree
  f4cf9d337721 Rename libostree-sys to ostree-sys
  e62ca73e825e Remove unnecessary gir/* aliases
  57645e91cb13 Remove version constants to fix build with different libostree versions
  16709027e1f9 Pin gir version
  5028561b18fb Repo rename
  e817635e8b70 sys: regenerate
  6b082eb2c409 Test with all features
  7d9c44ec4a57 Remove some methods that are not generated correctly
  20dca2630cee Move libostree-sys/ to sys/
  7c29936b840d Reorganise gitlab-ci.yml a bit
  98fbf253a701 Get rid of pre-package workaround
  59247025954e Update gitlab-ci.yml
  382aa27f440f Exclude unnecessary files correctly
  260c273286a6 Move installed tools into target/tools
  ced47cbb26df Move main crate into repo root
  a16ea65e0f1f Add features
  a5f2ae9a59a8 Add CMake to build gir
  bc2d9621e2ea Update readme
  30517deaead2 Remove lgpl-docs feature
  2b76bf8330a9 Add back API docs merge to Makefile
  587c6d4778ed --allow-dirty to deal with the extra files we copy in
  a404058eaf90 Fix -sys pre-package
  3c93c8499123 Add badge-with-link to docs
  84b8a35791b0 Update readme a lot
  67c318164b7f Add LICENSE to packages
  128a31f601f9 Bump versions
  233776a39dd8 Add Gitlab badge
  b69a39fab849 Update docs back to self-hosted
  d8ce189e9124 Move readme to repo root and copy it to the code prior to packaging
  3bc590d151b4 Add a symlink to the package readme in the repo root
  797728f88d57 Keep only one license file in the repo root
  b6813b0d919e Fix docs build hopefully
  cc95bfafda07 Always build docs
  8bf24cf34b1c Build API docs with LGPL parts
  82cbd02fea54 Remove docs targets
  6d756149a3e2 libostree: include API docs at build time using a feature flag
  39c820a54997 libostree-sys: remove license file
  9cca19eeb2d8 Add libostree release task
  87db0d1a6ae0 Bump -sys version
  19592ec6874d Strip the libostree docs
  ee897f09c5e0 Disable libostree docs
  dfab03486bec libostree: add metadata, readme, and license file
  eee83b38b492 libostree-sys: switch to docs.rs and add license file
  423caf33d2e2 Try setting up docs.rs capable build
  250a2e8a4f7b Bump -sys version
  25ac189bf377 Remove release builds
  38c477b5ec10 Only publish for master & set docs urls
  0cc98e700b5d Always build docs
  93d3a55a1c68 Add docs build
  1d571d79104a Fix Gitlab URL & remove readme
  9d51535f1af0 Fix libostree-sys publish step
  58c4842d109d Add libostree-sys publish step
  4c6d1dce4dc4 Add some metadata to libostree-sys
  269b63d8a0b1 Remove package stage for now
  fea0a7d807a7 Do release build and simply job names
  527e1b4b4dd8 Install libostree for everything, actually
  3259d4ad7741 Also install libostree-dev for libostree builds
  db7431b28bcf Use libostree from backports
  79419df6e387 Install libostree in CI
  c1d58f180619 Add CI config
  e9ec6462bcd0 Add workspace Cargo.toml
  8c5094d6fb9d Un-bump versions
  361bf102dc1b Exclude generated code from clippy
  80fd5823b00f Explicitly implement PartialEq for ObjectName to satisfy clippy
  88b4a12c32cf Run cargo fmt on the custom code
  fdac646f7e44 Add include to make libostree-sys tests work
  58532178bf8f Regenerate libostree-sys
  38a886ffc6fa Ignore internal structs in libostree-sys
  42423b96e5c5 Generate docs for RepoExtManual
  a32f2092856f Copy autodocs to hand-implemented methods in RepoExtManual
  f8c4c83c9cca Add docs to generated files
  4dda00c7418a repo: newlines
  f77fc78ecf3f Regenerate libostree
  868973325a41 Regenerate libostree-sys
  9394222cc136 Add Makefile
  6d25a0374a7c Remove sample
  7a08fe0940af Add simple repo roundtrip test
  dff1cf631b3a repo: implement list_refs and list_refs_ext
  ae9413343d5d Add RepoListRefsExtFlags
  fa2b155f7d4a object_name: extend ObjectName
  436459844975 repo: remove now-incorrect comment
  f26e0013a57d repo: change custom new method to std::path::Path-alike
  fa615fb1bbad Add ObjectName wrapper to solve hashing issues
  ad1111956357 sample: try to extract a file from the repo
  1cfca1582f77 Ignore Cargo.lock in libs
  116f0dea8686 Try implementing traverse_commit by hand
  5e8753b369a6 Generate functions and constants
  306046f5721b Integrate docs into source
  19fef7159215 Add as much of Repo as easily possible
  62f8310dea58 Add additional 'new' method to Repo
  449899b16f8c Add a test/sample program
  1ea604a53149 Add a prelude module for star imports
  4c51e595f07c Add some basic types and regenerate
  45eab127a6c2 Generate
  8950188bce0c Add build files for libostree
  0c45c2ec822a Start describing libostree
  5c2d700d519c Add manual definition for stat
  c47eb7700119 Update names and dependencies
  7e2c82b1b1e3 Add external libraries and regenerate
  03abeebb89ed Add initial gir output
  804b1107b59f Add config file and gir files
  83956daeeeff ci/github: add a job for --without-libsystemd
  4b7fc4f1e90b lib/ostree-sysroot-deploy: add a missing include for stdint.h
  3583143cf01e configure: post-release version bump
  0554beb4c2b1 Release 2022.3
  71304e854cdb repo: Correctly initialize refcount of temporary transaction
  540e60c3e3ac repo: Factor out _ostree_repo_auto_transaction_new()
  d3d3e4ea1394 Add an `ostree-boot-complete.service` to propagate staging failures
  b070e0f54a52 Update docs/ima.md
  614d30acf335 docs: Add new IMA document
  b92dbc49f073 ci: Mask zincati for synthetic update
  4fd0d6b4c156 fetcher/curl: Consistently check return value `curl_easy_setopt`
  7e83726faab0 tests: move fixture to fix installed tests
  9b6a8171c5a6 docs: Publish man pages
  8032e89d33f7 man: Create an HTML index
  d5061dcf82f6 man: Use custom XSL stylesheet for HTML output
  61deb167daa1 man: Allow building HTML man pages
  f396873d3687 man: Remove unnecessary nbsp's from ostree man page
  2346d5f4d581 libarchive: Handle `archive_entry_symlink()` returning NULL
  c58a4fe661d9 deploy: Be a bit more verbose about SELinux bits
  edb4f3893474 deploy: Try to rebuild policy in new deployment if needed
  1898019face4 tests/test-cli-extensions: Fix with single-binary coreutils
  afdc84b97bb6 Update to sh-inline 0.2
  e6f92f76fad0 ci: Update docs workflow to use fcos-buildroot
  089b82109894 ci: Disable Ubuntu LTS
  aca9e8e6a73c glib: bump glib requirement to 2.66 and port to GUri
  75ae283f23e7 Update to rand 0.8
  fba7efb6da60 Update to ostree-ext 0.6
  34d1bcc68ab9 Update to nix 0.23
  b6d1119f9120 tests: Stop using inventory crate
  0d020a7145da tmpfiles: Create `/run/ostree`
  039d86c63be7 README.md: update ostree-rs language binding link
  faa8ed547b09 Add Fedora Kinoite link to index.md also.
  8cc8e687683f ostree-repo-pull: Take correct out path on error
  92ca2c7794af test-prune: Read to the end of cut(1) output
  a9a0110f440d s390x-se-luks-gencpio: Use interoperable path for bash
  084f8913f023 s390x-se-luks-gencpio: Fix shebang syntax
  ca0bb7595445 apidoc: add missing page includes
  4c0f9e094902 configure: post-release version bump

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---
 ...0x-Avoid-bringing-in-bash-dependency.patch | 27 +++++++++++++++++++
 .../{ostree_2022.2.bb => ostree_2022.5.bb}    | 17 ++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)
 create mode 100644 meta-oe/recipes-extended/ostree/ostree/0001-s390x-Avoid-bringing-in-bash-dependency.patch
 rename meta-oe/recipes-extended/ostree/{ostree_2022.2.bb => ostree_2022.5.bb} (92%)

diff --git a/meta-oe/recipes-extended/ostree/ostree/0001-s390x-Avoid-bringing-in-bash-dependency.patch b/meta-oe/recipes-extended/ostree/ostree/0001-s390x-Avoid-bringing-in-bash-dependency.patch
new file mode 100644
index 000000000000..23fd236ea803
--- /dev/null
+++ b/meta-oe/recipes-extended/ostree/ostree/0001-s390x-Avoid-bringing-in-bash-dependency.patch
@@ -0,0 +1,27 @@
+From a632eee5a2196a335be70f5880f1ed5916e86777 Mon Sep 17 00:00:00 2001
+From: Alex Kiernan <alex.kiernan@gmail.com>
+Date: Sun, 31 Jul 2022 12:08:51 +0100
+Subject: [PATCH] s390x: Avoid bringing in bash dependency
+
+bash is GPLv3 licensed and there's nothing in this script which really
+needs it.
+
+Upstream-Status: Submitted [https://github.com/ostreedev/ostree/pull/2682]
+Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
+---
+ src/libostree/s390x-se-luks-gencpio | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/libostree/s390x-se-luks-gencpio b/src/libostree/s390x-se-luks-gencpio
+index e821e2fecd69..d55574be16e2 100755
+--- a/src/libostree/s390x-se-luks-gencpio
++++ b/src/libostree/s390x-se-luks-gencpio
+@@ -1,6 +1,6 @@
+-#!/bin/bash
++#!/bin/sh
+ # This script creates new initramdisk with LUKS config within
+-set -euo pipefail
++set -eu
+ 
+ old_initrd=$1
+ new_initrd=$2
diff --git a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
similarity index 92%
rename from meta-oe/recipes-extended/ostree/ostree_2022.2.bb
rename to meta-oe/recipes-extended/ostree/ostree_2022.5.bb
index 50d0548cc73e..fb0eb746f9c5 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2022.2.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2022.5.bb
@@ -17,11 +17,11 @@ DEPENDS = " \
     bison-native \
 "
 
-SRC_URI = " \
-    gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
-    file://run-ptest \
-"
-SRCREV = "fbc6d21c2f71099fbab44cbdd74222b91f61c667"
+SRC_URI = "gitsm://github.com/ostreedev/ostree;branch=main;protocol=https \
+           file://run-ptest \
+           file://0001-s390x-Avoid-bringing-in-bash-dependency.patch \
+           "
+SRCREV = "15740d042c9c5258a1c082b5e228cf6f115edbb0"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+)"
 
@@ -67,16 +67,17 @@ PACKAGECONFIG[avahi] = "--with-avahi, --without-avahi, avahi"
 PACKAGECONFIG[builtin-grub2-mkconfig] = "--with-builtin-grub2-mkconfig, --without-builtin-grub2-mkconfig"
 PACKAGECONFIG[curl] = "--with-curl, --without-curl, curl"
 PACKAGECONFIG[dracut] = "--with-dracut, --without-dracut"
-PACKAGECONFIG[glib] = "--with-crypto=glib"
+PACKAGECONFIG[ed25519-libsodium] = "--with-ed25519-libsodium, --without-ed25519-libsodium, libsodium"
 PACKAGECONFIG[gjs] = "ac_cv_path_GJS=${bindir}/gjs"
-PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls"
+PACKAGECONFIG[glib] = "--with-crypto=glib, , , , , gnutls openssl"
+PACKAGECONFIG[gnutls] = "--with-crypto=gnutls, , gnutls, , , glib openssl"
 PACKAGECONFIG[gpgme] = "--with-gpgme, --without-gpgme, gpgme"
 PACKAGECONFIG[libarchive] = "--with-libarchive, --without-libarchive, libarchive"
 PACKAGECONFIG[libmount] = "--with-libmount, --without-libmount, util-linux"
 PACKAGECONFIG[manpages] = "--enable-man, --disable-man, libxslt-native docbook-xsl-stylesheets-native"
 PACKAGECONFIG[mkinitcpio] = "--with-mkinitcpio, --without-mkinitcpio"
 PACKAGECONFIG[no-http2] = "--disable-http2, --enable-http2"
-PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl"
+PACKAGECONFIG[openssl] = "--with-crypto=openssl, , openssl, , , glib gnutls"
 PACKAGECONFIG[rofiles-fuse] = "--enable-rofiles-fuse, --disable-rofiles-fuse, fuse"
 PACKAGECONFIG[selinux] = "--with-selinux, --without-selinux, libselinux"
 PACKAGECONFIG[smack] = "--with-smack, --without-smack, smack"
-- 
2.35.1


