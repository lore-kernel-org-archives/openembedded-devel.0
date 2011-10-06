Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gavinswanson@gmail.com>) id 1RBx2G-0003HB-1i
	for openembedded-devel@lists.openembedded.org;
	Fri, 07 Oct 2011 01:07:28 +0200
Received: by yxj17 with SMTP id 17so3164206yxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Oct 2011 16:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kUj5TLiVc4T233BWVToqYNDwg751mYdiSIhH4CBHrSk=;
	b=j9vpTdpiVg8j3I7iG4BIQM5Uyx/aL7qEbzIEhApDVRAADJ2xdxD9aro/0Rw4UBaefg
	AOhbY8cIO00EtAo85KPPHdTGLDFeblDFTlRiKMNTB3QZ0LYLP7zSCNthcTAvPgm2UKdK
	3qL4HRGdz7pBsfkrfsC2BF/51pRifiiDAeI00=
Received: by 10.68.72.73 with SMTP id b9mr2763599pbv.100.1317942110892;
	Thu, 06 Oct 2011 16:01:50 -0700 (PDT)
Received: from localhost.localdomain (53.sub-75-210-17.myvzw.com.
	[75.210.17.53])
	by mx.google.com with ESMTPS id ki1sm24183468pbb.3.2011.10.06.16.01.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Oct 2011 16:01:49 -0700 (PDT)
From: gavinswanson@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Thu,  6 Oct 2011 16:01:36 -0700
Message-Id: <1317942096-32057-1-git-send-email-gavinswanson@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] Added ImageMagick 6.7.2-3
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
X-List-Received-Date: Thu, 06 Oct 2011 23:07:28 -0000

From: Gavin Swanson <gavinswanson@gmail.com>

---
 recipes/imagemagick/imagemagick_6.7.2-3.bb |   36 ++++++++++++++++++++++++++++
 1 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 recipes/imagemagick/imagemagick_6.7.2-3.bb

diff --git a/recipes/imagemagick/imagemagick_6.7.2-3.bb b/recipes/imagemagick/imagemagick_6.7.2-3.bb
new file mode 100644
index 0000000..14746c9
--- /dev/null
+++ b/recipes/imagemagick/imagemagick_6.7.2-3.bb
@@ -0,0 +1,36 @@
+DESCRIPTION = "ImageMagick is an image convertion tools"
+SECTION = "console/utils"
+LICENSE = "GPL"
+# FIXME: There is much more checked libraries. All should be added or explicitly disabled to get consistent results.
+DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib"
+
+PR = "r1"
+
+SRC_URI = "ftp://ftp.nluug.nl/pub/ImageMagick/ImageMagick-${PV}.tar.bz2 \
+#           file://PerlMagic_MakePatch;apply=yes \
+          "
+
+IMVER = "6.7.2-3"
+
+S = "${WORKDIR}/ImageMagick-${IMVER}"
+
+inherit autotools binconfig pkgconfig
+
+EXTRA_OECONF = "--program-prefix= --without-x --without-freetype --without-perl --disable-openmp"
+
+FILES_${PN} += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.so \
+                ${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.la \
+                ${libdir}/ImageMagick-${IMVER}/config/ \
+                ${datadir}/ImageMagick-${IMVER}"
+
+FILES_${PN}-dev += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/*.a"
+
+FILES_${PN}-dbg += "${libdir}/ImageMagick-${IMVER}/modules-Q16/*/.debug/*"
+
+BBCLASSEXTEND = "native"
+
+LEAD_SONAME = "libMagickCore.so.*"
+
+
+SRC_URI[md5sum] = "62e12090d2d385f4800c06f58f477bea"
+SRC_URI[sha256sum] = "50fe6e1af9e900e5d4bef45879a3a7e15512bb9ab3dbbafb521825359cb6d2c7"
-- 
1.7.1



