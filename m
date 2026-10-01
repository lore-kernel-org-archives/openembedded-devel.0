Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D203CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 03:03:57 +0000 (UTC)
Received: from mail-pz2-f39.google.com (mail-pz2-f39.google.com [74.125.228.39])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3384.1790823836802187071
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Sep 2026 20:03:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=G2RK79w0;
 spf=pass (domain: gmail.com, ip: 74.125.228.39, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pz2-f39.google.com with SMTP id d2e1a72fcca58-88098dbba5fso1323153b3a.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Sep 2026 20:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790823836; x=1791428636; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nn4OcPxIdz4YZExLVnOz35iTjeKT6Gl9o5hl4EjJL6s=;
        b=G2RK79w0MlJY2Vd67w04J+OckRMxI+T1KhH1UN1y2Z6EDAbDRjd+mLPuG2FYP/B0O9
         PK+pAKMVhwtqRoGjVcaSJv3Ih+IvFtyXWORXyptnGSqD41SKcJGd5oFlrrsetgbHOeqI
         Yo+rVLge/hww00I9JnQySwxvirq+QqKFEma2UDhQagcQlPT9iqRAuoTknX3R79L3CpxW
         t6WYBl8j2epQoUr4sRAleXl4sXbMAq4HBsFZlNIJcqvaxqLEJboGnkxjU7GQwFYdBb9i
         /ixUNO5Nhp3Ioy/+uXMoSmk1/mtxxAr86ehX4ZHG+SGsdtyGJ/NAKeZwlYmSa3qXOsVG
         SdsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790823836; x=1791428636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nn4OcPxIdz4YZExLVnOz35iTjeKT6Gl9o5hl4EjJL6s=;
        b=Klzv69fEpm56yHE6K2gJrmrvVfLL8sZJTadDYgPCJWwazs0GJx1yIpAh/Znryl/q6t
         gv2itlZnwvH2rj99STjQQIW3i7jR1kdYT/W+8r/qRCq5xJIgBaOfMnTqz/4cpp5xfUPT
         U0cNh/WXZTR5aGTj3K47JBBp06vqUixLo++MqdDZViLEvp7AdlO6TxCno+A6u+07ngZl
         a130aB5zi66oNo/mbWtGe4VHXL2HpXWUIBGMejRkssqA2cT+g2mO2uoRBIlIZ0WCxLAt
         Rosy+WpsWyLx4Y6rUTbeoPGGarjAKlWSjjXk+VC1VUdVvxVOjVHuegfan9AwUrPh2g/j
         KKMQ==
X-Gm-Message-State: AFuF++nkrYhEqEOPXKn6NZah96CEFNKZBfsFyEkU29a8aenjPA60fr80
	XLJC/HD2U1SAcJLC7X6umv/ibIuZA5vIv7GOBIomKXjzim0OqDKOYclVps91nA==
X-Gm-Gg: AYBFou2ruMQXmqUODipo1k16ONDZMmUZocA7qjV4WXonlsleDx8sj7gay+Movyoxo4N
	4B+vBGuN0NogdGiR/k9uajiDLRedE9ZfKG/X1m/xkTtWvcy+t8BCJ8pZYMo9DkMGy9seNf9i9MM
	XeOY/r1y12wIYgCPzkNKLyqcu1mnQd5ETPOB9+Pchda5wa6Zrmn6VvVmE0KGwnJ7HJgSMVqXn6p
	Ise6ItEUhoxG7/gOljBzo4ZyJDZQ4CYIfFUC9xEpp1jvUPIkLHhDpMVCiVU9Fp5qhiZFadeXgIy
	IsN6aSjPdGQlyVIIL7kKJEVqMZkgtpM0i72EaPkqc871V04g7bBgYmTWJzqGk0bARQ8x3kwurnD
	uAYl4rIIqiezLomI6R/h7ghcKFsrIqTsXt1VFXo/OD/oM/MzFaBH1bC3SVdy7pP9do7qfibW5Us
	yWcMFwqTDPDN4+gWnSFHe2vnzS+bHEos7ijrSy0FrOG/5B+2q9bz3tDeba15f+ze4YF2au6EBCC
	jZIRMtgpQxzihRkc0bGZg4qNTUY5JUPng==
X-Received: by 2002:a05:6a00:2d92:b0:885:ca85:68f9 with SMTP id d2e1a72fcca58-887fd5382c0mr778984b3a.13.1790823836131;
        Wed, 30 Sep 2026 20:03:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88819db440csm357042b3a.60.2026.09.30.20.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 20:03:55 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-networking][PATCH 10/17] wolfssl: upgrade 5.9.2 -> 5.9.4
Date: Thu,  1 Oct 2026 16:03:22 +1300
Message-ID: <20261001030331.1581021-10-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
References: <20261001030331.1581021-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 03:03:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130559

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/wolfSSL/wolfssl/releases/tag/v5.9.4-stable

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../wolfssl/{wolfssl_5.9.2.bb => wolfssl_5.9.4.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/wolfssl/{wolfssl_5.9.2.bb => wolfssl_5.9.4.bb} (98%)

diff --git a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
similarity index 98%
rename from meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
rename to meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
index 5867cf8f42..8fc6068560 100644
--- a/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.2.bb
+++ b/meta-networking/recipes-connectivity/wolfssl/wolfssl_5.9.4.bb
@@ -17,7 +17,7 @@ SRC_URI = " \
     file://run-ptest \
 "
 
-SRCREV = "a82476d144290bf6a786607a16c224acff63d882"
+SRCREV = "3c5eead44904df64e6a5a1f4ebdce377d35a849a"
 
 
 inherit autotools ptest

