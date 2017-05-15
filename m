Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B9F1C72F56
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 15:14:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v4FFE765005517
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 May 2017 08:14:07 -0700
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 15 May 2017 08:14:06 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 15 May 2017 11:07:31 -0400
Message-ID: <1494860851-861-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] imagemagick: upgrade from 7.0.2 to 7.0.5
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
X-List-Received-Date: Mon, 15 May 2017 15:14:07 -0000
Content-Type: text/plain

LICENSE changes are due to copyright year increments and
a URL changing from http to https.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../imagemagick/{imagemagick_7.0.2.bb => imagemagick_7.0.5.bb}    | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/imagemagick/{imagemagick_7.0.2.bb => imagemagick_7.0.5.bb} (95%)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
similarity index 95%
rename from meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
rename to meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
index 960cb00..b8ee6e7 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_7.0.2.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_7.0.5.bb
@@ -1,18 +1,18 @@
 SUMMARY = "ImageMagick is an image convertion tools"
 SECTION = "console/utils"
 LICENSE = "ImageMagick"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=22d47a47bf252ca3ed7f71273b53612e"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=dad5a98f173fd3fa6958a1a58c6131c1"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib fftw freetype"
 
 # Important note: tarballs for all patchsets within a version are deleted when
 # a new pachset is created. To avoid multiple patches for each patchset, try to
 # update to the last pachset of a version
-PATCHSET = "10"
+PATCHSET = "6"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.xz \
 "
-SRC_URI[md5sum] = "e1cb23d9c10a8eff228ef30ee281711a"
-SRC_URI[sha256sum] = "dad306bfd7730e1665c6fdb6eb478fb2c41e2db71ab56451bbaebe9df546b1d2"
+SRC_URI[md5sum] = "dfaa2bd61f65d67ea8d5307ed6cd197f"
+SRC_URI[sha256sum] = "f60c3e3466ccbf9a0e643284ffec3467363edf9611f16a98387f927a974b49ab"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
2.7.4


