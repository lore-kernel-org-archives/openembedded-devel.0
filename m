Received: from mailout-de.gmx.net ([213.165.64.22])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1RLOFq-0002YJ-1B
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Nov 2011 01:00:30 +0100
Received: (qmail invoked by alias); 01 Nov 2011 23:54:22 -0000
Received: from p5B0A3AE4.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.58.228]
	by mail.gmx.net (mp006) with SMTP; 02 Nov 2011 00:54:22 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1+xj2Us5Sixr1wJ+59Gl6V/DQj9iQlsKfxRRLFby0
	nmIQMeHGPQD5Bq
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  2 Nov 2011 00:58:52 +0100
Message-Id: <1320191933-28392-2-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1320191933-28392-1-git-send-email-schnitzeltony@gmx.de>
References: <1320191933-28392-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-oe][V2 1/2] imagemagick: fix QA warnings for unshipped files
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
X-List-Received-Date: Wed, 02 Nov 2011 00:00:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

on build we receive tons of warnings like

WARNING: For recipe imagemagick, the following files were installed but not shipped in any package:
WARNING:   /usr/lib/ImageMagick-6.4.4/config/type.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/type-solaris.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/locale.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/english.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/type-windows.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/type-ghostscript.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/delegates.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/configure.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/config/francais.xml
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/filters/analyze.a
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/filters/analyze.la
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/filters/analyze.so
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/filters/.debug/analyze.so
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/coders/histogram.la
WARNING:   /usr/lib/ImageMagick-6.4.4/modules-Q16/coders/ycbcr.a
...

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../imagemagick/imagemagick_6.4.4.bb               |   14 +++++++-------
 1 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
index c38c644..dd84cb2 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.4.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e1ebcc1358b9f81eba64255fc5da6892"
 # FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
 
-PR = "r8"
+PR = "r9"
 
 PATCHSET = "1"
 SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
@@ -20,14 +20,14 @@ inherit autotools binconfig pkgconfig
 
 EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
 
-FILES_${PN} += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
-                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
-                ${libdir}/ImageMagick-${IMVER}/config/ \
-                ${datadir}/ImageMagick-${IMVER}"
+FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
+                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
+                ${libdir}/ImageMagick-${PV}/config/ \
+                ${datadir}/ImageMagick-${PV}"
 
-FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
+FILES_${PN}-dev += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
 
-FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
+FILES_${PN}-dbg += "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*"
 
 BBCLASSEXTEND = "native"
 
-- 
1.7.4.4



