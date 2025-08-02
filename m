Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97190C87FD2
	for <webhook@archiver.kernel.org>; Sat,  2 Aug 2025 23:59:23 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.8374.1754179159825773410
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Aug 2025 16:59:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fIzObJLj;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-710e344bbf9so20681447b3.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 16:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754179159; x=1754783959; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7IZgDQsPqSYSInRrnodG0JqYT32hIGU0FzKyWAgTZVE=;
        b=fIzObJLjONXSP49qYM3TMLUfhsI3OkXdeKF8zlZM+Iu/V4GsgsHpun5j4WlMwxyAuD
         SHMnztQQGLsfJmR9fmlydCFiq6QKTTj3pubNQVs4t+cADQvv+FKW/vfTRFfZ3skEDD3C
         B1jt03JiiA2rslOMkUyHrIhZeRWr1R7tZbYTg7xphsGgsJjqGsA9iJMZ1jzDTTHjriud
         WxaDokF9L4IJvPqnhSXBf6fw2k/XqGpPtg8iwL2yDsCD1g1h5LDQQc80LCBIObFzRZmR
         d7VpfQ2y0ay85l9b6KnqZlfGd7WhnrafFG6zwxQhfx0DdfqYDHwRLYFR6G1HOXs0SPoT
         89lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754179159; x=1754783959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7IZgDQsPqSYSInRrnodG0JqYT32hIGU0FzKyWAgTZVE=;
        b=MhoWgmwa2TogkwDBv+B4pRwVA+9WL+Go6FQMjAJgZlaGOeVFHUu/BAgccoelM+98bN
         R5LfOvOBmCEgWDwthZEYAqig85Rls8+Qbxr0lIojzisHVM8Ta1/5zWTWrHpVRXrZPw/M
         9E9o+lio6sjEVrL+yWjiL+eodyvS8N/KmRFlY4y3jRrj6TkAoWyBY70dTSzkBmQJOZ9C
         FQ3aFyFYla0CL/AaSXCEoPlWvZZcTE7afgJ9HBZ3kBFE71/QISgSJgIrDgkXpNkmpnwD
         VeeiEXYFQWNTFWDs00TYbo8DW1/998Oz+of2lj3oxuicre2YS55E+t3Aots8ibq9z7D3
         j/Uw==
X-Gm-Message-State: AOJu0YxaBCW8FLFjEyXG7UD6xWJkDFtkKRAgtTpTaTzoaJhKFfRAP4iy
	Y4qM5pIAGevwfUp4FrKiS9KudrpN3OoGQmEmFx/YCueJwhFZP6JLXFszjGM73g==
X-Gm-Gg: ASbGncv0yoK1TQpxNIdSr7VB9FT40L2G4qeEhstxS213Qat6MMKzqpIXAgtPDUPzWhR
	4py9gwpbjzqg77IZcXvxavWYKBpValbDLdXDWHca/SVdOSEFkWe7+xHsPZ/j8UPZJC4QW52OJ//
	BcG7ilFwN6A5ldU9u1amyHsgIz/4gt/swjpa6Hzeb6+J8lxv0bwNfYIR2EIAD1Ne+ZesKmprZBp
	37ZGwtl0x9O+8akg5bkxnHJ6KOG4qNZik8P2RWu0y0P52c/FloXKSvlIKBD5y/y3ThL7BOj5C1R
	7PldaWi0yEkfjVYE8i/kXHyynuW5UYZbnTrxNLXoKUZ8XZvRx8BvWBOJV7S+yMOo81kWlYkmvtD
	WPwW7LYESSxiC1Y0OzGnrngUsD16C
X-Google-Smtp-Source: AGHT+IFCE5V3qgG1OQD2XtyLNiV4bGPLBm7AJax/0izs9mHHa8G492wN0CkM5cTrZ3ZAuoUT0J72HQ==
X-Received: by 2002:a05:690c:2a92:b0:71b:66e5:9b54 with SMTP id 00721157ae682-71b7f07fd63mr52419227b3.28.1754179158289;
        Sat, 02 Aug 2025 16:59:18 -0700 (PDT)
Received: from localhost.localdomain ([67.233.61.26])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71b5a3a9b63sm18227467b3.13.2025.08.02.16.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 16:59:17 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.16.0 -> 22.18.0
Date: Sat,  2 Aug 2025 19:58:12 -0400
Message-ID: <20250802235812.108716-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 02 Aug 2025 23:59:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118832

  0001-build-remove-redundant-mXX-flags-for-V8.patch - fix offset and fuzz.
  0001-deps-disable-io_uring-support-in-libuv.patch - update for new libuv version 1.51.0
    https://github.com/nodejs/node/commit/e397980a1a

  License-Update: zlib version change from 1.3.0.1 to 1.3.1
    https://github.com/nodejs/node/commit/efebf461313db420243717f48aaa0b97d5279580

  Changelog: https://github.com/nodejs/node/releases/tag/v22.18.0
  Changelog: https://github.com/nodejs/node/releases/tag/v22.17.1
  Changelog: https://github.com/nodejs/node/releases/tag/v22.17.0

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |  0
 ....16.bb => nodejs-oe-cache-native_22.18.bb} |  0
 ...ld-remove-redundant-mXX-flags-for-V8.patch |  6 +--
 ...ps-disable-io_uring-support-in-libuv.patch | 41 +++++++++++--------
 .../{nodejs_22.16.0.bb => nodejs_22.18.0.bb}  |  6 +--
 5 files changed, 29 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.16 => nodejs-oe-cache-22.18}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.16.bb => nodejs-oe-cache-native_22.18.bb} (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.16.0.bb => nodejs_22.18.0.bb} (97%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.16/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.18/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.16/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.18/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.18.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.16.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.18.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
index 7841a9d7bc..b47aa564cf 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-build-remove-redundant-mXX-flags-for-V8.patch
@@ -25,7 +25,7 @@ Index: node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
 ===================================================================
 --- node-v22.16.0.orig/tools/v8_gypfiles/toolchain.gypi
 +++ node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
-@@ -97,33 +97,6 @@
+@@ -103,33 +103,6 @@
      # Indicates if gcmole tools are downloaded by a hook.
      'gcmole%': 0,
    },
@@ -57,8 +57,8 @@ Index: node-v22.16.0/tools/v8_gypfiles/toolchain.gypi
 -    }],
 -  ],
    'target_defaults': {
-     'include_dirs': [
-       '<(V8_ROOT)',
+     'cflags!': ['-Wall', '-Wextra'],
+     'conditions': [
 @@ -553,71 +526,6 @@
            '-mmmx',  # Allows mmintrin.h for MMX intrinsics.
          ],
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
index 01ae50cdc4..50d63cf78c 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
@@ -14,15 +14,17 @@ Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
 Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Updated by Jason Schonberg <schonm@gamil.com> August 1, 2025 for nodejs 22.18.0
+which uses libuv 1.51.0
 ---
  deps/uv/src/unix/linux.c | 29 +----------------------------
  1 file changed, 1 insertion(+), 28 deletions(-)
 
 diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
-index 803a9a9d3f0..a4735f56cf0 100644
 --- a/deps/uv/src/unix/linux.c
 +++ b/deps/uv/src/unix/linux.c
-@@ -465,34 +465,7 @@ static int uv__use_io_uring(void) {
+@@ -465,36 +465,7 @@
    /* See https://github.com/libuv/libuv/issues/4283. */
    return 0; /* Random SIGSEGV in signal handler. */
  #else
@@ -31,30 +33,33 @@ index 803a9a9d3f0..a4735f56cf0 100644
 -  char* val;
 -  int use;
 -
--  use = atomic_load_explicit(&use_io_uring, memory_order_relaxed);
--
--  if (use == 0) {
--    use = uv__kernel_version() >=
 -#if defined(__hppa__)
--    /* io_uring first supported on parisc in 6.1, functional in .51 */
--    /* https://lore.kernel.org/all/cb912694-b1fe-dbb0-4d8c-d608f3526905@gmx.de/ */
--    /* 6.1.51 */ 0x060133
--#else
--    /* Older kernels have a bug where the sqpoll thread uses 100% CPU. */
--    /* 5.10.186 */ 0x050ABA
+-  /* io_uring first supported on parisc in 6.1, functional in .51
+-   * https://lore.kernel.org/all/cb912694-b1fe-dbb0-4d8c-d608f3526905@gmx.de/
+-   */
+-  if (uv__kernel_version() < /*6.1.51*/0x060133)
+-    return 0;
 -#endif
--    ? 1 : -1;
 -
--    /* But users can still enable it if they so desire. */
--    val = getenv("UV_USE_IO_URING");
--    if (val != NULL)
--      use = atoi(val) ? 1 : -1;
+-  /* SQPOLL is all kinds of buggy but epoll batching should work fine. */
+-  if (0 == (flags & UV__IORING_SETUP_SQPOLL))
+-    return 1;
+-
+-  /* Older kernels have a bug where the sqpoll thread uses 100% CPU. */
+-  if (uv__kernel_version() < /*5.10.186*/0x050ABA)
+-    return 0;
 -
+-  use = atomic_load_explicit(&use_io_uring, memory_order_relaxed);
+-
+-  if (use == 0) {
+-    val = getenv("UV_USE_IO_URING");
+-    use = val != NULL && atoi(val) > 0 ? 1 : -1;
 -    atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
 -  }
 -
 -  return use > 0;
-+  return 0; /* pseudo doesn't support io_uring https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244 */
++return 0; /* pseudo doesn't support io_uring https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244 */
  #endif
  }
  
+ 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb
similarity index 97%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb
index 0663e8c52e..d2e7874a9f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.16.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.18.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
 HOMEPAGE = "http://nodejs.org"
 LICENSE = "MIT & ISC & BSD-2-Clause & BSD-3-Clause & Artistic-2.0 & Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b4f41dcacabc8f07b9ca7dee2f188a00"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=0c50f40949c25ef1b63d51a6ae6c6cbe"
 
 CVE_PRODUCT = "nodejs node.js"
 
@@ -20,7 +20,7 @@ COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 COMPATIBLE_HOST:powerpc64le = "null"
 
-SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
+SRC_URI = "https://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
            file://0001-Do-not-use-glob-in-deps.patch \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
@@ -39,7 +39,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "720894f323e5c1ac24968eb2676660c90730d715cb7f090be71a668662a17c37"
+SRC_URI[sha256sum] = "120e0f74419097a9fafae1fd80b9de7791a587e6f1c48c22b193239ccd0f7084"
 
 S = "${UNPACKDIR}/node-v${PV}"
 
-- 
2.43.0


