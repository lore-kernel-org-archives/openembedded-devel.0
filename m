Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF267C27C65
	for <webhook@archiver.kernel.org>; Tue, 11 Jun 2024 18:43:03 +0000 (UTC)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
 by mx.groups.io with SMTP id smtpd.web10.1946.1718131378839643286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 11:42:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=qdzz534X;
 spf=pass (domain: konsulko.com, ip: 209.85.222.49, mailfrom: scott.murray@konsulko.com)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-80b8d45e6b7so963866241.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 11:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1718131377; x=1718736177; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=FX7MLh1x9JS2iHnqG/YTsV2OCIF7Pq220MwJbzaxQZA=;
        b=qdzz534XZ7gla9mU4fSqzlqspiSSxqdpCtzAaJMo+GKGldgxpdIHi8T2vBA2D8mcxy
         lAWhTRRGNS5r7B1v2kBdyva2Jtqh9Lqe46MgSY1ZDt7G826oYUJ55QvylJHOXRaOSX6Q
         0F/d9YwmmalRnM3FmOkVC8CKyQfSJASrIuR28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718131377; x=1718736177;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FX7MLh1x9JS2iHnqG/YTsV2OCIF7Pq220MwJbzaxQZA=;
        b=a1RMi22cU6hR25o6QnGeBVJhY5GCNfw+DOsSE0NZSciJAx6FJCR2yjk4T4w7OwZaVd
         4YH0Kr68ChDRetV6zC/hHntwrYKJCKaa3XodUFFfacS4IiGie8+OffmdsG9InURsQBi6
         WdBakT32HVFBLNTLBO3+Zb/wXuHB/+i8HC0zf/2kxFnJ2gfmGpnH7QJ+WaoKew2onMCN
         unI1hLjPZTR6b1lTOQWiCrUrFbTjlKAh5ECKmpJVgnldAntxxQsPfh0P0E2/66S2BIWb
         4pjTrc2CejgMUPP21grqcvNCz/qKRC/mkBPNOKxbVPAAeLr2fiyxGNGPPGHnTswIDYEN
         aQTw==
X-Gm-Message-State: AOJu0Yw+r/Svq+cpxKbq5nr3C0KHlgwlRCs4MSghAQC8o93jV2XPUCkQ
	RwcHZDY9w3EcjklJLTwFqYWMgRKvt2qZh6SSi2sR85r41i9k147PBPbMaFBRCvFHF4RHNYELHYj
	S
X-Google-Smtp-Source: AGHT+IEYa95fNDoGodMoGmiT9g1fdwpU00B2oIQA2skv9kdOynVipP+/9sGtj9fYmq29NeS0gD7O8A==
X-Received: by 2002:a67:fbda:0:b0:47a:231a:3856 with SMTP id ada2fe7eead31-48c275deb29mr15158541137.16.1718131376961;
        Tue, 11 Jun 2024 11:42:56 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7954e1be2a3sm386217985a.38.2024.06.11.11.42.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 11:42:56 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH] python3-grpcio: backport abseil-cpp RISC-V fix
Date: Tue, 11 Jun 2024 14:42:53 -0400
Message-ID: <20240611184253.1849357-1-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jun 2024 18:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110832

Backport upstream abseil-cpp fix[1] for SIGILL crash on RISC-V with
6.6 and newer kernels.  The patch has been tweaked to apply on top
of the existing patch stack to the vendored copy of abseil-cpp.

[1]: https://github.com/abseil/abseil-cpp/commit/7335a36d

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
---
 ...aledcycleclock-remove-RISC-V-support.patch | 82 +++++++++++++++++++
 .../python/python3-grpcio_1.62.2.bb           |  1 +
 2 files changed, 83 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch

diff --git a/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch b/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
new file mode 100644
index 000000000..82f15f88c
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-grpcio/0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch
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
+ .../absl/base/internal/unscaledcycleclock.cc         | 12 ------------
+ .../absl/base/internal/unscaledcycleclock_config.h   |  5 ++---
+ 2 files changed, 2 insertions(+), 15 deletions(-)
+
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
+index f11fecb..103b4f6 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock.cc
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
+diff --git a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
+index 5e232c1..83552fc 100644
+--- a/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
++++ b/third_party/abseil-cpp/absl/base/internal/unscaledcycleclock_config.h
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
diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
index 47f3b2ea2..59bfbf553 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.62.2.bb
@@ -11,6 +11,7 @@ SRC_URI += "file://0001-Include-missing-cstdint-header.patch \
            file://0001-zlib-Include-unistd.h-for-open-close-C-APIs.patch \
            file://0001-crypto-use-_Generic-only-if-defined-__cplusplus.patch;patchdir=third_party/boringssl-with-bazel/src/ \
            file://0001-target.h-define-proper-macro-for-ppc-ppc64.patch \
+           file://0001-PR-1644-unscaledcycleclock-remove-RISC-V-support.patch \
            "
 SRC_URI[sha256sum] = "c77618071d96b7a8be2c10701a98537823b9c65ba256c0b9067e0594cdbd954d"
 
-- 
2.44.0


