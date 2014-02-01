Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f54.google.com (mail-ee0-f54.google.com [74.125.83.54])
	by mail.openembedded.org (Postfix) with ESMTP id 60D306EA39
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  1 Feb 2014 07:34:13 +0000 (UTC)
Received: by mail-ee0-f54.google.com with SMTP id e53so2691346eek.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Jan 2014 23:34:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MqjPxc0VQazF7rDYuwNA03tuWdaOSY3Fc41FhGjEUuI=;
	b=VTVnzzX+ZBrD9paheDCSS/9zwoTzRj3H8KpMmW2uY+/lMDr2jh4uNOGcIZALSJDT9l
	TEWtutxaEGexGlY4j2Q+wc6v/Ho79RWb9xHLfdIRzHYRnrSnNU6pVLMoaIMPBG1VOOTa
	9wlZ8xzWD2vLvdD91mZZTk7ZxD8jb/001vWz4h0A8k5C2by6VJNpzwfFDqnjbIkrWWrP
	TovRJAWU1DNRJ3eoVIgLkTqxdLCKJQ+gaiXUef0Q78XRWGTeCJqXoccpN+JPHEaBdg2K
	6ENJlaf/lVRyxQdA911OiPdP6jMq/ARZKPVZDV83Jo+a1aZ/JmGLcurG47nVIOGBSxRh
	EOsg==
X-Received: by 10.14.126.9 with SMTP id a9mr220495eei.95.1391240053851;
	Fri, 31 Jan 2014 23:34:13 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id g1sm46216207eet.6.2014.01.31.23.34.12
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Jan 2014 23:34:13 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  1 Feb 2014 08:33:57 +0100
Message-Id: <e32f59b6d92dfb94c403d821744453b55520d577.1391239970.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1391239970.git.Martin.Jansa@gmail.com>
References: <cover.1391239970.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/20] efl: upgrade from separate recipes to shared efl-1.8.5
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
X-List-Received-Date: Sat, 01 Feb 2014 07:34:14 -0000

* eina, evas, eio, efreet, edbus2, ecore, ethumb, emotion, embryo, edje
  are now built from single source tree
* announcements:
  efl & friends
  http://sourceforge.net/mailarchive/message.php?msg_id=31733071
  EFL 1.8.4 release
  http://sourceforge.net/mailarchive/message.php?msg_id=31826305
  EFL 1.8.5 release
  http://sourceforge.net/mailarchive/message.php?msg_id=31895179

* be aware that upgrade-path wont probably work correctly
  and that you have to manually cleanup your sysroots before
  migrating to new shared efl recipe, for details see
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/conf/layer.conf                           |   1 +
 meta-efl/recipes-efl/efl/ecore_1.7.9.bb            | 124 --------------
 meta-efl/recipes-efl/efl/edbus2.inc                |  11 --
 meta-efl/recipes-efl/efl/edbus2_svn.bb             |  14 --
 meta-efl/recipes-efl/efl/edje_1.7.9.bb             |  72 ---------
 meta-efl/recipes-efl/efl/eet_1.7.9.bb              |  30 ----
 meta-efl/recipes-efl/efl/eeze_1.7.9.bb             |  23 ---
 meta-efl/recipes-efl/efl/efl.inc                   | 145 +++++++++++++++++
 ...igure.ac-Don-t-check-for-Xprint-extension.patch |  27 ++++
 meta-efl/recipes-efl/efl/efl_1.8.5.bb              |  17 ++
 meta-efl/recipes-efl/efl/efreet_1.7.9.bb           |  22 ---
 meta-efl/recipes-efl/efl/eina_1.7.9.bb             |  19 ---
 meta-efl/recipes-efl/efl/eio_1.7.9.bb              |  15 --
 meta-efl/recipes-efl/efl/embryo_1.7.9.bb           |  20 ---
 meta-efl/recipes-efl/efl/emotion_1.7.9.bb          |  22 ---
 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb           |  27 ----
 ...s_font_load-Fix-build-with-newer-freetype.patch |  26 ---
 meta-efl/recipes-efl/efl/evas_1.7.9.bb             | 178 ---------------------
 18 files changed, 190 insertions(+), 603 deletions(-)
 delete mode 100644 meta-efl/recipes-efl/efl/ecore_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edbus2.inc
 delete mode 100644 meta-efl/recipes-efl/efl/edbus2_svn.bb
 delete mode 100644 meta-efl/recipes-efl/efl/edje_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eet_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eeze_1.7.9.bb
 create mode 100644 meta-efl/recipes-efl/efl/efl.inc
 create mode 100644 meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
 create mode 100644 meta-efl/recipes-efl/efl/efl_1.8.5.bb
 delete mode 100644 meta-efl/recipes-efl/efl/efreet_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eina_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/eio_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/embryo_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/emotion_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
 delete mode 100644 meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch
 delete mode 100644 meta-efl/recipes-efl/efl/evas_1.7.9.bb

diff --git a/meta-efl/conf/layer.conf b/meta-efl/conf/layer.conf
index fb9a7ce..5ed7bd6 100644
--- a/meta-efl/conf/layer.conf
+++ b/meta-efl/conf/layer.conf
@@ -9,4 +9,5 @@ BBFILE_PATTERN_efl-layer := "^${LAYERDIR}/"
 BBFILE_PRIORITY_efl-layer = "7"
 
 E_MIRROR = "http://download.enlightenment.org/releases"
+E_RELEASES = "http://download.enlightenment.org/rel"
 E_SVN = "svn://svn.enlightenment.org/svn/e"
diff --git a/meta-efl/recipes-efl/efl/ecore_1.7.9.bb b/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
deleted file mode 100644
index c34eb27..0000000
--- a/meta-efl/recipes-efl/efl/ecore_1.7.9.bb
+++ /dev/null
@@ -1,124 +0,0 @@
-DESCRIPTION = "Ecore is the Enlightenment application framework library"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d6ff2c3c85de2faf5fd7dcd9ccfc8886"
-DEPENDS = "virtual/libiconv tslib curl eet evas glib-2.0 gnutls \
-           libxtst libxcomposite libxinerama libxscrnsaver libxdamage libxrandr libxcursor libxfixes"
-DEPENDS_virtclass-native = "eet-native evas-native gettext-native"
-# optional
-# DEPENDS += "directfb virtual/libsdl openssl virtual/libiconv"
-
-inherit efl gettext
-
-BBCLASSEXTEND = "native"
-
-do_configure_prepend() {
-    touch ${S}/po/Makefile.in.in || true
-    sed -i -e 's: po::g' ${S}/Makefile.am
-}
-
-FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
-
-PACKAGES =+ "\
-    ${PN}-con \
-    ${PN}-config \
-    ${PN}-desktop \
-    ${PN}-directfb \
-    ${PN}-sdl \
-    ${PN}-evas \
-    ${PN}-fb \
-    ${PN}-file \
-    ${PN}-imf-evas \
-    ${PN}-imf \
-    ${PN}-ipc \
-    ${PN}-job \
-    ${PN}-txt \
-    ${PN}-x \
-    ${PN}-input \
-"
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} = "${libdir}/libecore*.so.* \
-    ${bindir} \
-"
-FILES_${PN}-con = "${libdir}/libecore_con*.so.*"
-FILES_${PN}-config = "${libdir}/libecore_config*.so.*"
-FILES_${PN}-desktop = "${libdir}/libecore_desktop*.so.*"
-FILES_${PN}-directfb = "${libdir}/libecore_directfb*.so.*"
-FILES_${PN}-sdl = "${libdir}/libecore_sdl*.so.*"
-FILES_${PN}-evas = "${libdir}/libecore_evas*.so.*"
-FILES_${PN}-fb = "${libdir}/libecore_fb*.so.*"
-FILES_${PN}-file = "${libdir}/libecore_file*.so.*"
-FILES_${PN}-imf = "${libdir}/libecore_imf*.so.* \
-    ${libdir}/ecore/immodules/*.so \
-"
-FILES_${PN}-imf-evas = "${libdir}/libecore_imf_evas*.so.*"
-FILES_${PN}-ipc = "${libdir}/libecore_ipc*.so.*"
-FILES_${PN}-job = "${libdir}/libecore_job*.so.*"
-FILES_${PN}-txt = "${libdir}/libecore_txt*.so.*"
-FILES_${PN}-x = "${libdir}/libecore_x*.so.*"
-FILES_${PN}-input = "${libdir}/libecore_input*.so.*"
-
-ECORE_OECONF = "\
-    --x-includes=${STAGING_INCDIR}/X11 \
-    --x-libraries=${STAGING_LIBDIR} \
-    --enable-simple-x11 \
-    --enable-ecore-config \
-    --enable-ecore-x \
-    --enable-ecore-job \
-    --enable-ecore-fb \
-    --enable-ecore-evas \
-    --enable-ecore-evas-software-16-x11 \
-    --enable-ecore-evas-xrender \
-    --enable-abstract-sockets \
-    --enable-ecore-con \
-    --enable-ecore-ipc \
-    --enable-ecore-file \
-    --enable-inotify \
-    --disable-ecore-desktop \
-    --disable-ecore-x-xcb \
-    --disable-ecore-x-xprint \
-    --disable-ecore-directfb \
-    --disable-ecore-sdl \
-    --enable-ecore-evas-opengl-x11 \
-    --disable-ecore-evas-dfb \
-    --disable-ecore-evas-sdl \
-    --disable-openssl \
-    --disable-poll \
-    --enable-xim \
-"
-
-EXTRA_OECONF = "${ECORE_OECONF} \
-                 --enable-curl \
-"
-
-EXTRA_OECONF_virtclass-native = "\
-                 ${ECORE_OECONF} \
-                 --disable-curl \
-                 --disable-ecore-x-composite \
-                 --disable-ecore-x-damage \
-                 --disable-ecore-x-dpms \
-                 --disable-ecore-x-randr \
-                 --disable-ecore-x-render \
-                 --disable-ecore-x-screensaver \
-                 --disable-ecore-x-shape \
-                 --disable-ecore-x-sync \
-                 --disable-ecore-x-xfixes \
-                 --disable-ecore-x-xinerama \
-                 --disable-ecore-x-xprint \
-                 --disable-ecore-x-xtest \
-                 --disable-ecore-x-cursor \
-                 --disable-ecore-x-input \
-                 --disable-ecore-x-dri \
-"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://fix-ecore-fb-initialization.patch \
-"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[wayland] = "--enable-ecore-wayland,--disable-ecore-wayland,wayland xkbcommon"
-
-SRC_URI[md5sum] = "2d5a4fb8f702628f5c7b785309be01ab"
-SRC_URI[sha256sum] = "c145cc00280d3a310c76e5e6a9fb509c81b8b173f04458c97ea4ae6bf563eaf3"
diff --git a/meta-efl/recipes-efl/efl/edbus2.inc b/meta-efl/recipes-efl/efl/edbus2.inc
deleted file mode 100644
index 9b41d8b..0000000
--- a/meta-efl/recipes-efl/efl/edbus2.inc
+++ /dev/null
@@ -1,11 +0,0 @@
-DESCRIPTION = "DBus convenience wrappers for EFL"
-DEPENDS = "dbus ecore eina"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4ed65f801204783f71fedafc082038d9"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-INC_PR = "r0"
-
-SRCNAME = "edbus"
diff --git a/meta-efl/recipes-efl/efl/edbus2_svn.bb b/meta-efl/recipes-efl/efl/edbus2_svn.bb
deleted file mode 100644
index e87f147..0000000
--- a/meta-efl/recipes-efl/efl/edbus2_svn.bb
+++ /dev/null
@@ -1,14 +0,0 @@
-require ${BPN}.inc
-
-SRCREV = "${EFL_SRCREV}"
-PV = "1.7.99+svnr${SRCPV}"
-PR = "${INC_PR}.2"
-DEFAULT_PREFERENCE = "-1"
-
-SRC_URI = "\
-    ${E_SVN}/trunk/IN-EFL;module=${SRCNAME};protocol=http;scmdata=keep \
-"
-S = "${WORKDIR}/${SRCNAME}"
-
-PACKAGES =+ "${PN}-utils"
-FILES_${PN}-utils = "${bindir}/edbus-codegen"
diff --git a/meta-efl/recipes-efl/efl/edje_1.7.9.bb b/meta-efl/recipes-efl/efl/edje_1.7.9.bb
deleted file mode 100644
index 2e8c566..0000000
--- a/meta-efl/recipes-efl/efl/edje_1.7.9.bb
+++ /dev/null
@@ -1,72 +0,0 @@
-DESCRIPTION = "Edje is the Enlightenment graphical design & layout library"
-DEPENDS = "lua5.1 eet evas ecore embryo edje-native eina libsndfile1 eio"
-DEPENDS_virtclass-native = "lua5.1-native evas-native ecore-native eet-native embryo-native eina-native"
-DEPENDS_virtclass-nativesdk = "evas-native ecore-native eet-native embryo-native eina-native"
-# GPLv2 because of epp in PN-utils
-LICENSE = "MIT BSD GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=c18cc221a14a84b033db27794dc36df8"
-
-inherit efl
-
-BBCLASSEXTEND = "native nativesdk"
-
-do_configure_prepend_virtclass-native() {
-    sed -i 's:EMBRYO_PREFIX"/bin:"${STAGING_BINDIR}:' ${S}/src/bin/edje_cc_out.c
-    sed -i 's: cpp -I: /usr/bin/cpp -I:' ${S}/src/bin/edje_cc_parse.c
-    sed -i 's:\"gcc -I:\"/usr/bin/gcc -I:' ${S}/src/bin/edje_cc_parse.c
-}
-# The new lua stuff is a bit broken...
-do_configure_append() {
-    for i in $(find "${S}" -name "Makefile") ; do
-        sed -i -e 's:-L/usr/local/lib::g'  $i
-    done
-}
-
-do_compile_append() {
-    sed -i -e s:local/::g -e 's:-L${STAGING_LIBDIR}::g' ${S}/edje.pc
-}
-
-# gain some extra performance at the expense of RAM - generally i'd say bad
-# and a possible source of bugs
-#EXTRA_OECONF = "--enable-edje-program-cache"
-
-# Since r44323 edje has a fixed-point mode
-require edje-fpu.inc
-EXTRA_OECONF += "${@get_edje_fpu_setting(bb, d)}"
-
-SNDFILE = "--enable-sndfile"
-SNDFILE_virtclass-native = "--disable-sndfile"
-SNDFILE_virtclass-nativesdk = "--disable-sndfile"
-EXTRA_OECONF += "${SNDFILE}"
-
-PACKAGES =+ "${PN}-utils"
-RDEPENDS_${PN}-utils = "cpp cpp-symlinks embryo-tests"
-
-RRECOMMENDS_${PN}-utils = "\
-    evas-saver-png \
-    evas-saver-jpeg \
-    evas-saver-eet \
-"
-
-DEBIAN_NOAUTONAME_${PN}-utils = "1"
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN}-utils = "\
-    ${bindir}/edje_* \
-    ${bindir}/inkscape2edc \
-    ${libdir}/edje/utils/epp \
-    ${datadir}/edje/include/edje.inc \
-"
-
-FILES_${PN} += "${libdir}/${PN}/modules/*/*/module.so \
-                ${datadir}/mime/packages/edje.xml"
-FILES_${PN}-dev += "${libdir}/${PN}/modules/*/*/module.la"
-FILES_${PN}-dbg += "${libdir}/${PN}/modules/*/*/.debug"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "49152d8636aefcd028af0f97483391ef"
-SRC_URI[sha256sum] = "dac12e5fd81ab303151bec6742971b63f2de577ef940ed0b6af20419130300ab"
diff --git a/meta-efl/recipes-efl/efl/eet_1.7.9.bb b/meta-efl/recipes-efl/efl/eet_1.7.9.bb
deleted file mode 100644
index 9521e68..0000000
--- a/meta-efl/recipes-efl/efl/eet_1.7.9.bb
+++ /dev/null
@@ -1,30 +0,0 @@
-DESCRIPTION = "EET is the Enlightenment data storage library"
-DEPENDS = "pkgconfig zlib jpeg openssl eina gnutls"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=da947f414a2ca4323245f1abb1980953"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-
-EXTRA_OECONF = "\
-    --enable-openssl \
-    --enable-cypher \
-    --enable-signature \
-    --disable-coverage \
-    --enable-old-eet-file-format \
-    --disable-assert \
-"
-
-PACKAGES =+ "${PN}-utils"
-
-FILES_${PN}-utils = "\
-    ${bindir}/${PN} \
-"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "225eadf514465be321a44a003d687a55"
-SRC_URI[sha256sum] = "3345e0889bbc29536dbe0f6236ed1ae6a9d685b8e39877d5404fa6217bd12ec6"
diff --git a/meta-efl/recipes-efl/efl/eeze_1.7.9.bb b/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
deleted file mode 100644
index 7ae7fbb..0000000
--- a/meta-efl/recipes-efl/efl/eeze_1.7.9.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-DESCRIPTION = "Eeze is a library to simplify the use of devices"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=315521fe061b6fd4290ef01db714a3c8"
-DEPENDS = "ecore eet udev"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "${libdir}/enlightenment/utils/eeze_scanner"
-FILES_${PN}-dbg += "${libdir}/enlightenment/utils/.debug"
-
-RRECOMMENDS_${PN} += "eject"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "1e6119b4c12f2539ae5d191659652a89"
-SRC_URI[sha256sum] = "1b4b38943bfc564ddd18d4314a6a12af5ce656b551e69154e818ad14231050b8"
diff --git a/meta-efl/recipes-efl/efl/efl.inc b/meta-efl/recipes-efl/efl/efl.inc
new file mode 100644
index 0000000..2a8f2a2
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl.inc
@@ -0,0 +1,145 @@
+DESCRIPTION = "EFL"
+LICENSE = "MIT BSD LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a1809a807e39dd48ddcf7be98477d130"
+
+DEPENDS_class-native = "lua5.1-native freetype-native libxext-native libpng-native jpeg-native tiff-native libfribidi-native glib-2.0-native dbus-native"
+DEPENDS = "virtual/libiconv tslib curl glib-2.0 gnutls pkgconfig zlib jpeg openssl libsndfile1 lua5.1 dbus libexif librsvg freetype libpng tiff libxext virtual/libx11 libxrender fontconfig libfribidi giflib udev libxcursor libxcomposite libxinerama libxrandr libxtst libxscrnsaver efl-native"
+
+inherit efl gettext pkgconfig
+
+BBCLASSEXTEND = "native"
+
+PROVIDES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
+
+# we don't have bullet for physics
+EXTRA_OECONF = " \
+    --disable-physics \
+"
+EXTRA_OECONF_append_class-target = " \
+    --with-bin-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
+"
+EXTRA_OECONF_append_class-native = " \
+    --disable-fontconfig \
+    --disable-audio \
+    --with-x11=none \
+    --disable-image-loader-bmp \
+    --disable-image-loader-eet \
+    --disable-image-loader-generic \
+    --disable-image-loader-gif \
+    --disable-image-loader-ico \
+    --disable-image-loader-jp2k \
+    --disable-image-loader-pmaps \
+    --disable-image-loader-psd \
+    --disable-image-loader-tga \
+    --disable-image-loader-wbmp \
+    --disable-image-loader-webp \
+    --disable-image-loader-xpm \
+"
+
+PACKAGECONFIG ??= "opengl-es"
+PACKAGECONFIG_class-native = ""
+
+# sort of tri-state
+PACKAGECONFIG[opengl-full] = "--with-opengl=full,,virtual/libgl"
+PACKAGECONFIG[opengl-es] = "--with-opengl=es,,virtual/libgles2"
+PACKAGECONFIG[opengl-none] = "--with-opengl=none,,"
+# used only in ecore examples and supports only 0.10 now
+PACKAGECONFIG[gstreamer] = "--enable-gstreamer,--disable-gstreamer,gstreamer"
+PACKAGECONFIG[pulseaudio] = "--enable-pulseaudio,--disable-pulseaudio,pulseaudio"
+
+# new efl doesn't have option to disable eeze build and we don't want to provide udev-native just to build eeze-native we don't need
+do_configure_prepend_class-native() {
+    sed -i 's/EFL_LIB_START_OPTIONAL(\[Eeze\], \[test "${have_linux}" = "yes"\])/EFL_LIB_START_OPTIONAL([Eeze], [test "${no-we-really-dont-want-native-eeze}" = "yes"])/g' ${S}/configure.ac
+}
+
+PACKAGES += "ecore edje eet eeze efreet eina eio embryo emotion ethumb evas eldbus"
+RPROVIDES_edje += "edje-utils"
+
+python populate_packages_prepend () {
+    for plugin_type in "engines loaders savers".split():
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
+
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
+        description = 'Evas module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
+        
+        plugin_type = "cserve2"
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
+
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type + "-%s",
+        description = 'Evas csever2 loader module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
+}
+
+PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
+
+FILES_efreet = " \
+    ${libdir}/efreet/*/efreet*create \
+    ${bindir}/efreetd \
+    ${datadir}/efreet \
+"
+FILES_eet = " \
+    ${bindir}/eet \
+"
+FILES_emotion = " \
+    ${datadir}/emotion \
+"
+FILES_embryo = " \
+    ${datadir}/embryo \
+"
+FILES_ethumb = " \
+    ${bindir}/ethumbd \
+    ${bindir}/ethumb \
+    ${libdir}/ethumb/*/*/*/module.so \
+    ${libdir}/ethumb/*/*/*/*.edj \
+    ${libdir}/ethumb_client/utils/*/ethumbd_slave \
+    ${datadir}/ethumb* \
+"
+FILES_ecore = " \
+    ${libdir}/ecore*/*/*/*/module.so \
+    ${datadir}/ecore* \
+"
+FILES_evas = " \
+    ${libdir}/evas*/*/*/*/*/module.so \
+    ${libdir}/evas*/*/*/*/*/*.edj \
+    ${libdir}/evas/cserve2/bin/*/evas_cserve2* \
+    ${datadir}/evas* \
+"
+
+FILES_eeze = " \
+    ${libdir}/eeze*/*/*/*/*/module.so \
+    ${datadir}/eeze \
+"
+FILES_edje = " \
+    ${libdir}/edje*/*/*/*/module.so \
+    ${libdir}/edje/utils/*/epp \
+    ${datadir}/edje \
+    ${datadir}/mime \
+"
+FILES_${PN}-dbg += " \
+    ${libdir}/efreet/*/.debug \
+    ${libdir}/ecore*/*/*/*/.debug \
+    ${libdir}/evas*/*/*/*/*/.debug \
+    ${libdir}/evas/cserve2/bin/*/.debug \
+    ${libdir}/eeze*/*/*/*/*/.debug \
+    ${libdir}/edje*/*/*/*/.debug \
+    ${libdir}/edje/utils/*/.debug \
+    ${libdir}/ethumb/*/*/*/.debug \
+    ${libdir}/ethumb_client/utils/*/.debug \
+"
+FILES_${PN}-dev += " \
+    ${libdir}/cmake \
+    ${libdir}/ecore*/*/*/*/module.la \
+    ${libdir}/evas*/*/*/*/*/module.la \
+    ${libdir}/ethumb*/*/*/*/module.la \
+    ${libdir}/eeze*/*/*/*/*/module.la \
+    ${libdir}/edje*/*/*/*/module.la \
+    ${datadir}/gdb/auto-load \
+    ${datadir}/eo/gdb \
+    ${bindir}/eldbus-codegen \
+    ${bindir}/eina-bench-cmp \
+"
diff --git a/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch b/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
new file mode 100644
index 0000000..012810b
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl/0001-configure.ac-Don-t-check-for-Xprint-extension.patch
@@ -0,0 +1,27 @@
+From 7097b46383a6ec96662bf1bf0a04190a38d25a20 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 10 Jan 2014 17:07:13 +0100
+Subject: [PATCH] configure.ac: Don't check for Xprint extension
+
+* it's long gone
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0d8c4cc..0a08330 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2769,7 +2769,6 @@ if test "x${want_x11_xlib}" = "xyes" ; then
+    ECORE_CHECK_X_EXTENSION([Xdpms], [dpms.h], [Xext], [DPMSQueryExtension])
+    ECORE_CHECK_X_EXTENSION([Xfixes], [Xfixes.h], [Xfixes], [XFixesExpandRegion])
+    ECORE_CHECK_X_EXTENSION([Xinerama], [Xinerama.h], [Xinerama], [XineramaQueryScreens])
+-   ECORE_CHECK_X_EXTENSION([Xprint], [Print.h], [Xp], [XpQueryScreens])
+    ECORE_CHECK_X_EXTENSION([Xrandr], [Xrandr.h], [Xrandr], [XRRGetScreenResourcesCurrent])
+    ECORE_CHECK_X_EXTENSION([Xrender], [Xrender.h], [Xrender], [XRenderFindVisualFormat])
+    ECORE_CHECK_X_EXTENSION([Xtest], [XTest.h], [Xtst], [XTestFakeKeyEvent])
+-- 
+1.8.5.2
+
diff --git a/meta-efl/recipes-efl/efl/efl_1.8.5.bb b/meta-efl/recipes-efl/efl/efl_1.8.5.bb
new file mode 100644
index 0000000..cacae5f
--- /dev/null
+++ b/meta-efl/recipes-efl/efl/efl_1.8.5.bb
@@ -0,0 +1,17 @@
+require ${BPN}.inc
+
+SRC_URI = "\
+    ${E_RELEASES}/libs/${SRCNAME}/${SRCNAME}-${SRCVER}.tar.gz \
+"
+
+SRC_URI[md5sum] = "3d2c3ca2ff1a072b72ffab40ff598dfb"
+SRC_URI[sha256sum] = "7e514c0a972feea1c44c9074a4b58c14821d93dc91ff6f51066528f12ab42fe5"
+
+# Temporary disable until error like the one following are fixed
+# efl-native/2_1.8.4-r0/efl-1.8.4/src/lib/eet/.libs/libeet.so: file not recognized: File truncated
+# collect2: error: ld returned 1 exit status
+# x86_64-linux-libtool: install: error: relink `modules/evas/savers/tiff/module.la' with the above command before installing it
+# Makefile:11031: recipe for target 'install-savertiffpkgLTLIBRARIES' failed
+PARALLEL_MAKE = ""
+
+SRC_URI += "file://0001-configure.ac-Don-t-check-for-Xprint-extension.patch"
diff --git a/meta-efl/recipes-efl/efl/efreet_1.7.9.bb b/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
deleted file mode 100644
index 0d87eb7..0000000
--- a/meta-efl/recipes-efl/efl/efreet_1.7.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "The Enlightenment freedesktop.org library"
-DEPENDS = "ecore"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9594ec75c5a57e71fccedcbe10dd3ef4"
-
-inherit efl gettext
-
-PACKAGES =+ "${PN}-mime ${PN}-trash"
-FILES_${PN}-mime = "${libdir}/libefreet_mime.so.*"
-FILES_${PN}-trash = "${libdir}/libefreet_trash.so.*"
-
-# efreet_desktop_cache_create is needed for e-wm start, don't include it in -tests
-FILES_${PN} += "${libdir}/efreet/efreet_desktop_cache_create \
-                ${libdir}/efreet/efreet_icon_cache_create \
-"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "5972833cf78ca93440403b94ed4ed74d"
-SRC_URI[sha256sum] = "d5037c04ac8130879bf87d924e6b83cf479e7dee8235321ed1a49f97083b611b"
diff --git a/meta-efl/recipes-efl/efl/eina_1.7.9.bb b/meta-efl/recipes-efl/efl/eina_1.7.9.bb
deleted file mode 100644
index 3638123..0000000
--- a/meta-efl/recipes-efl/efl/eina_1.7.9.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-DESCRIPTION = "Eina is the Enlightenment data library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=9cc092d35d7bbfcd986232cde130a551"
-
-BBCLASSEXTEND = "native"
-
-inherit efl
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "${libdir}/eina"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "cddf2755e20bfb3f90764fd2b689b888"
-SRC_URI[sha256sum] = "b7fe26d98b80479d0f72be47b2584dfa243e4d18774cb824acc398354a45d520"
diff --git a/meta-efl/recipes-efl/efl/eio_1.7.9.bb b/meta-efl/recipes-efl/efl/eio_1.7.9.bb
deleted file mode 100644
index 5bf34b2..0000000
--- a/meta-efl/recipes-efl/efl/eio_1.7.9.bb
+++ /dev/null
@@ -1,15 +0,0 @@
-DESCRIPTION = "Enlightenment Input Output Library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=180fca752525726bd6ba021689509a08"
-DEPENDS = "ecore eina"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "f4d6cbd216a9ae5983fa8ee8dadf04cb"
-SRC_URI[sha256sum] = "35ce08ecf6afd5faa4fe857764537e15aede2b0d2c37922e55e97e2dff3352de"
diff --git a/meta-efl/recipes-efl/efl/embryo_1.7.9.bb b/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
deleted file mode 100644
index 08d7e49..0000000
--- a/meta-efl/recipes-efl/efl/embryo_1.7.9.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "The Enlightenment C-like scripting language for Edje"
-
-inherit efl
-
-LICENSE = "MIT BSD CompuPhase"
-LIC_FILES_CHKSUM = "file://COPYING;md5=220a7f1107df42c62428d8ebe559ed14"
-
-BBCLASSEXTEND = "native"
-
-DEPENDS += "eina"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "98614ec48376ff6d3a39187504b70ed4"
-SRC_URI[sha256sum] = "6b2739a53c3ab2fcf44edfb9c3a4c56d11aba91e27e556a9e70116a161201e34"
diff --git a/meta-efl/recipes-efl/efl/emotion_1.7.9.bb b/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
deleted file mode 100644
index b7e1b16..0000000
--- a/meta-efl/recipes-efl/efl/emotion_1.7.9.bb
+++ /dev/null
@@ -1,22 +0,0 @@
-DESCRIPTION = "The Enlightenment multimedia library"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=69f44058245ce5c596d56bb622d5dabd"
-# we no longer build the libxine backend, since the gstreamer backend seems more promising
-DEPENDS = "eet eeze evas ecore edje gstreamer gst-plugins-base eio"
-
-inherit efl
-
-EXTRA_OECONF = "--disable-xine --disable-generic-vlc --enable-gstreamer --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc"
-
-PACKAGES =+ "emotion-backend-gstreamer"
-FILES_emotion-backend-gstreamer = "${libdir}/emotion/*.so"
-RRECOMMENDS_${PN} = "emotion-backend-gstreamer"
-# upgrade path from libemotion0 to libemotion1
-RREPLACES_${PN} = "libemotion0"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "171bbc41a5e5d202d0dc57c34e318c14"
-SRC_URI[sha256sum] = "ff72204490e740adaa7980bad1a060dae8113c308c6083e5bcee380a11dad1f4"
diff --git a/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb b/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
deleted file mode 100644
index d0a5389..0000000
--- a/meta-efl/recipes-efl/efl/ethumb_1.7.9.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "EFL based thumbnail generation library"
-LICENSE = "LGPLv2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=e6a6db9e80255adbafa16e817d9a4d8c"
-DEPENDS = "libexif eet-native evas ecore edje eet edbus emotion epdf"
-
-inherit efl
-
-EXTRA_OECONF = "\
-    --with-edje-cc=${STAGING_BINDIR_NATIVE}/edje_cc \
-    --with-eet-eet=${STAGING_BINDIR_NATIVE}/eet \
-    --disable-docs \
-"
-
-# Some upgrade path tweaking, as in evas
-AUTO_LIBNAME_PKGS = ""
-
-FILES_${PN} += "\
-    ${bindir}/ethumbd \
-    ${libexecdir}/ethumbd_slave \
-"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-"
-
-SRC_URI[md5sum] = "d71a6fbcce2c6a8f46ea9b9b9d53cbab"
-SRC_URI[sha256sum] = "a97c39a9184ec7e1b352a7f251d97992b8082e3a0d6735ea1f34e4e40129a12f"
diff --git a/meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch b/meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch
deleted file mode 100644
index 0197f1c..0000000
--- a/meta-efl/recipes-efl/efl/evas/0001-evas_font_load-Fix-build-with-newer-freetype.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From ff5e8aa48d223401497dbaad1ffdc81977b2c09d Mon Sep 17 00:00:00 2001
-From: Martin Jansa <Martin.Jansa@gmail.com>
-Date: Wed, 1 Jan 2014 13:03:48 +0100
-Subject: [PATCH] evas_font_load: Fix build with newer freetype
-
-Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
----
- src/lib/engines/common/evas_font_load.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/lib/engines/common/evas_font_load.c b/src/lib/engines/common/evas_font_load.c
-index 805eaf8..6650816 100644
---- a/src/lib/engines/common/evas_font_load.c
-+++ b/src/lib/engines/common/evas_font_load.c
-@@ -5,7 +5,7 @@
- 
- #include "evas_font_private.h" /* for Frame-Queuing support */
- #include "evas_font_ot.h"
--#include <freetype/tttables.h> /* Freetype2 OS/2 font table. */
-+#include <freetype2/tttables.h> /* Freetype2 OS/2 font table. */
- 
- #ifdef EVAS_CSERVE2
- # include "../../cserve2/evas_cs2_private.h"
--- 
-1.8.4.3
-
diff --git a/meta-efl/recipes-efl/efl/evas_1.7.9.bb b/meta-efl/recipes-efl/efl/evas_1.7.9.bb
deleted file mode 100644
index 1b6c7b3..0000000
--- a/meta-efl/recipes-efl/efl/evas_1.7.9.bb
+++ /dev/null
@@ -1,178 +0,0 @@
-DESCRIPTION = "Evas is the Enlightenment canvas API"
-LICENSE = "MIT BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b9b25b03d63aa496552658c7e78b11a1"
-# can also depend on valgrind, libsdl-x11, directfb
-DEPENDS = "librsvg eina eet freetype jpeg libpng tiff virtual/libx11 libxext libxrender fontconfig libfribidi giflib"
-DEPENDS_virtclass-native = "freetype-native libxext-native libpng-native jpeg-native tiff-native eet-native eina-native libfribidi-native"
-
-inherit efl
-
-BBCLASSEXTEND = "native"
-FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
-
-python populate_packages_prepend () {
-    for plugin_type in "engines loaders savers".split():
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
-        description = 'Evas module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-        
-        plugin_type = "cserve2"
-        bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
-
-        do_split_packages(d, basedir, '^(.*)',
-        output_pattern = 'evas-' + plugin_type + "-%s",
-        description = 'Evas csever2 loader module %s',
-        allow_dirs=True, recursive=False, extra_depends="" )
-}
-
-do_install_append() {
-    find "${D}" -name .debug -type d -exec rm -rf {} \;
-}
-
-FILES_${PN}-dev += "${libdir}/evas/modules/*/*/*/*.a ${libdir}/evas/modules/*/*/*/*.la"
-FILES_${PN}-dbg += "${libdir}/evas/modules/*/*/*/.debug/ ${libdir}/evas/cserve2/loaders/*/*/.debug/"
-FILES_${PN}-cserve2 += "${libexecdir}/evas_cserve2* ${libexecdir}/dummy_slave"
-
-PACKAGES += "${PN}-cserve2"
-PACKAGES_DYNAMIC += "^evas-engine-.* ^evas-loader-.* ^evas-saver-.* ^evas-cserve2-.*"
-
-# evas-loader-svg is gone as we don't have esvg and probably won't have anytime soon
-# http://www.intesis.hr/news/16-esvg-source
-# http://blog.gmane.org/gmane.comp.window-managers.enlightenment.user/page=3
-RRECOMMENDS_${PN} += "evas-loader-generic evas-generic-loader-svn"
-
-RRECOMMENDS_${PN} += " \
-    evas-engine-fb \
-    evas-engine-software-generic \
-    evas-engine-software-x11 \
-    evas-engine-software-16 \
-    evas-engine-software-16-x11 \
-    evas-engine-xrender-x11 \
-    \
-    evas-loader-png \
-    evas-loader-jpeg \
-    evas-loader-gif \
-    evas-loader-svg \
-"
-
-# Some upgrade path tweaking
-AUTO_LIBNAME_PKGS = ""
-
-EVAS_CPU_TWEAKS = ""
-# Disabled for now, see http://thread.gmane.org/gmane.comp.window-managers.enlightenment.devel/25194
-EVAS_CPU_TWEAKS_armv7a = "--disable-cpu-neon"
-
-# common options
-EVAS_OECONF = " \
-                --x-includes=${STAGING_INCDIR}/X11 \
-                --x-libraries=${STAGING_LIBDIR} \
-                --enable-evas-magic-debug \
-                --enable-fb \
-                --disable-directfb \
-                --disable-sdl \
-                --enable-buffer=static \
-                --enable-static-software-generic \
-                --disable-software-ddraw \
-                --disable-software-qtopia \
-                --disable-software-xcb \
-                --disable-xrender-xcb \
-                --disable-glitz-x11 \
-                --enable-image-loader-eet=static \
-                --disable-image-loader-edb \
-                --enable-image-loader-png \
-                --enable-image-loader-jpeg \
-                --enable-image-loader-tiff \
-                --enable-image-loader-xpm \
-                --enable-cpu-c \
-                --enable-fontconfig \
-                --enable-font-loader-eet \
-                --enable-scale-sample \
-                --enable-scale-smooth \
-                --enable-convert-yuv \
-                --enable-small-dither-mask \
-                --disable-no-dither-mask \
-                --disable-convert-8-rgb-332 \
-                --disable-convert-8-rgb-666 \
-                --disable-convert-8-rgb-232 \
-                --disable-convert-8-rgb-222 \
-                --disable-convert-8-rgb-221 \
-                --disable-convert-8-rgb-121 \
-                --disable-convert-8-rgb-111 \
-                --enable-convert-16-rgb-565 \
-                --disable-convert-16-rgb-555 \
-                --disable-convert-16-rgb-444 \
-                --disable-convert-16-rgb-ipq \
-                --enable-convert-16-rgb-rot-0 \
-                --enable-convert-16-rgb-rot-90 \
-                --disable-convert-16-rgb-rot-180 \
-                --enable-convert-16-rgb-rot-270 \
-"
-
-# either sgx or 6410 atm
-GLES ?= "sgx"
-
-# This is a hack to get openGL|ES 2.x support enabled for people that have the SDK headers in staging.
-# We put this in the main recipe, since it will just not build the gl stuff when the headers are missing
-
-# If the above sentence confuse you: everything is built and configured as before if you don't have the SDK
-
-EXTRA_OECONF = "${EVAS_OECONF} \
-                ${EVAS_CPU_TWEAKS} \
-                --enable-pthreads \
-                --enable-async-events \
-                --enable-async-preload \
-                --enable-simple-x11 \
-                --enable-software-x11 \
-                --enable-xrender-x11 \
-                --enable-software-16-x11 \
-                --enable-image-loader-gif \
-                --enable-image-loader-svg \
-                --enable-convert-24-rgb-888 \
-                --enable-convert-24-bgr-888 \
-                --enable-convert-32-rgb-8888 \
-                --enable-convert-32-rgbx-8888 \
-                --enable-convert-32-bgr-8888 \
-                --enable-convert-32-bgrx-8888 \
-                --enable-convert-32-rgb-rot-0 \
-                --enable-convert-32-rgb-rot-90 \
-                --disable-convert-32-rgb-rot-180 \
-                --enable-convert-32-rgb-rot-270 \
-                --enable-gl-x11 \
-                --enable-gl-xlib \
-                --enable-gl-flavor-gles \
-                --enable-gles-variety-${GLES} \
-"
-EXTRA_OECONF_virtclass-native = "${EVAS_OECONF} \
-                --disable-software-x11 \
-                --disable-software-16-x11 \
-                --disable-gl-x11 \
-                --disable-gl-xlib \
-                --disable-xrender-x11 \
-                --disable-image-loader-gif \
-                --disable-image-loader-svg \
-                --disable-convert-24-rgb-888 \
-                --disable-convert-24-bgr-888 \
-                --disable-convert-32-rgb-8888 \
-                --disable-convert-32-rgbx-8888 \
-                --disable-convert-32-bgr-8888 \
-                --disable-convert-32-bgrx-8888 \
-                --disable-convert-32-rgb-rot-0 \
-                --disable-convert-32-rgb-rot-90 \
-                --disable-convert-32-rgb-rot-270 \
-"
-
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[harfbuzz] = "--enable-harfbuzz,--disable-harfbuzz,harfbuzz"
-
-SRC_URI = "\
-    ${E_MIRROR}/${SRCNAME}-${SRCVER}.tar.gz \
-    file://0001-evas_font_load-Fix-build-with-newer-freetype.patch \
-"
-
-SRC_URI[md5sum] = "c96a23ede14cd0adb7e8e549e8acdee1"
-SRC_URI[sha256sum] = "1fd687e43ebe3031be4ac7628043eae1aafca83ce6d1d1f06ff3b59fb4c027f0"
-- 
1.8.5.3


