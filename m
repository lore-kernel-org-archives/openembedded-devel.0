Return-Path: <B40290@freescale.com>
Received: from co9outboundpool.messaging.microsoft.com
	(co9ehsobe005.messaging.microsoft.com [207.46.163.28])
	by mail.openembedded.org (Postfix) with ESMTP id C46AA6AF13
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 05:29:12 +0000 (UTC)
Received: from mail48-co9-R.bigfish.com (10.236.132.240) by
	CO9EHSOBE025.bigfish.com (10.236.130.88) with Microsoft SMTP Server id
	14.1.225.22; Fri, 5 Jul 2013 05:29:13 +0000
Received: from mail48-co9 (localhost [127.0.0.1])	by mail48-co9-R.bigfish.com
	(Postfix) with ESMTP id 55AE210011A	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 05:29:13 +0000 (UTC)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-SpamScore: 0
X-BigFish: VS0(zzzz1f42h1ee6h1de0h1fdah2073h1202h1e76h1d1ah1d2ah1fc6hzz17326ah8275bhz2dh2a8h668h839he5bhf0ah1288h12a5h12a9h12bdh12e5h137ah139eh13b6h1441h1504h1537h162dh1631h1758h1898h18e1h1946h19b5h1ad9h1b0ah1d0ch1d2eh1d3fh1dc1h1dfeh1dffh1e23h1155h)
Received: from mail48-co9 (localhost.localdomain [127.0.0.1]) by mail48-co9
	(MessageSwitch) id 1373002151349025_16093;
	Fri,  5 Jul 2013 05:29:11 +0000 (UTC)
Received: from CO9EHSMHS032.bigfish.com (unknown [10.236.132.238])	by
	mail48-co9.bigfish.com (Postfix) with ESMTP id 52AAE740050	for
	<openembedded-devel@lists.openembedded.org>;
	Fri,  5 Jul 2013 05:29:11 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by CO9EHSMHS032.bigfish.com
	(10.236.130.42) with Microsoft SMTP Server (TLS) id 14.1.225.23;
	Fri, 5 Jul 2013 05:29:10 +0000
Received: from tx30smr01.am.freescale.net (10.81.153.31) by
	039-SN1MMR1-003.039d.mgd.msft.net (10.84.1.16) with Microsoft SMTP
	Server (TLS) id 14.2.328.11; Fri, 5 Jul 2013 05:29:10 +0000
Received: from sbuilder136.ap.freescale.net (sun.ap.freescale.net
	[10.192.208.136])	by tx30smr01.am.freescale.net (8.14.3/8.14.0) with
	ESMTP id r655T6hQ030851;	Thu, 4 Jul 2013 22:29:07 -0700
From: Chunrong Guo <B40290@freescale.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 5 Jul 2013 13:29:02 +0800
Message-ID: <1373002142-5129-1-git-send-email-B40290@freescale.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Cc: b40527@freescale.com
Subject: [meta-networking][PATCH] Install a systemd unit into ${systemd_unitdir} only with systemd in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 05 Jul 2013 05:29:12 -0000
Content-Type: text/plain

Signed-off-by: Chunrong Guo <B40290@freescale.com>
---
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.bb   |   11 +++++++----
 .../recipes-support/dnsmasq/dnsmasq.inc            |    5 ++++-
 .../recipes-support/nis/yp-tools_2.12.bb           |    8 +++++---
 .../recipes-support/nis/ypbind-mt_1.36.bb          |    8 +++++---
 meta-networking/recipes-support/ntp/ntp.inc        |   12 +++++++-----
 5 files changed, 28 insertions(+), 16 deletions(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
index d21995a..2eece50 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=3;endline=8;md5=7f7f00ba639ac8e8deb5
 
 DEPENDS = "openssl libnl pciutils"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.tar.gz \
         file://init \
@@ -51,9 +51,12 @@ do_install_append() {
         -e "s@^includedir=.*@includedir=${STAGING_INCDIR}@g" \
         -e "s@^libdir=.*@libdir=${STAGING_LIBDIR}@g" \
         -i ${STAGING_BINDIR}/net-snmp-config
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+    
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
index 0f5b273..242f143 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq.inc
@@ -31,9 +31,11 @@ do_install () {
     install -m 644 ${WORKDIR}/dnsmasq.conf ${D}${sysconfdir}/
     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/dnsmasq
 
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
     install -d ${D}${systemd_unitdir}/system
     install -m 0644 ${WORKDIR}/dnsmasq.service ${D}${systemd_unitdir}/system
-
+    fi
+   
     if [ "${@base_contains('PACKAGECONFIG', 'dbus', 'dbus', '', d)}" != "" ]; then
         install -d ${D}${sysconfdir}/dbus-1/system.d
         install -m 644 dbus/dnsmasq.conf ${D}${sysconfdir}/dbus-1/system.d/
@@ -46,3 +48,4 @@ RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "dnsmasq.service"
+
diff --git a/meta-networking/recipes-support/nis/yp-tools_2.12.bb b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
index 0017845..65c4429 100644
--- a/meta-networking/recipes-support/nis/yp-tools_2.12.bb
+++ b/meta-networking/recipes-support/nis/yp-tools_2.12.bb
@@ -1,7 +1,7 @@
 # This package builds tools to manage NIS
 # The source package is utils/net/NIS/yp-tools
 #
-PR = "r3"
+PR = "r4"
 DESCRIPTION="\
 Network Information Service tools.  \
 This package contains ypcat, ypmatch, ypset, \
@@ -26,6 +26,8 @@ RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "domainname.service"
 
 do_install_append() {
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/domainname.service ${D}${systemd_unitdir}/system
+    fi
 }
diff --git a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
index 35ef16a..85ecaf8 100644
--- a/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
+++ b/meta-networking/recipes-support/nis/ypbind-mt_1.36.bb
@@ -1,7 +1,7 @@
 # This package builds the NIS ypbind daemon
 # The source package is utils/net/NIS/ypbind-mt
 #
-PR = "r3"
+PR = "r4"
 DESCRIPTION="\
 Multithreaded NIS bind service (ypbind-mt).  \
 ypbind-mt is a complete new implementation of a NIS \
@@ -40,8 +40,10 @@ do_install_append () {
     # TODO, use update-rc.d
     ln -s ../init.d/ypbind ${D}${sysconfdir}/rcS.d/S44ypbind
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ypbind.service ${D}${systemd_unitdir}/system
+    fi
 }
 
 inherit systemd
diff --git a/meta-networking/recipes-support/ntp/ntp.inc b/meta-networking/recipes-support/ntp/ntp.inc
index 79e7401..6006aeb 100644
--- a/meta-networking/recipes-support/ntp/ntp.inc
+++ b/meta-networking/recipes-support/ntp/ntp.inc
@@ -8,7 +8,7 @@ SECTION = "console/network"
 LICENSE = "NTP"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=fea4b50c33b18c2194b4b1c9ca512670"
 
-INC_PR = "r6"
+INC_PR = "r7"
 
 SRC_URI = "http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-${PV}.tar.gz \
            file://tickadj.c.patch \
@@ -59,10 +59,12 @@ do_install_append() {
     install -d ${D}/${sysconfdir}/network/if-up.d
     ln -s ${bindir}/ntpdate-sync ${D}/${sysconfdir}/network/if-up.d
 
-    install -d ${D}${systemd_unitdir}/system
-    install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+    if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        install -d ${D}${systemd_unitdir}/system
+        install -m 0644 ${WORKDIR}/ntpdate.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/ntpd.service ${D}${systemd_unitdir}/system/
+        install -m 0644 ${WORKDIR}/sntp.service ${D}${systemd_unitdir}/system/
+    fi
 }
 
 PACKAGES += "ntpdate sntp ${PN}-tickadj ${PN}-utils"
-- 
1.7.5.4



