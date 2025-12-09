Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6F1D1CDC6
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 15:40:03 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10698.1765294797526564466
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 07:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UD7NTzkG;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so74158485e9.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 07:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765294796; x=1765899596; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k1tNh7/0Uo55vjSZ1Ff62Tckj+6tTTw06vaQ6yEO18=;
        b=UD7NTzkGyoo2ljAeViX1Adkv/of8Ul86dWTpm7xVK+ZDLnvRWU75SGIMmkR/MZCccK
         VbGJKDL6EetynWsKrCOfS4UdDQqb448QdqofeK111Ige4ZfTXUg8bcSJhZFB8CR/7Tkp
         neBG0Vbit6k24/D/qIZImDixPWD7T45KkWQaCd7y7gwy48iFNeVNV1hs9QEP901KPS54
         39hg1P+BstgwyzCprefE+a111+akjo9iqrWMpIenxUbVlxBkUBogoAmjBi1ZHsyp/yf0
         ydWSGu3NpxXNcXxJzgTDlQhYB8CKXbKCSBHNCyAKMDhNrKucu1VFddTwf8N/T20JRwbi
         CsjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765294796; x=1765899596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6k1tNh7/0Uo55vjSZ1Ff62Tckj+6tTTw06vaQ6yEO18=;
        b=WlC3ETicm1rOlz0LE8vu3CKr/BAYYVZnJ1FdRRhpLb39PwTWPXTlQfCgut0nIhAYg9
         Or5spegNhMPez1g60FpglkJVcLVyLaker+7BEN9aJ9MYldrVKUY37hZHJocyGA/pHhRZ
         w2BVjZLks4eQMEj3W9DqG0trSqCP4Hmiebma+Csf4y94gxweyfkcjU3NeiaQ2JCKRHhq
         07+1G/709ctv8X/F2UW0MAI43jAjJotjlBEfdcRAbPV4b2mD5SLH+yctv3S9/0YzneYh
         dxvNP1Rr32TFvnyNR4988gzSPmV2ErpzOzDBzY1UK2Jyi138jFre7HoATXR0dFJpLgi1
         20Jw==
X-Gm-Message-State: AOJu0YyauwFa8k7OnEZV4OrlWtVX4uL1L/OoH3t/pu64QZT0cCTtvBGT
	29FwQLSRCfjjGcibz02RBRA65C0o7QB2eFQ3j7jf4MNAvvib8dwwqhWtQjlFRA==
X-Gm-Gg: ASbGncuWXuez69DDZnqQn1FVa12zfeLn7GVlSCHZmq4NnfkUdCy/Zmp3HKQp/NM1gLJ
	y3PCq8ttj89yAlPdizlJhn5N1M/RU3yEN7bWAmCXGIQbyWSo24rqpxqbFoXrswmJ8jWMr0X2dvh
	20fYtRREIwP0RiI4JRKxgmfKeibhDnTPF2ENy315+pAbP5xe9spkaOFW4ZpKNi2OJoRSLVYI7rb
	EUnFsAe5E1grBpvFAG38I6ICBfFk2kH6dzTrN5K2XA8rcc2AeH36TshKW4TLvBbAAoEyWQAbKdJ
	febwFOjOUTn7V11Y6bkr+llBkj+Hq6RvtRdFbFojBL6xIACxSHe7Q2fLDZjObgCbgD3HgcgwupQ
	El6jfc15IiUna39o/9vQTBBk08PL4vcOv4bL+m9pN9ETfC9l5DixEHjF4F/OgAOPipr2zk64aMc
	gep4KOQruG
X-Google-Smtp-Source: AGHT+IEumneqfEbaRmHhxM73JGW3opGRhdNSa5mO8QzjsqdjvQFKEIyBpgr9s/2BLX0P/SgVrjEhQg==
X-Received: by 2002:a05:600c:c494:b0:477:54cd:2029 with SMTP id 5b1f17b1804b1-47939dedbe1mr103614735e9.4.1765294795772;
        Tue, 09 Dec 2025 07:39:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d632cebsm46375495e9.7.2025.12.09.07.39.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 07:39:55 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/5] cups-filters: patch CVE-2025-64524
Date: Tue,  9 Dec 2025 16:39:51 +0100
Message-ID: <20251209153953.951218-3-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251209153953.951218-1-skandigraun@gmail.com>
References: <20251209153953.951218-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 15:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122462

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64524

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cups/cups-filters/CVE-2025-64524.patch    | 82 +++++++++++++++++++
 .../cups/cups-filters_2.0.1.bb                | 10 +--
 2 files changed, 87 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch

diff --git a/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
new file mode 100644
index 0000000000..b8338e333a
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/cups-filters/CVE-2025-64524.patch
@@ -0,0 +1,82 @@
+From 4230ceaec8a6751f724a0d556ce4650d52a83a02 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Wed, 12 Nov 2025 15:47:24 +0100
+Subject: [PATCH] rastertopclx.c: Fix infinite loop caused by crafted file
+
+From: Zdenek Dohnal <zdohnal@redhat.com>
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
+Upstream-Status: Backport [https://github.com/OpenPrinting/cups-filters/commit/956283c74a34ae924266a2a63f8e5f529a1abd06]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ filter/rastertopclx.c | 25 +++++++++++++++++++++++--
+ 1 file changed, 23 insertions(+), 2 deletions(-)
+
+diff --git a/filter/rastertopclx.c b/filter/rastertopclx.c
+index ded86f1..39cb378 100644
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
diff --git a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
index e488bd3039..a6eedda5d7 100644
--- a/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
+++ b/meta-oe/recipes-printing/cups/cups-filters_2.0.1.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6d5b952b53dbe7752199903d082e5f07"
 
 DEPENDS = "libcupsfilters libppd glib-2.0 poppler"
 
-SRC_URI = " \
-    https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-    file://fix-make-race.patch \
-    file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
-"
+SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://fix-make-race.patch \
+           file://0001-Fix-build-failure-with-GCC-15-and-std-c23.patch \
+           file://CVE-2025-64524.patch \
+           "
 SRC_URI[sha256sum] = "39e71de3ce06762b342749f1dc7cba6817738f7bf4d322c1bb9ab10b8569ab80"
 
 UPSTREAM_CHECK_URI = "https://github.com/OpenPrinting/cups-filters/releases"

