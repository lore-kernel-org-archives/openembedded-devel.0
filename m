Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3858.1794729004444716809
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 23:50:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pKZbp14C;
 spf=pass (domain: gmail.com, ip: 74.125.82.174, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3712b6d9843so1902828eec.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 23:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794729004; x=1795333804; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HrkwCVLZvDisqoP6+PGmVBMxODG+BRmpfMryR513Q4c=;
        b=pKZbp14CqKyZ+nV48ghpKLr1O4806qeaQAsbIfTQNNgLK2vLO5YQNGG/6MObxa2FIw
         bcqj7LLmwWtnXY80SFrhrKKo3civtUc1L6l5ruDD0Xe7pQzjr4T+fIfdhBe47Akr8dKO
         1y2ZEUZ0PPQyAQ8zxIgDL2y+NYZUnU451ey0AX/8Uh5m8Efs0xKbV0oVLxmSC0eGDqef
         TNw8nBaOC7Yg/QMqpBUu1hUZelyGoIAgRktGkBcO4zFGizEniZunXwKwrsA1DvXyAv5Y
         P2+FLZKCccYpMB6mcPNd8Yqsx7rwte4GX6Z+WpkfDrPtt7IwfwO9X3jqZJPMjS7e2Bhu
         hmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794729004; x=1795333804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HrkwCVLZvDisqoP6+PGmVBMxODG+BRmpfMryR513Q4c=;
        b=YezXV5ROmjh3xXJ8Dwnis4PFmhAtOHx1GGBJljKuEGpFVKYbNZkGqTjytyY5N0CwvI
         aedyAIn6JvTDL6RA27UbeCaV1VVxjEYo/z1WQdvmRLftBkr+QOv7UA6omluXdaXJBAEZ
         BbYSicvpfbjaUtIibnk5rt2GymF1CAtGX59PEn4UU9M34HaqCvMkbVJkTlP3RQ19kagW
         892s2YrEFYG+gB/a5xeNNKWIwsfgyWceDdJwwZ/C60uc3yfA7X8UApRKG8lj6LoNnJRC
         Q1xEIL9/vuLFmcvyM7nvjP8jq1XYYf0FE3poR9dheJmwMbNpX8ZWNiFsyhgcmpX22hXp
         ABYA==
X-Gm-Message-State: APuU4Z8v3MkpraVFM5xAhTfgBv9CBWMgsw1Xj0ca81R/WkxrVXBB1d0f
	fOrxo9RhU7tkJJtuFsSfBmqAH6ayA4kk5Jhr6c3t5TBh34dQ3SrrseK7AWMM3h0c
X-Gm-Gg: AYBFou1dT9hT1fVjmrJflGwmXKW8ZeL1C7gaAohwszKydMA/2IMFyU+SEchAf/nzYsn
	dqv14q7YEBGGGTZ4fRITDP4NNIGcBBAf89gQcpr/5a0o9SrkTymJP8YXhdEw0SojAtCw9zMcoAe
	6g+LSUvE1nVsRmQoSZaj5xL3BHrldIRO8DQbDHHwZWWcjydTxDfYu7NwvgVjkWgXrRTPzXDE0XB
	Qtg4a8oTN0+EHsPmYz8wicPXrLe2IFMzGMvR2EhtEaLWcKEBuSI5TKiUx6/5I55CJKj8XjkVshi
	9Rz8zzwCnpmKt9DQNc66rQmVlx5NuvQBEGlAHddtGFOBsb0mvawV8v/mosvnfhsf7LTao7+SFAc
	DlJWx68Voisl3WDreQvtkJpre4/BvxLoYZHXC0qSX8kfEyvXJVGGilVhnVuD4pJYyCyrw7tDtgp
	aUcch3QVT8WqyY8gm5DszsxS3kP8+Bvt0gbJoGpQ+3Ua1pmZ5pNEvFftPR4R1r2YErwrbG3M0Zx
	WEzTpyx1X2w//Aqd9D0S8o5hkdZhCQAdyuZ9zJ5eRFi9plI1aGuMVvAIg3TZ5xjLB5OSXkMV7HC
	J8l9b8EJdinjpM43UFGzZODRBCuscGT+ugYuFcU2rTaJ8BxeYvYbWEBIGyNGIKGuGN2EHVV+L+R
	oq9hBum+LExuPWQNVoHmomPB0diC1z+eNFiQaUWXs2XwbhHXzz2/czW7AB4FTZffYkPLLYOL0y+
	3uFawMk5xXi8/vAjetDEKNPL8/fqEMbi8IrMjlnYi+fEtSQEPI7kIvfGGhOmmLOFL3thJ7Ed2q0
	oFtc/rKkceJYiypPQE8vHp3JUsH4dyR9hYBfoWuwGiuLWeAHA8DGU1TDYvnSuVZ2Kpr5mrKFO7Z
	B5MA/g==
X-Received: by 2002:a05:693c:8852:b0:36a:1452:8dad with SMTP id 5a478bee46e88-37966f32039mr7419609eec.20.1794729003686;
        Sat, 14 Nov 2026 23:50:03 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795591f4f8sm23112817eec.13.2026.11.14.23.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:50:02 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 27/96] libsdl3-image: upgrade 3.4.4 -> 3.4.8
Date: Sat, 14 Nov 2026 23:48:05 -0800
Message-ID: <20261115074918.2932593-27-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
References: <20261115074918.2932593-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sun, 15 Nov 2026 07:50:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132297
Content-Type: text/plain; charset="utf-8"

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 .../libsdl3/{libsdl3-image_3.4.4.bb => libsdl3-image_3.4.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3-image_3.4.4.bb => libsdl3-image_3.4.8.bb} (90%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.8.bb
similarity index 90%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.8.bb
index 3953c6314f..4dd1cf5447 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.4.8.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=df8f4d887d3997f6e9cf81bb7f43dbf7"
 DEPENDS = "tiff zlib libpng jpeg libsdl3 libwebp libjxl"
 
 SRC_URI = "git://github.com/libsdl-org/SDL_image.git;protocol=https;branch=release-3.4.x;tag=release-${PV}"
-SRCREV = "bec9134a26c7d0f31b36d6083c25296e04cabff5"
+SRCREV = "0891fc30428b518e7d018677bd6fa95c1a50f4c6"
 
 EXTRA_OECMAKE += "-DSDLIMAGE_JXL=ON"
 
