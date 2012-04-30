Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKT-0004G7-RE
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:25 +0200
Received: by mail-wi0-f177.google.com with SMTP id hj13so2124807wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QVCgexLHMlSJ5sbdaUzNpwy5Xqaf7gSVc/Y5rlRiYsY=;
	b=pTh/n5I6W2d7PKvyAqEErKfyNiTCuX5Ks7k2xnBZrN/bbP3dIW336rLlDVgj7WAlqR
	H1aAhumc4//Ev0ONnxTcNnqjHobdtXgdI9soXx5XaEci/Cdw700AGmRgkXKkgpe26lwi
	vJrDj3rV0PkMaD8ri3WzHluf9/rFpOHPdvOJ/eJWg+ss9zc9pLlyWZdBLF7WpXnBRpfx
	RLXfwsQmB8B7x5mmAA0xm5kQgyAkIxdqVu656OpRooWubETy+5Dr0sGAenj1NAvtvKrO
	dUv9hK9hZFArsZP3N4zjhx301W77I5J/TFgBHKBUyeZ1iAz/uX6cxi0zEe2tju2SlHNy
	tcRw==
Received: by 10.180.75.241 with SMTP id f17mr26210477wiw.11.1335767626642;
	Sun, 29 Apr 2012 23:33:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id l5sm26418870wia.11.2012.04.29.23.33.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:33:43 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:00 +0200
Message-Id: <054be7129a1fb427cde94be2c3044f25e359f6bc.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 03/16] gpsd-3.4: minor style issues
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:25 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb |   29 ++++++++++++--------------
 1 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 972871a..0e67555 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -5,16 +5,15 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
 DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r0"
-
-SRC_URI = "http://download.savannah.gnu.org/releases/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
-           file://gpsd-default \
-           file://gpsd \
-           file://gpsd.socket \
-           file://gpsd.service \
-           file://60-gpsd.rules"
-SRC_URI[gpsd.md5sum] = "c01353459faa68834309109d4e868460"
-SRC_URI[gpsd.sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
+SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
+  file://gpsd-default \
+  file://gpsd \
+  file://gpsd.socket \
+  file://gpsd.service \
+  file://60-gpsd.rules \
+"
+SRC_URI[md5sum] = "c01353459faa68834309109d4e868460"
+SRC_URI[sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
 
 inherit scons update-rc.d python-dir systemd
 
@@ -24,7 +23,6 @@ INITSCRIPT_PARAMS = "defaults 35"
 SYSTEMD_PACKAGES = "${PN}-systemd"
 SYSTEMD_SERVICE = "${PN}.socket"
 
-
 LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
@@ -66,13 +64,10 @@ do_install_append() {
     install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-    install -d ${D}${base_libdir}/udev/
 
     #support for python
     install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-    for f in ${S}/gps/* ;do
-        install $f ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-    done
+    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
 }
 
 pkg_postinst_${PN}-conf() {
@@ -80,11 +75,13 @@ pkg_postinst_${PN}-conf() {
 }
 
 pkg_postrm_${PN}-conf() {
-	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default	
+	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
 }
 
 PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
 
+FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+
 FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
 
 RDEPENDS_${PN} = "gpsd-gpsctl"
-- 
1.7.8.6



