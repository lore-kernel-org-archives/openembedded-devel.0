Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SrrXG-0006l2-8J
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Jul 2012 16:16:58 +0200
Received: by wibhq4 with SMTP id hq4so5288172wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Jul 2012 07:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=Yb/tkVKuguZMNRJ/2MOIfOcbMXy4CgOGDMxcv+dqxos=;
	b=EsCZB47EPUmxalXl7t/8fBBcld8k7qka8yRGqFY7DDsJzWBwfZeW/JCyPwwz7W0+Nt
	fxCz/vx165g0+b4zMa7WRjfP3bl5g7t+4/t1alSznRcBZbwZFt52YJqqw3bmdadhb6J5
	ZVQ4BuXJQOIcdUGoTagAXZPr+EWTJOCtVpnTwI7a9juHOLmCgLGKO23PeS9pRvpAzVja
	TuKMWGJb0BeiitM/MzGuS771zmvU17Uv89YmcI7RFtyLEFD2eu7dCv0fbaRDQzbgOgc4
	bj4wLlWgzLgvZn3X29ue11DsXk38rU97bb3meJpd7IprXIkgaHrG2QXe8Fpu2M/xLsnR
	H5Tg==
Received: by 10.216.198.10 with SMTP id u10mr1303287wen.80.1342706732414;
	Thu, 19 Jul 2012 07:05:32 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id bc2sm6360638wib.0.2012.07.19.07.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 19 Jul 2012 07:05:31 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 19 Jul 2012 16:05:34 +0200
Message-Id: <ed5066b1b22fcce6d20b57e6e29eafa53e67e0f8.1342706683.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1342706683.git.Martin.Jansa@gmail.com>
References: <cover.1342706683.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/5] recipes: convert tabs to 4 spaces in populate_packages
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
X-List-Received-Date: Thu, 19 Jul 2012 14:16:58 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-efl/recipes-efl/efl/evas.inc                  |   14 +++---
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   34 +++++++-------
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    6 +-
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |   18 ++++----
 .../recipes-support/goffice/goffice_0.8.17.bb      |    4 +-
 .../recipes-devtools/klibc/klibc-utils.inc         |    8 ++--
 .../libcanberra/libcanberra_0.26.bb                |    4 +-
 meta-oe/recipes-devtools/orc/orc.inc               |    4 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |    6 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    4 +-
 meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    6 +-
 meta-oe/recipes-support/freerdp/freerdp.inc        |   42 +++++++++---------
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |   34 +++++++-------
 meta-oe/recipes-support/pidgin/pidgin.inc          |   46 ++++++++++----------
 meta-systemd/recipes-core/systemd/systemd_git.bb   |    4 +-
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb  |   16 +++---
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb        |    4 +-
 17 files changed, 127 insertions(+), 127 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index 99ec3f3..b0a42ea 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -12,14 +12,14 @@ INC_PR = "r0"
 FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 
 python populate_packages_prepend () {
-        for plugin_type in "engines loaders savers".split():
-            bb.note( "splitting packages for evas %s..." % plugin_type )
-            basedir = bb.data.expand( '${libdir}/evas/modules/%s' % plugin_type, d )
+    for plugin_type in "engines loaders savers".split():
+        bb.note( "splitting packages for evas %s..." % plugin_type )
+        basedir = bb.data.expand( '${libdir}/evas/modules/%s' % plugin_type, d )
 
-            do_split_packages(d, basedir, '^(.*)',
-            output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
-            description = 'Evas module %s',
-            allow_dirs=True, recursive=False, extra_depends="" )
+        do_split_packages(d, basedir, '^(.*)',
+        output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
+        description = 'Evas module %s',
+        allow_dirs=True, recursive=False, extra_depends="" )
 }
 
 do_install_append() {
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 6e1dc4e..75c10ae 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -102,21 +102,21 @@ FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
 PACKAGES_DYNAMIC = "${PN}-meta ${PN}-plugin-*"
 
 python populate_packages_prepend () {
-	abiword_libdir    = bb.data.expand('${libdir}/abiword-2.8/plugins', d)
-	do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
-
-	metapkg = "abiword-meta"
-	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
-	bb.data.setVar('FILES_' + metapkg, "", d)
-	blacklist = [ 'abiword-plugins-dbg', 'abiword-plugins', 'abiword-plugins-doc', 'abiword-plugins-dev', 'abiword-plugins-locale' ]
-	metapkg_rdepends = []
-	packages = bb.data.getVar('PACKAGES', d, 1).split()
-	for pkg in packages[1:]:
-                if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
-                	print "Modifying ", pkg
-                	metapkg_rdepends.append(pkg)
-	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-	bb.data.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package', d)
-	packages.append(metapkg)
-	bb.data.setVar('PACKAGES', ' '.join(packages), d)
+    abiword_libdir    = bb.data.expand('${libdir}/abiword-2.8/plugins', d)
+    do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
+
+    metapkg = "abiword-meta"
+    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+    bb.data.setVar('FILES_' + metapkg, "", d)
+    blacklist = [ 'abiword-plugins-dbg', 'abiword-plugins', 'abiword-plugins-doc', 'abiword-plugins-dev', 'abiword-plugins-locale' ]
+    metapkg_rdepends = []
+    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
+            print "Modifying ", pkg
+            metapkg_rdepends.append(pkg)
+    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    bb.data.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package', d)
+    packages.append(metapkg)
+    bb.data.setVar('PACKAGES', ' '.join(packages), d)
 }
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 0b39f1b..586eed8 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -43,8 +43,8 @@ FILES_${PN}-doc += " ${datadir}/gtk-doc"
 PACKAGES_DYNAMIC = "gnome-vfs-plugin-*"
 
 python populate_packages_prepend () {
-	print bb.data.getVar('FILES_gnome-vfs', d, 1)
+    print bb.data.getVar('FILES_gnome-vfs', d, 1)
 
-	plugindir = bb.data.expand('${libdir}/gnome-vfs-2.0/modules/', d)
-	do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
+    plugindir = bb.data.expand('${libdir}/gnome-vfs-2.0/modules/', d)
+    do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
 }
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 8553eb8..b6df81b 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -75,19 +75,19 @@ FILES_${PN}-dbg += " \
 PACKAGES_DYNAMIC += "gtk3-immodule-* gtk3-printbackend-*"
 
 python populate_packages_prepend () {
-	import os.path
+    import os.path
 
-	prologue = bb.data.getVar("postinst_prologue", d, 1)
+    prologue = bb.data.getVar("postinst_prologue", d, 1)
 
-	gtk_libdir = bb.data.expand('${libdir}/gtk-3.0/${LIBV}', d)
-	immodules_root = os.path.join(gtk_libdir, 'immodules')
-	printmodules_root = os.path.join(gtk_libdir, 'printbackends');
+    gtk_libdir = bb.data.expand('${libdir}/gtk-3.0/${LIBV}', d)
+    immodules_root = os.path.join(gtk_libdir, 'immodules')
+    printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
-	do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules')
-	do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
+    do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules')
+    do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
-	if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-		bb.data.setVar('PKG_${PN}', 'libgtk-3.0', d)
+    if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
+        bb.data.setVar('PKG_${PN}', 'libgtk-3.0', d)
 }
 
 postinst_prologue() {
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
index 9988c41..c55a8ac 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
@@ -39,8 +39,8 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
 PACKAGES_DYNAMIC = "goffice-plugin-*"
 
 python populate_packages_prepend () {
-        goffice_libdir = bb.data.expand('${libdir}/goffice/${PV}/plugins/', d)
+    goffice_libdir = bb.data.expand('${libdir}/goffice/${PV}/plugins/', d)
 
-        do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
+    do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
 }
 
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 0f195a3..8ce3d77 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -62,9 +62,9 @@ PACKAGES_DYNAMIC = "${KLIBC_UTILS_PKGNAME}-*"
 
 python populate_packages_prepend () {
 
-        base_bin_dir = bb.data.expand('${base_bindir}', d)
-        do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_links=True, allow_dirs=True)
+    base_bin_dir = bb.data.expand('${base_bindir}', d)
+    do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_links=True, allow_dirs=True)
 
-        base_sbin_dir = bb.data.expand('${base_sbindir}', d)
-        do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_dirs=True)
+    base_sbin_dir = bb.data.expand('${base_sbindir}', d)
+    do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', allow_dirs=True)
 }
diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
index 09e11f9..00030d3 100644
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
@@ -29,8 +29,8 @@ EXTRA_OECONF = "\
 # enable pulse again when pulseaudio >= 0.9.11 is the default in OE
 
 python populate_packages_prepend() {
-	plugindir = bb.data.expand('${libdir}/${P}/', d)
-	do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
+    plugindir = bb.data.expand('${libdir}/${P}/', d)
+    do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
 }
 
 PACKAGES =+ "${PN}-gtk"
diff --git a/meta-oe/recipes-devtools/orc/orc.inc b/meta-oe/recipes-devtools/orc/orc.inc
index c599126..6efe025 100644
--- a/meta-oe/recipes-devtools/orc/orc.inc
+++ b/meta-oe/recipes-devtools/orc/orc.inc
@@ -16,8 +16,8 @@ FILES_orc-examples = "${libdir}/orc/*"
 FILES_${PN} = "${bindir}/*"
 
 python populate_packages_prepend () {
-	libdir = bb.data.expand('${libdir}', d)
-	do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
+    libdir = bb.data.expand('${libdir}', d)
+    do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
 }
 
 do_compile_prepend_virtclass-native () {
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index ac00046..0d03889 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -23,9 +23,9 @@ PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome"
 PACKAGES_DYNAMIC += "${PN}-theme-*"
 
 python populate_packages_prepend() {
-	theme_dir = bb.data.expand('${datadir}/themes/', d)
-	theme_name = bb.data.expand('${PN}-theme-%s', d)
-	do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
+    theme_dir = bb.data.expand('${datadir}/themes/', d)
+    theme_name = bb.data.expand('${PN}-theme-%s', d)
+    do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
 }
 
 RDEPENDS_${PN} += "${PN}-core"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index ab9be35..79920ce 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -9,8 +9,8 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 
 python populate_packages_prepend() {
-	plugindir = bb.data.expand('${datadir}/fonts/ttf-mplus/', d)
-	do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s', extra_depends = "ttf-common")
+    plugindir = bb.data.expand('${datadir}/fonts/ttf-mplus/', d)
+    do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s', extra_depends = "ttf-common")
 }
 
 do_install() {
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
index 3d231e0..bff5312 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
@@ -1,4 +1,4 @@
-DESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
+ESCRIPTION = "The GNU Compact Disc Input and Control library (libcdio) contains a library for CD-ROM and CD image access."
 HOMEPAGE = "http://www.gnu.org/software/libcdio/"
 SECTION = "libs"
 
@@ -22,7 +22,7 @@ FILES_${PN} = "${libdir}/${PN}${SOLIB}"
 FILES_${PN}-utils = "${bindir}/*"
 
 python populate_packages_prepend () {
-        glibdir = bb.data.expand('${libdir}', d)
-        do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
+    glibdir = bb.data.expand('${libdir}', d)
+    do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
 }
 
diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index ec7d360..46aecf6 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -26,25 +26,25 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
 PACKAGES_DYNAMIC = "libfreerdp-plugin-*"
 
 python populate_packages_prepend () {
-        freerdp_root = bb.data.expand('${libdir}/freerdp', d)
-
-        do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
-                output_pattern='libfreerdp-plugin-%s',
-                description='FreeRDP plugin %s',
-                prepend=True, extra_depends='libfreerdp-plugin-audin')
-
-        do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
-                output_pattern='libfreerdp-plugin-%s',
-                description='FreeRDP plugin %s',
-                prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
-
-        do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
-                output_pattern='libfreerdp-plugin-%s',
-                description='FreeRDP plugin %s',
-                prepend=True, extra_depends='libfreerdp-plugin-tsmf')
-
-        do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
-                output_pattern='libfreerdp-plugin-%s',
-                description='FreeRDP plugin %s',
-                prepend=True, extra_depends='')
+    freerdp_root = bb.data.expand('${libdir}/freerdp', d)
+
+    do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-audin')
+
+    do_split_packages(d, freerdp_root, '^(rdpsnd_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-rdpsnd')
+
+    do_split_packages(d, freerdp_root, '^(tsmf_.*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='libfreerdp-plugin-tsmf')
+
+    do_split_packages(d, freerdp_root, '^([^-]*)\.so$',
+        output_pattern='libfreerdp-plugin-%s',
+        description='FreeRDP plugin %s',
+        prepend=True, extra_depends='')
 }
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 942e89a..9cd4541 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -39,23 +39,23 @@ TARGET_CC_ARCH += "-I${S}/include "
 PACKAGES += "${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
-	cv_libdir = bb.data.expand('${libdir}', d)
-	cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
-	do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
-	do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
-
-	pn = bb.data.getVar('PN', d, 1)
-	metapkg =  pn + '-dev'
-	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
-	blacklist = [ metapkg ]
-	metapkg_rdepends = [ ] 
-	packages = bb.data.getVar('PACKAGES', d, 1).split()
-	for pkg in packages[1:]:
-		if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
-			metapkg_rdepends.append(pkg)
-	bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    cv_libdir = bb.data.expand('${libdir}', d)
+    cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
+    do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
+    do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
+
+    pn = bb.data.getVar('PN', d, 1)
+    metapkg =  pn + '-dev'
+    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+    blacklist = [ metapkg ]
+    metapkg_rdepends = [ ] 
+    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    for pkg in packages[1:]:
+        if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
+            metapkg_rdepends.append(pkg)
+    bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
 }
 
 FILES_${PN} = ""
diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index db4753e..90e2fd4 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -59,32 +59,32 @@ FILES_${PN}-dev += "${libdir}/${PN}/*.la"
 PACKAGES_DYNAMIC = "libpurple-protocol-* libpurple-plugin-* pidgin-plugin-* finch-plugin-*"
 
 python populate_packages_prepend () {
-	pidgroot = bb.data.expand('${libdir}/pidgin', d)
-	purple   = bb.data.expand('${libdir}/purple-2', d)
-	finch    = bb.data.expand('${libdir}/finch', d)
+    pidgroot = bb.data.expand('${libdir}/pidgin', d)
+    purple   = bb.data.expand('${libdir}/purple-2', d)
+    finch    = bb.data.expand('${libdir}/finch', d)
 
-	do_split_packages(d, pidgroot, '^([^l][^i][^b].*)\.so$',
-		output_pattern='pidgin-plugin-%s',
-		description='Pidgin plugin %s',
-		prepend=True, extra_depends='')
+    do_split_packages(d, pidgroot, '^([^l][^i][^b].*)\.so$',
+        output_pattern='pidgin-plugin-%s',
+        description='Pidgin plugin %s',
+        prepend=True, extra_depends='')
 
-	do_split_packages(d, purple, '^lib(.*)\.so$',
-		output_pattern='libpurple-protocol-%s',
-		description='Libpurple protocol plugin for %s',
-		prepend=True, extra_depends='')
+    do_split_packages(d, purple, '^lib(.*)\.so$',
+        output_pattern='libpurple-protocol-%s',
+        description='Libpurple protocol plugin for %s',
+        prepend=True, extra_depends='')
 
-	do_split_packages(d, purple, '^(ssl-.*)\.so$',
-		output_pattern='libpurple-plugin-%s',
-		description='libpurple plugin %s',
-		prepend=True, extra_depends='libpurple-plugin-ssl')
+    do_split_packages(d, purple, '^(ssl-.*)\.so$',
+        output_pattern='libpurple-plugin-%s',
+        description='libpurple plugin %s',
+        prepend=True, extra_depends='libpurple-plugin-ssl')
 
-	do_split_packages(d, purple, '^([^l][^i][^b].*)\.so$',
-		output_pattern='libpurple-plugin-%s',
-		description='libpurple plugin %s',
-		prepend=True, extra_depends='')
+    do_split_packages(d, purple, '^([^l][^i][^b].*)\.so$',
+        output_pattern='libpurple-plugin-%s',
+        description='libpurple plugin %s',
+        prepend=True, extra_depends='')
 
-	do_split_packages(d, finch, '^([^l][^i][^b].*)\.so$',
-		output_pattern='finch-plugin-%s',
-		description='Finch plugin %s',
-		prepend=True, extra_depends='')
+    do_split_packages(d, finch, '^([^l][^i][^b].*)\.so$',
+        output_pattern='finch-plugin-%s',
+        description='Finch plugin %s',
+        prepend=True, extra_depends='')
 }
diff --git a/meta-systemd/recipes-core/systemd/systemd_git.bb b/meta-systemd/recipes-core/systemd/systemd_git.bb
index 8af1aa5..6b9fc8c 100644
--- a/meta-systemd/recipes-core/systemd/systemd_git.bb
+++ b/meta-systemd/recipes-core/systemd/systemd_git.bb
@@ -85,8 +85,8 @@ do_install() {
 }
 
 python populate_packages_prepend (){
-	systemdlibdir = d.getVar("base_libdir", True)
-	do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
+    systemdlibdir = d.getVar("base_libdir", True)
+    do_split_packages(d, systemdlibdir, '^lib(.*)\.so\.*', 'lib%s', 'Systemd %s library', extra_depends='', allow_links=True)
 }
 
 PACKAGES =+ "${PN}-gui ${PN}-vconsole-setup ${PN}-initramfs ${PN}-analyze"
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
index 94bb7fd..b59fde0 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
@@ -9,14 +9,14 @@ PR = "r3"
 inherit xfce
 
 python populate_packages_prepend() {
-	plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
-	plugin_name = bb.data.expand('${PN}-plugin-%s', d)
-	do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
-	                  '${PN} plugin for %s', extra_depends='', prepend=True,
-	                  aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
-	                                     '${sysconfdir}/xdg/xfce/panel/%s-*',
-	                                     '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
-	                                     '${bindir}/*%s*'])
+    plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
+    plugin_name = bb.data.expand('${PN}-plugin-%s', d)
+    do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
+                      '${PN} plugin for %s', extra_depends='', prepend=True,
+                      aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
+                                         '${sysconfdir}/xdg/xfce/panel/%s-*',
+                                         '${datadir}/icons/hicolor/48x48/apps/*-%s.png',
+                                         '${bindir}/*%s*'])
 }
 do_install_append () {
     find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -f {} +
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
index e2dc4ab..299c7ad 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.8.3.bb
@@ -12,8 +12,8 @@ SRC_URI[sha256sum] = "0b0e8bea0b257958ad416ab5678cf0cdd7e909943d4d5ab32afc35295a
 EXTRA_OECONF += " --enable-startup-notification"
 
 python populate_packages_prepend () {
-	themedir = bb.data.expand('${datadir}/themes', d)
-	do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
+    themedir = bb.data.expand('${datadir}/themes', d)
+    do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
 }
 
 PACKAGES_DYNAMIC += "xfwm4-theme-*"
-- 
1.7.8.6



