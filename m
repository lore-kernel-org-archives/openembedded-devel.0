Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0C99F72C06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jan 2015 06:14:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0G6EEnB016890
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jan 2015 22:14:14 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.163.146) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 15 Jan 2015 22:14:14 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 16 Jan 2015 14:14:05 +0800
Message-ID: <1dbf69adda0d5d273d60f3b0e1e599bfb25d47bc.1421388212.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1421388212.git.jackie.huang@windriver.com>
References: <cover.1421388212.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] net-snmp: add ptest package
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
X-List-Received-Date: Fri, 16 Jan 2015 06:14:17 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Issue: TA79430

- Change to use append for PACKAGES so that:
  * ptest package is added from ptest bbcalss
  * the PN is back, allow empty and add rdepends on net-snmp-client
    in case the user try to add net-snmp to the image
- Add a patch to fix the output format for ptest
- Add run-ptest
- Add rdepends on perl for ptest

(LOCAL REV: NOT UPSTREAM) -- Sent to meta-networking on 20150114

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 ...p-testing-add-the-output-format-for-ptest.patch | 37 ++++++++++++++++++++++
 .../recipes-protocols/net-snmp/net-snmp/run-ptest  |  4 +++
 .../recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb | 35 ++++++++++++++++++--
 3 files changed, 73 insertions(+), 3 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
 create mode 100755 meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest

diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
new file mode 100644
index 0000000..9fb19b3
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/net-snmp-testing-add-the-output-format-for-ptest.patch
@@ -0,0 +1,37 @@
+From 4bb4024b395f19d36ab3569e2773ea80d8cc5261 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Wed, 14 Jan 2015 15:10:06 +0800
+Subject: [PATCH] testing: add the output format for ptest
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ testing/RUNTESTS |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/testing/RUNTESTS b/testing/RUNTESTS
+index e11c969..fb90f76 100755
+--- a/testing/RUNTESTS
++++ b/testing/RUNTESTS
+@@ -25,13 +25,17 @@ failed_count=0
+ rm -f failed_tests
+ for i in "${srcdir}"/testing/fulltests/default/T*$1*; do
+     echo "RUNNING $i"
++    test_name=`basename $i`
+     ${srcdir}/testing/fulltests/support/simple_run $i
+     if [ $? = 0 ]; then
++        echo "PASS: $test_name"
+         success_count=`expr $success_count + 1`
+     else
++        echo "FAIL: $test_name"
+         failed_count=`expr $failed_count + 1`
+         echo "$i" >> failed_tests
+     fi
++    echo
+ done
+ 
+ if [ -f failed_tests ]; then
+-- 
+1.7.1
+
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest b/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
new file mode 100755
index 0000000..2334217
--- /dev/null
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp/run-ptest
@@ -0,0 +1,4 @@
+#!/bin/sh
+
+cd testing
+./RUNTESTS
diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
index ab79f45..4ce15e4 100644
--- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
+++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.2.1.bb
@@ -17,12 +17,14 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/net-snmp/net-snmp-${PV}.zip \
         file://ifmib.patch \
         file://fix-libtool-finish.patch \
         file://net-snmp-add-knob-whether-nlist.h-are-checked.patch \
+        file://net-snmp-testing-add-the-output-format-for-ptest.patch \
+        file://run-ptest \
 "
 
 SRC_URI[md5sum] = "a2c83518648b0f2a5d378625e45c0e18"
 SRC_URI[sha256sum] = "ac9105539971f7cfb1456a86d479e18e8a8b3712212595ad40504347ba5843da"
 
-inherit autotools update-rc.d siteinfo systemd
+inherit autotools update-rc.d siteinfo systemd ptest
 
 EXTRA_OEMAKE = "INSTALL_PREFIX=${D}"
 
@@ -71,6 +73,24 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
 }
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}
+    for i in ${S}/dist ${S}/include ${B}/include ${S}/mibs ${S}/configure \
+        ${B}/net-snmp-config ${S}/testing; do
+        if [ -e "$i" ]; then
+            cp -a "$i" ${D}${PTEST_PATH}
+        fi
+    done
+    echo `autoconf -V|awk '/autoconf/{print $NF}'` > ${D}${PTEST_PATH}/dist/autoconf-version
+
+    rmdlist="${D}${PTEST_PATH}/dist/net-snmp-solaris-build"
+    for i in $rmdlist; do
+        if [ -d "$i" ]; then
+            rm -rf "$i"
+        fi
+    done
+}
+
 SYSROOT_PREPROCESS_FUNCS += "net_snmp_sysroot_preprocess"
 
 net_snmp_sysroot_preprocess () {
@@ -80,9 +100,9 @@ net_snmp_sysroot_preprocess () {
     fi
 }
 
-PACKAGES = "${PN}-dbg ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-static ${PN}-libs \
-            ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
+PACKAGES += "${PN}-libs ${PN}-mibs ${PN}-server ${PN}-client ${PN}-server-snmpd ${PN}-server-snmptrapd"
 
+ALLOW_EMPTY_${PN} = "1"
 ALLOW_EMPTY_${PN}-server = "1"
 
 FILES_${PN}-libs = "${libdir}/lib*${SOLIBS}"
@@ -98,6 +118,7 @@ FILES_${PN}-server-snmptrapd = "${sbindir}/snmptrapd \
                                 ${systemd_unitdir}/system/snmptrapd.service \
 "
 
+FILES_${PN} = ""
 FILES_${PN}-client = "${bindir}/* ${datadir}/snmp/"
 FILES_${PN}-dbg += "${libdir}/.debug/ ${sbindir}/.debug/ ${bindir}/.debug/"
 FILES_${PN}-dev += "${bindir}/mib2c ${bindir}/mib2c-update"
@@ -117,10 +138,18 @@ SYSTEMD_PACKAGES = "${PN}-server-snmpd \
 SYSTEMD_SERVICE_${PN}-server-snmpd = "snmpd.service"
 SYSTEMD_SERVICE_${PN}-server-snmptrapd =  "snmptrapd.service"
 
+RDEPENDS_${PN} += "net-snmp-client"
 RDEPENDS_${PN}-server-snmpd += "net-snmp-mibs"
 RDEPENDS_${PN}-server-snmptrapd += "net-snmp-server-snmpd"
 RDEPENDS_${PN}-server += "net-snmp-server-snmpd net-snmp-server-snmptrapd"
 RDEPENDS_${PN}-client += "net-snmp-mibs"
+RDEPENDS_${PN}-ptest += "perl \
+                         perl-module-test \
+                         perl-module-file-basename \
+                         perl-module-getopt-long \
+                         perl-module-file-temp \
+                         perl-module-data-dumper \
+"
 RDEPENDS_${PN}-dev = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
 RRECOMMENDS_${PN}-dbg = "net-snmp-client (= ${EXTENDPKGV}) net-snmp-server (= ${EXTENDPKGV})"
 
-- 
1.9.1


