Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615D5E7DF05
	for <webhook@archiver.kernel.org>; Mon,  2 Feb 2026 16:37:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57082.1770050239449847727
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Feb 2026 08:37:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7354XaK;
 spf=pass (domain: gmail.com, ip: 209.85.128.44, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48069a48629so48520105e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 08:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770050238; x=1770655038; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uzASdk4Kt4LZ9Z77B4fEvpaNxzaUh1PYHkafMic3wjY=;
        b=e7354XaKthxJdoxibjc0vKrq5lsWUiSowZfP8/++/1PkgyH1xciJZQGZiaNY63MXJO
         YYBG5L1iAtj3eW2zIg698y5W76NiahUYmesQXbmy7StAARASX2KKqtRGEIa/1ZTKrT81
         F0DB22G1mCFLTrj4nXs5kzudLbktcq8CeMwYfg6hNqo00HmwAACL9WtXGstCExuqeVhe
         UM/VIzc4YIwtJOExIaRfVS3TYLpqQGnE89M7Sxg1/O//LhClXltnSXJrqGbu+cv8OtJN
         QEdDZA7PtQBM+nh+qDHUW8egQQo1cNNXh65IF2F0WHdaP6NNAtZ5YmvldJVBYaESri8k
         7HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770050238; x=1770655038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uzASdk4Kt4LZ9Z77B4fEvpaNxzaUh1PYHkafMic3wjY=;
        b=C63jkB3JZo/LgiNOuVPuhoY58wM3KleX9c9jbgT4QyUdnII4YcTMEl/7R8sCec9FKv
         DcXrBtjUIPJvyNin6XKz8gA8lLeXPpzYEbpoWAtPEpJZe4/LmanoY16PlrXJytR+GN6b
         j1YkeZ7U5msSISL4Q8Z2GzIAT/y1eszNASDqC+3LuA3tgBA2JbPMUfGCJyhH8mPQNr31
         eG4ov3H62iWawLGqS+bksClo3gVASgHtHhPB8ESJjGNfYtxD0nB2N0NLBzyQZBe5laYW
         xY8qRH1FDWl0EBXasCdtsAvnsEJHwgFSnOU1DffgHKdr3JUbSdPBvNSylTAm3y50BgBW
         z3Sg==
X-Gm-Message-State: AOJu0YzCd98Gbqcyib6iVCVNqVU4ULAI6J4yIsFfhSZtpepWhA3tX4+z
	d159D4oxF54Jq63onQPWyeLGLQw7aPZtuF5MrNKT6w7x6yYTU10CMd+qoErMsg==
X-Gm-Gg: AZuq6aKQSDYDaH/D+8WL62zZuKwOkqsu+T9Q2BlyjATXjdkI7u0iaZNptvMYhvO4hrL
	teRZEVoXKbOm7+OKJT8USdOC9yJLPUtfg7Bb4nLgcVRRDo9ojwy73Erqoo39RZwz4y5teVdkqoN
	L4oe7yG3Mqmuq82fm3ifDE61mIpyICDYytkccoRWau7AStPe0gXT3G4QIxPxGY4B2m5UangG7K3
	JD4fBtHt/qFOHnMxKZSXrQu6rD1Oe6qe5SmgDiDLogLYnVyrlIlAHNjH+F5HPxekopNZYJ+kirL
	xrooIZll7O99y6jSZJxBulMgLvTTZKDg2mCk8DHQDql+/oRpSRyl7bw3V6IhQ92TyboC38PXuRV
	MGpzWPPi1jOnAz2nu9Yc+SCLPLqT1YoSGuYHSNbM8oGYGy1IZJY1vstim+aPsEpNKZwGfqCYXQs
	BAQk+97etg
X-Received: by 2002:a05:600c:c0cd:b0:47d:6856:9bd9 with SMTP id 5b1f17b1804b1-482db623c40mr102926565e9.23.1770050237722;
        Mon, 02 Feb 2026 08:37:17 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483051372cdsm451395e9.13.2026.02.02.08.37.17
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 08:37:17 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/9] libcupsfilters: patch CVE-2025-64503
Date: Mon,  2 Feb 2026 17:37:09 +0100
Message-ID: <20260202163714.2359370-4-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260202163714.2359370-1-skandigraun@gmail.com>
References: <20260202163714.2359370-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 02 Feb 2026 16:37:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124065

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-64503

Pick the patch that explicitly refernces the CVE ID in its message.
(The NVD advisory mentions only the cups-filters patch, but
the developer indicated the CVE ID in the libcupsfilters patch also)

Between this recipe version and the patch the project has decided to
eliminate c++ from the project, and use c only. The patch however
is straightforward enough that it could be backported with very small
modifications.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../cups/libcupsfilters/CVE-2025-64503.patch  | 47 +++++++++++++++++++
 .../cups/libcupsfilters_2.1.1.bb              |  8 ++--
 2 files changed, 51 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
new file mode 100644
index 0000000000..b70586296e
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
@@ -0,0 +1,47 @@
+From da9a7db3b9125c87b11c43b05354ca2eb21ed684 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Mon, 10 Nov 2025 21:10:56 +0100
+Subject: [PATCH] Fix out-of-bounds write in cfFilterPDFToRaster()
+
+From: Till Kamppeter <till.kamppeter@gmail.com>
+
+PDFs with too large page dimensions could cause an integer overflow and then a too small buffer for the pixel line to be allocated.
+
+Fixed this by cropping the page size to the maximum allowed by the standard, 14400x14400pt, 200x200in, 5x5m
+
+https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
+
+Fixes CVE-2025-64503
+
+CVE: CVE-2025-64503
+Upstream-Status: Backport [https://github.com/OpenPrinting/libcupsfilters/commit/fd01543f372ca3ba1f1c27bd3427110fa0094e3f]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cupsfilters/pdftoraster.cxx | 14 ++++++++++++++
+ 1 file changed, 14 insertions(+)
+
+diff --git a/cupsfilters/pdftoraster.cxx b/cupsfilters/pdftoraster.cxx
+index 0235b54..09583df 100644
+--- a/cupsfilters/pdftoraster.cxx
++++ b/cupsfilters/pdftoraster.cxx
+@@ -1606,6 +1606,20 @@ out_page(pdftoraster_doc_t *doc,
+   l = inputPageBox.height();
+   if (l < 0)
+     l = -l;
++
++  //
++  // Maximum allowed page size for PDF is 200x200 inches (~ 5x5 m), or 14400x14400 pt
++  // https://community.adobe.com/t5/indesign-discussions/maximum-width-of-a-pdf/td-p/9217372
++  //
++  if (doc->header.cupsPageSize[0] > 14400) {
++    fprintf(stderr, "ERROR: Page width is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[0]);
++    doc->header.cupsPageSize[0] = 14400;
++  }
++  if (doc->header.cupsPageSize[1] > 14400) {
++    fprintf(stderr, "ERROR: Page height is %.2fpt, too large, cropping to 14400pt\n", doc->header.cupsPageSize[1]);
++    doc->header.cupsPageSize[1] = 14400;
++  }
++
+   if (rotate == 90 || rotate == 270)
+     doc->header.cupsPageSize[0] = l;
+   else
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
index 51d8c4f18b..311f33e134 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.1.1.bb
@@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"
 
 DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 
-SRC_URI = " \
-	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
-"
+SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
+           file://CVE-2025-64503.patch \
+           "
 SRC_URI[sha256sum] = "6c303e36cfde05a6c88fb940c62b6a18e7cdbfb91f077733ebc98f104925ce36"
 
 inherit autotools gettext pkgconfig github-releases

