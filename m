Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF84DCFD31C
	for <webhook@archiver.kernel.org>; Sun, 23 Nov 2025 17:43:19 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17915.1763919792664379179
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Nov 2025 09:43:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mQH3orcX;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-42b3c965df5so1801092f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 09:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763919791; x=1764524591; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H3a+R9nmPdnbgzEHSDtdmmFHODau20iI8ZzYRWZdRZA=;
        b=mQH3orcXIwQNkdmkORUjiOtkqVMJ6pmoeIis49ajyXeJ6jnWvQyVHT43ux39ZtReix
         1z859+xVGOkJQ9p633PnXPcmQJB4nv03J79NWekNkCMNGjr7e3eHW9mAOxU4nMvYYC/H
         vAmH0GgxWizW0yjM/VEKWdyEv5UxtGs6Y8VjHZmmdAQouP8fEeBIGmUjxU+Wafu1WnUj
         osqiOqWQIJgx95O52IGBWwcGG7u5kA1q5a52j4JmyaEF+aOlBi94jQUrQAISGDXARC8n
         wa5rM1WVOrn198h3+RdOMq5PhtWtPW4O5EkuT/E4L+Q7YrrPGUNCy+jDxj3GBff+Zp43
         o2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763919791; x=1764524591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H3a+R9nmPdnbgzEHSDtdmmFHODau20iI8ZzYRWZdRZA=;
        b=E4wZj59lQ7mCuFMDiK4618m1eQgTUj3MrSBeoAqEIdfcgWvu7ULHLCpUnbO/2ppP0C
         9kjhM02mF+BBDQKJKNGH8ZZ2/iN8QyXwfIHuTVj6mJ7ypBr3NsweaZ1mwgWs5RIRafud
         o/33tHKBvZK6/atVCs02Ixd1EUJL+oBCo3WsOPD1nS2LHGgGB/8v4WDjhBcAHUhqTvZm
         KiBNXKdmSmpzLBAMFamgskwG2sQAlDAQlR2hhzHzXYni8kimuntsy/bzDHu7k/CmFvwZ
         bnJvuR45aiaYPIWjvlsNzmVJpTnRc/2HRLlhLPh4WKjcvJSD1p/bIu5fyGimnQ+h2+vQ
         7ztA==
X-Gm-Message-State: AOJu0Yyjo960RTU4qRc4FYg+oNnLx+8PtLigAk/oelkP25PvbDFEEyOQ
	ccVyA9LAich5zxs/YD1BcWeFKIihGAqnE1qkOap7rwZWMH61f6GFehjlghOh9DWV
X-Gm-Gg: ASbGncumji/GrgOh0U6QYNqV0hnnwEiGKMCyAX9EVPnJvUJQGbQmheVGeBLLk4HrIxc
	gkD0ymL11LH+DxsH837eGIo9ijvHY/zGJ6SctsG9U/Ra3zo8paMB8g6vlxUUnM4AvS7jOGiX/36
	wbAjksjBEon8iu3wcDLcCIuj2HtV29JyQISRmuzI1LDIsObsKc7mMy0gwW7KKjUXMIpYi3ocG/K
	gsgKAap9yVFe504x2Ex6Qx50Dx6Np6/NaG3Jy23uakX8GNa42bXE0pdZZx+CioUQQN9K4wFyM3u
	wjW2Q5pcAX7C2gMm4RMEtBMWBbn/MpIztoOmFV1RoX3xv6VoxxqvnFRpaywRgJwYNUJRK5YkOby
	TwDKdb1VhWJ5cf3r/lTozdzPY9aP2OK8s3h9i/2dL2hx44/PzZP4dRioE+NLtJnSo+SFOlvtyjD
	t2eg8eInqH
X-Google-Smtp-Source: AGHT+IH5JqBeaCeDxQfQrs7qsOVrcda9VbJiBY4rBE8JTCnAIYOfBu1eYCnbBrR2elJ6kJNMhLcWjw==
X-Received: by 2002:a05:600c:35cf:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-477c00ee003mr119354685e9.0.1763919790881;
        Sun, 23 Nov 2025 09:43:10 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf1f3e63sm156733795e9.7.2025.11.23.09.43.10
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 09:43:10 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 2/4] jasper: patch CVE-2025-8835
Date: Sun, 23 Nov 2025 18:43:07 +0100
Message-ID: <20251123174309.2625557-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251123174309.2625557-1-skandigraun@gmail.com>
References: <20251123174309.2625557-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 23 Nov 2025 17:43:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121999

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8835

Pick the patch that is referenced by the nvd report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/CVE-2025-8835.patch         | 170 ++++++++++++++++++
 .../recipes-graphics/jasper/jasper_2.0.33.bb  |   1 +
 2 files changed, 171 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch
new file mode 100644
index 0000000000..d781d24361
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/CVE-2025-8835.patch
@@ -0,0 +1,170 @@
+From 8c72f24556b2418f5689713eb706014423473a73 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 29 Jul 2025 20:16:35 -0700
+Subject: [PATCH] Fixes #400.
+
+Added a check for a missing color component in the jas_image_chclrspc
+function.
+
+CVE: CVE-2025-8835
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/base/jas_image.c | 73 ++++++++++++++++++++++++++++------
+ 1 file changed, 61 insertions(+), 12 deletions(-)
+
+diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
+index 68a94e1..bfbf9e5 100644
+--- a/src/libjasper/base/jas_image.c
++++ b/src/libjasper/base/jas_image.c
+@@ -112,7 +112,8 @@ static long convert(long val, bool oldsgnd, unsigned oldprec, bool newsgnd,
+   unsigned newprec);
+ static void jas_image_calcbbox2(const jas_image_t *image, jas_image_coord_t *tlx,
+   jas_image_coord_t *tly, jas_image_coord_t *brx, jas_image_coord_t *bry);
+-
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
+ /******************************************************************************\
+ * Global data.
+ \******************************************************************************/
+@@ -409,6 +410,36 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
+ 	jas_free(cmpt);
+ }
+ 
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
++{
++	jas_cmcmptfmt_t* cmptfmts;
++	JAS_DBGLOG(10, ("jas_cmcmptfmt_array_create(%d)\n", n));
++	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
++		return 0;
++	}
++	for (int i = 0; i < n; ++i) {
++		cmptfmts[i].buf = 0;
++	}
++	JAS_DBGLOG(10, ("jas_cmcmptfmt_array_create(%d) returning %p\n", n,
++	  JAS_CAST(void *, cmptfmts)));
++	return cmptfmts;
++}
++
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
++{
++	assert(cmptfmts);
++	assert(n > 0);
++	JAS_DBGLOG(10, ("jas_cmcmptfmt_array_destroy(%p, %d)\n",
++	  JAS_CAST(void *, cmptfmts), n));
++	for (int i = 0; i < n; ++i) {
++		if (cmptfmts[i].buf) {
++			jas_free(cmptfmts[i].buf);
++		}
++		cmptfmts[i].buf = 0;
++	}
++	jas_free(cmptfmts);
++}
++
+ /******************************************************************************\
+ * Load and save operations.
+ \******************************************************************************/
+@@ -1470,12 +1501,15 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image, const jas_cmprof_t *outprof,
+ 	jas_cmcmptfmt_t *incmptfmts;
+ 	jas_cmcmptfmt_t *outcmptfmts;
+ 
++	assert(image);
++	assert(outprof);
++
+ #if 0
+ jas_eprintf("IMAGE\n");
+ jas_image_dump(image, stderr);
+ #endif
+ 
+-	if (image->numcmpts_ == 0)
++	if (!jas_image_numcmpts(image))
+ 		/* can't work with a file with no components;
+ 		   continuing would crash because we'd attempt to
+ 		   obtain information about the first component */
+@@ -1483,6 +1517,8 @@ jas_image_dump(image, stderr);
+ 
+ 	outimage = 0;
+ 	xform = 0;
++	incmptfmts = 0;
++	outcmptfmts = 0;
+ 	if (!(inimage = jas_image_copy(image)))
+ 		goto error;
+ 	image = 0;
+@@ -1565,15 +1601,21 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	inpixmap.numcmpts = numinclrchans;
+-	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	assert(numinclrchans != 0);
++	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
+ 		abort();
+ 	}
+ 	inpixmap.cmptfmts = incmptfmts;
+ 	for (unsigned i = 0; i < numinclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
+ 			goto error;
+ 		}
++		assert(j >= 0 && j < jas_image_numcmpts(inimage));
+ 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
+ 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
+ 		incmptfmts[i].width = width;
+@@ -1581,15 +1623,20 @@ jas_image_dump(image, stderr);
+ 	}
+ 
+ 	outpixmap.numcmpts = numoutclrchans;
+-	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
+ 		abort();
+ 	}
+ 	outpixmap.cmptfmts = outcmptfmts;
+ 
+ 	for (unsigned i = 0; i < numoutclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_eprintf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long))))
+ 			goto error;
++		assert(j >= 0 && j < jas_image_numcmpts(outimage));
+ 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
+ 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
+ 		outcmptfmts[i].width = width;
+@@ -1612,14 +1659,8 @@ jas_image_dump(image, stderr);
+ 		}
+ 	}
+ 
+-	for (unsigned i = 0; i < numoutclrchans; ++i) {
+-		jas_free(outcmptfmts[i].buf);
+-	}
+-	jas_free(outcmptfmts);
+-	for (unsigned i = 0; i < numinclrchans; ++i) {
+-		jas_free(incmptfmts[i].buf);
+-	}
+-	jas_free(incmptfmts);
++	jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
+ 	jas_cmxform_destroy(xform);
+ 	jas_image_destroy(inimage);
+ 
+@@ -1631,6 +1672,14 @@ jas_image_dump(outimage, stderr);
+ #endif
+ 	return outimage;
+ error:
++	if (incmptfmts) {
++		assert(numinclrchans);
++		jas_cmcmptfmt_array_destroy(incmptfmts, numinclrchans);
++	}
++	if (outcmptfmts) {
++		assert(numoutclrchans);
++		jas_cmcmptfmt_array_destroy(outcmptfmts, numoutclrchans);
++	}
+ 	if (xform)
+ 		jas_cmxform_destroy(xform);
+ 	if (inimage)
diff --git a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
index 522adba93d..c314da539f 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_2.0.33.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
 SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
            file://CVE-2023-51257.patch \
+           file://CVE-2025-8835.patch \
            "
 SRCREV = "fe00207dc10db1d7cc6f2757961c5c6bdfd10973"
 

