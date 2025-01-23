Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8F7EC02181
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 00:28:56 +0000 (UTC)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
 by mx.groups.io with SMTP id smtpd.web10.548.1737592127844304030
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jan 2025 16:28:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=egw3qIdg;
 spf=pass (domain: gmail.com, ip: 209.85.219.182, mailfrom: schonm@gmail.com)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e479e529ebcso481996276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jan 2025 16:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737592127; x=1738196927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q8m5gYXWIv6GqFe9fOWpwkCgPDh3XoK5dnZh2+o/uhk=;
        b=egw3qIdgyjVyUa83ESnL19jkESug5yJq84FYjdsgkHCTRT8yVjBfgGHMQCCdx1H3BO
         8IyequcBxOQtJFYYfh41xjDJqPSf2jcYZmDDQJbQKEWJzHh3aVqxoWtnIPIFJKuvdSu/
         XjrpMLtbcpw+CHxabKZVPxb6cypVCVRh+d39I47P5C3Cyc+gaYDj+cDcP11oh+DbibhG
         1KBhqwCjKnaWWO99mmu6DgQ2ECzkMiNf7lVPIbwAANSKWUMpBvKdLn+B+OrxchwKjnwg
         3pYzFZO4yyngdTSSJd+NrXQyO6I2uyhF80TIUIdS7XR0Ll6DY5sUc61Gk/iJytBxvPoo
         cMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737592127; x=1738196927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q8m5gYXWIv6GqFe9fOWpwkCgPDh3XoK5dnZh2+o/uhk=;
        b=FKwML2laTtJdeMkomdiPVjFoiWgKzJ6NiMX2bbrDUFutphVQ6Fq7UfqaMjAxf2I8Pq
         oU3h7ljLoenXhU1j4FuVIf4bKZZd3ofqZgdX1jBD8QNKdk5V7ND+n5LIwNpKZzCML6UT
         Hf3tWYEeCc+JX5Nsi3yL7r0pCfeUrO7TOnblB20PsicmhAM+Rj6WnpPGrsYemG6GbA32
         LduBvEXBfvFZGsRvq8OZhneiE94PlYCoWq1PdsZmPN93fgl8qQZbyV8ZVPEt41w4zcfo
         M5f3IOVav7BgPUUgg09fcSbgrJTzlDMvAfZGexNzLAk2Rmd+LH2+TdNnGNS4tFJP1OST
         R8wQ==
X-Gm-Message-State: AOJu0Yy9zieLDbGtT/vMz7iwbnEX3yrMgSMYhze6LhdvvjPDLRNS3C3e
	nwDkaDQt9NxYYhBptTHOrn1KZGyXXpY3YAfIG6TW17o6To3+M75pT13+Bg/g
X-Gm-Gg: ASbGncupntcpMiEx1U07u8XhudQECkSnz9a0FFFaSILXA+j8FmFDHOffYYxK2TRu7FH
	d0elD8+2f8kHn2sR4GCwvejS8kdPb/AbJjR4dfsX7MnLoK0SqcxNXMuXlrJ+U4Bc3guXZIec+eC
	6IyzmDmZqpB1uISz4V0qhsxYlQIyHnCZuWKjlfN0EQp1yf8wce6QCUyYx5uVGFiK3btk8CL934E
	m+U/9z5xP+kbEKG3L0b3T0nNaGhNqSk+huuJPkvjJGAiF7rc7r/OBhBzN79F1HaxsBP+BBTHOHs
	l1WSBx1krqOrvnFEHMciudDZNvj5
X-Google-Smtp-Source: AGHT+IGFCek6xTLw7dU/jaFnObp6Dasl2xYfPkreLa0CVOrqyvm9LbgJf7D3hQu1komkliCWFBfM7A==
X-Received: by 2002:a05:690c:998d:b0:6ef:910d:7846 with SMTP id 00721157ae682-6f6eb65c313mr195863087b3.1.1737592126407;
        Wed, 22 Jan 2025 16:28:46 -0800 (PST)
Received: from localhost.localdomain (71-208-20-57.ftmy.qwest.net. [71.208.20.57])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6f6e647e885sm22114347b3.67.2025.01.22.16.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 16:28:46 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com,
	changqing.li@windriver.com,
	Jason Schonberg <schonm@gmail.com>
Subject: [meta-oe][PATCH] nodejs: upgrade 22.12.0 -> 22.13.1
Date: Wed, 22 Jan 2025 19:28:18 -0500
Message-ID: <20250123002818.2770480-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jan 2025 00:28:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115024

Changelog for 22.13.0 : https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.13.0
Changelog for 22.13.1 : https://github.com/nodejs/node/blob/main/doc/changelogs/CHANGELOG_V22.md#22.13.1

The 22.13.1 release is a security fix addressing four CVEs.

    CVE-2025-23083 - src,loader,permission: throw on InternalWorker use when permission model is enabled (High)
    CVE-2025-23085 - src: fix HTTP2 mem leak on premature close and ERR_PROTO (Medium)
    CVE-2025-23084 - path: fix path traversal in normalize() on Windows (Medium)
    CVE-2025-22150 - Use of Insufficiently Random Values in undici fetch() (Medium)

I introduce a new patch with this recipe 0001-Do-not-use-glob-in-deps.patch to revert https://github.com/nodejs/node/commit/77e2869ca6

I restored 0001-deps-disable-io_uring-support-in-libuv.patch as suggested here : https://lore.kernel.org/all/20241207140642.181134-1-martin.jansa@gmail.com/

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../oe-npm-cache                              |   0
 ....12.bb => nodejs-oe-cache-native_22.13.bb} |   0
 .../nodejs/0001-Do-not-use-glob-in-deps.patch |  22 ++++
 ...ps-disable-io_uring-support-in-libuv.patch | 106 ++++++++++--------
 .../{nodejs_22.12.0.bb => nodejs_22.13.1.bb}  |   3 +-
 5 files changed, 81 insertions(+), 50 deletions(-)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-22.12 => nodejs-oe-cache-22.13}/oe-npm-cache (100%)
 rename meta-oe/recipes-devtools/nodejs/{nodejs-oe-cache-native_22.12.bb => nodejs-oe-cache-native_22.13.bb} (100%)
 create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
 rename meta-oe/recipes-devtools/nodejs/{nodejs_22.12.0.bb => nodejs_22.13.1.bb} (98%)

diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cache b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.13/oe-npm-cache
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.12/oe-npm-cache
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-22.13/oe-npm-cache
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb b/meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.13.bb
similarity index 100%
rename from meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.12.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs-oe-cache-native_22.13.bb
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
new file mode 100644
index 000000000..551869523
--- /dev/null
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-Do-not-use-glob-in-deps.patch
@@ -0,0 +1,22 @@
+// Revert the patch found here https://github.com/nodejs/node/commit/fe1dd26398e1887b96b2dc51ab59371ad4d6bc20?diff=unified&w=0
+// so that the dependencies are still explicitly enumerated.  That way we
+// can pick and choose which pieces to build and which to use existing system
+// packages for.
+
+Upstream-Status: Inappropriate [embedded specific]
+
+
+--- a/Makefile	2025-01-11 14:37:29.059536707 -0500
++++ b/Makefile	2025-01-11 14:39:52.419867046 -0500
+@@ -171,7 +171,8 @@
+ 	$(warning '$@' target is a noop)
+ 
+ out/Makefile: config.gypi common.gypi common_node.gypi node.gyp \
+-	deps/*/*.gyp \
++	deps/uv/uv.gyp deps/llhttp/llhttp.gyp deps/zlib/zlib.gyp \
++	deps/simdutf/simdutf.gyp deps/ada/ada.gyp deps/nbytes/nbytes.gyp \
+ 	tools/v8_gypfiles/toolchain.gypi \
+ 	tools/v8_gypfiles/features.gypi \
+ 	tools/v8_gypfiles/inspector.gypi tools/v8_gypfiles/v8.gyp
+
+
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
index 04398ac68..01ae50cdc 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
@@ -1,52 +1,60 @@
-From 2bb296f169f86dbb04ee47e9a0dc1e3ee13d4f73 Mon Sep 17 00:00:00 2001
-From: Jason Schonberg <schonm@gmail.com>
-Date: Thu, 7 Mar 2024 12:55:56 -0500
-Subject: [PATCH] Update to nodejs 20.11.1
+From 79af9bd6ac1040f1fe3c6cab26b2d040ad907870 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Fri, 1 Mar 2024 15:46:11 +0800
+Subject: [PATCH] deps: disable io_uring support in libuv
 
-Upstream-Status: Inappropriate [embedded specific]
+Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
+enabled. Refer [2], always disable io_uring support in libuv to fix
+issue in [1].
+
+[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
+[2] https://github.com/nodejs/node/commit/686da19abb
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
 ---
- ...ps-disable-io_uring-support-in-libuv.patch | 35 +++++++++++++++++++
- 1 file changed, 35 insertions(+)
- create mode 100644 meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
+ deps/uv/src/unix/linux.c | 29 +----------------------------
+ 1 file changed, 1 insertion(+), 28 deletions(-)
 
-diff --git a/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
-new file mode 100644
-index 00000000..5ac711fb
---- /dev/null
-+++ b/meta-oe/recipes-devtools/nodejs/nodejs/0001-deps-disable-io_uring-support-in-libuv.patch
-@@ -0,0 +1,35 @@
-+From 9838be9c710ab4249df86726fa390232a3b6a6e7 Mon Sep 17 00:00:00 2001
-+From: Changqing Li <changqing.li@windriver.com>
-+Date: Fri, 1 Mar 2024 15:46:11 +0800
-+Subject: [PATCH] deps: disable io_uring support in libuv
-+
-+Refer [1], Pseudo fails to intercept some of the syscalls when io_uring
-+enabled. Refer [2], always disable io_uring support in libuv to fix
-+issue in [1].
-+
-+[1] https://git.openembedded.org/meta-openembedded/commit/?id=d08453978c31ee41d28206c6ff198d7d9d701d88
-+[2] https://github.com/nodejs/node/commit/686da19abb
-+
-+Upstream-Status: Inappropriate [oe-specific]
-+
-+Signed-off-by: Changqing Li <changqing.li@windriver.com>
-+---
-+ deps/uv/src/unix/linux.c | 2 +-
-+ 1 file changed, 1 insertion(+), 1 deletion(-)
-+
-+diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
-+index 0c997185..7508409d 100644
-+--- a/deps/uv/src/unix/linux.c
-++++ b/deps/uv/src/unix/linux.c
-+@@ -433,7 +433,7 @@ static int uv__use_io_uring(void) {
-+   if (use == 0) {
-+     /* Disable io_uring by default due to CVE-2024-22017. */
-+     val = getenv("UV_USE_IO_URING");
-+-    use = val != NULL && atoi(val) ? 1 : -1;
-++    use = 0;
-+     atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
-+   }
-+ 
-+-- 
-+2.25.1
-+
+diff --git a/deps/uv/src/unix/linux.c b/deps/uv/src/unix/linux.c
+index 803a9a9d3f0..a4735f56cf0 100644
+--- a/deps/uv/src/unix/linux.c
++++ b/deps/uv/src/unix/linux.c
+@@ -465,34 +465,7 @@ static int uv__use_io_uring(void) {
+   /* See https://github.com/libuv/libuv/issues/4283. */
+   return 0; /* Random SIGSEGV in signal handler. */
+ #else
+-  /* Ternary: unknown=0, yes=1, no=-1 */
+-  static _Atomic int use_io_uring;
+-  char* val;
+-  int use;
+-
+-  use = atomic_load_explicit(&use_io_uring, memory_order_relaxed);
+-
+-  if (use == 0) {
+-    use = uv__kernel_version() >=
+-#if defined(__hppa__)
+-    /* io_uring first supported on parisc in 6.1, functional in .51 */
+-    /* https://lore.kernel.org/all/cb912694-b1fe-dbb0-4d8c-d608f3526905@gmx.de/ */
+-    /* 6.1.51 */ 0x060133
+-#else
+-    /* Older kernels have a bug where the sqpoll thread uses 100% CPU. */
+-    /* 5.10.186 */ 0x050ABA
+-#endif
+-    ? 1 : -1;
+-
+-    /* But users can still enable it if they so desire. */
+-    val = getenv("UV_USE_IO_URING");
+-    if (val != NULL)
+-      use = atoi(val) ? 1 : -1;
+-
+-    atomic_store_explicit(&use_io_uring, use, memory_order_relaxed);
+-  }
+-
+-  return use > 0;
++  return 0; /* pseudo doesn't support io_uring https://bugzilla.yoctoproject.org/show_bug.cgi?id=15244 */
+ #endif
+ }
+ 
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb b/meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb
similarity index 98%
rename from meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
rename to meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb
index 194df4c33..9c145695f 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_22.12.0.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_22.13.1.bb
@@ -20,6 +20,7 @@ COMPATIBLE_HOST:riscv32 = "null"
 COMPATIBLE_HOST:powerpc = "null"
 
 SRC_URI = "http://nodejs.org/dist/v${PV}/node-v${PV}.tar.xz \
+           file://0001-Do-not-use-glob-in-deps.patch \
            file://0001-Disable-running-gyp-files-for-bundled-deps.patch \
            file://0004-v8-don-t-override-ARM-CFLAGS.patch \
            file://system-c-ares.patch \
@@ -36,7 +37,7 @@ SRC_URI:append:class-target = " \
 SRC_URI:append:toolchain-clang:powerpc64le = " \
            file://0001-ppc64-Do-not-use-mminimal-toc-with-clang.patch \
            "
-SRC_URI[sha256sum] = "fe1bc4be004dc12721ea2cb671b08a21de01c6976960ef8a1248798589679e16"
+SRC_URI[sha256sum] = "cfce282119390f7e0c2220410924428e90dadcb2df1744c0c4a0e7baae387cc2"
 
 S = "${WORKDIR}/node-v${PV}"
 
-- 
2.43.0


