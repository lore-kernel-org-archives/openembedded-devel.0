Return-Path: <igor.santos@aker.com.br>
X-Greylist: delayed 606 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 07 May 2015 21:55:08 UTC
Received: from asmg.aker.com.br (asmg.aker.com.br [177.159.144.67])
	by mail.openembedded.org (Postfix) with SMTP id 3E3E473F7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 21:55:08 +0000 (UTC)
Received: from mail.aker.com.br (bat.bsb.aker.com.br [10.0.0.20])
	by asmg.aker.com.br [10.0.1.3]; Thu, 7 May 2015 18:55:08 -0300
	(envelope-from igor.santos@aker.com.br)
Received: from igor.santos.devel.com.br (10.4.59.1) by mail.aker.com.br
	(10.0.0.20) with Microsoft SMTP Server id 8.3.342.0;
	Thu, 7 May 2015 18:44:59 -0300
From: Igor Santos <igor.santos@aker.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 7 May 2015 18:44:48 -0300
Message-ID: <1431035088-24968-4-git-send-email-igor.santos@aker.com.br>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1431035088-24968-1-git-send-email-igor.santos@aker.com.br>
References: <1431035088-24968-1-git-send-email-igor.santos@aker.com.br>
MIME-Version: 1.0
X-AkerSMTPGW-ServerID: a5fc2d2b506f49fc2bd6d1c7ad2f56ee346d5d27
X-AkerSMTPGW-MessageID: 2f8eeb4b356e02a78519751f698ec6f4253259e0-15o
Subject: [meta-oe][PATCH] gsoap: fold .inc and -native into one recipe
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
X-List-Received-Date: Thu, 07 May 2015 21:55:11 -0000
Content-Type: text/plain

From: Martin Jansa <Martin.Jansa@gmail.com>

* use BBCLASSEXTEND instead of separate recipe

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-support/gsoap/gsoap-native_2.8.12.bb   | 14 ---------
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb      | 35 ++++++++++++++++++----
 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc     | 23 --------------
 3 files changed, 30 insertions(+), 42 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
 delete mode 100644 meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc

diff --git a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
deleted file mode 100644
index ac90155..0000000
--- a/meta-oe/recipes-support/gsoap/gsoap-native_2.8.12.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require gsoap_${PV}.inc
-
-DEPENDS = "flex-native"
-EXTRA_OEMAKE = ""
-
-inherit native
-
-do_install() {
-    oe_runmake DESTDIR=${D} BINDIR=${D}${bindir} install
-}
-
-
-SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
-SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
index b85db05..b5c3995 100644
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
+++ b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.bb
@@ -1,6 +1,27 @@
-require gsoap_${PV}.inc
+DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
+for the development of SOAP Web Services and clients."
+SECTION = "devel"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b338b08b1b61e028e0f399a4de25e58f"
 
-DEPENDS = "gsoap-native openssl zlib"
+SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}2/${BPN}_${PV}.zip"
+SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
+SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
+
+inherit autotools
+
+BBCLASSEXTEND = "native"
+
+PR = "r1"
+
+S = "${WORKDIR}/${BPN}-2.8"
+
+PARALLEL_MAKE = ""
+
+EXTRA_OEMAKE_class-target = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
+
+DEPENDS_class-target = "gsoap-native openssl zlib"
+DEPENDS_class-native = "flex-native"
 
 do_install_append() {
     install -d ${D}${libdir}
@@ -10,8 +31,12 @@ do_install_append() {
     done
 }
 
+do_install_class-native() {
+    oe_runmake DESTDIR=${D} BINDIR=${D}${bindir} install
+}
+
 FILES_${PN} = "${bindir}/wsdl2h ${bindir}/soapcpp2"
 FILES_${PN} += "${datadir}"
-
-SRC_URI[md5sum] = "5700d26fc6fe3073d038349e19c3640d"
-SRC_URI[sha256sum] = "51eef118544fa846f4d2dea2eedf91c84c46a1abeafc5eee3dcff783f4015a00"
+FILES_${PN}-staticdev = "${libdir}"
+FILES_${PN}-dev = "${includedir}"
+RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
diff --git a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc b/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
deleted file mode 100644
index 9e2a782..0000000
--- a/meta-oe/recipes-support/gsoap/gsoap_2.8.12.inc
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "The gSOAP toolkit provides a unique SOAP-to-C/C++ language binding \
-for the development of SOAP Web Services and clients."
-SECTION = "devel"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=b338b08b1b61e028e0f399a4de25e58f"
-
-SRC_URI = "${SOURCEFORGE_MIRROR}/gsoap2/gsoap_${PV}.zip \
-"
-
-inherit autotools
-
-PR = "r1"
-
-S = "${WORKDIR}/gsoap-2.8"
-
-FILES_${PN}-dev = "${includedir}"
-RRECOMMENDS_${PN}-dev = "${PN}-staticdev"
-
-FILES_${PN}-staticdev = "${libdir}"
-
-PARALLEL_MAKE = ""
-
-EXTRA_OEMAKE = "SOAP=${STAGING_BINDIR_NATIVE}/soapcpp2"
-- 
2.1.0



