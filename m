Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A51FFE7AD59
	for <webhook@archiver.kernel.org>; Thu, 25 Dec 2025 12:51:50 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.138121.1766667104869656600
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Dec 2025 04:51:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=d3JOYwkS;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so5035728f8f.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 04:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766667103; x=1767271903; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=en3e8exwUbtZWLkDoecJvYHqleiNWkuWPyEAhPXOF0Q=;
        b=d3JOYwkSmOPS98aJCHJa/Wc5ZDjGrPjUO8HPd3GFNSryHQNxFoGSzOMWhNEBEWPUPQ
         JtdTZSAd59BG1grNcNDTq67+hhqx72gt4R4kgczCKuj/MmfGaNbrQ4MB1qVZb63b9DRx
         3XVT2Fb8ua7S+aRovYXg0rseQGJnTaap2hKit1uAxNf/AQqIlRd1N5RCl0iwyTmK1o3e
         HAh7UOnwFV2LKH6ZDv6bf1anS32q5S+OvvhJESkDA0y01uZek1OQEE1G/ia9OlUoFBZR
         P58vnSS5CtLZqG99CRtc6tOG18v0tcqBrbK6V5K3VSDbNNviexLHvmM3hVefeyJRqr6Y
         sHew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766667103; x=1767271903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=en3e8exwUbtZWLkDoecJvYHqleiNWkuWPyEAhPXOF0Q=;
        b=ew7GT7VoEZgs6UxqEbiC1xHEUj+Uwf5G9xghNPNXevog2V7l7/BPlhZp7ESVBTuc8y
         r59dM1oQ5+YLipTPU24GqHn0nosLBo4iCuvrqANP6fWAfAPBVvBNC85KD22wmdejEJ/5
         Lb1pK0crLIXgR+I1kMid6FsytQpj2qVsELiyKb/OOgd9MfWUt2YAH6qpxhnJ7B9pEIxa
         Rfi4AoBWj77i9iljPH7xY/9+l2fMI+c0KpIqHkAnkoJ0G16IY3Yc9AWKWqOc4CDhGt6H
         aV4Ih+GsP369TIUdjzJHJY3s1R1dkjQ5C2C93QbfHacEdrbaPflaImuspNXdBBlMqNHS
         iefg==
X-Gm-Message-State: AOJu0YyvygZBqFhwr3WWr8C/W31vLys+YhXNhCjI+SE6VFlUvj12IAIQ
	CFCBXuuIxpL9M0jc9giEV2KjPKKv5zUx3kb1dTKbw32DdfSa5Uylu2YOgaGyuw==
X-Gm-Gg: AY/fxX6Bq94Lc4G98cfXJTFKERvT15I6n6NgIVeQnUKnl8Qa2AXQrKGYj7n/HVz+zPk
	fnaRKvO9n0/tsFrmGwCHT+HlJC2RQ6jS2bufOTDkwQMBL1SGkFqkf2CZqkCWsuPo4f8vp32Y190
	3X7CGqAN1yrRDsgyZ2O2pdMLiT3h1GrWINtyG3Nd3FVQDVhZmQoz1UdkJayLynj1lneu9UgguZY
	EAkLAOUHdl0FRKpMxwg/l8OKUZEHiek6pE3ZwmHTxyiutcXH8K+Uh1PyrxvZHVtOMQZ49sObWBE
	vguV3gjzVf4i0Yw5+3jGCoxgwN+BkFHkVUVsBcQ7Xu3U3jEJ7OAIupnIhn0vsc5a6sr0jO+06Fz
	Nd8B5gUmoss9IHbs8gQVOW6pypUIcPEPZl0ikLGkgF8C5F5s9/Lg76QtLY2i/4zO5v9rZ5pjUD0
	mMRVUZ3CQCPQ4jk6JJdpc=
X-Google-Smtp-Source: AGHT+IH0cwbfjCxfbWHmqQHefg17azz772Em+rEFyWd9vsRcEYsGxym24IkIRzl3r93fd6gQrGSywQ==
X-Received: by 2002:a05:6000:7:b0:431:3a5:d9c1 with SMTP id ffacd0b85a97d-4324e4fd96emr17609502f8f.30.1766667103136;
        Thu, 25 Dec 2025 04:51:43 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea830fesm40219073f8f.20.2025.12.25.04.51.42
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 04:51:42 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 5/8] cups-filters: patch CVE-2025-57812
Date: Thu, 25 Dec 2025 13:51:36 +0100
Message-ID: <20251225125139.2436941-5-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251225125139.2436941-1-skandigraun@gmail.com>
References: <20251225125139.2436941-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Dec 2025 12:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122917

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57812

Backport the patch that is referenced by te nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../recipes-printing/cups/cups-filters.inc    |   4 +-
 .../cups/cups-filters/CVE-2025-57812.patch    | 127 ++++++++++++++++++
 2 files changed, 130 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-57812.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters.inc b/meta-oe/recipes-printing/cups/cups-filters.inc
index 5952b5a2a6..26a7c5037a 100644
--- a/meta-oe/recipes-printing/cups/cups-filters.inc
+++ b/meta-oe/recipes-printing/cups/cups-filters.inc
@@ -9,7 +9,9 @@ SECTION = "console/utils"
 DEPENDS = "cups glib-2.0 glib-2.0-native dbus dbus-glib lcms ghostscript poppler qpdf libpng"
 DEPENDS:class-native = "poppler-native glib-2.0-native dbus-native pkgconfig-native gettext-native libpng-native"
 
-SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz"
+SRC_URI = "http://openprinting.org/download/cups-filters/cups-filters-${PV}.tar.gz \
+           file://CVE-2025-57812.patch \
+           "
 
 inherit autotools-brokensep gettext pkgconfig
 
diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-57812.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-57812.patch
new file mode 100644
index 0000000000..1af27c10c1
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-57812.patch
@@ -0,0 +1,127 @@
+From c21664d57ebecb2c6ed05b38b1c39995ab14e916 Mon Sep 17 00:00:00 2001
+From: zdohnal <zdohnal@redhat.com>
+Date: Mon, 10 Nov 2025 18:58:31 +0100
+Subject: [PATCH] Merge commit from fork
+
+* Fix heap-buffer overflow write in cfImageLut
+
+1. fix for CVE-2025-57812
+
+* Reject color images with 1 bit per sample
+
+2. fix for CVE-2025-57812
+
+* Reject images where the number of samples does not correspond with the color space
+
+3. fix for CVE-2025-57812
+
+* Reject images with planar color configuration
+
+4. fix for CVE-2025-57812
+
+* Reject images with vertical scanlines
+
+5.  fix for CVE-2025-57812
+
+---------
+
+Co-authored-by: Till Kamppeter <till.kamppeter@gmail.com>
+CVE: CVE-2025-57812
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/b69dfacec7f176281782e2f7ac44f04bf9633cfa]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cupsfilters/image-tiff.c | 46 +++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 45 insertions(+), 1 deletion(-)
+
+diff --git a/cupsfilters/image-tiff.c b/cupsfilters/image-tiff.c
+index 4fd8756..b34c1ef 100644
+--- a/cupsfilters/image-tiff.c
++++ b/cupsfilters/image-tiff.c
+@@ -43,6 +43,7 @@ _cupsImageReadTIFF(
+   TIFF		*tif;			/* TIFF file */
+   uint32	width, height;		/* Size of image */
+   uint16	photometric,		/* Colorspace */
++		planar,			/* Color components in separate planes */
+ 		compression,		/* Type of compression */
+ 		orientation,		/* Orientation */
+ 		resunit,		/* Units for resolution */
+@@ -115,6 +116,15 @@ _cupsImageReadTIFF(
+     return (-1);
+   }
+ 
++  if (TIFFGetField(tif, TIFFTAG_PLANARCONFIG, &planar) &&
++      planar == PLANARCONFIG_SEPARATE)
++  {
++    fputs("DEBUG: Images with planar color configuration are not supported!\n", stderr);
++    TIFFClose(tif);
++    fclose(fp);
++    return (1);
++  }
++
+   if (!TIFFGetField(tif, TIFFTAG_COMPRESSION, &compression))
+   {
+     fputs("DEBUG: No compression tag in the file!\n", stderr);
+@@ -129,6 +139,15 @@ _cupsImageReadTIFF(
+   if (!TIFFGetField(tif, TIFFTAG_BITSPERSAMPLE, &bits))
+     bits = 1;
+ 
++  if (bits == 1 && samples > 1)
++  {
++    fprintf(stderr, "ERROR: Color images with 1 bit per sample not supported! "
++                    "Samples per pixel: %d; Bits per sample: %d\n", samples, bits);
++    TIFFClose(tif);
++    fclose(fp);
++    return (1);
++  }
++
+  /*
+   * Get the image orientation...
+   */
+@@ -181,6 +200,23 @@ _cupsImageReadTIFF(
+   else
+     alpha = 0;
+ 
++  //
++  // Check whether number of samples per pixel corresponds with color space
++  //
++
++  if ((photometric == PHOTOMETRIC_RGB && (samples < 3 || samples > 4)) ||
++      (photometric == PHOTOMETRIC_SEPARATED && samples != 4))
++  {
++    fprintf(stderr, "DEBUG: Number of samples per pixel does not correspond to color space! "
++                    "Color space: %s; Samples per pixel: %d\n",
++                    (photometric == PHOTOMETRIC_RGB ? "RGB" :
++                     (photometric == PHOTOMETRIC_SEPARATED ? "CMYK" : "Unknown")),
++                    samples);
++    TIFFClose(tif);
++    fclose(fp);
++    return (1);
++  }
++
+  /*
+   * Check the size of the image...
+   */
+@@ -253,6 +289,14 @@ _cupsImageReadTIFF(
+         break;
+   }
+ 
++  if (orientation >= ORIENTATION_LEFTTOP)
++  {
++    fputs("ERROR: TIFF files with vertical scanlines are not supported!\n", stderr);
++    TIFFClose(tif);
++    fclose(fp);
++    return (-1);
++  }
++
+   switch (orientation)
+   {
+     case ORIENTATION_TOPRIGHT :
+@@ -1455,7 +1499,7 @@ _cupsImageReadTIFF(
+ 	      }
+ 
+ 	      if (lut)
+-	        cupsImageLut(out, img->xsize * 3, lut);
++	        cupsImageLut(out, img->xsize * bpp, lut);
+ 
+               _cupsImagePutRow(img, 0, y, img->xsize, out);
+             }

