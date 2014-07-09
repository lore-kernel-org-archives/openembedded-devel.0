Return-Path: <jukka.rissanen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 39C6F70391
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Jul 2014 13:55:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2014 06:55:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,631,1400050800"; d="scan'208";a="567366029"
Received: from jrissane-mobl.ger.corp.intel.com ([10.237.67.153])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2014 06:55:23 -0700
From: Jukka Rissanen <jukka.rissanen@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Jul 2014 16:55:22 +0300
Message-Id: <1404914122-27275-1-git-send-email-jukka.rissanen@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [meta-oe][PATCH] usb-modeswitch: Upgrade to latest version
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
X-List-Received-Date: Wed, 09 Jul 2014 13:55:29 -0000

Use the latest version of usb-modeswitch (2.2.0) and
usb-modeswitch-data (20140529). The data package depends
on new usb-modeswitch version so upgrade both of them at
the same time.

Signed-off-by: Jukka Rissanen <jukka.rissanen@linux.intel.com>
---
 .../usb-modeswitch/usb-modeswitch-data_20130807.bb    | 17 -----------------
 .../usb-modeswitch/usb-modeswitch-data_20140529.bb    | 17 +++++++++++++++++
 .../usb-modeswitch/usb-modeswitch_2.0.1.bb            | 19 -------------------
 .../usb-modeswitch/usb-modeswitch_2.2.0.bb            | 19 +++++++++++++++++++
 4 files changed, 36 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
 delete mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
 create mode 100644 meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb

diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
deleted file mode 100644
index e33f296..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20130807.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY = "Data files for usbmodeswitch"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-inherit allarch
-
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
-SRC_URI[md5sum] = "91feff51deba6e48e78506b8f4db2274"
-SRC_URI[sha256sum] = "a3114e2c1f38eed3ad0067df30e53a96313908a9539a8ea5d94a4d35651699eb"
-
-do_install() {
-    oe_runmake install DESTDIR=${D}
-}
-
-RDEPENDS_${PN} = "usb-modeswitch"
-FILES_${PN} += "${base_libdir}/udev/rules.d/ \
-                ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
new file mode 100644
index 0000000..258f740
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch-data_20140529.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Data files for usbmodeswitch"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit allarch
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-data-${PV}.tar.bz2"
+SRC_URI[md5sum] = "dff94177781298aaf0b3c2a3c3dea6b2"
+SRC_URI[sha256sum] = "53889157937109e04dafe897c098ec94f3f44f9c0c83fc6ec8417aa9a587e536"
+
+do_install() {
+    oe_runmake install DESTDIR=${D}
+}
+
+RDEPENDS_${PN} = "usb-modeswitch (>= 2.2.0)"
+FILES_${PN} += "${base_libdir}/udev/rules.d/ \
+                ${datadir}/usb_modeswitch"
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
deleted file mode 100644
index 761617c..0000000
--- a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.0.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
-
-DEPENDS = "libusb1"
-
-SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2"
-SRC_URI[md5sum] = "e48d4419d0574d342bb183f7465556d0"
-SRC_URI[sha256sum] = "4706c9cfe825263e189f55730ea3d1d8634aeb15645a1098532e946e770f7f95"
-
-EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
-
-FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
-RDEPENDS_${PN} = "tcl"
-RRECOMMENDS_${PN} = "usb-modeswitch-data"
-
-do_install_append() {
-	oe_runmake DESTDIR=${D} install
-}
diff --git a/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
new file mode 100644
index 0000000..cdab38c
--- /dev/null
+++ b/meta-oe/recipes-support/usb-modeswitch/usb-modeswitch_2.2.0.bb
@@ -0,0 +1,19 @@
+SUMMARY = "A mode switching tool for controlling 'flip flop' (multiple device) USB gear"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+DEPENDS = "libusb1"
+
+SRC_URI = "http://www.draisberghof.de/usb_modeswitch/usb-modeswitch-${PV}.tar.bz2"
+SRC_URI[md5sum] = "f323fe700edd6ea404c40934ddf32b22"
+SRC_URI[sha256sum] = "2752103de171ed5f6c8d6a6e3e73e16c9ee3e8e394dd39c5991f7680eb908a3a"
+
+EXTRA_OEMAKE = "TCL=${bindir}/tclsh"
+
+FILES_${PN} = "${bindir} ${sysconfdir} ${base_libdir}/udev/usb_modeswitch ${sbindir} ${localstatedir}/lib/usb_modeswitch"
+RDEPENDS_${PN} = "tcl"
+RRECOMMENDS_${PN} = "usb-modeswitch-data"
+
+do_install_append() {
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.8.3.1


