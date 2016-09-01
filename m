Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 77DE87321C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 11:41:13 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 01 Sep 2016 04:41:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,267,1470726000"; 
   d="scan'208";a="3547039"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 01 Sep 2016 04:41:14 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id DE4916A4080
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Sep 2016 04:40:53 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  1 Sep 2016 14:40:43 +0300
Message-Id: <1472730043-31245-5-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
References: <1472730043-31245-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 4/4] tslib: move recipe from oe-core
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
X-List-Received-Date: Thu, 01 Sep 2016 11:41:14 -0000

Move tslib recipe from oe-core layer.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta-gpe/recipes-graphics/tslib/tslib/ts.conf  | 25 ++++++++++++
 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh |  8 ++++
 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb   | 53 ++++++++++++++++++++++++++
 3 files changed, 86 insertions(+)
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/ts.conf
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
 create mode 100644 meta-gpe/recipes-graphics/tslib/tslib_1.1.bb

diff --git a/meta-gpe/recipes-graphics/tslib/tslib/ts.conf b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
new file mode 100644
index 0000000..1b0da93
--- /dev/null
+++ b/meta-gpe/recipes-graphics/tslib/tslib/ts.conf
@@ -0,0 +1,25 @@
+# Uncomment if you wish to use the linux input layer event interface
+module_raw input
+
+# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
+# module_raw collie
+
+# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
+# module_raw corgi
+
+# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
+# module_raw ucb1x00
+
+# Uncomment if you're using an HP iPaq h3600 or similar
+# module_raw h3600
+
+# Uncomment if you're using a Hitachi Webpad
+# module_raw mk712
+
+# Uncomment if you're using an IBM Arctic II
+# module_raw arctic2
+
+module pthres pmin=1
+module variance delta=30
+module dejitter delta=100
+module linear
diff --git a/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
new file mode 100644
index 0000000..7068e8d
--- /dev/null
+++ b/meta-gpe/recipes-graphics/tslib/tslib/tslib.sh
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+if [ -e /dev/input/touchscreen0 ]; then
+    TSLIB_TSDEVICE=/dev/input/touchscreen0
+
+    export TSLIB_TSDEVICE
+fi
+
diff --git a/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
new file mode 100644
index 0000000..b0264c3
--- /dev/null
+++ b/meta-gpe/recipes-graphics/tslib/tslib_1.1.bb
@@ -0,0 +1,53 @@
+SUMMARY = "An abstraction layer for touchscreen panel events"
+DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
+events, as well as a filter stack for the manipulation of those events. \
+Tslib is generally used on embedded devices to provide a common user \
+space interface to touchscreen functionality."
+HOMEPAGE = "http://tslib.berlios.de/"
+
+AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
+SECTION = "base"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
+
+SRC_URI = "https://github.com/kergoth/tslib/releases/download/${PV}/tslib-${PV}.tar.xz;downloadfilename=tslib-${PV}.tar.xz \
+           file://ts.conf \
+           file://tslib.sh \
+"
+
+SRC_URI[md5sum] = "14771f8607b341bb4b297819d37e837d"
+SRC_URI[sha256sum] = "fe35e5f710ea933b118f710e2ce4403ac076fe69926b570333867d4de082a51c"
+
+UPSTREAM_CHECK_URI = "https://github.com/kergoth/tslib/releases"
+
+inherit autotools pkgconfig
+
+EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
+
+do_install_prepend() {
+	install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
+}
+
+do_install_append() {
+	install -d ${D}${sysconfdir}/profile.d/
+	install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
+}
+
+# People should consider using udev's /dev/input/touchscreen0 symlink
+# instead of detect-stylus
+#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
+RPROVIDES_tslib-conf = "libts-0.0-conf"
+
+PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
+DEBIAN_NOAUTONAME_tslib-conf = "1"
+DEBIAN_NOAUTONAME_tslib-tests = "1"
+DEBIAN_NOAUTONAME_tslib-calibrate = "1"
+
+RDEPENDS_${PN} = "tslib-conf"
+RRECOMMENDS_${PN} = "pointercal"
+
+FILES_${PN}-dev += "${libdir}/ts/*.la"
+FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
+FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
+FILES_tslib-calibrate += "${bindir}/ts_calibrate"
+FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"
-- 
2.4.0


