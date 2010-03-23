Received: from hsp-52.hspserver.com ([85.197.80.179])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ml@vdm-design.de>) id 1NuCjA-0001Lc-LZ
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 23:37:37 +0100
Received: from localhost (localhost [127.0.0.1])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 332DEA2C3B9;
	Tue, 23 Mar 2010 23:34:30 +0100 (CET)
Received: from hsp-52.hspserver.com ([127.0.0.1])
	by localhost (hsp-52.hspserver.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SLxrbCUiE-Os; Tue, 23 Mar 2010 23:34:28 +0100 (CET)
Received: from localhost.localdomain (pD9E15154.dip.t-dialin.net
	[217.225.81.84])
	by hsp-52.hspserver.com (Postfix) with ESMTP id 0F0D1A2C3B7;
	Tue, 23 Mar 2010 23:34:28 +0100 (CET)
From: Thomas Zimmermann <ml@vdm-design.de>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Mar 2010 23:34:18 +0100
Message-Id: <1269383658-27562-1-git-send-email-ml@vdm-design.de>
X-Mailer: git-send-email 1.7.0.3
X-SA-Exim-Connect-IP: 85.197.80.179
X-SA-Exim-Mail-From: ml@vdm-design.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=AWL,BAYES_00,
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
X-List-Received-Date: Tue, 23 Mar 2010 22:37:37 -0000

* imagemagick-6.3.5-10 doesn't configure with autoconf > 2.63
* problem: without removing imagemagick-native_6.3.5-10 the old version is build

Signed-off-by: Thomas Zimmermann <ml@vdm-design.de>
---
 recipes/imagemagick/imagemagick_6.4.4-1.bb |   11 +++++------
 1 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/recipes/imagemagick/imagemagick_6.4.4-1.bb b/recipes/imagemagick/imagemagick_6.4.4-1.bb
index bc16b0c..b02ce26 100644
--- a/recipes/imagemagick/imagemagick_6.4.4-1.bb
+++ b/recipes/imagemagick/imagemagick_6.4.4-1.bb
@@ -3,8 +3,9 @@ SECTION = "console/utils"
 LICENSE = "GPL"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "bzip2 jpeg libpng librsvg tiff zlib"
+DEPENDS_virtclass-native = "libtool-native bzip2-native jpeg-native libpng-native librsvg-native zlib-native"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
            file://PerlMagic_MakePatch;patch=1 \
@@ -14,15 +15,11 @@ IMVER = "6.4.4"
 
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
@@ -32,5 +29,7 @@ FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
 
 FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
 
+BBCLASSEXTEND = "native"
+
 LEAD_SONAME = "libMagickCore.so.*"
 
-- 
1.7.0.3



