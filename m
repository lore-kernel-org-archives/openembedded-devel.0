Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web11.1008.1615625078222162216
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 00:44:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Ko45vszF;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t18so6296555pjs.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 00:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2Z3uPcTl7w4dbsQl2zoT89mbTzm2S7oPRwLpzFCk/E=;
        b=Ko45vszFnue0oIRU3oLTrFHutzyKjar/zJ6gOH3q/QIWyh7VCh12kxJm0gbCDAUxts
         niVQxaaTU/ipgahum6N8o8bU6CN+WHPo2Wrd6nEUeOJzCPPpKHH/CzK2ST9Q0rZl/CfO
         +QtP9YxhYvF3mkSCFWw4OvD4swwOixaIc6FfCmgOh0B4McrfkbTzAfFROKR8jf3BNKCT
         sk5ZJ1B2geMOGVj8jtiwxsyUKgRM3e+Li7AcFu+zMJUK01CqdwEdGChjeDdjc3j6ekvE
         tRHRbMe1/RKurSfAKaMWtATJ4UXBO6CyidvvlRnWu2WZdCz6kg57MTeRk3xSOp3+2fzE
         bI1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=A2Z3uPcTl7w4dbsQl2zoT89mbTzm2S7oPRwLpzFCk/E=;
        b=UVa2LWLblriGOe4VDYUDSvS2VEzj0+myKutTDyX6lOrHF6smUMI4JWFOHdXTMApv1U
         BCxnw1jI8EZ2mfiLLid+kK2DTVoOcC0WGrZGKtiM00Xr2xaZmRUNPCmHfHGoRZLYSUTK
         xLuYWzkm0tPypcVY4IenSrM7EZj/x2qfPdrffedTc9VxE+Biz2sbu7ZeWBtDT7EMZ+A/
         ZKSZ3gMx5T260+mSo6XS49AT5A2EsW6OrpD5McfEgN4QHuvg6Mw8bj91FyBGR56BU5L9
         0xTFzghmrk6m9icsIZL20KkLNt5xE+2xrCAGPQX2ShbI81d3MWiXvivo26KsSbhEL4Vp
         1k4g==
X-Gm-Message-State: AOAM530/33d6drWHAlHxIgU5mVTOmcEeu3aoSlBrzlCX8U6or0B6bb56
	5JVGzqoX76eMVjexbQcXF+l+bE4CrnUMvQ==
X-Google-Smtp-Source: ABdhPJwwcr9r/ehkyksV97iHiNzSZPtM7MowZsbdttwlqwv6vbnTcUzBIKGh6zRXXj06ZenCkr58RQ==
X-Received: by 2002:a17:902:b78a:b029:e4:8ce6:fb64 with SMTP id e10-20020a170902b78ab02900e48ce6fb64mr2465444pls.77.1615625077182;
        Sat, 13 Mar 2021 00:44:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y8sm4243789pjb.11.2021.03.13.00.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 00:44:36 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] gperftools: Update SRCREV to point to 2.9.1 release
Date: Sat, 13 Mar 2021 00:44:35 -0800
Message-Id: <20210313084435.2751568-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refresh patches
Drop upstreamed patch 0001-profile-handler-Specify-libc-specific-thread_id.patch
Fix build on musl/ppc
Disable heap and cpu profilers on ppc64le/musl since it does not build
stacktrace utility yet

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...checkers-and-debug-allocator-on-musl.patch |  6 +-
 .../0001-fix-build-with-musl-libc.patch       | 13 ++--
 ...dler-Specify-libc-specific-thread_id.patch | 38 -----------
 .../disable_libunwind_aarch64.patch           |  4 +-
 .../gperftools/gperftools/ppc-musl.patch      | 66 +++++++++++++++++++
 .../gperftools/gperftools/sgidef.patch        |  2 -
 .../gperftools/gperftools_2.9.1.bb            |  9 ++-
 7 files changed, 79 insertions(+), 59 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch
 create mode 100644 meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
index ab3ceb964f..e3e857f0c2 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch
@@ -11,11 +11,9 @@ Upstream-Status: Pending
  configure.ac | 2 ++
  1 file changed, 2 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index 70b49a3..8154c5c 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -51,6 +51,8 @@ case "$host" in
+@@ -53,6 +53,8 @@ case "$host" in
     *-cygwin*) default_enable_heap_checker=no; default_enable_cpu_profiler=no;;
     *-freebsd*) default_enable_heap_checker=no;;
     *-darwin*) default_enable_heap_checker=no;;
@@ -23,4 +21,4 @@ index 70b49a3..8154c5c 100644
 +            default_enable_debugalloc=no; default_enable_libunwind=no;
  esac
  
- # Currently only backtrace works on s390.
+ # Currently only backtrace works on s390 and OSX.
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
index cb4ead3176..baaaa4b53b 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/0001-fix-build-with-musl-libc.patch
@@ -10,13 +10,11 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/malloc_hook_mmap_linux.h | 6 +++++-
  1 file changed, 5 insertions(+), 1 deletion(-)
 
-diff --git a/src/malloc_hook_mmap_linux.h b/src/malloc_hook_mmap_linux.h
-index e2efb05..66b3110 100644
 --- a/src/malloc_hook_mmap_linux.h
 +++ b/src/malloc_hook_mmap_linux.h
-@@ -46,6 +46,10 @@
- #include <errno.h>
- #include "base/linux_syscall_support.h"
+@@ -45,6 +45,10 @@
+ #include <sys/syscall.h>
+ #include <unistd.h>
  
 +#ifndef __GLIBC__
 +typedef off64_t   __off64_t;
@@ -25,7 +23,7 @@ index e2efb05..66b3110 100644
  // The x86-32 case and the x86-64 case differ:
  // 32b has a mmap2() syscall, 64b does not.
  // 64b and 32b have different calling conventions for mmap().
-@@ -175,7 +179,7 @@ extern "C" void* mmap64(void *start, size_t length, int prot, int flags,
+@@ -175,7 +179,7 @@ extern "C" void* mmap64(void *start, siz
    return result;
  }
  
@@ -34,6 +32,3 @@ index e2efb05..66b3110 100644
  
  extern "C" void* mmap(void *start, size_t length, int prot, int flags,
                        int fd, off_t offset) __THROW {
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch b/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch
deleted file mode 100644
index 4029a69c5c..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0001-profile-handler-Specify-libc-specific-thread_id.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 0a504852ed6e56620d1df26b503c4aa2b5b74760 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 31 Oct 2020 16:12:36 -0700
-Subject: [PATCH] profile-handler: Specify libc specific thread_id
-
-We need to know internal _sigev_un is glibc specific, add an else for
-musl case
-
-Fixes build issue
-../git/src/profile-handler.cc:275:8: error: no member named '_sigev_un' in 'sigevent'
-  sevp._sigev_un._tid = sys_gettid();
-  ~~~~ ^
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/profile-handler.cc | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/profile-handler.cc b/src/profile-handler.cc
-index 7fdcb69..5867118 100644
---- a/src/profile-handler.cc
-+++ b/src/profile-handler.cc
-@@ -272,7 +272,11 @@ static void StartLinuxThreadTimer(int timer_type, int signal_number,
-   struct itimerspec its;
-   memset(&sevp, 0, sizeof(sevp));
-   sevp.sigev_notify = SIGEV_THREAD_ID;
-+#ifdef __GLIBC__
-   sevp._sigev_un._tid = sys_gettid();
-+#else
-+  sevp.sigev_notify_thread_id = sys_gettid();
-+#endif
-   sevp.sigev_signo = signal_number;
-   clockid_t clock = CLOCK_THREAD_CPUTIME_ID;
-   if (timer_type == ITIMER_REAL) {
--- 
-2.29.2
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
index c3c5784186..15eacc8993 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/disable_libunwind_aarch64.patch
@@ -12,11 +12,9 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  configure.ac | 5 +++++
  1 file changed, 5 insertions(+)
 
-diff --git a/configure.ac b/configure.ac
-index 8154c5c..063b260 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -69,6 +69,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [return __PPC64__])],
+@@ -76,6 +76,11 @@ AC_COMPILE_IFELSE([AC_LANG_PROGRAM(, [re
                    [default_enable_libunwind=yes
                     default_tcmalloc_pagesize=8])
  
diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
new file mode 100644
index 0000000000..4cf182ad64
--- /dev/null
+++ b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
@@ -0,0 +1,66 @@
+Compatibility fixes for musl.
+
+--- a/m4/pc_from_ucontext.m4
++++ b/m4/pc_from_ucontext.m4
+@@ -34,6 +34,7 @@ AC_DEFUN([AC_PC_FROM_UCONTEXT],
+    pc_fields="$pc_fields uc_mcontext.arm_pc"           # Linux (arm arch 5)
+    pc_fields="$pc_fields uc_mcontext.cr0_hi"           # Linux (e2k)
+    pc_fields="$pc_fields uc_mcontext.gp_regs[[PT_NIP]]"  # Suse SLES 11 (ppc64)
++   pc_fields="$pc_fields uc_mcontext.gregs[[PT_NIP]]"
+    pc_fields="$pc_fields uc_mcontext.mc_eip"           # FreeBSD (i386)
+    pc_fields="$pc_fields uc_mcontext.mc_srr0"          # FreeBSD (powerpc, powerpc64)
+    pc_fields="$pc_fields uc_mcontext.mc_rip"           # FreeBSD (x86_64 [untested])
+@@ -77,7 +78,8 @@ AC_DEFUN([AC_PC_FROM_UCONTEXT],
+                         pc_field_found=true)
+        elif test "x$ac_cv_header_ucontext_h" = xyes; then
+          AC_TRY_COMPILE([#define _GNU_SOURCE 1
+-                         #include <ucontext.h>],
++                         #include <ucontext.h>
++                         #include <asm/ptrace.h>],
+                         [ucontext_t u; return u.$pc_field == 0;],
+                         AC_DEFINE_UNQUOTED(PC_FROM_UCONTEXT, $pc_field,
+                                            How to access the PC from a struct ucontext)
+--- a/src/getpc.h
++++ b/src/getpc.h
+@@ -68,6 +68,9 @@
+ typedef ucontext ucontext_t;
+ #endif
+ 
++#if defined(__powerpc__) && !defined(PT_NIP)
++#define PT_NIP 32
++#endif
+ 
+ // Take the example where function Foo() calls function Bar().  For
+ // many architectures, Bar() is responsible for setting up and tearing
+--- a/src/stacktrace_powerpc-linux-inl.h
++++ b/src/stacktrace_powerpc-linux-inl.h
+@@ -186,7 +186,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
+           ucontext_t uc;
+         // We don't care about the rest, since the IP value is at 'uc' field.
+         } *sigframe = reinterpret_cast<signal_frame_64*>(current);
+-        result[n] = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_NIP];
++        result[n] = (void*) sigframe->uc.uc_mcontext.gp_regs[32];
+       }
+ #else
+       if (sigtramp32_vdso && (sigtramp32_vdso == current->return_addr)) {
+@@ -196,7 +196,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
+           mcontext_t mctx;
+           // We don't care about the rest, since IP value is at 'mctx' field.
+         } *sigframe = reinterpret_cast<signal_frame_32*>(current);
+-        result[n] = (void*) sigframe->mctx.gregs[PT_NIP];
++        result[n] = (void*) sigframe->mctx.gregs[32];
+       } else if (sigtramp32_rt_vdso && (sigtramp32_rt_vdso == current->return_addr)) {
+         struct rt_signal_frame_32 {
+           char dummy[64 + 16];
+@@ -204,7 +204,11 @@ static int GET_STACK_TRACE_OR_FRAMES {
+           ucontext_t uc;
+           // We don't care about the rest, since IP value is at 'uc' field.A
+         } *sigframe = reinterpret_cast<rt_signal_frame_32*>(current);
++#if defined(__GLIBC__)
+         result[n] = (void*) sigframe->uc.uc_mcontext.uc_regs->gregs[PT_NIP];
++#else
++        result[n] = (void*) sigframe->uc.uc_mcontext.gregs[32];
++#endif
+       }
+ #endif
+ 
diff --git a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
index 10274a6dec..b01cba39cd 100644
--- a/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
+++ b/meta-oe/recipes-support/gperftools/gperftools/sgidef.patch
@@ -10,8 +10,6 @@ Upstream-Status: Pending
  src/base/linux_syscall_support.h | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/src/base/linux_syscall_support.h b/src/base/linux_syscall_support.h
-index 70431ca..b23ca59 100644
 --- a/src/base/linux_syscall_support.h
 +++ b/src/base/linux_syscall_support.h
 @@ -164,7 +164,7 @@ extern "C" {
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
index 97942278db..bf8cb90178 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.9.1.bb
@@ -8,16 +8,19 @@ Included are an optimized thread-caching malloc() and cpu and heap profiling uti
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=762732742c73dc6c7fbe8632f06c059a"
 
-SRCREV = "d8eb315fb18f6fb0d6efa923401f166343727bc6"
+DEPENDS_append_libc-musl = " libucontext"
+
+SRCREV = "f7c6fb6c8e99d6b1b725e5994373bcd19ffdf8fd"
 SRC_URI = "git://github.com/gperftools/gperftools \
            file://0001-Support-Atomic-ops-on-clang.patch \
            file://0001-fix-build-with-musl-libc.patch \
            file://0001-disbale-heap-checkers-and-debug-allocator-on-musl.patch \
            file://disable_libunwind_aarch64.patch \
            file://sgidef.patch \
-           file://0001-profile-handler-Specify-libc-specific-thread_id.patch \
            "
 
+SRC_URI_append_libc-musl = " file://ppc-musl.patch"
+
 inherit autotools
 
 S = "${WORKDIR}/git"
@@ -36,6 +39,7 @@ COMPATIBLE_HOST_riscv32 = "null"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_toolchain-clang_arm = "arm"
 
+EXTRA_OECONF_append_libc-musl_powerpc64le = " --disable-cpu-profiler --disable-heap-profiler --disable-heap-checker"
 PACKAGECONFIG ?= "libunwind static"
 PACKAGECONFIG_remove_arm_libc-musl = "libunwind"
 PACKAGECONFIG_remove_riscv64 = "libunwind"
@@ -60,4 +64,3 @@ RDEPENDS_${PN} += " \
 "
 
 RDEPENDS_${PN} += "libtcmalloc-minimal (= ${EXTENDPKGV})"
-
-- 
2.30.2

