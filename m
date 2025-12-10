Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99E4ED3C536
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 12:04:42 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14134.1765368273534428660
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 04:04:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AA7aL6k0;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b9215e55e6so4446245b3a.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 04:04:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765368273; x=1765973073; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c0KmtR9/KAUzGCTntiK0DN0+5cKMXavhCVdxcAnCyh8=;
        b=AA7aL6k0xzEXT6tS6FxxYXLhv7W+pq5n0lQdSW7GzjBPMYxaSiCuxAi24+QmSVRtMm
         1+lRiyGiDrPhkySRWEuvI6NMe99VQcqnuY13gZ45DReXzmXeKK7fAPvIl2aZPvQDD86o
         Nt92QCdKN+IzAys+muGCcCYUhCwLbTEP7mNDObdYqJC9OwhvmCsElWVea8PsSN3BhEnE
         gq2/yeBK1wG7lmWnDJH7NDi5anWtc2btvQUY9L0bZ6kb2ExPFhzJUjTG9+eB2Seq/uft
         2a1R6PXFz8Ebwd3fEMC8R7fRMMIbsKSGUunxCGgqMWXUWbNPzIJglMj7djlz+YJUVMnE
         +R7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765368273; x=1765973073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c0KmtR9/KAUzGCTntiK0DN0+5cKMXavhCVdxcAnCyh8=;
        b=gnEoLMIQvlkq8FmleyqQE4EyKLVNlPD1KXW/xHEQA8KPJvNJItjaEy1B1SyeQ1Wmou
         PiWFJVwKVDbPLOE4wSehpOJjwieJjGedwEE0BVr/az4WGHqzwJG+kW3pnSYDwjlfb9OF
         uj+0Hy0iEs4MqrG9Zq8nsSIC693qQtQV9LEcc3KYvyvdc9TvX9wJ/P+cQES0d1NIZKoG
         FpqsS+CcGTrdXIN2vIfR2zeZQhAz2fOy/KxIyBs3AmmZOioq1iG9ZJJp6Fl3CUo+Jirq
         TQEKkkl5+CYX7OIoI/RnXuVYHjSteTwN4hy4bD3zt4vUsbo2uD09JxZ7Kd9w12NZyRsP
         1y7g==
X-Gm-Message-State: AOJu0Yw/h+yJdbjgZBXmj5QKPqGKB5Yorxp/3WcXtThjxkEhWQNkOKe3
	RcT8mxwEX75NVFpNvi+DjzCqJRak8oFRXX0OUqHSgzoKnittoysxhLZ68oF6xw==
X-Gm-Gg: ASbGncv9J64/Q0cjqmWxpSgjdpkc67aCa4d9lLLLmj1r9tjaNbPdaKa9KXsm4Ohs6jQ
	aynpvquEbmeuRAtXZhvoUeQDPhzjz96I6vpuQKU6N1/0qwYrSZ7qcycIQ9BhNyL8/t3LHVMnkNM
	dDdQScgW6ePZOBq/xPDCP70wSW3EkUv56px6XQcLj5j2nMTfDUDH/byRXSOpnb6Yd+WDjm5GKQL
	4WeL0Ctj+3DjAmna5ssvC0dhS6jHfG2eux/bgNNWy2791ajiBY2Cblzvrt2z4X1Vw0Kg04tWPiq
	/K94smhAH+oO1i5fV6Soy1alZoXYgPNBS6kRV7D65ezfDR32FjY7gnbdSqkZK9ZK+BNmEnMfL5F
	Fck6pkl3vgvA/NkX1ksdpJpTWT8uspP4akBMNAI9JCAPnBSlI7kGDPdlXdX3/pmYR/qspLpnRwO
	APCF9NmAFhpqIvjqQV6hPCmg==
X-Google-Smtp-Source: AGHT+IFOZYcoZxzlD3tfCgBXpP9OVGqJR073ywGjQBxAGOhlYp1z79J8b2EXy1MnqxaXyWtCEgDxxg==
X-Received: by 2002:a05:6a21:998b:b0:34f:e712:349c with SMTP id adf61e73a8af0-366e1610571mr2235103637.35.1765368272648;
        Wed, 10 Dec 2025 04:04:32 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([136.226.251.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf686b3bad4sm17767759a12.10.2025.12.10.04.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:04:31 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 04/43] debootstrap: upgrade 1.0.141 -> 1.0.142
Date: Thu, 11 Dec 2025 01:03:18 +1300
Message-ID: <20251210120402.4179289-4-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
References: <20251210120402.4179289-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 12:04:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122508

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 75c786b537ac01f28cd6a185c3d152eca781975a)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../{debootstrap_1.0.141.bb => debootstrap_1.0.142.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/debootstrap/{debootstrap_1.0.141.bb => debootstrap_1.0.142.bb} (89%)

diff --git a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
similarity index 89%
rename from meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
rename to meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
index 9287962ab7..1478ebb1e4 100644
--- a/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.141.bb
+++ b/meta-oe/recipes-devtools/debootstrap/debootstrap_1.0.142.bb
@@ -11,7 +11,7 @@ SRC_URI  = "\
     file://0003-do-not-hardcode-the-full-path-of-dpkg.patch \
 "
 
-SRC_URI[sha256sum] = "232ec755f4b1f445f829996885846abba6f1b6fd55d049476ab26ddd8c4b4e1b"
+SRC_URI[sha256sum] = "334b188c2bab5c1aa6f858a044274631d342f07f5ddec1bad870d728f02fd652"
 
 S = "${UNPACKDIR}/debootstrap"
 

