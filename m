Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F17CD111A8
	for <webhook@archiver.kernel.org>; Thu, 27 Nov 2025 13:19:47 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18195.1764249577145063319
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Nov 2025 05:19:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=P5NhepZ1;
 spf=pass (domain: konsulko.com, ip: 209.85.128.50, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so7918435e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 05:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1764249575; x=1764854375; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iEXAxfb3QfwISSZzBbpxBuk/m05MoUc2+fXTc52NpWg=;
        b=P5NhepZ1r5vY4Cv9ElTN8nsEwenbPyTUUhtPuJiPsneSiy5+PKShb4jriN06oGpqAU
         LlwgVGaAjq6IlsoWRvJY0GxfLwvys3ZC8sieC2vxmcWsdGlwDK4/4but7VCQWTeOnLMv
         lQT1P7+uwMFYozWK/x00YJkBYFWbxHPb74ehA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764249575; x=1764854375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iEXAxfb3QfwISSZzBbpxBuk/m05MoUc2+fXTc52NpWg=;
        b=KvRTsS5gqB4O7Bp54ez8tn1uzmoYpmWAZVnsqRjF29Gk5UzIDcD9AQWgsBQkayHhp2
         T0S7BYSYPG8M5V0A+2nkZVK78TEb4IOCOlyKS53MYQ2TJYq7XE7Yg45GIIFNKDRmfiaW
         2XyQ7rZMHrTfDLN8No27TqAdBOIDIQriP3svfCs5lp0dgKgLV7eqSNagvpV5waDNhA2j
         KHBr8jb6C+df57MQwTYivPmbJ7D4ZvsEP+fkAgkCB3F4NJIjR5pAN8+HpgbEN1YVBxJA
         8pxfQ56xyvGKK5S7px38VvpcT5qYfLAuWcLDhbmcmiIGzhU8AQeTyk9kV4IC4GgJYQwC
         cjfw==
X-Gm-Message-State: AOJu0YzvsSj6rdZ+/JgnkeSu5j9Z91xW754duRhdsQLPSVlEAWjMdmRh
	DZfKAnqj179OP1FyZQmt9xB0ad46kZ2GAFlmaRXMSBBzAZ0afBLbFRJoXlZreUEWHqCqTv+8uZW
	YPpcz
X-Gm-Gg: ASbGncsYs/j1AMtql19Q8QE4BAPKmOY2b0qXo+mHBrcoIO5v4YyNB4rSRu8nc+32xU/
	FhnQ4vdIfLqSVpO6nrcRQKSdFgW8tNMjQu24jXT7mp3aLtD5Q1cly9Qhi29WO4cWHRR7YHXOCm6
	mSwEJjPVSDum24BfdVr8GcQyBYTebaLTCsaBUSgGs60k4whG8acv/86xCh5YPSwVjLZKOPf1luR
	Rrq9wjwC2jfwav0mfyQECtLQUMVsAF539/GkUrt85PsZNdrYJcIqAwT4ebXUYBNsZMzJzhC6KyK
	bQddBEhBQlXPzn/2q348uOK5+/lX9zmppKUrPqfjhQirznXrfqd1dUQDOYcDiA0md86ZNPfKJZH
	mo5I7hur5svtgO4/Z56Dmto0ETIozIPNIff3z8KAbsqhQ8ubwkqCu3ycZ2bU29SVaXmwK5gYwVk
	A+6sCwWfJwOiHxTSEYGujTx5HI
X-Google-Smtp-Source: AGHT+IEbF4HogJDoKAlkxDu8D4sKZH6y+j80Yv+N9d6K+aBGwlkbymcFfeFmn0WPzBLZLiWGf+xKyg==
X-Received: by 2002:a05:600c:4ed2:b0:477:9e10:3e63 with SMTP id 5b1f17b1804b1-477c1164cebmr221319555e9.35.1764249575070;
        Thu, 27 Nov 2025 05:19:35 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790b0cc1d6sm94305175e9.12.2025.11.27.05.19.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 05:19:34 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 1/2] qpdf: Add native and nativesdk to BBCLASSEXTEND
Date: Thu, 27 Nov 2025 15:19:31 +0200
Message-ID: <20251127131932.1256234-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Nov 2025 13:19:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122106

Add native and nativesdk to BBCLASSEXTEND because python3-pikepdf
requires nativesdk-qpdf.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
index 8ed993aa78..663c60affe 100644
--- a/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
+++ b/meta-oe/recipes-printing/qpdf/qpdf_12.2.0.bb
@@ -28,3 +28,5 @@ do_install:append() {
     # Change the fully defined path on the target
     sed -i -e 's|${STAGING_LIBDIR}|${libdir}|g' ${D}${libdir}/cmake/${BPN}/libqpdfTargets.cmake
 }
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.47.3


