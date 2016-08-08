Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC23771C8
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  8 Aug 2016 21:41:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u78LfaQN023855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 8 Aug 2016 14:41:36 -0700
Received: from fidler.wrs.com (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 8 Aug 2016 14:41:35 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 8 Aug 2016 17:41:34 -0400
Message-ID: <1470692494-32623-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] imagemagick: upgrade from 6.9.2 to 7.0.2
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
X-List-Received-Date: Mon, 08 Aug 2016 21:41:39 -0000
Content-Type: text/plain

The copyright end year update made the LICENSE file checksum change.
That line is in the middle of the file so the license checksum
has been updated rather than specifying two ranges of lines.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../imagemagick/{imagemagick_6.9.2.bb => imagemagick_7.0.2.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_6.9.2.bb => imagemagick_7.0.2.bb} (94%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
similarity index 94%
rename from meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
index a9f0134..a5a239c 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.9.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
@@ -1,18 +1,18 @@
 SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0887b670be7ef0c3cb37092b64d57514"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=22d47a47bf252ca3ed7f71273b53612e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "0"
+PATCHSET = "7"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "99471c8c3f38c9264faf5c4ca7a31287"
-SRC_URI[sha256sum] = "07a2de28f7f9ab888ef47c02eb7e10cc3e0dd0e9797c5d71d6e71d19f842399e"
+SRC_URI[md5sum] = "bd66b19bd6fc3d320bd8d51869c874f9"
+SRC_URI[sha256sum] = "1168f44cfcd1243acda6bb9663f5d9b3a4bca2acd372e979b97b58ecf5c713e2"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.7.4


