Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E57EC02199
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 19:20:27 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.50461.1738869618334894397
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Feb 2025 11:20:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=G1niRmif;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-2025020619201691e5ccb88a3889c789-zs9xoj@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 2025020619201691e5ccb88a3889c789
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 06 Feb 2025 20:20:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=dZ6TE/mbttZ6t2uYQ/BmaoRRPrecX66R+QfqJTIWn+0=;
 b=G1niRmifsUXaMqsNv+u+0jlNuN+HpaZMq1aNXTV3okex9666CZTopEaMHV77nQAtGsPUdA
 XG2KDwfNuuWpPMqyjmW8Qw/P1ggEgFne1QHgXsqqCgFAGI/KUo3u/wbCjH2RoGyJ+uF0nJbM
 ikz81hCHa0vAgg+SY/cFd1d9tcLIr8aUGCJlQfvTdVKBWvRvmrAkHwZe5IzSbNNftWCn9fUe
 HdlSV3TkSluAvBVMW02RoV+4dQcHnPKSIdkocON+I1C58bCt62Vvy+GvZCjuHQcREKP1SdKT
 4Q+UE4wj70pYuQQdJ6lkYF78n4V5BYzCdE5fa/1OAcrJtjukXBuL7vxQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][PATCH 7/9] python3-grpcio: use system abseil-cpp
Date: Thu,  6 Feb 2025 20:19:01 +0100
Message-Id: <20250206191903.2324783-7-peter.marko@siemens.com>
In-Reply-To: <20250206191903.2324783-1-peter.marko@siemens.com>
References: <20250206191903.2324783-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 06 Feb 2025 19:20:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115299

From: Peter Marko <peter.marko@siemens.com>

This also allows to remove a custom patch to maintain and corrects
license, SPDX and CVE handling.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../python3-grpcio/abseil-ppc-fixes.patch     | 102 ------------------
 .../python/python3-grpcio_1.69.0.bb           |   7 +-
 2 files changed, 3 insertions(+), 106 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch b/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
deleted file mode 100644
index 69e06a7918..0000000000
--- a/meta-python/recipes-devtools/python/python3-grpcio/abseil-ppc-fixes.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From a2ec96a96ff7ba016e800212a942b9f29f255415 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com> 
-Date: Sat, 13 Mar 2021 10:26:25 -0800
-Subject: [PATCH] An all-in-one patch that fixes several issues:
-
-1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
-2) powerpc stacktrace implementation only works on glibc (disabled on musl)
-3) powerpc stacktrace implementation has ppc64 assumptions (fixed)
-4) examine_stack.cpp makes glibc assumptions on powerpc (fixed)
-
-Sourced from void linux
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- .../abseil-cpp/absl/base/internal/unscaledcycleclock.cc   | 4 ++--
- .../absl/base/internal/unscaledcycleclock_config.h        | 3 ++-
- .../abseil-cpp/absl/debugging/internal/examine_stack.cc   | 8 +++++++-
- .../absl/debugging/internal/stacktrace_config.h           | 2 +-
- 4 files changed, 12 insertions(+), 5 deletions(-)
-
-diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-index a0bf3a6..103b4f6 100644
---- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-+++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
-@@ -20,7 +20,7 @@
- #include <intrin.h>
- #endif
- 
--#if defined(__powerpc__) || defined(__ppc__)
-+#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
- #ifdef __GLIBC__
- #include <sys/platform/ppc.h>
- #elif defined(__FreeBSD__)
-@@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
-   return base_internal::NominalCPUFrequency();
- }
- 
--#elif defined(__powerpc__) || defined(__ppc__)
-+#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
- 
- int64_t UnscaledCycleClock::Now() {
- #ifdef __GLIBC__
-diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-index 43a3dab..196a853 100644
---- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-+++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
-@@ -21,7 +21,8 @@
- 
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
-+    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(_M_IX86) ||     \
-     (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
-diff --git a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-index 3dd6ba1..9f0601c 100644
---- a/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-+++ b/third_party/abseil-cpp/absl/debugging/internal/examine_stack.cc
-@@ -36,6 +36,10 @@
- #include <csignal>
- #include <cstdio>
- 
-+#if defined(__powerpc__)
-+#include <asm/ptrace.h>
-+#endif
-+
- #include "absl/base/attributes.h"
- #include "absl/base/internal/raw_logging.h"
- #include "absl/base/macros.h"
-@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
-     return reinterpret_cast<void*>(context->uc_mcontext.pc);
- #elif defined(__powerpc64__)
-     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
--#elif defined(__powerpc__)
-+#elif defined(__powerpc__) && defined(__GLIBC__)
-     return reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
-+#elif defined(__powerpc__)
-+    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->gregs[32]);
- #elif defined(__riscv)
-     return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
- #elif defined(__s390__) && !defined(__s390x__)
-diff --git a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-index 3929b1b..23d5e50 100644
---- a/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-+++ b/third_party/abseil-cpp/absl/debugging/internal/stacktrace_config.h
-@@ -60,7 +60,7 @@
- #elif defined(__i386__) || defined(__x86_64__)
- #define ABSL_STACKTRACE_INL_HEADER \
-   "absl/debugging/internal/stacktrace_x86-inl.inc"
--#elif defined(__ppc__) || defined(__PPC__)
-+#elif (defined(__ppc__) || defined(__PPC__)) && defined(__GLIBC__)
- #define ABSL_STACKTRACE_INL_HEADER \
-   "absl/debugging/internal/stacktrace_powerpc-inl.inc"
- #elif defined(__aarch64__)
--- 
-2.43.0
-
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
index f70582ea41..26d7564590 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.69.0.bb
@@ -4,11 +4,9 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0 & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731e401b36f8077ae0c134b59be5c906"
 
-DEPENDS += "c-ares openssl python3-protobuf re2 zlib"
+DEPENDS += "abseil-cpp c-ares openssl python3-protobuf re2 zlib"
 
-SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch \
-           file://abseil-ppc-fixes.patch \
-           "
+SRC_URI += "file://0001-python-enable-unbundled-cross-compilation.patch"
 SRC_URI[sha256sum] = "936fa44241b5379c5afc344e1260d467bee495747eaf478de825bab2791da6f5"
 
 RDEPENDS:${PN} = "python3-protobuf"
@@ -18,6 +16,7 @@ inherit pypi
 
 CFLAGS:append:libc-musl = " -D_LARGEFILE64_SOURCE"
 
+export GRPC_PYTHON_BUILD_SYSTEM_ABSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_CARES = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_OPENSSL = "1"
 export GRPC_PYTHON_BUILD_SYSTEM_RE2 = "1"

