Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SpbSr-00085x-Q0
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 10:43:06 +0200
Received: by mail-bk0-f47.google.com with SMTP id ik5so2247698bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 01:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=73X86PswtEcsRG76bHKKyFOJSOreWvcErQoNavNc2wA=;
	b=rh/EkzYYqVPWljJ0TQ6lTikgdnbr2PN5vqDbYSQyvfgPq20ew2xLQ6uZ1alxJU4Bry
	uz6+XQi6kyEq++pJZ7TKSCEECUWtw8Z8qQjcxJQLDnCijOea94Nf2PzbE+VDR/BP1i+k
	Pqi59+qU4tGFlnhWu5bl6hZQHoUcLsk4yhxN2Ku9uXOFvZcBr0A4yw7ex4LDMhQTY98I
	x/8nl+ITZC25cwJb5UxJppRxUOZVvNYqSlDLazOvYfXcPoGg8j45ytwSwL5WbYf2H9N0
	p0I35f6nuRDDPGPSw4uDcwUWXnxpEh7f1fUAlpuATvzshRAb8eN0ObG9ykfreRZ0XHvr
	Bmjw==
Received: by 10.204.157.151 with SMTP id b23mr156189bkx.44.1342168313981;
	Fri, 13 Jul 2012 01:31:53 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-112.unitymediagroup.de.
	[95.222.160.112])
	by mx.google.com with ESMTPS id fu8sm4214355bkc.5.2012.07.13.01.31.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Jul 2012 01:31:53 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 13 Jul 2012 10:30:39 +0200
Message-Id: <1342168240-7760-32-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe, V2 31/32] gpsd: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 08:43:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   15 ++++-----------
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   15 ++++-----------
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 ++++----------
 .../recipes-navigation/gpsd/gpsd/gpsd.service      |    0
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   18 ++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   18 ++++++++++++++++++
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++++++++
 7 files changed, 62 insertions(+), 32 deletions(-)
 rename {meta-oe => meta-systemd/meta-oe}/recipes-navigation/gpsd/gpsd/gpsd.service (100%)
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index ebc4af6..4f3d2d7 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
+PR = "r3"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
@@ -15,20 +15,18 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
-  file://gpsd.service \
   file://gpsd \
   file://60-gpsd.rules \
 "
 SRC_URI[md5sum] = "c01353459faa68834309109d4e868460"
 SRC_URI[sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
 
-inherit scons update-rc.d python-dir systemd
+inherit scons update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS ??= "false"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -38,7 +36,7 @@ EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
-  systemd='true' \
+  systemd='${SYSTEMD_OESCONS}' \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
@@ -81,11 +79,6 @@ do_install_append() {
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 083163b..3cac186 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r2"
+PR = "r3"
 
 DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
@@ -16,20 +16,18 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
   file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
   file://gpsd-default \
-  file://gpsd.service \
   file://gpsd \
   file://60-gpsd.rules \
 "
 SRC_URI[md5sum] = "e96881798a0ab67aa3cd5f3249f0e536"
 SRC_URI[sha256sum] = "5ebb0b00c49421eb8fbead81342e5ce63e82065e5ff27da586f10e342b999171"
 
-inherit scons update-rc.d python-dir systemd
+inherit scons update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS ??= "false"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -39,7 +37,7 @@ EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
-  systemd='true' \
+  systemd='${SYSTEMD_OESCONS}' \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
@@ -82,11 +80,6 @@ do_install_append() {
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
index 0cf0685..1c7d76f 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
 
@@ -25,13 +25,12 @@ SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
 "
 S = "${WORKDIR}/git"
 
-inherit scons update-rc.d python-dir systemd
+inherit scons update-rc.d python-dir
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
 
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS ??= "false"
 
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -41,7 +40,7 @@ EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
-  systemd='true' \
+  systemd='${SYSTEMD_OESCONS}' \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
@@ -84,11 +83,6 @@ do_install_append() {
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
rename to meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd/gpsd.service
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
new file mode 100644
index 0000000..9504761
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
@@ -0,0 +1,18 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://gpsd.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS = "true"
+
+do_install_append() {
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+}
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
new file mode 100644
index 0000000..9504761
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
@@ -0,0 +1,18 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+SRC_URI += "file://gpsd.service"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS = "true"
+
+do_install_append() {
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+}
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend
new file mode 100644
index 0000000..1026e22
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend
@@ -0,0 +1,14 @@
+PRINC := "${@int(PRINC) + 1}"
+
+inherit systemd
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+SYSTEMD_OESCONS = "true"
+
+do_install_append() {
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+}
-- 
1.7.6.5



