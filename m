Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23201C43217
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:21 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.25695.1651346356505460646
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kLCPZ8Nl;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id z16so9473797pfh.3
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=QmZhHyCkKs4NGqJe5P4hki0HcQb2hIlx5jLcHSE6sTk=;
        b=kLCPZ8Nl9R59Qq7JCdjDlHjcAV9AEeLr5ssqCn484Fxo8iw5H4BOXrp0EdHrR/2c6h
         0mbr8gX2+KT0dU8imLuFlj4+TVnUfk6QCbNuBPGIIbGzAIR89mZiggqhzPM3pMJqG7Wq
         TuUpoGdCtYr7WDNUztTlFINBmT4AgqMpYbPBCW7JV/e8cTygJhzA373HEf5Xb/DhbfdO
         fmMpv25+e/sMJIPqpGfPaqGFyunkC+cg7leht0JmW4YfyZC0lDUCgk5qOal7jAyJAnLC
         PELE+ef+xVwfgF76nexitkyQs+6Rsru4bQgC51zUYxvLYkdiG3eX7yEwJTdZ8vbHiBYv
         dcCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QmZhHyCkKs4NGqJe5P4hki0HcQb2hIlx5jLcHSE6sTk=;
        b=xrd+0amuoQu6P9dyDyjHZ2bX0GUvR7jHllbLtSajrLv5j6KP3ChaZDRh182njj+zMT
         4kRiKPjh+9mqSdLsgZ749Xto8dJFciuKZksSibyG1N2ZgDkklf7fx88oni07EqWiT1C8
         53nOThhfOTQDQozNTwkrhqC/SJtiih9tmKVeIMoUE0uKH2XHNxhTh6yeKp4uf9+mAAEH
         JF1AEE+SZbdBW8bhLSNjHdoPvx5gXcRxwjZ8LKy7V/g0KpfXJL3Mrwh8bgWgMLCwzdmQ
         XC7FquiK39LDv4dQff+XGFCIw6dWrzga+rPhe1yPgdNWAR6Qhe2+7+bJJYxOs2JhHrnl
         Ii7w==
X-Gm-Message-State: AOAM532GuXeQPbmpWj2XEETmquSJDnNXRSYlhSA2xReWKRrXlBBxlD8t
	X2C2hcv1K57Vn26GgXurc90WsSp3bVB7vQ==
X-Google-Smtp-Source: 
 ABdhPJzB0/IP6XqQYIXP+pFOwFulfd4x+RMMIvdYPqzEa666oNS9P6q7TPcVH4BxtOCG3BHsp52G4g==
X-Received: by 2002:a05:6a00:16c7:b0:4f7:e497:69c7 with SMTP id
 l7-20020a056a0016c700b004f7e49769c7mr4707142pfc.7.1651346355703;
        Sat, 30 Apr 2022 12:19:15 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.14
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 31/39] absil-cpp: Update SRC_URI to to the latest google
 internal sync
Date: Sat, 30 Apr 2022 12:18:11 -0700
Message-Id: 
 <cfe7723862ce866c86fb3ca4a711fdc0ea1e25f5.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96898

From: Willy Tu <wltu@google.com>

https://github.com/abseil/abseil-cpp/commit/7c6608d0dbe43cf9bdf7f77787bc6bc89cc42f8b

The internal sync are tested within Google and ready for use.

Signed-off-by: Willy Tu <wltu@google.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 3c1c07e9a5477df68bfa1f739b38f10a5e78b07e)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../abseil-cpp/abseil-ppc-fixes.patch         | 20 +++++++++----------
 .../abseil-cpp/abseil-cpp_git.bb              |  4 ++--
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
index 95210565c2..ef3f50d9e7 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
@@ -14,39 +14,39 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 @@ -20,7 +20,7 @@
  #include <intrin.h>
  #endif
- 
+
 -#if defined(__powerpc__) || defined(__ppc__)
 +#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
  #ifdef __GLIBC__
  #include <sys/platform/ppc.h>
  #elif defined(__FreeBSD__)
-@@ -59,7 +59,7 @@ double UnscaledCycleClock::Frequency() {
+@@ -53,7 +53,7 @@ double UnscaledCycleClock::Frequency() {
    return base_internal::NominalCPUFrequency();
  }
- 
+
 -#elif defined(__powerpc__) || defined(__ppc__)
 +#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
- 
+
  int64_t UnscaledCycleClock::Now() {
  #ifdef __GLIBC__
 --- a/absl/base/internal/unscaledcycleclock.h
 +++ b/absl/base/internal/unscaledcycleclock.h
 @@ -46,7 +46,8 @@
- 
+
  // The following platforms have an implementation of a hardware counter.
  #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
 -    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
 +    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
 +    defined(__riscv) ||     \
-     defined(_M_IX86) || defined(_M_X64)
+     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
 --- a/absl/debugging/internal/examine_stack.cc
 +++ b/absl/debugging/internal/examine_stack.cc
-@@ -27,6 +27,10 @@
+@@ -33,6 +33,10 @@
  #include <csignal>
  #include <cstdio>
- 
+
 +#if defined(__powerpc__)
 +#include <asm/ptrace.h>
 +#endif
@@ -54,7 +54,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -63,8 +67,10 @@ void* GetProgramCounter(void* vuc) {
+@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -68,7 +68,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #elif defined(__s390__) && !defined(__s390x__)
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
-@@ -59,7 +59,7 @@
+@@ -60,7 +60,7 @@
  #elif defined(__i386__) || defined(__x86_64__)
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_x86-inl.inc"
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 82124c1083..1bb27d4369 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -8,8 +8,8 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
 PV = "20211102.0+git${SRCPV}"
-SRCREV = "215105818dfde3174fe799600bb0f3cae233d0bf"
-BRANCH = "lts_2021_11_02"
+SRCREV = "7c6608d0dbe43cf9bdf7f77787bc6bc89cc42f8b"
+BRANCH = "master"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-- 
2.25.1


