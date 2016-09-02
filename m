Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6C8EA76FF6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Sep 2016 03:35:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u823ZKFT025361
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 1 Sep 2016 20:35:21 -0700
Received: from yow-rmacleod-lx3.wrs.com (128.224.56.85) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 1 Sep 2016 20:35:20 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 1 Sep 2016 23:32:33 -0400
Message-ID: <1472787153-32131-1-git-send-email-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [meta-oe] openjpeg: uprev from 2.1.0 to 2.1.1
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
X-List-Received-Date: Fri, 02 Sep 2016 03:35:21 -0000
Content-Type: text/plain

As the package maintainer said, this is mostly a release with:
"the huge amount of critical bug fixes brought to the library since 2 years"
The full list of bugs fixed and other changes is here:
   https://github.com/uclouvain/openjpeg/blob/openjpeg-2.1/CHANGELOG.md

The homepage link was broken so that was fixed.

The project also moved to github and does not appear
to provide tarballs other than via github archives so
the SRC_URI was updated.

An explicit dependency on zlib was added even though cmake was finding
the sysroot version.

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 .../openjpeg/{openjpeg_2.1.0.bb => openjpeg_2.1.1.bb}          | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/openjpeg/{openjpeg_2.1.0.bb => openjpeg_2.1.1.bb} (55%)

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
similarity index 55%
rename from meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
rename to meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
index d28a865..d767adc 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.1.1.bb
@@ -1,16 +1,16 @@
 DESCRIPTION = "OpenJPEG library is an open-source JPEG 2000 codec"
-HOMEPAGE = "http://www.openjpeg.org/index.php?menu=main"
+HOMEPAGE = "http://www.openjpeg.org"
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c648878b4840d7babaade1303e7f108c"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/project/${BPN}.mirror/${PV}/${BPN}-${PV}.tar.gz"
-SRC_URI[md5sum] = "f6419fcc233df84f9a81eb36633c6db6"
-SRC_URI[sha256sum] = "1232bb814fd88d8ed314c94f0bfebb03de8559583a33abbe8c64ef3fc0a8ff03"
+SRC_URI = "https://github.com/uclouvain/${BPN}/archive/v${PV}.tar.gz"
+SRC_URI[md5sum] = "0cc4b2aee0a9b6e9e21b7abcd201a3ec"
+SRC_URI[sha256sum] = "82c27f47fc7219e2ed5537ac69545bf15ed8c6ba8e6e1e529f89f7356506dbaa"
 
 inherit cmake
 
-DEPENDS = "libpng tiff lcms"
+DEPENDS = "libpng tiff lcms zlib"
 
 # standard path for *.cmake
 EXTRA_OECMAKE += "-DOPENJPEG_INSTALL_PACKAGE_DIR=${baselib}/cmake \
-- 
1.9.1


