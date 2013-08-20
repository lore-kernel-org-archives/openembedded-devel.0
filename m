Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1112D6B6AE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Aug 2013 23:21:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 Aug 2013 16:21:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,923,1367996400"; d="scan'208";a="390550347"
Received: from akagikob-mobl.ger.corp.intel.com (HELO
	helios.ger.corp.intel.com) ([10.252.122.209])
	by orsmga002.jf.intel.com with ESMTP; 20 Aug 2013 16:21:13 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 21 Aug 2013 00:20:53 +0100
Message-Id: <1377040853-17307-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-oe][PATCH] tslib: remove
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
X-List-Received-Date: Tue, 20 Aug 2013 23:21:28 -0000

A newer recipe is now in OE-Core.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 .../tslib/tslib/obsolete_automake_macros.patch     | 16 ------
 meta-oe/recipes-graphics/tslib/tslib/ts.conf       | 25 ---------
 meta-oe/recipes-graphics/tslib/tslib/tslib.sh      |  8 ---
 meta-oe/recipes-graphics/tslib/tslib_git.bb        | 59 ----------------------
 4 files changed, 108 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib/ts.conf
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib/tslib.sh
 delete mode 100644 meta-oe/recipes-graphics/tslib/tslib_git.bb

diff --git a/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch b/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
deleted file mode 100644
index 752077d..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Upstream-Status: Submitted [https://github.com/kergoth/tslib/pull/14]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff --git a/configure.ac b/configure.ac
-index c42be91..6d71be0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -6,7 +6,7 @@ AC_INIT(tslib, 1.0.0, kergoth@handhelds.org)
- # AC_CONFIG_AUX_DIR(config)
- AM_INIT_AUTOMAKE(dist-bzip2)
- AC_CONFIG_SRCDIR([src/ts_close.c])
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- PACKAGE_DESCRIPTION="Touchscreen Access Library"
- AC_SUBST(PACKAGE_DESCRIPTION)
diff --git a/meta-oe/recipes-graphics/tslib/tslib/ts.conf b/meta-oe/recipes-graphics/tslib/tslib/ts.conf
deleted file mode 100644
index 1b0da93..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib/ts.conf
+++ /dev/null
@@ -1,25 +0,0 @@
-# Uncomment if you wish to use the linux input layer event interface
-module_raw input
-
-# Uncomment if you're using a Sharp Zaurus SL-5500/SL-5000d
-# module_raw collie
-
-# Uncomment if you're using a Sharp Zaurus SL-C700/C750/C760/C860
-# module_raw corgi
-
-# Uncomment if you're using a device with a UCB1200/1300/1400 TS interface
-# module_raw ucb1x00
-
-# Uncomment if you're using an HP iPaq h3600 or similar
-# module_raw h3600
-
-# Uncomment if you're using a Hitachi Webpad
-# module_raw mk712
-
-# Uncomment if you're using an IBM Arctic II
-# module_raw arctic2
-
-module pthres pmin=1
-module variance delta=30
-module dejitter delta=100
-module linear
diff --git a/meta-oe/recipes-graphics/tslib/tslib/tslib.sh b/meta-oe/recipes-graphics/tslib/tslib/tslib.sh
deleted file mode 100644
index 7068e8d..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib/tslib.sh
+++ /dev/null
@@ -1,8 +0,0 @@
-#!/bin/sh
-
-if [ -e /dev/input/touchscreen0 ]; then
-    TSLIB_TSDEVICE=/dev/input/touchscreen0
-
-    export TSLIB_TSDEVICE
-fi
-
diff --git a/meta-oe/recipes-graphics/tslib/tslib_git.bb b/meta-oe/recipes-graphics/tslib/tslib_git.bb
deleted file mode 100644
index b653978..0000000
--- a/meta-oe/recipes-graphics/tslib/tslib_git.bb
+++ /dev/null
@@ -1,59 +0,0 @@
-SUMMARY = "An abstraction layer for touchscreen panel events."
-DESCRIPTION = "Tslib is an abstraction layer for touchscreen panel \
-events, as well as a filter stack for the manipulation of those events. \
-Tslib is generally used on embedded devices to provide a common user \
-space interface to touchscreen functionality."
-HOMEPAGE = "http://tslib.berlios.de/"
-
-AUTHOR = "Russell King w/ plugins by Chris Larson et. al."
-SECTION = "base"
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=f30a9716ef3762e3467a2f62bf790f0a"
-
-PR = "r1"
-
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "git://github.com/kergoth/tslib.git;protocol=git \
-           file://obsolete_automake_macros.patch \
-           file://ts.conf \
-           file://tslib.sh"
-SRCREV = "e17263ef401ee885a27d649b90b577cfb44500e0"
-S = "${WORKDIR}/git"
-
-PV = "1.0+gitr${SRCPV}"
-
-inherit autotools pkgconfig
-
-EXTRA_OECONF = "--enable-shared --disable-h3600 --enable-input --disable-corgi --disable-collie --disable-mk712 --disable-arctic2 --disable-ucb1x00"
-
-do_install_prepend() {
-    install -m 0644 ${WORKDIR}/ts.conf ${S}/etc/ts.conf
-}
-
-do_install_append() {
-    install -d ${D}${sysconfdir}/profile.d/
-    install -m 0755 ${WORKDIR}/tslib.sh ${D}${sysconfdir}/profile.d/
-}
-
-SRC_URI_OVERRIDES_PACKAGE_ARCH = "0"
-
-# People should consider using udev's /dev/input/touchscreen0 symlink
-# instead of detect-stylus
-#RDEPENDS_tslib-conf_weird-machine = "detect-stylus"
-RPROVIDES_tslib-conf = "libts-0.0-conf"
-
-PACKAGES =+ "tslib-conf tslib-tests tslib-calibrate"
-DEBIAN_NOAUTONAME_tslib-conf = "1"
-DEBIAN_NOAUTONAME_tslib-tests = "1"
-DEBIAN_NOAUTONAME_tslib-calibrate = "1"
-
-RDEPENDS_${PN} = "tslib-conf"
-RRECOMMENDS_${PN} = "pointercal"
-
-FILES_${PN}-dbg += "${libdir}/ts/.debug*"
-FILES_${PN}-dev += "${libdir}/ts/*.la"
-FILES_tslib-conf = "${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh ${datadir}/tslib"
-FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so*"
-FILES_tslib-calibrate += "${bindir}/ts_calibrate"
-FILES_tslib-tests = "${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw ${bindir}/ts_test"
-- 
1.8.1.2


