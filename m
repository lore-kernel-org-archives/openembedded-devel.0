Return-Path: <B40290@freescale.com>
Received: from va3outboundpool.messaging.microsoft.com
	(va3ehsobe005.messaging.microsoft.com [216.32.180.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8CDF66B007
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:40:59 +0000 (UTC)
Received: from mail89-va3-R.bigfish.com (10.7.14.229) by
	VA3EHSOBE002.bigfish.com (10.7.40.22) with Microsoft SMTP Server id
	14.1.225.22; Fri, 5 Jul 2013 07:40:59 +0000
Received: from mail89-va3 (localhost [127.0.0.1])	by mail89-va3-R.bigfish.com
	(Postfix) with ESMTP id 989E8C00D0	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:40:59 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz17326ah1954cbh8275bh8275dhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail89-va3 (localhost.localdomain [127.0.0.1]) by mail89-va3
	(MessageSwitch) id 1373010057310211_15436;
	Fri,  5 Jul 2013 07:40:57 +0000 (UTC)
Received: from VA3EHSMHS006.bigfish.com (unknown [10.7.14.243])	by
	mail89-va3.bigfish.com (Postfix) with ESMTP id 3E39E1A005A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 07:40:57 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by VA3EHSMHS006.bigfish.com
	(10.7.99.16) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 5 Jul 2013 07:40:57 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-001.039d.mgd.msft.net (10.84.1.13) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 5 Jul 2013 07:40:56 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r657eqCZ021376;	Fri, 5 Jul 2013 00:40:54 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jul 2013 15:40:48 +0800
Message-ID: <1373010048-31156-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-oe][PATCH] Install a systemd unit into ${systemd_unitdir} only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 05 Jul 2013 07:40:59 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb |    8 +++++---
 meta-oe/recipes-extended/zram/zram_0.1.bb     |    8 +++++---
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb   |   10 ++++++----
 3 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
index 3300fd2..45498a8 100644
--- a/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
+++ b/meta-oe/recipes-devtools/cloud9/cloud9_0.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://c9.io"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4784c3bcff601fd8f9515f52a11e7018"
 
-PR = "r4"
+PR = "r5"
 
 # Nodejs-native for node-waf, nodejs4-native for the headers
 DEPENDS = "libxml2 nodejs-native nodejs4-native"
@@ -101,8 +101,10 @@ do_install () {
      install -m 0755 -d ${D}${sysconfdir}/avahi/services/
      install -m 0644 ${WORKDIR}/cloud9-avahi.service ${D}${sysconfdir}/avahi/services/
      
-     install -d ${D}${systemd_unitdir}/system
-     install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
+     if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+         install -d ${D}${systemd_unitdir}/system
+         install -m 0644 ${WORKDIR}/cloud9.service ${D}${systemd_unitdir}/system
+     fi
 }
 
 FILES_${PN}-dbg += "${datadir}/cloud9/support/jsdav/support/node-o3-xml-v4/lib/o3-xml/.debug \
diff --git a/meta-oe/recipes-extended/zram/zram_0.1.bb b/meta-oe/recipes-extended/zram/zram_0.1.bb
index fbeb586..b871bc7 100644
--- a/meta-oe/recipes-extended/zram/zram_0.1.bb
+++ b/meta-oe/recipes-extended/zram/zram_0.1.bb
@@ -6,7 +6,7 @@ inherit allarch update-rc.d systemd
 
 RDEPENDS_${PN} = "util-linux-swaponoff kmod kernel-module-zram"
 
-PR = "r3"
+PR = "r4"
 
 SRC_URI = " \
            file://init \
@@ -18,8 +18,10 @@ do_install () {
     install -d ${D}${sysconfdir}/init.d
     install -m 0755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/zram
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/zram.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 FILES_${PN} = "${sysconfdir}/init.d"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index b0d5a79..3e7844d 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r7"
+PR = "r8"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
     file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
@@ -82,9 +82,11 @@ do_install_append() {
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
 
     #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+        install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+    fi
 }
 
 pkg_postinst_${PN}-conf() {
-- 
1.7.5.4



