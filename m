Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SOkLZ-00052p-LW
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Apr 2012 08:44:33 +0200
Received: by wibhj13 with SMTP id hj13so2125563wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Apr 2012 23:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=+YWMOaYLG/d4QqUkuAH/r+NX/p/iX57xzUAx6eNTkYY=;
	b=RxlWYrzN80Y1RLZbCIulGektb82w3NSLyTyHeVcZnsQbN++FoAcbC3U1O476QCXWI1
	4Fxs5ywB3LB4hT22BFJ/GtSdJpbrjxFZZtdEgDGpOi/gFaS652phVb8E6z5NbImxkj6A
	V6r/TxCG4dS5o+6zVw2vRJsOQ1KsCHS6smn3z/tH9J/jwLMJXElP7PvicHi/tiy5vbfz
	UlnYig93uScU7icz6BxmHCN0HH+Ys1Q1X7gzmSEDjyYSlADxwhaMAukXtR4+HeiZnxyK
	wq77lBR0y8yg2x9asctiQBP/YmWpmRJRiRxblZQNxmQqV1ZOnJ/iOSbnKZLKFAIS4QXy
	2nEQ==
Received: by 10.216.136.100 with SMTP id v78mr7729995wei.88.1335767691611;
	Sun, 29 Apr 2012 23:34:51 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ca3sm26401994wib.6.2012.04.29.23.34.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 29 Apr 2012 23:34:50 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Apr 2012 08:33:09 +0200
Message-Id: <e0daf8c15aee69422a5229436473accbf28bd119.1335767139.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1335767139.git.Martin.Jansa@gmail.com>
References: <cover.1335767139.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 12/16] gpsd: add git recipe with negative D_P for tests
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
X-List-Received-Date: Mon, 30 Apr 2012 06:44:33 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-navigation/gpsd/gpsd_git.bb |  129 +++++++++++++++++++++++++++
 1 files changed, 129 insertions(+), 0 deletions(-)
 create mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_git.bb

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_git.bb b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
new file mode 100644
index 0000000..8bb0d3e
--- /dev/null
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_git.bb
@@ -0,0 +1,129 @@
+DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
+SECTION = "console/network"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
+DEPENDS = "dbus dbus-glib ncurses python libusb1"
+PROVIDES = "virtual/gpsd"
+
+SRCREV = "f8744f4af8cef211de698df5d8e6caddfe33f29d"
+
+DEFAULT_PREFERENCE = "-1"
+PV = "3.5+gitr${SRCPV}"
+
+SRC_URI = "git://git.sv.gnu.org/gpsd.git;protocol=git;branch=master \
+  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
+  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
+  file://0003-Revert-The-strptime-prototype-is-not-provided-unless.patch \
+  file://0004-SConstruct-remove-rpath.patch \
+  file://gpsd-default \
+  file://gpsd \
+  file://60-gpsd.rules \
+"
+S = "${WORKDIR}/git"
+
+inherit scons update-rc.d python-dir systemd
+
+INITSCRIPT_NAME = "gpsd"
+INITSCRIPT_PARAMS = "defaults 35"
+
+SYSTEMD_PACKAGES = "${PN}-systemd"
+SYSTEMD_SERVICE = "${PN}.socket"
+
+export STAGING_INCDIR
+export STAGING_LIBDIR
+
+EXTRA_OESCONS = " \
+  sysroot=${STAGING_DIR_TARGET} \
+  libQgpsmm='false' \
+  debug='true' \
+  strip='false' \
+  systemd='true' \
+"
+# this cannot be used, because then chrpath is not found and only static lib is built
+# target=${HOST_SYS}
+
+do_compile_prepend() {
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+}
+
+do_install() {
+    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
+    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
+    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
+
+    export BUILD_SYS="${BUILD_SYS}"
+    export HOST_SYS="${HOST_SYS}"
+
+    export DESTDIR="${D}"
+    # prefix is used for RPATH and DESTDIR/prefix for instalation
+    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
+      bbfatal "scons install execution failed."
+}
+
+do_install_append() {
+    install -d ${D}/${sysconfdir}/init.d
+    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
+    install -d ${D}/${sysconfdir}/default
+    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
+
+    #support for udev
+    install -d ${D}/${sysconfdir}/udev/rules.d
+    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
+    install -d ${D}${base_libdir}/udev/
+    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
+
+    #support for python
+    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
+
+    #support for systemd
+    install -d ${D}${systemd_unitdir}/system/
+    install -m 0644 ${S}/systemd/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
+    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
+}
+
+pkg_postinst_${PN}-conf() {
+	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
+}
+
+pkg_postrm_${PN}-conf() {
+	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
+}
+
+PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
+
+FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
+
+FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
+
+RDEPENDS_${PN} = "gpsd-gpsctl"
+RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
+
+DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
+FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
+RDEPENDS_gpsd-udev += "udev gpsd-conf"
+
+DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
+FILES_libgpsd = "${libdir}/libgpsd.so.*"
+
+DESCRIPTION_libgps = "C service library used for communicating with gpsd"
+FILES_libgps = "${libdir}/libgps.so.*"
+
+DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
+FILES_gpsd-conf = "${sysconfdir}"
+
+DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
+FILES_gpsd-gpsctl = "${bindir}/gpsctl"
+
+DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
+FILES_gps-utils = "${bindir}/*"
+RDEPENDS_gps-utils = "python-pygps"
+
+DESCRIPTION_python-pygps = "Python bindings to gpsd"
+FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
+RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
-- 
1.7.8.6



