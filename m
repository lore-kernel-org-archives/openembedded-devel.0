Return-Path: <anujx.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0A17F70030
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Apr 2016 08:00:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 01 Apr 2016 01:00:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,426,1455004800"; d="scan'208";a="949440154"
Received: from amitta2x-ilbpg1.png.intel.com ([10.88.227.34])
	by fmsmga002.fm.intel.com with ESMTP; 01 Apr 2016 01:00:43 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  1 Apr 2016 16:00:33 +0800
Message-Id: <1459497633-32109-3-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
References: <1459497633-32109-1-git-send-email-anujx.mittal@intel.com>
Subject: [meta-filesystems][PATCH 2/2] exfat-utils: update to version 1.2.3
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
X-List-Received-Date: Fri, 01 Apr 2016 08:00:43 -0000

*License file checksum has changed
*Package now uses autotools instead of scons

Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 .../{exfat-utils_1.0.1.bb => exfat-utils_1.2.3.bb}       | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)
 rename meta-filesystems/recipes-utils/exfat-utils/{exfat-utils_1.0.1.bb => exfat-utils_1.2.3.bb} (65%)

diff --git a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.bb b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
similarity index 65%
rename from meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.bb
rename to meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
index a5a314f..7991aa7 100644
--- a/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.0.1.bb
+++ b/meta-filesystems/recipes-utils/exfat-utils/exfat-utils_1.2.3.bb
@@ -10,20 +10,12 @@ contains \
 HOMEPAGE = "http://code.google.com/p/exfat/"
 SECTION = "universe/otherosfs"
 LICENSE = "GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 SRC_URI = "${DEBIAN_MIRROR}/main/e/exfat-utils/exfat-utils_${PV}.orig.tar.gz \
 "
 DEPENDS = "virtual/libc"
 
-inherit scons
+inherit pkgconfig autotools
 
-SRC_URI[md5sum] = "e592130829d0bf61fa5e3cd1c759d329"
-SRC_URI[sha256sum] = "eeacedca1878065dc3886674ae39cd51149c37bd7d6d7e9325c971a1d1acdab3"
-
-EXTRA_OESCONS = " \
-    DESTDIR=${D}/${base_sbindir} \
-"
-
-do_install_prepend() {
-    install -d ${D}/${base_sbindir}
-}
+SRC_URI[md5sum] = "f4e564450aa8159e26dde2869563d242"
+SRC_URI[sha256sum] = "80d3b3f21242d60d36a38a4ddb05cb7cc3a7d4eef5793e8314814937b938fcea"
-- 
1.9.1


