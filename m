Return-Path: <cazfi74@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3E2A561F47
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2013 06:46:51 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id eh20so1524934lab.5
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Aug 2013 23:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=U7Pi4L8mJdXQtYDU3A9n8oX3sVOGdU0gy8TAtbI24yo=;
	b=HOJFQyJQH5cwHOrMcbauncfSJok22etoA8Dcomj3xmUK1//tdQB64O9pPalcWm/zeo
	as72mdTbTWjlX/FOaI3XWsr6E2It1dqtIYTv9z4o/QKJ3AQ21eKYM/lKcksCVySsQppR
	gVI3l9JxBg+3oUOo+BdG3b+vnIKMnRaA0NVANH74xwEDmHE9fs0s01huTx+nIsADCgW7
	Tn0bmzDEB/2oj9g1m78YL9oFle6wFAUCOlbJFySHqEsms/dBCGMH02Wk/++FjVu3uCML
	vwQmZ479tSxFCHeoAg4QfRQzgtlnaZp6NvuQEEgaXDFh9gnko+7HC3bBQBaSmo6ruBOf
	aHBA==
X-Received: by 10.112.28.109 with SMTP id a13mr6929321lbh.3.1377413210081;
	Sat, 24 Aug 2013 23:46:50 -0700 (PDT)
Received: from prime (a91-153-14-158.elisa-laajakaista.fi. [91.153.14.158])
	by mx.google.com with ESMTPSA id ay4sm2902572lbb.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sat, 24 Aug 2013 23:46:49 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1VDU63-0007TL-DF; Sun, 25 Aug 2013 09:46:47 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Aug 2013 09:46:46 +0300
Message-Id: <1377413206-28690-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH v2] ImageMagick: update to upstream version 6.8.6-8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Aug 2013 06:46:51 -0000

- License changed by additional copyright year only.
- Patch PerlMagic_MakePatch.patch part of upstream now

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../imagemagick-6.7.5/PerlMagic_MakePatch.patch         |   11 -----------
 .../remove.dist-lzip.patch                              |    0
 .../{imagemagick_6.7.5.bb => imagemagick_6.8.6.bb}      |   15 ++++++---------
 3 files changed, 6 insertions(+), 20 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.7.5 => imagemagick-6.8.6}/remove.dist-lzip.patch (100%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.7.5.bb => imagemagick_6.8.6.bb} (77%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
deleted file mode 100644
index f8ad0af..0000000
--- a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- /tmp/Makefile.PL.in	2008-10-01 10:39:38.000000000 +0200
-+++ ImageMagick-6.4.4/PerlMagick/Makefile.PL.in	2008-10-01 10:40:25.000000000 +0200
-@@ -87,6 +87,8 @@
- 
-    # Use same compiler as ImageMagick
-    'PERLMAINCC'	=> '@PERLMAINCC@ @OPENMP_CFLAGS@',
-+   'AR' => '@AR@',
-+   'LD' => '@PERLMAINCC@',
- 
-    # Set Perl installation prefix to ImageMagick installation prefix
- #   'PREFIX'	=> '@prefix@',
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/remove.dist-lzip.patch
similarity index 100%
rename from meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
rename to meta-oe/recipes-support/imagemagick/imagemagick-6.8.6/remove.dist-lzip.patch
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
similarity index 77%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
index 2f0fad5..1af1f0b 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.6.bb
@@ -1,19 +1,16 @@
 DESCRIPTION = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=944f66dcedc98d5a4e5d964bd3b32e7b"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b1bf06a8d02cb00b02dea7d03ef9525f"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw"
 
-PR = "r5"
-
-PATCHSET = "6"
+PATCHSET = "8"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
-           file://PerlMagic_MakePatch.patch \
            file://remove.dist-lzip.patch \
 "
-SRC_URI[md5sum] = "bcf07cf0822572fa2b47fa6d506f699a"
-SRC_URI[sha256sum] = "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5a7dae01e47bdbd80"
+SRC_URI[md5sum] = "ea66fbb6fc1354312bc4971c0a0cfb3c"
+SRC_URI[sha256sum] = "eb33e0ba6aeb542b7127ee1c2f62961236428b233e9911aa86e1b66b3342ea1d"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
@@ -27,8 +24,8 @@ FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/filters \
                 ${libdir}/ImageMagick-${PV}/modules-Q16/coders \
-                ${libdir}/ImageMagick-${PV}/config/ \
-                ${datadir}/ImageMagick-${PV}"
+                ${libdir}/ImageMagick-${PV}/config-Q16 \
+                ${datadir}/ImageMagick-6 "
 
 FILES_${PN}-dev += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
 
-- 
1.7.10.4


