Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C8DE9DE50
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 07:10:12 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.127047.1775718605538404502
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 00:10:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=m/h+Gk6A;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-82ce49785a0so271277b3a.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 00:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775718605; x=1776323405; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=73q0c6VlcWOO0PmEZx+/mZLEDrP9nodvH+yPDRS92JU=;
        b=m/h+Gk6AM8NLgeimdR828gqR2d/DgzF/7GOpn687kEq6+FdsUn623GLQZj9EhmYEhs
         ipEW1DGsUc9PPFRqa1Lxk6HPx02blHcYx+qVZsBZbL8q4Grv1WJ+gBWbUzrnHrnuILJA
         eb7zlRcPXrCRgEYd/0aTJexgQj8gh3lkllK8e7ILzvzWldaVB8pk16GpmIB0v65izppQ
         OnWf55+8VN0akdildBMrdvcFSkWhzdGWMGC2poV+NwIZa6y28XakRtZDXWk6Qi3Pmy0b
         zKLa+iz9QRKRS1Bi2gVtfB6nmPq+IH0nEofQ33he9rhk0lX/6QtZilfNV0sTTUy2ufSC
         g7Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775718605; x=1776323405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=73q0c6VlcWOO0PmEZx+/mZLEDrP9nodvH+yPDRS92JU=;
        b=nBSVaetMT2QqAMT87fEE5MGuEzXEqSx3Dsh/D6T90mGdcJxX7VKb6dKc/w5UR+f1le
         oyWWg/VhyV9q5vfZcUNyHtQhMbxtCcY0kNGKFCntyz/KB2JYr0VGZ/QM8qHHNxAzNzLs
         oY7enf3lkzTRjkcu3/KLCMbrTl0H3dhKgYiFLXr7439zTEK7+2pfB7WBk72PADOhBJro
         AlhxPx3/cGerxCclIVGgJDtROk/h/gTwzqRjAdPcnYwaR6c/y2Y/LIb0yL0n6B7LcbaK
         NkzjsrbzCAjAYlVM3YKOLym1MRrd4VKwWnsZ3mlMMScLg215ZY8fnIOxysMCL6byFH78
         sl5g==
X-Gm-Message-State: AOJu0YxX/BF/ZwZ/aOW2WJpndov3IRtaRElGEjR5Ro2Cb/CuU4Vwlrka
	2YrPIMRDdV2FadMw97pc8UKR9kVKqK+TZOxzLhP3yNMxXCOm1DNUVYVeqZ1AhQ==
X-Gm-Gg: AeBDievulO9iqO1gnlCLkfJWdLO1aggQB4LKKyjqF+AUarlvQ1z9AKN4UOu9yYPMUEB
	49GrtOgSENFDGTigdHtuK7kd3VPZieTDDlTx6oCISryEV9HRhxI7hCy728FdzGcMuHmdlSWsBJU
	qS+0IZQ8lUjLTB7h7KbRYXjQWgec39GO5IkxG73MzxaVh9g2BkyFc/zxFuNPs2WhdX4sUTUzP8D
	aV+2jtBUHBNN4FKStU5+CxREyAHR5FSngMxAQ5E3lMiWm2wLBNPaSt24gB2pTB6+2ljBnslUivV
	0UOju1Y7rDz4ydPbxKJFtPDwF6KMgAsXOEXS4MTwNa5+8OcR4rZl6efjB9zIJwIbGT3YH+Avob8
	ZbKf7TLGlaqorfOLPUPD/ZGxCz5v1/0fKrUdIdpUT0z+yc1C8xRRcdhllAk103ZRmTvDszUvQoM
	6Exj5VxU3K/rWG0kr2sCnZBllr21ezqFpuOUM=
X-Received: by 2002:a05:6a00:18a4:b0:827:37ef:7322 with SMTP id d2e1a72fcca58-82d0da2afacmr24776629b3a.2.1775718604701;
        Thu, 09 Apr 2026 00:10:04 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b21c92sm24764936b3a.11.2026.04.09.00.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 00:10:04 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 15/22] freerdp3: fix CVE-2026-29775
Date: Thu,  9 Apr 2026 19:09:12 +1200
Message-ID: <20260409070919.3968586-15-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
References: <20260409070919.3968586-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 07:10:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126137

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-29775

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../freerdp/freerdp3/CVE-2026-29775.patch     | 30 +++++++++++++++++++
 .../recipes-support/freerdp/freerdp3_3.4.0.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch

diff --git a/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch
new file mode 100644
index 0000000000..584481e330
--- /dev/null
+++ b/meta-oe/recipes-support/freerdp/freerdp3/CVE-2026-29775.patch
@@ -0,0 +1,30 @@
+From e4bfcb3197787e7af4246366b643c16de99f56a2 Mon Sep 17 00:00:00 2001
+From: Armin Novak <armin.novak@thincast.com>
+Date: Sat, 28 Feb 2026 11:38:55 +0100
+Subject: [PATCH] [cache,bitmap] overallocate bitmap cache
+
+(cherry picked from commit ffad58fd2b329efd81a3239e9d7e3c927b8e503f)
+
+CVE: CVE-2026-29775
+Upstream-Status: Backport [https://github.com/FreeRDP/FreeRDP/commit/ffad58fd2b329efd81a3239e9d7e3c927b8e503f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libfreerdp/cache/bitmap.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/libfreerdp/cache/bitmap.c b/libfreerdp/cache/bitmap.c
+index dd5ae1d71..0d694dd3f 100644
+--- a/libfreerdp/cache/bitmap.c
++++ b/libfreerdp/cache/bitmap.c
+@@ -364,7 +364,10 @@ rdpBitmapCache* bitmap_cache_new(rdpContext* context)
+ 	const UINT32 BitmapCacheV2NumCells =
+ 	    freerdp_settings_get_uint32(settings, FreeRDP_BitmapCacheV2NumCells);
+ 	bitmapCache->context = context;
+-	bitmapCache->cells = (BITMAP_V2_CELL*)calloc(BitmapCacheV2NumCells, sizeof(BITMAP_V2_CELL));
++
++	/* overallocate by 1. older RDP servers do send a off by 1 cache index. */
++	bitmapCache->cells =
++	    (BITMAP_V2_CELL*)calloc(BitmapCacheV2NumCells + 1ull, sizeof(BITMAP_V2_CELL));
+ 
+ 	if (!bitmapCache->cells)
+ 		goto fail;
diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
index f92d824d66..e3d71ee854 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.4.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;branch=master;protocol=https \
            file://CVE-2026-24682.patch \
            file://CVE-2026-24683.patch \
            file://CVE-2026-29774.patch \
+           file://CVE-2026-29775.patch \
            "
 
 S = "${WORKDIR}/git"

