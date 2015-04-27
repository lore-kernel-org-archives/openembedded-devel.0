Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f51.google.com (mail-wg0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id EF2BA73D95
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 18:46:06 +0000 (UTC)
Received: by wgso17 with SMTP id o17so126221920wgs.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 11:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=aYH9Y2hhyyX6knypR+KgtTkOhnaQ0bmZlngNbKSFkO0=;
	b=fOxEsoUI0nkTzcmQiDDTU1Nn4H3VckpBnEM3r6U1JQWKFbaobOZTkmYNYr444M94wK
	v2tcTGtIdpJSAZxmuHkEWdHVFhmHu+d7/tyS/qdxdSol43RDXeqbe57twTdeulLJgBL4
	g7b/UHImhvhlNYG7+uZSlXMQh2DoJE70fd48wo6N6+OjLbuTwEK9DaG9KnhuBTVcuU7N
	9hihFwk/pXISa/OSTKsMkum1NgPwDZCMSlb5lnH/i+RhqVeToUNn1RLY5XIbh7HZQbzl
	T6w1IVk7qLGujyitXrV3NpRYEK9p6hoNDM4kB9SVmk/5uPmZ8nnPfQbYYnkz0oGz9O7s
	EIgw==
X-Received: by 10.180.83.229 with SMTP id t5mr23520493wiy.82.1430160367976;
	Mon, 27 Apr 2015 11:46:07 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by mx.google.com with ESMTPSA id qt2sm30555146wjc.7.2015.04.27.11.46.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Apr 2015 11:46:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 27 Apr 2015 20:46:37 +0200
Message-Id: <1430160397-3334-3-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1430160397-3334-1-git-send-email-Martin.Jansa@gmail.com>
References: <1430160397-3334-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-oe][fido][PATCH 3/3] gsoap: fold .inc and -native into one recipe
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
X-List-Received-Date: Mon, 27 Apr 2015 18:46:07 -0000

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
2.3.5


