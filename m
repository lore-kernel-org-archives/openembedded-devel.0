Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C93B8CCD184
	for <webhook@archiver.kernel.org>; Sat, 11 Oct 2025 18:13:44 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web11.5327.1760206423674628561
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 11:13:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l2JLq74z;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b40f11a1027so539913166b.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 11:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760206422; x=1760811222; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tMEDUmOZ15AdXvdv72jCMyaFFpRF2buocSwgSsxUMzA=;
        b=l2JLq74z2PaRTsZ272Zp0XiHHHwgm2zGCxV6pjvaxi//t3Hog3Lrmbia9qGsCm4Gt3
         g02SQiDamHQmmpIUqH2RzEPtjn68/jFRUcN0xDX2vILEIWL1kIpoISQwKAAFTDrImCSe
         C8wi4KXq8YMYuiE2RomurL0cXZQMcC3F6i+TZDiSMts8E2c4ye4S5pr71wVFmiHSuR8O
         O9fiVQ7V3rqhvHPbkS4Itz7AbNdnfz0Fshxka/kWntZZbrG6hnFyKIUs8QPdh76xrx80
         oF1eNKz4vEogf9+pKPu+sw+YHYZjRCxZeNCxRiQNIBy6AsatSY2ZkKT5vFr5DFNPC3CI
         +FpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760206422; x=1760811222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMEDUmOZ15AdXvdv72jCMyaFFpRF2buocSwgSsxUMzA=;
        b=j2D52jNrja4Gjva0knDxdrO2MBYriN+kdU1AGjOJjgzkOEAoEAGJ2RmXMswLz4qUK0
         AEUokEXLBE/3U/OT/QCi4s+z+xWZutx/3a7DGtFbtutdr7cmvPiiSUN3ALh3rcN1DRxp
         ukOsr3m+zNLvy8GrXTBeEybPXK7teh+y4wSdJ5WST57fls1IxrUjOozwsTho/I19fP+S
         lqtlKEoRDD26ff4meD8D5qmUrv/CA0kWuyF7ig02Vs56Oa6fjN7+JPbLqkZ1oEQWMzBh
         fvlmdnFp9HMFsWlShIjWreaPAPplG7YQkNjChlgq1kbk299eUdX98pJrOUl3ussIlL5w
         RkGA==
X-Gm-Message-State: AOJu0YwkBhrEYunHvDkmNOM0pCtUZIFg/ZPlRufWx9QdRaDKBR18kBqa
	hOIQALiOE0SOiDpPtT5v1rTRDZf6yv7Ll1vnsHjdDMMPeTaZ6qWfdqKkX4cdLA==
X-Gm-Gg: ASbGnctkhx9euO103KGqpzGZs8owX8lVeXHYEN7PeAToeSeZHifBjSXEGuUMRp8WGFy
	UFHp3Ypy0YdwummiWSQ12Y+3n12HzT0DFlOr34CMMN4vF8DTN/FGyp4oIdDc18BAe9Vr5zmotgA
	8Q2EOtKLo31JKI1J12jAxe5P1DPjs5FsaT5H5vL4PrOiL3i4QjGDV6p+f+V0tkmN1KL/lM5uzxn
	WDnr9A/0CKmuIkVBmTPCOWeQeIrXcCDawAsXuc6Q+Wzjz2Wj9icuwGMgEHz4HMI/fbBfPif+Ra6
	wICnPuccPoRPM1qAGUCO8Tya1W0iPhbtTVwXI0pfAUzuQ5veUO+KcpKrCbbUZPr2V80agEsLdvF
	eI7Kx/9yOO1aodnLDdl+KuHI0ozpF1KmwJfX6pRv+Wea1IXcSVQ==
X-Google-Smtp-Source: AGHT+IGJ3nnayflylc+QMGTzniQYUcky+l+tVjD8Ohnk5/6cScdl/mTh2OLtp/8XRh2ops3+KG9aQQ==
X-Received: by 2002:a17:907:7e96:b0:b3d:d6be:4cbe with SMTP id a640c23a62f3a-b50aa8a9063mr1857016266b.18.1760206421924;
        Sat, 11 Oct 2025 11:13:41 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cad8adsm547156166b.7.2025.10.11.11.13.41
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 11:13:41 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 03/10] freerdp3: patch CVE-2024-32458
Date: Sat, 11 Oct 2025 20:13:32 +0200
Message-ID: <20251011181339.2127670-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011181339.2127670-1-skandigraun@gmail.com>
References: <20251011181339.2127670-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:13:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120502

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32458

Pick the commit that is marked to resolve the related github advisory.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp3/CVE-2024-32458.patch     | 119 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |   1 +
 2 files changed, 120 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32458.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32458.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32458.patch
new file mode 100644
index 0000000000..a9b51221d4
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2024-32458.patch
@@ -0,0 +1,119 @@
+From 3033c4d69afbb23f577cf6962314613ef96782fd Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:42:52 +0200
+Subject: [PATCH] fix missing input length checks
+
+CVE: CVE-2024-32458
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/9da3f236985207378abe64bc401cecd8566e4542]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/planar.c | 54 +++++++++++++++++++++++++++++----------
+ 1 file changed, 40 insertions(+), 14 deletions(-)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index 0ec086269..4b51a023e 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -788,18 +788,26 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 		rawHeights[3] = nSrcHeight;
+ 	}
+ 
++	const size_t diff = srcp - pSrcData;
++	if (SrcSize < diff)
++	{
++		WLog_ERR(TAG, "Size mismatch %" PRIu32 " < %" PRIuz, SrcSize, diff);
++		return FALSE;
++	}
++
+ 	if (!rle) /* RAW */
+ 	{
++
+ 		UINT32 base = planeSize * 3;
+ 		if (cs)
+ 			base = planeSize + planeSize / 2;
+ 
+ 		if (alpha)
+ 		{
+-			if ((SrcSize - (srcp - pSrcData)) < (planeSize + base))
++			if ((SrcSize - diff) < (planeSize + base))
+ 			{
+-				WLog_ERR(TAG, "Alpha plane size mismatch %" PRIu32 " < %" PRIu32,
+-				         SrcSize - (srcp - pSrcData), (planeSize + base));
++				WLog_ERR(TAG, "Alpha plane size mismatch %" PRIuz " < %" PRIu32, SrcSize - diff,
++				         (planeSize + base));
+ 				return FALSE;
+ 			}
+ 
+@@ -817,10 +825,9 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 		}
+ 		else
+ 		{
+-			if ((SrcSize - (srcp - pSrcData)) < base)
++			if ((SrcSize - diff) < base)
+ 			{
+-				WLog_ERR(TAG, "plane size mismatch %" PRIu32 " < %" PRIu32,
+-				         SrcSize - (srcp - pSrcData), base);
++				WLog_ERR(TAG, "plane size mismatch %" PRIu32 " < %" PRIu32, SrcSize - diff, base);
+ 				return FALSE;
+ 			}
+ 
+@@ -841,8 +848,8 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 		if (alpha)
+ 		{
+ 			planes[3] = srcp;
+-			rleSizes[3] = planar_skip_plane_rle(planes[3], SrcSize - (planes[3] - pSrcData),
+-			                                    rawWidths[3], rawHeights[3]); /* AlphaPlane */
++			rleSizes[3] = planar_skip_plane_rle(planes[3], SrcSize - diff, rawWidths[3],
++			                                    rawHeights[3]); /* AlphaPlane */
+ 
+ 			if (rleSizes[3] < 0)
+ 				return FALSE;
+@@ -852,22 +859,41 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 		else
+ 			planes[0] = srcp;
+ 
+-		rleSizes[0] = planar_skip_plane_rle(planes[0], SrcSize - (planes[0] - pSrcData),
+-		                                    rawWidths[0], rawHeights[0]); /* RedPlane */
++		const size_t diff0 = (planes[0] - pSrcData);
++		if (SrcSize < diff0)
++		{
++			WLog_ERR(TAG, "Size mismatch %" PRIu32 " < %" PRIuz, SrcSize, diff0);
++			return FALSE;
++		}
++		rleSizes[0] = planar_skip_plane_rle(planes[0], SrcSize - diff0, rawWidths[0],
++		                                    rawHeights[0]); /* RedPlane */
+ 
+ 		if (rleSizes[0] < 0)
+ 			return FALSE;
+ 
+ 		planes[1] = planes[0] + rleSizes[0];
+-		rleSizes[1] = planar_skip_plane_rle(planes[1], SrcSize - (planes[1] - pSrcData),
+-		                                    rawWidths[1], rawHeights[1]); /* GreenPlane */
++
++		const size_t diff1 = (planes[1] - pSrcData);
++		if (SrcSize < diff1)
++		{
++			WLog_ERR(TAG, "Size mismatch %" PRIu32 " < %" PRIuz, SrcSize, diff1);
++			return FALSE;
++		}
++		rleSizes[1] = planar_skip_plane_rle(planes[1], SrcSize - diff1, rawWidths[1],
++		                                    rawHeights[1]); /* GreenPlane */
+ 
+ 		if (rleSizes[1] < 1)
+ 			return FALSE;
+ 
+ 		planes[2] = planes[1] + rleSizes[1];
+-		rleSizes[2] = planar_skip_plane_rle(planes[2], SrcSize - (planes[2] - pSrcData),
+-		                                    rawWidths[2], rawHeights[2]); /* BluePlane */
++		const size_t diff2 = (planes[2] - pSrcData);
++		if (SrcSize < diff2)
++		{
++			WLog_ERR(TAG, "Size mismatch %" PRIu32 " < %" PRIuz, SrcSize, diff);
++			return FALSE;
++		}
++		rleSizes[2] = planar_skip_plane_rle(planes[2], SrcSize - diff2, rawWidths[2],
++		                                    rawHeights[2]); /* BluePlane */
+ 
+ 		if (rleSizes[2] < 1)
+ 			return FALSE;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 19ba893724..8d41063811 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -11,6 +11,7 @@ SRCREV = "708f3764897e06297469a7b0507b3c9ecc041ad7"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2024-32039.patch \
            file://CVE-2024-32040.patch \
+           file://CVE-2024-32458.patch \
            "
 
 S = "${WORKDIR}/git"

