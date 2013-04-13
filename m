Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UR0np-0007X1-MO
	for openembedded-devel@lists.openembedded.org;
	Sat, 13 Apr 2013 15:47:44 +0200
Received: by mail-ea0-f178.google.com with SMTP id o10so1641181eaj.9
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 13 Apr 2013 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=fMKEY0xDl+afNZ1WglTanzbPJvY+s85Mqz78X7QbKgs=;
	b=Tn/ttqpOsH0VTekn39NZ9UhYpqy3kS5gjHcQ1A3nZoFQ5dD05d/VQqKYE/cCDME3Go
	hnTa+PIhBwHbNfDX23sDTB4O0JIeBDbV0jUc05E7okbiHwbHWSqbfnFmG7Q9Awlmu2bQ
	8NxjEkQ6aq8xxiKRx09UmGX/SjdIJJSdRma9odiqV0la5JCd6m1G6TjGq/ed5kmdzf57
	u/eJkw2d3BDkdY56EAp54V0Gr2kK6nyrP4QCxP52IzV5Py6KihP3k5a58yMGmG5hzYfU
	9DCkrV4piNvN2DP3otwc72cwarQQ55cQtBvQzdpBwkem0amq4eIExekrq1r5xu++3tQO
	n6gg==
X-Received: by 10.15.41.2 with SMTP id r2mr39501090eev.20.1365859812039;
	Sat, 13 Apr 2013 06:30:12 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id s47sm16445515eeg.8.2013.04.13.06.30.11
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 13 Apr 2013 06:30:11 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 13 Apr 2013 15:29:34 +0200
Message-Id: <1365859790-20947-17-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
References: <1365859790-20947-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [meta-systemd][PATCH 17/33] gpsd: move systemd support from meta-systemd back to meta-oe
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
X-List-Received-Date: Sat, 13 Apr 2013 13:48:57 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-navigation/gpsd/gpsd/gpsd.service        |  0
 meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb          | 17 ++++++++++++++---
 .../recipes-navigation/gpsd/gpsd_3.7.bbappend        | 20 --------------------
 3 files changed, 14 insertions(+), 23 deletions(-)
 rename {meta-systemd/meta-oe => meta-oe}/recipes-navigation/gpsd/gpsd/gpsd.service (100%)
 delete mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend

diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
similarity index 100%
rename from meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
rename to meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
index ceb700a..1228614 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bb
@@ -7,7 +7,7 @@ PROVIDES = "virtual/gpsd"
 
 EXTRANATIVEPATH += "chrpath-native"
 
-PR = "r3"
+PR = "r6"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
@@ -17,16 +17,17 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://gpsd-default \
   file://gpsd \
   file://60-gpsd.rules \
+  file://gpsd.service \
 "
 SRC_URI[md5sum] = "52d9785eaf1a51298bb8900dbde88f98"
 SRC_URI[sha256sum] = "7800c478ee9d7ca7a502b0f892828561b1fbf7bc69d9d38c447c82c3628302ac"
 
-inherit scons update-rc.d python-dir pythonnative
+inherit scons update-rc.d python-dir pythonnative systemd
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-SYSTEMD_OESCONS ??= "false"
+SYSTEMD_OESCONS = "${@base_contains('DISTRO_FEATURES', 'systemd', 'true', 'false',d)}"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -79,6 +80,11 @@ do_install_append() {
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
@@ -121,3 +127,8 @@ RDEPENDS_gps-utils = "python-pygps"
 DESCRIPTION_python-pygps = "Python bindings to gpsd"
 FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
 RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
+
+RPROVIDES_${PN} += "${PN}-systemd"
+RREPLACES_${PN} += "${PN}-systemd"
+RCONFLICTS_${PN} += "${PN}-systemd"
+SYSTEMD_SERVICE_${PN} = "${PN}.socket"
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
deleted file mode 100644
index 375e855..0000000
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.7.bbappend
+++ /dev/null
@@ -1,20 +0,0 @@
-PRINC := "${@int(PRINC) + 2}"
-
-inherit systemd
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://gpsd.service"
-
-RPROVIDES_${PN} += "${PN}-systemd"
-RREPLACES_${PN} += "${PN}-systemd"
-RCONFLICTS_${PN} += "${PN}-systemd"
-SYSTEMD_SERVICE_${PN} = "${PN}.socket"
-SYSTEMD_OESCONS = "true"
-
-do_install_append() {
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
-}
-- 
1.8.1.5



