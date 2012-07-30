Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Svmly-0006ZC-M8
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jul 2012 12:00:22 +0200
Received: by bkcik5 with SMTP id ik5so2072480bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jul 2012 02:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=6X7Zg2kR0N5gBs64II/hB0LNthihgn23tSA7sN+WpgM=;
	b=0ADhnvqiLkojTl6K0kPSClM2Vz+SFOoPf1uE5muUyGbaaSe4t1R1wmR02HqgOn3UfW
	gRPwPc+n6jTvhAZJGv6PjA3vWmjcwJiAJjNiSmQ3DcwdIza5r8oyUgH3kxP88yDJzTYD
	hLGRedJaZu5RzPFjVbHg5se+jLEiOdYC+GadA+bKPHfHhaAI6YFPkIO8IwqKh2oekD7P
	MQD4tJvRwO86nT852MY6g5RuacIZkSRQWMX4flB/5ZwOlRg1BOiuZVZIQd2g6wPqpiyD
	c1YeoPAENJPfIrE4c3ExKvzdLU/ddqSVogP+gF2Rajq/5kHiJ3mS15Ewr9cNj96iK42D
	G0lw==
Received: by 10.204.156.68 with SMTP id v4mr3723109bkw.68.1343641726838;
	Mon, 30 Jul 2012 02:48:46 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c18sm3375044bkv.8.2012.07.30.02.48.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jul 2012 02:48:45 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 30 Jul 2012 11:48:33 +0200
Message-Id: <1343641713-16013-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1343478744.git.Martin.Jansa@gmail.com>
References: <cover.1343478744.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 6/6] gpsd: drop older version 3.4
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
X-List-Received-Date: Mon, 30 Jul 2012 10:00:22 -0000

* GNUtoo tested 3.5 and it works fine, Thanks

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...t-fix-DSO-build-for-ntpshm-garmin_monitor.patch |   41 -------
 ...prefix-includepy-with-sysroot-and-drop-sy.patch |   72 ------------
 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb        |  123 --------------------
 meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb        |    1 -
 .../recipes-navigation/gpsd/gpsd_3.4.bbappend      |   18 ---
 5 files changed, 0 insertions(+), 255 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
 delete mode 100644 meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
 delete mode 100644 meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend

diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
deleted file mode 100644
index 1aa4304..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From e1f780fc2355c22c2c3f0a70c1a1ef2669779c53 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 13:42:38 +0200
-Subject: [PATCH] SConstruct: fix DSO build for ntpshm, garmin_monitor
-
-| x86_64-oe-linux-gcc -m64
---sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64 -o gpsmon
---sysroot=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64
--Wl,-rpath=/OE/shr-core/tmp-eglibc/work/x86_64-oe-linux/gpsd/gpsd-3.4-r2/gpsd-3.4
--Wl,-rpath=/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib gpsmon.o
-monitor_italk.o monitor_nmea.o monitor_oncore.o monitor_sirf.o
-monitor_superstar2.o monitor_tnt.o monitor_ubx.o monitor_garmin.o -L.
--L/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/usr/lib
--L/OE/shr-core/tmp-eglibc/sysroots/qemux86-64/lib -lrt -lbluetooth
--lgpsd -lusb-1.0 -lbluetooth -lgps -lncurses -ltinfo
-
-/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/libexec/x86_64-oe-linux/gcc/x86_64-oe-linux/4.6.4/ld:
-* ntpshm.o: undefined reference to symbol 'log@@GLIBC_2.2.5'
-* monitor_garmin.o: undefined reference to symbol 'hypot@@GLIBC_2.2.5'
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- SConstruct |    4 ++--
- 1 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 7bd44a1..9ff00c1 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -806,7 +806,7 @@ if qt_env:
- # The libraries have dependencies on system libraries
- 
- gpslibs = ["-lgps"]
--gpsdlibs = ["-lgpsd"] + usblibs + bluezlibs + gpslibs
-+gpsdlibs = ["-lgpsd"] + ["-lm"] + usblibs + bluezlibs + gpslibs
- 
- # Source groups
- 
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch b/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
deleted file mode 100644
index 27c6aad..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd-3.4/0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-From bc224302f1665078c8d15138318709c1a1c2c0a0 Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Tue, 24 Apr 2012 18:45:14 +0200
-Subject: [PATCH] SConstruct: prefix includepy with sysroot and drop sysroot
- from python_lib_dir
-
-* without PYTHONPATH, distutil's sysconfig returns INCLUDEPY without sysroot prefix
-  and with PYTHONPATH from OE it's pointing to native python dir
-
-    $ export PYTHONPATH=/OE/shr-core/tmp-eglibc/sysroots/om-gta02/usr/lib/python2.7/
-    $ python
-    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
-    [GCC 4.6.2] on linux2
-    Type "help", "copyright", "credits" or "license" for more information.
-    >>> from distutils import sysconfig
-    >>> sysconfig.get_config_vars('INCLUDEPY')
-    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.7']
-    >>>
-    $ unset PYTHONPATH
-    $ python
-    Python 2.7.2 (default, Apr 18 2012, 09:19:59)
-    [GCC 4.6.2] on linux2
-    Type "help", "copyright", "credits" or "license" for more information.
-    >>> from distutils import sysconfig
-    >>> sysconfig.get_config_vars('INCLUDEPY')
-    ['/python2.7']
-    >>> import sysconfig
-    >>> sysconfig.get_config_vars('INCLUDEPY')
-    ['/OE/shr-core/tmp-eglibc/sysroots/x86_64-linux/usr/include/python2.7']
-* python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
-  returns path to target sysroot
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- SConstruct |    9 +++++++++
- 1 files changed, 9 insertions(+), 0 deletions(-)
-
-diff --git a/SConstruct b/SConstruct
-index 9ff00c1..9c0f751 100644
---- a/SConstruct
-+++ b/SConstruct
-@@ -924,6 +924,12 @@ else:
-         if vars[i] is None:
-             vars[i] = ""
-     (cc, cxx, opt, basecflags, ccshared, ldshared, so_ext, includepy) = vars
-+
-+    if env['sysroot']:
-+        print "Prefixing includepy '%s' with sysroot prefix" % includepy
-+        includepy = os.path.normpath("%s/%s/%s/%s" % (env['sysroot'], env['prefix'], env['includedir'], includepy))
-+        print "'%s'" % includepy
-+
-     # in case CC/CXX was set to the scan-build wrapper,
-     # ensure that we build the python modules with scan-build, too
-     if env['CC'] is None or env['CC'].find('scan-build') < 0:
-@@ -1158,11 +1164,14 @@ if not env['python']:
-     python_install = []
- else:
-     python_lib_dir = sysconfig.get_python_lib(plat_specific=1)
-+    python_lib_dir = python_lib_dir.replace(env['sysroot'], '')
-     python_module_dir = python_lib_dir + os.sep + 'gps'
-     python_extensions_install = python_env.Install( DESTDIR + python_module_dir,
-                                                     python_built_extensions)
-     if not env['debug'] or env['profiling']:
-         python_env.AddPostAction(python_extensions_install, '$STRIP $TARGET')
-+    env.AddPostAction(python_extensions_install, '$CHRPATH -r "%s" "$TARGET"' \
-+                     % (python_lib_dir, ))
- 
-     python_modules_install = python_env.Install( DESTDIR + python_module_dir,
-                                                 python_modules)
--- 
-1.7.8.5
-
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
deleted file mode 100644
index 16fa739..0000000
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bb
+++ /dev/null
@@ -1,123 +0,0 @@
-DESCRIPTION = "A TCP/IP Daemon simplifying the communication with GPS devices"
-SECTION = "console/network"
-LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d217a23f408e91c94359447735bc1800"
-DEPENDS = "dbus dbus-glib ncurses python libusb1 chrpath-native"
-PROVIDES = "virtual/gpsd"
-
-PR = "r4"
-
-SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
-  file://0001-SConstruct-fix-DSO-build-for-ntpshm-garmin_monitor.patch \
-  file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
-  file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
-  file://0004-SConstruct-remove-rpath.patch \
-  file://0001-SConstruct-prefix-includepy-with-sysroot-and-drop-sy.patch \
-  file://0001-SConstruct-disable-html-and-man-docs-building-becaus.patch \
-  file://gpsd-default \
-  file://gpsd \
-  file://60-gpsd.rules \
-"
-SRC_URI[md5sum] = "c01353459faa68834309109d4e868460"
-SRC_URI[sha256sum] = "79f7de9ead63c7f5d2c9a92e85b5f82e53323c4d451ef8e27ea265ac3ef9a70f"
-
-inherit scons update-rc.d python-dir pythonnative
-
-INITSCRIPT_NAME = "gpsd"
-INITSCRIPT_PARAMS = "defaults 35"
-
-SYSTEMD_OESCONS ??= "false"
-
-export STAGING_INCDIR
-export STAGING_LIBDIR
-
-EXTRA_OESCONS = " \
-  sysroot=${STAGING_DIR_TARGET} \
-  libQgpsmm='false' \
-  debug='true' \
-  strip='false' \
-  systemd='${SYSTEMD_OESCONS}' \
-"
-# this cannot be used, because then chrpath is not found and only static lib is built
-# target=${HOST_SYS}
-
-do_compile_prepend() {
-    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
-    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
-    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
-
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
-}
-
-do_install() {
-    export PKG_CONFIG_PATH="${PKG_CONFIG_PATH}"
-    export PKG_CONFIG="PKG_CONFIG_SYSROOT_DIR=\"${PKG_CONFIG_SYSROOT_DIR}\" pkg-config"
-    export STAGING_PREFIX="${STAGING_DIR_HOST}/${prefix}"
-
-    export BUILD_SYS="${BUILD_SYS}"
-    export HOST_SYS="${HOST_SYS}"
-
-    export DESTDIR="${D}"
-    # prefix is used for RPATH and DESTDIR/prefix for instalation
-    ${STAGING_BINDIR_NATIVE}/scons prefix=${prefix} install ${EXTRA_OESCONS}|| \
-      bbfatal "scons install execution failed."
-}
-
-do_install_append() {
-    install -d ${D}/${sysconfdir}/init.d
-    install -m 0755 ${WORKDIR}/gpsd ${D}/${sysconfdir}/init.d/
-    install -d ${D}/${sysconfdir}/default
-    install -m 0644 ${WORKDIR}/gpsd-default ${D}/${sysconfdir}/default/gpsd.default
-
-    #support for udev
-    install -d ${D}/${sysconfdir}/udev/rules.d
-    install -m 0644 ${WORKDIR}/60-gpsd.rules ${D}/${sysconfdir}/udev/rules.d
-    install -d ${D}${base_libdir}/udev/
-    install -m 0755 ${S}/gpsd.hotplug ${D}${base_libdir}/udev/
-
-    #support for python
-    install -d ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-    install -m 755 ${S}/gps/*.py ${D}/${PYTHON_SITEPACKAGES_DIR}/gps
-}
-
-pkg_postinst_${PN}-conf() {
-	update-alternatives --install ${sysconfdir}/default/gpsd gpsd-defaults ${sysconfdir}/default/gpsd.default 10
-}
-
-pkg_postrm_${PN}-conf() {
-	update-alternatives --remove gpsd-defaults ${sysconfdir}/default/gpsd.default
-}
-
-PACKAGES =+ "libgps libgpsd python-pygps-dbg python-pygps gpsd-udev gpsd-conf gpsd-gpsctl gps-utils"
-
-FILES_gpsd-dev += "${libdir}/pkgconfdir/libgpsd.pc ${libdir}/pkgconfdir/libgps.pc"
-
-FILES_python-pygps-dbg += " ${libdir}/python*/site-packages/gps/.debug"
-
-RDEPENDS_${PN} = "gpsd-gpsctl"
-RRECOMMENDS_${PN} = "gpsd-conf gpsd-udev"
-
-DESCRIPTION_gpsd-udev = "udev relevant files to use gpsd hotplugging"
-FILES_gpsd-udev = "${base_libdir}/udev ${sysconfdir}/udev/*"
-RDEPENDS_gpsd-udev += "udev gpsd-conf"
-
-DESCRIPTION_libgpsd = "C service library used for communicating with gpsd"
-FILES_libgpsd = "${libdir}/libgpsd.so.*"
-
-DESCRIPTION_libgps = "C service library used for communicating with gpsd"
-FILES_libgps = "${libdir}/libgps.so.*"
-
-DESCRIPTION_gpsd-conf = "gpsd configuration files and init scripts"
-FILES_gpsd-conf = "${sysconfdir}"
-
-DESCRIPTION_gpsd-gpsctl = "Tool for tweaking GPS modes"
-FILES_gpsd-gpsctl = "${bindir}/gpsctl"
-
-DESCRIPTION_gps-utils = "Utils used for simulating, monitoring,... a GPS"
-FILES_gps-utils = "${bindir}/*"
-RDEPENDS_gps-utils = "python-pygps"
-
-DESCRIPTION_python-pygps = "Python bindings to gpsd"
-FILES_python-pygps = "${PYTHON_SITEPACKAGES_DIR}/*"
-RDEPENDS_python-pygps = "python-core python-curses gpsd python-json"
diff --git a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
index 1b1809f..568d492 100644
--- a/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
+++ b/meta-oe/recipes-navigation/gpsd/gpsd_3.5.bb
@@ -7,7 +7,6 @@ PROVIDES = "virtual/gpsd"
 
 PR = "r4"
 
-DEFAULT_PREFERENCE = "-1"
 SRC_URI = "http://download.savannah.gnu.org/releases/${PN}/${P}.tar.gz \
   file://0001-SConstruct-respect-sysroot-setting-when-prepending-L.patch \
   file://0002-SConstruct-respect-sysroot-also-in-SPLINTOPTS.patch \
diff --git a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend b/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
deleted file mode 100644
index 9504761..0000000
--- a/meta-systemd/meta-oe/recipes-navigation/gpsd/gpsd_3.4.bbappend
+++ /dev/null
@@ -1,18 +0,0 @@
-PRINC := "${@int(PRINC) + 1}"
-
-inherit systemd
-
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-SRC_URI += "file://gpsd.service"
-
-SYSTEMD_PACKAGES = "${PN}-systemd"
-SYSTEMD_SERVICE = "${PN}.socket"
-SYSTEMD_OESCONS = "true"
-
-do_install_append() {
-    #support for systemd
-    install -d ${D}${systemd_unitdir}/system/
-    install -m 0644 ${WORKDIR}/${PN}.service ${D}${systemd_unitdir}/system/${PN}.service
-    install -m 0644 ${S}/systemd/${PN}.socket ${D}${systemd_unitdir}/system/${PN}.socket
-}
-- 
1.7.8.6



