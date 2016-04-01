Return-Path: <anujx.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B7F16FF04
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 08:00:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Apr 2016 01:00:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,426,1455004800"; d="scan'208";a="949440130"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2016 01:00:40 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 16:00:32 +0800
Message-Id: <1459497633-32109-2-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
References: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
Subject: [meta-filesystems][PATCH 1/2] fuse-exfat: update to version 1.2.3
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
X-List-Received-Date: Fri, 01 Apr 2016 08:00:41 -0000

Package now uses autotools instead of scons.

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 .../{fuse-exfat_1.1.0.bb => fuse-exfat_1.2.3.bb}           | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)
 rename meta-filesystems/recipes-filesystems/fuse-exfat/{fuse-exfat_1.1.0.bb => fuse-exfat_1.2.3.bb} (65%)

diff --git a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
similarity index 65%
rename from meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
rename to meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
index 6a83ab2..639e33c 100644
--- a/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.1.0.bb
+++ b/meta-filesystems/recipes-filesystems/fuse-exfat/fuse-exfat_1.2.3.bb
@@ -12,15 +12,9 @@ SRC_URI = "${DEBIAN_MIRROR}/main/f/fuse-exfat/fuse-exfat_${PV}.orig.tar.gz \
 DEPENDS = "fuse virtual/libc"
 RRECOMMENDS_${PN} = "util-linux-mount"
 
-inherit scons
+inherit autotools pkgconfig
 
-SRC_URI[md5sum] = "b2a23c032661cb1c1da4514e7af33916"
-SRC_URI[sha256sum] = "198c520e417e955dc5c08687c278e63eefa56719da4452aa4a605be0327f953e"
+SRC_URI[md5sum] = "fca71e6598f79d037a3c7c969cb5710c"
+SRC_URI[sha256sum] = "f2e06eba5a21c621aac1d6da21b12a5a324fdd1e20f9c8acd357dd463c2355d9"
 
-EXTRA_OESCONS = " \
-    CCFLAGS='${CCFLAGS} -std=c99' DESTDIR=${D}/${base_sbindir} \
-"
-
-do_install_prepend() {
-    install -d ${D}/${base_sbindir}
-}
+S = "${WORKDIR}/${PN}-${PV}"
-- 
1.9.1


