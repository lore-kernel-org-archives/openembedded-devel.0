Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Sdq3s-0001fb-JT
	for openembedded-devel@lists.openembedded.org;
	Sun, 10 Jun 2012 23:52:40 +0200
Received: by mail-wg0-f43.google.com with SMTP id dr1so2267906wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Jun 2012 14:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=/SsGzAaCqsHVlKkmL7FWvGeZUVX4ilXHNWf7104u7JQ=;
	b=ZrCD5G9HmtoFYJFouC6Lwjp2bXoAU32rOPS8ED1brdJKvPK1eBcsAtadnPgODDrek5
	k2utH+VMhj5KHzso6y/I3sL+s6GgRVoW6xvBQR+jMgBksy/PdVyObw8p3j7ULO0Nhy77
	HR8vkNobh9aYdBe+sEHAHCxmrNGAiJpbaAPrFONpoTUK0h1M2EbS53BLIzfwAtk59ByS
	yjBzw4ygiNuN8IUKgIiV37jl44PrvoQGsbWkaoSYoaoOVGgyHE+0xCMxSRqI/DMof6+2
	Y1wavB4XNhBGZCVVlSsLqmjpqse94hZ54rwh77U3ROUBEbt7cSqh5j8tDa9hZep0gP/U
	4ORA==
Received: by 10.216.131.223 with SMTP id m73mr5656914wei.76.1339364529863;
	Sun, 10 Jun 2012 14:42:09 -0700 (PDT)
Received: from localhost.localdomain (p5B0A2104.dip.t-dialin.net. [91.10.33.4])
	by mx.google.com with ESMTPS id gc6sm19758306wib.0.2012.06.10.14.42.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 10 Jun 2012 14:42:09 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 10 Jun 2012 23:46:59 +0200
Message-Id: <1339364820-2880-27-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
References: <1339364820-2880-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [RFC, meta-oe 26/27] gpsd: move systemd support to meta-systemd
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
X-List-Received-Date: Sun, 10 Jun 2012 21:52:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Note: During build test it was discovered that bluez4 was added to RDEPENDS.
Maybe a conditional DEPENDS on bluez4 should be added for deterministic build
results.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |   13 ++++---------
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |   14 ++++----------
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb        |   14 ++++----------
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   14 ++++++++++++++
 .../recipes-navigation/gpsd/gpsd_3.5.bbappend      |   14 ++++++++++++++
 .../recipes-navigation/gpsd/gpsd_git.bbappend      |   14 ++++++++++++++
 6 files changed, 54 insertions(+), 29 deletions(-)
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
 create mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_git.bbappend

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 4f00cf4..a5c88a4 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
@@ -21,13 +21,12 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
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
@@ -37,7 +36,7 @@ EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
-  systemd='true' \
+  systemd='${SYSTEMD_OESCONS}' \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
@@ -81,10 +80,6 @@ do_install_append() {
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
     install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
 
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
 }
 
 pkg_postinst_${PN}-conf() {
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 60b30df..1adc68a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r1"
+PR = "r2"
 
 DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
@@ -22,13 +22,12 @@ SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
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
@@ -38,7 +37,7 @@ EXTRA_OESCONS = " \
   libQgpsmm='false' \
   debug='true' \
   strip='false' \
-  systemd='true' \
+  systemd='${SYSTEMD_OESCONS}' \
 "
 # this cannot be used, because then chrpath is not found and only static lib is built
 # target=${HOST_SYS}
@@ -81,11 +80,6 @@ do_install_append() {
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
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
new file mode 100644
index 0000000..1026e22
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
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
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
new file mode 100644
index 0000000..1026e22
--- /dev/null
+++ b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bbappend
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
1.7.4.4



