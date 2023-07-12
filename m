Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07D3FC001DE
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 23:48:31 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web10.1789.1689205704471446595
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Jul 2023 16:48:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=LAKfzJdY;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1b8b4749013so1103605ad.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 16:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689205704; x=1691797704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRKKwuT65Lr5RYJk+1XJWhAkLcCLuoMjHx6wQXjcZls=;
        b=LAKfzJdYVsfBkYJoAtkmC183cJnIATSEE2wK0vPiClwLiQn2F7+OtIu64VvK6T2PPz
         8pgLevwbfo/JKLn+ltC346X2pR3UOtNI84z77akqVF4sSzla9LtAz7bIa1sTBHfuOId0
         3o30XCsabjylVa1g/ShLQ30JARxTsYKNGABTkAyeX/nnuQIetjHk1H7dfd+8OIEt2cCt
         ebaylIWH1Km0s0zqKFfVYdgxiZc/oQuTrwFsRdTkRmb6P/f7f5WK96E8gl6+FsCcj5I6
         RbRHeSDaNozC+H7+RxWb6cn0C6kOwK2wWfAgFvNNwJxsZjAX8hWJvTmfpFMoGPvmBOJi
         e5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689205704; x=1691797704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oRKKwuT65Lr5RYJk+1XJWhAkLcCLuoMjHx6wQXjcZls=;
        b=ZgB+H0OAs9ZdJqzhBMm2RP6drLd77OR9VC5p053vRsUW5okNZGnukb36trSvZAbhnY
         XH33ws4oiDuedFfbpfi6xq1xHLAygQfDAyCb64JyXZsqdAcn2453KsSwKiTXaQts69/8
         Isw8G+bitUk3lHYP8Ac5r/XzllvVoTqGOlfBKCTTjCYaCWr0RCzz9LIJoE3Om25gZ6XD
         GayOtKlXs/Yv8UKxFqDBsze759wAyKAeZF3/3QGQ5JpGm6zEtBi68Dv9symMa7mJ1nkh
         gPlV60dOhYv3jkspgEGmmloT01B+/J+SYvrdK8KZh77FXdDL6shN4UsY4z9IoMq9i820
         iLkQ==
X-Gm-Message-State: ABy/qLaL2AfWAr9B1vs+3hRkFB+HOA/Y8pYXcUCxICK7IHZXJ9tDSzI2
	Qq+bSkx2+zFUNyaU5/yA++HtUdm4Zd4=
X-Google-Smtp-Source: APBJJlGtsjPoLRqKY+0xmk29eHOJ8c2/kAfb0xMcrIo/F5NI94yxq69nwMBhyyqiSyydoQVKG+B3Dg==
X-Received: by 2002:a17:902:c946:b0:1b8:b2c6:7e8d with SMTP id i6-20020a170902c94600b001b8b2c67e8dmr35191pla.66.1689205703512;
        Wed, 12 Jul 2023 16:48:23 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::9429])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902d38c00b001b9d335223csm4545831pld.26.2023.07.12.16.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 16:48:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 3/3] breakpad: Update to latest trunk
Date: Wed, 12 Jul 2023 16:48:19 -0700
Message-ID: <20230712234819.1008911-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230712234819.1008911-1-raj.khem@gmail.com>
References: <20230712234819.1008911-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jul 2023 23:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103850

Fix build with latest glibc trunk 2.38+ while here
drop upstreamed patches
Add new dependency on zlib

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ot-add-stack-pointer-to-clobber-list.patch | 63 -------------------
 ...ONTEXT-check-to-add-local-implementa.patch | 15 ++---
 ...dler.cc-Match-the-types-for-SIGSTKSZ.patch | 34 ----------
 ...001-lss-Match-syscalls-to-match-musl.patch | 20 +++---
 ...-gcc-13-cannot-use-uintptr_t-via-inc.patch | 30 ---------
 .../breakpad/0003-Dont-include-stab.h.patch   | 10 +--
 ...t-between-musl-libc-dirent.h-and-lss.patch | 11 +---
 ...clude-sys-reg.h-to-get-__WORDSIZE-on.patch |  8 +--
 .../breakpad/breakpad/mcontext.patch          | 14 ++---
 .../recipes-devtools/breakpad/breakpad_git.bb | 12 ++--
 10 files changed, 38 insertions(+), 179 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
deleted file mode 100644
index e572022684..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Do-not-add-stack-pointer-to-clobber-list.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 5c63eb5d56abd4e5232add4727247965a863d851 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Dec 2019 14:02:45 -0800
-Subject: [PATCH] Do not add stack pointer to clobber list
-
-It was being ignored until now when gcc 9.0 became capable
-of flagging these silent ignore via [1].
-
-We weren't actually clobbering the stack pointers here
-so it should not cause change in behavior.
-
-[1] https://gcc.gnu.org/PR52813
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- linux_syscall_support.h | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/linux_syscall_support.h b/linux_syscall_support.h
-index 9276f56..6e73309 100644
---- a/linux_syscall_support.h
-+++ b/linux_syscall_support.h
-@@ -1955,7 +1955,7 @@ struct kernel_statfs {
-                            LSS_ENTRYPOINT                                     \
-                            "pop %%ebx"                                        \
-                            args                                               \
--                           : "esp", "memory");                                \
-+                           : "memory");                                       \
-       LSS_RETURN(type,__res)
-     #undef  _syscall0
-     #define _syscall0(type,name)                                              \
-@@ -2012,7 +2012,7 @@ struct kernel_statfs {
-                              : "i" (__NR_##name), "ri" ((long)(arg1)),        \
-                                "c" ((long)(arg2)), "d" ((long)(arg3)),        \
-                                "S" ((long)(arg4)), "D" ((long)(arg5))         \
--                             : "esp", "memory");                              \
-+                             : "memory");                                     \
-         LSS_RETURN(type,__res);                                               \
-       }
-     #undef  _syscall6
-@@ -2034,7 +2034,7 @@ struct kernel_statfs {
-                              : "i" (__NR_##name),  "0" ((long)(&__s)),        \
-                                "c" ((long)(arg2)), "d" ((long)(arg3)),        \
-                                "S" ((long)(arg4)), "D" ((long)(arg5))         \
--                             : "esp", "memory");                              \
-+                             : "memory");                                     \
-         LSS_RETURN(type,__res);                                               \
-       }
-     LSS_INLINE int LSS_NAME(clone)(int (*fn)(void *), void *child_stack,
-@@ -2120,7 +2120,7 @@ struct kernel_statfs {
-                            : "0"(-EINVAL), "i"(__NR_clone),
-                              "m"(fn), "m"(child_stack), "m"(flags), "m"(arg),
-                              "m"(parent_tidptr), "m"(newtls), "m"(child_tidptr)
--                           : "esp", "memory", "ecx", "edx", "esi", "edi");
-+                           : "memory", "ecx", "edx", "esi", "edi");
-       LSS_RETURN(int, __res);
-     }
- 
--- 
-2.24.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
index d7a5c06753..df41b4d6c0 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch
@@ -12,11 +12,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  Makefile.am | 12 ------------
  1 file changed, 12 deletions(-)
 
-diff --git a/Makefile.am b/Makefile.am
-index ee7454e4..69700192 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -187,10 +187,6 @@ src_client_linux_libbreakpad_client_a_SOURCES = \
+@@ -529,10 +529,6 @@ src_client_linux_libbreakpad_client_a_SO
  	src/common/linux/linux_libc_support.cc \
  	src/common/linux/memory_mapped_file.cc \
  	src/common/linux/safe_readlink.cc
@@ -24,10 +22,10 @@ index ee7454e4..69700192 100644
 -src_client_linux_libbreakpad_client_a_SOURCES += \
 -	src/common/linux/breakpad_getcontext.S
 -endif
- endif LINUX_HOST
  
- if !DISABLE_PROCESSOR
-@@ -508,10 +504,6 @@ src_client_linux_linux_client_unittest_shlib_SOURCES = \
+ # Client tests
+ src_client_linux_linux_dumper_unittest_helper_SOURCES = \
+@@ -580,10 +576,6 @@ src_client_linux_linux_client_unittest_s
  	src/processor/minidump.cc \
  	src/processor/pathname_stripper.cc \
  	src/processor/proc_maps_linux.cc
@@ -38,7 +36,7 @@ index ee7454e4..69700192 100644
  
  src_client_linux_linux_client_unittest_shlib_CPPFLAGS = \
  	$(AM_CPPFLAGS) $(TEST_CFLAGS)
-@@ -541,10 +533,6 @@ src_client_linux_linux_client_unittest_shlib_LDADD = \
+@@ -613,10 +605,6 @@ src_client_linux_linux_client_unittest_s
  	src/common/string_conversion.o \
  	$(TEST_LIBS) \
  	$(PTHREAD_CFLAGS) $(PTHREAD_LIBS)
@@ -49,6 +47,3 @@ index ee7454e4..69700192 100644
  if ANDROID_HOST
  src_client_linux_linux_client_unittest_shlib_LDFLAGS += \
  	-llog -lm
--- 
-2.30.2
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch
deleted file mode 100644
index afe8a61b29..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 66a2b6e4ba8e2b49115043127ce4aa0fcd71ad1e Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 11 May 2021 11:12:35 -0700
-Subject: [PATCH] exception_handler.cc: Match the types for SIGSTKSZ
-
-In glibc 2.34, SIGSTKSZ is a syscall which returns a long int, therefore
-current check fails
-
-| ../git/src/client/linux/handler/exception_handler.cc:141:49: error: no matching function for call to 'max(int, long int)'
-|   141 |   static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
-|       |                                         ~~~~~~~~^~~~~~~~~~~~~~~~~
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/linux/handler/exception_handler.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index ca353c40..dc0fc4a9 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -138,7 +138,7 @@ void InstallAlternateStackLocked() {
-   // SIGSTKSZ may be too small to prevent the signal handlers from overrunning
-   // the alternative stack. Ensure that the size of the alternative stack is
-   // large enough.
--  static const unsigned kSigStackSize = std::max(16384, SIGSTKSZ);
-+  static const unsigned kSigStackSize = std::max(16384u, (unsigned)SIGSTKSZ);
- 
-   // Only set an alternative stack if there isn't already one, or if the current
-   // one is too small.
--- 
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
index f2d1fe681d..80e5a8a764 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-lss-Match-syscalls-to-match-musl.patch
@@ -12,7 +12,7 @@ Upstream-Status: Pending
 
 --- a/linux_syscall_support.h
 +++ b/linux_syscall_support.h
-@@ -816,6 +816,9 @@ struct kernel_statfs {
+@@ -1006,6 +1006,9 @@ struct kernel_statx {
  #define FUTEX_TRYLOCK_PI_PRIVATE  (FUTEX_TRYLOCK_PI | FUTEX_PRIVATE_FLAG)
  #endif
  
@@ -22,17 +22,17 @@ Upstream-Status: Pending
  
  #if defined(__x86_64__)
  #ifndef ARCH_SET_GS
-@@ -947,6 +950,7 @@ struct kernel_statfs {
- #ifndef __NR_fallocate
- #define __NR_fallocate          324
+@@ -1140,6 +1143,7 @@ struct kernel_statx {
+ #ifndef __NR_getrandom
+ #define __NR_getrandom          355
  #endif
 +
  /* End of i386 definitions                                                   */
  #elif defined(__ARM_ARCH_3__) || defined(__ARM_EABI__)
  #ifndef __NR_setresuid
-@@ -1239,6 +1243,12 @@ struct kernel_statfs {
- #ifndef __NR_fallocate
- #define __NR_fallocate          285
+@@ -1448,6 +1452,12 @@ struct kernel_statx {
+ #ifndef __NR_getrandom
+ #define __NR_getrandom          318
  #endif
 +#ifndef __NR_pread
 +#define __NR_pread __NR_pread64
@@ -43,9 +43,9 @@ Upstream-Status: Pending
  /* End of x86-64 definitions                                                 */
  #elif defined(__mips__)
  #if _MIPS_SIM == _MIPS_SIM_ABI32
-@@ -1418,6 +1428,12 @@ struct kernel_statfs {
- #ifndef __NR_ioprio_get
- #define __NR_ioprio_get         (__NR_Linux + 274)
+@@ -1633,6 +1643,12 @@ struct kernel_statx {
+ #ifndef __NR_getrandom
+ #define __NR_getrandom          (__NR_Linux + 313)
  #endif
 +
 +#undef __NR_pread
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
deleted file mode 100644
index d6d326dd03..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 7ea7ded187b4d739239f3ab7082fcd5a2ccc1eaa Mon Sep 17 00:00:00 2001
-From: mingtaoxt xt <mingtaoxt@gmail.com>
-Date: Wed, 19 Oct 2022 19:36:13 +0800
-Subject: [PATCH] mainline version gcc-13 cannot use "uintptr_t" via "#include <string>"
-
-Change-Id: I0049bb92658b4226e32783ad4d8271787deef5f3
-Reviewed-on: https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166
-Reviewed-by: Mike Frysinger <vapier@chromium.org>
-
-Upstream-Status: Backport [https://chromium-review.googlesource.com/c/breakpad/breakpad/+/3964166]
-Signed-of-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/linux/handler/minidump_descriptor.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/client/linux/handler/minidump_descriptor.h b/src/client/linux/handler/minidump_descriptor.h
-index 4349b88f..d822c9d9 100644
---- a/src/client/linux/handler/minidump_descriptor.h
-+++ b/src/client/linux/handler/minidump_descriptor.h
-@@ -32,6 +32,7 @@
- #include <assert.h>
- #include <sys/types.h>
- 
-+#include <cstdint>
- #include <string>
- 
- #include "client/linux/handler/microdump_extra_info.h"
--- 
-2.39.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
index cd5546d761..81844d0d66 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
@@ -14,7 +14,7 @@ Upstream-Status: Pending
 
 --- a/src/common/stabs_reader.cc
 +++ b/src/common/stabs_reader.cc
-@@ -34,7 +34,9 @@
+@@ -38,7 +38,9 @@
  #include "common/stabs_reader.h"
  
  #include <assert.h>
@@ -26,7 +26,7 @@ Upstream-Status: Pending
  #include <string>
 --- a/src/common/stabs_reader.h
 +++ b/src/common/stabs_reader.h
-@@ -58,6 +58,30 @@
+@@ -54,6 +54,30 @@
  #elif defined(HAVE_A_OUT_H)
  #include <a.out.h>
  #endif
@@ -59,7 +59,7 @@ Upstream-Status: Pending
  #include <vector>
 --- a/src/common/stabs_reader_unittest.cc
 +++ b/src/common/stabs_reader_unittest.cc
-@@ -33,7 +33,9 @@
+@@ -36,7 +36,9 @@
  
  #include <assert.h>
  #include <errno.h>
@@ -71,8 +71,8 @@ Upstream-Status: Pending
  #include <string.h>
 --- a/configure.ac
 +++ b/configure.ac
-@@ -72,7 +72,7 @@ AC_ARG_ENABLE(m32,
- AC_HEADER_STDC
+@@ -61,7 +61,7 @@ fi
+ 
  AC_SYS_LARGEFILE
  AX_PTHREAD
 -AC_CHECK_HEADERS([a.out.h sys/mman.h sys/random.h])
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
index aa89959e9f..9b16dc3b2a 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch
@@ -11,19 +11,17 @@ Upstream-Status: Pending
  src/client/linux/crash_generation/crash_generation_server.cc | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-diff --git a/src/client/linux/crash_generation/crash_generation_server.cc b/src/client/linux/crash_generation/crash_generation_server.cc
-index 26c50a5c..2596afde 100644
 --- a/src/client/linux/crash_generation/crash_generation_server.cc
 +++ b/src/client/linux/crash_generation/crash_generation_server.cc
-@@ -28,7 +28,6 @@
- // OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
+@@ -31,7 +31,6 @@
+ #endif
  
  #include <assert.h>
 -#include <dirent.h>
  #include <fcntl.h>
  #include <limits.h>
  #include <poll.h>
-@@ -49,6 +48,8 @@
+@@ -52,6 +51,8 @@
  #include "common/linux/guid_creator.h"
  #include "common/linux/safe_readlink.h"
  
@@ -32,6 +30,3 @@ index 26c50a5c..2596afde 100644
  static const char kCommandQuit = 'x';
  
  namespace google_breakpad {
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
index b4bccb44cb..ff331977b6 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
@@ -13,8 +13,8 @@ Upstream-Status: Pending
 
 --- a/src/common/dwarf/elf_reader.cc
 +++ b/src/common/dwarf/elf_reader.cc
-@@ -30,12 +30,16 @@
- #define _GNU_SOURCE  // needed for pread()
+@@ -34,12 +34,16 @@
+ #include <config.h>  // Must come first
  #endif
  
 +#include <config.h>
@@ -32,8 +32,8 @@ Upstream-Status: Pending
  #include <algorithm>
 --- a/configure.ac
 +++ b/configure.ac
-@@ -72,7 +72,7 @@ AC_ARG_ENABLE(m32,
- AC_HEADER_STDC
+@@ -61,7 +61,7 @@ fi
+ 
  AC_SYS_LARGEFILE
  AX_PTHREAD
 -AC_CHECK_HEADERS([a.out.h stab.h sys/mman.h sys/random.h])
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
index 3449973629..cb323fbdcb 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mcontext.patch
@@ -3,16 +3,14 @@ map the mcontext_t structure for musl
 Upstream-Status: Inappropriate [need to consider Android]
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Index: git/src/client/linux/minidump_writer/linux_core_dumper.cc
-===================================================================
---- git.orig/src/client/linux/minidump_writer/linux_core_dumper.cc
-+++ git/src/client/linux/minidump_writer/linux_core_dumper.cc
-@@ -196,7 +196,7 @@ bool LinuxCoreDumper::EnumerateThreads()
+--- a/src/client/linux/minidump_writer/linux_core_dumper.cc
++++ b/src/client/linux/minidump_writer/linux_core_dumper.cc
+@@ -214,7 +214,7 @@ bool LinuxCoreDumper::EnumerateThreads()
          info.tgid = status->pr_pgrp;
          info.ppid = status->pr_ppid;
  #if defined(__mips__)
--#if defined(__ANDROID__)
-+#if defined(__ANDROID__) || !defined(__GLIBC__)
+-# if defined(__ANDROID__)
++# if defined(__ANDROID__) || !defined(__GLIBC__)
          for (int i = EF_R0; i <= EF_R31; i++)
            info.mcontext.gregs[i - EF_R0] = status->pr_reg[i];
- #else  // __ANDROID__
+ # else  // __ANDROID__
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index d1d338c6a8..3462b846d3 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -6,11 +6,12 @@ SUMMARY = "An open-source multi-platform crash reporting system"
 DESCRIPTION = "Breakpad is a library and tool suite that allows you to distribute an application to users with compiler-provided debugging information removed, record crashes in compact \"minidump\" files, send them back to your server, and produce C and C++ stack traces from these minidumps. "
 HOMEPAGE = "https://code.google.com/p/google-breakpad/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=8bb274ebd1901085fd71a8d8afe8831b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=07aeb530115539d62cacf9942fa60cac"
 SECTION = "libs"
 
 inherit autotools
 
+DEPENDS += "zlib"
 DEPENDS:append:libc-musl = " libucontext"
 
 BBCLASSEXTEND = "native"
@@ -21,11 +22,11 @@ PV = "1.0"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-SRCREV_breakpad = "8b22babdf894e5aa98b2dbbe103f7e3856a71944"
+SRCREV_breakpad = "7a1a190f4f68e8a3e06788498f50a4d5520a69f3"
 #v1.10.0
-SRCREV_gtest = "4fe018038f87675c083d0cfb6a6b57c274fb1753"
+SRCREV_gtest = "e2239ee6043f73722e7aa812a459f54a28552929"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
-SRCREV_lss = "fd00dbbd0c06a309c657d89e9430143b179ff6db"
+SRCREV_lss = "9719c1e1e676814c456b55f5f070eabad6709d31"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
 SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=https \
@@ -40,11 +41,8 @@ SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main;protocol=h
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
            file://mcontext.patch \
            file://0001-Remove-HAVE_GETCONTEXT-check-to-add-local-implementa.patch \
-           file://0001-exception_handler.cc-Match-the-types-for-SIGSTKSZ.patch \
-           file://0001-mainline-version-gcc-13-cannot-use-uintptr_t-via-inc.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
            file://mips_asm_sgidefs.patch;patchdir=src/third_party/lss \
-           file://0001-Do-not-add-stack-pointer-to-clobber-list.patch;patchdir=src/third_party/lss \
 "
 S = "${WORKDIR}/git"
 
-- 
2.41.0


