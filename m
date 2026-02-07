Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43465EE0ACE
	for <webhook@archiver.kernel.org>; Sat,  7 Feb 2026 10:34:11 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2752.1770460443810270804
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 07 Feb 2026 02:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cv+PSol6;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4362d4050c1so1296244f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 02:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770460442; x=1771065242; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u4OYaDRBcJ4lMPOIpCnvWAS0ok/vhSuVcfQYk7Mfdpg=;
        b=cv+PSol67LrNdxMW2SVtoM0Y9LxcDz42fq2iaTQmoYtMaFpA6XTWIC9Y+SGZOclYQE
         lAWvvJqvGbPzWDkJJzAOYBCSDOeSlf+JnQxT+H4r2KFwhS/M4yLZzsFYtHxyxzU4kIHO
         n24CmZO0H58VQBtk/3uZ1ox+K7BD28f8aeGOZu8qUHgK9IgRCVZ9t58AXnDyyE6K3cS/
         IfJmV9u5YWkCrKRVPLI0bBUrTPSzMkVykGCT3D6ITYbHSIQZfmWs6nj5fts4CeDqeufV
         NFT8JYRnFD6Pj9Rbk3PM95hlQdA6OveZFwvqWlQrLwfe7KzW/YmSwyPIQg6vrPYw5g8b
         TPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770460442; x=1771065242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u4OYaDRBcJ4lMPOIpCnvWAS0ok/vhSuVcfQYk7Mfdpg=;
        b=ZnE+nElWtqLmbPsDFwGZqrSIjSK+zLJG2zVT0Q1LJmP10fyilvR8c7pcHkDfNFQvf9
         T4KcxccLLhyTSJ8I5dP9R6qbTKKXHPc0S9uXjgwGUcILf71G7qow5NJgkOulrW4C0j42
         Gl59WbsFi/UMaHYlledI2vfy9Kex4EYX6vqNbi93caNDf2jxhQOYkEbYTuxCpv+GpCWc
         WM5LvWlTQYImaNweL+akHJf3r+C+B9KocDRf93QmtBMUktIn7msZmT7qKI2mo4f9jYz6
         Q3bRyIMtVhFe8atc0TGsimALFJvfKzbHXGg2lRILmHceqBD9Mo9cNyX343xwG7WvFNEV
         yFkA==
X-Gm-Message-State: AOJu0YzFKAwWey6ZeJUxVxQtHRZse1lcA2M/csC7FfM4u6qiMnXOq+l5
	c8nwUymBk/rPKmpYB4Imi+xNNgJBKeLEfGZOSI4rFEi4nK0pByFQ/GVIRGvv0Q==
X-Gm-Gg: AZuq6aKvrWj1qiyQYXTxnggeqnrAWfaR6wW2CEpm8iNg9LNw/F2KXpMbK0N+7J/z4nF
	qV9q2DjMBijZ+Mxou7rhYlC3+vCkmErccnAAqbPJtFbnt+HXGD3JvaoG3CciPb4DSw4zY2uii6U
	Aqw1/V2t3vdtc97/Pl+BMllgTMOVpG0gG0LND6Fl0sYm9GdO1Zx88c/oQIa9qMkxtNy53rUBKUb
	zvRC3ZqvM09MNsX2sRInwIX/Sg+QEfn1cCrkEZ7oJ2EOgHx9ThAYyCnliLBfc93Hzkq7SWPXN4T
	ibwfTSIMwivdJSQu/8Sky5PXaSj4kOe/OlGn9IgAIpi1LcWw5CEZSGty5fjvmoQsMOFej8hAILN
	U0gX+FIEdLfm77UHtLMjEvHDWLFVZekTFRWY1VJhgGk5WgZZSbY60vGVYKwdQdfg/BwJy4ibRED
	P4m5chS2JN
X-Received: by 2002:a05:6000:184f:b0:430:f241:a11f with SMTP id ffacd0b85a97d-4362938b258mr7755536f8f.30.1770460441783;
        Sat, 07 Feb 2026 02:34:01 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43629664632sm12077622f8f.0.2026.02.07.02.34.01
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 02:34:01 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH 02/15] libcupsfilters: patch CVE-2025-64503
Date: Sat,  7 Feb 2026 11:33:44 +0100
Message-ID: <20260207103359.4177243-2-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260207103359.4177243-1-skandigraun@gmail.com>
References: <20260207103359.4177243-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Feb 2026 10:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124243

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
 .../cups/libcupsfilters/CVE-2025-64503.patch  | 45 +++++++++++++++++++
 .../cups/libcupsfilters_2.0.0.bb              | 12 ++---
 2 files changed, 51 insertions(+), 6 deletions(-)
 create mode 100644 meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch

diff --git a/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
new file mode 100644
index 0000000000..fc49c6b1f2
--- /dev/null
+++ b/meta-oe/recipes-printing/cups/libcupsfilters/CVE-2025-64503.patch
@@ -0,0 +1,45 @@
+From 7b5275f86f9011ac260409e7456bf21e05541bce Mon Sep 17 00:00:00 2001
+From: Till Kamppeter <till.kamppeter@gmail.com>
+Date: Mon, 10 Nov 2025 21:10:56 +0100
+Subject: [PATCH] Fix out-of-bounds write in cfFilterPDFToRaster()
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
+index f51c41f..075c206 100644
+--- a/cupsfilters/pdftoraster.cxx
++++ b/cupsfilters/pdftoraster.cxx
+@@ -1609,6 +1609,20 @@ out_page(pdftoraster_doc_t *doc,
+     doc->header.cupsPageSize[0] = l;
+   else
+     doc->header.cupsPageSize[1] = l;
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
+   {
+     doc->header.cupsImagingBBox[0] =
diff --git a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
index 9178829611..7c4eee95c4 100644
--- a/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
+++ b/meta-oe/recipes-printing/cups/libcupsfilters_2.0.0.bb
@@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aab2024bd2a475438a154cd1640c9684"
 
 DEPENDS = "cups fontconfig libexif dbus lcms qpdf poppler libpng jpeg tiff"
 
-SRC_URI = " \
-	https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
-	file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
-	file://0001-CVE-2024-47076.patch \
-	file://CVE-2025-57812.patch \
-"
+SRC_URI = "https://github.com/OpenPrinting/${BPN}/releases/download/${PV}/${BP}.tar.xz \
+           file://0001-use-noexcept-false-instead-of-throw-from-c-17-onward.patch \
+           file://0001-CVE-2024-47076.patch \
+           file://CVE-2025-57812.patch \
+           file://CVE-2025-64503.patch \
+           "
 SRC_URI[sha256sum] = "542f2bfbc58136a4743c11dc8c86cee03c9aca705612654e36ac34aa0d9aa601"
 
 inherit autotools gettext pkgconfig github-releases

