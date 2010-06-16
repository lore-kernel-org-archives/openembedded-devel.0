Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <schnitzeltony@gmx.de>) id 1OOrut-000253-LM
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Jun 2010 14:40:29 +0200
Received: (qmail invoked by alias); 16 Jun 2010 12:35:58 -0000
Received: from mail2.zera.de (EHLO [192.168.142.128]) [62.225.102.139]
	by mail.gmx.net (mp072) with SMTP; 16 Jun 2010 14:35:58 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/L+E4jZVnL7Cs2fsQpzRUMNhkChlEkZL8YKIzLKy
	nIwmHRECskLbdW
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 16 Jun 2010 14:33:54 +0200
User-Agent: KMail/1.9.6 (enterprise 0.20071012.724442)
MIME-Version: 1.0
Message-Id: <201006161433.54486.schnitzeltony@gmx.de>
X-Y-GMX-Trusted: 0
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: schnitzeltony@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: xfce 4.6.2 recipes
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
X-List-Received-Date: Wed, 16 Jun 2010 12:40:29 -0000
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Below you find new recipes for xfce 4.6.2. My gumstix overo works well with 
them - I discovered no fallout up to now.

I am sure that this is not the correct place to post patches. Checked OE page 
but did not find hints and asked this in my last post (). So please what is 
the correct place/procedure for RFC/PATCHES?


diff --git a/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch 
b/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch
new file mode 100644
index 0000000..a667f11
--- /dev/null
+++ b/recipes/xfce-base/exo-0.3.107/exo-0.3.107-iocharset.patch
@@ -0,0 +1,79 @@
+diff --git a/exo-mount/exo-mount-hal.c b/exo-mount/exo-mount-hal.c
+index 791a536..4b130c3 100644
+--- a/exo-mount/exo-mount-hal.c
++++ b/exo-mount/exo-mount-hal.c
+@@ -34,6 +34,8 @@
+ #include <unistd.h>
+ #endif
+ 
++#include <langinfo.h>
++
+ #include <libhal-storage.h>
+ 
+ #include <exo-hal/exo-hal.h>
+@@ -616,6 +618,30 @@ oom:  g_set_error (error, G_FILE_ERROR, 
G_FILE_ERROR_NOMEM, g_strerror (ENOMEM))
+ 
+ 
+ /**
++ * exo_mount_hal_iocharset:
++ *
++ * Determines the preferred iocharset for filesystems
++ * that support it.
++ *
++ * Return value: iocharset string or %NULL if none.
++ **/
++static const gchar*
++exo_mount_hal_iocharset ()
++{
++  const gchar* cs = g_getenv("EXO_MOUNT_IOCHARSET");
++  if (cs != NULL)
++    return cs;
++
++  const char* codeset = nl_langinfo (CODESET);
++  if (codeset && !strcmp (codeset, "UTF-8"))
++    return "utf8";
++
++  return NULL;
++}
++
++
++
++/**
+  * exo_mount_hal_device_mount:
+  * @device : an #ExoMountHalDevice.
+  * @error  : return location for errors or %NULL.
+@@ -676,6 +702,12 @@ exo_mount_hal_device_mount (ExoMountHalDevice *device,
+               /* however this one is FreeBSD specific */
+               options[n++] = g_strdup ("longnames");
+             }
++          else if (strcmp (device->fsoptions[m], "iocharset=") == 0)
++            {
++              const gchar* iocharset = exo_mount_hal_iocharset();
++              if (iocharset != NULL)
++                options[n++] = g_strdup_printf ("iocharset=%s", iocharset);
++            }
+         }
+     }
+ 
+diff --git a/exo-mount/main.c b/exo-mount/main.c
+index 80eae1d..f442019 100644
+--- a/exo-mount/main.c
++++ b/exo-mount/main.c
+@@ -39,6 +39,8 @@
+ #include <string.h>
+ #endif
+ 
++#include <locale.h>
++
+ #include <glib/gstdio.h>
+ 
+ #include <exo-hal/exo-hal.h>
+@@ -97,6 +99,8 @@ main (int argc, char **argv)
+   /* initialize the i18n support */
+   xfce_textdomain (GETTEXT_PACKAGE, PACKAGE_LOCALE_DIR, "UTF-8");
+ 
++  setlocale(LC_CTYPE, "");
++
+   /* initialize GTK+ */
+   if (!gtk_init_with_args (&argc, &argv, "Xfce mount", entries, 
GETTEXT_PACKAGE, &err))
+     {
diff --git a/recipes/xfce-base/exo_0.3.107.bb 
b/recipes/xfce-base/exo_0.3.107.bb
new file mode 100644
index 0000000..30079d8
--- /dev/null
+++ b/recipes/xfce-base/exo_0.3.107.bb
@@ -0,0 +1,29 @@
+DESCRIPTION="XFCE extensions and framework library with session management 
support"
+DEPENDS = "libxfce4util hal liburi-perl-native python-native cairo"
+SECTION = "x11"
+PR = "r0"
+
+inherit xfce46 python-dir
+
+XFCE_VERSION = "4.6.2"
+
+SRC_URI += " \
+    file://exo-0.3.107-iocharset.patch \
+    file://exo-no-tests.patch \
+    file://configure.patch \
+"
+
+# Note: Python checking is broken
+do_configure_prepend() {
+	sed -i -e s:'`$PKG_CONFIG --variable=defsdir pygtk-2.0`':
\"${STAGING_DATADIR}/pygtk/2.0/defs\":g ${S}/configure.in
+}
+
+FILES_${PN} += "${datadir}/xfce4/ \
+                ${PYTHON_SITEPACKAGES_DIR}/* \
+                ${prefix}/share/pygtk/2.0/defs/exo-0.3/exo.defs \
+"
+
+FILES_${PN}-dbg += "${PYTHON_SITEPACKAGES_DIR}/*/.debug/*"
+
+SRC_URI[md5sum] = "3a92cca0c99ee940db4410891c9e8498"
+SRC_URI[sha256sum] 
= "0a12ac124bad67c8de7135f7052641239ed640884a71612930f99c425bede2a3"
diff --git a/recipes/xfce-base/libxfce4menu_4.6.2.bb 
b/recipes/xfce-base/libxfce4menu_4.6.2.bb
new file mode 100644
index 0000000..663944a
--- /dev/null
+++ b/recipes/xfce-base/libxfce4menu_4.6.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION="a freedesktop.org compliant menu library for Xfce4"
+HOMEPAGE="http://www.xfce.org/projects/libraries"
+DEPENDS = "gettext pkgconfig libxfce4util intltool"
+RDEPENDS_${PN} = "gtk+ libxfce4util"
+
+LICENSE="LGPL-2 FDL-1.1"
+PR = "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] = "ff10cacb76803ee37159e3a43345f0d1"
+SRC_URI[sha256sum] 
= "62352be57318d6f241c4f6e4b6f9303d0b80246ea8f6e4753a962360a9965162"
diff --git a/recipes/xfce-base/libxfce4util_4.6.2.bb 
b/recipes/xfce-base/libxfce4util_4.6.2.bb
new file mode 100644
index 0000000..67aba2e
--- /dev/null
+++ b/recipes/xfce-base/libxfce4util_4.6.2.bb
@@ -0,0 +1,18 @@
+# libxfce4util OE build file
+
+DESCRIPTION = "Basic utility library for Xfce4"
+SECTION = "x11/libs"
+LICENSE = "GPL"
+DEPENDS = "glib-2.0 xfce4-dev-tools "
+PR = "r0"
+
+inherit xfce46
+
+EXTRA_OECONF 
+= "--disable-dependency-tracking --disable-static --with-broken-putenv=yes"
+
+MACROS="m4/X11.m4 m4/debug.m4 m4/depends.m4 m4/i18n.m4"
+
+FILES_${PN}-dev += " ${datadir}/xfce4/m4"
+
+SRC_URI[md5sum] = "9c3129d827d480f0906c575e7a13f1e9"
+SRC_URI[sha256sum] 
= "ae2e7ed1000bb0b3589643a39a65e6ab64c9ee198045e7b272604986f2e18c83"
diff --git a/recipes/xfce-base/libxfcegui4_4.6.4.bb 
b/recipes/xfce-base/libxfcegui4_4.6.4.bb
new file mode 100644
index 0000000..f3e43b5
--- /dev/null
+++ b/recipes/xfce-base/libxfcegui4_4.6.4.bb
@@ -0,0 +1,17 @@
+# libxfcegui4 OE build file
+
+DESCRIPTION = "Xfce Widget library and X Window System interaction"
+DEPENDS = "gettext pkgconfig intltool virtual/libx11 libxfce4util xfconf dbh 
libxml2 gtk+ libglade"
+RDEPENDS_${PN} = "xfconf startup-notification "
+
+SECTION = "x11/libs"
+PR = "r0"
+
+inherit xfce46
+
+LEAD_SONAME = "libxfcegui4.so.4"
+
+FILES_${PN} += "${libdir}/xfce4/modules ${libdir}/libglade/2.0/*.so 
${datadir}/xfce4/mime ${datadir}/icons/hicolor"
+
+SRC_URI[md5sum] = "88de59b222cb9977f93a4c61011c1e1f"
+SRC_URI[sha256sum] 
= "c37e407dc00fb87dc16758d53e69edeac7b32aa76c5fcad2b784cf22f58af421"
diff --git a/recipes/xfce-base/thunar_1.0.2.bb 
b/recipes/xfce-base/thunar_1.0.2.bb
new file mode 100644
index 0000000..d35c44d
--- /dev/null
+++ b/recipes/xfce-base/thunar_1.0.2.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "File manager for the Xfce Desktop Environment"
+HOMEPAGE="http://thunar.xfce.org"
+DEPENDS = "exo dbus-glib libexif xfce4-panel libice libsm gamin"
+RDEPENDS_${PN} = "libxfcegui4 exo dbus-glib libexif xfce4-panel libice libsm 
gamin"
+RRECOMMENDS_${PN} = "shared-mime-info"
+SECTION = "x11"
+PR = "r0"
+
+inherit xfce46
+
+XFCE_VERSION = "4.6.2"
+
+SRC_URI 
= "http://www.us.xfce.org/archive/xfce-${XFCE_VERSION}/src/Thunar-${PV}.tar.bz2"
+
+S = "${WORKDIR}/Thunar-${PV}/"
+
+EXTRA_OECONF += "--disable-dependency-tracking --enable-dbus"
+
+FILES_${PN} += "${libdir}/thunarx-1/*.so \
+		${libdir}/thunarx-1/*.la \
+                ${datadir}/dbus-1 \
+                ${datadir}/thumbnailers \
+                ${datadir}/Thunar \
+                ${datadir}/xfce4"
+FILES_${PN}-dbg += "${libdir}/thunarx-1/.debug/ 
${libexecdir}/xfce4/panel-plugins/.debug/"
+
+SRC_URI[md5sum] = "c91073202d373a1f9951a1240083c36d"
+SRC_URI[sha256sum] 
= "75829b34a68346b33f66882bedc9794d580c200d11af22541885750459b55c03"
diff --git a/recipes/xfce-base/xfce-terminal_0.4.5.bb 
b/recipes/xfce-base/xfce-terminal_0.4.5.bb
new file mode 100644
index 0000000..2d5f94e
--- /dev/null
+++ b/recipes/xfce-base/xfce-terminal_0.4.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Terminal emulator for the Xfce desktop environment"
+DEPENDS = "exo vte dbus-glib gtk+"
+RDEPENDS_${PN} += "gnome-pty-helper"
+PR = "r0"
+
+inherit xfce46
+
+SRC_URI 
= "http://www.xfce.org/archive/src/apps/terminal/0.4/Terminal-${PV}.tar.bz2 \
+"
+
+S = "${WORKDIR}/Terminal-${PV}"
+
+FILES_${PN} += "${datadir}/Terminal"
+
+SRC_URI[md5sum] = "3c707628e2e97c6d9566cd74d400036a"
+SRC_URI[sha256sum] 
= "92fddcbc1422076672d8ec61832793d4ceea2fc0db7d724a6acde0ec2bac8893"
diff --git a/recipes/xfce-base/xfce-utils_4.6.2.bb 
b/recipes/xfce-base/xfce-utils_4.6.2.bb
new file mode 100644
index 0000000..c9a1deb
--- /dev/null
+++ b/recipes/xfce-base/xfce-utils_4.6.2.bb
@@ -0,0 +1,30 @@
+DESCRIPTION="XFCE4 Utilities"
+DEPENDS = "virtual/libx11 libxfcegui4"
+SECTION = "x11"
+PR = "r0"
+
+inherit xfce46
+
+FILES_${PN} += " \ 
+        ${bindir}/* \
+        ${datadir}/dbus-1/* \
+        ${datadir}/xfce4/AUTHORS \
+        ${datadir}/xfce4/BSD \
+        ${datadir}/xfce4/COPYING \
+        ${datadir}/xfce4/GPL \
+	${datadir}/xfce4/INFO* \
+        ${datadir}/xfce4/LGPL \
+        ${datadir}/xfce4/AUTHORS.html \
+        ${datadir}/xfce4/BSD.html \
+        ${datadir}/xfce4/COPYING.html \
+        ${datadir}/xfce4/GPL.html \
+	${datadir}/xfce4/INFO.html \
+        ${datadir}/xfce4/LGPL.html \
+        ${datadir}/xsessions/xfce.desktop \
+"
+
+# NOTE:  This package takes a --with-browser for the default browser
+# NOTE:  Works with gdm also gtkhtml
+
+SRC_URI[md5sum] = "5d23407700d7e8c9751e17a5bc955109"
+SRC_URI[sha256sum] 
= "54efc2038bfbd5acaadfc91ed91fb3dfd6cec64f9402f364accce7bcafe2ba7a"
diff --git a/recipes/xfce-base/xfce4-appfinder_4.6.2.bb 
b/recipes/xfce-base/xfce4-appfinder_4.6.2.bb
new file mode 100644
index 0000000..27fa550
--- /dev/null
+++ b/recipes/xfce-base/xfce4-appfinder_4.6.2.bb
@@ -0,0 +1,11 @@
+# xfce4-appfinder build file
+
+DESCRIPTION="XFCE Application Finder"
+DEPENDS="libxfcegui4 libxfce4menu thunar"
+SECTION = "x11"
+PR = "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] = "7752e43578b821e35010bcd3762da166"
+SRC_URI[sha256sum] 
= "a1bf35b838922a7f81f588c727a6ef2f56b1bed0c46f7c36b209ac336f7e492a"
diff --git a/recipes/xfce-base/xfce4-panel_4.6.4.bb 
b/recipes/xfce-base/xfce4-panel_4.6.4.bb
new file mode 100644
index 0000000..fe402b8
--- /dev/null
+++ b/recipes/xfce-base/xfce4-panel_4.6.4.bb
@@ -0,0 +1,30 @@
+# xfce4-panel OE build file
+
+DESCRIPTION = "Xfce4 Panel"
+DEPENDS = "virtual/libx11 startup-notification libxfcegui4 libxml2 exo 
libwnck"
+SECTION = "x11"
+PR = "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] = "82f10a42aefca4cc26a6633e7478cc65"
+SRC_URI[sha256sum] 
= "cc9b70bdc73ab80f46655a34cdbaf876a67cd90b50230cbf4d77a3106a5c54e7"
+
+EXTRA_OECONF += " --enable-startup-notification"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
+
+python populate_packages_prepend() {
+	plugin_dir = bb.data.expand('${libdir}/xfce4/panel-plugins/', d)
+	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
+	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+	                  '${PN} plugin for %s', extra_depends='', prepend=True,
+	                  
aux_files_pattern=['${datadir}/xfce4/panel-plugins/%s.desktop',
+	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
+	                                     '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
+	                                     '${bindir}/*%s*'])
+}
+
+PACKAGES_DYNAMIC = "${PN}-plugin-*"
diff --git a/recipes/xfce-base/xfce4-session_4.6.2.bb 
b/recipes/xfce-base/xfce4-session_4.6.2.bb
new file mode 100644
index 0000000..843b86c
--- /dev/null
+++ b/recipes/xfce-base/xfce4-session_4.6.2.bb
@@ -0,0 +1,22 @@
+DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop  
Environment"
+DEPENDS = "libxfcegui4 libxfce4util dbus iceauth xfce-utils"
+SECTION = "x11"
+
+PR = "r0"
+
+inherit xfce46
+
+RDEPENDS_${PN} = "iceauth xfce-utils xinit dbus-x11"
+
+FILES_${PN} += "${libdir}/xfce4/splash/engines/*.so"
+FILES_${PN} += "${datadir}/xfce4/tips/*"
+FILES_${PN} += "${datadir}/themes/Default/balou/*"
+
+FILES_${PN}-dbg += "${libdir}/xfce4/splash/engines/.debug/*.so"
+FILES_${PN}-dbg += "${libdir}/xfce4/splash/engines/.debug/*.a"
+
+FILES_${PN}-dev += "${libdir}/xfce4/splash/engines/*.la"
+FILES_${PN}-dev += "${libdir}/xfce4/splash/engines/*.a"
+
+SRC_URI[md5sum] = "9d9890130e45e0e9476591ed9ba2c9d5"
+SRC_URI[sha256sum] 
= "725e269254c34c530acb670f5ccd0fd69b57cbe9f2176abd8499fc5d6dcd30a8"
diff --git a/recipes/xfce-base/xfce4-settings_4.6.5.bb 
b/recipes/xfce-base/xfce4-settings_4.6.5.bb
new file mode 100644
index 0000000..65e4869
--- /dev/null
+++ b/recipes/xfce-base/xfce4-settings_4.6.5.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Xfce4 settings"
+HOMEPAGE = "http://www.xfce.org"
+SECTION = "x11/wm"
+LICENSE = "GPL-2"
+
+DEPENDS = "virtual/libx11 virtual/xserver libxi libwnck xrandr exo 
libxfce4util libxfcegui4"
+
+PR = "r0"
+
+inherit xfce46
+
+SRC_URI[md5sum] = "f988cb732913b5fbc115ad7105d2231e"
+SRC_URI[sha256sum] 
= "1601b8d2cac5d931c39bed7e331c5bd91018d0e56663295e7a083a2c78fe168b"
+
+RDEPENDS_${PN} = "xfconf exo"
+
diff --git a/recipes/xfce-base/xfconf_4.6.2.bb 
b/recipes/xfce-base/xfconf_4.6.2.bb
new file mode 100644
index 0000000..3db4c91
--- /dev/null
+++ b/recipes/xfce-base/xfconf_4.6.2.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "Xfce configuration daemon and utilities"
+HOMEPAGE = "http://www.xfce.org"
+SECTION = "x11/wm"
+LICENSE = "GPL-2"
+
+DEPENDS = "libxfce4util"
+RDEPENDS_${PN} = "libxfce4util"
+
+PR = "r0"
+
+inherit xfce46
+
+FILES_${PN} += "${datadir}/dbus-1/services/org.xfce.Xfconf.service"
+
+SRC_URI[md5sum] = "5ff93c15077c6dbbcd38c437bc1ab2ef"
+SRC_URI[sha256sum] 
= "7b2635abc33ae6a76145238ed27557bc1ff91b1a5ee0757962f798a66d56f478"
diff --git a/recipes/xfce-base/xfdesktop_4.6.2.bb 
b/recipes/xfce-base/xfdesktop_4.6.2.bb
new file mode 100644
index 0000000..ede1b94
--- /dev/null
+++ b/recipes/xfce-base/xfdesktop_4.6.2.bb
@@ -0,0 +1,21 @@
+DESCRIPTION = "XFCE4 Desktop Manager"
+SECTION = "x11/base"
+
+DEPENDS = "virtual/libx11 exo libxfcegui4 xfce4-panel thunar gtk+"
+RDEPENDS_${PN} = "libxfcegui4 libxml2 xfce4-panel thunar exo gtk+"
+PR = "r0"
+
+inherit xfce46
+
+do_configure() { 
+   oe_runconf
+}
+
+FILES_xfdesktop-backdrops = "${datadir}/xfce4/backdrops/*"
+FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so \
+                ${libdir}/xfce4/panel-plugins/xfce4-menu-plugin \
+                ${datadir}/xfce4/panel-plugins/*.desktop"
+FILES_${PN}-dbg += "${libexecdir}/xfce4/panel-plugins/.debug"
+
+SRC_URI[md5sum] = "e800ea9fee7a5c5eaf2ae96e23a83e3a"
+SRC_URI[sha256sum] 
= "cd760f95486ba3f1c6d0179bb10a4c21c99c1d459dd8265823fed85f7376a3fb"
diff --git a/recipes/xfce-base/xfwm4_4.6.2.bb 
b/recipes/xfce-base/xfwm4_4.6.2.bb
new file mode 100644
index 0000000..8d489a6
--- /dev/null
+++ b/recipes/xfce-base/xfwm4_4.6.2.bb
@@ -0,0 +1,31 @@
+# xfwm4 OE build file
+
+DESCRIPTION="XFCE4 Window Manager"
+SECTION = "x11/wm"
+PR = "r0"
+
+inherit xfce46 update-alternatives
+
+FILES_${PN} += "${datadir}/xfwm4/defaults 
${datadir}/xfwm4/themes/default.keys/*"
+
+DEPENDS = "startup-notification virtual/libx11 libxpm libxfce4util 
libxfcegui4"
+RDEPENDS_${PN} = "xfwm4-theme-default"
+
+EXTRA_OECONF += " --enable-startup-notification"
+
+PACKAGES_DYNAMIC += "xfwm4-theme-*"
+
+python populate_packages_prepend () {
+	themedir = bb.data.expand('${datadir}/themes', d)
+	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', 
allow_dirs=True)
+}
+
+ALTERNATIVE_NAME = "x-window-manager"
+ALTERNATIVE_LINK = "${bindir}/x-window-manager"
+ALTERNATIVE_PATH = "${bindir}/xfce4-session"
+ALTERNATIVE_PRIORITY = "30"
+
+FILES_${PN}-dbg += "${libexecdir}/xfce4/xfwm4/.debug/*"
+
+SRC_URI[md5sum] = "3e6c0c54b028b6ea60e865e55ecdf3f8"
+SRC_URI[sha256sum] 
= "212819ee03c24635f79d50930284c422469e22489952d0b286e6fe5af2155828"


