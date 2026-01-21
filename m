Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880A1CA5FDF
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 07:04:49 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6846.1768979082650016228
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Jan 2026 23:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hahU6lOd;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4801d1daf53so45540645e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 20 Jan 2026 23:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768979081; x=1769583881; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jOIO/mflFqoyn3mwMAjvF/AZJKPAblAxPoqGeadGDqo=;
        b=hahU6lOdBBWCS5FOPFxybnFEXeiUbW3SzmtopO9Sclc7N0LVYBOh2eOPycMT6Wsosd
         QJBIA4HkkF2KuKbTahdnRfXARMTj4bcAC9Xhah4kK0l4oBeG4QEPy92HiEhEjpDLxBOM
         Biys8p/NRnuBCxQ2s7K3aCfp/xq9hP0m9GABsG/M1k0x7q7NX3ZDXkuOvrHZYMw7SpQy
         emsJAmwMFz64k3tyf+4Huf+Zyz+PRL+Y2SMfRNeuZTtqJKEhmVdOA4eSO44JW53REFld
         mzofFT3Fdr8WzC6Q37La+BrQgkTRLPj/mINUXqL5aIjmZQ354Rd2lLaeZynF3qhy0euk
         dNWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768979081; x=1769583881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jOIO/mflFqoyn3mwMAjvF/AZJKPAblAxPoqGeadGDqo=;
        b=WUWCBaQYHep7v3ZNteVTJYvnT0gdl8tax2dPgns8IKWKGms7tgyHHXJP6ANDjBlK7S
         dectaibtB1oORV8OasQAycF1UALTdjZq335nEDeCJQvbezi62d/N5d5YsnGzmAtL9DS/
         a1Zch9xlDZlx1wBkW4v+NFbHcTCvU90rAcczF8UKB167tJYf5rSvB2SWD66eHEcwkyHn
         qBGtg6m5N28iKYfdJxngu9GcveOr6LY4ij40nkiJVnCw1Xae9jAgMq9PaN+YfGu5FDkJ
         v5zNf1pWYHkZojnuebM9ukpyh0pWQFGe8RuMSqA7x0PSLhiWt3GmCM/LiDbQEXw7IjDY
         oX8A==
X-Gm-Message-State: AOJu0Yzuca2dJcbrGNgt+8QboEKQneqUTvkgWnBbj1feoblLQYkR6eKH
	JMLL5v+rXpqSjct0YzA+f+imMzKVx6vYo53OLAWSbl3UlZo57noq3KM4u5afdw==
X-Gm-Gg: AZuq6aKHel9OmXgw7A9AC0roSKmCLwuehv2ze7CFlbGGlEnNOTxaqPMWdvOgxxiSrDA
	J8cGRxY+/ouIeIh3rbfC7reXHeFvgSYh1O7D6e75fkwX0z/jrgiIa2Kr52ZmuP3ZqQl9H8g9B65
	AksDNZjKrlvP9us/8v1qIoN+tBDYR5u/IPPOAQnkXfGHJIOHS6wVVruz5msIUIMjTIzUnYl6sva
	D2Z6t4cQlQ20WxdbbeUy8yFKYM+naOIT44ld6ZpxT1MDC0kTmLQOguHMu/mbsNf/xA5LqV8btIz
	itt9Fx8HYZ7sdi4Ooa1d7zNtvaUJ01LFQ8qnnaED2hUpLeN+tcvaOPc0LcEz0KXF/3W7Pk6bFOW
	xaDyEDT+rayr9yIGRfdjGsovZcdLwC/Gi74FsiSu3sta7e21/RhADHkQ6bZiztmUi2KVMO3o+jZ
	eVX/nJreZG
X-Received: by 2002:a05:600c:8b09:b0:47e:e4f5:1910 with SMTP id 5b1f17b1804b1-4801e34a14fmr225281685e9.34.1768979080822;
        Tue, 20 Jan 2026 23:04:40 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356996dadbsm34106880f8f.21.2026.01.20.23.04.40
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 23:04:40 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/5] freerdp: patch CVE-2023-39352
Date: Wed, 21 Jan 2026 08:04:36 +0100
Message-ID: <20260121070439.1632875-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260121070439.1632875-1-skandigraun@gmail.com>
References: <20260121070439.1632875-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Jan 2026 07:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123685

Details: https://nvd.nist.gov/vuln/detail/CVE-2023-39352

Backport the commit that was identified[1] by Debian as the solution.

Note: WINPR_ASSERT macro calls have been changed to assert calls, as this
macro doesn't exist yet in this version. Looking at the implementation[2],
it is basically an assert call with a bit verbose logs.
Even though the original implementation also defines a no-op version, the
assert version is enabled by default.

[1]: https://security-tracker.debian.org/tracker/CVE-2023-39352
[2]: https://github.com/FreeRDP/FreeRDP/blob/2.11.0/winpr/include/winpr/assert.h#L31

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../freerdp/freerdp/CVE-2023-39352.patch      | 124 ++++++++++++++++++
 .../recipes-support/freerdp/freerdp_2.6.1.bb  |   1 +
 2 files changed, 125 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39352.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39352.patch b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39352.patch
new file mode 100644
index 0000000000..5010aca173
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp/CVE-2023-39352.patch
@@ -0,0 +1,124 @@
+From 5fbd3aa27780d4c1e4610d1e5f1515f50fc3674b Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 22 May 2023 16:03:54 +0800
+Subject: [PATCH] add bound check in gdi_SolidFill
+
+From: houchengqiu <houchengqiu@uniontech.com>
+
+In Windows remote run vulnerabillities exe program, to create
+Micorosoft::Windows::RDS::Graphics channel, case Remmina crash.
+So, add bound check, limit the size of the requested rect, no larger than the surface data buffer.
+
+(cherry picked from commit 6a63441e4ee8e2bf333361f5d24156a183b14ecd)
+
+CVE: CVE-2023-39352
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/856ecaa463e963ecfebc9734423d69139e7b3916]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ libfreerdp/gdi/gfx.c | 70 ++++++++++++++++++++++++++++----------------
+ 1 file changed, 45 insertions(+), 25 deletions(-)
+
+diff --git a/libfreerdp/gdi/gfx.c b/libfreerdp/gdi/gfx.c
+index a3b7505c5..d2ca9cb63 100644
+--- a/libfreerdp/gdi/gfx.c
++++ b/libfreerdp/gdi/gfx.c
+@@ -25,6 +25,8 @@
+ 
+ #include "../core/update.h"
+ 
++#include <assert.h>
++
+ #include <freerdp/log.h>
+ #include <freerdp/gdi/gfx.h>
+ #include <freerdp/gdi/region.h>
+@@ -1079,6 +1081,28 @@ static UINT gdi_DeleteSurface(RdpgfxClientContext* context,
+ 	return rc;
+ }
+ 
++static BOOL intersect_rect(const RECTANGLE_16* rect, const gdiGfxSurface* surface,
++                           RECTANGLE_16* prect)
++{
++	assert((rect) && "Assert fail: rect");
++	assert((surface) && "Assert fail: surface");
++	assert((prect) && "Assert fail: prect");
++
++	if (rect->left > rect->right)
++		return FALSE;
++	if (rect->left > surface->width)
++		return FALSE;
++	if (rect->top > rect->bottom)
++		return FALSE;
++	if (rect->top > surface->height)
++		return FALSE;
++	prect->left = rect->left;
++	prect->top = rect->top;
++	prect->right = MIN(rect->right, surface->width);
++	prect->bottom = MIN(rect->bottom, surface->height);
++	return TRUE;
++}
++
+ /**
+  * Function description
+  *
+@@ -1087,40 +1111,36 @@ static UINT gdi_DeleteSurface(RdpgfxClientContext* context,
+ static UINT gdi_SolidFill(RdpgfxClientContext* context, const RDPGFX_SOLID_FILL_PDU* solidFill)
+ {
+ 	UINT status = ERROR_INTERNAL_ERROR;
+-	UINT16 index;
+-	UINT32 color;
+-	BYTE a, r, g, b;
+-	UINT32 nWidth, nHeight;
+-	RECTANGLE_16* rect;
+-	gdiGfxSurface* surface;
+-	RECTANGLE_16 invalidRect;
++	BYTE a = 0;
++	RECTANGLE_16 invalidRect = { 0 };
+ 	rdpGdi* gdi = (rdpGdi*)context->custom;
++
+ 	EnterCriticalSection(&context->mux);
+-	surface = (gdiGfxSurface*)context->GetSurfaceData(context, solidFill->surfaceId);
++
++	assert((context->GetSurfaceData) && "Assert fail: context->GetSurfaceData");
++	gdiGfxSurface* surface = (gdiGfxSurface*)context->GetSurfaceData(context, solidFill->surfaceId);
+ 
+ 	if (!surface)
+ 		goto fail;
+ 
+-	b = solidFill->fillPixel.B;
+-	g = solidFill->fillPixel.G;
+-	r = solidFill->fillPixel.R;
+-	/* a = solidFill->fillPixel.XA;
+-	 * Ignore alpha channel, this is a solid fill. */
++	const BYTE b = solidFill->fillPixel.B;
++	const BYTE g = solidFill->fillPixel.G;
++	const BYTE r = solidFill->fillPixel.R;
+ 	a = 0xFF;
+-	color = FreeRDPGetColor(surface->format, r, g, b, a);
++	const UINT32 color = FreeRDPGetColor(surface->format, r, g, b, a);
+ 
+-	for (index = 0; index < solidFill->fillRectCount; index++)
++	for (UINT16 index = 0; index < solidFill->fillRectCount; index++)
+ 	{
+-		rect = &(solidFill->fillRects[index]);
+-		nWidth = rect->right - rect->left;
+-		nHeight = rect->bottom - rect->top;
+-		invalidRect.left = rect->left;
+-		invalidRect.top = rect->top;
+-		invalidRect.right = rect->right;
+-		invalidRect.bottom = rect->bottom;
+-
+-		if (!freerdp_image_fill(surface->data, surface->format, surface->scanline, rect->left,
+-		                        rect->top, nWidth, nHeight, color))
++		const RECTANGLE_16* rect = &(solidFill->fillRects[index]);
++
++		if (!intersect_rect(rect, surface, &invalidRect))
++			goto fail;
++
++		const UINT32 nWidth = invalidRect.right - invalidRect.left;
++		const UINT32 nHeight = invalidRect.bottom - invalidRect.top;
++
++		if (!freerdp_image_fill(surface->data, surface->format, surface->scanline, invalidRect.left,
++		                        invalidRect.top, nWidth, nHeight, color))
+ 			goto fail;
+ 
+ 		region16_union_rect(&(surface->invalidRegion), &(surface->invalidRegion), &invalidRect);
diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
index 5c196f5ff0..052e77932e 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.6.1.bb
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=stable-2.0;protocol=https
            file://CVE-2022-39320.patch \
            file://CVE-2023-39350.patch \
            file://CVE-2023-39351.patch \
+           file://CVE-2023-39352.patch \
            "
 
 S = "${WORKDIR}/git"

