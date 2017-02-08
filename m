Return-Path: <amarnath.valluri@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4684871B0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:06:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 05:06:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="222792747"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga004.fm.intel.com with ESMTP; 08 Feb 2017 05:06:36 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:24 +0200
Message-Id: <1486559244-22936-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:06:37 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index 6bd6118..ea191a0 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -46,7 +46,7 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 OPTFLAGS="${CFLAGS}" \
                 LIB=${base_libdir} libdir=${base_libdir}/multipath \
-                unitdir=/lib/systemd/system \
+                unitdir/=${systemd_system_unitdir} \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
                '
 
@@ -68,11 +68,12 @@ FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
 # systemd and udev stuff always goes under /lib!
 #
 FILES_${PN} += "${base_libdir}/multipath \
-                /lib/systemd"
+                ${systemd_system_unitdir} \
+		"
 
 PACKAGES =+ "kpartx"
 FILES_kpartx = "${base_sbindir}/kpartx \
-                /usr/lib/udev/kpartx_id \
+                ${nonarch_libdir}/udev/kpartx_id \
                "
 
 RDEPENDS_${PN} += "kpartx"
-- 
2.7.4


