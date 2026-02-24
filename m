Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3490EF357D9
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 17:04:55 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25260.1771952692911628146
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Feb 2026 09:04:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Etvr7SiI;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso46781775e9.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771952691; x=1772557491; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6sTdKzQYxfaDLT0pyDsvqdzil+Xkl6JCul0PFqaiWEg=;
        b=Etvr7SiIjWa98qz2GI8hnN3endx5glWL58c/Mbi6bZ6xIyf7XtmkpU2H+Ibovz8Owi
         3S8t7pecoZ/vH2ksGYhPVy4ZGSe1VI5cliXYSRPQ0CVN2asAgrqFyHvkmaTnvdXkk6S4
         TI43Og9ppBKFTSgb40e2G5wLXkkPtouzDJ+nIhm2gNIg3UInACqH5tc7S3pVmpHGT9GB
         Mkemxdc8IlQqa1W0naRf6MGss2LY6jJPGhHUD4FdGBinSBT2vHXuNterMvvNu5dCgXUo
         arH0Fkbp+T0LVWZ7v+7ICzdclbp/uCqDRf+GrmN4m1zbZaCIxvQK09hq7azO2G/1//p4
         V2zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771952691; x=1772557491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6sTdKzQYxfaDLT0pyDsvqdzil+Xkl6JCul0PFqaiWEg=;
        b=HVge00rOQ1CtTcKyyrbcbwZSKdE2ejglXXI3T1/44IJPvPBAHOPcL8gKrT7eA98GXv
         jMU2aGm2sy4rxzVTFyNpCKPfc6sLn62yuoKGubzNF36DoaVUdV6Ve7jReTIJ5zGvabO0
         yYGe9ll81wmLNLT9GD2Hs895rO0SALoPqX6rIVm12z8V+MUCb+Smi5xNXhsn/ZzOhP87
         1AJH89O0Fon1B4VQ/KQHEoQjo5Vd7YsBD9D12CfuGTHIkySPTV0o5YjhGsJp111HZqKB
         UBit8hFPEwa4RqjFf+b90hbhUatGXj8XpNzkRVL4zoMltx25KWzgRx9IOZy7S5bsu0RW
         2UBQ==
X-Gm-Message-State: AOJu0Yy8DtyZjPsT1HwKmr4M20CZnLK+bHxdKrTEP9T0yaODv51kcHDz
	k69j20Fav0lDxdOsuZQMGmVu988pQpl5qhn9o8NoDUQy/JYxxRt7QZDJIE4wHQ==
X-Gm-Gg: AZuq6aLHnXRSzndpbBS/pfeowS84zd5Yn81AafdrqrRBXfzdoYWa3xf8yv/0CznQHaN
	mlLKQi5m8MhZAyF+2TLWkRspYLyAQQtmjhg6daEy+5E5vbDqD4D3p6s0we1D2hlI3k3j3qJGAQR
	TmER/PH8eadhgA32eiKgt9BHd2pmn226p+n60+YAKnV4aZvZAO2fTcz8jjQxVK5y5aoJCA/0CGn
	PFipN6RAJkqR4bh2PdsHLZBnglKCCRSjEFUnR5dVMIgUOKxT8EA+99A/MmLo/He/HdHNoE9tHPh
	On5GPPA0njg8SNQSsCitfx1mI35Tro7EqxOLsGZkWn0kGLGF/2MypukwMJL4LPlPVs4cISFT+RS
	3PoVHpn7PtT+KdphD/T2S4IION2s6u+G+RGWzmtbXY9R5STI96vRHU8R5t7Ipq4+BCXDT70T+X3
	mQPOt1FoJG7AkTU4s9y+qwX5muX5hbwy0=
X-Received: by 2002:a05:600c:3e05:b0:483:78e1:784 with SMTP id 5b1f17b1804b1-483a95aaeb9mr214380975e9.4.1771952691056;
        Tue, 24 Feb 2026 09:04:51 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm19990535e9.0.2026.02.24.09.04.50
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 09:04:50 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] freerdp: patch CVE-2026-23532
Date: Tue, 24 Feb 2026 18:04:47 +0100
Message-ID: <20260224170448.1310931-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224170448.1310931-1-skandigraun@gmail.com>
References: <20260224170448.1310931-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Feb 2026 17:04:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124584

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-23532

The related Github advisory[1] contains a detailed analysis about
the vulnerability. Pick the patch that describes the same
issue in its description.

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-fq8c-87hj-7gvr

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2026-23532.patch      | 49 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.11.7.bb |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23532.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23532.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23532.patch
new file mode 100644
index 0000000000..80d4af30b9
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2026-23532.patch
@@ -0,0 +1,49 @@
+From 51929613e6897489736a35eaaf14a3accf143963 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 15 Jan 2026 12:04:36 +0100
+Subject: [PATCH] properly clamp SurfaceToSurface
+
+From: akallabeth <akallabeth@posteo.net>
+
+CVE: CVE-2026-23532
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/c4a7c371342edf0d307cea728f56d3302f0ab38c]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/gdi/gfx.c | 9 +++++----
+ 1 file changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/libfreerdp/gdi/gfx.c b/libfreerdp/gdi/gfx.c
+index 3970715e0..812568bbb 100644
+--- a/libfreerdp/gdi/gfx.c
++++ b/libfreerdp/gdi/gfx.c
+@@ -1175,7 +1175,6 @@ static UINT gdi_SurfaceToSurface(RdpgfxClientContext* context,
+ 	UINT status = ERROR_INTERNAL_ERROR;
+ 	UINT16 index;
+ 	BOOL sameSurface;
+-	UINT32 nWidth, nHeight;
+ 	const RECTANGLE_16* rectSrc;
+ 	RECTANGLE_16 invalidRect;
+ 	gdiGfxSurface* surfaceSrc;
+@@ -1199,8 +1198,8 @@ static UINT gdi_SurfaceToSurface(RdpgfxClientContext* context,
+ 	if (!is_rect_valid(rectSrc, surfaceSrc->width, surfaceSrc->height))
+ 		goto fail;
+ 
+-	nWidth = rectSrc->right - rectSrc->left;
+-	nHeight = rectSrc->bottom - rectSrc->top;
++	const UINT32 nWidth = rectSrc->right - rectSrc->left;
++	const UINT32 nHeight = rectSrc->bottom - rectSrc->top;
+ 
+ 	for (index = 0; index < surfaceToSurface->destPtsCount; index++)
+ 	{
+@@ -1209,8 +1208,10 @@ static UINT gdi_SurfaceToSurface(RdpgfxClientContext* context,
+ 		if (!is_rect_valid(&rect, surfaceDst->width, surfaceDst->height))
+ 			goto fail;
+ 
++		const UINT32 rwidth = rect.right - rect.left;
++		const UINT32 rheight = rect.bottom - rect.top;
+ 		if (!freerdp_image_copy(surfaceDst->data, surfaceDst->format, surfaceDst->scanline,
+-		                        destPt->x, destPt->y, nWidth, nHeight, surfaceSrc->data,
++		                        destPt->x, destPt->y, rwidth, rheight, surfaceSrc->data,
+ 		                        surfaceSrc->format, surfaceSrc->scanline, rectSrc->left,
+ 		                        rectSrc->top, NULL, FREERDP_FLIP_NONE))
+ 			goto fail;
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index d4efcccdbd..dff3f6dafe 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -28,6 +28,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2026-22855.patch \
            file://CVE-2026-22852.patch \
            file://CVE-2026-23530.patch \
+           file://CVE-2026-23532.patch \
            "
 
 

