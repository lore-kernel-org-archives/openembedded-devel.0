Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 184DBD2C114
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:37:01 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web10.19608.1730817413875202399
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=B88DbBTJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e330f2e9fc0so3664709276.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817413; x=1731422213; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s9s8lcPPkqJry5wGna1SZq1+DA7h3BWyAiUrJKtfc6c=;
        b=B88DbBTJOOAdRKwrLY18odCjWoHw7KSStC6VPHyCj1yC2eOH2D5IN8bFH8Jy6iegxp
         dBrZ5k5I+cgFbYmEhuo+q1JSjaRjUdwmk0TZRpaPSMVkfzVPFMoa/QpMFsWSpJsvffe8
         qcfk50Mo/oEy2NZ5y/gPsigka7sGNeNnzIKzOqS4mbSGaqYO5OjB8nqGuvgub6TpUoZD
         AERDr4BSN2yK8kpp8VRClDcOJR1d1EylOcrSV1MghgeNWVxu8JujQQx4VcC2x64qC9Pw
         GOitz+xRGMBk81/6X0YYcxLoKVFIu+5smFeGQuZKfoEcfUBBkxPZ8FOZrNUCKZ/vkv19
         fYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817413; x=1731422213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s9s8lcPPkqJry5wGna1SZq1+DA7h3BWyAiUrJKtfc6c=;
        b=ss6VAvXXqDtahjNMM3ybegLRN0qTilSyOE3AhCw9vuPxLiMoGiH8SdU+n927xvJUc7
         7USlkfdFB2lJM9vZONMUbvJzzSxMjiU1MTVlM4IOSZ/Pd0VyGxHZJW5vT3m6lY78vlim
         ZyaEIgx2lqGyWlHGdrQ9HIQ0xCsPzB0whvMCKJACZqV2WJMEaLKva6VJKhu4I3c0czy1
         1exnefRR11zii2EExzTnSDCf+pk/ZniWiO642OTeKMiQRaPlT1ifjFsQ1UsJyu73h1yo
         R1/TI1eh0RJ9oru60SmxRkFZdFxMg2TrqdEMhm5GL/G/H0fxnHebygZoXjM2gKdakafk
         h3qw==
X-Gm-Message-State: AOJu0YzuUQgtHK69mBXVj3v5EurSthKkKiRclWCF1aGC5aeQ+lK4QvkU
	5rNV2UMgV04H2TpSzWu5Qi+OmxE2pNE+aUK5hQwUQLXMeSukviS4L44U7Q==
X-Google-Smtp-Source: AGHT+IGPxfaPGrM+7CmpIqya3mcePWuSoypXczI59spSixVZDZ7LX7dRaaW40YkOTL8Mh4x3hzktww==
X-Received: by 2002:a05:690c:b:b0:6e3:fb4:9333 with SMTP id 00721157ae682-6ea3b96aa99mr272030287b3.28.1730817412753;
        Tue, 05 Nov 2024 06:36:52 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:52 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 30/90] abseil-cpp: upgrade 20240116.2 -> 20240722.0
Date: Tue,  5 Nov 2024 09:34:55 -0500
Message-ID: <20241105143638.2301245-31-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:37:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113448

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:
https://github.com/abseil/abseil-cpp/releases/tag/20240722.0

* Drop backport patch:
  0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
* Refresh patches

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../0001-absl-always-use-asm-sgidefs.h.patch  |  7 +-
 ...e-maes-option-from-cross-compilation.patch | 17 ++--
 ...e-neon-option-from-cross-compilation.patch | 18 ++--
 ...aledcycleclock-remove-RISC-V-support.patch | 82 -------------------
 ...ixes.patch => 0004-abseil-ppc-fixes.patch} | 44 +++++++---
 ...20240116.2.bb => abseil-cpp_20240722.0.bb} |  7 +-
 6 files changed, 56 insertions(+), 119 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
 rename meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/{abseil-ppc-fixes.patch => 0004-abseil-ppc-fixes.patch} (69%)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20240116.2.bb => abseil-cpp_20240722.0.bb} (88%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
index 5242b29e06..6fecf25603 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
@@ -1,7 +1,7 @@
-From 738549dea7a4e6c462a79962c414eaa450c2cffd Mon Sep 17 00:00:00 2001
+From 11faa06436fdeb0c9948080a11f9a99d3b5ba16c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 9 Apr 2020 13:06:27 -0700
-Subject: [PATCH 1/3] absl: always use <asm/sgidefs.h>
+Subject: [PATCH] absl: always use <asm/sgidefs.h>
 
 Fixes mips/musl build, since sgidefs.h is not present on all C libraries
 but on linux asm/sgidefs.h is there and contains same definitions, using
@@ -10,13 +10,12 @@ that makes it portable.
 Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  absl/base/internal/direct_mmap.h | 6 +-----
  1 file changed, 1 insertion(+), 5 deletions(-)
 
 diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
-index e492bb0..c8a4fba 100644
+index 1beb2ee4..140b0697 100644
 --- a/absl/base/internal/direct_mmap.h
 +++ b/absl/base/internal/direct_mmap.h
 @@ -41,13 +41,9 @@
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
index b92a487523..d49e860f21 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
@@ -1,20 +1,19 @@
-From d25cf3b9aa873595a19e197cc29ab46c0093bff1 Mon Sep 17 00:00:00 2001
+From a573ccd57e713486e7d8e782d6b3b34fde01ff9e Mon Sep 17 00:00:00 2001
 From: Sinan Kaya <sinan.kaya@microsoft.com>
 Date: Mon, 3 Feb 2020 03:25:57 +0000
-Subject: [PATCH 2/3] Remove maes option from cross-compilation
+Subject: [PATCH] Remove maes option from cross-compilation
 
----
 Upstream-Status: Pending
-
+---
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
 
 diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
-index a4ab1aa2041e..23b9253c1f00 100644
+index da2282fe..5e0e8dfd 100644
 --- a/absl/copts/GENERATED_AbseilCopts.cmake
 +++ b/absl/copts/GENERATED_AbseilCopts.cmake
-@@ -158,7 +158,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
+@@ -229,7 +229,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
  list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
  )
  
@@ -23,10 +22,10 @@ index a4ab1aa2041e..23b9253c1f00 100644
 -    "-msse4.1"
 -)
 diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
-index a6efc98e11d4..1e847f769501 100644
+index b9e0071e..0072008c 100644
 --- a/absl/copts/GENERATED_copts.bzl
 +++ b/absl/copts/GENERATED_copts.bzl
-@@ -159,7 +159,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS = [
+@@ -230,7 +230,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS = [
  ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
  ]
  
@@ -35,5 +34,5 @@ index a6efc98e11d4..1e847f769501 100644
 -    "-msse4.1",
 -]
 -- 
-2.36.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
index 1a80a428b7..c82b9e1b51 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
@@ -1,24 +1,24 @@
-From fb24c3e3539b5743d398a429a302a3886186f261 Mon Sep 17 00:00:00 2001
+From 632632508daf8bb3a5800dac937ffc33c6d85973 Mon Sep 17 00:00:00 2001
 From: Jonas Gorski <jonas.gorski@bisdn.de>
 Date: Thu, 16 Jun 2022 11:46:31 +0000
-Subject: [PATCH 3/3] Remove neon option from cross compilation
+Subject: [PATCH] Remove neon option from cross compilation
 
 Not every arm platform supports neon instructions, so do not enforce
 them.
 
-Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
----
 Upstream-Status: Pending
 
+Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
+---
  absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
  absl/copts/GENERATED_copts.bzl         | 4 ----
  2 files changed, 8 deletions(-)
 
 diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
-index 23b9253c1f00..5d112a97f3e4 100644
+index 5e0e8dfd..57cfc4d3 100644
 --- a/absl/copts/GENERATED_AbseilCopts.cmake
 +++ b/absl/copts/GENERATED_AbseilCopts.cmake
-@@ -147,10 +147,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
+@@ -218,10 +218,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
      "/DNOMINMAX"
  )
  
@@ -30,10 +30,10 @@ index 23b9253c1f00..5d112a97f3e4 100644
      "-march=armv8-a+crypto"
  )
 diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
-index 1e847f769501..3e10db204faf 100644
+index 0072008c..72840fda 100644
 --- a/absl/copts/GENERATED_copts.bzl
 +++ b/absl/copts/GENERATED_copts.bzl
-@@ -148,10 +148,6 @@ ABSL_MSVC_TEST_FLAGS = [
+@@ -219,10 +219,6 @@ ABSL_MSVC_TEST_FLAGS = [
      "/DNOMINMAX",
  ]
  
@@ -45,5 +45,5 @@ index 1e847f769501..3e10db204faf 100644
      "-march=armv8-a+crypto",
  ]
 -- 
-2.36.1
+2.25.1
 
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
deleted file mode 100644
index 461df7a608..0000000000
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 7335a36d0b5c1c597566f9aa3f458a5b6817c3b4 Mon Sep 17 00:00:00 2001
-From: aurel32 <aurelien@aurel32.net>
-Date: Fri, 22 Mar 2024 14:21:13 -0700
-Subject: [PATCH] PR #1644: unscaledcycleclock: remove RISC-V support
-
-Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1644
-
-Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on RISC-V and can't be used directly from userland. There is a sysctl option to change that as a transition period, but it will eventually disappear.
-
-The RDTIME instruction is another less accurate alternative, however its frequency varies from board to board, and there is currently now way to get its frequency from userland [2].
-
-Therefore this patch just removes the code for unscaledcycleclock on RISC-V. Without processor specific implementation, abseil relies on std::chrono::steady_clock::now().time_since_epoch() which is basically a wrapper around clock_gettime (CLOCK_MONOTONIC), which in turns use __vdso_clock_gettime(). On RISC-V this VDSO is just a wrapper around RDTIME correctly scaled to use nanoseconds units.
-
-This fixes the testsuite on riscv64, tested on a VisionFive 2 board.
-
-[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cc4c07c89aada16229084eeb93895c95b7eabaa3
-[2] https://github.com/abseil/abseil-cpp/pull/1631
-Merge 43356a2548cfde76e164d446cb69004b488c6a71 into 76f8011beabdaee872b5fde7546e02407b220cb1
-
-Merging this change closes #1644
-
-COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1644 from aurel32:rv64-no-unscaledcycleclock 43356a2548cfde76e164d446cb69004b488c6a71
-PiperOrigin-RevId: 618286262
-Change-Id: Ie4120a727e7d0bb185df6e06ea145c780ebe6652
-
-Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/7335a36d]
-[Adapted to apply on top of meta-oe's patch stack]
-Signed-off-by: Scott Murray <scott.murray@konsulko.com>
----
- absl/base/internal/unscaledcycleclock.cc       | 12 ------------
- absl/base/internal/unscaledcycleclock_config.h |  5 ++---
- 2 files changed, 2 insertions(+), 15 deletions(-)
-
-diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
-index f11fecb3..103b4f6a 100644
---- a/absl/base/internal/unscaledcycleclock.cc
-+++ b/absl/base/internal/unscaledcycleclock.cc
-@@ -121,18 +121,6 @@ double UnscaledCycleClock::Frequency() {
-   return aarch64_timer_frequency;
- }
- 
--#elif defined(__riscv)
--
--int64_t UnscaledCycleClock::Now() {
--  int64_t virtual_timer_value;
--  asm volatile("rdcycle %0" : "=r"(virtual_timer_value));
--  return virtual_timer_value;
--}
--
--double UnscaledCycleClock::Frequency() {
--  return base_internal::NominalCPUFrequency();
--}
--
- #elif defined(_M_IX86) || defined(_M_X64)
- 
- #pragma intrinsic(__rdtsc)
-diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
-index 5e232c1a..83552fc5 100644
---- a/absl/base/internal/unscaledcycleclock_config.h
-+++ b/absl/base/internal/unscaledcycleclock_config.h
-@@ -22,7 +22,6 @@
- // The following platforms have an implementation of a hardware counter.
- #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
-     ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
--    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
- #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
- #else
-@@ -54,8 +53,8 @@
- #if ABSL_USE_UNSCALED_CYCLECLOCK
- // This macro can be used to test if UnscaledCycleClock::Frequency()
- // is NominalCPUFrequency() on a particular platform.
--#if (defined(__i386__) || defined(__x86_64__) || defined(__riscv) || \
--     defined(_M_IX86) || defined(_M_X64))
-+#if (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) || \
-+     defined(_M_X64))
- #define ABSL_INTERNAL_UNSCALED_CYCLECLOCK_FREQUENCY_IS_CPU_FREQUENCY
- #endif
- #endif
--- 
-2.44.0
-
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
similarity index 69%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
index f2ebd9f08c..ba0cd66920 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
@@ -1,4 +1,7 @@
-Upstream-Status: Pending
+From f9607924225ca59fb6c60222e6424b84e6f70029 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 21 Sep 2024 20:53:06 +0800
+Subject: [PATCH] abseil: ppc fixes
 
 An all-in-one patch that fixes several issues:
 
@@ -9,14 +12,24 @@ An all-in-one patch that fixes several issues:
 
 Sourced from void linux
 
+Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/base/internal/unscaledcycleclock.cc       | 4 ++--
+ absl/base/internal/unscaledcycleclock_config.h | 3 ++-
+ absl/debugging/internal/examine_stack.cc       | 8 +++++++-
+ absl/debugging/internal/stacktrace_config.h    | 2 +-
+ 4 files changed, 12 insertions(+), 5 deletions(-)
 
+diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
+index a0bf3a65..103b4f6a 100644
 --- a/absl/base/internal/unscaledcycleclock.cc
 +++ b/absl/base/internal/unscaledcycleclock.cc
 @@ -20,7 +20,7 @@
  #include <intrin.h>
  #endif
-
+ 
 -#if defined(__powerpc__) || defined(__ppc__)
 +#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
  #ifdef __GLIBC__
@@ -25,30 +38,34 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 @@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
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
+diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
+index 43a3dabe..196a8535 100644
 --- a/absl/base/internal/unscaledcycleclock_config.h
 +++ b/absl/base/internal/unscaledcycleclock_config.h
 @@ -21,7 +21,8 @@
-
+ 
  // The following platforms have an implementation of a hardware counter.
  #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
--    defined(__powerpc__) || defined(__ppc__) || defined(__riscv) ||     \
+-    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
 +    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
-+    defined(__riscv) ||     \
-     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
++    defined(_M_IX86) ||     \
+     (defined(_M_X64) && !defined(_M_ARM64EC))
  #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
  #else
+diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
+index 3dd6ba1a..f923b055 100644
 --- a/absl/debugging/internal/examine_stack.cc
 +++ b/absl/debugging/internal/examine_stack.cc
-@@ -33,6 +33,10 @@
+@@ -36,6 +36,10 @@
  #include <csignal>
  #include <cstdio>
-
+ 
 +#if defined(__powerpc__)
 +#include <asm/ptrace.h>
 +#endif
@@ -56,7 +73,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #include "absl/base/attributes.h"
  #include "absl/base/internal/raw_logging.h"
  #include "absl/base/macros.h"
-@@ -174,8 +178,10 @@ void* GetProgramCounter(void* const vuc) {
+@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
      return reinterpret_cast<void*>(context->uc_mcontext.pc);
  #elif defined(__powerpc64__)
      return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
@@ -68,6 +85,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #elif defined(__riscv)
      return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
  #elif defined(__s390__) && !defined(__s390x__)
+diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
+index 3929b1b7..23d5e504 100644
 --- a/absl/debugging/internal/stacktrace_config.h
 +++ b/absl/debugging/internal/stacktrace_config.h
 @@ -60,7 +60,7 @@
@@ -79,3 +98,6 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  #define ABSL_STACKTRACE_INL_HEADER \
    "absl/debugging/internal/stacktrace_powerpc-inl.inc"
  #elif defined(__aarch64__)
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
similarity index 88%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
index 87ab239311..f44a5d9082 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
@@ -7,14 +7,13 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 
-SRCREV = "d7aaad83b488fd62bd51c81ecf16cd938532cc0a"
-BRANCH = "lts_2024_01_16"
+SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
+BRANCH = "lts_2024_07_22"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
-           file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
-           file://0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
+           file://0004-abseil-ppc-fixes.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.43.0


