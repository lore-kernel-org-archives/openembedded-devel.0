Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C92B77E467
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Jan 2020 16:42:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 005Ggx12011899
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Jan 2020 08:42:59 -0800 (PST)
Received: from fidler.wrs.com (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Sun, 5 Jan 2020 08:42:58 -0800
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Sun, 5 Jan 2020 11:42:56 -0500
Message-ID: <20200105164258.32759-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Subject: [PATCH 1/3] imagemagick: update from 7.8.47 to 7.9.16
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
X-List-Received-Date: Sun, 05 Jan 2020 16:42:59 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Only the copyright date for the LICENSE file changed.
Add PACKAGECONFIG to enable use of tcmalloc.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb}         | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.8.bb => imagemagick_7.0.9.bb} (95%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
similarity index 95%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
index 4ee06d77f..3f7d06e26 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.9.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=05ff94b3ff59fe6fa7489fa26e3d9142"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=41b4fa9af60c88e61484b02c0561181a"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "_47"
+PV .= "_13"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
-SRCREV = "b672df7a44b0ab0219b1fa78b3673c2810ddd374"
+SRCREV = "15b935d64f613b5a0fc9d3fead5c6ec1b0e3908f"
 
 S = "${WORKDIR}/git"
 
@@ -29,6 +29,7 @@ PACKAGECONFIG[lzma] = "--with-lzma,--without-lzma,xz"
 PACKAGECONFIG[openjpeg] = "--with-openjp2,--without-openjp2,openjpeg"
 PACKAGECONFIG[pango] = "--with-pango,--without-pango,pango cairo"
 PACKAGECONFIG[rsvg] = "--with-rsvg,--without-rsvg,librsvg"
+PACKAGECONFIG[tcmalloc] = "--with-tcmalloc=yes,--with-tcmalloc=no,gperftools"
 PACKAGECONFIG[webp] = "--with-webp,--without-webp,libwebp"
 PACKAGECONFIG[wmf] = "--with-wmf,--without-wmf,libwmf"
 PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 libxext libxt"
-- 
2.22.0


