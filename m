Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 668BAE7491B
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 06:01:59 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115561.1766556118853573202
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 22:01:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UjAUMK4p;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a099233e8dso47964425ad.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 22:01:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766556118; x=1767160918; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dbWllTW8ijACxghjapSSxgSzvaUv9ZxOkMMxj88Ofsg=;
        b=UjAUMK4pesDD+woY9SOlpinOdLNvDbw2vWjP1+4St+iQJjeyDt91gQM3s8uJiBHg6T
         F52ikUmon/Eo4zhehr1QyAg87l+P9HCDIjhdymm1WLCjuGMUMvbC5GCI7Wy84FTWU+Mu
         jHSJbN6zr5YjZGDDVby4syg3uQnGq/iXbsM/bAqHDrfNk3KYbWRWd+0SCT4CLCfKFomY
         ZKPClIv6Vr2HxfTMGyNBtKE+1NRM5zc8kA/+vHxzjdhLFthjuDxHXpkKbZHj1DUbOzpp
         vktbuKqdk4eLYCA5JACEFjfeYdio5YY0Fw89T0KrX58UWygW2HVToimYorgiKGZuv97x
         VKfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766556118; x=1767160918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dbWllTW8ijACxghjapSSxgSzvaUv9ZxOkMMxj88Ofsg=;
        b=YNOgakvD9kZbcKfdeNufwKruD5qS7a3UIteVImcmAwlAZHpHmaoFBanNsIK5UsxjP4
         5GXBQ2uhlFcVBgpPxEYUugWww2DgwBI0vTrvn7upwC7wTpx153LP0x2+5my606AR8A9Z
         2FhTQ+0Zp26AuBSPFL2B7As956kKrKMZcrnDZStVOx/pjv8BZkQWIl7qPajVI1NqWfcr
         T86oMxqK2z6orQg9YmNT2MBneYYMtY81lBkohEa7Q9wfuHPD790WjWzPx2ZUBuQmgJGB
         xPWX57VR2zm5YwYcMamrIMVc6kMXWQPFXWJFhRE8LUN3J4GGwWkK1OByaqTekRwdupWF
         4gdA==
X-Gm-Message-State: AOJu0Ywei9LVG06R17K+0asP3W3ibK92jdQyCgUIGJH7hCxhtCucYgos
	ApLkhxMBhSXzZ/wNlSjqkoiIm/DQSFs5Tfd3nQxUgNOtcsy+0OrwuiEPe1upMg==
X-Gm-Gg: AY/fxX7JeJMUFuoTyR9DLwPfY8M7Tx5/aofJBOEEWiicbEfLgjmaD0Gy1pYddF/2Wdc
	QRqqT0e9kXiPPtkoQGCXqIj66b71R7q1LKdwNuuJY/+WeYgJ9CkrAucUvciuo4Jn72oJKWjiHII
	A9dEKtfLN9Q9lLk8RzkSnmbU3Ay0zoFsBNYAPfkNf++rprzg2lTN6WTbyAGLvXGz4kurksDNjsU
	iuQ3xu5dNOGZt7vJD+qRkJcmJTNLVAqSZT/XNVVH8NHDRhX378KEG/T4ZrZY56u+iy4guEDjepI
	ex3zKMN6Vtl8wzjkVE5Y5u/ljopwM0+ml83ndRqmYYcyX3S26Qqjf8RHCE5V8RbJS/QyA1kkW9o
	/X59/2dFRDr2/Z4pn5q7GrTn+vOsR27t8gwjHRoIR8S2DG+Hg4ldca1Os+S+PviBdaW7C+B1wh/
	GTi9idKBC0S6u3hp0DR2xQZ3X8
X-Google-Smtp-Source: AGHT+IFMcsga/giubGv/1XilkVNWFMys6L3bIb5JNkv7IT1n9LOxeqOpZrig1Z9K5N1wXOwq+XtP9Q==
X-Received: by 2002:a17:903:19e8:b0:29e:93be:fe50 with SMTP id d9443c01a7336-2a2f283d881mr175401965ad.42.1766556117851;
        Tue, 23 Dec 2025 22:01:57 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.235])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb9csm142554555ad.47.2025.12.23.22.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 22:01:57 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/2] cups-filters: patch CVE-2025-64524
Date: Wed, 24 Dec 2025 11:31:49 +0530
Message-ID: <20251224060150.1294484-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Dec 2025 06:01:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122843

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-64524

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../cups/cups-filters/CVE-2025-64524.patch    | 81 +++++++++++++++++++
 .../cups/cups-filters_2.0.0.bb                |  1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
new file mode 100644
index 0000000000..80671ee484
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
@@ -0,0 +1,81 @@
+From a6cc1c750006a8ac4e5d692f3a7d9ade479519ec Mon Sep 17 00:00:00 2001
+From: Zdenek Dohnal <zdohnal@redhat.com>
+Date: Wed, 12 Nov 2025 15:47:24 +0100
+Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
+
+Infinite loop happened because of crafted input raster file, which led
+into heap buffer overflow of `CompressBuf` array.
+
+Based on comments there should be always some `count` when compressing
+the data, and processing of crafted file ended with offset and count
+being 0.
+
+Fixes CVE-2025-64524
+
+CVE: CVE-2025-64524
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/0fe46c511e81062575b05936f804eb18c9f0a011]
+(cherry picked from commit 0fe46c511e81062575b05936f804eb18c9f0a011)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ filter/rastertopclx.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
+index ded86f114..39cb378bf 100644
+--- a/filter/rastertopclx.c
++++ b/filter/rastertopclx.c
+@@ -825,10 +825,10 @@ StartPage(cf_filter_data_t      *data,	// I - filter data
+   }
+ 
+   if (header->cupsCompression)
+-    CompBuffer = malloc(DotBufferSize * 4);
++    CompBuffer = calloc(DotBufferSize * 4, sizeof(unsigned char));
+ 
+   if (header->cupsCompression >= 3)
+-    SeedBuffer = malloc(DotBufferSize);
++    SeedBuffer = calloc(DotBufferSize, sizeof(unsigned char));
+ 
+   SeedInvalid = 1;
+ 
+@@ -1159,6 +1159,13 @@ CompressData(unsigned char *line,	// I - Data to compress
+               seed ++;
+               count ++;
+             }
++
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
+ 	  }
+ 
+ 	  //
+@@ -1252,6 +1259,13 @@ CompressData(unsigned char *line,	// I - Data to compress
+ 
+             count = line_ptr - start;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+ #if 0
+             fprintf(stderr,
+ 		    "DEBUG: offset=%d, count=%d, comp_ptr=%p(%d of %d)...\n",
+@@ -1424,6 +1438,13 @@ CompressData(unsigned char *line,	// I - Data to compress
+ 
+             count = (line_ptr - start) / 3;
+ 
++	    //
++	    // Bail out if we don't have count to compress
++	    //
++
++	    if (count == 0)
++	      break;
++
+ 	    //
+ 	    // Place mode 10 compression data in the buffer; each sequence
+ 	    // starts with a command byte that looks like:
diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
index efcd1aab8a..f9242379c1 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.0.bb
@@ -8,6 +8,7 @@ DEPENDS = "libcupsfilters libppd glib-2.0 poppler"
 SRC_URI = " \
 	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
 	file://fix-make-race.patch \
+	file://CVE-2025-64524.patch \
 "
 SRC_URI[sha256sum] = "b5152e3dd148ed73835827ac2f219df7cf5808dbf9dbaec2aa0127b44de800d8"
 

