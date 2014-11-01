Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-04.prod.phx3.secureserver.net
	(p3plsmtpa08-04.prod.phx3.secureserver.net [173.201.193.105])
	by mail.openembedded.org (Postfix) with ESMTP id 3B0A970A84
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Nov 2014 21:27:34 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa08-04.prod.phx3.secureserver.net with 
	id AMTX1p00H0BVjqb01MTaeY; Sat, 01 Nov 2014 14:27:35 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Nov 2014 16:27:24 -0500
Message-Id: <1414877244-21452-2-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1414877244-21452-1-git-send-email-pab@pabigot.com>
References: <1414877244-21452-1-git-send-email-pab@pabigot.com>
Subject: [meta-oe][PATCH 2/2] imagemagick: update 6.8.9 to patchset 9
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
X-List-Received-Date: Sat, 01 Nov 2014 21:27:37 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
index 7cb8f01..1252020 100644
--- a/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
+++ b/meta-oe/recipes-support/imagemagick/imagemagick_6.8.9.bb
@@ -5,11 +5,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d84c6ddd4028aa53d028b4c50f9361e"
 # FIXME: There are many more checked libraries. All should be added or explicitly disabled to get consistent results.
 DEPENDS = "lcms bzip2 jpeg libpng librsvg tiff zlib virtual/fftw freetype"
 
-PATCHSET = "8"
+PATCHSET = "9"
 SRC_URI = "http://www.imagemagick.org/download/releases/ImageMagick-${PV}-${PATCHSET}.tar.bz2 \
 "
-SRC_URI[md5sum] = "7e96f55156d72ce59c76ec93362ec72a"
-SRC_URI[sha256sum] = "51e0eb0b56e2f16be11c29086a97d474ffd07fe4eb5a9858d8a9c8e9c054c99a"
+SRC_URI[md5sum] = "971648be6ae5f5070d98e2b6c5fb004d"
+SRC_URI[sha256sum] = "ea0c4f00019b58b290b1329e4e747972c61a00780a67b35df9228a76f26f1592"
 
 S = "${WORKDIR}/ImageMagick-${PV}-${PATCHSET}"
 
-- 
1.8.5.5


