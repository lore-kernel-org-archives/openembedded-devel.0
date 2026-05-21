Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17AA3CD5BAB
	for <webhook@archiver.kernel.org>; Thu, 21 May 2026 20:14:39 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3047.1779394473696442468
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 May 2026 13:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=gJVtnPWd;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82faf871346so5121019b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779394473; x=1779999273; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEy/D8KeAAsW0f61fjrDhWggm3ooMhgP82yzvafvrwk=;
        b=gJVtnPWdo6rIDC9EbRZJi7XXv4PtJMqXMWjWjaQ0ELmGz2anZaEEP+NMsKrw5rL2qz
         ZmZPEv+laYxko4dlCoXzk8dC2NqEgmPm8syq/Bw9o3JBzVZ3qWzjy1XqXj1cpUx1hDsX
         RSqODpC1iOSsejXSIXYctKKpLK2vEeZCFhJQeCARG9XFsl+Ina2nWb+3hd2XwKc2LSiG
         xxuQIuXM4+7F8VmqSgr5D+orBoCZBSV4gEZGXIDxqWalU7E/9/6pk65GDeYDqOONRYbU
         q4nasXrCD0S84v5SJPxvUIa6Wlejfav03Bi6/5R68wVdb+eyB0OaXW1MtLOs27HWJH5h
         3KOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779394473; x=1779999273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEy/D8KeAAsW0f61fjrDhWggm3ooMhgP82yzvafvrwk=;
        b=H4HAzxq20f9ihZLKCJXAKPKD4sPYpc3QKacpdRPSb2knwxl7rvmfDjxlhoa9UUMT0z
         taKMqVMoNKX3G/gXVJzGS57hlarxFMVXT9OxQK9TlJ75qQnZluyLdrmYKZFZYppN7ci0
         jupnSP/bXAS2GNmZ53ols0KHsPqbNRW0trhnOHnF9JZqdXHrzA/e5+IolzKAsCV98w7K
         RlyPB4ndhTaIUftkruWrPMTiMMQMR6FZ/Sd12GVVEKbaWXcTc1OZxBtYRjb6uMDqSDWR
         BWvmP/A7nTPFw5RXQGCLKfqh8QphWoErYAo7BysXrf1dMtAMkVOCosP/K+39Po5JW28s
         aC3g==
X-Gm-Message-State: AOJu0YzewM+gK3JhAwS21/oXU2vwTijIpbrFyVDxwCcLuGZVwjoevlVz
	BN7A+CO1b8KjQ19Z06D/ABf07LdKbgXLPnTyAZ11W9o1aNQxiauy/6uiByJIcRGr
X-Gm-Gg: Acq92OEgjtzB4VPmGlmZmDFuoO7yqYdYbKDuMSJH1w5Nmww7ZOwIL6SvQLUKqJD7V0P
	EZks1BpLqROMAmWFD7gJC9Pyowg2RD8CfY7Yn6TlKjMuJ3+lvrWQJemPMewCfnp6c4gIe8Z6fGL
	ATfKDKVH3yDOz3NDRJQPG4K9UZLKaNWcCiYBgtk9pw74XyRn6dZdDOCaP8JXWzt3+EuiFoUZfbq
	d0JAS91JGdwm/CaHbJ6b+iS2mhkQhy2Q6WRiWjNI84mShh4NXvtfD9RFsP6AVDMxFJmMZ4FhOnI
	1fZk8ApDncqy6D9BIkEXEpwokMswe8jFYALuHj9/ORbLtflK2pTUzrzquSwBdylukRpD+M3TMeu
	qG6HlXvQwWl4jV/ddmnOkzDBBD71YRJLwyfSxK1Ky18eFfiDBQF119mYc+gBXLazf9sxSBmHnmM
	b70FYs4kyum8BD3mTw3mGD/HXu0KWS2ylmXJloDnpwMUl4FU/iXtIW7oWbf5AyWv7O4kFCrSxra
	Prkay356GVFuGeXPev3guU=
X-Received: by 2002:a05:6a00:10c8:b0:83d:446c:498f with SMTP id d2e1a72fcca58-8415f5dd01bmr671534b3a.32.1779394472871;
        Thu, 21 May 2026 13:14:32 -0700 (PDT)
Received: from localhost.localdomain (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154e1fc86sm2829241b3a.44.2026.05.21.13.14.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 21 May 2026 13:14:32 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH 2/2] nodejs: upgrade 22.22.3 -> 24.16.0 (LTS)
Date: Thu, 21 May 2026 13:14:01 -0700
Message-ID: <20260521201400.63576-3-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260521201400.63576-1-tim.orling@konsulko.com>
References: <20260521201400.63576-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 May 2026 20:14:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127139

Add Node.js 24.16.0 [1] recipe based on 22.22.3. Patches reviewed against
the 24.15.0 source tree and rebased where needed:

- 0001: rebased for Makefile changes (common_node.gypi removed, line
  offsets shifted); merged with Disable-running-gyp-files patch since
  both modify the same Makefile hunk. Remove deps/simdutf/simdutf.gyp;
  no longer vendored here.
- 0005: rebased for v8.gyp libatomic condition change (clang condition
  folded upstream, ppc removed)

- v24.16.0 bumps bundled llhttp to 9.3.1 (LLHTTP_VERSION_MAJOR/MINOR/PATCH
  = 9/3/1 in deps/llhttp/include/llhttp.h).

Five patches dropped as no longer needed:
- build-remove-redundant-mXX-flags-for-V8: backport already merged
  upstream in Node.js 24
- ppc64-Do-not-use-mminimal-toc-with-clang: Node.js 24 common.gypi
  already gates -mminimal-toc behind clang==0
- fix-arm-Neon-intrinsics-types: the v24.16.0 source already uses
  vandq_u8/vorrq_u8 and vshrn_n_u16(vreinterpretq_u16_u8(mask), 4).
- detect-aarch64-Neon-correctly:  #ifdef __ARM_NEON__ →
  #if defined(__ARM_NEON__) || defined(__ARM_NEON) — already present
  at lines 13 and 2628.
- llhttp-fix-NEON-header-value-__builtin_ctzll-undefin: wanted the
  match_mask == 0 guard around __builtin_ctzll — already present.
  "This patch can be dropped when nodejs updates its bundled llhttp
  to >= 9.3.1.")

Remaining 9 patches renumbered sequentially 0001-0009. All verified to
apply cleanly against the v24.16.0 source tarball.

NOTE: The "current" release is v26.2.0 [1], but this is not yet an LTS
      release. Application stacks frequently lag new releases, so
      it makes sense to have support for the v24 LTS release.

[1] https://nodejs.org/en/blog/release/v24.16.0
[2] https://nodejs.org/en/blog/release/v26.2.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
All ptests pass on qemuarm64

 .../0001-Do-not-use-glob-in-deps.patch}       |  26 ++--
 .../0002-v8-don-t-override-ARM-CFLAGS.patch}  |   0
 .../0003-system-c-ares.patch}                 |   0
 ...liftoff-Correct-function-signatures.patch} |   0
 .../0005-libatomic.patch}                     |  31 ++--
 ...s-disable-io_uring-support-in-libuv.patch} |   0
 .../0007-positional-args.patch}               |   0
 .../0008-custom-env.patch}                    |   0
 .../0009-Using-native-binaries.patch}         |   0
 .../nodejs/{nodejs => nodejs-24}/run-ptest    |   0
 .../nodejs/0001-Do-not-use-glob-in-deps.patch |  22 ---
 ...ld-remove-redundant-mXX-flags-for-V8.patch | 133 ------------------
 ...4-Do-not-use-mminimal-toc-with-clang.patch |  25 ----
 .../{nodejs_22.22.3.bb => nodejs_24.16.0.bb}  |  34 ++---
 14 files changed, 39 insertions(+), 232 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch => nodejs-24/0001-Do-not-use-glob-in-deps.patch} (72%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch => nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/system-c-ares.patch => nodejs-24/0003-system-c-ares.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-liftoff-Correct-function-signatures.patch => nodejs-24/0004-liftoff-Correct-function-signatures.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/libatomic.patch => nodejs-24/0005-libatomic.patch} (76%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-deps-disable-io_uring-support-in-libuv.patch => nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-positional-args.patch => nodejs-24/0007-positional-args.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-custom-env.patch => nodejs-24/0008-custom-env.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs/0001-Using-native-binaries.patch => nodejs-24/0009-Using-native-binaries.patch} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs => nodejs-24}/run-ptest (100%)
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
 delete mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.22.3.bb => nodejs_24.16.0.bb} (84%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch
similarity index 72%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch
index f692eedd41..622d25bbd3 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Disable-running-gyp-files-for-bundled-deps.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0001-Do-not-use-glob-in-deps.patch
@@ -1,10 +1,13 @@
+// Revert the patch found here https://github.com/nodejs/node/commit/fe1dd26398e1887b96b2dc51ab59371ad4d6bc20?diff=unified&w=0
+// so that the dependencies are still explicitly enumerated.  That way we
+// can pick and choose which pieces to build and which to use existing system
+// packages for.
+
 From 689e098cbde130ecde523ae39df3567456271fda Mon Sep 17 00:00:00 2001
 From: Zuzana Svetlikova <zsvetlik@redhat.com>
 Date: Thu, 27 Apr 2017 14:25:42 +0200
 Subject: [PATCH] Disable running gyp on shared deps
 
-Upstream-Status: Inappropriate [embedded specific]
-
 Probably imported from:
 https://src.fedoraproject.org/rpms/nodejs/c/41af04f2a3c050fb44628e91ac65fd225b927acb?branch=22609d8c1bfeaa21fe0057645af20b3a2ccc7f53
 which is probably based on dont-run-gyp-files-for-bundled-deps.patch added in:
@@ -28,20 +31,17 @@ python prune_sources() {
         shutil.rmtree(d.getVar('S') + '/deps/zlib')
 }
 do_unpack[postfuncs] += "prune_sources"
----
- Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/Makefile b/Makefile
-index dba16e5e..da4faffc 100644
+Upstream-Status: Inappropriate [embedded specific]
+
 --- a/Makefile
 +++ b/Makefile
-@@ -173,7 +173,7 @@ with-code-cache test-code-cache:
+@@ -179,7 +179,7 @@ with-code-cache test-code-cache:
  	$(warning '$@' target is a noop)
- 
- out/Makefile: config.gypi common.gypi common_node.gypi node.gyp \
--	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
-+	deps/llhttp/llhttp.gyp \
- 	deps/simdutf/simdutf.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
+
+ out/Makefile: config.gypi common.gypi node.gyp \
+-	deps/*/*.gyp \
++	deps/llhttp/llhttp.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
  	tools/v8_gypfiles/toolchain.gypi \
  	tools/v8_gypfiles/features.gypi \
+ 	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0004-v8-don-t-override-ARM-CFLAGS.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0002-v8-don-t-override-ARM-CFLAGS.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0003-system-c-ares.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/system-c-ares.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0003-system-c-ares.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0004-liftoff-Correct-function-signatures.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-liftoff-Correct-function-signatures.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0004-liftoff-Correct-function-signatures.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0005-libatomic.patch
similarity index 76%
rename from meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0005-libatomic.patch
index 835c7018de..a61b28f2f8 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/libatomic.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs-24/0005-libatomic.patch
@@ -23,11 +23,9 @@ Added libatomic library explicitly to x86 targets.
 Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
 ---
  node.gyp                 | 13 ++++++++++++-
- tools/v8_gypfiles/v8.gyp | 15 ++++++++++++---
- 2 files changed, 24 insertions(+), 4 deletions(-)
+ tools/v8_gypfiles/v8.gyp | 29 ++++++++++++++++++++++++-----
+ 2 files changed, 36 insertions(+), 6 deletions(-)
 
-diff --git a/node.gyp b/node.gyp
-index b425f443..f296f35c 100644
 --- a/node.gyp
 +++ b/node.gyp
 @@ -503,7 +503,18 @@
@@ -50,37 +48,38 @@ index b425f443..f296f35c 100644
        }],
      ],
    },
-diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index b23263cf..dcabf4ca 100644
 --- a/tools/v8_gypfiles/v8.gyp
 +++ b/tools/v8_gypfiles/v8.gyp
-@@ -1348,9 +1348,18 @@
+@@ -1324,10 +1324,24 @@
          # Platforms that don't have Compare-And-Swap (CAS) support need to link atomic library
-         # to implement atomic memory access
-         ['v8_current_cpu in ["mips64", "mips64el", "ppc", "arm", "riscv64", "loong64"]', {
+         # to implement atomic memory access.
+         # Clang needs it for some atomic operations (https://clang.llvm.org/docs/Toolchain.html#atomics-library).
+-        ['(OS=="linux" and clang==1) or (v8_current_cpu in ["mips64", "mips64el", "arm", "riscv64", "loong64"])', {
 -          'link_settings': {
 -            'libraries': ['-latomic', ],
 -          },
++        ['(OS=="linux" and clang==1) or \
++          (v8_current_cpu in ["mips64", "mips64el", "arm", "riscv64", "loong64"])', {
 +          'target_conditions': [
 +             ['_toolset=="host"', {
 +               'conditions': [
 +                 ['"<!(echo $HOST_AND_TARGET_SAME_WIDTH)"=="0"', {
-+                   'libraries': ['-latomic'],
++                   'link_settings': {
++                     'libraries': ['-latomic'],
++                   },
 +                 }],
 +               ],
 +             }],
 +             ['_toolset=="target"', {
-+               'libraries': ['-latomic', ],
++               'link_settings': {
++                 'libraries': ['-latomic', ],
++               },
 +             }],
 +           ],
          }],
        ],
      },  # v8_base_without_compiler
-diff --git a/tools/v8_gypfiles/v8.gyp b/tools/v8_gypfiles/v8.gyp
-index cb82d4f15bc..65cb123b7bf 100644
---- a/tools/v8_gypfiles/v8.gyp
-+++ b/tools/v8_gypfiles/v8.gyp
-@@ -1820,6 +1820,13 @@
+@@ -1793,6 +1805,13 @@
          ['enable_lto=="true"', {
            'ldflags': [ '-fno-lto' ],
          }],
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0006-deps-disable-io_uring-support-in-libuv.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-positional-args.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0007-positional-args.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0008-custom-env.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-custom-env.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0008-custom-env.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch b/meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/0001-Using-native-binaries.patch
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/0009-Using-native-binaries.patch
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/run-ptest b/meta-oe/recipes-devtools/nodejs/nodejs-24/run-ptest
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs/run-ptest
rename to meta-oe/recipes-devtools/nodejs/nodejs-24/run-ptest
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
deleted file mode 100644
index 551869523e..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-// Revert the patch found here https://github.com/nodejs/node/commit/fe1dd26398e1887b96b2dc51ab59371ad4d6bc20?diff=unified&w=0
-// so that the dependencies are still explicitly enumerated.  That way we
-// can pick and choose which pieces to build and which to use existing system
-// packages for.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-
---- a/Makefile	2025-01-11 14:37:29.059536707 -0500
-+++ b/Makefile	2025-01-11 14:39:52.419867046 -0500
-@@ -171,7 +171,8 @@
- 	$(warning '$@' target is a noop)
- 
- out/Makefile: config.gypi common.gypi common_node.gypi node.gyp \
--	deps/*/*.gyp \
-+	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
-+	deps/simdutf/simdutf.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
- 	tools/v8_gypfiles/toolchain.gypi \
- 	tools/v8_gypfiles/features.gypi \
- 	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
-
-
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
deleted file mode 100644
index b47aa564cf..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
+++ /dev/null
@@ -1,133 +0,0 @@
-From 403264c02edc2689671dbefaf032e3acb4fb713d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Micha=C3=ABl=20Zasso?= <targos@protonmail.com>
-Date: Sat, 19 Apr 2025 12:22:10 +0200
-Subject: [PATCH] build: remove redundant `-mXX` flags for V8
-
-They are already set by `common.gypi`.
-
-
-Needed to build on aarch64 build hosts with clang compiler
-Drop it when upgrading to 0.24.x or newer.
-
-Upstream-Status: Backport [https://github.com/nodejs/node/commit/403264c02edc2689671dbefaf032e3acb4fb713d]
-
-PR-URL: https://github.com/nodejs/node/pull/57907
-Reviewed-By: James M Snell <jasnell@gmail.com>
-Reviewed-By: Marco Ippolito <marcoippolito54@gmail.com>
-Reviewed-By: Chengzhong Wu <legendecas@gmail.com>
-Reviewed-By: Rafael Gonzaga <rafael.nunu@hotmail.com>
-Reviewed-By: Luigi Pinca <luigipinca@gmail.com>
----
- tools/v8_gypfiles/toolchain.gypi | 91 --------------------------------
- 1 file changed, 91 deletions(-)
-
-Index: node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
-===================================================================
---- node-v22.16.0.orig/tools/v8_gypfiles/toolchain.gypi
-+++ node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
-@@ -103,33 +103,6 @@
-     # Indicates if gcmole tools are downloaded by a hook.
-     'gcmole%': 0,
-   },
--
--  # [GYP] this needs to be outside of the top level 'variables'
--  'conditions': [
--    ['host_arch=="ia32" or host_arch=="x64" or \
--      host_arch=="ppc" or host_arch=="ppc64" or \
--      host_arch=="s390x" or \
--      clang==1', {
--      'variables': {
--        'host_cxx_is_biarch%': 1,
--       },
--     }, {
--      'variables': {
--        'host_cxx_is_biarch%': 0,
--      },
--    }],
--    ['target_arch=="ia32" or target_arch=="x64" or \
--      target_arch=="ppc" or target_arch=="ppc64" or \
--      target_arch=="s390x" or clang==1', {
--      'variables': {
--        'target_cxx_is_biarch%': 1,
--       },
--     }, {
--      'variables': {
--        'target_cxx_is_biarch%': 0,
--      },
--    }],
--  ],
-   'target_defaults': {
-     'cflags!': ['-Wall', '-Wextra'],
-     'conditions': [
-@@ -553,71 +526,6 @@
-           '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
-         ],
-       }],
--      ['(OS=="linux" or OS=="freebsd" or OS=="openbsd" or OS=="solaris" \
--         or OS=="netbsd" or OS=="mac" or OS=="android" or OS=="qnx") and \
--        (v8_target_arch=="arm" or v8_target_arch=="ia32" or \
--         v8_target_arch=="ppc")', {
--        'target_conditions': [
--          ['_toolset=="host"', {
--            'conditions': [
--              ['host_cxx_is_biarch==1', {
--                'conditions': [
--                  ['host_arch=="s390x"', {
--                    'cflags': [ '-m31' ],
--                    'ldflags': [ '-m31' ]
--                  },{
--                   'cflags': [ '-m32' ],
--                   'ldflags': [ '-m32' ]
--                  }],
--                ],
--              }],
--            ],
--            'xcode_settings': {
--              'ARCHS': [ 'i386' ],
--            },
--          }],
--          ['_toolset=="target"', {
--            'conditions': [
--              ['target_cxx_is_biarch==1', {
--                'conditions': [
--                  ['host_arch=="s390x"', {
--                    'cflags': [ '-m31' ],
--                    'ldflags': [ '-m31' ]
--                  },{
--                   'cflags': [ '-m32' ],
--                   'ldflags': [ '-m32' ],
--                  }],
--                ],
--              }],
--            ],
--            'xcode_settings': {
--              'ARCHS': [ 'i386' ],
--            },
--          }],
--        ],
--      }],
--      ['(OS=="linux" or OS=="android") and \
--        (v8_target_arch=="x64" or v8_target_arch=="arm64" or \
--         v8_target_arch=="ppc64" or v8_target_arch=="s390x")', {
--        'target_conditions': [
--          ['_toolset=="host"', {
--            'conditions': [
--              ['host_cxx_is_biarch==1', {
--                'cflags': [ '-m64' ],
--                'ldflags': [ '-m64' ]
--              }],
--             ],
--           }],
--          ['_toolset=="target"', {
--             'conditions': [
--               ['target_cxx_is_biarch==1', {
--                 'cflags': [ '-m64' ],
--                 'ldflags': [ '-m64' ],
--               }],
--             ]
--           }],
--         ],
--      }],
-       ['OS=="android" and v8_android_log_stdout==1', {
-         'defines': [
-           'V8_ANDROID_LOG_STDOUT',
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
deleted file mode 100644
index dd9c9015e2..0000000000
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 0976af0f3b328436ea44a74a406f311adb2ab211 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 15 Jun 2021 19:01:31 -0700
-Subject: [PATCH] ppc64: Do not use -mminimal-toc with clang
-
-clang does not support this option
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- common.gypi | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/common.gypi
-+++ b/common.gypi
-@@ -417,7 +417,7 @@
-             'ldflags': [ '-m32' ],
-           }],
-           [ 'target_arch=="ppc64" and OS!="aix"', {
--            'cflags': [ '-m64', '-mminimal-toc' ],
-+            'cflags': [ '-m64' ],
-             'ldflags': [ '-m64' ],
-           }],
-           [ 'target_arch=="s390x"', {
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb b/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
similarity index 84%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
index a13b71b762..4b9d9c7e19 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.22.3.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_24.16.0.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0 & BlueOak-1.0.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b195f4ea4368177a2fd84b879f09cba8"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=9f816753e8bdfe4576cb87159a0cd60c"
+FILESEXTRAPATHS:prepend := "${THISDIR}/nodejs-24:"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -22,24 +23,19 @@ COMPATIBLE_HOST:powerpc64le = "null"
 
 SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Do-not-use-glob-in-deps.patch \
-           file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
-           file://0004-v8-don-t-override-ARM-CFLAGS.patch \
-           file://system-c-ares.patch \
-           file://0001-liftoff-Correct-function-signatures.patch \
-           file://libatomic.patch \
-           file://0001-deps-disable-io_uring-support-in-libuv.patch \
-           file://0001-positional-args.patch \
-           file://0001-custom-env.patch \
-           file://0001-build-remove-redundant-mXX-flags-for-V8.patch \
+           file://0002-v8-don-t-override-ARM-CFLAGS.patch \
+           file://0003-system-c-ares.patch \
+           file://0004-liftoff-Correct-function-signatures.patch \
+           file://0005-libatomic.patch \
+           file://0006-deps-disable-io_uring-support-in-libuv.patch \
+           file://0007-positional-args.patch \
+           file://0008-custom-env.patch \
            file://run-ptest \
            "
 SRC_URI:append:class-target = " \
-           file://0001-Using-native-binaries.patch \
+           file://0009-Using-native-binaries.patch \
            "
-SRC_URI:append:toolchain-clang:powerpc64le = " \
-           file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
-           "
-SRC_URI[sha256sum] = "f3e6a578db1ab335a4a72785c1e87ad18a2cf6d2fc25747a1d741fb34af0bd0f"
+SRC_URI[sha256sum] = "2ff84a6de70b6165290111b0fc656ded1ad207a799816fe720cc7c31232df30f"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
@@ -211,11 +207,3 @@ python __anonymous () {
 }
 
 BBCLASSEXTEND = "native"
-
-CVE_STATUS[CVE-2026-21710] = "fixed-version: fixed since v22.22.2"
-CVE_STATUS[CVE-2026-21712] = "cpe-incorrect: only v24 and v25 are affected"
-CVE_STATUS[CVE-2026-21713] = "fixed-version: fixed since v22.22.2"
-CVE_STATUS[CVE-2026-21714] = "fixed-version: fixed since v22.22.2"
-CVE_STATUS[CVE-2026-21715] = "fixed-version: fixed since v22.22.2"
-CVE_STATUS[CVE-2026-21716] = "fixed-version: fixed since v22.22.2"
-CVE_STATUS[CVE-2026-21717] = "fixed-version: fixed since v22.22.2"
-- 
2.54.0


