Return-Path: <cristian.iorga@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 317256F8F0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Mar 2014 12:51:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Mar 2014 05:51:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,678,1389772800"; d="scan'208";a="501143879"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by fmsmga002.fm.intel.com with ESMTP; 18 Mar 2014 05:50:47 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 18 Mar 2014 14:53:54 +0200
Message-Id: <1395147234-12610-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
Cc: Cristian Iorga <ubik3000@gmail.com>
Subject: [meta-multimedia][PATCH] mpg123: upgrade to 1.19.0
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
X-List-Received-Date: Tue, 18 Mar 2014 12:51:15 -0000

From: Cristian Iorga <ubik3000@gmail.com>

- switched to ${BP} variable;
- ${S} redundant, removed;
- option with-module-suffix=.so: load modules with .so extension;
- .la files are kept only for dev packages;
- clearer COPYING file, about contribution and licenses;
  no changes to licenses.

Signed-off-by: Cristian Iorga <ubik3000@gmail.com>
Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../mpg123/{mpg123_1.15.3.bb => mpg123_1.19.0.bb}            | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)
 rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.15.3.bb => mpg123_1.19.0.bb} (79%)

diff --git a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
similarity index 79%
rename from meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
rename to meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
index 0075427..dd5c3a4 100644
--- a/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.15.3.bb
+++ b/meta-multimedia/recipes-multimedia/mpg123/mpg123_1.19.0.bb
@@ -16,19 +16,17 @@ PACKAGECONFIG[alsa] = "--with-default-audio=alsa,,alsa-lib"
 
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
-LIC_FILES_CHKSUM = "file://COPYING;md5=a7aa23a2b646eca38ad4eeb7a853761c"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e86753638d3cf2512528b99079bc4f3"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/mpg123-${PV}.tar.bz2"
-
-SRC_URI[md5sum] = "f734f9e2982f398a1c919475fc0b3798"
-SRC_URI[sha256sum] = "b6b1aef887835f83ac3d4acb5701ae619041fc60d76548ad779a409080338df7" 
-
-S = "${WORKDIR}/mpg123-${PV}"
+SRC_URI = "${SOURCEFORGE_MIRROR}/mpg123/mpg123/${PV}/${BP}.tar.bz2"
+SRC_URI[md5sum] = "87731f1437cfd8c50537a606d81130e4"
+SRC_URI[sha256sum] = "869024e01d7cb4dae1aea2f2a10420d4be7e1ac02a9c434d06d727599169b01b"
 
 inherit autotools pkgconfig
 
 EXTRA_OECONF = " \
     --enable-shared \
+    --with-module-suffix=.so \
     ${@bb.utils.contains('TUNE_FEATURES', 'neon', '--with-cpu=neon', '', d)} \
     ${@bb.utils.contains('TUNE_FEATURES', 'altivec', '--with-cpu=altivec', '', d)} \
 "
-- 
1.8.3.2


