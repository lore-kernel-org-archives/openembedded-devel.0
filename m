Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 733307D1EF
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  2 Apr 2019 01:31:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x321UfBF014421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 1 Apr 2019 18:30:52 -0700
Received: from fidler.wrs.com (172.25.44.10) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.439.0;
	Mon, 1 Apr 2019 18:30:31 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 1 Apr 2019 21:30:29 -0400
Message-ID: <20190402013029.17575-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Subject: [meta-oe][PATCH] imagemagic: upgrade to 7.0.8-35
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
X-List-Received-Date: Tue, 02 Apr 2019 01:31:01 -0000
Content-Type: text/plain

The LICENSE file checksum updated due to two trivial changes:
  - Copyright year updates
  - the URL for a web version of the license terms moved.

Add libtool dependencies to avoid:
   configure: error: libltdl is required for modules and OpenCL builds

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../{imagemagick_7.0.7.bb => imagemagick_7.0.8.bb}        | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.7.bb => imagemagick_7.0.8.bb} (95%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
similarity index 95%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
index 37d5a637a..52b291d6e 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.7.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.8.bb
@@ -4,14 +4,14 @@ HOMEPAGE = "https://www.imagemagick.org/"
 DESCRIPTION = "ImageMagick is a collection of tools for displaying, converting, and \
 editing raster and vector image files. It can read and write over 200 image file formats."
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=05ff94b3ff59fe6fa7489fa26e3d9142"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
-DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype"
+DEPENDS = "lcms bzip2 jpeg libpng tiff zlib fftw freetype libtool"
 
 BASE_PV := "${PV}"
-PV .= "_7"
+PV .= "_35"
 SRC_URI = "git://github.com/ImageMagick/ImageMagick.git "
-SRCREV = "e12602b39b5e778240d286b6f9bbbc0fe3fb26c5"
+SRCREV = "224159dfcc0ae3da9a247921e3c8bfb44d39965e"
 
 S = "${WORKDIR}/git"
 
-- 
2.17.0


