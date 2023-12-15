Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE4BC4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 07:53:07 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.57811.1702626776899462664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 23:52:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cE1Zf1yQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a1915034144so45742066b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 23:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702626775; x=1703231575; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R9TP39jF5r4MgvJ5C4nghoY0RMngdkR3i8nFAaeSTnY=;
        b=cE1Zf1yQxJkKmleTxPFJsJGtozwNdAfz/fO1e4gLz+QhMx68FL0tgPAeVQVXjUdnE0
         QJN5/yyAjMC9QRLgBwTKIvo8nWuXOFClh0R43ayDSgl2273aFYvZ6Q+nIpqiP8Hhmg2V
         Wr7V1x4Nrp00fTOO93l2NruRtvQhxWkt6xCa0kDkf6HVbERXt99nWAzG2COIPwaW2vVI
         am1CSKwrilgXRYwg01VLoMZWAR3ACLleHFlcvOBOSPNR1ssJv7R/yjea7hMnmbnY4auj
         yeXRS8e2vc1ChwnyfoEMBlGwKsAlNGjNztPHroMwFuB+n4MDrjSxbkC3om+3rpTJBHOh
         ttvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702626775; x=1703231575;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R9TP39jF5r4MgvJ5C4nghoY0RMngdkR3i8nFAaeSTnY=;
        b=rhXOcgViNgqSFTePIeGpSUZxJ3Q3NCc5aDBX2JXuzpQSgroOyJBZ13KE/bUxdhj0xn
         kLHIifkF3M5qAq+jLx07ic4MvADQirzsSVRy6e/pTI4aQ+acCesGvTcbHgSkl5VNRWYy
         WPSJjORXitUbak4KFoi13a8wmu+lKp8v53RkoIjcLY2bTGlcLxS/WxlQqWzEIIwXLP9C
         gByFQo7xUzKkYxyfv2sv/+X0Nwrr7dgfiLLz+9aoQRIKH9Z0l4hNytj0uEqnBzYWr6NE
         1Ycy3GzkE9Jrg11YOfMkwYQbn5YwiRCqSNNSZW5/S/uEJEQr8/2HO0FXdhTz4ig30vDY
         DFNQ==
X-Gm-Message-State: AOJu0YyaJSHWQSeI0keEDmc+7oKrwXRi+Y2ugCuzzrk+zz2M73B04eoi
	7mtvLCq0Ug+AM9ZqYVD9zS+N75V1haI=
X-Google-Smtp-Source: AGHT+IEMMX/OpjBsgsAa7CNm4qmL4WsArdL3YTL9clIj4gzSXZevBB5ROhBPGDOdT7z0IeehgeEVvg==
X-Received: by 2002:a17:906:44a:b0:a1b:86e5:4e1 with SMTP id e10-20020a170906044a00b00a1b86e504e1mr5245489eja.108.1702626775264;
        Thu, 14 Dec 2023 23:52:55 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id le9-20020a170907170900b00a1e2aa3d090sm10348666ejc.206.2023.12.14.23.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 23:52:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 16/20] python3-grpcio: update 1.56.2 -> 1.59.3
Date: Fri, 15 Dec 2023 08:52:35 +0100
Message-Id: <20231215075239.3049865-16-alex@linutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231215075239.3049865-1-alex@linutronix.de>
References: <20231215075239.3049865-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 07:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107509

This is needed for python 3.12 compatibility.

Drop 0001-direct_mmap-Use-off_t-on-linux.patch as
issue resolved upstream.

Other dropped patches are all due to the code being significantly refactored upstream;
if the issues persist, please write updated patches.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../0001-Include-missing-cstdint-header.patch |  6 +-
 .../0001-direct_mmap-Use-off_t-on-linux.patch | 42 -----------
 ...-Do-not-mix-C-and-C-compiler-options.patch | 73 -------------------
 ...clude-unistd.h-for-open-close-C-APIs.patch |  6 +-
 .../python3-grpcio/abseil-ppc-fixes.patch     | 63 +++++++++-------
 .../python3-grpcio/mips_bigendian.patch       | 17 -----
 .../ppc-boringssl-support.patch               | 17 -----
 ...cio_1.56.2.bb => python3-grpcio_1.59.3.bb} | 14 ++--
 8 files changed, 46 insertions(+), 192 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.56.2.bb => python3-grpcio_1.59.3.bb} (63%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
index f970cf3c3..5cd94dee9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-Include-missing-cstdint-header.patch
@@ -1,4 +1,4 @@
-From 752e30eebe5b91c323bafcbea8d450dd5683701a Mon Sep 17 00:00:00 2001
+From 252aa78526287fe033c5656cd166e551fa5daa88 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 30 Jan 2023 10:31:10 -0800
 Subject: [PATCH] Include missing <cstdint> header
@@ -11,6 +11,7 @@ int32_t.
 
 Upstream-Status: Submitted [https://code-review.googlesource.com/c/re2/+/60970]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  third_party/re2/util/pcre.h | 1 +
  1 file changed, 1 insertion(+)
@@ -27,6 +28,3 @@ index 896b0bd..271a005 100644
  
  #ifdef USEPCRE
  #include <pcre.h>
--- 
-2.39.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch
deleted file mode 100644
index 49df528d7..000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-direct_mmap-Use-off_t-on-linux.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 45fdade6c0415ec5af3f9312e6311a4ccc682a7b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 28 Dec 2022 18:24:21 -0800
-Subject: [PATCH] direct_mmap: Use off_t on linux
-
-off64_t is not provided without defining _LARGEFILE64_SOURCE on musl
-this define is not defined automatically like glibc where it gets
-defined when _GNU_SOURCE is defined. Using off_t makes it portable
-across musl/glibc and for using 64bit off_t on glibc 32bit systems
--D_FILE_OFFSET_BITS=64 can be defined during build via CXXFLAGS
-
-Upstream-Status: Submitted [https://github.com/abseil/abseil-cpp/pull/1349]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- absl/base/internal/direct_mmap.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
-index 815b8d23..fdf88f0b 100644
---- a/absl/base/internal/direct_mmap.h
-+++ b/absl/base/internal/direct_mmap.h
-@@ -72,7 +72,7 @@ namespace base_internal {
- // Platform specific logic extracted from
- // https://chromium.googlesource.com/linux-syscall-support/+/master/linux_syscall_support.h
- inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
--                        off64_t offset) noexcept {
-+                        off_t offset) noexcept {
- #if defined(__i386__) || defined(__ARM_ARCH_3__) || defined(__ARM_EABI__) || \
-     defined(__m68k__) || defined(__sh__) ||                                  \
-     (defined(__hppa__) && !defined(__LP64__)) ||                             \
-@@ -102,7 +102,7 @@ inline void* DirectMmap(void* start, size_t length, int prot, int flags, int fd,
- #else
-   return reinterpret_cast<void*>(
-       syscall(SYS_mmap2, start, length, prot, flags, fd,
--              static_cast<off_t>(offset / pagesize)));
-+              offset / pagesize));
- #endif
- #elif defined(__s390x__)
-   // On s390x, mmap() arguments are passed in memory.
--- 
-2.39.0
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
deleted file mode 100644
index 13911ddcf..000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch
+++ /dev/null
@@ -1,73 +0,0 @@
-From de10fbc2386dcac3ab810c49b6977b2ee01bf426 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 17 Feb 2021 13:30:23 -0800
-Subject: [PATCH] setup.py: Do not mix C and C++ compiler options
-
-EXTRA_ENV_COMPILE_ARGS is used both with CC and CXX
-so using -std=c++11 or -std=gnu99 together will cause
-build time errors espcially with clang
-
-Keep '-std=c++11' to fix native build error
-with old gcc (such as gcc 5.4.0 on ubuntu 16.04), for clang
-we will remove them through GRPC_PYTHON_CFLAGS at do_compile
-in bb recipe.
-
-While export CC="gcc ", cc_args is None, it will
-cause subprocess.Popen always return 1. On centos 8, if you don't
-install package libatomic, there will be a native build error
-`cannot find /usr/lib64/libatomic.so.1.2.0'.
-
-Add no harm '-g' to cc_args if cc_args is empty.
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- setup.py                      | 11 +++++++----
- src/python/grpcio/commands.py |  5 ++++-
- 2 files changed, 11 insertions(+), 5 deletions(-)
-
---- a/setup.py
-+++ b/setup.py
-@@ -206,8 +206,11 @@ def check_linker_need_libatomic():
-     """Test if linker on system needs libatomic."""
-     code_test = (b'#include <atomic>\n' +
-                  b'int main() { return std::atomic<int64_t>{}; }')
--    cxx = shlex.split(os.environ.get('CXX', 'c++'))
--    cpp_test = subprocess.Popen(cxx + ['-x', 'c++', '-std=c++14', '-'],
-+    cxx, cxx_args = os.environ.get('CXX').split(' ', 1) or 'c++'
-+    if not cxx_args:
-+      cxx_args = "-g"
-+
-+    cpp_test = subprocess.Popen([cxx, cxx_args, '-x', 'c++', '-std=c++14', '-'],
-                                 stdin=PIPE,
-                                 stdout=PIPE,
-                                 stderr=PIPE)
-@@ -216,8 +219,8 @@ def check_linker_need_libatomic():
-         return False
-     # Double-check to see if -latomic actually can solve the problem.
-     # https://github.com/grpc/grpc/issues/22491
--    cpp_test = subprocess.Popen(cxx +
--                                ['-x', 'c++', '-std=c++14', '-', '-latomic'],
-+    cpp_test = subprocess.Popen(
-+                                [cxx, cxx_args, '-x', 'c++', '-std=c++14', '-', '-latomic'],
-                                 stdin=PIPE,
-                                 stdout=PIPE,
-                                 stderr=PIPE)
---- a/src/python/grpcio/commands.py
-+++ b/src/python/grpcio/commands.py
-@@ -228,8 +228,10 @@ class BuildExt(build_ext.build_ext):
-             """
-             try:
-                 # TODO(lidiz) Remove the generated a.out for success tests.
--                cc = os.environ.get('CC', 'cc')
--                cc_test = subprocess.Popen([cc, '-x', 'c', '-std=c++14', '-'],
-+                cc_test, cc_args = os.environ.get('CC').split(' ', 1) or 'gcc'
-+                if not cc_args:
-+                    cc_args = "-g"
-+                cc_test = subprocess.Popen([cc_test, cc_args, '-x', 'c', '-std=c++14', '-'],
-                                            stdin=subprocess.PIPE,
-                                            stdout=subprocess.PIPE,
-                                            stderr=subprocess.PIPE)
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
index 918c6c860..a5e767029 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch
@@ -1,4 +1,4 @@
-From 4432b9a296c9c287dfe281b4d464dfd03e4eb721 Mon Sep 17 00:00:00 2001
+From 6ede7d01b18a4d9eeaccd25f5c1ab9985cb65307 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 12 Feb 2023 21:25:04 -0800
 Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
@@ -6,6 +6,7 @@ Subject: [PATCH] zlib: Include unistd.h for open/close C APIs
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  third_party/zlib/gzguts.h | 1 +
  1 file changed, 1 insertion(+)
@@ -22,6 +23,3 @@ index 57faf37..3c700c2 100644
  #include "zlib.h"
  #ifdef STDC
  #  include <string.h>
--- 
-2.39.1
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
index 4100cf63f..4bb60b6e2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -1,4 +1,7 @@
-An all-in-one patch that fixes several issues:
+From 9cec6297effa9fab6f0c71e342046daceecd7d4d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 13 Mar 2021 10:26:25 -0800
+Subject: [PATCH] An all-in-one patch that fixes several issues:
 
 1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
 2) powerpc stacktrace implementation only works on glibc (disabled on musl)
@@ -7,19 +10,21 @@ An all-in-one patch that fixes several issues:
 
 Sourced from void linux
 
+Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
----
-Upstream-Status: Pending
 
- absl/base/internal/unscaledcycleclock.cc    | 4 ++--
- absl/base/internal/unscaledcycleclock.h     | 3 ++-
- absl/debugging/internal/examine_stack.cc    | 8 +++++++-
- absl/debugging/internal/stacktrace_config.h | 2 +-
+---
+ .../abseil-cpp/absl/base/internal/unscaledcycleclock.cc   | 4 ++--
+ .../absl/base/internal/unscaledcycleclock_config.h        | 3 ++-
+ .../abseil-cpp/absl/debugging/internal/examine_stack.cc   | 8 +++++++-
+ .../absl/debugging/internal/stacktrace_config.h           | 2 +-
  4 files changed, 12 insertions(+), 5 deletions(-)
 
---- a/absl/base/internal/unscaledcycleclock.cc
-+++ b/absl/base/internal/unscaledcycleclock.cc
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
+index b1c396c..d62bfd6 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
  #include <intrin.h>
  #endif
@@ -38,8 +43,24 @@ Upstream-Status: Pending
  
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
---- a/absl/debugging/internal/examine_stack.cc
-+++ b/absl/debugging/internal/examine_stack.cc
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
+index 24b324a..5e232c1 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
+@@ -21,7 +21,8 @@
+ 
+ // The following platforms have an implementation of a hardware counter.
+ #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+-    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
++    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
++    defined(__riscv) ||     \
+     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
+ #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
+ #else
+diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
+index 5786322..72c7c46 100644
+--- a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
++++ b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
 @@ -33,6 +33,10 @@
  #include <csignal>
  #include <cstdio>
@@ -51,7 +72,7 @@ Upstream-Status: Pending
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc)
+@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -63,8 +84,10 @@ Upstream-Status: Pending
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
---- a/absl/debugging/internal/stacktrace_config.h
-+++ b/absl/debugging/internal/stacktrace_config.h
+diff --git a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
+index 3929b1b..23d5e50 100644
+--- a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
++++ b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
 @@ -60,7 +60,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
@@ -74,15 +97,3 @@ Upstream-Status: Pending
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
---- a/absl/base/internal/unscaledcycleclock_config.h
-+++ b/absl/base/internal/unscaledcycleclock_config.h
-@@ -21,7 +21,8 @@
- 
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
-+    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch b/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
deleted file mode 100644
index 088ce33fc..000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/mips_bigendian.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Upstream-Status: Pending
-
---- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
-+++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
-@@ -102,10 +102,10 @@ extern "C" {
- #elif (defined(__PPC__) || defined(__powerpc__))
- #define OPENSSL_32_BIT
- #define OPENSSL_PPC
--#elif defined(__MIPSEL__) && !defined(__LP64__)
-+#elif defined(__mips__) && !defined(__LP64__)
- #define OPENSSL_32_BIT
- #define OPENSSL_MIPS
--#elif defined(__MIPSEL__) && defined(__LP64__)
-+#elif defined(__mips__) && defined(__LP64__)
- #define OPENSSL_64_BIT
- #define OPENSSL_MIPS64
- #elif defined(__riscv) && __SIZEOF_POINTER__ == 8
diff --git a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
deleted file mode 100644
index 5dacc689f..000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/ppc-boringssl-support.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Let boringSSL compile on ppc32 bit
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/third_party/boringssl-with-bazel/src/include/openssl/base.h
-+++ b/third_party/boringssl-with-bazel/src/include/openssl/base.h
-@@ -96,6 +96,9 @@ extern "C" {
- #elif defined(__ARMEL__) || defined(_M_ARM)
- #define OPENSSL_32_BIT
- #define OPENSSL_ARM
-+#elif (defined(__PPC__) || defined(__powerpc__))
-+#define OPENSSL_32_BIT
-+#define OPENSSL_PPC
- #elif defined(__MIPSEL__) && !defined(__LP64__)
- #define OPENSSL_32_BIT
- #define OPENSSL_MIPS
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb
similarity index 63%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb
index c34391dd6..7b1631527 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.56.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.59.3.bb
@@ -6,15 +6,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
 DEPENDS += "${PYTHON_PN}-protobuf"
 
-SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch"
-SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
-                                file://mips_bigendian.patch \
-                                file://0001-Include-missing-cstdint-header.patch \
-                                file://abseil-ppc-fixes.patch;patchdir=third_party/abseil-cpp \
-                                file://0001-direct_mmap-Use-off_t-on-linux.patch;patchdir=third_party/abseil-cpp \
-                                file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
-"
-SRC_URI[sha256sum] = "0ff789ae7d8ddd76d2ac02e7d13bfef6fc4928ac01e1dcaa182be51b6bcc0aaa"
+SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
+           file://abseil-ppc-fixes.patch \
+           file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
+           "
+SRC_URI[sha256sum] = "7800f99568a74a06ebdccd419dd1b6e639b477dcaf6da77ea702f8fb14ce5f80"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.39.2


