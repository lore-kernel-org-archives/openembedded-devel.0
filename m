Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB6C25B78
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 03:29:54 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.5276.1716953393159663728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 20:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lvTDl7sg;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2c034b016e6so57979a91.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 20:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716953392; x=1717558192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mvkw2xHLPjMZfcFYSWuJ3cukeEvkucIgD6z+U9ZbT3c=;
        b=lvTDl7sglgNGbKsH/gYWJV8XlGhxSTpDb1Hsjq5eExKvV8jAcTXqKwPHwIR+vlCP0q
         DN24cn8sAFxsV86ar7DxDrBr+/QXvT4NNIvDBd81QEJd3bFlurm9Yc3e/PcUXxL1l+u7
         0JXtZS78iH172GJKMet2bTFF4Nmff6C5JgtS7MPHMWBBOSWhayVMSAHIXTTAshfM+gsS
         Yj+cU7EctjUANZtDMMRTZZlNb4JUgSsmjLFvxe701jnjiAON7encpqCUVdaaNVruPSgc
         RoZGlzIHbSlps1HQdbUKOggjKvtcZT0GkHCS0iCXyFNE1zjExC8U4+DvmMViCZq2heR4
         JTCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716953392; x=1717558192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mvkw2xHLPjMZfcFYSWuJ3cukeEvkucIgD6z+U9ZbT3c=;
        b=eKy9qArvZxS9GoxOFXnpSSTv1UWKLYdVCGbIR99TMyNkBONuyTOO1pTjSlHWKMzBD7
         yJLtqlG6xrnBW5rkXc/VHlfPqan+aeiWLfHkfSaGkLfzws5ZuLHYT6VqcBz4kU4jFyA6
         GRkKmEDPwYx1tLYaHOV9qtaDNN4f6aTdgXK/I7wvzqJ0h/QPl/sYpcL6+5BEjxQpugnX
         X8IpQ/pb/B4VmTGu1GE8dcIOWUG/SSN8l8PIP2drZMKNzS7xB1S+u+7nemNkbNij9wnZ
         xWVh8jgVMZ0Ea9f1r5s1xR5UqGoLcP/RHqvScbAQbonloibov/lZ1dWWQQkDpMeMBEpR
         TYuA==
X-Gm-Message-State: AOJu0Yyw9G5glk4efS30surs7HCglZs4m9uHf2Wai/nl65fyCpq9Lg8h
	tTwk2x1Zxir79OoVnBF7C3wh+SXIEvE0kU35Tee3Yeenqnzk3d3NKHu2NXu9nZ0=
X-Google-Smtp-Source: AGHT+IGJXr8oVqGYmA7JDJJa4dxE/mpO2h8GuJ2Mwdcp+GE9hxe3X2bTpgqTU761pH8QytwJhuzXfw==
X-Received: by 2002:a17:90b:1981:b0:2bd:f708:ff0f with SMTP id 98e67ed59e1d1-2bf5e16683dmr14214024a91.21.1716953392103;
        Tue, 28 May 2024 20:29:52 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::3972])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c00f389824sm2341384a91.1.2024.05.28.20.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 20:29:51 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/4] googlebenchmark: Fix type conversion errors found with clang
Date: Tue, 28 May 2024 20:29:46 -0700
Message-ID: <20240529032948.150704-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240529032948.150704-1-raj.khem@gmail.com>
References: <20240529032948.150704-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 May 2024 03:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110602

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ype-conversion-to-match-function-ret.patch | 34 +++++++++++++++++++
 .../googlebenchmark/googlebenchmark_1.8.4.bb  |  3 +-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch

diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
new file mode 100644
index 0000000000..d514cf192b
--- /dev/null
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark/0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch
@@ -0,0 +1,34 @@
+From db704bcc344529039d7fb28be380658625a9c08d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 28 May 2024 19:34:43 -0700
+Subject: [PATCH] cycleclock: Fix type conversion to match function return type
+
+fixes build with clang19
+
+src/cycleclock.h:208:52: error: implicit conversion changes signedness: 'uint64_t' (aka 'unsigned long long') to 'int64_t' (aka 'long long') [-Werror,-Wsign-conversion]
+  208 |   return (static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo;
+      |   ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~
+1 error generated.
+
+Upstream-Status: Submitted [https://github.com/google/benchmark/pull/1794]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cycleclock.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/cycleclock.h b/src/cycleclock.h
+index a2584376..f96801c5 100644
+--- a/src/cycleclock.h
++++ b/src/cycleclock.h
+@@ -205,7 +205,7 @@ inline BENCHMARK_ALWAYS_INLINE int64_t Now() {
+       "sub %0, zero, %0\n"
+       "and %1, %1, %0\n"
+       : "=r"(cycles_hi0), "=r"(cycles_lo), "=r"(cycles_hi1));
+-  return (static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo;
++  return static_cast<int64_t>((static_cast<uint64_t>(cycles_hi1) << 32) | cycles_lo);
+ #else
+   uint64_t cycles;
+   asm volatile("rdtime %0" : "=r"(cycles));
+-- 
+2.45.1
+
diff --git a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
index ffb57942ee..34732b42d9 100644
--- a/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
+++ b/meta-oe/recipes-support/googlebenchmark/googlebenchmark_1.8.4.bb
@@ -4,7 +4,8 @@ SECTION = "libs"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main"
+SRC_URI = "git://github.com/google/benchmark.git;protocol=https;branch=main \
+           file://0001-cycleclock-Fix-type-conversion-to-match-function-ret.patch"
 SRCREV = "a4cf155615c63e019ae549e31703bf367df5b471"
 
 S = "${WORKDIR}/git"
-- 
2.45.1


