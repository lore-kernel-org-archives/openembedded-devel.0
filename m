Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1Nuit2-0001aT-WB
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 09:58:11 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id BF6FEA2C3CD;
	Thu, 25 Mar 2010 09:54:48 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id UDj1nS2nXrTF; Thu, 25 Mar 2010 09:54:47 +0100 (CET)
Received: from localhost.localdomain (pD9E15DD9.dip.t-dialin.net
	[217.225.93.217])
	by hsp-52.hspserver.com (Postfix) with ESMTP id AB232A2C3BD;
	Thu, 25 Mar 2010 09:54:47 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 25 Mar 2010 09:54:32 +0100
Message-Id: <1269507272-19036-1-git-send-email-ml@vdm-design.de>
X-Mailer: git-send-email 1.7.0.3
In-Reply-To: <b6ebd0a51003240909t642135dfy5b2667f6dac0a8c5@mail.gmail.com>
References: <b6ebd0a51003240909t642135dfy5b2667f6dac0a8c5@mail.gmail.com>
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] imagemagick: convert to BBCLASSEXTEND and new staging
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Mar 2010 08:58:12 -0000

* now imagemagick is buildable again with autoconf > 2.63
* tiff-native now exists, so no need to override DEPENDS of -native anymore

Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
---
 recipes/imagemagick/imagemagick-native_6.3.5-10.bb |    6 ------
 recipes/imagemagick/imagemagick_6.3.5-10.bb        |   10 ++++------
 recipes/imagemagick/imagemagick_6.4.4-1.bb         |   10 ++++------
 3 files changed, 8 insertions(+), 18 deletions(-)
 delete mode 100644 recipes/imagemagick/imagemagick-native_6.3.5-10.bb

diff --git a/recipes/imagemagick/imagemagick-native_6.3.5-10.bb b/recipes/imagemagick/imagemagick-native_6.3.5-10.bb
deleted file mode 100644
index d2efd36..0000000
--- a/recipes/imagemagick/imagemagick-native_6.3.5-10.bb
+++ /dev/null
@@ -1,6 +0,0 @@
-require imagemagick_${PV}.bb
-DEPENDS ="libtool-native"
-# FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
-# tiff-native does not exist
-DEPENDS += "bzip2-native jpeg-native libpng-native librsvg-native zlib-native"
-inherit native
diff --git a/recipes/imagemagick/imagemagick_6.3.5-10.bb b/recipes/imagemagick/imagemagick_6.3.5-10.bb
index b399741..58f3b23 100644
--- a/recipes/imagemagick/imagemagick_6.3.5-10.bb
+++ b/recipes/imagemagick/imagemagick_6.3.5-10.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "GPL"
 DEPENDS = "tiff jpeg libpng librsvg tiff zlib"
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
            file://PerlMagic_MakePatch;patch=1 \
@@ -14,16 +14,12 @@ IMVER = "6.3.5"
 
 S = "${WORKDIR}/ImageMagick-${IMVER}"
 
-inherit autotools binconfig pkgconfig
+inherit autotools_stage binconfig pkgconfig
 
 EXTRA_AUTORECONF += "--exclude=libtoolize"
 EXTRA_OECONF = "--without-x --without-freetype --without-perl"
 EXTRA_OECONF_openprotium = "--without-x --without-freetype --without-xml --without-perl"
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
                 ${libdir}/ImageMagick-${IMVER}/config/ \
@@ -33,5 +29,7 @@ FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
 
 FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
 
+BBCLASSEXTEND = "native"
+
 LEAD_SONAME = "libMagick.so.*"
 
diff --git a/recipes/imagemagick/imagemagick_6.4.4-1.bb b/recipes/imagemagick/imagemagick_6.4.4-1.bb
index bc16b0c..1b17664 100644
--- a/recipes/imagemagick/imagemagick_6.4.4-1.bb
+++ b/recipes/imagemagick/imagemagick_6.4.4-1.bb
@@ -4,7 +4,7 @@ LICENSE = "GPL"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
            file://PerlMagic_MakePatch;patch=1 \
@@ -14,15 +14,11 @@ IMVER = "6.4.4"
 
 S = "${WORKDIR}/ImageMagick-${IMVER}"
 
-inherit autotools binconfig pkgconfig
+inherit autotools_stage binconfig pkgconfig
 
 EXTRA_AUTORECONF += "--exclude=libtoolize"
 EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
 
-do_stage() {
-	autotools_stage_all
-}
-
 FILES_${PN} += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
                 ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
                 ${libdir}/ImageMagick-${IMVER}/config/ \
@@ -32,5 +28,7 @@ FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
 
 FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
 
+BBCLASSEXTEND = "native"
+
 LEAD_SONAME = "libMagickCore.so.*"
 
-- 
1.7.0.3



