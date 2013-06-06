Return-Path: <cazfi74@gmail.com>
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by mail.openembedded.org (Postfix) with ESMTP id CF1676A60F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Jun 2013 07:07:34 +0000 (UTC)
Received: by mail-lb0-f175.google.com with SMTP id v10so2696446lbd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Jun 2013 00:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=Xygq9XdUFMTBXBEafltiHFaMWtZBOYIGUDggMYDVoqY=;
	b=ql/vuOUVFDAW+BL2iwTRNwjET+20RjscbphZ5eHoFe/G9Qn+LYNCFBGFaUlqlIhqff
	kqGNV+PqIVJNj3J2b3HCHng8DkuzntLQz+WnRiFbrTbCZx2Kl1KbKmNI08YTS5gBQ+MF
	CJKSKBBSc3ABY/AW4WElQ65vTrAl7tvhq6nbu9b+DrQJzRDo63ET6qA9DNSL9c2XnXFi
	O4FoQ542htVE/3o9S7aS4wd+QiIeWcjOpLeBzDmNI3If8aH8G/hUz06cXfv+x+ptx2q7
	IYWTnrALuMN2rl7GoErfxtu/EHtPRAk4tsyUWGDfTnbRQ3y2OM8FV6ewTiGPp3IlZq3A
	jU8w==
X-Received: by 10.152.87.227 with SMTP id bb3mr12428260lab.51.1370502455104;
	Thu, 06 Jun 2013 00:07:35 -0700 (PDT)
Received: from prime (a91-153-5-47.elisa-laajakaista.fi. [91.153.5.47])
	by mx.google.com with ESMTPSA id zo6sm28285244lbb.9.2013.06.06.00.07.33
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 06 Jun 2013 00:07:34 -0700 (PDT)
Received: from cazfi by prime with local (Exim 4.80)
	(envelope-from <cazfi74@gmail.com>)
	id 1UkUIE-0000U7-B7; Thu, 06 Jun 2013 10:07:30 +0300
From: Marko Lindqvist <cazfi74@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Jun 2013 10:07:24 +0300
Message-Id: <1370502445-22258-1-git-send-email-cazfi74@gmail.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [meta-oe][PATCH 1/2] imagemagick: update to upstream version 6.8.5-9
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
X-List-Received-Date: Thu, 06 Jun 2013 07:07:35 -0000

LICENSE: 2013 added to (c) years

PerlMagic_MakePatch.patch now part of upstream

Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
---
 .../imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch |   11 -----------
 .../remove.dist-lzip.patch                                  |    0
 .../{imagemagick_6.7.5.bb => imagemagick_6.8.5.bb}          |   11 ++++-------
 3 files changed, 4 insertions(+), 18 deletions(-)
 delete mode 100644 meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/PerlMagic_MakePatch.patch
 rename meta-oe/recipes-support/imagemagick/{imagemagick-6.7.5 => imagemagick-6.8.5}/remove.dist-lzip.patch (100%)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.7.5.bb => imagemagick_6.8.5.bb} (83%)

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
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch b/meta-oe/recipes-support/imagemagick/imagemagick-6.8.5/remove.dist-lzip.patch
similarity index 100%
rename from meta-oe/recipes-support/imagemagick/imagemagick-6.7.5/remove.dist-lzip.patch
rename to meta-oe/recipes-support/imagemagick/imagemagick-6.8.5/remove.dist-lzip.patch
diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
similarity index 83%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
index 2f0fad5..6cb3b4a 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.7.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.5.bb
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
+PATCHSET = "9"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
-           file://PerlMagic_MakePatch.patch \
            file://remove.dist-lzip.patch \
 "
-SRC_URI[md5sum] = "bcf07cf0822572fa2b47fa6d506f699a"
-SRC_URI[sha256sum] = "d9347f31d3d35b40009e1bbcf713c5ad252411e05ee621d5a7dae01e47bdbd80"
+SRC_URI[md5sum] = "27b3b24a1a86aedade11820f108289e5"
+SRC_URI[sha256sum] = "b88ac6551619837fc226c4c878ddc1f0adb106644cefbc88bb02abd55706b3fc"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.7.10.4


