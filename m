Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 321F0C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 09:14:15 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.3012.1698398050742334435
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 02:14:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X1Ps7c9S;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4083dbc43cfso12652045e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698398049; x=1699002849; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=66A8a2L9jWBt2d0/2ZNl4Ku5RzScau7N29IgcZkQqF4=;
        b=X1Ps7c9SDy6Rvw18DjnZocdtsLIMHvVvm+knJ3hf4sMUN/XjY1yDpTis6KfpciSis5
         n7532Ds0k3CueYu65/6lFyndiCEySyfuBMhfNkC6FDCS9GM1wUZP6Pa91ueEaOqxwA+8
         ofnW5IPnXZk+Xi7YqMjqlhTG0wp8au58BVWt6lOVni5zCnUIXuERI9Ion3E7Rt4N+Anz
         9Ccc2W1iy5R2pvMFMz3uHdIKF49BL5AV5y7a6ICHP1KMaZX7PTm8ovdVS1ORwB2ugIyh
         jvmhq5aSoUVY1zUlLdzVD47BnPiygNMboEvmIaPVPjPv0a410d6pHz+kgg8jeRtg5SjZ
         G8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698398049; x=1699002849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=66A8a2L9jWBt2d0/2ZNl4Ku5RzScau7N29IgcZkQqF4=;
        b=Az+rIVBOZ7G0DK/SgvMT3uChZ/Qzg24UBjEyVt68lAnAvWL0uoQZKTYq2j1oxG/ahf
         yfhquOVsdDOjZikO62znjWhrq/0bruA8SP3/927r2cQp9lhxkUFb/DulOSPUjAo31wTZ
         ljFDoZURjq4VSSYpjhm/gkot9N1maYMQqOr7TMCrn00IbNJpcHn4qzkdrNgG9cnDKwok
         saPpoyq9C/j72RjJX4MYGjz574Q/7HPtd6LpnbB/zqlaEB4nlVow2Abt/Sk055+bsB1e
         Sl3gOWnY1aLkz5gO/LGX7Rbq8jXiLX9WivsEi7usWseQCEUmEl6iOpoEI78/lrCLsVal
         nSnQ==
X-Gm-Message-State: AOJu0YxmKuGBS5Us13Nv3vUc7Ny8INodpDYoDp2kmxOtBrz//azGL5Jq
	JEoRzCbruJmjyTndr1Dbl1GUFDfC4Pm7dQ==
X-Google-Smtp-Source: AGHT+IG3dEbiHyEiZ1DQao1p249nEi+rOPv9uZi5E9Jvn6JDpxl/R2vUtwaZIfLYU7YMe672MeDBPQ==
X-Received: by 2002:a05:600c:3b9d:b0:407:5b54:bb10 with SMTP id n29-20020a05600c3b9d00b004075b54bb10mr1823043wms.8.1698398048626;
        Fri, 27 Oct 2023 02:14:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:8a0:fa50:db00:862f:283e:2d66:4a27])
        by smtp.gmail.com with ESMTPSA id j5-20020a5d6185000000b0032da40fd7bdsm1332855wru.24.2023.10.27.02.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 02:14:08 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: openembedded-devel@lists.openembedded.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [oe][meta-oe][PATCH 1/4] ostree: Upgrade 2023.5 -> 2023.6
Date: Fri, 27 Oct 2023 10:13:50 +0100
Message-ID: <20231027091353.1700511-1-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 09:14:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105771

dab8051f Release 2023.6
bd91fda6 Merge pull request #3010 from cgwalters/more-composefs-fixes
3648c5ae build-sys: Really fix composefs check
db3b286d Merge pull request #3009 from cgwalters/c9s-ci
bcd4d026 Merge pull request #3007 from cgwalters/optin-new-bootloader-naming
33ef4ae6 build-sys: Look for both linux/mount.h and sys/mount.h
bd8339bd ci: Add c9s build
cbe36c3a Merge pull request #3008 from ostreedev/maybe_ostree
29423a89 prepare-root: If composefs is configured as "maybe" don't fail
02d41907 deploy: Add bootloader-naming-2 opt-init
fb06d59e Merge pull request #3003 from cgwalters/prepare-root-oscore-and-units
20b8cb17 Move prepare-root karg helpers into otcore, add unit tests
44519492 Merge pull request #2997 from cgwalters/test-cleanups-1
37f247da Merge pull request #2999 from cgwalters/add-oscore-units
aa8ad204 Merge pull request #3001 from cgwalters/misc-c99-style-4
75a43deb cmd/grub2-generate: Port to C99 style
767ca134 cmd/init: Port to C99 style
e3ef72ea Merge pull request #3000 from cgwalters/test-inst-update
6eeb8b56 Merge pull request #2995 from ostreedev/dependabot/submodules/composefs-1aed878
e751dd9a Merge pull request #2998 from cgwalters/disable-composefs-too-old
facb9a1a tests/inst: Update to latest ostree-ext
7c82340d Merge pull request #2975 from ostreedev/androidboot-single-slot-mode
e3f0c4d4 tests: Add otcore unit tests
90e54619 build-sys: Disable composefs on too-old Linux headers
6e9e50d8 prepare-root: Changes made to find_proc_cmdline_key
650a0537 prepare-root: On a non-A/B androidboot system, boot system slot a
16b97d8a Merge pull request #2996 from cgwalters/misc-c99-style-3
578c87e7 tests/destructive: Port more to xshell
8f302f2a cli/set-origin: Port to C99 style
69d7d837 build(deps): bump composefs from `a6e827d` to `1aed878`
ee1e585e Merge pull request #2993 from cgwalters/misc-c99-style-2
22b47781 checkout: Port to C99 style
f7786e75 Merge pull request #2990 from cgwalters/init-is-stateroot
27266f90 lzma: Port to C99 style
722fc2d0 Merge pull request #2991 from cgwalters/misc-c99-style
9f39f78e remote-add: Port to c99 style
9036c96a admin: Port to c99 style
f4e56b91 admin-deploy: Add `--stateroot` as alias for `--os`
9d5ccfef Add `ostree admin stateroot-init` as alias for `os-init`
9ac938c4 Merge pull request #2989 from cgwalters/lock-timeout-longer
f4b42049 Merge pull request #2973 from ostreedev/dependabot/submodules/composefs-a6e827d
e88ec69e repo: Bump lock timeout to 5 minutes
55121cc4 Merge pull request #2988 from cgwalters/prepare-root-binding-key
d648eea6 Merge pull request #2987 from cgwalters/prefix-stage-deploy
94cb37cb prepare-root: Minor clarifications
25a458b9 deploy: Add some error prefixing
8712a467 Merge pull request #2985 from cgwalters/cleanup-proc-cmdline
083bad8c Merge pull request #2984 from alexlarsson/prepare-root-no-raw-key
28aed49d switchroot,generator: Only read /proc/cmdline once
0a79b3b1 prepare-root: Only support base64 formated public key files
c94388f3 Merge pull request #2980 from cgwalters/prepare-root-minor
871d32a5 prepare-root: Use ptrarray, not linked list
678bfcd9 prepare-root: Check for empty string, not strlen > 0
bea5d897 prepare-root: Use declare-and-initialize
3620d3c7 Merge pull request #2979 from cgwalters/enabled-discussions
d324f684 Merge pull request #2974 from alexlarsson/composefs-config-file
f1c1f819 README.md: Drop dead mailing list, link to GH discussions
81fa2141 Read composefs configuration from initrd instead of commandline
2cc6b531 Merge pull request #2966 from cgwalters/ostree-admin-edit
b108e24c build(deps): bump composefs from `1704f82` to `a6e827d`
c57c0056 Merge pull request #2958 from cgwalters/deploy-loosen-etc-usretc
7f70614a Merge pull request #2969 from cgwalters/fix-sync-pthreads
a31f7798 Merge pull request #2967 from cgwalters/drop-trivial-httpd-entrypoint
402e0428 deploy: Fix mutex locking for global sync timeout
60b46556 More fully drop `trivial-httpd` entrypoint
3cd3251a Add `admin set-default`
09160c1a Merge pull request #2962 from cgwalters/os-init-remount
ac42e29d os-init: Create a mount namespace
113e575e Merge pull request #2963 from cgwalters/more-gfileinfo-fix
15cb0b47 composefs: Only call `_get_symlink_target()` on symlinks
f44909f8 Merge pull request #2960 from ostreedev/dependabot/submodules/libglnx-c02eb59
a16a14a6 build(deps): bump libglnx from `07e3e49` to `c02eb59`
fd968d59 Merge pull request #2957 from cgwalters/transaction-test-suppress-global-sync
0406fd39 deploy: Support an empty `/etc` and populated `/usr/etc`
6470429b tests/destructive: Turn off global sync()
a2663e80 Merge pull request #2956 from cgwalters/finalize-more-verbose
3d881fee deploy: Be way more verbose about what we're doing
1aed5d7c Merge pull request #2954 from cgwalters/harden-gvariant-get-data
5b372596 checksum-utils: Add an assertion that `buf != NULL`
0392b546 core, switchroot: Harden a bit against `g_variant_get_data() == NULL`
d7d66121 Merge pull request #2953 from samcday/patch-1
66e42553 Merge pull request #2930 from cgwalters/prepare-root-config3
b5397887 docs: update boot loader spec link
af52a88d Merge pull request #2952 from cgwalters/silence-variant-lookup
13e7ae90 tree-wide: Consistently `(void)g_variant_lookup()`
34656260 prepare-root: Don't parse target root when composefs enabled
83d37d6d prepare-root: Default sysroot.readonly=true if composefs
22b8e4f9 prepare-root: Introduce `ostree/prepare-root.conf`
250c40a6 Merge pull request #2948 from cgwalters/composefs-more-cleanups
3f594b04 Merge pull request #2951 from cgwalters/errprefix-sysroot
5e2eedee Merge pull request #2949 from cgwalters/kargs-cleanup
cf525ee6 repo: Clarify when we fail to parse a remote
70d790ab sysroot: Add a bit more error prefixing
82da0e16 Merge pull request #2950 from cgwalters/generator-cleanup
d7fe9e54 kernel-args: Move private functions out of public header
303e7eb2 src/generator: Move all logic into libostree-1.so
ec1109c7 generator: Stop creating `/run/ostree-booted`
64afbcde composefs: Use lowerdir in /run
4c0e5b1e Merge pull request #2942 from ostreedev/android-bootloader-parsing
a035c2e2 Merge pull request #2946 from cgwalters/add-inode-fix-feature
8ce7bbe1 Add an always-on `inode64` feature
c89baaed bootloader: fold all Android Bootloader specific logic into prepare-root
55936165 Merge pull request #2943 from cgwalters/mount-cleanup
253e7758 Merge pull request #2944 from cgwalters/prepare-root-more-cleanup
e61226a8 prepare-root: Drop more dead code
41cda3bd prepare-root: Drop code mounting `/proc`
b258375f Merge pull request #2938 from cgwalters/dedup-ostree-parsing
b548ff74 Merge pull request #2939 from cgwalters/ed25519-cleanups
6966979c generator: Deduplicate ostree= karg parsing
fc303da6 sign-ed25519: Don't set sk unless we've validated it
3a18a557 sign-ed25519: Add some comments for data structure
fb40e559 sign-ed25519: More verbose errors for invalid length
1a2fac37 tests: Remove dead references to "SEED"
1c0fd7d4 Merge pull request #2937 from ericcurtin/ostree2androidboot.slot_suffix
355cd727 Remove steal_pointer and steal_pointer_impl as we link in glib now
a6f0a571 android-boot: Remove dependency on ostree= karg, use androidboot.slot_suffix=
27a9fe30 Merge pull request #2936 from cgwalters/sign-from-file
7bbe13ca Merge pull request #2931 from cgwalters/prepare-root-man
de81a7e7 Merge pull request #2929 from cgwalters/prepare-root-drop-pivot
8302a8ad Merge pull request #2927 from cgwalters/sysroot-errprefix-bootlinks
845d68d1 Merge pull request #2935 from cgwalters/prepare-root-config4
82d93491 commit: Add `--sign-from-file`
d4ca834b prepare-root: Refactor composefs config handling
18d6f597 Merge pull request #2934 from cgwalters/enable-composefs-default
592351d1 build-sys: Enable composefs at *build time* by default
3d29f89c Merge pull request #2928 from cgwalters/prepare-root-config
c1ac6bc3 Merge pull request #2932 from cgwalters/aboot-fix-nullderef
c078e8be mount: Fix gcc -fanalyzer warning for parsing androidboot.slot_suffix
c4f1d18a Merge pull request #2920 from ostreedev/dependabot/submodules/composefs-1704f82
1e4cb30c man: Add ostree-prepare-root
0eda15ce Use /run/ostree-booted metadata for sysroot-ro state passing
79806a68 prepare-root: Drop dead `pivot_root` code
b8d66964 remount: Use new metadata in `/run/ostree-booted` for composefs
77acad24 remount: Don't overwrite /run/ostree-booted
93699cc5 prepare-root: Add metadata for composefs to `/run/ostree-booted`
bafb5512 prepare-root: Use constant for ed25519 signature
6cdc5ce5 Merge pull request #2926 from cgwalters/otcore-cfs-constants
6769d66d sysroot: Add some error prefixing for bootversion
18cc4472 prepare-root: Drop unused verity flag querying
2b738a99 prepare-root: Use otutil and g_print
1b7b4fbd Add an internal constant for the composefs image name
c0c2c9bd Merge pull request #2924 from cgwalters/drop-syntax-check
65912106 build: Drop `make syntax-check`
57fe33f0 Merge pull request #2921 from alexlarsson/composefs-sign-v2
c29f4193 ostree-prepare-root: Validate ed25519 signatures when requested
b8ff2109 Factor out a libotcore
265cf7d7 build-sys: Add libsodium to OT_DEP_CRYPTO
a6d9c714 Merge pull request #2922 from alexlarsson/openssl-ed25519
744967a6 libotutil: Link to crypto libs
474c2b10 CI: Enable --with-crypto=openssl on debian testing to test openssl signatures
7b85adfb sign-ed25519: Implement sign and verify using openssl
501575c1 sign-ed25519: Drop some uses of libsodium
5b727751 Merge pull request #2923 from alexlarsson/fix-composefs-test
62e4f376 tests: Fix composefs test
eb011120 show: Add --print-hex
6056ec13 Merge pull request #2913 from cgwalters/tmpfile-not-on-revokefs
8a4a0c16 build(deps): bump composefs from `ac729b5` to `1704f82`
43fb2787 Merge pull request #2918 from ostreedev/dependabot/submodules/composefs-ac729b5
25120bd7 Merge pull request #2912 from cgwalters/itest-transactionality-debug
61720180 Merge pull request #1633 from cgwalters/pkglibexec-tests
ba9c9ded fetcher: Always open tmpfiles in repo (except on FUSE)
9104c54f Merge pull request #2905 from cgwalters/prepare-root-static-split
01be14e6 build(deps): bump composefs from `412cb5e` to `ac729b5`
0c36e814 Drop "ostree trivial-httpd" CLI, move to tests directory
8ad8a79c Merge pull request #2916 from cgwalters/release
b2cfee72 Merge pull request #2914 from cgwalters/doc-usergroups
5aadb6ec configure: post-release version bump
875915f6 prepare-root: Link to glib
d6799ecc Separate prepare-root static path
786e64ce docs: Update user and group section
8bba482b tests: Enable mtime test
0b519c25 tests: Drop unused alias
54c73155 tests/transactionality: Port a bit to xshell

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../ostree/{ostree_2023.5.bb => ostree_2023.6.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/ostree/{ostree_2023.5.bb => ostree_2023.6.bb} (98%)

diff --git a/meta-oe/recipes-extended/ostree/ostree_2023.5.bb b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
similarity index 98%
rename from meta-oe/recipes-extended/ostree/ostree_2023.5.bb
rename to meta-oe/recipes-extended/ostree/ostree_2023.6.bb
index bc465dd62..f567e6afe 100644
--- a/meta-oe/recipes-extended/ostree/ostree_2023.5.bb
+++ b/meta-oe/recipes-extended/ostree/ostree_2023.6.bb
@@ -22,7 +22,7 @@ GITHUB_BASE_URI = "https://github.com/ostreedev/ostree/releases"
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/libostree-${PV}.tar.xz \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "bc593afb31fe1ac3d50419f917fafe321a0a3561d7bb2ba498a83740fe3adb14"
+SRC_URI[sha256sum] = "b43c4a373799681989bae12b3a1b94f453068dece6540b8e05a23b834c1037e2"
 
 S = "${WORKDIR}/libostree-${PV}"
 
-- 
2.42.0


