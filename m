Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE5DCCD18C
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 18:09:58 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web10.7461.1760033396245996328
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Oct 2025 11:09:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BS87lceO;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b3c2db014easo250742766b.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 11:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760033394; x=1760638194; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=mu22RGgKAoYvLXltXt24gYs2nWy5HtE9+k1jleJSJl4=;
        b=BS87lceOgao08DsrQT9b3/OgPdwb5yiaCuP9fnC0PYeO7HN0ef9DLNUFVa1pwlUBlF
         yeCY0FpJHOfbnYGcl1dGaB5S0cbtAoEKAxqhzw7p09Yw/Cd7KIvGar2N+56UbLxtHfO1
         LO+AXd5JHSCluLsO0DpV+tqR993QoUVDdo6VC84yhG5JQ/XYLpGY1vJgsDV+8fARQQa7
         LJQWgyeSSGD1Py01H0WzhX/XKY4RnGPyO+krR85rlgwybDaHE0V2Qgh5qpADqgMMRKsL
         Eyy2lULc/r2Mnw5oLiVrNf+KQGdxocZ2/W2dy9eAPqLd6R8IZUKdV0U337q3d33mNQUU
         KGjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760033394; x=1760638194;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mu22RGgKAoYvLXltXt24gYs2nWy5HtE9+k1jleJSJl4=;
        b=H1Y6u+ocwla8Pc1vYMwWnaq+ABWNcNQM7oQZGGIqID0/QyyJE3feKIbWDucZHVnAxh
         Oiitowomzwbd+PDoKrcAGjCqds5XovRDmsK+vTPe8g0uoZxRut/HW+hL3KftLRr4gyr8
         tlrvkuoLrJkSk/6w6uvWHEV8VvBTygOwV3KwxBZxVrXU5woB61qGtzkt4pDfjCDUCX3H
         StNYyKjB0G5QO2h4zuEu0tBtd2qyCQJJWtX05omYGHh3c5j9bYlAH6o7fwYLI/1JHTVR
         WZIC9Ab4/tXdLEPvikPx25y3MPl8AE5ZHICuaI9HcyJAn6Xvmm8sqNZwVEQfLPToTdVk
         Z0Ig==
X-Gm-Message-State: AOJu0YzBy5SOmKH2WfXWRUd2zPBhasmGb1DmqEv8E3RXaUGSVrOLDEsf
	XbH4dmq4KtujS9Fan1Fhl63w8XDlwd+s2Bs7Mw3LOS0RrrDchzqtp0EQirPhtg==
X-Gm-Gg: ASbGncuLcvYKLZumCMFIY8ZL8qzJoKL6Pc9/hGeXweGAqubJzo9mGSHLQv+ZyluC5iF
	/0L1GuP+/Qby+cny2qvdV/A0jg3MVANEm1ZtAhhHExaVuK7WV/bMYs2gPAW04JFO2LdtuktDyEu
	wVtFOMI1iYpARPtaNSh3XZGwmWXNQ0Lf/Hra+5rZnfuTX/7Ew2t8JX8DK6yr1dIo6PWB7bmEl2W
	uzKlIOpLBnU4wU2qNr3s3W4f2ulhhXdID8BYQut6R5eAzq/oFNGNYEpYGJNPApoeRp6BQtVA9zb
	ROB8mhkcYKmfLHD7gBYxC8DR+nCcLYRNQgYaI05yZemEkcAC2axelgFaNDm4RiD9Rn+LhLhNRUf
	sXmL8hccXLuQ1Yr3hszjLv51tZvk7y1IGruOA4WgzA7h8HJl+l3rLxlM=
X-Google-Smtp-Source: AGHT+IFMSDGiBjs8wDAlkTk8ml+ZVqh/q1F5PEyk8yYv8GPB/OvhZAYlxqisp84J+st8Gyuaj5gHDg==
X-Received: by 2002:a17:907:3daa:b0:b46:31be:e8f0 with SMTP id a640c23a62f3a-b50a9c5b3c8mr1036732866b.3.1760033393955;
        Thu, 09 Oct 2025 11:09:53 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d5cac037sm28608766b.12.2025.10.09.11.09.53
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Oct 2025 11:09:53 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 1/3] jasper: patch CVE-2025-8835
Date: Thu,  9 Oct 2025 20:09:50 +0200
Message-ID: <20251009180952.1538179-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 18:09:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120442

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-8835

Pick the patch from the details of the above link.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../jasper/jasper/0001-Fixes-400.patch        | 171 ++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.1.1.bb   |   4 +-
 2 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
new file mode 100644
index 0000000000..217eb29179
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-400.patch
@@ -0,0 +1,171 @@
+From ad08c18022f730937ccf9e9feb2a5236146afec5 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 29 Jul 2025 20:16:35 -0700
+Subject: [PATCH] Fixes #400.
+
+Added a check for a missing color component in the jas_image_chclrspc
+function.
+
+CVE: CVE-2025-8835
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/bb7d62bd0a2a8e0e1fdb4d603f3305f955158c52]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/libjasper/base/jas_image.c | 72 ++++++++++++++++++++++++++++------
+ 1 file changed, 61 insertions(+), 11 deletions(-)
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
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
index 5281980ecb..82867c0a1e 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.1.bb
@@ -3,7 +3,9 @@ HOMEPAGE = "https://jasper-software.github.io/jasper/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a80440d1d8f17d041c71c7271d6e06eb"
 
-SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master"
+SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=master \
+           file://0001-Fixes-400.patch \
+           "
 SRCREV = "917f7708b755d8434f70618108c1a76f1b6a0a82"
 
 CVE_STATUS[CVE-2015-8751] = "fixed-version: The CPE in the NVD database doesn't reflect correctly the vulnerable versions."

