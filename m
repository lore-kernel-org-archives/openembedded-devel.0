Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 24B5577D6E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 15:28:22 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7OFSOLc001707
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Aug 2017 08:28:24 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 24 Aug 2017 08:28:23 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 24 Aug 2017 23:16:57 +0800
Message-ID: <20170824151657.20748-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] imagemagick: 7.0.5 -> 7.0.6_9
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Aug 2017 15:28:23 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Upgrade imagemagick from 7.0.5 patchset 6 to 7.0.9 patchset 9.

* update SRC_URI. Replace tarball with git repo that it only keeps
  latest tarball on www.imagemagick.org

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb} | 26 ++++++++--------------
 1 file changed, 9 insertions(+), 17 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.5.bb => imagemagick_7.0.6.bb} (78%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
similarity index 78%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
index b8ee6e7be..09b5fd295 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.6.bb
@@ -5,16 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
-# Important note: tarballs for all patchsets within a version are deleted when
-# a new pachset is created. To avoid multiple patches for each patchset, try to
-# update to the last pachset of a version
-PATCHSET = "6"
-SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
-"
-SRC_URI[md5sum] = "dfaa2bd61f65d67ea8d5307ed6cd197f"
-SRC_URI[sha256sum] = "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab"
+BASE_PV := "${PV}"
+PV .= "_9"
+SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
+SRCREV = "1fd8b52ac62d3a0bb47a407f0d7e3a41df5b91d6"
 
-S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
+S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-alternatives
 
@@ -33,16 +29,12 @@ PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
 PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
 
-FILES_${PN} += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.so \
-                ${libdir}/ImageMagick-${PV}/modules-Q16/*/*.la \
-                ${libdir}/ImageMagick-${PV}/modules-Q16/filters \
-                ${libdir}/ImageMagick-${PV}/modules-Q16/coders \
-                ${libdir}/ImageMagick-${PV}/config-Q16* \
-                ${datadir}/ImageMagick-7 "
+FILES_${PN} += "${libdir}/ImageMagick-${BASE_PV}/config-Q16* \
+                ${datadir}/ImageMagick-7"
 
-FILES_${PN}-dev += "${libdir}/ImageMagick-${PV}/modules-Q16/*/*.a"
+FILES_${PN}-dev += "${libdir}/ImageMagick-${BASE_PV}/modules-Q16/*/*.a"
 
-FILES_${PN}-dbg += "${libdir}/ImageMagick-${PV}/modules-Q16/*/.debug/*"
+FILES_${PN}-dbg += "${libdir}/ImageMagick-${BASE_PV}/modules-Q16/*/.debug/*"
 
 BBCLASSEXTEND = "native"
 
-- 
2.14.1


