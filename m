Return-Path: <amarnath.valluri@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E399A71B0B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Feb 2017 13:06:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 08 Feb 2017 05:06:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="1123740414"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by fmsmga002.fm.intel.com with ESMTP; 08 Feb 2017 05:06:52 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 15:07:39 +0200
Message-Id: <1486559259-22981-1-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe] lvm2: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Wed, 08 Feb 2017 13:06:54 -0000

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 7bd26c0..bd20390 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -37,7 +37,7 @@ EXTRA_OECONF = "--with-user= \
                 --enable-pkgconfig \
                 --enable-dmeventd \
                 --enable-lvmetad \
-                --with-udev-prefix= \
+                --with-udevidir=${nonarch_base_libdir}/udev/rules.d \
                 --with-usrlibdir=${libdir} \
                 --with-systemdsystemunitdir=${systemd_system_unitdir} \
                 --disable-thin_check_needs_check \
@@ -70,7 +70,7 @@ SYSTEMD_AUTO_ENABLE = "disable"
 
 TARGET_CC_ARCH += "${LDFLAGS}"
 
-FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
+FILES_${PN} += "${libdir}/device-mapper/*.so ${nonarch_base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
 RDEPENDS_${PN} = "bash"
-- 
2.7.4


