Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D216BD25030
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:10 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.27578.1768196100784696387
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 11 Jan 2026 21:35:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=V0HvkS5b;
 spf=pass (domain: gmail.com, ip: 209.85.167.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-455a461ab6eso2371122b6e.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 11 Jan 2026 21:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768196100; x=1768800900; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X94MDyUeUtA57wY9uEp9kujGWeD1carql6kKG33uglw=;
        b=V0HvkS5bF548JingP/DOpxqugf+/X45PeYc5r01iHqlRHLKxwKykUWaPQuS0RqY3Yt
         hUOAB9EHYTuz2FsMrHUB6bWBBdQQxuhvXQ9gfXHRbCI5F6rPAUyr/j4RAOrMFDh4WBHF
         M6bAsLuqM7xMJiHYN0GjWJFSoSNZ5WuCSXNqCN1J6At3sQ70jVEH9HM9q0qwJwlFuvwl
         Hwc7FpeiUG94UzHwQFPrDoVIyBOjtBFF9hMCHfnJzqKU5Dg12CPPLkdQDwvS3vf/MV0J
         ffHEzIZ8qei3bWg3w61mvKiVussHMFQnxf+5aK/VRgdG5AbSUDFZEUcGsZ4HTc+yqvVi
         1u/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768196100; x=1768800900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X94MDyUeUtA57wY9uEp9kujGWeD1carql6kKG33uglw=;
        b=bPKPzd68DsFTl43SylKz54Ek/ApaiyZH0cNNdV9TWRcgzx8mDtvvpXPmEiy+ynatGq
         QYMsOvckA9zeXBnaa5hahzTQjQ9GIULtNVxEQrNqsfWCiyVsqFGUF9w0RBk0oK1D1qTa
         tHSmat4/J9geBwuLbD/qkuu8uU/Yij0pBHZrP6FTsL6+PrbFLClL9mx/19f+yv4wFvrl
         O9MSK5/SWC36Mqo1LkVm8gcgwrKZ/KKrgbKZuqQh4PfaG/JFzQsNrwapfWYa64Rt5P6P
         U9mhEhW8NZCGifm3/1Gr/jfhGEu8kcMpof61w4gDwpnygm8DbdGTkLHwYyn6O6R7EoG3
         Ummw==
X-Gm-Message-State: AOJu0YxkhCS8v1E0wg2N1z6KTb+m6hkzDse8N+gAlUeh356d0wvPdsT9
	Xjjxk9ZMer+Fp5FvoL+eV4UHpXfDxYeROtbigWBoz9IiJskrSO6Qrl5o0mAoRw==
X-Gm-Gg: AY/fxX6RXM1XAFAuBo2hfl2aw1kOY7hqgoA5kYcO1/cEQmZ98QtXWVxWuVmadWVTYrv
	NomItcrqCOHqjEeRE19XTuG+RI3pUCC8C8echtpH/66gCuD/vu8eU0PXyoSSZkg1jg9B6PJDSPQ
	eNM53e5yULEotVwHUBYvfy2TfNrGAuf/k+NRdA+j+NZ9+mDkWP3dX8zqYosTNuqfruNS5JP/yvI
	KDZX8draGFaKtQhuSLwG7dQ779/RzlJH/7Xa2sdApsV3dWrCKSj2zKDCaHBsxE25aHI8zCmCE1U
	nB6rR9rctir8VtNHXseJ1KXRZ+YLV4ENcvBFY6Z+cMx6PTQq+v5OXXT2OANSkXMxDj2dxBNBDOH
	EfOHUZKMyuUfm86i8FFCBWHULPaDaKiRZP6oSnol8qgM6onOm9dAMMzEzvPWGMovSrlMn/x+t8u
	UhRSURXW1B2Fiv2t8qJab9W2fXAHjISAE/fg==
X-Google-Smtp-Source: AGHT+IHy+3C54O5JbcDvNedXCnDCZXMsRRpluKOynDRoqX3kttoIFKmMUbN4EDJnf62pO10HRXTj4Q==
X-Received: by 2002:a05:6808:c1b2:b0:450:907:b523 with SMTP id 5614622812f47-45a6bd54369mr7777140b6e.6.1768196099742;
        Sun, 11 Jan 2026 21:34:59 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.35])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478d9f54sm13038512a34.23.2026.01.11.21.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jan 2026 21:34:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-gnome][scarthgap][PATCH 6/6] gimp: patch CVE-2025-5473
Date: Mon, 12 Jan 2026 18:34:40 +1300
Message-ID: <20260112053440.3694238-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
References: <20260112053440.3694238-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Jan 2026 05:35:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123355

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Detail: https://nvd.nist.gov/vuln/detail/CVE-2025-5473

Backport commit associated with the resolution of issue[1].

[1] https://gitlab.gnome.org/GNOME/gimp/-/issues/13910

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../gimp/gimp/CVE-2025-5473.patch             | 38 +++++++++++++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  |  1 +
 2 files changed, 39 insertions(+)
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch
new file mode 100644
index 0000000000..ef2eb48d61
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/CVE-2025-5473.patch
@@ -0,0 +1,38 @@
+From 9e4ebb38ba85661ee62361f218d6c35ace502395 Mon Sep 17 00:00:00 2001
+From: Alx Sa <cmyk.student@gmail.com>
+Date: Sat, 3 May 2025 14:13:46 +0000
+Subject: [PATCH] plug-ins: ZDI-CAN-26752 mitigation
+
+Resolves #13910
+Since ICO can store PNGs, it's possible to create an
+icon that's much larger than the stated image size and
+cause a buffer overflow.
+This patch adds a check to make sure the width * height * 4
+calculation does not overflow in addition to making sure it
+doesn't exceed the maximum allowed size for that icon.
+
+CVE: CVE-2025-5473
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/c855d1df60ebaf5ef8d02807d448eb088f147a2b]
+(cherry picked from commit c855d1df60ebaf5ef8d02807d448eb088f147a2b)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ plug-ins/file-ico/ico-load.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/plug-ins/file-ico/ico-load.c b/plug-ins/file-ico/ico-load.c
+index f44b805905..c144b6e2cd 100644
+--- a/plug-ins/file-ico/ico-load.c
++++ b/plug-ins/file-ico/ico-load.c
+@@ -295,7 +295,11 @@ ico_read_png (FILE    *fp,
+   png_read_info (png_ptr, info);
+   png_get_IHDR (png_ptr, info, &w, &h, &bit_depth, &color_type,
+                 NULL, NULL, NULL);
+-  if (w*h*4 > maxsize)
++  /* Check for overflow */
++  if ((w * h * 4) < w       ||
++      (w * h * 4) < h       ||
++      (w * h * 4) < (w * h) ||
++      (w * h * 4) > maxsize)
+     {
+       png_destroy_read_struct (&png_ptr, &info, NULL);
+       return FALSE;
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
index 064a797986..36b0712976 100644
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
@@ -49,6 +49,7 @@ SRC_URI = "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2 \
            file://0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch \
            file://CVE-2025-14422.patch \
            file://CVE-2025-14425.patch \
+           file://CVE-2025-5473.patch \
 "
 SRC_URI[sha256sum] = "50a845eec11c8831fe8661707950f5b8446e35f30edfb9acf98f85c1133f856e"
 

