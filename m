Return-Path: <brendank310@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id B48AE79B55
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 16:41:55 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id a132so5352141qkg.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1jyDdZ03wFbqE0F38BpvvWJYMZOaLBa1Eipj+Zq7BlM=;
	b=pA8d8OR75BB8EJgL5laROi5Pc5saNlLwl10WCuC/Z8orTSzRn3Ocfvhhp1idjSXRIr
	vi9UrsRxddOkcK02id6w2WtrYFtRG09Isii2r7Ll+AB6CidVsbCEQm1tAsZxOuM3nE1U
	9VwVppKYDAkpolxrcyB1ESWLkIcTIIuAUMVfriImnpVz4QLqqPOCExRZLGlfrVKCCmJf
	4x3kliPrOosiGWpx3KjsJyU17yFC8L453ezy6ovs0K0nedCo4h92ngp+n9PsEieKkAuF
	vp32mzwkA6PPNlC9/15OtoxVK4PkqRa76LvyZ8sylk95tP6UxqIVz3sKYUtyYX1SYsxy
	+n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1jyDdZ03wFbqE0F38BpvvWJYMZOaLBa1Eipj+Zq7BlM=;
	b=hYI1F9+hzKwv00orAF5uvoYpx8Pk/fPbV7O5Tpb3FR3IlnmIrn546i7Vh3gCSSF9+f
	No9hj2IGAnZx83BZLaTX+nBkcbr3G3e0gdJTDkvNegUqc4KvmIuR7XHiOwzcMzcqXttE
	8bU11Cke7AFFXcyyw6hgdzP2o6Dv90JMLRF0uRiTfgq8a+nZdfUUC2gcs40Qwn6LFTIS
	CyohVteogkaxvPXQuIIDvqHMM2Rf6p1EJJ6vrrOHmIdE1N916RTlbQZopXQOWjhbpz0M
	EoW87m7z0vMCHozS0Qow/xJUtz05TzYQ2E6DjQ3w6jCqefPe8uLGzS1MRcWfZpLtcJoN
	5r9w==
X-Gm-Message-State: AGRZ1gKqtOYZpTMS0+XzYQ7nBWaRseTLgR6YG8XqebaA4kPtwI8O/qHy
	YMxtjcoPESx6X3/k+Eh/pw6O1pK8
X-Google-Smtp-Source: AJdET5c/6XDOsQ/vDB1q/4fwwgUrpWK/rBcVznVG5c+Tyvf2XIXzskeNets3nOkgzIUJ2J7IkQEXrQ==
X-Received: by 2002:ae9:de01:: with SMTP id
	s1-v6mr13340666qkf.258.1540831316305; 
	Mon, 29 Oct 2018 09:41:56 -0700 (PDT)
Received: from localhost.localdomain (209-217-208-226.northland.net.
	[209.217.208.226]) by smtp.gmail.com with ESMTPSA id
	i2-v6sm13471476qkf.42.2018.10.29.09.41.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 09:41:55 -0700 (PDT)
From: brendank310 <brendank310@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 29 Oct 2018 12:41:09 -0400
Message-Id: <96e86320d4d21de21552cf98eb6145a114fcd69f.1540830650.git.brendank310@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1540830650.git.brendank310@gmail.com>
References: <cover.1540830650.git.brendank310@gmail.com>
Cc: schnitzeltony@googlemail.com
Subject: [RFC meta-gnome][PATCH 12/16] mutter: add recipe for mutter window manager
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
X-List-Received-Date: Mon, 29 Oct 2018 16:41:56 -0000

From: Brendan Kerrigan <kerriganb@ainfosec.com>

Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
---
 .../mutter/0001-disable-zenity-check.patch    | 27 ++++++++
 ...spection-variables-with-correct-path.patch | 63 +++++++++++++++++++
 .../0003-packageconfig-variable-fixup.patch   | 29 +++++++++
 .../mutter/0004-fix-broken-includes.patch     | 37 +++++++++++
 meta-gnome/recipes-gnome/gnome3/mutter_git.bb | 59 +++++++++++++++++
 5 files changed, 215 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
 create mode 100644 meta-gnome/recipes-gnome/gnome3/mutter_git.bb

diff --git a/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch b/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
new file mode 100644
index 000000000..a37aec276
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/mutter/0001-disable-zenity-check.patch
@@ -0,0 +1,27 @@
+mutter: Disable check for zenity
+
+  Disable autoconf check for zenity, no need graphical dialog boxes.
+
+  Upstream-status: Inappropriate [disable-feature]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/configure.ac b/configure.ac
+index ef92f5ecb..5eede9e63 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -427,11 +427,6 @@ fi
+ 
+ AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes")
+ 
+-AC_PATH_PROG(ZENITY, zenity, no)
+-if test x"$ZENITY" = xno; then
+-  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
+-fi
+-
+ AC_ARG_ENABLE(debug,
+ 	[  --enable-debug		enable debugging],,
+ 	enable_debug=no)
+-- 
+2.17.1
+
diff --git a/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch b/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
new file mode 100644
index 000000000..07c1f371a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/mutter/0002-fixup-introspection-variables-with-correct-path.patch
@@ -0,0 +1,63 @@
+mutter: Fixup introspection paths
+
+  Fixup the introspection paths to enable correct results with
+  gobject-introspection.
+
+  Upstream-status: Innappropriate [embedded specific]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/clutter/build/autotools/introspection.m4 b/clutter/build/autotools/introspection.m4
+index d89c3d907..d2c60de4d 100644
+--- a/clutter/build/autotools/introspection.m4
++++ b/clutter/build/autotools/introspection.m4
+@@ -56,14 +56,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+     INTROSPECTION_GIRDIR=
+     INTROSPECTION_TYPELIBDIR=
+     if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+        INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+     fi
+     AC_SUBST(INTROSPECTION_SCANNER)
+     AC_SUBST(INTROSPECTION_COMPILER)
+diff --git a/cogl/build/autotools/introspection.m4 b/cogl/build/autotools/introspection.m4
+index 589721c5a..683ebdcc6 100644
+--- a/cogl/build/autotools/introspection.m4
++++ b/cogl/build/autotools/introspection.m4
+@@ -54,14 +54,14 @@ m4_define([_GOBJECT_INTROSPECTION_CHECK_INTERNAL],
+     INTROSPECTION_GIRDIR=
+     INTROSPECTION_TYPELIBDIR=
+     if test "x$found_introspection" = "xyes"; then
+-       INTROSPECTION_SCANNER=`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
+-       INTROSPECTION_COMPILER=`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
+-       INTROSPECTION_GENERATE=`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
+-       INTROSPECTION_GIRDIR=`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
+-       INTROSPECTION_TYPELIBDIR="$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
++       INTROSPECTION_SCANNER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_scanner gobject-introspection-1.0`
++       INTROSPECTION_COMPILER=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_compiler gobject-introspection-1.0`
++       INTROSPECTION_GENERATE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=g_ir_generate gobject-introspection-1.0`
++       INTROSPECTION_GIRDIR=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=girdir gobject-introspection-1.0`
++       INTROSPECTION_TYPELIBDIR=$PKG_CONFIG_SYSROOT_DIR"$($PKG_CONFIG --variable=typelibdir gobject-introspection-1.0)"
+        INTROSPECTION_CFLAGS=`$PKG_CONFIG --cflags gobject-introspection-1.0`
+-       INTROSPECTION_LIBS=`$PKG_CONFIG --libs gobject-introspection-1.0`
+-       INTROSPECTION_MAKEFILE=`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
++       INTROSPECTION_LIBS=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --libs gobject-introspection-1.0`
++       INTROSPECTION_MAKEFILE=$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=datadir gobject-introspection-1.0`/gobject-introspection-1.0/Makefile.introspection
+     fi
+     AC_SUBST(INTROSPECTION_SCANNER)
+     AC_SUBST(INTROSPECTION_COMPILER)
+-- 
+2.17.1
+
diff --git a/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch b/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
new file mode 100644
index 000000000..1e44218a6
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/mutter/0003-packageconfig-variable-fixup.patch
@@ -0,0 +1,29 @@
+mutter: Fixup pkgconfig variables
+
+  Pkgconfig variables relating to the paths of datadirs, and
+  gir, typelib.
+
+  Upstream-status: Innappropriate [embedded-specific]
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/src/libmutter.pc.in b/src/libmutter.pc.in
+index d2e837f4a..0c8db1a66 100644
+--- a/src/libmutter.pc.in
++++ b/src/libmutter.pc.in
+@@ -2,8 +2,10 @@ prefix=@prefix@
+ exec_prefix=@exec_prefix@
+ libdir=@libdir@
+ includedir=@includedir@
+-girdir=@libdir@/mutter
+-typelibdir=@libdir@/mutter
++datarootdir=${prefix}/share
++datadir=${datarootdir}
++girdir=${datadir}/gir-1.0
++typelibdir=${libdir}/mutter
+ apiversion=@LIBMUTTER_API_VERSION@
+ 
+ Name: libmutter
+-- 
+2.17.1
+
diff --git a/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch b/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
new file mode 100644
index 000000000..2a7580653
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/mutter/0004-fix-broken-includes.patch
@@ -0,0 +1,37 @@
+mutter: Fix broken includes for xcursor
+
+  Add missing include for the xcursor header to required
+  files.
+
+  Upstream-status: Pending
+
+  Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
+
+diff --git a/src/core/display.c b/src/core/display.c
+index f6b4d5b9f..3930f1c32 100644
+--- a/src/core/display.c
++++ b/src/core/display.c
+@@ -54,6 +54,7 @@
+ #include <meta/meta-backend.h>
+ #include "backends/meta-cursor-sprite-xcursor.h"
+ #include "backends/meta-logical-monitor.h"
++#include "backends/meta-cursor-sprite-xcursor.h"
+ #include "backends/native/meta-backend-native.h"
+ #include "backends/x11/meta-backend-x11.h"
+ #include "backends/meta-stage-private.h"
+diff --git a/src/x11/meta-x11-display.c b/src/x11/meta-x11-display.c
+index 83f7dfbae..36ea95b91 100644
+--- a/src/x11/meta-x11-display.c
++++ b/src/x11/meta-x11-display.c
+@@ -55,6 +55,8 @@
+ #include "backends/meta-logical-monitor.h"
+ #include "backends/meta-settings-private.h"
+ #include "backends/x11/meta-backend-x11.h"
++#include "backends/meta-cursor-sprite-xcursor.h"
++
+ #include "core/frame.h"
+ #include "core/meta-workspace-manager-private.h"
+ #include "core/util-private.h"
+-- 
+2.17.1
+
diff --git a/meta-gnome/recipes-gnome/gnome3/mutter_git.bb b/meta-gnome/recipes-gnome/gnome3/mutter_git.bb
new file mode 100644
index 000000000..b2065f224
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome3/mutter_git.bb
@@ -0,0 +1,59 @@
+DESCRIPTION = "Mutter (Gnome 3 window manager)"
+LICENSE = "GPLv2"
+DEPENDS = " \
+           glib-2.0 \
+           gsettings-desktop-schemas \
+           wayland-native \
+           wayland-protocols \
+           libxinerama \
+           libinput \
+           gtk+3 \
+           gnome-desktop3 \
+           libxcursor \
+           libxkbfile \
+           cogl-1.0 \
+           clutter-1.0 \
+          "
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+SRC_URI = " \
+           git://gitlab.gnome.org/GNOME/mutter.git;protocol=http;branch=master \
+           file://0001-disable-zenity-check.patch \
+           file://0002-fixup-introspection-variables-with-correct-path.patch \
+           file://0003-packageconfig-variable-fixup.patch \
+           file://0004-fix-broken-includes.patch \
+          "
+
+SRCREV="${AUTOREV}"
+S = "${WORKDIR}/git"
+
+inherit autotools pkgconfig distro_features_check gobject-introspection gettext
+
+FILES_${PN} += "${datadir}"
+
+do_configure_prepend() {
+	# Autotools expects config.rpath to be with in the source tree
+	install -d ${S}/build-aux
+	cp ${STAGING_DIR_NATIVE}${datadir}/gettext/config.rpath ${S}/build-aux/config.rpath
+
+        # There are several Werrors that trip when building with Wayland enabled:
+	# -Wno-error=implicit-function-declaration -Wno-error=nested-externs -Wno-error=int-conversion
+	# and setting those as no-error does not seem to get picked up (it does appear in the compilation
+	# command
+	sed -i 's^-Werror -Wno-error=deprecated-declarations^-Wno-error=deprecated-declarations^g' ${S}/configure.ac
+}
+
+do_compile_prepend() {
+	export GIR_EXTRA_LIBS_PATH="${B}/cogl/cogl/.libs:${B}/cogl/cogl-pango/.libs:${B}/cogl/cogl-path/.libs:${B}/clutter/clutter/.libs"
+}
+
+do_install_append() {
+	install -d ${D}/${datadir}/gir-1.0
+	install ${B}/src/Meta-3.gir ${D}/${datadir}/gir-1.0
+	install ${B}/cogl/cogl/Cogl-3.gir ${D}/${datadir}/gir-1.0
+	install ${B}/cogl/cogl-pango/CoglPango-3.gir ${D}/${datadir}/gir-1.0
+	install ${B}/clutter/clutter/Cally-3.gir ${D}/${datadir}/gir-1.0
+	install ${B}/clutter/clutter/ClutterX11-3.gir ${D}/${datadir}/gir-1.0
+	install ${B}/clutter/clutter/Clutter-3.gir ${D}/${datadir}/gir-1.0
+}
-- 
2.17.1


