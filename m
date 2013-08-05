Return-Path: <mihai.prica@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 60CB261223
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 Aug 2013 12:04:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Aug 2013 05:01:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,818,1367996400"; d="scan'208";a="382058706"
Received: from mihai-vostro-460.rb.intel.com ([10.237.105.61])
	by orsmga002.jf.intel.com with ESMTP; 05 Aug 2013 05:03:53 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  5 Aug 2013 15:03:55 +0300
Message-Id: <1375704235-21329-1-git-send-email-mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [meta-oe][PATCH v3] lvm2: Add runtime dependency on bash
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
X-List-Received-Date: Mon, 05 Aug 2013 12:04:02 -0000

Fixes rootfs generation error if bash is not included in the image.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 1f3b62e..64dfd03 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -4,7 +4,7 @@ DEPENDS = "udev"
 LICENSE = "GPLv2 & LGPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://COPYING.LIB;md5=fbc093901857fcd118f065f900982c24"
-INC_PR = "r1"
+INC_PR = "r2"
 
 
 S = "${WORKDIR}/LVM2.${PV}"
@@ -40,4 +40,5 @@ TARGET_CC_ARCH += "${LDFLAGS}"
 FILES_${PN} += "${libdir}/device-mapper/*.so ${base_libdir}/udev"
 FILES_${PN}-dbg += "${libdir}/device-mapper/.debug"
 
+RDEPENDS_${PN} = "bash"
 EXTRA_OECONF = "--with-usrlibdir=${libdir}"
-- 
1.7.9.5


