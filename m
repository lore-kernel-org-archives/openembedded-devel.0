Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 235A1D3C54E
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 13:25:53 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15288.1765373146203593121
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Dec 2025 05:25:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ej4vWI+0;
 spf=pass (domain: gmail.com, ip: 209.85.214.172, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2984dfae043so71035305ad.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 05:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765373145; x=1765977945; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS7owvc3DSZ7qz2v4JhD8qFNNOEX7uJWFSteIOf5XzE=;
        b=Ej4vWI+03/Kgq/UGKVV/4Flx0ppBmbA5VAlgxnXoKSWItDQPA8vNb8CeKmMMo58UQw
         zZlhZvVh7z0ClgKinUTqpnSMQRUged1xyZMzme4nB9b5cQtKrJGzxZqjGv04j7OUJWH+
         JLKYBVcMNU15jXrK0NO1x5rA4Y9HpTTac3HTr/yvRd3Ya1fXyJNOs4iRv/NHKhqrRWON
         dbTij8yzXZuZi/fdQfxUJKNWDsr03FOcuH3HWagSIkzQTBVJYpbWacPoLEXDv4koEO1f
         IwIjaPXZb9kYVpQxlqS+kLLn1moXRLKTpMs3kUlXk0UmZ0T1dsRvDaqn379eHTCG6HVx
         Lr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765373145; x=1765977945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IS7owvc3DSZ7qz2v4JhD8qFNNOEX7uJWFSteIOf5XzE=;
        b=Xul380vhh3DOmGSbq7XhQlxzwgcyRYQ/VNt1irniYWifKio7y20vwl3xIcWQW3ZMgG
         OR/JKNSTMmmJvuN/QILBv6tQmC5U6/WQCmFoAN5uLdUazEoXoE4hytX5M6BvYv3ppVju
         /zZNXZJ3wq1UCp25bM4+wI9z/wFqcPdaeYSXzuA5DKEwZZUoEJJ2+LVy1RacJnNOM/Fg
         ZnfPAVksLcmFCJvTz6/PzbJ7XbCn8dfMqNlhkmkD6wsb33VRfQNsSc3PE/1tP3wn2gt4
         ybR7hQp+Dn4NUrJpQK1dtjafA0cO7lyiPo9GLL7pxm2nNgsMFGuPq0+4pNvDXJD3ccMw
         0+/w==
X-Gm-Message-State: AOJu0YydohXRMx+WnbpWLnpWS9OW2MTR1RtqAoJzV0ZjIb+dvQo0BY8P
	qBsCAcJg5nga9HxbC4jx9bsE4R4cXkAn2GWOS6VTmV1CKdNmoVkE2hvqbwWL4A==
X-Gm-Gg: AY/fxX7uhw65kVugnGiSbQg93JTesPNkpRuQR5LjTvL1ZVaYTvM+i5RZoOgjbNPxFX+
	XoPzZfad5LlZvjvR4MBpYmsuQbiUuLwVi+BoBSSKywoRE4q3dkwHIz3ewFvHeaSyrHt7Pa4CGUw
	+0rwcFqZ6S4wtsPxn14kSIVCFRQN3zowm3v2bHpAwbacRZvdoy1EYqWLTqB4qlX1rC2LYRyvALH
	3Ve49sq+rH06uYo0ZUVlzV6biwJCliqmzrFsCsW9e3BXmSdqv6kRRu5aSSosjtDLyk5xwGYmZ/g
	bOHC0zC0tDp93fWtBvhidTDztUzfjFN3BHlN/NXMVfiqAs3mTwRlrQ/ipTLVxDx+Cy1YX3VQXDt
	3+UJtI47xDcwETxsp5OrB4MkmzQgmyvjTMG4ES4zXgu6MVfvf8P4JlXAW1C/5Fxy+Hm6wDjTa+4
	t5/x/oaWJMvlegR4ShmPC9C2M=
X-Google-Smtp-Source: AGHT+IHiY0rhSOy8b+GWP5Bx3m/pIl3hQJjXV376hx22h647Vg2I6ajtv42WAt9L0xn7ZC5Tr9aaog==
X-Received: by 2002:a17:902:da8b:b0:298:2879:fdf5 with SMTP id d9443c01a7336-29ec2db234dmr20901035ad.61.1765373145278;
        Wed, 10 Dec 2025 05:25:45 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([122.161.48.114])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29daeaabf7csm184283485ad.79.2025.12.10.05.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 05:25:44 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][whinlatter][PATCH 19/43] qpdf: Add native and nativesdk to BBCLASSEXTEND
Date: Wed, 10 Dec 2025 18:55:29 +0530
Message-ID: <20251210132530.306506-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
References: <20251210132530.306506-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Dec 2025 13:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122523

From: Leon Anavi <leon.anavi@konsulko.com>

Add native and nativesdk to BBCLASSEXTEND because python3-pikepdf
requires nativesdk-qpdf.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit fa702ab3984417dd0d4370e44ed8d891cbf59b9b)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
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

