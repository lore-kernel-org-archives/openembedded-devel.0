Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkKC-0004B2-Nl
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:43:08 +0200
Received: by wibhj13 with SMTP id hj13so2042278wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=fNs884SRQExPGPXLobSF0PzvwDabZtoTZXWNaRfJAv0=;
	b=lqRpNyAO81K3ZWiRtggagQM3Av8koKNMliFKrksCOvuZ2k7xQ4Ce6HqP+ip6NUs32U
	v5KlUjVy9GqbvTD2pYwU4EcimULOn+x0aSU0NHp0PriUHRBNDl5ic+9x7jjcBbLwXHVz
	oXNIkxMwzgNcyc8LW473hVwOmE+et3Z9YkMRmte3dmkVP5rq5r4JXY49wmu4O24AD2+X
	yDLFOMTzBPXHY31JiddCztJn6l9tmEWzP4bU9pYgtR3odXhbPDsBREPij3f83R4TjggE
	rGBIWMG5zChKTbmwMoA7iuGLpNsegUAtXWIdUH9lekZVOJgz9eJ/S4KyZHKYL8ZJ6A4x
	KCAQ==
Received: by 10.216.201.5 with SMTP id a5mr8084517weo.20.1335767607324;
	Sun, 29 Apr 2012 23:33:27 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n20sm41894695wiw.5.2012.04.29.23.33.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:33:26 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:32:58 +0200
Message-Id: <38dac2ac3d37b81985646aa9a4908b2a1633f203.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 01/16] gpsd: update to 3.4
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
X-List-Received-Date: Mon, 30 Apr 2012 06:43:08 -0000

From: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../gpsd/{gpsd-2.96 => gpsd-3.4}/60-gpsd.rules     |    0
 .../gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd              |    0
 .../gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd-default      |    0
 .../gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd.service      |    0
 .../gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd.socket       |    0
 .../gpsd/{gpsd_2.96.bb => gpsd_3.4.bb}             |   49 +++++++++++---------
 6 files changed, 27 insertions(+), 22 deletions(-)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd-3.4}/60-gpsd.rules (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd-default (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd.service (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd-2.96 => gpsd-3.4}/gpsd.socket (100%)
 rename meta-oe/recipes-navigation/gpsd/{gpsd_2.96.bb => gpsd_3.4.bb} (74%)

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/60-gpsd.rules b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/60-gpsd.rules
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.96/60-gpsd.rules
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.4/60-gpsd.rules
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd-default b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd-default
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd-default
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd-default
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.service
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.service
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.service
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.socket
similarity index 100%
rename from meta-oe/recipes-navigation/gpsd/gpsd-2.96/gpsd.socket
rename to meta-oe/recipes-navigation/gpsd/gpsd-3.4/gpsd.socket
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
similarity index 74%
rename from meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
rename to meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
index 7e2a96c..972871a 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_2.96.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
@@ -2,27 +2,21 @@ DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
 SECTION = "console/network"
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus-glib ncurses python libusb1"
+DEPENDS = "dbus dbus-glib ncurses python libusb1"
 PROVIDES = "virtual/gpsd"
 
-PR = "r3"
+PR = "r0"
 
-EXTRA_OECONF = "--x-includes=${STAGING_INCDIR}/X11 \
-                --x-libraries=${STAGING_LIBDIR} \
-                --enable-dbus \
-                --disable-libQgpsmm \
-"
-
-SRC_URI = "http://download.berlios.de/${PN}/${P}bis.tar.gz;name=gpsd \
+SRC_URI = "http://download.savannah.gnu.org/releases/gpsd/gpsd-${PV}.tar.gz;name=gpsd \
            file://gpsd-default \
            file://gpsd \
            file://gpsd.socket \
            file://gpsd.service \
            file://60-gpsd.rules"
-SRC_URI[gpsd.md5sum] = "52b00cab0fb34bbf1923ae35c7ced6c4"
-SRC_URI[gpsd.sha256sum] = "c6d72565bc06b802c749e69808eb7c6ee165962dc17383971c9001b5e1763690"
+SRC_URI[gpsd.md5sum] = "c01353459faa68834309109d4e868460"
+SRC_URI[gpsd.sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
 
-inherit autotools update-rc.d python-dir systemd
+inherit scons update-rc.d python-dir systemd
 
 INITSCRIPT_NAME = "gpsd"
 INITSCRIPT_PARAMS = "defaults 35"
@@ -35,22 +29,28 @@ LDFLAGS += "-L${STAGING_LIBDIR} -lm"
 export STAGING_INCDIR
 export STAGING_LIBDIR
 
-TARGET_CC_ARCH += "${LDFLAGS}"
+CC += "${LDFLAGS}"
 
-do_configure_prepend() {
-    # skip first
-    sed -i "s#for pylibpath in '/usr/lib'#for pylibpath in #g" ${S}/configure.ac
-    # disable xmlto, in case xsltproc doesn't work xmlto is used and fails 
-    sed -i "s#AC_CHECK_PROG(WITH_XMLTO#AC_CHECK_PROG(WITH_XMLTO_DISABLED_IN_OE#g" ${S}/configure.ac
-}
+EXTRA_OESCONS = " \
+  libQgpsmm='false' \
+  debug='true' \
+  strip='false' \
+  systemd='true' \
+  pkgconfig='${PKG_CONFIG_DIR}' \
+"
 
 do_compile_prepend() {
+    export LIBPATH="${STAGING_LIBDIR}"
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
-	find ${S} -name "*.so" -exec rm -f {} \;
 }
 
 do_install_prepend() {
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
     export BUILD_SYS="${BUILD_SYS}"
     export HOST_SYS="${HOST_SYS}"
 }
@@ -67,7 +67,12 @@ do_install_append() {
     install -d ${D}${base_libdir}/udev/
     install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
     install -d ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug.wrapper ${D}${base_libdir}/udev/
+
+    #support for python
+    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+    for f in ${S}/gps/* ;do
+        install $f ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+    done
 }
 
 pkg_postinst_${PN}-conf() {
@@ -95,7 +100,7 @@ FILES_libgpsd = "${libdir}/libgpsd.so.*"
 DESCRIPTION_libgps = "C service library used for communicating with gpsd"
 FILES_libgps = "${libdir}/libgps.so.*"
 
-DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts" 
+DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
 FILES_gpsd-conf = "${sysconfdir}"
 
 DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
-- 
1.7.8.6



