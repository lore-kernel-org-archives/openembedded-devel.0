Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 7DEA06FF0E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:12:33 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z73so8522857wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2018 13:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=6Dhl9qizCDuge3/8YaqhopqUEDiNL8juZxHBPrPg4Yw=;
	b=ZPfwHN2ZZRgmXJKdzrNeLr7pPGkka1Lh5zuze8XzDhffvE6zokzVNYGgKyogQDBmjQ
	2kKDuLNApzE+f9JKdhnoLdxp2ophJ5qK67Gm/5r1jOxcbHl67CywcgW0M2i3bQIIsJ/q
	fO+yhjZK4CvzHa+4wKvK4WPUHrdIYjsr6eNG1a2d9LcyNJw8mcD86kPXTMmnBqOfbxfE
	rQw/yYda2T/A76GoOvQ9nKiWnAQ3ciqgWr5oKnUepEaWVnStOKCu94C7udNcitbJ8I8q
	GOkqZ+uHIhptn/ymIW6SCX0Y9LiEMe7QrQm4DfHCjUIMDC0V93gYXAs3cw3gNOGeVDKy
	R4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=6Dhl9qizCDuge3/8YaqhopqUEDiNL8juZxHBPrPg4Yw=;
	b=lIXauiNu3m4PIu4cSmPSqriI0oW7YO7t9HPYc1P/6YHiMeGg8FgWBfhrjpPgYTjnCV
	C55sav2J+NQIgUF8lE1wjOhzmg9UsQnCR9BFM+ZQpe4o/mkgblcuDwxWluLhJtVTZmPQ
	eFqzcaBxIajjQEAURmYoC4lj0zGQq02KcMOu5PxClDAaWg97Jc3YQqZjDW8KzoJQTOLe
	AQomefUBCXvGXhlxnOOzBzKW8iz+IBEs1TlWbgmTDEtoqNv65t9hg6VlfD+exs+/Srqp
	smUftH1unTScbYr/B+Ar8h1dChrVeEsLec5XgGH11aX8c+lZdj1t1FlDR+MT+9vyrSwG
	kUXw==
X-Gm-Message-State: AElRT7FKDsNVi1AeeLmCzURHqAViT8Ll2vOYHBJLQ3bAvXFRSNlX2dHO
	v1NQ1qMvzpbrKcJXJM+MBu+BnQ==
X-Google-Smtp-Source: AG47ELueeWjJkVq5XmfCgs8bGvNQZpZx8SwNH2m4YT2hSdtNNDEd3MuDemybcjKMwsY+ztMZ9WarZw==
X-Received: by 10.223.199.132 with SMTP id l4mr2883683wrg.6.1521231154472;
	Fri, 16 Mar 2018 13:12:34 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	k20sm2246123wre.67.2018.03.16.13.12.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 13:12:33 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:12:33 +0000
Message-Id: <20180316201233.4746-2-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180316201233.4746-1-Martin.Jansa@gmail.com>
References: <20180316201233.4746-1-Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 2/2] gperftools: refresh the patches
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 16 Mar 2018 20:12:34 -0000

WARNING: gperftools-2.6.1-r0 do_patch:
Some of the context lines in patches were ignored. This can lead to incorrectly applied patches.
The context lines in the patches can be updated with devtool:

    devtool modify <recipe>
    devtool finish --force-patch-refresh <recipe> <layer_path>

Then the updated patches and the source tree (in devtool's workspace)
should be reviewed to make sure the patches apply in the correct place
and don't introduce duplicate lines (which can, and does happen
when some of the context is ignored). Further information:
http://lists.openembedded.org/pipermail/openembedded-core/2018-March/148675.html
https://bugzilla.yoctoproject.org/show_bug.cgi?id=10450
Details:
Applying patch 0001-Support-Atomic-ops-on-clang.patch
patching file src/base/atomicops.h
Hunk #1 succeeded at 124 with fuzz 2 (offset 6 lines).

Now at patch 0001-Support-Atomic-ops-on-clang.patch

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gperftools/0001-Support-Atomic-ops-on-clang.patch | 16 +++++++---------
 ...01-Use-ucontext_t-instead-of-struct-ucontext.patch |  8 +++-----
 ...le-heap-checkers-and-debug-allocator-on-musl.patch | 13 +++++++------
 .../gperftools/0001-fix-build-with-musl-libc.patch    |  6 ++----
 .../0001-include-fcntl.h-for-loff_t-definition.patch  |  6 ++----
 .../gperftools/disable_libunwind_aarch64.patch        | 19 +++++++++++++------
 .../gperftools/gperftools/sgidef.patch                | 18 +++++++++++++-----
 7 files changed, 47 insertions(+), 39 deletions(-)

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
index e582c0da6e..2fd21c2783 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Support-Atomic-ops-on-clang.patch
@@ -1,4 +1,4 @@
-From ea9f64eb2cdf3be6c4dc65fa1472d854616e43ca Mon Sep 17 00:00:00 2001
+From aa0a63209af6813d87255ec3ab339f2dbbf27d6d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 6 Mar 2017 13:38:46 -0800
 Subject: [PATCH] Support Atomic ops on clang
@@ -9,25 +9,23 @@ gcc 4.2, here it depends on gcc 4.7 to enable
 the atomics and fails for clang
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
+
 Upstream-Status: Pending
 
+---
  src/base/atomicops.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/base/atomicops.h b/src/base/atomicops.h
-index be038f3..f1a21ff 100644
+index dac95be..390733c 100644
 --- a/src/base/atomicops.h
 +++ b/src/base/atomicops.h
-@@ -118,7 +118,7 @@
+@@ -124,7 +124,7 @@
  #include "base/atomicops-internals-linuxppc.h"
  #elif defined(__GNUC__) && defined(__mips__)
  #include "base/atomicops-internals-mips.h"
 -#elif defined(__GNUC__) && GCC_VERSION >= 40700
 +#elif defined(__GNUC__) && GCC_VERSION >= 40700 || defined(__clang__)
  #include "base/atomicops-internals-gcc.h"
- #else
- #error You need to implement atomic operations for this architecture
--- 
-2.12.0
-
+ #elif defined(__clang__) && CLANG_VERSION >= 30400
+ #include "base/atomicops-internals-gcc.h"
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
index 5bd0b6fa4f..b3033621b5 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-Use-ucontext_t-instead-of-struct-ucontext.patch
@@ -1,4 +1,4 @@
-From 12ac0dc6742e1bcdfaf1842186c9002f0820a5e8 Mon Sep 17 00:00:00 2001
+From 230cd84486145c5bb1d69d4c9a544e00adbcc9b5 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 1 Jul 2017 13:21:21 -0700
 Subject: [PATCH] Use ucontext_t instead of struct ucontext
@@ -6,12 +6,13 @@ Subject: [PATCH] Use ucontext_t instead of struct ucontext
 Newer glibc has dropped the ucontext tag from exposing
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/stacktrace_powerpc-linux-inl.h | 3 +--
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
-index a9bf775..47ff2d7 100644
+index 3b3843b..a301a46 100644
 --- a/src/stacktrace_powerpc-linux-inl.h
 +++ b/src/stacktrace_powerpc-linux-inl.h
 @@ -53,7 +53,6 @@
@@ -31,6 +32,3 @@ index a9bf775..47ff2d7 100644
            // We don't care about the rest, since IP value is at 'uc' field.A
          } *sigframe = reinterpret_cast<rt_signal_frame_32*>(current);
          result[n] = (void*) sigframe->uc.uc_mcontext.uc_regs->gregs[PT_NIP];
--- 
-2.13.2
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
index 99127e11a6..ab3ceb964f 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
@@ -1,19 +1,20 @@
-From b5961f17e9d7f2bc44da611b3e4b27c8a641fc72 Mon Sep 17 00:00:00 2001
+From 06605158852f9364519391fa11070ba5ec4303e9 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 2 Sep 2017 08:07:17 -0700
 Subject: [PATCH] disbale heap checkers and debug allocator on musl
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
+
 Upstream-Status: Pending
 
+---
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+diff --git a/configure.ac b/configure.ac
+index 70b49a3..8154c5c 100644
+--- a/configure.ac
++++ b/configure.ac
 @@ -51,6 +51,8 @@ case "$host" in
     *-cygwin*) default_enable_heap_checker=no; default_enable_cpu_profiler=no;;
     *-freebsd*) default_enable_heap_checker=no;;
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
index 78621c7fe0..0a72ff27c8 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
@@ -1,4 +1,4 @@
-From 157914941bd38f1a38bb6bd7294ca6c2bc1b8dcb Mon Sep 17 00:00:00 2001
+From 034e7da08c3fbffcba8cf8d4e24a71a16558db5a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jul 2017 15:51:28 -0700
 Subject: [PATCH] fix build with musl libc
@@ -6,6 +6,7 @@ Subject: [PATCH] fix build with musl libc
 Patch from https://github.com/gperftools/gperftools/pull/765/
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  configure.ac                 | 1 +
  src/malloc_hook_mmap_linux.h | 8 ++++++--
@@ -56,6 +57,3 @@ index 79ac4e3..d444635 100755
  // libc's version:
  extern "C" void* __sbrk(ptrdiff_t increment);
  
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
index 667008a5b1..4c63e73b3c 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-include-fcntl.h-for-loff_t-definition.patch
@@ -1,4 +1,4 @@
-From 04ea8e001501931f4dbf20288aca78469617b08a Mon Sep 17 00:00:00 2001
+From a16a73f0819d26219ee83cd98eea82786d7c1755 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jul 2017 19:28:17 -0700
 Subject: [PATCH] include fcntl.h for loff_t definition
@@ -7,6 +7,7 @@ Fixes
 linux_syscall_support.h:2641:26: error: 'loff_t' has not been declared
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  src/base/linux_syscall_support.h | 1 +
  1 file changed, 1 insertion(+)
@@ -23,6 +24,3 @@ index 85347a2..70431ca 100644
  
  #ifdef __mips__
  /* Include definitions of the ABI currently in use.                          */
--- 
-2.13.3
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
index f2647404bf..c3c5784186 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
@@ -1,15 +1,22 @@
-Disable libunwind on aarch64
+From 564f800e3e24647c095f7a321bf3ebdccfbf762d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 2 Sep 2017 12:02:04 -0700
+Subject: [PATCH] Disable libunwind on aarch64
 
 Fixes hangs when using libtcmalloc.so
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
-@@ -69,6 +69,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [re
+---
+ configure.ac | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 8154c5c..063b260 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -69,6 +69,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [return __PPC64__])],
                    [default_enable_libunwind=yes
                     default_tcmalloc_pagesize=8])
  
diff --git a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
index 7e1a23bf68..10274a6dec 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
@@ -1,11 +1,19 @@
-sgidef.h does not exist on musl and its not needed to compile
+From 259b420444c52463795b4b582a2ab7511149eea7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 16 Oct 2017 21:26:40 -0700
+Subject: [PATCH] sgidef.h does not exist on musl and its not needed to compile
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Upstream-Status: Pending
-Index: git/src/base/linux_syscall_support.h
-===================================================================
---- git.orig/src/base/linux_syscall_support.h
-+++ git/src/base/linux_syscall_support.h
+
+---
+ src/base/linux_syscall_support.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/base/linux_syscall_support.h b/src/base/linux_syscall_support.h
+index 70431ca..b23ca59 100644
+--- a/src/base/linux_syscall_support.h
++++ b/src/base/linux_syscall_support.h
 @@ -164,7 +164,7 @@ extern "C" {
  #include <endian.h>
  #include <fcntl.h>
-- 
2.15.1


