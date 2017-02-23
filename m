Return-Path: <amarnath.valluri@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 3BA7572F48
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2017 09:09:36 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Feb 2017 01:09:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="937176392"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2017 01:09:36 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2017 11:05:42 +0200
Message-Id: <1487840743-23198-9-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
References: <1487840743-23198-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 8/9] multipath-tools: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Thu, 23 Feb 2017 09:09:36 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
index effd92e..0cc53fb 100644
--- a/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
+++ b/meta-oe/recipes-support/multipath-tools/multipath-tools_git.bb
@@ -40,7 +40,7 @@ ARM_INSTRUCTION_SET_armv5 = "arm"
 EXTRA_OEMAKE = 'MULTIPATH_VERSION=${PV} DESTDIR=${D} syslibdir=${base_libdir} \
                 OPTFLAGS="${CFLAGS}" \
                 LIB=${base_libdir} libdir=${base_libdir}/multipath \
-                unitdir=/lib/systemd/system \
+                unitdir/=${systemd_system_unitdir} \
                 ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "SYSTEMD=216", "", d)} \
                '
 
@@ -59,11 +59,12 @@ FILES_${PN}-dbg += "${base_libdir}/multipath/.debug"
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


