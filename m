Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D426DC4450A
	for <webhook@archiver.kernel.org>; Sun, 28 Jun 2026 16:22:40 +0000 (UTC)
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20730.1782663760470600692
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Jun 2026 09:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rJB1nUpH;
 spf=pass (domain: gmail.com, ip: 74.125.82.53, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-139a5f4ca15so2923492c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 09:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782663760; x=1783268560; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UA8mgpSCw2jonE+Q7R3rF0Y3wgfpX5AQ7my2PINmOJI=;
        b=rJB1nUpH7XA/gzZKVE3b1seWaUNyio6BJkuRDdQ0J/JwoiTqZW2lPiK0hoMx/xxOrI
         XV7Y8YjRlbFldwbj2WF3lr3oVf8OLI4ONIxcSX5mUDk+GdebZBuAFwLjSeovx/Vo2yQ2
         WJFJWPHGwq6FXu2p24ijrYYqeMAp6CHuFhDK7nSAgi4JBC4R0Adxp0wC+NXJDdAjkvza
         4uq6fPb1QRtP/BK1NHGQxqLyWecN1uFm9wjjBeplrJRRzK1bLBTf8kcdrM4b1dwDePN1
         8CWaxHEqz73Vcta32666DauWhJVClUmX7u0jTGN2P9stPF2zwxHvPiRSMKyzwmFRq3me
         AKDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782663760; x=1783268560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UA8mgpSCw2jonE+Q7R3rF0Y3wgfpX5AQ7my2PINmOJI=;
        b=pb2imSYqA0H78QNTA9gFhEE6LJQCG+XyJgLw0P7hH8oydUFbyVoL7XXUL5+Cv8OJ2e
         z9H7u8Tjd9+Sol0mbC5QeHBejjZysRLl3q2mPks70eb0RBYGGBLyxXUrP5P3/cpd0pki
         6Bcl2Tu42q0YLvM2d9kvk4n0RzbnuOl8xw7IMxY2pqiy3uBMysjj/qVzE6BA9M3RiIen
         XFpKCvVUvCzLu88I/6xC48cCP3F5c/zNeXiEnpcBgJg/6t0DklhfDedrqJLMM0yTao6H
         l2139233QSYOoKEZmJhM+9IvigGECBebx31CbZ3UAMlT4tkN0fScVdeJA8fnuaX1aHGA
         Qd4Q==
X-Gm-Message-State: AOJu0YwfvlXW1/89/PjMlVKMjejt7OYxN8NAAcSNDBt28lvGNA1Hin+a
	byjtNzq9XofXFnffoy2B0Gcvjw38kPGqMaTKJLTrpUQe3w6/uFzn0w0+alwFJqSvoq+XKQ==
X-Gm-Gg: AfdE7cn2WjnOmqaVaqY2s8qYaLhVfCb6JbYqS6QQYjlQFEjtriprYGAeoHoPFbvw3xq
	jbOwcGRMNullWOMacmgtOAp9hP6fgeZ2hM7531GMZHmI6fXmxV6PFwjikFhAK94c0VoYj3mot9M
	/PUWfhC2vLCk6vFN9sQxdLs12CK5XPHV3xKopz9g1iCfPx4403IES0bj4Ar8jC7MJGkcdAx32xi
	phzBlzcxK0kE/I6OFxm4o2UGGJD6M0Ppd9pSQXl/tH+mFPnZsaz1eM4rAhu5ltZVDnOz04T/QTX
	b66kTDqGGeGVvoRLIWsXWiX4orZDklkTCiYAYgdtNtFCeP8GlCBFVcR0jjH6jQ7ogS1nv+SUht8
	zKvFuAdJSZqn61Rl7vA+gNyGMuHPmFYJx9IDK1axsTWeCKV/DzVwMkKC+iY4Ht/FSOgABDRipTX
	4yE84EnpIwxpdIiWrhkcNhTzREnWv5v5GL75D/zryVsB+/XN4aOiPqx6FzYBqHowloUxnlG4sSb
	qgIgJPEftc0SDlTGmieLDi42aRw25HOs0UXpZCKKGVMd4wbNqLVXa9Hrfjkx/eFl0/3gTK6k/ce
	k6xdDh8WGuw/WtkPqgH9znO9O6VT2A==
X-Received: by 2002:a05:7300:4342:b0:30c:2d3d:7838 with SMTP id 5a478bee46e88-30c850a51f2mr12313532eec.31.1782663759808;
        Sun, 28 Jun 2026 09:22:39 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c52c591sm49849445eec.7.2026.06.28.09.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 09:22:39 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 114/128] abseil-cpp: fix clang build with BMI2
Date: Sun, 28 Jun 2026 09:22:08 -0700
Message-ID: <20260628162222.4081517-14-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
References: <20260628162222.4081517-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 28 Jun 2026 16:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127924

Clang errors on a direct include of <bmi2intrin.h>

'Never use <bmi2intrin.h> directly; include <immintrin.h> instead.'

 hit whenever __BMI2__ is defined.

Backport the upstream fix to include the umbrella <immintrin.h>
header guarded by an x86 check.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lude-immintrin.h-instead-of-bmi2intr.patch | 36 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_20260526.0.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
new file mode 100644
index 0000000000..38eba684d9
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 24 Jun 2026 00:00:00 +0000
+Subject: [PATCH] raw_hash_set: include <immintrin.h> instead of <bmi2intrin.h>
+
+Clang refuses a direct include of <bmi2intrin.h> and errors out with:
+
+  error: "Never use <bmi2intrin.h> directly; include <immintrin.h> instead."
+
+This is hit whenever __BMI2__ is defined, e.g. when building with
+-march=x86-64-v3. Mirror upstream and include the umbrella <immintrin.h>
+header guarded by an x86 check, which transitively provides the BMI2
+intrinsics (_bzhi_u32/_bzhi_u64) used in mask().
+
+Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/d851fdd768b27c02b3fb786fd0987faddd279ece]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ absl/container/internal/raw_hash_set.h | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/absl/container/internal/raw_hash_set.h
++++ b/absl/container/internal/raw_hash_set.h
+@@ -225,9 +225,9 @@
+ #include <ranges>  // NOLINT(build/c++20)
+ #endif
+
+-#ifdef __BMI2__
+-#include <bmi2intrin.h>
+-#endif  // __BMI2__
++#if defined(__i386__) || defined(__x86_64__)
++#include <immintrin.h>
++#endif
+
+ namespace absl {
+ ABSL_NAMESPACE_BEGIN
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
index d0d0d44610..c2d1e7f44e 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260526.0.bb
@@ -10,6 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
 SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz \
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
+           file://0003-raw_hash_set-include-immintrin.h-instead-of-bmi2intr.patch \
            "
 SRC_URI[sha256sum] = "6e1aee535473414164bf83e4ebc40240dec71a4701f8a642d906e95bea1aea0c"
 

