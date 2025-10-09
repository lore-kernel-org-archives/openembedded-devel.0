Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA6BCCD18A
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:10:18 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.7468.1760033410604289911
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f6VuJ/2m;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b3c2db014easo250779766b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033409; x=1760638209; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=+8WBTkZFrPjCHN7uU4r3MayneFXprnI5VMRxQ4C+mkI=;
        b=f6VuJ/2m2r2UXDYRJbHBoTiGlkschn6Dtuz+/XJ70HcSRIHbPLTcQutzWPDlkZcdxu
         4WOXF5nFvhWc2iGwKXntTiCeL8Fd4i+OlC59dIxwaHEkzDf4pjujWvH86Exxp4Hrq7xQ
         JMZPav3G82JbK6aRSPH2wUMU0A4FyRj9NAffL98CWfT+PcGsVKeTAxicdUxmtyCoG5dG
         N+0HxT2aURgUpecampnF/z6lJCD7bMHrE6MVpGw04I4V/nia8TF+vOPdJPWn8GQyGE6J
         heHuP4R/MIYUysFOJfvUEHiu5x8G03ZgelsRv4t8DEipAwe0YgSffwlK4nDBtK1fB2hR
         R5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033409; x=1760638209;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+8WBTkZFrPjCHN7uU4r3MayneFXprnI5VMRxQ4C+mkI=;
        b=gXhGiUvFaoTmhWa1094+CCg5MLAN76ON1yiXdwqvSvAUIR+CeOxMHcmAFWBJtTEe5g
         jR8vD7Vcp+f6y5OeUd6k9om42BfRXOITpK0G3S8yW0CU9CL+qDXZm+t/cZSCGfFcLGJx
         tgkRk1lXiuN6L5H8TwvKHsrsC5vi6gCzSuLkj3nc/0jPY3p/HoB0zKbi46OsOoXmDwPC
         7gYkbzVTaXgMeCPrIzs1DIKwt/P6tZTVHSYNWYE1QUiyMNe6cY7ZyhE2/AdrwrJ0m4TI
         0aNqRfue3GU0aEJX8bPBxMYhhMQSLBXLxAwuHGF+HtDEllLPjgfCusReqfAf2HYDYeLl
         DWkQ==
X-Gm-Message-State: AOJu0YyEA2g0aokV2nKJeDRlhERkzlUSww0ZtB/1ren0xOvgOED0wRau
	LfM5fhxfJmSDvoTrA34AlOQIsplw+E+fRuWENgx3EyiTgk8YLVxw0FtV1NF1HA==
X-Gm-Gg: ASbGncuqDOlrGC6ANsEusABy25Csd2rDUjZ1+O7mdtUdUNklSqIkA1tKee8bwd2Mac7
	8TYCvy5UxDp1GHosmSSPfE5Rawq1IzgFmdqzeicD1PRpvrOZgIb4hZcN68Id0MPkpkrBsf7ENW0
	fSr10uD34UZd4Vp4VAWGDf/yFloJ1bsfTa5dECTt8FdspFre7U9I0iPzC/te5YMhpBO5Nzl393r
	LK4qgRGOjnkNCwEI//aHxt2yh21L2/Ovq/sUuYSXYfSOnQUs45tq5VCna+UOW7cOg6U0yeyS5VR
	5OLYDFhWjHVc7GNcTTFi8T1l+yGpA686N3FYyG2cVa0KRLg9LOPDL5RzrL1hTkQ8NUDkJQdjBfu
	iuKT/nsgawTO0n+mjOzDf/PY5OACJfk6hnlhfyBJrwTtb
X-Google-Smtp-Source: AGHT+IHbMNUSLPQxiIizNi+nr3+avrricupVSzoupC0zyrXaMbGoaJUfoARjsVjLMlGheihfOFYNfw==
X-Received: by 2002:a17:907:3e8c:b0:b46:cc3b:65fd with SMTP id a640c23a62f3a-b50aa99e1ddmr868113666b.29.1760033408714;
        Thu, 09 Oct 2025 11:10:08 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d900ccf1sm26784966b.63.2025.10.09.11.10.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:10:08 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 1/3] jasper: patch CVE-2025-8835
Date: Thu,  9 Oct 2025 20:10:05 +0200
Message-ID: <20251009181007.1538218-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120445

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8835

Pick the patch from the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-400.patch        | 173 ++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.2.4.bb   |   4 +-
 2 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
new file mode 100644
index 0000000000..0e7cd01b59
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
@@ -0,0 +1,173 @@
+From 8c6da904432451aec2a9e4d6169ad771dbe72820 Mon Sep 17 00:00:00 2001
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
+ src/libjasper/base/jas_image.c |  72 ++++++++++++++++++++++++++++-----
+ 1 file changed, 61 insertions(+), 11 deletions(-)
+ create mode 100644 data/test/other/poc_400.pnm
+
+diff --git a/src/libjasper/base/jas_image.c b/src/libjasper/base/jas_image.c
+index 1ed0905..c8aa42b 100644
+--- a/src/libjasper/base/jas_image.c
++++ b/src/libjasper/base/jas_image.c
+@@ -118,6 +118,8 @@ static void jas_image_calcbbox2(const jas_image_t *image,
+   jas_image_coord_t *bry);
+ static void jas_image_fmtinfo_init(jas_image_fmtinfo_t *fmtinfo);
+ static void jas_image_fmtinfo_cleanup(jas_image_fmtinfo_t *fmtinfo);
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n);
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n);
+ 
+ /******************************************************************************\
+ * Create and destroy operations.
+@@ -413,6 +415,36 @@ static void jas_image_cmpt_destroy(jas_image_cmpt_t *cmpt)
+ 	jas_free(cmpt);
+ }
+ 
++static jas_cmcmptfmt_t* jas_cmcmptfmt_array_create(int n)
++{
++	jas_cmcmptfmt_t* cmptfmts;
++	JAS_LOGDEBUGF(10, "jas_cmcmptfmt_array_create(%d)\n", n);
++	if (!(cmptfmts = jas_alloc2(n, sizeof(jas_cmcmptfmt_t)))) {
++		return 0;
++	}
++	for (int i = 0; i < n; ++i) {
++		cmptfmts[i].buf = 0;
++	}
++	JAS_LOGDEBUGF(10, "jas_cmcmptfmt_array_create(%d) returning %p\n", n,
++	  JAS_CAST(void *, cmptfmts));
++	return cmptfmts;
++}
++
++static void jas_cmcmptfmt_array_destroy(jas_cmcmptfmt_t* cmptfmts, int n)
++{
++	assert(cmptfmts);
++	assert(n > 0);
++	JAS_LOGDEBUGF(10, "jas_cmcmptfmt_array_destroy(%p, %d)\n",
++	  JAS_CAST(void *, cmptfmts), n);
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
+@@ -1588,12 +1620,15 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
+ 	jas_cmcmptfmt_t *incmptfmts;
+ 	jas_cmcmptfmt_t *outcmptfmts;
+ 
++	assert(image);
++	assert(outprof);
++
+ #if 0
+ 	jas_eprintf("IMAGE\n");
+ 	jas_image_dump(image, stderr);
+ #endif
+ 
+-	if (image->numcmpts_ == 0) {
++	if (!jas_image_numcmpts(image)) {
+ 		/*
+ 		can't work with a file with no components;
+ 		continuing would crash because we'd attempt to
+@@ -1604,6 +1639,8 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
+ 
+ 	outimage = 0;
+ 	xform = 0;
++	incmptfmts = 0;
++	outcmptfmts = 0;
+ 	if (!(inimage = jas_image_copy(image))) {
+ 		goto error;
+ 	}
+@@ -1694,16 +1731,22 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
+ 	}
+ 
+ 	inpixmap.numcmpts = numinclrchans;
+-	if (!(incmptfmts = jas_alloc2(numinclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	assert(numinclrchans != 0);
++	if (!(incmptfmts = jas_cmcmptfmt_array_create(numinclrchans))) {
+ 		// formerly call to abort()
+ 		goto error;
+ 	}
+ 	inpixmap.cmptfmts = incmptfmts;
+ 	for (unsigned i = 0; i < numinclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(inimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_logerrorf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(incmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
+ 			goto error;
+ 		}
++		assert(j >= 0 && j < jas_image_numcmpts(inimage));
+ 		incmptfmts[i].prec = jas_image_cmptprec(inimage, j);
+ 		incmptfmts[i].sgnd = jas_image_cmptsgnd(inimage, j);
+ 		incmptfmts[i].width = width;
+@@ -1711,7 +1754,7 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
+ 	}
+ 
+ 	outpixmap.numcmpts = numoutclrchans;
+-	if (!(outcmptfmts = jas_alloc2(numoutclrchans, sizeof(jas_cmcmptfmt_t)))) {
++	if (!(outcmptfmts = jas_cmcmptfmt_array_create(numoutclrchans))) {
+ 		// formerly call to abort()
+ 		goto error;
+ 	}
+@@ -1719,9 +1762,14 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
+ 
+ 	for (unsigned i = 0; i < numoutclrchans; ++i) {
+ 		const int j = jas_image_getcmptbytype(outimage, JAS_IMAGE_CT_COLOR(i));
++		if (j < 0) {
++			jas_logerrorf("missing color component %d\n", i);
++			goto error;
++		}
+ 		if (!(outcmptfmts[i].buf = jas_alloc2(width, sizeof(long)))) {
+ 			goto error;
+ 		}
++		assert(j >= 0 && j < jas_image_numcmpts(outimage));
+ 		outcmptfmts[i].prec = jas_image_cmptprec(outimage, j);
+ 		outcmptfmts[i].sgnd = jas_image_cmptsgnd(outimage, j);
+ 		outcmptfmts[i].width = width;
+@@ -1746,14 +1794,8 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
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
+@@ -1765,6 +1807,14 @@ jas_image_t *jas_image_chclrspc(jas_image_t *image,
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
+ 	if (xform) {
+ 		jas_cmxform_destroy(xform);
+ 	}
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
index 4796a85190..a2950dbe55 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.4.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://jasper-software.github.io/jasper/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz"
+SRC_URI = "https://github.com/jasper-software/${BPN}/releases/download/version-${PV}/${BP}.tar.gz \
+           file://0001-Fixes-400.patch \
+           "
 SRC_URI[sha256sum] = "6a597613d8d84c500b5b83bf0eec06cd3707c23d19957f70354ac2394c9914e7"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

