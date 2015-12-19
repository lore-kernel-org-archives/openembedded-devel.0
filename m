Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id A7E106FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Dec 2015 04:26:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 19 Dec 2015 20:26:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,452,1444719600"; d="scan'208";a="875248932"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.23.219.46])
	by orsmga002.jf.intel.com with ESMTP; 19 Dec 2015 20:26:39 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Dec 2015 20:22:36 +0000
Message-Id: <1450556556-38220-1-git-send-email-mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [meta-oe][PATCH] hostapd: Fix source and build directory
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
X-List-Received-Date: Sun, 20 Dec 2015 04:26:40 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The current recipe make no difference between
the source and the build directory. There are
source files outside this directory and isn't
possible to patch these files.

This changes adds the build directory path to
the recipe, now is possible to patch files in
other directories, if required.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
index d95dbec..c38e20a 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.5.bb
@@ -1,7 +1,7 @@
 HOMEPAGE = "http://w1.fi/hostapd/"
 SECTION = "kernel/userland"
 LICENSE = "GPLv2 | BSD"
-LIC_FILES_CHKSUM = "file://README;md5=4d53178f44d4b38418a4fa8de365e11c"
+LIC_FILES_CHKSUM = "file://${B}/README;md5=4d53178f44d4b38418a4fa8de365e11c"
 DEPENDS = "libnl openssl"
 SUMMARY = "User space daemon for extended IEEE 802.11 management"
 
@@ -18,11 +18,11 @@ SRC_URI = " \
     file://hostapd.service \
 "
 
-S = "${WORKDIR}/hostapd-${PV}/hostapd"
-
+S = "${WORKDIR}/hostapd-${PV}"
+B = "${WORKDIR}/hostapd-${PV}/hostapd"
 
 do_configure() {
-    install -m 0644 ${WORKDIR}/defconfig ${S}/.config
+    install -m 0644 ${WORKDIR}/defconfig ${B}/.config
 }
 
 do_compile() {
@@ -32,9 +32,9 @@ do_compile() {
 
 do_install() {
     install -d ${D}${sbindir} ${D}${sysconfdir}/init.d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/hostapd.conf ${D}${sysconfdir}
-    install -m 0755 ${S}/hostapd ${D}${sbindir}
-    install -m 0755 ${S}/hostapd_cli ${D}${sbindir}
+    install -m 0644 ${B}/hostapd.conf ${D}${sysconfdir}
+    install -m 0755 ${B}/hostapd ${D}${sbindir}
+    install -m 0755 ${B}/hostapd_cli ${D}${sbindir}
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/hostapd
     install -m 0644 ${WORKDIR}/hostapd.service ${D}${systemd_unitdir}/system/
     sed -i -e 's,@SBINDIR@,${sbindir},g' -e 's,@SYSCONFDIR@,${sysconfdir},g' ${D}${systemd_unitdir}/system/hostapd.service
-- 
1.8.4.5


