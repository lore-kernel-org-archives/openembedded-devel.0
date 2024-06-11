Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16738C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:42:54 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.1896.1718131367236797617
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=EBI5yGOG;
 spf=pass (domain: konsulko.com, ip: 209.85.222.172, mailfrom: scott.murray@konsulko.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7955f3d4516so12425285a.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718131366; x=1718736166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ouBNmj81/FJ5QhcP0xcP266YNyamWLgVBMj90dKL9zo=;
        b=EBI5yGOGCnOe1ObrOQ5fxjRrBdExMl+ZgdxqfY2X6t/mHb4bw1a1vY1CKOSSS9uf5A
         uAkVDZZHJ4Cf9OfiRc/Ahf9lCtTZnPmUjxdGCXtAflrO705J96XHjhkKWztHWgzAlLbJ
         inKO9sT6VkLSkm+Ox/jt9f92XoToWK4zeRKN8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718131366; x=1718736166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ouBNmj81/FJ5QhcP0xcP266YNyamWLgVBMj90dKL9zo=;
        b=HTboGRUNhA2kIXr7xiBuSdz8QrytciNH64LTtZ2pb7SYhEpHIkT/wmEBiYXVAidEey
         j9PIbKsenTptha9gp0jDwUPL33+oR+JBqtWAIomcF7U0tgtPJCJGo5rbm+MMgbMgMB87
         IW0XNilsjGAXrlDH1l8atHbJw9UBgHPUNvo1/KbM5vrdbw2X9l86GxDQJOxaQUzfIzVI
         E3a5++txTakBgTbOH9Oxv3Sj4+540oe0s5BKFDUe18u7bIWDNqhi8ZsyQrJnsFoFvQ3i
         knord+T3+mHCsLvVRhbHFSjsAIeysULHc2iPxlgR0Yrp5ocla90FBLDfW6/++YIfHmbs
         HqCw==
X-Gm-Message-State: AOJu0Yx5m954Us/JrEHhcued+DK3Ytjavz41/6ltyZQL3eyw4H9mxG73
	mr0H1poDMf7F2zFzFw9EG3tolzGzS7Pl5kK8Pwk1KI+qwuIXHL3DBvPJfEfQiCUzazesn49J4DX
	U
X-Google-Smtp-Source: AGHT+IEcJhvlAa0arntTQIeijNAHtnGOb9NcuNjVZOOWVDjwz33dllCNrWggbOLmJz7A32gMVI4YaQ==
X-Received: by 2002:a05:6214:21ef:b0:6b0:5e5d:8d5 with SMTP id 6a1803df08f44-6b089ebd1c2mr57738626d6.8.1718131365517;
        Tue, 11 Jun 2024 11:42:45 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b07f5fa21asm21967366d6.4.2024.06.11.11.42.44
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:42:45 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][scarthgap][PATCH] abseil-cpp: backport RISC-V fix
Date: Tue, 11 Jun 2024 14:42:33 -0400
Message-ID: <20240611184233.1849346-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 18:42:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110831

Backport upstream fix[1] for SIGILL crash on RISC-V with 6.6 and
newer kernels.  The patch has been tweaked to apply on top of the
existing stack.

[1]: https://github.com/abseil/abseil-cpp/commit/7335a36d

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ...aledcycleclock-remove-RISC-V-support.patch | 82 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20240116.2.bb       |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
new file mode 100644
index 000000000..461df7a60
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
@@ -0,0 +1,82 @@
+From 7335a36d0b5c1c597566f9aa3f458a5b6817c3b4 Mon Sep 17 00:00:00 2001
+From: aurel32 <aurelien@aurel32.net>
+Date: Fri, 22 Mar 2024 14:21:13 -0700
+Subject: [PATCH] PR #1644: unscaledcycleclock: remove RISC-V support
+
+Imported from GitHub PR https://github.com/abseil/abseil-cpp/pull/1644
+
+Starting with Linux 6.6 [1], RDCYCLE is a privileged instruction on RISC-V and can't be used directly from userland. There is a sysctl option to change that as a transition period, but it will eventually disappear.
+
+The RDTIME instruction is another less accurate alternative, however its frequency varies from board to board, and there is currently now way to get its frequency from userland [2].
+
+Therefore this patch just removes the code for unscaledcycleclock on RISC-V. Without processor specific implementation, abseil relies on std::chrono::steady_clock::now().time_since_epoch() which is basically a wrapper around clock_gettime (CLOCK_MONOTONIC), which in turns use __vdso_clock_gettime(). On RISC-V this VDSO is just a wrapper around RDTIME correctly scaled to use nanoseconds units.
+
+This fixes the testsuite on riscv64, tested on a VisionFive 2 board.
+
+[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cc4c07c89aada16229084eeb93895c95b7eabaa3
+[2] https://github.com/abseil/abseil-cpp/pull/1631
+Merge 43356a2548cfde76e164d446cb69004b488c6a71 into 76f8011beabdaee872b5fde7546e02407b220cb1
+
+Merging this change closes #1644
+
+COPYBARA_INTEGRATE_REVIEW=https://github.com/abseil/abseil-cpp/pull/1644 from aurel32:rv64-no-unscaledcycleclock 43356a2548cfde76e164d446cb69004b488c6a71
+PiperOrigin-RevId: 618286262
+Change-Id: Ie4120a727e7d0bb185df6e06ea145c780ebe6652
+
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/7335a36d]
+[Adapted to apply on top of meta-oe's patch stack]
+Signed-off-by: Scott Murray <scott.murray@konsulko.com>
+---
+ absl/base/internal/unscaledcycleclock.cc       | 12 ------------
+ absl/base/internal/unscaledcycleclock_config.h |  5 ++---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
+index f11fecb3..103b4f6a 100644
+--- a/absl/base/internal/unscaledcycleclock.cc
++++ b/absl/base/internal/unscaledcycleclock.cc
+@@ -121,18 +121,6 @@ double UnscaledCycleClock::Frequency() {
+   return aarch64_timer_frequency;
+ }
+ 
+-#elif defined(__riscv)
+-
+-int64_t UnscaledCycleClock::Now() {
+-  int64_t virtual_timer_value;
+-  asm volatile("rdcycle %0" : "=r"(virtual_timer_value));
+-  return virtual_timer_value;
+-}
+-
+-double UnscaledCycleClock::Frequency() {
+-  return base_internal::NominalCPUFrequency();
+-}
+-
+ #elif defined(_M_IX86) || defined(_M_X64)
+ 
+ #pragma intrinsic(__rdtsc)
+diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
+index 5e232c1a..83552fc5 100644
+--- a/absl/base/internal/unscaledcycleclock_config.h
++++ b/absl/base/internal/unscaledcycleclock_config.h
+@@ -22,7 +22,6 @@
+ // The following platforms have an implementation of a hardware counter.
+ #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+     ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
+-    defined(__riscv) ||     \
+     defined(_M_IX86) || (defined(_M_X64) && !defined(_M_ARM64EC))
+ #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
+ #else
+@@ -54,8 +53,8 @@
+ #if ABSL_USE_UNSCALED_CYCLECLOCK
+ // This macro can be used to test if UnscaledCycleClock::Frequency()
+ // is NominalCPUFrequency() on a particular platform.
+-#if (defined(__i386__) || defined(__x86_64__) || defined(__riscv) || \
+-     defined(_M_IX86) || defined(_M_X64))
++#if (defined(__i386__) || defined(__x86_64__) || defined(_M_IX86) || \
++     defined(_M_X64))
+ #define ABSL_INTERNAL_UNSCALED_CYCLECLOCK_FREQUENCY_IS_CPU_FREQUENCY
+ #endif
+ #endif
+-- 
+2.44.0
+
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
index 2aef97391..87ab23931 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20240116.2.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
            file://abseil-ppc-fixes.patch \
            file://0003-Remove-neon-option-from-cross-compilation.patch \
+           file://0004-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.44.0


