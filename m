Return-Path: <pascal.bach@siemens.com>
Received: from goliath.siemens.de (goliath.siemens.de [192.35.17.28])
	by mail.openembedded.org (Postfix) with ESMTP id A215A71975
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Oct 2017 11:59:43 +0000 (UTC)
Received: from mail3.siemens.de (mail3.siemens.de [139.25.208.14])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id v94BxhTo021532
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 4 Oct 2017 13:59:43 +0200
Received: from dev.sbt.siemens.com (MD1FZU9C.ad001.siemens.net [139.16.76.113])
	by mail3.siemens.de (8.15.2/8.15.2) with ESMTP id v94Bxhbb003376;
	Wed, 4 Oct 2017 13:59:43 +0200
From: Pascal Bach <pascal.bach@siemens.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  4 Oct 2017 13:59:38 +0200
Message-Id: <1507118378-21985-1-git-send-email-pascal.bach@siemens.com>
X-Mailer: git-send-email 2.1.4
Subject: [meta-mono][PATCHv3] libgdiplus: use tarball from mono project instead of github
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
X-List-Received-Date: Wed, 04 Oct 2017 11:59:44 -0000

Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
---
 recipes-mono/libgdiplus/libgdiplus-native_4.2.bb |  7 +++----
 recipes-mono/libgdiplus/libgdiplus_4.2.bb        | 10 +++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
index 4dee6a0..cbd8e5d 100644
--- a/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
+++ b/recipes-mono/libgdiplus/libgdiplus-native_4.2.bb
@@ -6,15 +6,14 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fe7364dfce9f3689eb6995e7cdd56879"
 
-SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
-	"
+SRC_URI = "https://download.mono-project.com/sources/libgdiplus/libgdiplus-${PV}.tar.gz"
 
 inherit autotools pkgconfig native
 
 DEPENDS =+ "cairo-native freetype-native fontconfig-native libxft-native libpng-native pango-native giflib-native"
 
-SRC_URI[md5sum] = "925709982aba701c567850617e2206b1"
-SRC_URI[sha256sum] = "98f8a8e58ed22e136c4ac6eaafbc860757f5a97901ecc0ea357e2b6e4cfa2be5"
+SRC_URI[md5sum] = "3e68075aa0911d5ebc2b3739e85af0ea"
+SRC_URI[sha256sum] = "f332b9b8b44fd1c50b8d8d01a7296360b806c790b8297614739b3de1edbadfeb"
 
 FILES_${PN} += "${libdir}/libgdiplus.so"
 INSANE_SKIP_${PN} += "dev-so"
diff --git a/recipes-mono/libgdiplus/libgdiplus_4.2.bb b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
index 00eb406..644af74 100644
--- a/recipes-mono/libgdiplus/libgdiplus_4.2.bb
+++ b/recipes-mono/libgdiplus/libgdiplus_4.2.bb
@@ -12,16 +12,16 @@ PACKAGECONFIG[tiff] = "--with-libtiff,--without-libtiff,tiff"
 PACKAGECONFIG[gif] = "--with-libgif,--without-libgif,giflib"
 PACKAGECONFIG[exif] = "--with-libexif,--without-libexif,libexif"
 
-SRC_URI = "https://github.com/mono/libgdiplus/archive/${PV}.tar.gz \
-	   file://01-remove-libjpeg-path.patch \
-	"
+SRC_URI = "https://download.mono-project.com/sources/libgdiplus/libgdiplus-${PV}.tar.gz \
+           file://01-remove-libjpeg-path.patch \
+          "
 
 inherit autotools pkgconfig
 
 DEPENDS =+ "cairo freetype fontconfig libxft libpng"
 
-SRC_URI[md5sum] = "925709982aba701c567850617e2206b1"
-SRC_URI[sha256sum] = "98f8a8e58ed22e136c4ac6eaafbc860757f5a97901ecc0ea357e2b6e4cfa2be5"
+SRC_URI[md5sum] = "3e68075aa0911d5ebc2b3739e85af0ea"
+SRC_URI[sha256sum] = "f332b9b8b44fd1c50b8d8d01a7296360b806c790b8297614739b3de1edbadfeb"
 
 FILES_${PN} += "${libdir}/libgdiplus.so"
 INSANE_SKIP_${PN} += "dev-so"
-- 
2.1.4


