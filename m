Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5BA2D3EE9A
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 06:43:45 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.62297.1769150615209203116
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 22:43:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i+MzUeCP;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359249bbacso1846056f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 22:43:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769150613; x=1769755413; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MlR2l5Wpg3ztu9hF1edDGnn3XV0q7ljj2ueYiMQzRro=;
        b=i+MzUeCPbe3lJFQcth/psOyoUAiud1GTpeMOAI9dOe+9Gd4HGeYucMNKvtNkke0npV
         ypd5Vz7o9roCbsCEfANjnc7Yvg1ROjEQKI3F31VMwF06rNvmIr0iF8OSCKg4jyOc9/JM
         Q1mcOFIdg0NXWTNEU9quCn3eHSdUTibGsuprUWLgMIpwou7PEiKJapfwINeTRSkPpnkj
         IbDxiwngKZvTpCPlHcV/rrZn/IL1ViUpEv7wxMsajTCsztMcmFCu4cUFUDjr0h+19puq
         WWMCUsSTFkTfJFs4VII0cAz0P2jxqbqzOrw5ZjbUfxqGHmvMz2Qj4N5atg+Pjw2E9xoi
         yFUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150613; x=1769755413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MlR2l5Wpg3ztu9hF1edDGnn3XV0q7ljj2ueYiMQzRro=;
        b=Oep9CG0VZdNlPXZud+37D0b6DP+iIQEHG/8aYXQwHXgC1r280soZC3EoFa2Flr0eyw
         YPgv8Zt4y2yNn+LTKk5W0tSlDHmGGhSGw4Lul4YkOfy6+ZEsgW3HblIzpPXxxL6ZAGjM
         dZTXEHlmIkQ6KT4hkqQjopJlXLRRt2oBV023aYyrvFivgxPO+4SgR9XLSbbawHLznnqQ
         vxn8VNxns9sxOx56Ou8lM8IrdgZ4ri0K06VRw3qjOxcqq08M7+r1UCJ50yn00VE4QZHH
         /z/1L0fQEaSBfmg8LpApY4P+RhiAahIrze4A/faq6SXXT1Sv3VhxH6qSMwjAZjb7qGi/
         HM0A==
X-Gm-Message-State: AOJu0Yzhjo7vHTNVby8BPlU4MsOYJfQACZ/5hX90AUr4ZykgBDlJY/CI
	RNyAjTBM+VkIjYgC0La18Kok6f/PFEj/XxoVfdU7vOKiQjpM7OkmWrlVulwW2w==
X-Gm-Gg: AZuq6aK2HyT72NzCc3VZ3Rb8juh49j15KNv55tVQsdt4NSc3IdSsz/6f2PIQQUAdOHz
	YACiQiF7zVm9YjB0WO1FYXTr83z3sIf6ZNGlLXFmD+6J47Z5sUZDVU+baaTmT0ZvEmGnpnR1qWH
	5Tvj7hW7tq62KuubP2T7BknZqhAWVZFxw7jTIU0fI4oE4naOiThN9q/IQhuMZzHYgQoxtea8Uza
	oFkY6hZ/OsFm42fMQ98HISx+J2JrG/Tle06QlFPZt/nybJhLqFjH4q8yrasZ3d99hp+3EXjSoBb
	f54EJzaaBMO/EqaDA3RL5xOG0tPqttIzyjy5VDjCersp6iklrG8WChlbzl54rrrly7O+palszU8
	+XmdynMyUp3dNck86n/7S5rGNB+mFstYc9iAr1WEd7pgXojzeAvWBNSzeY5kqGzpxtLRP5dXo9i
	09CPn3TuLt
X-Received: by 2002:a05:6000:400a:b0:431:2ff:128f with SMTP id ffacd0b85a97d-435b1ab836dmr3278282f8f.6.1769150613499;
        Thu, 22 Jan 2026 22:43:33 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c02cd8sm4051608f8f.8.2026.01.22.22.43.32
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:43:33 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] freerdp: patch CVE-2024-32458
Date: Fri, 23 Jan 2026 07:43:29 +0100
Message-ID: <20260123064332.4001588-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123064332.4001588-1-skandigraun@gmail.com>
References: <20260123064332.4001588-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 06:43:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123765

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-32458

Pick the patch that is marked to resolve this vulnerbility by the
relevant Github advisory[1].

[1]: https://github.com/FreeRDP/FreeRDP/security/advisories/GHSA-vvr6-h646-mp4p

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2024-32458.patch      | 118 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32458.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32458.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32458.patch
new file mode 100644
index 0000000000..eeba767d91
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2024-32458.patch
@@ -0,0 +1,118 @@
+From f04f5fc28869140079c3c5edca614e495493b9ba Mon Sep 17 00:00:00 2001
+From: akallabeth <akallabeth@posteo.net>
+Date: Tue, 16 Apr 2024 08:42:52 +0200
+Subject: [PATCH] fix missing input length checks
+
+(cherry picked from commit 52d75f6f4078143951e8a4976bc5af30a5556cb6)
+
+CVE: CVE-2024-32458
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/9bc624c721ecde8251cfabd1edf069bc713ccc97]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/codec/planar.c | 53 +++++++++++++++++++++++++++++++--------
+ 1 file changed, 43 insertions(+), 10 deletions(-)
+
+diff --git a/libfreerdp/codec/planar.c b/libfreerdp/codec/planar.c
+index 58d4e4bae..9f891b9c7 100644
+--- a/libfreerdp/codec/planar.c
++++ b/libfreerdp/codec/planar.c
+@@ -679,6 +679,13 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
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
+ 		UINT32 base = planeSize * 3;
+@@ -687,8 +694,12 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 
+ 		if (alpha)
+ 		{
+-			if ((SrcSize - (srcp - pSrcData)) < (planeSize + base))
++			if ((SrcSize - diff) < (planeSize + base))
++			{
++				WLog_ERR(TAG, "Alpha plane size mismatch %" PRIuz " < %" PRIu32, SrcSize - diff,
++				         (planeSize + base));
+ 				return FALSE;
++			}
+ 
+ 			planes[3] = srcp;                    /* AlphaPlane */
+ 			planes[0] = planes[3] + rawSizes[3]; /* LumaOrRedPlane */
+@@ -700,8 +711,11 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
+ 		}
+ 		else
+ 		{
+-			if ((SrcSize - (srcp - pSrcData)) < base)
++			if ((SrcSize - diff) < base)
++			{
++				WLog_ERR(TAG, "plane size mismatch %" PRIu32 " < %" PRIu32, SrcSize - diff, base);
+ 				return FALSE;
++			}
+ 
+ 			planes[0] = srcp;                    /* LumaOrRedPlane */
+ 			planes[1] = planes[0] + rawSizes[0]; /* OrangeChromaOrGreenPlane */
+@@ -716,8 +730,8 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
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
+@@ -727,22 +741,41 @@ BOOL planar_decompress(BITMAP_PLANAR_CONTEXT* planar, const BYTE* pSrcData, UINT
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
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 06aac0325f..0a01b2095a 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -34,6 +34,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2024-22211.patch \
            file://CVE-2024-32039.patch \
            file://CVE-2024-32040.patch \
+           file://CVE-2024-32458.patch \
            "
 
 S = "${WORKDIR}/git"

