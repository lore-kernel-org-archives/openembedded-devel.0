Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37528E92735
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 14:52:03 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44442.1767019916952085344
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 06:51:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i/y6nxkq;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42e2d02a3c9so5590613f8f.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 06:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767019915; x=1767624715; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YjitC+r0icGnIVBIJRp+ifc1VQbHNvkjn5RoRZU206o=;
        b=i/y6nxkqd7qiAj8Ca+TfAtxFwr0fh6884iT2TUw2bNbva7oXomjdf9/cKaIIylEwwT
         070l6InJncu1p1ZE+I0q+HZ9kpHZ8hCWAidyIRHbWvC9FqqOs3GJ7/QKRjSjAi3eWNdY
         8RLBlk5wZQd2yR3II9geI61MN/KBSZIqxypAvFXmYmpRdkwSwrvPeK1Up24c3OqOVmfR
         8FT4Nf4GIsZqocYtccqVQ5V3Nd8wRxn5JeCybfv7P1p8J4SWIjuult5rzZJu30cto/m8
         U09WZ0FAx6N76C/DA8zPanqyqzsPb/4/efQjBuVasmkwlQkU2vEjMyN6TA4K8DQjxZ93
         BSnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767019915; x=1767624715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YjitC+r0icGnIVBIJRp+ifc1VQbHNvkjn5RoRZU206o=;
        b=TSESWY8gJPzBuJII1SfVWMn+Ir3qBsInwS9nv+RvTmPnWOUBFaI+9VXkzIA7/HBzUX
         BjqJf8SzPCJY6iVc5dkdxxzdWzHulc/EMqEGvahlk/zYW5Sj8d1/pRlM1VcbkBA5SD1q
         d9XF0t3NKmB2oPDWMWorslwzM8WooEilGYq4S3kye9DPQTBUKveUieikbFE6wMdwnAZe
         DMiEDilIZzMtyK8BsZwCX9Y40DQ/4ZUTeDHn1LPow/rnkfQ86e2vFlRI1SH3H+zx9SaA
         TLH0ajvA/ppTbGNIC4oJByIKkQgU/bhOvFCXc+uNO/1zzjO1+pCv4zakuP18D7YzupqL
         5XLw==
X-Gm-Message-State: AOJu0Yzs9PDXigl5c1wxLorNMG7iFnuD2TmAT233sQDH8nwM5GOBYZVz
	mANG91/43gI8xLKeoZshpLxOnG1+ZzbIM9mm8cv153+dUt4CcRF4RvCquDcleg==
X-Gm-Gg: AY/fxX5n7TO9YDJQRZvLgoufb96hyEo8v4rM4bxPIlrR3h0R9+FPFBJWGowXfwVykby
	Yrrw2oaWSbMgCP6HzJw7r94rNXclyz9QcW/NS4697uSlx0iBK6jdeScDN6M8SdA7sfOCftMNqFf
	0Ydo7Z06k5EIf3CWyTXZGKPgJXlxU7HGJTEJ0pf/SE+6xKgUe8bD8/Sk88vk5tvpGecuk+8iYtD
	tMClOU02l0hcRLVbrFzn2XxgzD+d8u5jVi1fm3J/614HmMt5F3JGlak+EaDbJIcMpGh/srN+uTa
	MWtTWlMpMcax9cHs5qcIAloFoQbHNmnF3DW9An5BNQVYb+P3ClD9C7az8JJ6xVrMSg3tThnI+be
	cxq4qe3da6GETqT0ZRW9oUP3jFE5nwziz4oXVEWdCp06iibIqlaBXzuLs3vExmJSjGRo/PI5c97
	1nvqJFzuWd
X-Google-Smtp-Source: AGHT+IEZlEyD0bkB7d/97qYcP/RQ2xkXI4a0xxbr+dPecQF5IK9I1nO1GeaTQ4onTAjGEKq4kacY7w==
X-Received: by 2002:a05:6000:200f:b0:430:f879:a0ee with SMTP id ffacd0b85a97d-4324e4c1259mr40176060f8f.5.1767019915242;
        Mon, 29 Dec 2025 06:51:55 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm59449884f8f.2.2025.12.29.06.51.54
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 06:51:54 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][whinlatter][PATCH 04/11] cups-filters: patch CVE-2025-64524
Date: Mon, 29 Dec 2025 15:51:45 +0100
Message-ID: <20251229145152.489068-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229145152.489068-1-skandigraun@gmail.com>
References: <20251229145152.489068-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 14:52:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122983

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64524

Pick the patch mentioned in the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 056ee43dd1d0e46a9b40339e877a4bf76cf8196b)
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

