Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05B8FE9DE57
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:13 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127045.1775718602995238363
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=mh+/VfnP;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82cec955160so463257b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718602; x=1776323402; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSOVxLbF2yRNmXldt/BPWNnzpP+B5RUCUgYv/Jai+SI=;
        b=mh+/VfnPkJJWA6GnKuMki2oGcvuWQtZRO8Om1dSF8iVz1qTknMZ4/2C1Piu8kICpTo
         bAtwWBtl+syrDGrMIiHuS2jEsLs6n1qOAkMGjFFIMxrMDQDQpfBDUMqjk3gHvIeG8kHQ
         hoH8gSyaxY3HYoSe7Coi98/CXeVf1mOvLO5SEfcJZajjb6Xp2u2NVTYhX5a9V9Dk9ocP
         hWTQFs1ULJXM6P/7kKKq02W5BQX8qfCsL8HA2F/MzR4hD8dLgiPzQWX5xqzdTnTK+e8s
         +KkVQX1C5IrL7bnJ7hG+3HgHYiv6T3W55PsZejQjcqlkkEJSVmZGHEbhNwNqCEmUftfk
         butQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718602; x=1776323402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSOVxLbF2yRNmXldt/BPWNnzpP+B5RUCUgYv/Jai+SI=;
        b=LQNjVAMGz8WYmOb6jwrpmubW7wWUe53kpJR424K6ChbkQ7Xomk+C51N5cWV25r/vW0
         VXby7iVoZ69ph3Jl2fZ+Q0SPKhZgPzO41hu7dNwUF5j/uzZ2BCf7lmbFXJUrlNLK2a4L
         VRllSwjQaXQx547fBGC+TbsxWUhtuLNxrySdPlo7/YcoCVuQ+uuYwa/Sh1kRM7dN16m1
         UkzKyYzPYeC0uEQ+hapB1Ar9aRvFLA79RB4//Qub3vEX0BvAS0XCV3fkEmy5USpqhr4O
         PJ5hY92RDI7CUJ3vVsIqAmEuLu/GPaBkMwTkNAdOZGJXSvqhLVFGikE3ARG6TxE3AvY8
         lJVg==
X-Gm-Message-State: AOJu0YzXRNsiQukmQwQZMbvtx1PIoFx4tfzewwV6jKD0NeSo3rdA6ST+
	N6rZzbHw4HglwFl1SUXKYVOyZ5v0nG0T9WpYAuREgqJAe62t9uifSPct2bdg7Q==
X-Gm-Gg: AeBDiesZr6FWHpfS0u8+VkXPnSixmu6tNkXECePhqf8sYoMvu6WGT4eq0lE79NUQ32b
	MCyskLyVDsgbhGINeiyG2T1xvTEFf7VE450+1dPpcvzXXO84E8rFfoDaoQYTU90AA/Z+hGt46R3
	RveOKP6gNciPsMfW2Dmtme86SPJTx6qBccTetbCjWLi1hFT//JZmWArOoV3r8lrKbRifkURf/0T
	HAxqz6yKsKdGvbowXIs8/FQPD5te6rfObTCTcKIA1qR91UZWR9pkJDw5n5OvAjp2FudgVz4lm0u
	pjAFn9vkN65ulJ2oOiYBaWjJxBobOGFXSelWIrBf8AfQjujnuLa2F5WEAvPTFaG1bFIma1Y6/8q
	2poBm1qO2Cse+nWvUra1dVULrp6VkHfW8RTxB6qVHJP+Y/R3Kp3E7BKCya28tetSciUqdh3amdH
	cGusIqlJP5KZOc24iWIy0b6/yEAG5UsR3SlK0=
X-Received: by 2002:a05:6a00:2d0d:b0:82c:217c:98ca with SMTP id d2e1a72fcca58-82dd89c4141mr2740424b3a.12.1775718601997;
        Thu, 09 Apr 2026 00:10:01 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:01 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 14/22] freerdp3: fix CVE-2026-29774
Date: Thu,  9 Apr 2026 19:09:11 +1200
Message-ID: <20260409070919.3968586-14-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126136

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29774

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-29774.patch     | 75 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 76 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch
new file mode 100644
index 0000000000..aaf83fd90c
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29774.patch
@@ -0,0 +1,75 @@
+From b590224c94effa3104a2db98a59478a9c4ed6f02 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Sat, 28 Feb 2026 11:38:23 +0100
+Subject: [PATCH] [codec,h264] validate rectangles before use
+
+CVE: CVE-2026-29774
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/6482b7a92fff3959582cef052d1967ad6bde3738]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/h264.c | 38 ++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/libfreerdp/codec/h264.c b/libfreerdp/codec/h264.c
+index 718bd2ccf..13d592600 100644
+--- a/libfreerdp/codec/h264.c
++++ b/libfreerdp/codec/h264.c
+@@ -91,6 +91,36 @@ BOOL avc420_ensure_buffer(H264_CONTEXT* h264, UINT32 stride, UINT32 width, UINT3
+ 	return TRUE;
+ }
+ 
++static BOOL isRectValid(UINT32 width, UINT32 height, const RECTANGLE_16* rect)
++{
++	WINPR_ASSERT(rect);
++	if (rect->left > width)
++		return FALSE;
++	if (rect->right > width)
++		return FALSE;
++	if (rect->left >= rect->right)
++		return FALSE;
++	if (rect->top > height)
++		return FALSE;
++	if (rect->bottom > height)
++		return FALSE;
++	if (rect->top >= rect->bottom)
++		return FALSE;
++	return TRUE;
++}
++
++static BOOL areRectsValid(UINT32 width, UINT32 height, const RECTANGLE_16* rects, UINT32 count)
++{
++	WINPR_ASSERT(rects || (count == 0));
++	for (size_t x = 0; x < count; x++)
++	{
++		const RECTANGLE_16* rect = &rects[x];
++		if (!isRectValid(width, height, rect))
++			return FALSE;
++	}
++	return TRUE;
++}
++
+ INT32 avc420_decompress(H264_CONTEXT* h264, const BYTE* pSrcData, UINT32 SrcSize, BYTE* pDstData,
+                         DWORD DstFormat, UINT32 nDstStep, UINT32 nDstWidth, UINT32 nDstHeight,
+                         const RECTANGLE_16* regionRects, UINT32 numRegionRects)
+@@ -101,6 +131,9 @@ INT32 avc420_decompress(H264_CONTEXT* h264, const BYTE* pSrcData, UINT32 SrcSize
+ 	if (!h264 || h264->Compressor)
+ 		return -1001;
+ 
++	if (!areRectsValid(nDstWidth, nDstHeight, regionRects, numRegionRects))
++		return -1013;
++
+ 	status = h264->subsystem->Decompress(h264, pSrcData, SrcSize);
+ 
+ 	if (status == 0)
+@@ -523,6 +556,11 @@ INT32 avc444_decompress(H264_CONTEXT* h264, BYTE op, const RECTANGLE_16* regionR
+ 	if (!h264 || !regionRects || !pSrcData || !pDstData || h264->Compressor)
+ 		return -1001;
+ 
++	if (!areRectsValid(nDstWidth, nDstHeight, regionRects, numRegionRects))
++		return -1013;
++	if (!areRectsValid(nDstWidth, nDstHeight, auxRegionRects, numAuxRegionRect))
++		return -1014;
++
+ 	switch (op)
+ 	{
+ 		case 0: /* YUV420 in stream 1
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index 715354768a..f92d824d66 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -31,6 +31,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24681.patch \
            file://CVE-2026-24682.patch \
            file://CVE-2026-24683.patch \
+           file://CVE-2026-29774.patch \
            "
 
 S = "${WORKDIR}/git"

