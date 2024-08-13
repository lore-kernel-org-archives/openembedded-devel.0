Return-Path: <scott.murray@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F516C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:40:44 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.76909.1723567234157632766
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=pPqroZUX;
 spf=pass (domain: konsulko.com, ip: 209.85.160.181, mailfrom: scott.murray@konsulko.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-44febbc323fso31903931cf.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 09:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723567233; x=1724172033; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w30T2bkbmaFmRd+e3ATGeNWwu5vSmFLHDPj8/aD7zGU=;
        b=pPqroZUXEPXhrm7IZfAl08kwXPX9szM3O6UTylzIyi1SINb1XddELn7iqI1Q3FDlnn
         9vQb6DmZDqADL7O6Pfx036sdnWLEy8stukPqaj+CZ7m8mUbz3rKyFFzYn8OXhfOvVCKa
         VqslKYzeq69CuWtoJIz1s9Em1JWRhSvNw+ds8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723567233; x=1724172033;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w30T2bkbmaFmRd+e3ATGeNWwu5vSmFLHDPj8/aD7zGU=;
        b=AFgwANB2Cd/9l4amh/mWdAvfAFl0ID2a2/uG66EkiHyhVWDoE3BsUgk4MX18V5emAh
         uGo0MRZdvBHZMf8Vl253/MpBg/thgE7yyDjxN7Pgoy8xZkxJoMTMrHw0bgNf40/KY/xo
         UUpBpVHdNRnrZPmV80aHdb26/D+47Z0slD0ylayi5+UmZWLjF/h0wAgE6y2INqKRCH5U
         u4eQhAJqn8dVZhrYrGIKaa5N6vR/1DJVe0T3hyYhtm1WH80PV0ri/jXqjAVfwNpbq6N+
         8HLWW1iHS28WJ4/gfrNX56zYn6dosIqcXIIuhhPaS4UVZSXj+rmAXamizkDwKbpvEKM9
         s2Ug==
X-Gm-Message-State: AOJu0Yw3cF+bi/JTa8cS9Si11vtXMaRe4Q3kZMiwFc2oP7MI/f84NrKI
	LTEn8BpMaIZHEH4tfdggfBJPuGjCiu87XIRQLVrXL5BJp2qi9/PiHhyz3R4tP/gTYo+5wtq8NhY
	M
X-Google-Smtp-Source: AGHT+IHfrPqZib4rKPGg4dU3/ybQFfa2Q2InCkqypMQDwZjEwVhgxIB7RTVnDwjlUZVQZglgstYk+Q==
X-Received: by 2002:a05:620a:4085:b0:79f:5d5:1bc1 with SMTP id af79cd13be357-7a4ee409a9amr14384085a.58.1723567232814;
        Tue, 13 Aug 2024 09:40:32 -0700 (PDT)
Received: from ghidorah.spiteful.org (107-179-213-3.cpe.teksavvy.com. [107.179.213.3])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7e01fb5sm353705185a.99.2024.08.13.09.40.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:40:32 -0700 (PDT)
From: Scott Murray <scott.murray@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Scott Murray <scott.murray@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][scarthgap][PATCH v2 2/2] python3-grpcio: backport abseil-cpp RISC-V fix
Date: Tue, 13 Aug 2024 12:39:55 -0400
Message-ID: <20240813163955.1683925-3-scott.murray@konsulko.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240813163955.1683925-1-scott.murray@konsulko.com>
References: <20240813163955.1683925-1-scott.murray@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Aug 2024 16:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111795

Backport upstream abseil-cpp fix[1] for SIGILL crash on RISC-V with
6.6 and newer kernels.  The patch has been tweaked to apply on top
of the existing patch stack to the vendored copy of abseil-cpp.

[1]: https://github.com/abseil/abseil-cpp/commit/7335a36d

(cherry-picked from 080287ebe1f6958088871194f8ae5674edd41589)

Signed-off-by: Scott Murray <scott.murray@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
2.45.2


