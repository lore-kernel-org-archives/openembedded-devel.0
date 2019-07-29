Return-Path: <naveen.kumar.saini@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 342F765CF3
	for <Openembedded-devel@lists.openembedded.org>;
	Mon, 29 Jul 2019 04:09:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 21:09:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,321,1559545200"; d="scan'208";a="255088095"
Received: from optimus-prime.png.intel.com ([172.30.199.130])
	by orsmga001.jf.intel.com with ESMTP; 28 Jul 2019 21:09:30 -0700
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: Openembedded-devel@lists.openembedded.org
Date: Mon, 29 Jul 2019 12:11:28 +0800
Message-Id: <20190729041128.2874-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] icewm: add recipe
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
X-List-Received-Date: Mon, 29 Jul 2019 04:09:30 -0000

From: "Yong, Jonathan" <jonathan.yong@intel.com>

IceWM is a window manager for the X Window System.

The goal of IceWM is to provide speed and simplicity.

It comes with a taskbar with pager, global and per-window
keybindings and a dynamic menu system.

Website:
https://ice-wm.org/

Manual:
https://ice-wm.org/manual/

Themes Howto
https://ice-wm.org/themes/

Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 ...p-running-test-program-when-cross-co.patch | 39 ++++++++++++++++++
 meta-oe/recipes-extended/icewm/icewm_1.5.5.bb | 40 +++++++++++++++++++
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
 create mode 100644 meta-oe/recipes-extended/icewm/icewm_1.5.5.bb

diff --git a/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
new file mode 100644
index 000000000..98fd78c5c
--- /dev/null
+++ b/meta-oe/recipes-extended/icewm/icewm/0001-configure.ac-skip-running-test-program-when-cross-co.patch
@@ -0,0 +1,39 @@
+From 84620376d568c2c5e3ebd4f33de9793c68a36463 Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Mon, 22 Jul 2019 16:17:19 +0800
+Subject: [PATCH] configure.ac: skip running test program when cross-compiling
+
+Modified patch from Yong, Jonathan.
+
+Upstream-Status: Inappropriate [OE-Specific]
+
+Signed-off-by: Yong, Jonathan <jonathan.yong@intel.com>
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ configure.ac | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c5e3ca03..61d2d5a0 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -139,6 +139,7 @@ AC_CHECK_FUNCS([sysctl sysctlbyname sysinfo uname wordexp])
+ AC_CHECK_FUNC([getloadavg],[AC_DEFINE([HAVE_GETLOADAVG2], 1, [getloadavg() is available])])
+ AC_FUNC_SELECT_ARGTYPES
+ 
++if test "$cross_compiling" = no ; then
+ AC_MSG_CHECKING([for strlcpy])
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
+                char a[2];
+@@ -170,7 +171,7 @@ AC_RUN_IFELSE([AC_LANG_PROGRAM([[#include <string.h>]],[[
+                AH_TEMPLATE([HAVE_STRLCAT],
+                            [Define to 1 if you have the strlcat function.])
+               ])
+-
++fi
+ 
+ PKG_CHECK_MODULES([CORE],[fontconfig xext x11])
+ AC_SUBST([CORE_CFLAGS])
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
new file mode 100644
index 000000000..db81021d0
--- /dev/null
+++ b/meta-oe/recipes-extended/icewm/icewm_1.5.5.bb
@@ -0,0 +1,40 @@
+DESCRIPTION = "Ice Window Manager (IceWM)"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4a26952467ef79a7efca4a9cf52d417b"
+
+SRC_URI = "https://github.com/ice-wm/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
+           file://0001-configure.ac-skip-running-test-program-when-cross-co.patch \
+           "
+SRC_URI[md5sum] = "6eba94a7935a0531d2c14eeb1426aeef"
+SRC_URI[sha256sum] = "f1c1344b20a9e8635143f70ee27930b55f813c15ca61f84d77584d311b6ac027"
+
+inherit autotools pkgconfig gettext perlnative distro_features_check qemu
+REQUIRED_DISTRO_FEATURES = "x11"
+
+EXTRA_OECONF += "--with-libdir=${datadir}/icewm \
+                --with-cfgdir=${sysconfdir}/icewm \
+                --with-docdir=${docdir}/icewm \
+                --enable-fribidi \
+                --enable-xinerama \
+                --enable-shape"
+
+DEPENDS = "asciidoc-native gdk-pixbuf libxft libxpm libxrandr libxinerama"
+DEPENDS_append = " qemu-native"
+RDEPENDS_${PN} = "perl"
+
+do_compile_prepend_class-target() {
+
+    cd ${B}
+    oe_runmake -C src genpref
+
+    qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}',['$PWD/src/.libs','$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    cat >qemuwrapper <<EOF
+#!/bin/sh
+${qemu_binary} src/genpref "\$@"
+EOF
+    chmod +x qemuwrapper
+    ./qemuwrapper > src/preferences
+}
+
+
+FILES_${PN} += "${datadir}/xsessions"
-- 
2.17.1


