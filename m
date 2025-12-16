Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067E0D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:13:53 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16697.1765869220173362630
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:13:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=G38C61qR;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7b6dd81e2d4so4272913b3a.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869219; x=1766474019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cCgLIbUldnLWC5DOrIGdR4OkRZRQe6mq9+UtHv2P6w=;
        b=G38C61qREC43XGBOIDv5Krr2BVYA6YoWbQI4P5yG83wq9VbKZI+veFpU2q3MFR1CtN
         CCTry/BcZ4sZkOLzCfes7gKzo5JamagKocALP4eBQrcOeus+PgKVTjGGsqyncoW21wHy
         yaMU577yTNrzdXjfs5L1HB9z2mefFPedK6ZZgvOM97DflB7zHkfI02J2UfZ+ct384rgw
         Nfyz1A41aoQjyxiDeIQMKEL+M2GJiBgxoQa6VQ77puhd7h149tbfO0ke/r89ddjlmu7e
         l6QOH9ZMOPwt09Bpbw11umRPoIFyTfK3Et3qpXStvpOpng4MlZXmiXaX22tbXVQesdba
         +hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869219; x=1766474019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cCgLIbUldnLWC5DOrIGdR4OkRZRQe6mq9+UtHv2P6w=;
        b=BJ2QpBISZeZfXPla23n4xHpAAl/yOtHt2zl6VMSzABTPKuI3XzPku4KBnc0Py7SYx0
         Py0R2o3qFvFGrSm3C/HXKrIw3FttPzLGkvexzWoPUwu+nv7mUbqPUfdMtNHI+O1S0Jt6
         7z8xjhfpsoy/UG5G5iiBUOIKkySsfkl6gQnGQLhnee1TNPWG2nx70ax8kuCMSMG/Jb7f
         UiGsoHCsVShT0j8Mnfoq9zJWkqj90/IcI+gZL1IOT6Ytd+9Im5MoaFu13tnUbRP/h39y
         HWT6RroegcylVB2piUBMQEHN2tlSWTT51bZLyxFXFHaGb71Dd6qJu6l0Khj+uilV0Lmw
         umlQ==
X-Gm-Message-State: AOJu0YzP55sxdsjMtouj77THuWifYidv14IO9RbjiSk2+UsVV5fZOSQb
	75nR+a3sxNT6OP5BHTSIEvINrGijbsq0JwLa+hRN/jwc1m4554VuNXgYqOTd6A==
X-Gm-Gg: AY/fxX4dT9JeO9KYXGJjsaFK/0N7aRNZv9s7AXdKf1jmLHXmJkLEdwLaNfdR42Zmg6W
	v040WDN+Lylzf2uF7PQQfFI9OWEWLMD4nrCX0+rnpAiUVePVXGvvsNRxmhbBI5hRyIto/uYmJ7p
	iFr+9eeRDeXRCSraOMnUlRraWUKznYfrfKNQAhRGhRvrnXSv9rzGVrWQ193lKvjw11C0wcNyofA
	ppTDG3biVW/CHr6d119xnOflP0IskzjOeyKNBoXcaZsqnEj5lXpqEy0X8c9OEFPs5J0yzIrtgJz
	VP0QWiTm2+Rw2iXyKfRpun61qBeTmJG354HjKYd7UBonUL2Cp1F4YCGnj8aFDxMqePHSr0gMcAo
	Ao96LlyIszH6eBk3sMFkOARQWWV9NPtuiSsxLfI2luGsa8KdPYEEQpY5ZypO2wBP4cAfG1o8KAd
	0Za/KcM2OM/YUblPeKrejCZcZE
X-Google-Smtp-Source: AGHT+IHsmix10PNvDtlCLUz1sk1T1DQ+ROUQ3S0x+pFJlTfJ4v6Yxvw6KHQr5fsMNpVIsmlAPE+3pA==
X-Received: by 2002:a05:6a00:430e:b0:7e8:4433:8fb6 with SMTP id d2e1a72fcca58-7f66a07b23dmr13129233b3a.62.1765869219130;
        Mon, 15 Dec 2025 23:13:39 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm14225372b3a.49.2025.12.15.23.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:13:38 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/4] libcupsfilters: patch CVE-2025-57812
Date: Tue, 16 Dec 2025 12:43:27 +0530
Message-ID: <20251216071329.3172170-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
References: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:13:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122677

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-57812

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cups/libcupsfilters/CVE-2025-57812.patch  | 129 ++++++++++++++++++
 .../cups/libcupsfilters_2.0.0.bb              |   1 +
 2 files changed, 130 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch
new file mode 100644
index 0000000000..e6f307b26a
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-57812.patch
@@ -0,0 +1,129 @@
+From f62b9dffa58b19d0292c41ba826aad79062e2be6 Mon Sep 17 00:00:00 2001
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
+
+CVE: CVE-2025-57812
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/b69dfacec7f176281782e2f7ac44f04bf9633cfa]
+(cherry picked from commit b69dfacec7f176281782e2f7ac44f04bf9633cfa)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ cupsfilters/image-tiff.c | 46 +++++++++++++++++++++++++++++++++++++++-
+ 1 file changed, 45 insertions(+), 1 deletion(-)
+
+diff --git a/cupsfilters/image-tiff.c b/cupsfilters/image-tiff.c
+index d92cce25..ff0a0fb3 100644
+--- a/cupsfilters/image-tiff.c
++++ b/cupsfilters/image-tiff.c
+@@ -41,6 +41,7 @@ _cfImageReadTIFF(
+   TIFF		*tif;			// TIFF file
+   uint32_t	width, height;		// Size of image
+   uint16_t	photometric,		// Colorspace
++    planar,         // Color components in separate planes
+ 		compression,		// Type of compression
+ 		orientation,		// Orientation
+ 		resunit,		// Units for resolution
+@@ -113,6 +114,15 @@ _cfImageReadTIFF(
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
+     DEBUG_puts("DEBUG: No compression tag in the file!\n");
+@@ -127,6 +137,15 @@ _cfImageReadTIFF(
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
+   //
+   // Get the image orientation...
+   //
+@@ -193,6 +212,23 @@ _cfImageReadTIFF(
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
+   //
+   // Check the size of the image...
+   //
+@@ -265,6 +301,14 @@ _cfImageReadTIFF(
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
+@@ -1467,7 +1511,7 @@ _cfImageReadTIFF(
+ 	      }
+ 
+ 	      if (lut)
+-	        cfImageLut(out, img->xsize * 3, lut);
++	        cfImageLut(out, img->xsize * bpp, lut);
+ 
+               _cfImagePutRow(img, 0, y, img->xsize, out);
+             }
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
index 827172a6a1..9178829611 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
@@ -9,6 +9,7 @@ SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
 	file://0001-CVE-2024-47076.patch \
+	file://CVE-2025-57812.patch \
 "
 SRC_URI[sha256sum] = "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601"
 

