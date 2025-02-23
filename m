Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72BD5C021B2
	for <webhook@archiver.kernel.org>; Sun, 23 Feb 2025 11:04:29 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.64403.1740308666840917611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Feb 2025 03:04:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=UAq3huZd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250223110423f9e61ae1b7ab8389ef-ci3c9i@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250223110423f9e61ae1b7ab8389ef
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 23 Feb 2025 12:04:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RsYmVtvDRGxeQyUJ0Npj5aZ8QmUhMJLPNsSVCHnw+8E=;
 b=UAq3huZd8dHROfC23D7h+1Nhnb2FNdIWJxrcqmknhASZ8FKOke55kPl+usENvGImHMc6eA
 ONgM4OZAu/lkXnHedSUxQVKziVWIwBu6vB7W82t2YVE4pMZ5fxAJg64N3hSyDiSA2K/q39Y5
 082c4/w6bY8OyEgRSDw18JDs9rPG+ercjjy6eyl2mlA7nTO0B6HCxZ6QJ0AUpAl71Mcr8wRl
 yLSAKa6sffiJqkLckBarB9qbEt3ydkhNimIY4uH1CGCcRNErE2lXvoUrEkPGQj3iZUf+nDfM
 brgQjWa7pS3tFo8MwHXzOYkcDnXrFPhw6qUMHAZ59MELhCobuI5jLunw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH] python3-grpcio: revert unbundling abseil-cpp
Date: Sun, 23 Feb 2025 12:03:35 +0100
Message-Id: <20250223110335.2594039-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Feb 2025 11:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115546

From: Peter Marko <peter.marko@siemens.com>

This reverts commit 990b03b6165808cebe59886e4941bb86b05744e2.

>>> import grpc
Traceback (most recent call last):
  File "<python-input-0>", line 1, in <module>
    import grpc
  File "/usr/lib/python3.13/site-packages/grpc/__init__.py", line 22, in <module>
    from grpc import _compression
  File "/usr/lib/python3.13/site-packages/grpc/_compression.py", line 20, in <module>
    from grpc._cython import cygrpc
ImportError: /usr/lib/python3.13/site-packages/grpc/_cython/cygrpc.cpython-313-x86_64-linux-gnu.so: undefined symbol: _ZN4absl12lts_2024072212log_internal17kUnsignedCharNullE

Even installing whole abseil-ccp does not solve this.
ldd on this library does not include libraries containing this symbol.
Some work in linking upstram would be needed.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-grpcio/abseil-ppc-fixes.patch     | 102 ++++++++++++++++++
 .../python/python3-grpcio_1.70.0.bb           |   9 +-
 2 files changed, 108 insertions(+), 3 deletions(-)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
new file mode 100644
index 0000000000..69e06a7918
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
@@ -0,0 +1,102 @@
+From a2ec96a96ff7ba016e800212a942b9f29f255415 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com> 
+Date: Sat, 13 Mar 2021 10:26:25 -0800
+Subject: [PATCH] An all-in-one patch that fixes several issues:
+
+1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
+2) powerpc stacktrace implementation only works on glibc (disabled on musl)
+3) powerpc stacktrace implementation has ppc64 assumptions (fixed)
+4) examine_stack.cpp makes glibc assumptions on powerpc (fixed)
+
+Sourced from void linux
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
+Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+---
+ .../abseil-cpp/absl/base/internal/unscaledcycleclock.cc   | 4 ++--
+ .../absl/base/internal/unscaledcycleclock_config.h        | 3 ++-
+ .../abseil-cpp/absl/debugging/internal/examine_stack.cc   | 8 +++++++-
+ .../absl/debugging/internal/stacktrace_config.h           | 2 +-
+ 4 files changed, 12 insertions(+), 5 deletions(-)
+
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
+index a0bf3a6..103b4f6 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
+@@ -20,7 +20,7 @@
+ #include <intrin.h>
+ #endif
+ 
+-#if defined(__powerpc__) || defined(__ppc__)
++#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
+ #ifdef __GLIBC__
+ #include <sys/platform/ppc.h>
+ #elif defined(__FreeBSD__)
+@@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
+   return base_internal::NominalCPUFrequency();
+ }
+ 
+-#elif defined(__powerpc__) || defined(__ppc__)
++#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
+ 
+ int64_t UnscaledCycleClock::Now() {
+ #ifdef __GLIBC__
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
+index 43a3dab..196a853 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
+@@ -21,7 +21,8 @@
+ 
+ // The following platforms have an implementation of a hardware counter.
+ #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+-    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
++    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
++    defined(_M_IX86) ||     \
+     (defined(_M_X64) && !defined(_M_ARM64EC))
+ #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
+ #else
+diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
+index 3dd6ba1..9f0601c 100644
+--- a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
++++ b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
+@@ -36,6 +36,10 @@
+ #include <csignal>
+ #include <cstdio>
+ 
++#if defined(__powerpc__)
++#include <asm/ptrace.h>
++#endif
++
+ #include "absl/base/attributes.h"
+ #include "absl/base/internal/raw_logging.h"
+ #include "absl/base/macros.h"
+@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
+     return reinterpret_cast<void*>(context->uc_mcontext.pc);
+ #elif defined(__powerpc64__)
+     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && defined(__GLIBC__)
+     return reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
++#elif defined(__powerpc__)
++    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->gregs[32]);
+ #elif defined(__riscv)
+     return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
+ #elif defined(__s390__) && !defined(__s390x__)
+diff --git a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
+index 3929b1b..23d5e50 100644
+--- a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
++++ b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
+@@ -60,7 +60,7 @@
+ #elif defined(__i386__) || defined(__x86_64__)
+ #define ABSL_STACKTRACE_INL_HEADER \
+   "absl/debugging/internal/stacktrace_x86-inl.inc"
+-#elif defined(__ppc__) || defined(__PPC__)
++#elif (defined(__ppc__) || defined(__PPC__)) && defined(__GLIBC__)
+ #define ABSL_STACKTRACE_INL_HEADER \
+   "absl/debugging/internal/stacktrace_powerpc-inl.inc"
+ #elif defined(__aarch64__)
+-- 
+2.43.0
+
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
index c9edc1d541..5af05ca2c9 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.70.0.bb
@@ -8,9 +8,11 @@ LIC_FILES_CHKSUM = " \
     file://third_party/xxhash/xxhash.h;beginline=1;endline=34;md5=d41d564db2353fc80a713956d85b1690 \
 "
 
-DEPENDS += "abseil-cpp c-ares openssl python3-protobuf re2 zlib"
+DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
 
-SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch"
+SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
+           file://abseil-ppc-fixes.patch \
+           "
 SRC_URI[sha256sum] = "8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56"
 
 RDEPENDS:${PN} = "python3-protobuf"
@@ -20,7 +22,8 @@ inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
-export GRPC_PYTHON_BUILD_SYSTEM_ABSL = "1"
+# unbundling abseil-cpp needs work on dynamic linker issue
+#export GRPC_PYTHON_BUILD_SYSTEM_ABSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_CARES = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_RE2 = "1"

