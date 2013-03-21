Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Aws.Ismail@windriver.com>) id 1UIl43-0006La-Ug
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Mar 2013 20:22:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2LJ5MQ5026344
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Mar 2013 12:05:22 -0700 (PDT)
Received: from localhost.localdomain (128.224.147.212) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 21 Mar 2013 12:05:22 -0700
From: Aws Ismail <aws.ismail@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 21 Mar 2013 15:05:21 -0400
Message-ID: <1363892721-25929-2-git-send-email-aws.ismail@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363892721-25929-1-git-send-email-aws.ismail@windriver.com>
References: <1363892721-25929-1-git-send-email-aws.ismail@windriver.com>
MIME-Version: 1.0
Cc: joe.macdonald@windriver.com
Subject: [meta-networking][PATCH 1/1] Quagga has no snmp support, unrecognized options --enable-tcp-md5
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
X-List-Received-Date: Thu, 21 Mar 2013 19:22:41 -0000
Content-Type: text/plain

1. Quagga's tcp-md5 has been renamed to linux24-tcp-md5

2. net-snmp needs to have mib-modules=smux enabled to enable
quagga to support snmp. Make the net-snmp option dependent
on the DISTRO_FEATURE snmp.

3. Misc: install the sample conf files for quagga. Also,
Make sure that the post install script is being run
on the target rather than during the rootfs creation
stage.

Signed-off-by: Amy Fong <amy.fong@windriver.com>
Signed-off-by: Aws Ismail <aws.ismail@windriver.com>
---
 .../recipes-protocols/quagga/quagga.inc            |   23 ++++++++++++++++---
 1 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
index 6ee2455..9a70d18 100644
--- a/meta-networking/recipes-protocols/quagga/quagga.inc
+++ b/meta-networking/recipes-protocols/quagga/quagga.inc
@@ -9,11 +9,13 @@ HOMEPAGE = "http://www.quagga.net/"
 SECTION = "network"
 LICENSE = "GPL-2.0 & LGPL-2.0"
 DEPENDS = "readline ncurses perl-native"
+DEPENDS += "${@base_contains('DISTRO_FEATURES', 'snmp', 'net-snmp', '', d)}"
+SNMP_CONF="${@base_contains('DISTRO_FEATURES', 'snmp', '--enable-snmp', '', d)}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b \
                     file://COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a"
 
-INC_PR = "r0"
+INC_PR = "r1"
 
 QUAGGASUBDIR = ""
 # ${QUAGGASUBDIR} is deal with old versions. Set to "/attic" for old
@@ -46,7 +48,8 @@ EXTRA_OECONF = "--sysconfdir=${sysconfdir}/quagga \
                 --enable-configfile-mask=0640 \
                 --enable-logfile-mask=0640 \
                 --enable-rtadv \
-                --enable-tcp-md5"
+                --enable-linux24-tcp-md5 \
+                ${SNMP_CONF}"
 
 do_install () {
         # Install init script and default settings
@@ -57,6 +60,12 @@ do_install () {
         install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
         install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
         install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
+
+        # Install sample configurations for the daemons
+        for f in bgpd vtysh babeld isisd ospfd ripngd zebra ripd ospf6d; do
+            install -m 0640 ${S}/$f/$f.conf.sample ${D}${sysconfdir}/quagga/$f.conf.sample
+        done
+
         # Install quagga
         oe_runmake install DESTDIR=${D} prefix=${prefix} \
                 sbindir=${sbindir} \
@@ -106,17 +115,23 @@ INITSCRIPT_PARAMS_${PN}                 = "defaults 15 85"
 INITSCRIPT_NAME_${PN}-watchquagga       = "watchquagga"
 INITSCRIPT_PARAMS_${PN}-watchquagga     = "defaults 90 10"
 
+# Add quagga's user and group
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "--system quagga ; --system quaggavty"
 USERADD_PARAM_${PN} = "--system --home ${localstatedir}/run/quagga/ -M -g quagga quagga"
 
 pkg_postinst_${PN} () {
-	for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
+    if [ "x$D" != "x" ] ; then
+        exit 1
+    fi
+    for f in bgpd babeld isisd ospfd ripngd zebra ripd ospf6d; do touch ${sysconfdir}/quagga/$f.conf; done
 	chown quagga:quaggavty ${sysconfdir}/quagga
 	chown quagga:quagga ${sysconfdir}/quagga/*.conf
 	chmod 750 ${sysconfdir}/quagga
 	chown 640 ${sysconfdir}/quagga/*.conf
-	${sysconfdir}/init.d/populate-volatile.sh update
+    if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
+        ${sysconfdir}/init.d/populate-volatile.sh update
+    fi
 }
 
 # Stop apps before uninstall
-- 
1.7.0.4



