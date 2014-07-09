Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A137370391
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 13:55:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jul 2014 06:55:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,631,1400050800"; d="scan'208";a="567365966"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2014 06:55:11 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jul 2014 16:55:08 +0300
Message-Id: <1404914108-27167-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] usb-modeswitch: Do not try to use autotools
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
X-List-Received-Date: Wed, 09 Jul 2014 13:55:14 -0000

There is only one Makefile in the project so no use trying to use
autotools.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
index 92d1ac4..761617c 100644
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
+do_install_append() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.8.3.1


