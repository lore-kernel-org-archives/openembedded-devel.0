Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3FD58703B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jul 2014 14:26:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 10 Jul 2014 07:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,638,1400050800"; d="scan'208";a="541459664"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by orsmga001.jf.intel.com with ESMTP; 10 Jul 2014 07:25:40 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Jul 2014 17:25:36 +0300
Message-Id: <1405002337-16927-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH v3 1/2] usb-modeswitch: Do not try to use autotools
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
X-List-Received-Date: Thu, 10 Jul 2014 14:26:24 -0000

There is only one Makefile in the project so there is no need to use
autotools.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
index 92d1ac4..61caa84 100644
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
@@ -2,8 +2,6 @@ SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) U
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
-inherit autotools
-
 DEPENDS = "libusb1"
 
 SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2"
@@ -15,3 +13,7 @@ EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
 FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
 RDEPENDS_${PN} = "tcl"
 RRECOMMENDS_${PN} = "usb-modeswitch-data"
+
+do_install() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.8.3.1


