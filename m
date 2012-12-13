Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TjAP5-0001uW-Lx
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Dec 2012 16:08:55 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Dec 2012 06:53:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,274,1355126400"; d="scan'208";a="180451177"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.1])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Dec 2012 06:53:44 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 13 Dec 2012 14:53:37 +0000
Message-Id: <ef5d9ef60c4f68a95992d7020cae3a6928151970.1355410208.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1355410208.git.paul.eggleton@linux.intel.com>
References: <cover.1355410208.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 3/3] libnl: remove
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Dec 2012 15:08:55 -0000

Version 3.2.14 is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-oe/recipes-support/libnl/libnl_3.2.9.bb |   52 --------------------------
 1 file changed, 52 deletions(-)
 delete mode 100644 meta-oe/recipes-support/libnl/libnl_3.2.9.bb

diff --git a/meta-oe/recipes-support/libnl/libnl_3.2.9.bb b/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
deleted file mode 100644
index 11b901c..0000000
--- a/meta-oe/recipes-support/libnl/libnl_3.2.9.bb
+++ /dev/null
@@ -1,52 +0,0 @@
-DESCRIPTION = "libnl is a library for applications dealing with netlink sockets."
-HOMEPAGE = "http://www.infradead.org/~tgr/libnl/"
-SECTION = "libs/network"
-
-PE = "1"
-
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "flex-native bison-native"
-
-SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz"
-
-SRC_URI[md5sum] = "c13adec0239b266207fff07d79e5ce9e"
-SRC_URI[sha256sum] = "9f23e9460bd9bb7fbe09af5eb281e4a43a26fa245ea864ed5e28fe4e8118af63"
-
-inherit autotools pkgconfig
-
-do_install_append() {
-    # make wpa-supplicant happy
-    # TODO: when moving to oe-core fix at wpa-supplicant
-    # (e.g src/drivers/drivers.mak)
-    cd ${D}${includedir}
-    ln -sf libnl3/netlink netlink
-    cd ${D}${libdir}
-    ln -sf libnl-3.so.200 libnl.so
-    ln -sf libnl-3.so.200 libnl.so.3
-    ln -sf libnl-genl-3.so.200 libnl-genl.so
-    ln -sf libnl-genl-3.so.200 libnl-genl.so.3
-}
-
-FILES_${PN} = "${libdir}/libnl-3.so.* \
-               ${libdir}/libnl.so.* \
-               ${sysconfdir}"
-RREPLACES_${PN} = "libnl2"
-RCONFLICTS_${PN} = "libnl2"
-FILES_${PN}-dbg += "${libdir}/libnl/cli/*/.debug"
-FILES_${PN}-dev += "${libdir}/libnl/cli/*/*.so \
-                    ${libdir}/libnl/cli/*/*.la"
-FILES_${PN}-staticdev += "${libdir}/libnl/cli/*/*.a"
-
-PACKAGES += "${PN}-cli ${PN}-route ${PN}-nf ${PN}-genl"
-FILES_${PN}-cli   = "${libdir}/libnl-cli-3.so.* \
-                     ${libdir}/libnl/cli/*/*.so.* \
-                     ${sbindir}/nl-*"
-FILES_${PN}-route = "${libdir}/libnl-route-3.so.*"
-FILES_${PN}-nf    = "${libdir}/libnl-nf-3.so.*"
-FILES_${PN}-genl  = "${libdir}/libnl-genl-3.so.* \
-                     ${libdir}/libnl-genl.so.* \
-                     ${sbindir}/genl-ctrl-list"
-RREPLACES_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-RCONFLICTS_${PN}-genl = "libnl-genl2 libnl-genl-3-200"
-- 
1.7.10.4



