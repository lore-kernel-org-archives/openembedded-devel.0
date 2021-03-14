Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web12.3685.1615708031368700690
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 23:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RVX/hnU5;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id s21so7202154pjq.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 23:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zsXsGE/1hwZy5Y8UTwAarSnba187ORJs/S/m5rX4ovc=;
        b=RVX/hnU5TedijKtR9YNZnT9eTzFT/lidd5iTgKihcQBTIXOOGce0Oobiapmyf4MNlV
         mGr03IorfZnEZngTR1D/fJKfmIIjjapaTMPj0ZqH/yV08juGBPKNL0B27oo5jgk91OF5
         RRM/mK10RrboeeOjHT2/o1daPYp5m52x/tmK+RAc2n8o/5HxOSB6TryitCPcCpFoHNcq
         07ZH7JkgMC53xnk7+9i6s1EE9+KtQDE5Sd95nK3qZQ9zfDj7f7Res1dwXMLSG6ECideU
         QOxQxcD6o+NwJFGDAen+xVocx4zOb4KPXV4eB/0CVia0KV0h1yhsS0EAHDVBasnGXVvc
         8JNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zsXsGE/1hwZy5Y8UTwAarSnba187ORJs/S/m5rX4ovc=;
        b=M6PK5dOn7vtHMLXT9yo3CK8TAm/AMnOohkY4+ssAEoMh7CTESNmnnPHBr80yMJgB5X
         WEe50OTowDPXQulhZd+jLfJOeMslYqWzPqRvtWvBPgnxPh39WScf87y1Z8v1b7mrjkMq
         bh7AzewsVSuOIcqFtnNX2bxbUZxof7HenzawVhhX0RVHVMvlxHn6fHgF1R4C2BU6hm4n
         XF07oBGeKEumcSYyBmRJ/3tjxi9zkrq+rlrpXCPk9ZCLB2T4s2lO2DQDwwrD02MAXISe
         CVuEcbB63VlSZQEkNefwr7YV/Tl//jg0EeLzhxqt/zOQufMo2ah476Vi242mJbgPSY2v
         zBOQ==
X-Gm-Message-State: AOAM530sU+KAuCZj2ptCgojchkh/g4wF7AEqhSFNWJBCqZVuAbDMiHUM
	TcCFRCk6a1XmqKKWVLMpKDaj9g4ecSrF9Q==
X-Google-Smtp-Source: ABdhPJxr+tM3Ybkg9wLkiYKSIJnQue0mKaPDo/iiFqPOXfe/l+BfcVDh9PUjyQp9gcd3hNL33ALHiw==
X-Received: by 2002:a17:90a:70c2:: with SMTP id a2mr6775853pjm.63.1615708029884;
        Sat, 13 Mar 2021 23:47:09 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id mz11sm7100630pjb.6.2021.03.13.23.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 23:47:09 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] breakpad: Upgrade to latest
Date: Sat, 13 Mar 2021 23:47:05 -0800
Message-Id: <20210314074707.302060-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

License-Update: added APSL 2.0 and BSD-3-Clause and libunwind license

Forward patches as needed and drop patches applied upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-Turn-off-sign-compare-for-musl-libc.patch |  9 +--
 ...reg.h-to-get-__WORDSIZE-on-musl-libc.patch | 12 ++--
 ...te-instead-of-_libc_fpstate-on-linux.patch | 60 -------------------
 ...-is-a-nonportable-alias-for-signal.h.patch | 26 --------
 .../breakpad/0003-Dont-include-stab.h.patch   | 34 ++++-------
 ...clude-sys-reg.h-to-get-__WORDSIZE-on.patch | 38 ++++++------
 .../breakpad/breakpad/mips_asm_sgidefs.patch  | 18 ++----
 .../recipes-devtools/breakpad/breakpad_git.bb | 16 +++--
 8 files changed, 49 insertions(+), 164 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch
 delete mode 100644 meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch

diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
index 33bae1a373..6b8d011d8b 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-Turn-off-sign-compare-for-musl-libc.patch
@@ -13,11 +13,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/client/linux/crash_generation/crash_generation_server.cc | 10 ++++++++++
  1 file changed, 10 insertions(+)
 
-diff --git a/src/client/linux/crash_generation/crash_generation_server.cc b/src/client/linux/crash_generation/crash_generation_server.cc
-index 2596afde..2faeb9e5 100644
 --- a/src/client/linux/crash_generation/crash_generation_server.cc
 +++ b/src/client/linux/crash_generation/crash_generation_server.cc
-@@ -230,8 +230,18 @@ CrashGenerationServer::ClientEvent(short revents)
+@@ -230,8 +230,18 @@ CrashGenerationServer::ClientEvent(short
    // Walk the control payload and extract the file descriptor and validated pid.
    pid_t crashing_pid = -1;
    int signal_fd = -1;
@@ -28,7 +26,7 @@ index 2596afde..2faeb9e5 100644
 +  #pragma clang diagnostic push
 +  #pragma clang diagnostic ignored "-Wsign-compare"
 +#endif
-   for (struct cmsghdr *hdr = CMSG_FIRSTHDR(&msg); hdr;
+   for (struct cmsghdr* hdr = CMSG_FIRSTHDR(&msg); hdr;
         hdr = CMSG_NXTHDR(&msg, hdr)) {
 +#ifndef __GLIBC__
 +  #pragma clang diagnostic pop
@@ -36,6 +34,3 @@ index 2596afde..2faeb9e5 100644
      if (hdr->cmsg_level != SOL_SOCKET)
        continue;
      if (hdr->cmsg_type == SCM_RIGHTS) {
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
index 4583d601a8..3dc55cf1fc 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch
@@ -7,22 +7,20 @@ Subject: [PATCH 1/3] include <sys/reg.h> to get __WORDSIZE on musl libc
  src/common/linux/elf_core_dump.h | 1 +
  1 file changed, 1 insertion(+)
 
-Index: git/src/common/linux/elf_core_dump.h
-===================================================================
---- git.orig/src/common/linux/elf_core_dump.h
-+++ git/src/common/linux/elf_core_dump.h
-@@ -33,10 +33,13 @@
+--- a/src/common/linux/elf_core_dump.h
++++ b/src/common/linux/elf_core_dump.h
+@@ -33,10 +33,14 @@
  #ifndef COMMON_LINUX_ELF_CORE_DUMP_H_
  #define COMMON_LINUX_ELF_CORE_DUMP_H_
  
 +#include <config.h>
  #include <elf.h>
+ #include <limits.h>
  #include <link.h>
  #include <stddef.h>
--
 +#ifdef HAVE_SYS_REG_H
 +#include <sys/reg.h>
 +#endif
+ 
  #include "common/memory_range.h"
  
- namespace google_breakpad {
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch
deleted file mode 100644
index 6c097cd22e..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From 0ba1b3e35e7c743b670bedc3e90001dfb868df10 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sun, 1 Feb 2015 13:45:51 +0100
-Subject: [PATCH 2/6] Use _fpstate instead of _libc_fpstate on linux
-
-glibc defines both. musl libc only the former.
----
- src/client/linux/dump_writer_common/ucontext_reader.cc | 4 ++--
- src/client/linux/dump_writer_common/ucontext_reader.h  | 2 +-
- src/client/linux/minidump_writer/minidump_writer.h     | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-Index: git/src/client/linux/dump_writer_common/ucontext_reader.cc
-===================================================================
---- git.orig/src/client/linux/dump_writer_common/ucontext_reader.cc
-+++ git/src/client/linux/dump_writer_common/ucontext_reader.cc
-@@ -49,7 +49,7 @@ uintptr_t UContextReader::GetInstruction
- }
- 
- void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
--                                    const struct _libc_fpstate* fp) {
-+                                    const struct _fpstate* fp) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-   out->context_flags = MD_CONTEXT_X86_FULL |
-@@ -97,7 +97,7 @@ uintptr_t UContextReader::GetInstruction
- }
- 
- void UContextReader::FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
--                                    const struct _libc_fpstate* fpregs) {
-+                                    const struct _fpstate* fpregs) {
-   const greg_t* regs = uc->uc_mcontext.gregs;
- 
-   out->context_flags = MD_CONTEXT_AMD64_FULL;
-Index: git/src/client/linux/dump_writer_common/ucontext_reader.h
-===================================================================
---- git.orig/src/client/linux/dump_writer_common/ucontext_reader.h
-+++ git/src/client/linux/dump_writer_common/ucontext_reader.h
-@@ -50,7 +50,7 @@ struct UContextReader {
-   //   info: the collection of register structures.
- #if defined(__i386__) || defined(__x86_64)
-   static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
--                             const struct _libc_fpstate* fp);
-+                             const struct _fpstate* fp);
- #elif defined(__aarch64__)
-   static void FillCPUContext(RawContextCPU *out, const ucontext_t *uc,
-                              const struct fpsimd_context* fpregs);
-Index: git/src/client/linux/minidump_writer/minidump_writer.h
-===================================================================
---- git.orig/src/client/linux/minidump_writer/minidump_writer.h
-+++ git/src/client/linux/minidump_writer/minidump_writer.h
-@@ -48,7 +48,7 @@ class ExceptionHandler;
- #if defined(__aarch64__)
- typedef struct fpsimd_context fpstate_t;
- #elif !defined(__ARM_EABI__) && !defined(__mips__)
--typedef struct _libc_fpstate fpstate_t;
-+typedef struct _fpstate fpstate_t;
- #endif
- 
- // These entries store a list of memory regions that the client wants included
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch
deleted file mode 100644
index cfd9a9b34e..0000000000
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 15582e19c2545d5ffe8ff07f957d0ed602aeca74 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 14 Sep 2017 23:15:09 -0700
-Subject: [PATCH 2/5] <sys/signal.h> is a nonportable alias for <signal.h>
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/client/linux/handler/exception_handler.cc | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/client/linux/handler/exception_handler.cc b/src/client/linux/handler/exception_handler.cc
-index 05936d28..cca023fd 100644
---- a/src/client/linux/handler/exception_handler.cc
-+++ b/src/client/linux/handler/exception_handler.cc
-@@ -78,7 +78,7 @@
- #include <sys/wait.h>
- #include <unistd.h>
- 
--#include <sys/signal.h>
-+#include <signal.h>
- #include <sys/ucontext.h>
- #include <sys/user.h>
- #include <ucontext.h>
--- 
-2.14.1
-
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
index 2593ea93ea..76b2088b01 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0003-Dont-include-stab.h.patch
@@ -10,10 +10,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/common/stabs_reader_unittest.cc |  1 -
  3 files changed, 11 insertions(+), 3 deletions(-)
 
-Index: git/src/common/stabs_reader.cc
-===================================================================
---- git.orig/src/common/stabs_reader.cc
-+++ git/src/common/stabs_reader.cc
+--- a/src/common/stabs_reader.cc
++++ b/src/common/stabs_reader.cc
 @@ -34,7 +34,9 @@
  #include "common/stabs_reader.h"
  
@@ -24,10 +22,8 @@ Index: git/src/common/stabs_reader.cc
  #include <string.h>
  
  #include <string>
-Index: git/src/common/stabs_reader.h
-===================================================================
---- git.orig/src/common/stabs_reader.h
-+++ git/src/common/stabs_reader.h
+--- a/src/common/stabs_reader.h
++++ b/src/common/stabs_reader.h
 @@ -58,6 +58,30 @@
  #elif defined(HAVE_A_OUT_H)
  #include <a.out.h>
@@ -59,10 +55,8 @@ Index: git/src/common/stabs_reader.h
  
  #include <string>
  #include <vector>
-Index: git/src/common/stabs_reader_unittest.cc
-===================================================================
---- git.orig/src/common/stabs_reader_unittest.cc
-+++ git/src/common/stabs_reader_unittest.cc
+--- a/src/common/stabs_reader_unittest.cc
++++ b/src/common/stabs_reader_unittest.cc
 @@ -33,7 +33,9 @@
  
  #include <assert.h>
@@ -73,16 +67,14 @@ Index: git/src/common/stabs_reader_unittest.cc
  #include <stdarg.h>
  #include <stdlib.h>
  #include <string.h>
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+--- a/configure.ac
++++ b/configure.ac
 @@ -72,7 +72,7 @@ AC_ARG_ENABLE(m32,
  AC_HEADER_STDC
  AC_SYS_LARGEFILE
  AX_PTHREAD
--AC_CHECK_HEADERS([a.out.h sys/random.h])
-+AC_CHECK_HEADERS([a.out.h stab.h sys/random.h])
- AC_CHECK_FUNCS([arc4random getrandom])
- 
- AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
+-AC_CHECK_HEADERS([a.out.h sys/mman.h sys/random.h])
++AC_CHECK_HEADERS([a.out.h stab.h sys/mman.h sys/random.h])
+ AC_CHECK_FUNCS([arc4random getcontext getrandom memfd_create])
+ AM_CONDITIONAL([HAVE_GETCONTEXT], [test "x$ac_cv_func_getcontext" = xyes])
+ AM_CONDITIONAL([HAVE_MEMFD_CREATE], [test "x$ac_cv_func_memfd_create" = xyes])
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
index 525a1555bd..5892cfa7d6 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch
@@ -9,35 +9,33 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/common/dwarf/elf_reader.cc | 1 +
  1 file changed, 1 insertion(+)
 
-Index: git/src/common/dwarf/elf_reader.cc
-===================================================================
---- git.orig/src/common/dwarf/elf_reader.cc
-+++ git/src/common/dwarf/elf_reader.cc
-@@ -29,10 +29,13 @@
- #ifndef _GNU_SOURCE
+--- a/src/common/dwarf/elf_reader.cc
++++ b/src/common/dwarf/elf_reader.cc
+@@ -30,12 +30,16 @@
  #define _GNU_SOURCE  // needed for pread()
  #endif
--
+ 
 +#include <config.h>
- #include <sys/types.h>
- #include <sys/stat.h>
+ #include <fcntl.h>
+ #include <limits.h>
+ #include <string.h>
  #include <sys/mman.h>
+ #include <sys/stat.h>
+ #include <sys/types.h>
 +#ifdef HAVE_SYS_REG_H
 +#include <sys/reg.h>
 +#endif
  #include <unistd.h>
- #include <fcntl.h>
- #include <string.h>
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac
-+++ git/configure.ac
+ 
+ #include <algorithm>
+--- a/configure.ac
++++ b/configure.ac
 @@ -72,7 +72,7 @@ AC_ARG_ENABLE(m32,
  AC_HEADER_STDC
  AC_SYS_LARGEFILE
  AX_PTHREAD
--AC_CHECK_HEADERS([a.out.h stab.h sys/random.h])
-+AC_CHECK_HEADERS([a.out.h stab.h sys/random.h sys/reg.h])
- AC_CHECK_FUNCS([arc4random getrandom])
- 
- AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
+-AC_CHECK_HEADERS([a.out.h stab.h sys/mman.h sys/random.h])
++AC_CHECK_HEADERS([a.out.h stab.h sys/mman.h sys/random.h sys/reg.h])
+ AC_CHECK_FUNCS([arc4random getcontext getrandom memfd_create])
+ AM_CONDITIONAL([HAVE_GETCONTEXT], [test "x$ac_cv_func_getcontext" = xyes])
+ AM_CONDITIONAL([HAVE_MEMFD_CREATE], [test "x$ac_cv_func_memfd_create" = xyes])
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
index 19bb560445..96f5f48cc8 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
+++ b/meta-oe/recipes-devtools/breakpad/breakpad/mips_asm_sgidefs.patch
@@ -1,12 +1,9 @@
-Index: lss/linux_syscall_support.h
-===================================================================
---- lss.orig/linux_syscall_support.h
-+++ lss/linux_syscall_support.h
-@@ -118,21 +118,13 @@ extern "C" {
- #include <endian.h>
+--- a/linux_syscall_support.h
++++ b/linux_syscall_support.h
+@@ -119,14 +119,7 @@ extern "C" {
  
  #ifdef __mips__
--/* Include definitions of the ABI currently in use.                          */
+ /* Include definitions of the ABI currently in use.                          */
 -#ifdef __ANDROID__
 -/* Android doesn't have sgidefs.h, but does have asm/sgidefs.h,
 - * which has the definitions we need.
@@ -18,10 +15,3 @@ Index: lss/linux_syscall_support.h
  #endif
  #endif
  
- /* The Android NDK's <sys/stat.h> #defines these macros as aliases
-  * to their non-64 counterparts. To avoid naming conflict, remove them. */
--#ifdef __ANDROID__
-+#if defined(__ANDROID__) || (defined(__linux__) && !defined(__glibc__))
-   /* These are restored by the corresponding #pragma pop_macro near
-    * the end of this file. */
- # pragma push_macro("stat64")
diff --git a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
index daf262ed66..eb2b038dad 100644
--- a/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
+++ b/meta-oe/recipes-devtools/breakpad/breakpad_git.bb
@@ -6,7 +6,7 @@ SUMMARY = "An open-source multi-platform crash reporting system"
 DESCRIPTION = "Breakpad is a library and tool suite that allows you to distribute an application to users with compiler-provided debugging information removed, record crashes in compact \"minidump\" files, send them back to your server, and produce C and C++ stack traces from these minidumps. "
 HOMEPAGE = "https://code.google.com/p/google-breakpad/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=56c24a43c81c3af6fcf590851931489e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8bb274ebd1901085fd71a8d8afe8831b"
 SECTION = "libs"
 
 inherit autotools
@@ -19,25 +19,23 @@ PV = "1.0"
 
 SRCREV_FORMAT = "breakpad_gtest_protobuf_lss_gyp"
 
-SRCREV_breakpad = "0c0e24f709288a129d665ec27d6f089189318385"
+SRCREV_breakpad = "8b22babdf894e5aa98b2dbbe103f7e3856a71944"
 #v1.10.0
-SRCREV_gtest = "5ec7f0c4a113e2f18ac2c6cc7df51ad6afc24081"
+SRCREV_gtest = "4fe018038f87675c083d0cfb6a6b57c274fb1753"
 SRCREV_protobuf = "cb6dd4ef5f82e41e06179dcd57d3b1d9246ad6ac"
-SRCREV_lss = "8048ece6c16c91acfe0d36d1d3cc0890ab6e945c"
+SRCREV_lss = "fd00dbbd0c06a309c657d89e9430143b179ff6db"
 SRCREV_gyp = "324dd166b7c0b39d513026fa52d6280ac6d56770"
 
-SRC_URI = "git://github.com/google/breakpad;name=breakpad \
+SRC_URI = "git://github.com/google/breakpad;name=breakpad;branch=main \
            git://github.com/google/googletest.git;destsuffix=git/src/testing/gtest;name=gtest \
-           git://github.com/google/protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
-           git://chromium.googlesource.com/linux-syscall-support;protocol=https;destsuffix=git/src/third_party/lss;name=lss \
+           git://github.com/protocolbuffers//protobuf.git;destsuffix=git/src/third_party/protobuf/protobuf;name=protobuf \
+           git://chromium.googlesource.com/linux-syscall-support;protocol=https;branch=main;destsuffix=git/src/third_party/lss;name=lss \
            git://chromium.googlesource.com/external/gyp;protocol=https;destsuffix=git/src/tools/gyp;name=gyp \
            file://0001-include-sys-reg.h-to-get-__WORDSIZE-on-musl-libc.patch \
            file://0003-Fix-conflict-between-musl-libc-dirent.h-and-lss.patch \
            file://0001-Turn-off-sign-compare-for-musl-libc.patch \
-           file://0002-sys-signal.h-is-a-nonportable-alias-for-signal.h.patch \
            file://0003-Dont-include-stab.h.patch \
            file://0004-elf_reader.cc-include-sys-reg.h-to-get-__WORDSIZE-on.patch \
-           file://0002-Use-_fpstate-instead-of-_libc_fpstate-on-linux.patch \
            file://mcontext.patch \
            file://0001-disable-calls-to-getcontext-with-musl.patch \
            file://0001-lss-Match-syscalls-to-match-musl.patch;patchdir=src/third_party/lss \
-- 
2.30.2

