Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA417E9E2F8
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 12:01:06 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17594.1770811258123761869
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Feb 2026 04:00:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VQaJzvle;
 spf=pass (domain: gmail.com, ip: 209.85.210.178, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-81f4f4d4822so907533b3a.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 04:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770811257; x=1771416057; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oV0QsS4DQ/q2kdTa3S57naw47ldaGMO9qMIKGGtj1mM=;
        b=VQaJzvleTJpwqjtN/ecPojHnxuvcTMmsAJWr/wDVnr8VpAgcA9VSXDA1B1yrYr7Vv6
         wv/MDp6q0PP0Fp7iJ5KHfI8zIXaeJ7g5992r6e+wjJdVu9beeUT+LRFlvnIN9BvuGDAI
         SB4wyMbwIMc5OOLWaP0wKXqJLNam4rLpBhC2zqSEPcicB+aG/KiLHnKFmBqfA17PJgVQ
         TxNKFhZeGohiS+AHzEIm0hGJkdvKhdJmvm0tPz+aTWqT2PSbE43msg0/60UVU4A/RlcI
         7n0pF8aObIxMKEBXSH0AHp3YAxSFonl97vTkNVMQOMJ2Zwdwj27HsKl4UbYvEk46v/AF
         7Vgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770811257; x=1771416057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oV0QsS4DQ/q2kdTa3S57naw47ldaGMO9qMIKGGtj1mM=;
        b=c6+fv3dEhQeesWSNk2Maeg40Es4jet7D04f71szlln16m1k734L0u3bJJVKPktqBLy
         F5uugtvN8ydpbVS4lMzdtY79BtIz/TPFSEfnSqTvuxq8TxHef8XZh5UsVYDAXdSMuJLu
         76G388vBbuq90xl4ESeLhCAfF2EKWCP22tonGzyPVR6MmGyCYtWAbmpFTSXS4ztmm4lM
         6gkD8UMTbPnHp+MAR2J72hW+mFo2ET0ZbYSdIegad8DGAu0b+nVVUkKTz8jyQGOm6a5d
         wUeHm71Gx1UPvZbY0cOkf7Ly5LK7seNMHTvlLokWVQxKZ7Z0XasGsTwbtMeOEWZ/DI4Y
         I+LQ==
X-Gm-Message-State: AOJu0YxgvXdnmbYj/PZIoVk11ajgx8qLU0cvMrhpuJMwumHmtOe3kG6d
	0Mu4N6Hek1shSgcvkm9scdCXqhfp40mkbQeHyzDcSgJABmGTtdbep5zld0141Q==
X-Gm-Gg: AZuq6aIaSlRTCCSyaLGbVjudiUufnvd5d189Fzo7vEStvXcc1hwKPk+BGwVBzNNsHQc
	hHkuvxXH0aDATBReYoaGQ8XnRfzHGFQXYuHQObcEjAkAl0eP5bS3sjcQg6XJqz1pTBrnZ8DRBBh
	BVJoTTSAlR4W/Mkt6aJ2pi6s08w9jWWbZZKBnrKsXAaw7oEbxslE2YMByBT9DP2vIvFJjXzrOxf
	8hPti/nW4ulRwL71XLEJPTniLCBCVpFW1tWCjEMRi23x+1Dl+BnKAkXQSgitzX9uOzw2oz1U+vW
	CHF3eHQz+LrbbgvxzwGX1DYFbWEEke+Tdfv7YNh23K7ZJw9EUrz19o9m/t72JNNIg8ywe+chKZz
	m4bvVlnlLxP9kLr/tPNlZC6ZB9Ici0bTFX/aGXdmAAoyLqBiPKKvB+Xs5LUym7gchZiQPZDLuh/
	wHPMEXzwJb4dd8hqbMW3gRcDtzXwHSGCNI1tU=
X-Received: by 2002:a05:6a00:450a:b0:822:7481:6c7b with SMTP id d2e1a72fcca58-82441753ca0mr17774626b3a.49.1770811257291;
        Wed, 11 Feb 2026 04:00:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.33])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e3669d8sm1805831b3a.2.2026.02.11.04.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 04:00:56 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 6/8] usbids: upgrade 2025.09.15 -> 2025.12.13
Date: Thu, 12 Feb 2026 01:00:23 +1300
Message-ID: <20260211120025.4190831-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
References: <20260211120025.4190831-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Feb 2026 12:01:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124334

From: Jason Schonberg <schonm@gmail.com>

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5aca0a216d07a1876ed6e9d22f34456f0595ed64)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../usbids/{usbids_2025.09.15.bb => usbids_2025.12.13.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/usbids/{usbids_2025.09.15.bb => usbids_2025.12.13.bb} (83%)

diff --git a/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
similarity index 83%
rename from meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
rename to meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
index 925a8ddda9..ebaa1d1f99 100644
--- a/meta-oe/recipes-support/usbids/usbids_2025.09.15.bb
+++ b/meta-oe/recipes-support/usbids/usbids_2025.12.13.bb
@@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=84dcc94da3adb52b53ae4fa38fe49e5d"
 
 SRC_URI = "git://github.com/usbids/usbids.git;branch=master;protocol=https"
 
-# September 15, 2025
-SRCREV = "18b3055a9819a341ac2ff957f0b92f564d0d5d6e"
+# December 13, 2025
+SRCREV = "5de1427442504bc8e28d35cca5397d64ea177456"
 
 
 do_install() {

