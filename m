Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBD66C79FB9
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 08:32:05 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6995.1788942717609594245
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 01:31:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=W77gMZvf;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so4630807a91.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788942717; x=1789547517; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2IqYya7Cy5WjvcmmmdhCTCegyifBW9NJy0t3o8J3/OQ=;
        b=W77gMZvfoIrFE2jvEHZnS+zFPoA6T7B4SazSfiVk1VBPBOszRqYrd6u9z9CWTJ3q8r
         s3ygENFhX56Q0hyX//bvs0Vrt+xiWVsxDlkP1+u0ybEMtECRnP313my9K421XhLdcudr
         xccsHxpQM8e3gO1LrUY3lhcLK8p5EIdOKJ9KdZctwyVSN27Pav/h+tvi2dcOph66gsLO
         MxdJYkLESnOGeHOY8jcCck1zpOJ+G3zKPa8XXTZLvuCOX5CD3kxqbkkJ1mHTNXck5rxe
         D5p6u4/86+ja3JnuWhPefajSFpqpXKx6uCaKVZ5RXnN5UEfx+twiiV6qaVcPHYtkI+Ul
         eUdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788942717; x=1789547517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2IqYya7Cy5WjvcmmmdhCTCegyifBW9NJy0t3o8J3/OQ=;
        b=mAr1iShVDPW10/wJMacC/20b0BQ9tYeJiwoXVm9yqFPzJlPp5ldVCE6SLKfZvmnf6b
         14Mm1ESKQy9hayb1jXH9phY8SWSx7kck01ObUAS3nh2dEFQaX5qCI5f2/pY4TpjQaRZD
         I9OsCWI9frwpQdO9JyXvgAY9yIidJ7W+PXT98M4fxki1HbhEk6uHdULWspIAJJi5gMNq
         9e0ad/QabjJVZaWdku8K3qbK4XVjt9igcU+CBobTJXFJxFcvpnB1oARznxSNNAec1RpA
         Z+ap6SsDSth4TeCP+c44ep4mjfMpD5hyFY2zERwJOQx4C5jZJlkAU+JdBknU+LuypX0L
         wKpA==
X-Gm-Message-State: AFuF++m14+AcZIGjW8mcka8Kie3WU8IqQPQ+ePZYs03NbqneTWMorNRs
	892BZl/tK7kTOw/+TSWROd8kcGDu8mPjOqNR/xcA1zHmH4G1Ga32ihpYF1c0Wg==
X-Gm-Gg: AYBFou2REQ1dEqgwIUw+9SbEMl0HWujx/929KxlhaZYHRigrLYl0Brjgv/WWBHfhyL/
	M6bYmBd30Suo+H2C1j0j3+Gx5cLP+CUQfTY526n52IFti6p/Yqo47wINqsrHyAINdpKVDc484oC
	4KkjIJt0Jt11dVVV2C2OsOyhvXxcGIyC0cpY5dfewZHrY03A75V6murCsAGq6m6HUyOMMfM4gyE
	hO6HP3zkWq+d9eoiFEXDL46FhPZdnMxRVVUcFEaFKz9ahCFs2R0Xgjmyo8B/eqpxsHKaxqcoC2R
	bPW/jwKp/eYk46Dv1dE/wYnRgR0BIZKqVbFgOBg8plrvg8ZzYyGGRHam1h5V/dXimK7i2bO1D/U
	fgNBqt0xIjYp+vd1v7WESU1DBRblVpk52TeTBR2t1m/ggyHjeaNriHQi3YzKpBTc4m0kNpRujSA
	zOi0eGsP/qt329NHP9JJtHpqF5+WGsIvgfWu4f046g7ljAnryyq5ksU1uwgYPC1VPzoc+5RycL0
	BYRUjC80e0aXt/09J8KINw=
X-Received: by 2002:a17:90b:4fca:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-39b260dd278mr50218984a91.3.1788942716838;
        Wed, 09 Sep 2026 01:31:56 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39cfa5c1d17sm788649a91.4.2026.09.09.01.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 01:31:56 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][wrynose][PATCH 2/15] freerdp3: patch CVE-2026-55191
Date: Wed,  9 Sep 2026 20:31:27 +1200
Message-ID: <20260909083140.2494932-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
References: <20260909083140.2494932-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:32:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129873

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-55191

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-55191.patch     | 47 +++++++++++++++++++
 .../freerdp/freerdp3_3.24.2.bb                |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch
new file mode 100644
index 0000000000..0881d671bf
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-55191.patch
@@ -0,0 +1,47 @@
+From 4234cf72c4e9095c163405c4b5c5d41dd4775f81 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Thu, 11 Jun 2026 08:10:58 +0200
+Subject: [PATCH] [codec,h264] fix buffer bounds checks
+
+(cherry picked from commit 97f40b9e766af375f4e41ac6a3f4397d708d249c)
+
+CVE: CVE-2026-55191
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/97f40b9e766af375f4e41ac6a3f4397d708d249c]
+
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/codec/h264.c | 16 +++++++++++++---
+ 1 file changed, 13 insertions(+), 3 deletions(-)
+
+diff --git a/libfreerdp/codec/h264.c b/libfreerdp/codec/h264.c
+index 3b837601c..ce7776b40 100644
+--- a/libfreerdp/codec/h264.c
++++ b/libfreerdp/codec/h264.c
+@@ -495,14 +495,24 @@ static BOOL avc444_ensure_buffer(H264_CONTEXT* h264, DWORD nDstHeight)
+ 	if (pad != 0)
+ 		padDstHeight += 16 - pad;
+ 
+-	if ((piMainStride[0] != piDstStride[0]) ||
+-	    (piDstSize[0] != 1ull * piMainStride[0] * padDstHeight))
++	if ((piMainStride[0] == 0) || (padDstHeight == 0))
++		return FALSE;
++
++	const uint64_t dstsize = 1ull * piMainStride[0] * padDstHeight;
++	if (dstsize > UINT32_MAX)
++		return FALSE;
++
++	if ((piMainStride[0] != piDstStride[0]) || (piDstSize[0] != dstsize))
+ 	{
+ 		for (UINT32 x = 0; x < 3; x++)
+ 		{
+ 			piDstStride[x] = piMainStride[0];
+-			piDstSize[x] = piDstStride[x] * padDstHeight;
+ 
++			const uint64_t dstride = 1ull * piDstStride[x] * padDstHeight;
++			if (dstride > UINT32_MAX)
++				return FALSE;
++
++			piDstSize[x] = WINPR_ASSERTING_INT_CAST(UINT32, dstride);
+ 			if (piDstSize[x] == 0)
+ 				return FALSE;
+ 
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
index 7164a81e9d..e014196f18 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.24.2.bb
@@ -13,6 +13,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${
            file://run-ptest \
            file://CVE-2026-40254-1.patch \
            file://CVE-2026-40254-2.patch \
+           file://CVE-2026-55191.patch \
 "
 
 

