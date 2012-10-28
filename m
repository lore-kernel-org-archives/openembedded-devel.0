Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TSV99-0005gn-Bj
	for openembedded-devel@lists.openembedded.org;
	Sun, 28 Oct 2012 16:51:33 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 28 Oct 2012 08:37:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,667,1344236400"; d="scan'208";a="239506790"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.101])
	by fmsmga001.fm.intel.com with ESMTP; 28 Oct 2012 08:37:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Oct 2012 15:37:25 +0000
Message-Id: <3a30c562385cb3d9cd1b3043f6fe677a22024018.1351438401.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1351438401.git.paul.eggleton@linux.intel.com>
References: <cover.1351438401.git.paul.eggleton@linux.intel.com>
Subject: [meta-oe][PATCH 4/4] Replace bb.data.* with d.*
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
X-List-Received-Date: Sun, 28 Oct 2012 15:51:33 -0000

Used sed expression given here:

http://lists.linuxtogo.org/pipermail/openembedded-core/2011-November/012373.html

Plus an additional expression for .expand. Full expression is:

sed \
-e 's:bb.data.\(setVar([^,]*,[^,]*\), \([^ )]*\) *):\2.\1):g' \
-e 's:bb.data.\(setVarFlag([^,]*,[^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
-e 's:bb.data.\(getVar([^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
-e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^, ]*\) *,\([^)]*\)):\2.\1,\3):g' \
-e 's:bb.data.\(getVarFlag([^,]*,[^,]*\), \([^) ]*\) *):\2.\1):g' \
-e 's:bb.data.\(getVar([^,]*\), \([^) ]*\) *):\2.\1):g' \
-e 's:bb.data.\(expand([^,]*\), \([^ )]*\) *):\2.\1):g' \
-i `grep -ril bb.data *`

Some minor correction in systemd.bbclass was needed for some expressions
that didn't quite match the regex in the desired way; additionally a few
instances were manually changed.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-efl/recipes-efl/efl/edje-fpu.inc              |    2 +-
 meta-efl/recipes-efl/efl/evas-generic-loaders.inc  |    2 +-
 meta-efl/recipes-efl/efl/evas.inc                  |    4 +--
 meta-gnome/recipes-gnome/abiword/abiword.inc       |    2 +-
 meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb  |   16 +++++------
 .../recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb    |    4 +--
 meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb       |    8 +++---
 meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb  |    2 +-
 .../recipes-support/goffice/goffice_0.8.17.bb      |    2 +-
 .../recipes-devtools/klibc/klibc-utils.inc         |    4 +--
 meta-oe/classes/gitpkgv.bbclass                    |    4 +--
 meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc   |    2 +-
 .../fakeroot/fakeroot-native_1.12.4.bb             |    4 +--
 meta-oe/recipes-core/glib-2.0/glibmm.inc           |    2 +-
 meta-oe/recipes-core/meta/distro-feed-configs.bb   |    4 +--
 .../proxy-libintl/proxy-libintl_20100902.bb        |    2 +-
 .../libcanberra/libcanberra_0.26.bb                |    2 +-
 meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb    |    2 +-
 meta-oe/recipes-devtools/orc/orc.inc               |    2 +-
 meta-oe/recipes-devtools/vala/vala.inc             |    2 +-
 meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb  |    4 +--
 meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb   |    2 +-
 .../recipes-graphics/ttf-fonts/ttf-mplus_027.bb    |    2 +-
 meta-oe/recipes-multimedia/libav/libav.inc         |    4 +--
 meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb |    2 +-
 meta-oe/recipes-multimedia/live555/live555.inc     |    2 +-
 meta-oe/recipes-navigation/navit/navit-fpu.inc     |    2 +-
 meta-oe/recipes-support/fltk/fltk_1.1.10.bb        |    4 +--
 meta-oe/recipes-support/freerdp/freerdp.inc        |    2 +-
 meta-oe/recipes-support/links/links.inc            |    2 +-
 meta-oe/recipes-support/lzma/lzma.inc              |    2 +-
 meta-oe/recipes-support/nano/nano.inc              |    2 +-
 meta-oe/recipes-support/opencv/opencv_2.4.bb       |   12 ++++-----
 .../recipes-support/openldap/openldap_2.4.23.bb    |   16 +++++------
 meta-oe/recipes-support/pidgin/pidgin.inc          |    6 ++---
 meta-oe/recipes-support/poppler/poppler-fpu.inc    |    2 +-
 meta-oe/recipes-support/vim/vim.inc                |    4 +--
 meta-systemd/classes/systemd.bbclass               |   28 ++++++++++----------
 .../xfwm4-themes/xfwm4-themes_4.10.0.bb            |    2 +-
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb |    4 +--
 meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb       |    2 +-
 41 files changed, 89 insertions(+), 89 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje-fpu.inc b/meta-efl/recipes-efl/efl/edje-fpu.inc
index dc39fa9..3f2aacf 100644
--- a/meta-efl/recipes-efl/efl/edje-fpu.inc
+++ b/meta-efl/recipes-efl/efl/edje-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_edje_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
         return "--enable-fixed-point"
     return ""
 
diff --git a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
index cb11334..4f84291 100644
--- a/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
+++ b/meta-efl/recipes-efl/efl/evas-generic-loaders.inc
@@ -19,7 +19,7 @@ EXTRA_OECONF = " \
 
 python populate_packages_prepend () {
     bb.note( "splitting packages for evas generic loaders" )
-    basedir = bb.data.expand( '${libdir}/evas/utils', d )
+    basedir = d.expand( '${libdir}/evas/utils')
 
     do_split_packages(d, basedir, '^evas_image_loader\.(.*)$',
     output_pattern = "evas-generic-loader-%s",
diff --git a/meta-efl/recipes-efl/efl/evas.inc b/meta-efl/recipes-efl/efl/evas.inc
index e3e5d39..4f48f5d 100644
--- a/meta-efl/recipes-efl/efl/evas.inc
+++ b/meta-efl/recipes-efl/efl/evas.inc
@@ -14,7 +14,7 @@ FILESPATHPKG =. "${BPN}-${PV}:${BPN}:"
 python populate_packages_prepend () {
     for plugin_type in "engines loaders savers".split():
         bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = bb.data.expand( '${libdir}/evas/modules/%s' % plugin_type, d )
+        basedir = d.expand( '${libdir}/evas/modules/%s' % plugin_type)
 
         do_split_packages(d, basedir, '^(.*)',
         output_pattern = 'evas-' + plugin_type[:-1] + "-%s",
@@ -23,7 +23,7 @@ python populate_packages_prepend () {
         
         plugin_type = "cserve2"
         bb.note( "splitting packages for evas %s..." % plugin_type )
-        basedir = bb.data.expand( '${libdir}/evas/%s/loaders' % plugin_type, d )
+        basedir = d.expand( '${libdir}/evas/%s/loaders' % plugin_type)
 
         do_split_packages(d, basedir, '^(.*)',
         output_pattern = 'evas-' + plugin_type + "-%s",
diff --git a/meta-gnome/recipes-gnome/abiword/abiword.inc b/meta-gnome/recipes-gnome/abiword/abiword.inc
index b1b0f67..8fbcd3b 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword.inc
+++ b/meta-gnome/recipes-gnome/abiword/abiword.inc
@@ -17,7 +17,7 @@ CVSURI = "cvs://anoncvs:anoncvs@anoncvs.abisource.com/cvsroot;module=abi"
 CVSSRC = "${WORKDIR}/abi"
 
 #want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 FILES_${PN} += " \
 		${datadir}/icons/* \
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
index 60b970b..c4bf344 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_2.8.6.bb
@@ -21,7 +21,7 @@ SRC_URI[md5sum] = "f883b0a7f26229a9c66fd6a1a94381aa"
 SRC_URI[sha256sum] = "d99089a63a6cfc1a6a4a026be9278028d47d224088d24b1853acb67e95683a15"
 
 #want 2.x from 2.x.y for the installation directory
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 PR = "r7"
 
@@ -102,21 +102,21 @@ FILES_${PN}-templates      += "${datadir}/${PN}-${SHRT_VER}/templates"
 PACKAGES_DYNAMIC += "^${PN}-meta.* ^${PN}-plugin-.*"
 
 python populate_packages_prepend () {
-    abiword_libdir    = bb.data.expand('${libdir}/abiword-2.8/plugins', d)
+    abiword_libdir    = d.expand('${libdir}/abiword-2.8/plugins')
     do_split_packages(d, abiword_libdir, '(.*)\.so$', 'abiword-plugin-%s', 'Abiword plugin for %s', extra_depends='')
 
     metapkg = "abiword-meta"
-    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
-    bb.data.setVar('FILES_' + metapkg, "", d)
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    d.setVar('FILES_' + metapkg, "")
     blacklist = [ 'abiword-plugins-dbg', 'abiword-plugins', 'abiword-plugins-doc', 'abiword-plugins-dev', 'abiword-plugins-locale' ]
     metapkg_rdepends = []
-    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
             print "Modifying ", pkg
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-    bb.data.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package', d)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, 'abiword-plugin meta package')
     packages.append(metapkg)
-    bb.data.setVar('PACKAGES', ' '.join(packages), d)
+    d.setVar('PACKAGES', ' '.join(packages))
 }
diff --git a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
index 46be86f..531a2d7 100644
--- a/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
+++ b/meta-gnome/recipes-gnome/gnome-vfs/gnome-vfs_2.24.4.bb
@@ -43,8 +43,8 @@ FILES_${PN}-doc += " ${datadir}/gtk-doc"
 PACKAGES_DYNAMIC += "^gnome-vfs-plugin-.*"
 
 python populate_packages_prepend () {
-    print bb.data.getVar('FILES_gnome-vfs', d, 1)
+    print d.getVar('FILES_gnome-vfs', 1)
 
-    plugindir = bb.data.expand('${libdir}/gnome-vfs-2.0/modules/', d)
+    plugindir = d.expand('${libdir}/gnome-vfs-2.0/modules/')
     do_split_packages(d, plugindir, '^lib(.*)\.so$', 'gnome-vfs-plugin-%s', 'GNOME VFS plugin for %s')
 }
diff --git a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
index 32b54ef..854ba41 100644
--- a/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
+++ b/meta-gnome/recipes-gnome/gtk+/gtk+3_3.2.3.bb
@@ -77,17 +77,17 @@ PACKAGES_DYNAMIC += "^gtk3-immodule-.* ^gtk3-printbackend-.*"
 python populate_packages_prepend () {
     import os.path
 
-    prologue = bb.data.getVar("postinst_prologue", d, 1)
+    prologue = d.getVar("postinst_prologue", 1)
 
-    gtk_libdir = bb.data.expand('${libdir}/gtk-3.0/${LIBV}', d)
+    gtk_libdir = d.expand('${libdir}/gtk-3.0/${LIBV}')
     immodules_root = os.path.join(gtk_libdir, 'immodules')
     printmodules_root = os.path.join(gtk_libdir, 'printbackends');
 
     do_split_packages(d, immodules_root, '^im-(.*)\.so$', 'gtk3-immodule-%s', 'GTK input module for %s', prologue + 'gtk-query-immodules-3.0 > /etc/gtk-3.0/gtk.immodules')
     do_split_packages(d, printmodules_root, '^libprintbackend-(.*)\.so$', 'gtk3-printbackend-%s', 'GTK printbackend module for %s')
 
-    if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-        bb.data.setVar('PKG_${PN}', 'libgtk-3.0', d)
+    if (d.getVar('DEBIAN_NAMES', 1)):
+        d.setVar('PKG_${PN}', 'libgtk-3.0')
 }
 
 postinst_prologue() {
diff --git a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
index 169dac5..9fe531b 100644
--- a/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
+++ b/meta-gnome/recipes-gnome/orbit2/orbit2_2.14.17.bb
@@ -3,7 +3,7 @@ SECTION = "x11/gnome/libs"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 SRC_NAME = "ORBit2"
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 SRC_URI = "${GNOME_MIRROR}/${SRC_NAME}/${SHRT_VER}/${SRC_NAME}-${PV}.tar.bz2 \
            file://configure-lossage.patch \
            file://pkgconfig-fix.patch"
diff --git a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
index 4b64731..c5d54ab 100644
--- a/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
+++ b/meta-gnome/recipes-support/goffice/goffice_0.8.17.bb
@@ -39,7 +39,7 @@ FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS}
 PACKAGES_DYNAMIC += "^goffice-plugin-.*"
 
 python populate_packages_prepend () {
-    goffice_libdir = bb.data.expand('${libdir}/goffice/${PV}/plugins/', d)
+    goffice_libdir = d.expand('${libdir}/goffice/${PV}/plugins/')
 
     do_split_packages(d, goffice_libdir, '(.*)', 'goffice-plugin-%s', 'Goffice plugin for %s', allow_dirs=True)
 }
diff --git a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
index 2190ca2..16cba89 100644
--- a/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
+++ b/meta-initramfs/recipes-devtools/klibc/klibc-utils.inc
@@ -96,9 +96,9 @@ PACKAGES_DYNAMIC += "^${KLIBC_UTILS_PKGNAME}-.*"
 
 python populate_packages_prepend () {
 
-    base_bin_dir = bb.data.expand('${base_bindir}', d)
+    base_bin_dir = d.expand('${base_bindir}')
     do_split_packages(d, base_bin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_links=True, allow_dirs=True)
 
-    base_sbin_dir = bb.data.expand('${base_sbindir}', d)
+    base_sbin_dir = d.expand('${base_sbindir}')
     do_split_packages(d, base_sbin_dir, '(.*)', '${KLIBC_UTILS_PKGNAME}-%s', 'Klibc util for %s', extra_depends='', allow_dirs=True)
 }
diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 238b0d2..165ba1e 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -51,14 +51,14 @@ def get_git_pkgv(d, use_tags):
     import os
     import bb
 
-    src_uri = bb.data.getVar('SRC_URI', d, 1).split()
+    src_uri = d.getVar('SRC_URI', 1).split()
     fetcher = bb.fetch2.Fetch(src_uri, d)
     ud = fetcher.ud
 
     #
     # If SRCREV_FORMAT is set respect it for tags
     #
-    format = bb.data.getVar('SRCREV_FORMAT', d, True)
+    format = d.getVar('SRCREV_FORMAT', True)
     if not format:
         format = 'default'
 
diff --git a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
index e994852..d6f3a54 100644
--- a/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
+++ b/meta-oe/recipes-connectivity/dnsmasq/dnsmasq.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
                     file://COPYING-v3;md5=d32239bcb673463ab874e80d47fae504"
 
 #at least versions 2.15 and prior are moved to the archive folder on the server
-SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(bb.data.getVar('PV',d,1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
+SRC_URI = "http://www.thekelleys.org.uk/dnsmasq/${@['archive/', ''][float(d.getVar('PV',1).split('.')[1]) > 15]}dnsmasq-${PV}.tar.gz;name=dnsmasq-${PV} \
            file://init \
            file://dnsmasq.conf"
 
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
index 3bcebab..1e9f15a 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.12.4.bb
@@ -9,8 +9,8 @@ EXTRA_OECONF = "--program-prefix="
 
 # Compatability for the rare systems not using or having SYSV
 python () {
-    if bb.data.getVar('HOST_NONSYSV', d, True) and bb.data.getVar('HOST_NONSYSV', d, True) != '0':
-        bb.data.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ', d)
+    if d.getVar('HOST_NONSYSV', True) and d.getVar('HOST_NONSYSV', True) != '0':
+        d.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ')
 }
 
 RDEPENDS_${PN} = "util-linux-native"
diff --git a/meta-oe/recipes-core/glib-2.0/glibmm.inc b/meta-oe/recipes-core/glib-2.0/glibmm.inc
index 60e9bce..15aeaac 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm.inc
+++ b/meta-oe/recipes-core/glib-2.0/glibmm.inc
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8045f3b8f929c1cb29a1e3fd737b499 \
                     file://COPYING.tools;md5=751419260aa954499f7abaabaa882bbe"
 
 DEPENDS = "mm-common glib-2.0 libsigc++-2.0"
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/glibmm/${SHRT_VER}/glibmm-${PV}.tar.bz2;name=archive"
 
diff --git a/meta-oe/recipes-core/meta/distro-feed-configs.bb b/meta-oe/recipes-core/meta/distro-feed-configs.bb
index a25ef8f..cff0946 100644
--- a/meta-oe/recipes-core/meta/distro-feed-configs.bb
+++ b/meta-oe/recipes-core/meta/distro-feed-configs.bb
@@ -21,8 +21,8 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 #def distro_feed_configs(d):
 #    import bb
-#    parchs = bb.data.getVar( "PACKAGE_EXTRA_ARCHS", d, 1 ).split()
-#    march = bb.data.getVar( "MACHINE_ARCH", d, 1 ).split()
+#    parchs = d.getVar( "PACKAGE_EXTRA_ARCHS", 1 ).split()
+#    march = d.getVar( "MACHINE_ARCH", 1 ).split()
 #    archs = [ "all" ] + parchs + march
 #    confs = [ ( "${sysconfdir}/opkg/%s-feed.conf" % feed ) for feed in archs ]
 #    return " ".join( confs )
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index f125fb5..451a3c6 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -16,7 +16,7 @@ SRC_URI[sha256sum] = "291ac350cc5eb4a01b0d651ca99fae64cee8a1c06b2005277fab5a4356
 S = "${WORKDIR}"
 FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
 
-CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][bb.data.getVar('USE_NLS', d, 1) != 'no']}"
+CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][d.getVar('USE_NLS', 1) != 'no']}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
diff --git a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
index c2f1cc8..8b796ac 100644
--- a/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
+++ b/meta-oe/recipes-devtools/libcanberra/libcanberra_0.26.bb
@@ -29,7 +29,7 @@ EXTRA_OECONF = "\
 # enable pulse again when pulseaudio >= 0.9.11 is the default in OE
 
 python populate_packages_prepend() {
-    plugindir = bb.data.expand('${libdir}/${P}/', d)
+    plugindir = d.expand('${libdir}/${P}/')
     do_split_packages(d, plugindir, '^libcanberra-(.*)\.so$', 'libcanberra-%s', '%s support library', extra_depends='' )
 }
 
diff --git a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
index a6044cd..fbd1466 100644
--- a/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
+++ b/meta-oe/recipes-devtools/libgee/libgee_0.6.4.bb
@@ -4,7 +4,7 @@ PR = "${INC_PR}.2"
 DEPENDS += "gobject-introspection-stub"
 DEPENDS_virtclass-native += "gobject-introspection-stub-native"
 
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/libgee/${SHRT_VER}/${BP}.tar.xz"
 SRC_URI[md5sum] = "a32bf498cf33d5e3417823a7b252ad22"
 SRC_URI[sha256sum] = "55f39f3b28e676f6cbd9377d83edd031084436a4da41280a9503c94faffb1665"
diff --git a/meta-oe/recipes-devtools/orc/orc.inc b/meta-oe/recipes-devtools/orc/orc.inc
index 6efe025..7a957f3 100644
--- a/meta-oe/recipes-devtools/orc/orc.inc
+++ b/meta-oe/recipes-devtools/orc/orc.inc
@@ -16,7 +16,7 @@ FILES_orc-examples = "${libdir}/orc/*"
 FILES_${PN} = "${bindir}/*"
 
 python populate_packages_prepend () {
-    libdir = bb.data.expand('${libdir}', d)
+    libdir = d.expand('${libdir}')
     do_split_packages(d, libdir, '^lib(.*)\.so\.*', 'lib%s', 'ORC %s library', extra_depends='', allow_links=True)
 }
 
diff --git a/meta-oe/recipes-devtools/vala/vala.inc b/meta-oe/recipes-devtools/vala/vala.inc
index 3d33953..6cdc605 100644
--- a/meta-oe/recipes-devtools/vala/vala.inc
+++ b/meta-oe/recipes-devtools/vala/vala.inc
@@ -9,7 +9,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
 INC_PR = "r1"
 
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/${BPN}/${SHRT_VER}/${BP}.tar.xz"
 inherit autotools
diff --git a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
index 8e842c4..3f6d767 100644
--- a/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
+++ b/meta-oe/recipes-graphics/openbox/openbox_3.5.0.bb
@@ -23,8 +23,8 @@ PACKAGES =+ "${PN}-core ${PN}-lxde ${PN}-gnome"
 PACKAGES_DYNAMIC += "^${PN}-theme-.*"
 
 python populate_packages_prepend() {
-    theme_dir = bb.data.expand('${datadir}/themes/', d)
-    theme_name = bb.data.expand('${PN}-theme-%s', d)
+    theme_dir = d.expand('${datadir}/themes/')
+    theme_name = d.expand('${PN}-theme-%s')
     do_split_packages(d, theme_dir, '(.*)', theme_name, '${PN} theme for %s', extra_depends='', allow_dirs=True)
 }
 
diff --git a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
index 2007e9c..4419113 100644
--- a/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
+++ b/meta-oe/recipes-graphics/pango/pangomm_2.28.2.bb
@@ -8,7 +8,7 @@ PR = "r2"
 
 DEPENDS = "mm-common cairomm glibmm"
 
-SHRT_VER = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+SHRT_VER = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "ftp://ftp.gnome.org/pub/GNOME/sources/pangomm/${SHRT_VER}/pangomm-${PV}.tar.bz2"
 SRC_URI[md5sum] = "005a474863495d3c6267429a80da6cf2"
diff --git a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
index 731c490..9103dab 100644
--- a/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
+++ b/meta-oe/recipes-graphics/ttf-fonts/ttf-mplus_027.bb
@@ -12,7 +12,7 @@ SRC_URI = "http://osdn.dl.sourceforge.jp/mplus-fonts/6650/mplus-TESTFLIGHT-${PV}
 S = "${WORKDIR}/mplus-TESTFLIGHT-${PV}"
 
 python populate_packages_prepend() {
-    plugindir = bb.data.expand('${datadir}/fonts/ttf-mplus/', d)
+    plugindir = d.expand('${datadir}/fonts/ttf-mplus/')
     do_split_packages(d, plugindir, '^(.*)\.ttf$', 'ttf-%s', 'TTF Font %s', extra_depends = "ttf-common")
 }
 
diff --git a/meta-oe/recipes-multimedia/libav/libav.inc b/meta-oe/recipes-multimedia/libav/libav.inc
index 0e80430..32fcd61 100644
--- a/meta-oe/recipes-multimedia/libav/libav.inc
+++ b/meta-oe/recipes-multimedia/libav/libav.inc
@@ -89,8 +89,8 @@ LEAD_SONAME = "libavcodec.so"
 FILES_${PN}-dev = "${includedir}"
 
 python populate_packages_prepend() {
-    av_libdir = bb.data.expand('${libdir}', d)
-    av_pkgconfig = bb.data.expand('${libdir}/pkgconfig', d)
+    av_libdir = d.expand('${libdir}')
+    av_pkgconfig = d.expand('${libdir}/pkgconfig')
 
     # Runtime package
     do_split_packages(d, av_libdir, '^lib(.*)\.so\..*',
diff --git a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
index bff5312..64f3e5d 100644
--- a/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
+++ b/meta-oe/recipes-multimedia/libcdio/libcdio_0.82.bb
@@ -22,7 +22,7 @@ FILES_${PN} = "${libdir}/${PN}${SOLIB}"
 FILES_${PN}-utils = "${bindir}/*"
 
 python populate_packages_prepend () {
-    glibdir = bb.data.expand('${libdir}', d)
+    glibdir = d.expand('${libdir}')
     do_split_packages(d, glibdir, '^lib(.*)\.so\..*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
 }
 
diff --git a/meta-oe/recipes-multimedia/live555/live555.inc b/meta-oe/recipes-multimedia/live555/live555.inc
index e47bacf..0301635 100644
--- a/meta-oe/recipes-multimedia/live555/live555.inc
+++ b/meta-oe/recipes-multimedia/live555/live555.inc
@@ -9,7 +9,7 @@ SECTION = "devel"
 
 INC_PR = "r0"
 
-URLV = "${@bb.data.getVar('PV',d,1)[0:4]}.${@bb.data.getVar('PV',d,1)[4:6]}.${@bb.data.getVar('PV',d,1)[6:8]}"
+URLV = "${@d.getVar('PV',1)[0:4]}.${@d.getVar('PV',1)[4:6]}.${@d.getVar('PV',1)[6:8]}"
 SRC_URI = "http://www.live555.com/liveMedia/public/live.${URLV}.tar.gz \
            file://config.linux-cross"
 
diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
index 08044ad..d963702 100644
--- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
+++ b/meta-oe/recipes-navigation/navit/navit-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_navit_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
         return "--enable-avoid-float"
     return ""
 
diff --git a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
index 2611b20..ad8768d 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.1.10.bb
@@ -27,8 +27,8 @@ do_configure() {
 }
 
 python populate_packages_prepend () {
-    if (bb.data.getVar('DEBIAN_NAMES', d, 1)):
-        bb.data.setVar('PKG_${PN}', 'libfltk${PV}', d)
+    if (d.getVar('DEBIAN_NAMES', 1)):
+        d.setVar('PKG_${PN}', 'libfltk${PV}')
 }
 
 LEAD_SONAME = "libfltk.so"
diff --git a/meta-oe/recipes-support/freerdp/freerdp.inc b/meta-oe/recipes-support/freerdp/freerdp.inc
index 673b372..d898f46 100644
--- a/meta-oe/recipes-support/freerdp/freerdp.inc
+++ b/meta-oe/recipes-support/freerdp/freerdp.inc
@@ -26,7 +26,7 @@ FILES_libfreerdp = "${libdir}/lib*${SOLIBS}"
 PACKAGES_DYNAMIC += "^libfreerdp-plugin-.*"
 
 python populate_packages_prepend () {
-    freerdp_root = bb.data.expand('${libdir}/freerdp', d)
+    freerdp_root = d.expand('${libdir}/freerdp')
 
     do_split_packages(d, freerdp_root, '^(audin_.*)\.so$',
         output_pattern='libfreerdp-plugin-%s',
diff --git a/meta-oe/recipes-support/links/links.inc b/meta-oe/recipes-support/links/links.inc
index 9001d2a..abd10f2 100644
--- a/meta-oe/recipes-support/links/links.inc
+++ b/meta-oe/recipes-support/links/links.inc
@@ -6,7 +6,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b0c80473f97008e42e29a9f80fcc55ff"
 DEPENDS = "jpeg libpng flex openssl zlib"
 
-LPV = "${@bb.data.getVar("PV",d,1).split("+")[1]}"
+LPV = "${@d.getVar("PV",1).split("+")[1]}"
 
 SRC_URI = "http://links.twibright.com/download/links-${LPV}.tar.bz2 \
            file://ac-prog-cxx.patch \
diff --git a/meta-oe/recipes-support/lzma/lzma.inc b/meta-oe/recipes-support/lzma/lzma.inc
index 457d7f4..75e6d67 100644
--- a/meta-oe/recipes-support/lzma/lzma.inc
+++ b/meta-oe/recipes-support/lzma/lzma.inc
@@ -4,7 +4,7 @@ LICENSE = "LGPL"
 LIC_FILES_CHKSUM = "file://lzma.txt;md5=20251cdc2e3793cceab11878d0aa11b1"
 INC_PR = "r7"
 
-SRC_URI = "http://downloads.sourceforge.net/sevenzip/lzma${@bb.data.getVar('PV',d,1).replace('.','')}.tar.bz2;subdir=${BPN}-${PV} \
+SRC_URI = "http://downloads.sourceforge.net/sevenzip/lzma${@d.getVar('PV',1).replace('.','')}.tar.bz2;subdir=${BPN}-${PV} \
            file://001-large_files.patch \
            file://002-lzmp.patch \
            file://003-compile_fixes.patch \
diff --git a/meta-oe/recipes-support/nano/nano.inc b/meta-oe/recipes-support/nano/nano.inc
index 68bcb2e..b73aae0 100644
--- a/meta-oe/recipes-support/nano/nano.inc
+++ b/meta-oe/recipes-support/nano/nano.inc
@@ -10,7 +10,7 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 INC_PR = "r3"
 
-PV_MAJOR = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
+PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
 
 SRC_URI = "http://www.nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.gz"
 
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index 6d0121c..2877093 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -40,23 +40,23 @@ TARGET_CC_ARCH += "-I${S}/include "
 PACKAGES += "${PN}-apps python-opencv"
 
 python populate_packages_prepend () {
-    cv_libdir = bb.data.expand('${libdir}', d)
-    cv_libdir_dbg = bb.data.expand('${libdir}/.debug', d)
+    cv_libdir = d.expand('${libdir}')
+    cv_libdir_dbg = d.expand('${libdir}/.debug')
     do_split_packages(d, cv_libdir, '^lib(.*)\.so$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev', allow_links=True)
     do_split_packages(d, cv_libdir, '^lib(.*)\.la$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
     do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
     do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
 
-    pn = bb.data.getVar('PN', d, 1)
+    pn = d.getVar('PN', 1)
     metapkg =  pn + '-dev'
-    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ] 
-    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
+    d.setVar('RRECOMMENDS_' + metapkg, ' '.join(metapkg_rdepends))
 }
 
 FILES_${PN} = ""
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
index 8d9bd6c..b9441ef 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.23.bb
@@ -11,7 +11,7 @@ LICENSE = "OpenLDAP"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3d82d3085f228af211a6502c7ea7c3c7"
 SECTION = "libs"
 
-LDAP_VER = "${@'.'.join(bb.data.getVar('PV',d,1).split('.')[0:2])}"
+LDAP_VER = "${@'.'.join(d.getVar('PV',1).split('.')[0:2])}"
 
 SRC_URI = "ftp://ftp.openldap.org/pub/OpenLDAP/openldap-release/${P}.tgz"
 SRC_URI += "file://openldap-m4-pthread.patch"
@@ -252,19 +252,19 @@ pkg_prerm_${PN}-slapd () {
 PACKAGES_DYNAMIC += "^openldap-backends.* ^openldap-backend-.*"
 
 python populate_packages_prepend () {
-    backend_dir    = bb.data.expand('${libexecdir}/openldap', d)
+    backend_dir    = d.expand('${libexecdir}/openldap')
     do_split_packages(d, backend_dir, 'back_([a-z]*)\-.*\.so\..*$', 'openldap-backend-%s', 'OpenLDAP %s backend', extra_depends='', allow_links=True)
 
     metapkg = "openldap-backends"
-    bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
-    bb.data.setVar('FILES_' + metapkg, "", d)
+    d.setVar('ALLOW_EMPTY_' + metapkg, "1")
+    d.setVar('FILES_' + metapkg, "")
     metapkg_rdepends = []
-    packages = bb.data.getVar('PACKAGES', d, 1).split()
+    packages = d.getVar('PACKAGES', 1).split()
     for pkg in packages[1:]:
         if pkg.count("openldap-backend-") and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale"):
             metapkg_rdepends.append(pkg)
-    bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
-    bb.data.setVar('DESCRIPTION_' + metapkg, 'OpenLDAP backends meta package', d)
+    d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
+    d.setVar('DESCRIPTION_' + metapkg, 'OpenLDAP backends meta package')
     packages.append(metapkg)
-    bb.data.setVar('PACKAGES', ' '.join(packages), d)
+    d.setVar('PACKAGES', ' '.join(packages))
 }
diff --git a/meta-oe/recipes-support/pidgin/pidgin.inc b/meta-oe/recipes-support/pidgin/pidgin.inc
index cb2a597..340e7f2 100644
--- a/meta-oe/recipes-support/pidgin/pidgin.inc
+++ b/meta-oe/recipes-support/pidgin/pidgin.inc
@@ -59,9 +59,9 @@ FILES_${PN}-dev += "${libdir}/${PN}/*.la"
 PACKAGES_DYNAMIC += "^libpurple-protocol-.* ^libpurple-plugin-.* ^pidgin-plugin-.* ^finch-plugin-.*"
 
 python populate_packages_prepend () {
-    pidgroot = bb.data.expand('${libdir}/pidgin', d)
-    purple   = bb.data.expand('${libdir}/purple-2', d)
-    finch    = bb.data.expand('${libdir}/finch', d)
+    pidgroot = d.expand('${libdir}/pidgin')
+    purple   = d.expand('${libdir}/purple-2')
+    finch    = d.expand('${libdir}/finch')
 
     do_split_packages(d, pidgroot, '^([^l][^i][^b].*)\.so$',
         output_pattern='pidgin-plugin-%s',
diff --git a/meta-oe/recipes-support/poppler/poppler-fpu.inc b/meta-oe/recipes-support/poppler/poppler-fpu.inc
index 11df852..67d97ca 100644
--- a/meta-oe/recipes-support/poppler/poppler-fpu.inc
+++ b/meta-oe/recipes-support/poppler/poppler-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_poppler_fpu_setting(bb, d):
-    if bb.data.getVar('TARGET_FPU', d, 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
         return "--enable-fixedpoint"
     return ""
 
diff --git a/meta-oe/recipes-support/vim/vim.inc b/meta-oe/recipes-support/vim/vim.inc
index 7b036a7..16ca58d 100644
--- a/meta-oe/recipes-support/vim/vim.inc
+++ b/meta-oe/recipes-support/vim/vim.inc
@@ -6,8 +6,8 @@ RSUGGESTS_${PN} = "diffutils"
 LICENSE = "vim"
 LIC_FILES_CHKSUM = "file://README.txt;md5=72c4840d07b65659b60b3fa405c7da36"
 
-PV_MAJOR = "${@bb.data.getVar('PV',d,1).split('.')[0]}.${@bb.data.getVar('PV',d,1).split('.')[1]}"
-VIMDIR = "${@bb.data.getVar('PV',d,1).split('.')[0]}${@bb.data.getVar('PV',d,1).split('.')[1]}"
+PV_MAJOR = "${@d.getVar('PV',1).split('.')[0]}.${@d.getVar('PV',1).split('.')[1]}"
+VIMDIR = "${@d.getVar('PV',1).split('.')[0]}${@d.getVar('PV',1).split('.')[1]}"
 
 INC_PR = "r11"
 
diff --git a/meta-systemd/classes/systemd.bbclass b/meta-systemd/classes/systemd.bbclass
index 96d7f8f..f26c6d1 100644
--- a/meta-systemd/classes/systemd.bbclass
+++ b/meta-systemd/classes/systemd.bbclass
@@ -29,9 +29,9 @@ systemctl disable ${SYSTEMD_SERVICE}
 }
 
 def get_package_var(d, var, pkg):
-    val = (d.getVar('%s_%s' % (var, pkg), d, 1) or "").strip()
+    val = (d.getVar('%s_%s' % (var, pkg), 1) or "").strip()
     if val == "":
-        val = (d.getVar(var, d, 1) or "").strip()
+        val = (d.getVar(var, 1) or "").strip()
     return val
 
 def systemd_after_parse(d):
@@ -94,9 +94,9 @@ do_install_append() {
 python populate_packages_prepend () {
     def systemd_generate_package_scripts(pkg):
         bb.debug(1, 'adding systemd calls to postinst/postrm for %s' % pkg)
-        localdata = bb.data.createCopy(d)
-        overrides = bb.data.getVar("OVERRIDES", localdata, 1)
-        bb.data.setVar("OVERRIDES", "%s:%s" % (pkg, overrides), localdata)
+        localdata = d.createCopy()
+        overrides = localdata.getVar("OVERRIDES", 1)
+        localdata.setVar("OVERRIDES", "%s:%s" % (pkg, overrides))
         bb.data.update_data(localdata)
 
         """
@@ -104,23 +104,23 @@ python populate_packages_prepend () {
         execute on the target. Not doing so may cause systemd postinst invoked
         twice to cause unwanted warnings.
         """ 
-        postinst = bb.data.getVar('pkg_postinst', localdata, 1)
+        postinst = localdata.getVar('pkg_postinst', 1)
         if not postinst:
             postinst = '#!/bin/sh\n'
-        postinst += bb.data.getVar('systemd_postinst', localdata, 1)
-        bb.data.setVar('pkg_postinst_%s' % pkg, postinst, d)
+        postinst += localdata.getVar('systemd_postinst', 1)
+        d.setVar('pkg_postinst_%s' % pkg, postinst)
 
-        prerm = bb.data.getVar('pkg_prerm', localdata, 1)
+        prerm = localdata.getVar('pkg_prerm', 1)
         if not prerm:
             prerm = '#!/bin/sh\n'
-        prerm += bb.data.getVar('systemd_prerm', localdata, 1)
-        bb.data.setVar('pkg_prerm_%s' % pkg, prerm, d)
+        prerm += localdata.getVar('systemd_prerm', 1)
+        d.setVar('pkg_prerm_%s' % pkg, prerm)
 
-        postrm = bb.data.getVar('pkg_postrm', localdata, 1)
+        postrm = localdata.getVar('pkg_postrm', 1)
         if not postrm:
             postrm = '#!/bin/sh\n'
-        postrm += bb.data.getVar('systemd_postrm', localdata, 1)
-        bb.data.setVar('pkg_postrm_%s' % pkg, postrm, d)
+        postrm += localdata.getVar('systemd_postrm', 1)
+        d.setVar('pkg_postrm_%s' % pkg, postrm)
 
     # add files to FILES_*-systemd if existent and not already done
     def systemd_append_file(pkg_systemd, file_append):
diff --git a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
index 1826dd2..400e11e 100644
--- a/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
+++ b/meta-xfce/recipes-art/xfwm4-themes/xfwm4-themes_4.10.0.bb
@@ -12,7 +12,7 @@ SRC_URI[sha256sum] = "3214d5f00e9703b5e8c9e7c3287d606dedec7285ceb4d5db332e93ada6
 # using xfwm4-theme as in xfwm4 might cause warnings of packages supplied by
 # multiple providers. So we use xfwm4-old-theme here.
 python populate_packages_prepend () {
-    themedir = bb.data.expand('${datadir}/themes', d)
+    themedir = d.expand('${datadir}/themes')
     do_split_packages(d, themedir, '^(.*)', 'xfwm4-old-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
 }
 
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
index bb914ba..f7d7c46 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.10.0.bb
@@ -10,8 +10,8 @@ SRC_URI[md5sum] = "cf7351a4b952dbe3fc5ff509c68def33"
 SRC_URI[sha256sum] = "3321f998af2bbd14ba68654a8881774f6ea2ec4f1a3544598e7f47d3ed0009b9"
 
 python populate_packages_prepend() {
-    plugin_dir = bb.data.expand('${libdir}/xfce4/panel/plugins/', d)
-    plugin_name = bb.data.expand('${PN}-plugin-%s', d)
+    plugin_dir = d.expand('${libdir}/xfce4/panel/plugins/')
+    plugin_name = d.expand('${PN}-plugin-%s')
     do_split_packages(d, plugin_dir, '^lib(.*).so$', plugin_name,
                       '${PN} plugin for %s', extra_depends='', prepend=True,
                       aux_files_pattern=['${datadir}/xfce4/panel/plugins/%s.desktop',
diff --git a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
index f17d4e5..4f686a5 100644
--- a/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfwm4/xfwm4_4.10.0.bb
@@ -10,7 +10,7 @@ SRC_URI[md5sum] = "333e5e25a85411c304e9b4474bf00537"
 SRC_URI[sha256sum] = "492357bf48121ebffabf2bf0d3b84213d19bf81087321175d687c8a68efe1f9c"
 
 python populate_packages_prepend () {
-    themedir = bb.data.expand('${datadir}/themes', d)
+    themedir = d.expand('${datadir}/themes')
     do_split_packages(d, themedir, '^(.*)', 'xfwm4-theme-%s', 'XFWM4 theme %s', allow_dirs=True)
 }
 
-- 
1.7.9.5



