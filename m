Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1D24CFD2F6
	for <webhook@archiver.kernel.org>; Sat, 22 Nov 2025 19:31:42 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15744.1763839894185892484
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 22 Nov 2025 11:31:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dGpBBbNH;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-42b39d51dcfso1832767f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 11:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763839892; x=1764444692; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0djncgh9NinBLUrHujhvwMmhrX4K1Vk5lYieBkpwiA=;
        b=dGpBBbNHVaK+IwttaDGqSjRIjElbJM2AJoqfzikujSYUVe8qLKNmdunrAT7IhixqAn
         0OBx2AuZx1PuhB1qU9JO0Pvda9FgmDTCtTDQSEABTHvX5+L1tvx7zV3Rg9B4zLlieh+g
         DOpeKPPSGN7Av6hsplsg4N8sUMBdchnpjOI7/r0xxbcab8boOqeO8uo9gCJN2D5DGuth
         bk+6ylnSu7pf+LgXJO32lFAkkuJMbyY5VVA5L73xJ4bod+JiIDivLSzm3aesNi83Zhvl
         iOUItdQk7ldS7+1tPqxKGG+JzAVvy1qf6wyDvJuJMXqzhCnYVb+PhOHSPbbmAGAtWxAF
         Omxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763839892; x=1764444692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q0djncgh9NinBLUrHujhvwMmhrX4K1Vk5lYieBkpwiA=;
        b=cs3lFEF4qLKH1JppB/+G2TJzNqv60Msyhniq87vvPOgL5nf/ekkocWMERdHi6XgjO5
         JbcFyDGBQ1If56HbWsQ4i255Dft0sYUORg0WLqHJuvYs6lmygh4sNx7RK7Nf8yeouW2e
         RyG0L+Snd4BNobcs8yH+cOYKiqPolfwq8HF5I9+VhNDUUECJkd8NU8Yt2/FbI3/U24l1
         SVs4CsNLvAb/TgSDn/MTV7wEESVrWghTqsr8wpf9eC6ltluDXFKTnbDWrpZQbiAf5EO9
         6zzsqrS8AOiGRj55CPaA+W8pgU19szrIwPix0xrX3ZPOyBVSyxriKa4vgZeQM66tLSuw
         tKFQ==
X-Gm-Message-State: AOJu0YzLsDy1JzrjA2QPNlCgr8Tr07D0tpjz76keXTQ4oEdzpT7PdTcQ
	nyR9S5X3EyTNmSgx56jleD8b6mMX6ktBzG7uWJFvb9rwTzvf0LBrlCPRU1kIqa1I
X-Gm-Gg: ASbGncvBB1k7UNoEqhWRjJSlPY3otcCd/bMCqvnZVme+xZVSDsvynw3CPBoTYOrXChD
	Dp1f5eOoOO/phoZvV9iGOLUQ4/Uro9D8wcxmIhYh9KQmwjgDdZo8eJzq9WTPX1BpREJuXnKhJe9
	B2v8Ls4MxA1Brd34jIIZpCYL4serwAoqCk2Dc1n5arHklxmsH99GHa2OoZNb4Whvozh7/M92NoX
	FgTIRNv/zaip/K07NKtrXIpPZDGoPQyqZG8IYLAcOvLXq4MpZSBaMN4LVmWPncBii6IyubxcZdw
	tPfcT1AOy51Pp8tZfn+fBq22j0oX4z1J8SFESSu8SBHRNsRRP1WWpgWl7BJK/2hP5gMlx8LMaNn
	6gd5XLqsm0dMDKraMgQQ9ktjeujv/YpdMWqbM6fhF1squdP0WO5Rf2l7oLjAHlFx9xD1idfipa2
	Iep0G7k0ox
X-Google-Smtp-Source: AGHT+IGPKdh8zr5JTmogxjNUbq5SlV6/ld/uaKmjK4eEWtiORcjMqP1ecXX+sgKqHECQrxoQmd/b5A==
X-Received: by 2002:a5d:5d88:0:b0:429:b2ad:f31e with SMTP id ffacd0b85a97d-42cc1cf44a1mr6281232f8f.35.1763839892328;
        Sat, 22 Nov 2025 11:31:32 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7fba201sm18314686f8f.32.2025.11.22.11.31.31
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 11:31:31 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 05/10] exiv2: patch CVE-2021-29623
Date: Sat, 22 Nov 2025 20:31:23 +0100
Message-ID: <20251122193128.1703871-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251122193128.1703871-1-skandigraun@gmail.com>
References: <20251122193128.1703871-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 22 Nov 2025 19:31:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121983

Details: https://nvd.nist.gov/vuln/detail/CVE-2021-29623

Pick the patch from the PR mentioned in teh nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../exiv2/exiv2/CVE-2021-29623.patch          | 29 +++++++++++++++++++
 meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 20 +++++++------
 2 files changed, 40 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch

diff --git a/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch
new file mode 100644
index 0000000000..1c61d64e46
--- /dev/null
+++ b/meta-oe/recipes-support/exiv2/exiv2/CVE-2021-29623.patch
@@ -0,0 +1,29 @@
+From 54ff4ef5f5cc82c276a079a66b307e9a6f70908c Mon Sep 17 00:00:00 2001
+From: Kevin Backhouse <kevinbackhouse@github.com>
+Date: Tue, 11 May 2021 12:14:33 +0100
+Subject: [PATCH] Use readOrThrow to check error conditions of iIo.read().
+
+CVE: CVE-2021-29623
+Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/82e46b5524fb904e6660dadd2c6d8e5e47375a1a]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/webpimage.cpp | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/webpimage.cpp b/src/webpimage.cpp
+index 6248414..6578937 100644
+--- a/src/webpimage.cpp
++++ b/src/webpimage.cpp
+@@ -757,9 +757,9 @@ namespace Exiv2 {
+         byte webp[len];
+         byte data[len];
+         byte riff[len];
+-        iIo.read(riff, len);
+-        iIo.read(data, len);
+-        iIo.read(webp, len);
++        readOrThrow(iIo, riff, len, Exiv2::kerCorruptedMetadata);
++        readOrThrow(iIo, data, len, Exiv2::kerCorruptedMetadata);
++        readOrThrow(iIo, webp, len, Exiv2::kerCorruptedMetadata);
+         bool matched_riff = (memcmp(riff, RiffImageId, len) == 0);
+         bool matched_webp = (memcmp(webp, WebPImageId, len) == 0);
+         iIo.seek(-12, BasicIo::cur);
diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
index b210fa6340..c8c5edbed4 100644
--- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
+++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
@@ -4,19 +4,21 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
 
 DEPENDS = "zlib expat"
 
-SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz"
+SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz \
+           file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
+           file://CVE-2021-29457.patch \
+           file://CVE-2021-29458.patch \
+           file://CVE-2021-29463.patch \
+           file://CVE-2021-29464.patch \
+           file://CVE-2021-29470.patch \
+           file://CVE-2021-29473.patch \
+           file://CVE-2021-3482.patch \
+           file://CVE-2021-29623.patch \
+           "
 SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
 
 # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
 inherit dos2unix
-SRC_URI += "file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
-            file://CVE-2021-29457.patch \
-            file://CVE-2021-29458.patch \
-            file://CVE-2021-29463.patch \
-            file://CVE-2021-29464.patch \
-            file://CVE-2021-29470.patch \
-            file://CVE-2021-29473.patch \
-            file://CVE-2021-3482.patch"
 
 S = "${WORKDIR}/${BPN}-${PV}-Source"
 

