Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 168CA60797
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 15:28:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 25 Nov 2016 07:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,547,1473145200"; 
   d="scan'208";a="9349825"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.26.83])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2016 07:28:55 -0800
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 25 Nov 2016 15:28:52 +0000
Message-Id: <1480087732-26808-1-git-send-email-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] remove True option to getVar calls
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 25 Nov 2016 15:28:56 -0000

getVar() now defaults to expanding by default, thus remove the True
option from getVar() calls with a regex search and replace.

Search made with the following regex: getVar ?\(( ?[^,()]*), True\)

Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta-efl/recipes-efl/efl/edje-fpu.inc                        |  2 +-
 .../lightmediascanner/lightmediascanner_0.5.1.bb             |  2 +-
 meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb            |  2 +-
 meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb   |  4 ++--
 .../recipes-bsp/images/initramfs-kexecboot-klibc-image.bb    |  2 +-
 meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb    |  2 +-
 meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb    |  4 ++--
 meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb   |  4 ++--
 meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb |  4 ++--
 meta-networking/recipes-kernel/netmap/netmap-modules_git.bb  |  6 +++---
 .../recipes-support/memcached/memcached_1.4.17.bb            |  2 +-
 meta-oe/classes/breakpad.bbclass                             |  6 +++---
 meta-oe/classes/gitpkgv.bbclass                              |  4 ++--
 meta-oe/classes/gitver.bbclass                               |  4 ++--
 meta-oe/classes/machine_kernel_pr.bbclass                    |  2 +-
 meta-oe/classes/socorro-syms.bbclass                         |  8 ++++----
 meta-oe/recipes-benchmark/glmark2/glmark2_git.bb             |  2 +-
 meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb          |  2 +-
 meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb      |  2 +-
 meta-oe/recipes-core/llvm/llvm.inc                           |  2 +-
 meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb |  2 +-
 meta-oe/recipes-core/toybox/toybox_0.7.1.bb                  |  4 ++--
 meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb         |  2 +-
 meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb              |  2 +-
 meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb                   |  2 +-
 meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb                  |  2 +-
 meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb           | 12 ++++++------
 meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb     |  2 +-
 meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb          |  4 ++--
 meta-oe/recipes-navigation/navit/navit-fpu.inc               |  2 +-
 meta-oe/recipes-support/atop/atop_2.2.3.bb                   |  2 +-
 meta-oe/recipes-support/fltk/fltk_1.3.3.bb                   |  2 +-
 meta-oe/recipes-support/libftdi/libftdi_1.3.bb               |  2 +-
 meta-oe/recipes-support/libssh/libssh_0.7.3.bb               |  2 +-
 meta-oe/recipes-support/ne10/ne10_1.2.1.bb                   |  4 ++--
 meta-oe/recipes-support/opencv/opencv_2.4.bb                 |  4 ++--
 meta-oe/recipes-support/opencv/opencv_3.1.bb                 |  4 ++--
 meta-oe/recipes-support/openldap/openldap_2.4.44.bb          |  2 +-
 meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb            |  2 +-
 meta-oe/recipes-support/poco/poco_1.7.5.bb                   |  4 ++--
 meta-oe/recipes-support/poppler/poppler_0.48.0.bb            |  2 +-
 meta-oe/recipes-support/postgresql/postgresql.inc            |  8 ++++----
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc              | 10 +++++-----
 meta-python/classes/pypi.bbclass                             |  8 ++++----
 44 files changed, 78 insertions(+), 78 deletions(-)

diff --git a/meta-efl/recipes-efl/efl/edje-fpu.inc b/meta-efl/recipes-efl/efl/edje-fpu.inc
index 3f2aacf..32a6daf 100644
--- a/meta-efl/recipes-efl/efl/edje-fpu.inc
+++ b/meta-efl/recipes-efl/efl/edje-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_edje_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         return "--enable-fixed-point"
     return ""
 
diff --git a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
index 9870fac..d8c6dbb 100644
--- a/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
+++ b/meta-efl/recipes-multimedia/lightmediascanner/lightmediascanner_0.5.1.bb
@@ -57,6 +57,6 @@ python populate_packages_prepend () {
     pkgs = []
 
     pkgs += do_split_packages(d, oe.path.join(lms_libdir, "plugins"), '^(.*)\.so$', d.expand('${PN}-plugin-%s'), 'LightMediaScanner plugin for %s', prepend=True, extra_depends=d.expand('${PN}'))
-    metapkg = d.getVar('PN', True) + '-meta'
+    metapkg = d.getVar('PN') + '-meta'
     d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
 }
diff --git a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
index 5052b36..ec17c75 100644
--- a/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
+++ b/meta-gnome/recipes-gnome/abiword/abiword_3.0.1.bb
@@ -111,7 +111,7 @@ python populate_packages_prepend () {
     d.setVar('FILES_' + metapkg, "")
     blacklist = [ 'abiword-plugins-dbg', 'abiword-plugins', 'abiword-plugins-doc', 'abiword-plugins-dev', 'abiword-plugins-locale' ]
     metapkg_rdepends = []
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale") and not pkg.count("abiword-doc"):
             print("Modifying %s" % pkg)
diff --git a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c0ac911..90ed5a4 100644
--- a/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta-gnome/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -41,8 +41,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 UPSTREAM_CHECK_REGEX = "(?P<pver>2\.([0-8]*[02468])+(\.\d+)+)"
 
 python populate_packages_prepend() {
-    engines_root = os.path.join(d.getVar('libdir', True), "gtk-2.0/2.10.0/engines")
-    themes_root = os.path.join(d.getVar('datadir', True), "themes")
+    engines_root = os.path.join(d.getVar('libdir'), "gtk-2.0/2.10.0/engines")
+    themes_root = os.path.join(d.getVar('datadir'), "themes")
 
     do_split_packages(d, engines_root, '^lib(.*)\.so$', 'gtk-engine-%s', 'GTK %s theme engine', extra_depends='')
     do_split_packages(d, themes_root, '(.*)', 'gtk-theme-%s', 'GTK theme %s', allow_dirs=True, extra_depends='')
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index da3023f..b7a8a93 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -7,7 +7,7 @@ SUMMARY = "Initramfs image for kexecboot kernel (klibc-static binaries)"
 IMAGE_INSTALL = "kexecboot-klibc kexec-klibc ubiattach-klibc"
 
 python () {
-    if d.getVar('TARGET_ARCH', True) == "nios2":
+    if d.getVar('TARGET_ARCH') == "nios2":
         raise bb.parse.SkipPackage("'nios2' not supported arch")
 }
 
diff --git a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
index 69f3872..085955c 100644
--- a/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
+++ b/meta-initramfs/recipes-bsp/kexecboot/kexecboot-cfg_0.2.bb
@@ -57,4 +57,4 @@ CMDLINE_DEBUG ?= "quiet"
 INHIBIT_DEFAULT_DEPS = "1"
 
 # Note: for qvga the label is currently limited to about 24 chars
-KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO', True) or d.getVar('DISTRO_VERSION', True)}-${MACHINE}"
+KEXECBOOT_LABEL ?= "${@d.getVar('DISTRO') or d.getVar('DISTRO_VERSION')}-${MACHINE}"
diff --git a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
index 2f4afce..3a4e7b5 100644
--- a/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
+++ b/meta-initramfs/recipes-devtools/klibc/klcc-cross_2.0.4.bb
@@ -36,5 +36,5 @@ deltask do_package_write_tar
 
 SSTATE_SCAN_FILES = "*"
 EXTRA_STAGING_FIXMES = "MANGLEDSTAGINGDIRTARGET MANGLEDSTAGINGDIR"
-MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR", True).replace("/", "\\\\/").replace("-", "\\\\-")}"
-MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET", True).replace("/", "\\\\/").replace("-", "\\\\-")}"
+MANGLEDSTAGINGDIR = "${@d.getVar("STAGING_DIR").replace("/", "\\\\/").replace("-", "\\\\-")}"
+MANGLEDSTAGINGDIRTARGET = "${@d.getVar("STAGING_DIR_TARGET").replace("/", "\\\\/").replace("-", "\\\\-")}"
diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
index 79ff6e2..38fac65 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.28.2.bb
@@ -48,12 +48,12 @@ PACKAGES_DYNAMIC = "${PN}-plugin-*"
 
 python populate_packages_prepend () {
     rygel_libdir = d.expand('${libdir}/rygel-${LIBV}')
-    postinst = d.getVar('plugin_postinst', True)
+    postinst = d.getVar('plugin_postinst')
     pkgs = []
 
     pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), 'librygel-(.*)\.so$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
     pkgs += do_split_packages(d, oe.path.join(rygel_libdir, "plugins"), '(.*)\.plugin$', d.expand('${PN}-plugin-%s'), 'Rygel plugin for %s', postinst=postinst, extra_depends=d.expand('${PN}'))
 
-    metapkg = d.getVar('PN', True) + '-meta'
+    metapkg = d.getVar('PN') + '-meta'
     d.setVar('RDEPENDS_' + metapkg, ' '.join(pkgs))
 }
diff --git a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
index e9b726c..d24b81b 100644
--- a/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
+++ b/meta-networking/recipes-filter/ebtables/ebtables_2.0.10-4.bb
@@ -30,8 +30,8 @@ inherit update-rc.d systemd
 python __anonymous () {
     import re
 
-    karch = d.getVar('KARCH', True)
-    multilib = d.getVar('MLPREFIX', True)
+    karch = d.getVar('KARCH')
+    multilib = d.getVar('MLPREFIX')
 
     if multilib and karch == 'powerpc64':
         searchstr = "lib.?32"
diff --git a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
index e9eea56..82b9b05 100644
--- a/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
+++ b/meta-networking/recipes-kernel/netmap/netmap-modules_git.bb
@@ -33,8 +33,8 @@ NETMAP_DRIVERS ??= ""
 NETMAP_ALL_DRIVERS = "ixgbe igb e1000e e1000 veth.c forcedeth.c virtio_net.c r8169.c"
 
 python __anonymous () {
-    drivers_list = d.getVar("NETMAP_DRIVERS", True).split()
-    all_drivers_list = d.getVar("NETMAP_ALL_DRIVERS", True).split()
+    drivers_list = d.getVar("NETMAP_DRIVERS").split()
+    all_drivers_list = d.getVar("NETMAP_ALL_DRIVERS").split()
     config_drivers = "--drivers=" + ",".join(drivers_list)
 
     extra_oeconf_drivers = bb.utils.contains_any('NETMAP_DRIVERS', all_drivers_list, config_drivers, '--no-drivers', d)
@@ -70,7 +70,7 @@ do_configure_append () {
 #define NETMAP_LINUX_HAVE_E1000E_DOWN2
 EOF
 
-if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION', True) or "0", '3.17') < 0) else 'true' } ; then
+if ${@ 'false' if (bb.utils.vercmp_string(d.getVar('KERNEL_VERSION') or "0", '3.17') < 0) else 'true' } ; then
     echo OK
     cat >>  ${S}/LINUX/netmap_linux_config.h <<EOF
 #define NETMAP_LINUX_ALLOC_NETDEV_4ARGS
diff --git a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
index 293f8d4..2b36ba4 100644
--- a/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
+++ b/meta-networking/recipes-support/memcached/memcached_1.4.17.bb
@@ -30,7 +30,7 @@ SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
 SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
 
 python __anonymous () {
-    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
+    endianness = d.getVar('SITEINFO_ENDIANNESS')
     if endianness == 'le':
         d.appendVar('EXTRA_OECONF', " ac_cv_c_endian=little")
     else:
diff --git a/meta-oe/classes/breakpad.bbclass b/meta-oe/classes/breakpad.bbclass
index b3abf27..36f11ff 100644
--- a/meta-oe/classes/breakpad.bbclass
+++ b/meta-oe/classes/breakpad.bbclass
@@ -10,11 +10,11 @@ CXXFLAGS += "-I${STAGING_DIR_TARGET}${includedir}/breakpad "
 BREAKPAD_BIN ?= ""
 
 python () {
-    breakpad_bin = d.getVar("BREAKPAD_BIN", True)
+    breakpad_bin = d.getVar("BREAKPAD_BIN")
 
     if not breakpad_bin:
-       PN = d.getVar("PN", True)
-       FILE = os.path.basename(d.getVar("FILE", True))
+       PN = d.getVar("PN")
+       FILE = os.path.basename(d.getVar("FILE"))
        bb.error("To build %s, see breakpad.bbclass for instructions on \
                  setting up your Breakpad configuration" % PN)
        raise ValueError('BREAKPAD_BIN not defined in %s' % PN)
diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bbclass
index 8cd4bfd..3949b43 100644
--- a/meta-oe/classes/gitpkgv.bbclass
+++ b/meta-oe/classes/gitpkgv.bbclass
@@ -52,14 +52,14 @@ def get_git_pkgv(d, use_tags):
     import bb
     from pipes import quote
 
-    src_uri = d.getVar('SRC_URI', 1).split()
+    src_uri = d.getVar('SRC_URI').split()
     fetcher = bb.fetch2.Fetch(src_uri, d)
     ud = fetcher.ud
 
     #
     # If SRCREV_FORMAT is set respect it for tags
     #
-    format = d.getVar('SRCREV_FORMAT', True)
+    format = d.getVar('SRCREV_FORMAT')
     if not format:
         names = []
         for url in ud.values():
diff --git a/meta-oe/classes/gitver.bbclass b/meta-oe/classes/gitver.bbclass
index e7b5155..71bf42f 100644
--- a/meta-oe/classes/gitver.bbclass
+++ b/meta-oe/classes/gitver.bbclass
@@ -24,7 +24,7 @@ def get_git_pv(path, d, tagadjust=None):
     import os
     import bb.process
 
-    gitdir = os.path.abspath(os.path.join(d.getVar("S", True), ".git"))
+    gitdir = os.path.abspath(os.path.join(d.getVar("S"), ".git"))
     try:
         ver = gitrev_run("git describe --tags", gitdir)
     except Exception, exc:
@@ -71,5 +71,5 @@ def mark_recipe_dependencies(path, d):
         mark_dependency(d, tagdir)
 
 python () {
-    mark_recipe_dependencies(d.getVar("S", True), d)
+    mark_recipe_dependencies(d.getVar("S"), d)
 }
diff --git a/meta-oe/classes/machine_kernel_pr.bbclass b/meta-oe/classes/machine_kernel_pr.bbclass
index 463b64d..e48bd01 100644
--- a/meta-oe/classes/machine_kernel_pr.bbclass
+++ b/meta-oe/classes/machine_kernel_pr.bbclass
@@ -1,6 +1,6 @@
 python __anonymous () {
 
-    machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR', True)
+    machine_kernel_pr = d.getVar('MACHINE_KERNEL_PR')
 
     if machine_kernel_pr:
         d.setVar('PR', machine_kernel_pr)
diff --git a/meta-oe/classes/socorro-syms.bbclass b/meta-oe/classes/socorro-syms.bbclass
index 3f6ae63..cc435ab 100644
--- a/meta-oe/classes/socorro-syms.bbclass
+++ b/meta-oe/classes/socorro-syms.bbclass
@@ -21,10 +21,10 @@ FILES_${PN}-socorro-syms = "/usr/share/socorro-syms"
 
 python symbol_file_preprocess() {
 
-    package_dir = d.getVar("PKGD", True)
-    breakpad_bin = d.getVar("BREAKPAD_BIN", True)
+    package_dir = d.getVar("PKGD")
+    breakpad_bin = d.getVar("BREAKPAD_BIN")
     if not breakpad_bin:
-        package_name = d.getVar("PN", True)
+        package_name = d.getVar("PN")
         bb.error("Package %s depends on Breakpad via socorro-syms. See "
             "breakpad.bbclass for instructions on setting up the Breakpad "
             "configuration." % package_name)
@@ -106,7 +106,7 @@ def repository_path(d, source_file_path):
         # child of the build directory TOPDIR.
         git_root_dir = run_command(
             "git rev-parse --show-toplevel", os.path.dirname(source_file_path))
-        if not git_root_dir.startswith(d.getVar("TOPDIR", True)):
+        if not git_root_dir.startswith(d.getVar("TOPDIR")):
             return None
 
         return git_repository_path(source_file_path)
diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
index e8ccf37..26c5c04 100644
--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
@@ -39,7 +39,7 @@ PACKAGECONFIG[wayland-gl] = ",,virtual/libgl wayland"
 PACKAGECONFIG[wayland-gles2] = ",,virtual/libgles2 wayland"
 
 python __anonymous() {
-    packageconfig = (d.getVar("PACKAGECONFIG", True) or "").split()
+    packageconfig = (d.getVar("PACKAGECONFIG") or "").split()
     flavors = []
     if "x11-gles2" in packageconfig:
         flavors.append("x11-glesv2")
diff --git a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
index 52bf811..4365aa4 100644
--- a/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
+++ b/meta-oe/recipes-connectivity/usbmuxd/usbmuxd_git.bb
@@ -18,7 +18,7 @@ S = "${WORKDIR}/git"
 FILES_${PN} += "${base_libdir}/udev/rules.d/"
 
 # fix usbmuxd installing files to /usr/lib64 on 64bit hosts:
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[plist] = "-DWANT_PLIST=1,-DWANT_PLIST=0,libplist"
diff --git a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
index a27a60b..9d50ea4 100644
--- a/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
+++ b/meta-oe/recipes-core/fakeroot/fakeroot-native_1.18.4.bb
@@ -8,7 +8,7 @@ EXTRA_OECONF = "--program-prefix="
 
 # Compatability for the rare systems not using or having SYSV
 python () {
-    if d.getVar('HOST_NONSYSV', True) and d.getVar('HOST_NONSYSV', True) != '0':
+    if d.getVar('HOST_NONSYSV') and d.getVar('HOST_NONSYSV') != '0':
         d.setVar('EXTRA_OECONF', ' --with-ipc=tcp --program-prefix= ')
 }
 
diff --git a/meta-oe/recipes-core/llvm/llvm.inc b/meta-oe/recipes-core/llvm/llvm.inc
index fa971f3..f27261f 100644
--- a/meta-oe/recipes-core/llvm/llvm.inc
+++ b/meta-oe/recipes-core/llvm/llvm.inc
@@ -153,7 +153,7 @@ python llvm_populate_packages() {
     split_packages = do_split_packages(d, libdir, '^lib(.*)\.so$', 'libllvm${LLVM_RELEASE}-%s', 'Split package for %s', allow_dirs=True, allow_links=True, recursive=True)
     split_staticdev_packages = do_split_packages(d, libllvm_libdir, '^lib(.*)\.a$', 'libllvm${LLVM_RELEASE}-%s-staticdev', 'Split staticdev package for %s', allow_dirs=True)
     if split_packages:
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('RDEPENDS_' + pn, ' '+' '.join(split_packages))
         d.appendVar('RDEPENDS_' + pn + '-dbg', ' '+' '.join(split_dbg_packages))
         d.appendVar('RDEPENDS_' + pn + '-staticdev', ' '+' '.join(split_staticdev_packages))
diff --git a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
index a46a91c..f11ae7e 100644
--- a/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
+++ b/meta-oe/recipes-core/proxy-libintl/proxy-libintl_20100902.bb
@@ -18,7 +18,7 @@ PACKAGES = "${PN} ${PN}-dev"
 FILES_${PN}-dev = "${includedir}/libintl.h ${libdir}/libintl.a"
 INSANE_SKIP_${PN}-dev = "staticdev"
 ALLOW_EMPTY_${PN} = "1"
-CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][d.getVar('USE_NLS', 1) != 'no']}"
+CFLAGS_append = " -fPIC -Wall -I ../../include ${@['-DSTUB_ONLY', ''][d.getVar('USE_NLS') != 'no']}"
 TARGET_CC_ARCH += "${LDFLAGS}"
 
 do_compile() {
diff --git a/meta-oe/recipes-core/toybox/toybox_0.7.1.bb b/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
index defca70..032b138 100644
--- a/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
+++ b/meta-oe/recipes-core/toybox/toybox_0.7.1.bb
@@ -59,8 +59,8 @@ python do_package_prepend () {
     # Read links from /etc/toybox.links and create appropriate
     # update-alternatives variables
 
-    dvar = d.getVar('D', True)
-    pn = d.getVar('PN', True)
+    dvar = d.getVar('D')
+    pn = d.getVar('PN')
     target = "/bin/toybox"
 
     f = open('%s/etc/toybox.links' % (dvar), 'r')
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb b/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
index 781287a..ff7944f 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_1.28.bb
@@ -5,7 +5,7 @@ LICENSE_DEFAULT = "GPLv2"
 LICENSE = "${LICENSE_DEFAULT} & BSD-2-Clause & GPLv3"
 
 python () {
-    for plugin in d.getVar('PLUGINS', True).split():
+    for plugin in d.getVar('PLUGINS').split():
         if 'LICENSE_%s' % plugin not in d:
             d.setVar('LICENSE_' + plugin, '${LICENSE_DEFAULT}')
 }
diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
index 03e9812..574d50a 100644
--- a/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
+++ b/meta-oe/recipes-devtools/nodejs/nodejs_4.6.1.bb
@@ -44,7 +44,7 @@ do_configure () {
     GYP_DEFINES="${GYP_DEFINES}" export GYP_DEFINES
     # $TARGET_ARCH settings don't match --dest-cpu settings
    ./configure --prefix=${prefix} --without-snapshot --shared-openssl --shared-zlib \
-               --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH', True), d)}" \
+               --dest-cpu="${@map_nodejs_arch(d.getVar('TARGET_ARCH'), d)}" \
                --dest-os=linux \
                ${ARCHFLAGS}
 }
diff --git a/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb b/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
index 59075bc..d3bf397 100644
--- a/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
+++ b/meta-oe/recipes-devtools/tcltk/tk_8.6.6.bb
@@ -32,7 +32,7 @@ SRC_URI[sha256sum] = "d62c371a71b4744ed830e3c21d27968c31dba74dd2c45f36b9b071e6d8
 S = "${WORKDIR}/${BPN}${PV}/unix"
 
 # Short version format: "8.6"
-VER = "${@os.path.splitext(d.getVar('PV', True))[0]}"
+VER = "${@os.path.splitext(d.getVar('PV'))[0]}"
 
 LDFLAGS += "-Wl,-rpath,${libdir}/tcltk/${PV}/lib"
 inherit autotools distro_features_check
diff --git a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
index 1bf5389..d9a5821 100644
--- a/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
+++ b/meta-oe/recipes-devtools/yajl/yajl_2.1.0.bb
@@ -15,4 +15,4 @@ S = "${WORKDIR}/git"
 
 inherit cmake lib_package
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
index 7242323..4e2c122 100644
--- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.22.0.bb
@@ -158,15 +158,15 @@ RRECOMMENDS_${PN}-ptest += "${TCLIBC}-dbg ${VALGRIND}"
 # no syslog-init for systemd
 python () {
     if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        sysconfdir = d.getVar('sysconfdir', True)
+        pn = d.getVar('PN')
+        sysconfdir = d.getVar('sysconfdir')
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir', True), d.getVar('BPN', True)))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-init', '%s/init.d/syslog.%s' % (d.getVar('sysconfdir'), d.getVar('BPN')))
 
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir', True)))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir')))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/rsyslog.service' % (d.getVar('systemd_unitdir')))
 }
diff --git a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb b/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
index 28ea33e..ac36a91 100644
--- a/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
+++ b/meta-oe/recipes-graphics/tesseract/tesseract-lang_git.bb
@@ -18,7 +18,7 @@ do_install() {
 python populate_packages_prepend () {
     tessdata_dir= d.expand('${datadir}/tessdata')
     pkgs = do_split_packages(d, tessdata_dir, '^([a-z_]*)\.*', '${BPN}-%s', 'tesseract-ocr language files for %s', extra_depends='')
-    pn = d.getVar('PN', True)
+    pn = d.getVar('PN')
     d.appendVar('RDEPENDS_' + pn, ' '+' '.join(pkgs))
 }
 
diff --git a/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb b/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
index 9d9a634..e5882e8 100644
--- a/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
+++ b/meta-oe/recipes-multimedia/libopus/libopus_1.1.2.bb
@@ -27,11 +27,11 @@ EXTRA_OECONF = "--with-NE10-includes=${STAGING_DIR_TARGET}${includedir} \
                "
 
 python () {
-    if d.getVar('TARGET_FPU', True) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         d.appendVar('PACKAGECONFIG', ' fixed-point')
 
     # Ne10 is only available for armv7 and aarch64
-    if any((t.startswith('armv7') or t.startswith('aarch64')) for t in d.getVar('TUNE_FEATURES', True).split()):
+    if any((t.startswith('armv7') or t.startswith('aarch64')) for t in d.getVar('TUNE_FEATURES').split()):
         d.appendVar('DEPENDS', ' ne10')
 }
 
diff --git a/meta-oe/recipes-navigation/navit/navit-fpu.inc b/meta-oe/recipes-navigation/navit/navit-fpu.inc
index d963702..54b7a97 100644
--- a/meta-oe/recipes-navigation/navit/navit-fpu.inc
+++ b/meta-oe/recipes-navigation/navit/navit-fpu.inc
@@ -1,6 +1,6 @@
 
 def get_navit_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         return "--enable-avoid-float"
     return ""
 
diff --git a/meta-oe/recipes-support/atop/atop_2.2.3.bb b/meta-oe/recipes-support/atop/atop_2.2.3.bb
index 21311e3..a36f08d 100644
--- a/meta-oe/recipes-support/atop/atop_2.2.3.bb
+++ b/meta-oe/recipes-support/atop/atop_2.2.3.bb
@@ -15,7 +15,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=393a5ca445f6965873eca0259a17f833"
 
 DEPENDS = "ncurses zlib"
 
-ATOP_VER = "${@'-'.join(d.getVar('PV', True).rsplit('.', 1))}"
+ATOP_VER = "${@'-'.join(d.getVar('PV').rsplit('.', 1))}"
 
 SRC_URI = " \
     http://www.atoptool.nl/download/${BPN}-${ATOP_VER}.tar.gz \
diff --git a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
index 117ecc3..efba3a9 100644
--- a/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
+++ b/meta-oe/recipes-support/fltk/fltk_1.3.3.bb
@@ -41,7 +41,7 @@ do_install_append_class-target() {
 }
 
 python populate_packages_prepend () {
-    if (d.getVar('DEBIAN_NAMES', 1)):
+    if (d.getVar('DEBIAN_NAMES')):
         d.setVar('PKG_${BPN}', 'libfltk${PV}')
 }
 
diff --git a/meta-oe/recipes-support/libftdi/libftdi_1.3.bb b/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
index 5eee0db..199e5a8 100644
--- a/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
+++ b/meta-oe/recipes-support/libftdi/libftdi_1.3.bb
@@ -24,7 +24,7 @@ PACKAGECONFIG[cpp-wrapper] = "-DFTDI_BUILD_CPP=on -DFTDIPP=on,-DFTDI_BUILD_CPP=o
 
 inherit cmake binconfig pkgconfig
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 FILES_${PN}-dev += "${libdir}/cmake"
 
diff --git a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
index c0b8913..6c22649 100644
--- a/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
+++ b/meta-oe/recipes-support/libssh/libssh_0.7.3.bb
@@ -16,7 +16,7 @@ EXTRA_OECMAKE = " \
     -DWITH_PCAP=1 \
     -DWITH_SFTP=1 \
     -DWITH_ZLIB=1 \
-    -DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')} \
+    -DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')} \
     "
 
 PACKAGECONFIG ??=""
diff --git a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
index de97982..1c097ab 100644
--- a/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
+++ b/meta-oe/recipes-support/ne10/ne10_1.2.1.bb
@@ -18,10 +18,10 @@ COMPATIBLE_MACHINE_aarch64 = "(.*)"
 COMPATIBLE_MACHINE_armv7a = "(.*)"
 
 python () {
-    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES', True).split()):
+    if any(t.startswith('armv7') for t in d.getVar('TUNE_FEATURES').split()):
         d.setVar('NE10_TARGET_ARCH', 'armv7')
         bb.debug(2, 'Building Ne10 for armv7')
-    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES', True).split()):
+    elif any(t.startswith('aarch64') for t in d.getVar('TUNE_FEATURES').split()):
         d.setVar('NE10_TARGET_ARCH', 'aarch64')
         bb.debug(2, 'Building Ne10 for aarch64')
     else:
diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/recipes-support/opencv/opencv_2.4.bb
index ced066f..de2f052 100644
--- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
+++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
@@ -65,12 +65,12 @@ python populate_packages_prepend () {
     do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
     do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
 
-    pn = d.getVar('PN', 1)
+    pn = d.getVar('PN')
     metapkg =  pn + '-dev'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
             metapkg_rdepends.append(pkg)
diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index 2136b07..8ab63d2 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -91,12 +91,12 @@ python populate_packages_prepend () {
     do_split_packages(d, cv_libdir, '^lib(.*)\.a$', 'lib%s-dev', 'OpenCV %s development package', extra_depends='${PN}-dev')
     do_split_packages(d, cv_libdir, '^lib(.*)\.so\.*', 'lib%s', 'OpenCV %s library', extra_depends='', allow_links=True)
 
-    pn = d.getVar('PN', 1)
+    pn = d.getVar('PN')
     metapkg =  pn + '-dev'
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages[1:]:
         if not pkg in blacklist and not pkg in metapkg_rdepends and pkg.endswith('-dev'):
             metapkg_rdepends.append(pkg)
diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
index 4e95a77..6f2a76b 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.44.bb
@@ -242,7 +242,7 @@ python populate_packages_prepend () {
     d.setVar('ALLOW_EMPTY_' + metapkg, "1")
     d.setVar('FILES_' + metapkg, "")
     metapkg_rdepends = []
-    packages = d.getVar('PACKAGES', 1).split()
+    packages = d.getVar('PACKAGES').split()
     for pkg in packages[1:]:
         if pkg.count("openldap-backend-") and not pkg in metapkg_rdepends and not pkg.count("-dev") and not pkg.count("-dbg") and not pkg.count("static") and not pkg.count("locale"):
             metapkg_rdepends.append(pkg)
diff --git a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
index bd15bba..8c948c5 100644
--- a/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
+++ b/meta-oe/recipes-support/opensync/wbxml2_0.10.8.bb
@@ -15,7 +15,7 @@ S = "${WORKDIR}/libwbxml-${PV}"
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
+EXTRA_OECMAKE = "-DLIB_SUFFIX=${@d.getVar('baselib').replace('lib', '')}"
 
 PACKAGES += "${PN}-tools"
 
diff --git a/meta-oe/recipes-support/poco/poco_1.7.5.bb b/meta-oe/recipes-support/poco/poco_1.7.5.bb
index 0fc50e1..2cab796 100644
--- a/meta-oe/recipes-support/poco/poco_1.7.5.bb
+++ b/meta-oe/recipes-support/poco/poco_1.7.5.bb
@@ -62,12 +62,12 @@ PACKAGES = "${PN}-dbg ${POCO_PACKAGES}"
 python __anonymous () {
     packages = []
     testrunners = []
-    components = d.getVar("PACKAGECONFIG", True).split()
+    components = d.getVar("PACKAGECONFIG").split()
     components.append("Foundation")
     for lib in components:
         pkg = ("poco-%s" % lib.lower()).replace("_","")
         packages.append(pkg)
-        if not d.getVar("FILES_%s" % pkg, True):
+        if not d.getVar("FILES_%s" % pkg):
             d.setVar("FILES_%s" % pkg, "${libdir}/libPoco%s.so.*" % lib)
         testrunners.append("%s" % lib)
 
diff --git a/meta-oe/recipes-support/poppler/poppler_0.48.0.bb b/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
index c586755..ebe986b 100644
--- a/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
+++ b/meta-oe/recipes-support/poppler/poppler_0.48.0.bb
@@ -43,7 +43,7 @@ SRC_URI_append = "${QT4E_PATCHES}"
 
 # check for TARGET_FPU=soft and inform configure of the result so it can disable some floating points
 def get_poppler_fpu_setting(bb, d):
-    if d.getVar('TARGET_FPU', 1) in [ 'soft' ]:
+    if d.getVar('TARGET_FPU') in [ 'soft' ]:
         return "--enable-fixedpoint"
     return ""
 
diff --git a/meta-oe/recipes-support/postgresql/postgresql.inc b/meta-oe/recipes-support/postgresql/postgresql.inc
index 454624c..f720cbc 100644
--- a/meta-oe/recipes-support/postgresql/postgresql.inc
+++ b/meta-oe/recipes-support/postgresql/postgresql.inc
@@ -91,7 +91,7 @@ python populate_packages_prepend() {
             fpack="${PN}-" + name + "-dbg" + " " + fpack
         d.setVar('PACKAGES', fpack)
 
-    conf=(d.getVar('PACKAGECONFIG', True) or "").split()
+    conf=(d.getVar('PACKAGECONFIG') or "").split()
     pack=d.getVar('PACKAGES', False) or ""
     bb.debug(1, "PACKAGECONFIG=%s" % conf)
     bb.debug(1, "PACKAGES1=%s" % pack )
@@ -105,7 +105,7 @@ python populate_packages_prepend() {
     if "python" in conf:
         fill_more("plpython")
 
-    pack=d.getVar('PACKAGES', True) or ""
+    pack=d.getVar('PACKAGES') or ""
     bb.debug(1, "PACKAGES2=%s" % pack)
 
 }
@@ -191,7 +191,7 @@ do_install_append() {
     # multiple server config directory
     install -d -m 700 ${D}${sysconfdir}/default/${BPN}
 
-    if [ "${@d.getVar('enable_pam', True)}" = "pam" ]; then
+    if [ "${@d.getVar('enable_pam')}" = "pam" ]; then
         install -d ${D}${sysconfdir}/pam.d
         install -m 644 ${WORKDIR}/postgresql.pam ${D}${sysconfdir}/pam.d/postgresql
     fi
@@ -221,7 +221,7 @@ FILES_${PN} += "${sysconfdir}/init.d/${BPN}-server \
     ${libdir}/${BPN}/libpqwalreceiver.so \
     ${libdir}/${BPN}/*_and_*.so \
     ${@'${sysconfdir}/pam.d/postgresql' \
-       if 'pam' == d.getVar('enable_pam', True) \
+       if 'pam' == d.getVar('enable_pam') \
        else ''} \
 "
 
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 898e9c2..7b56dd4 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -104,17 +104,17 @@ SYSTEMD_SERVICE_${PN} = "${BPN}.service"
 # no syslog-init for systemd
 python () {
     if bb.utils.contains('DISTRO_FEATURES', 'sysvinit', True, False, d):
-        pn = d.getVar('PN', True)
-        sysconfdir = d.getVar('sysconfdir', True)
+        pn = d.getVar('PN')
+        sysconfdir = d.getVar('sysconfdir')
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-init')
         d.setVarFlag('ALTERNATIVE_PRIORITY', 'syslog-init', '200')
         d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-init', '%s/init.d/syslog' % (sysconfdir))
 
     if bb.utils.contains('DISTRO_FEATURES', 'systemd', True, False, d):
-        pn = d.getVar('PN', True)
+        pn = d.getVar('PN')
         d.appendVar('ALTERNATIVE_%s' % (pn), ' syslog-service')
-        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir', True)))
-        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/${BPN}.service' % (d.getVar('systemd_unitdir', True)))
+        d.setVarFlag('ALTERNATIVE_LINK_NAME', 'syslog-service', '%s/systemd/system/syslog.service' % (d.getVar('sysconfdir')))
+        d.setVarFlag('ALTERNATIVE_TARGET', 'syslog-service', '%s/system/${BPN}.service' % (d.getVar('systemd_unitdir')))
 }
 
 INITSCRIPT_NAME = "syslog"
diff --git a/meta-python/classes/pypi.bbclass b/meta-python/classes/pypi.bbclass
index cd27cd2..3d81ab3 100644
--- a/meta-python/classes/pypi.bbclass
+++ b/meta-python/classes/pypi.bbclass
@@ -1,5 +1,5 @@
 def pypi_package(d):
-    bpn = d.getVar('BPN', True)
+    bpn = d.getVar('BPN')
     if bpn.startswith('python-'):
         return bpn[7:]
     elif bpn.startswith('python3-'):
@@ -10,9 +10,9 @@ PYPI_PACKAGE ?= "${@pypi_package(d)}"
 PYPI_PACKAGE_EXT ?= "tar.gz"
 
 def pypi_src_uri(d):
-    package = d.getVar('PYPI_PACKAGE', True)
-    package_ext = d.getVar('PYPI_PACKAGE_EXT', True)
-    pv = d.getVar('PV', True)
+    package = d.getVar('PYPI_PACKAGE')
+    package_ext = d.getVar('PYPI_PACKAGE_EXT')
+    pv = d.getVar('PV')
     return 'https://files.pythonhosted.org/packages/source/%s/%s/%s-%s.%s' % (package[0], package, package, pv, package_ext)
 
 PYPI_SRC_URI ?= "${@pypi_src_uri(d)}"
-- 
2.7.4


