Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 8D1A57566F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 05:40:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.13,665,1427731200"; d="scan'208";a="97776094"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 26 Jun 2015 13:44:17 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5Q5catk030060
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Jun 2015 13:38:36 +0800
Received: from localhost.localdomain (10.167.226.31) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 26 Jun 2015 13:40:14 +0800
From: Bian Naimeng <biannm@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 26 Jun 2015 13:30:50 +0800
Message-ID: <1435296650-24595-3-git-send-email-biannm@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435296650-24595-1-git-send-email-biannm@cn.fujitsu.com>
References: <1435296650-24595-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.31]
Subject: [meta-oe][PATCH 2/2] uim: add new recipe
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
X-List-Received-Date: Fri, 26 Jun 2015 05:40:18 -0000
Content-Type: text/plain

UIM(Universal Input Method) is a multilingual user input method library.

Signed-off-by: Bian Naimeng <biannm@cn.fujitsu.com>
---
 .../uim/uim/0001-fix-bug-about-stdlib.patch        |  40 +++++++
 .../uim/uim/0001-fix-bug-for-cross-compile.patch   |  28 +++++
 .../uim/uim/uim-module-manager.patch               |  11 ++
 meta-oe/recipes-support/uim/uim_1.3.1.bb           | 128 +++++++++++++++++++++
 4 files changed, 207 insertions(+)
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
 create mode 100644 meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
 create mode 100644 meta-oe/recipes-support/uim/uim/uim-module-manager.patch
 create mode 100644 meta-oe/recipes-support/uim/uim_1.3.1.bb

diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
new file mode 100644
index 0000000..9e63683
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-about-stdlib.patch
@@ -0,0 +1,40 @@
+From e0e3f82bd2918fdcc722918c108bc33647a4805f Mon Sep 17 00:00:00 2001
+From: Leimaohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 25 Oct 2013 18:31:22 +0900
+Subject: [PATCH] fix bug about stdlib
+
+Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
+---
+ xim/locale.cpp    |    3 ++-
+ xim/ximserver.cpp |    1 +
+ 2 files changed, 3 insertions(+), 1 deletions(-)
+
+diff --git a/xim/locale.cpp b/xim/locale.cpp
+index 380e945..edfaf03 100644
+--- a/xim/locale.cpp
++++ b/xim/locale.cpp
+@@ -35,7 +35,8 @@
+ #ifdef HAVE_CONFIG_H
+ # include <config.h>
+ #endif
+-
++#include <string.h>
++#include <stdlib.h>
+ #include <stdio.h>
+ #include <locale.h>
+ #include <iconv.h>
+diff --git a/xim/ximserver.cpp b/xim/ximserver.cpp
+index 245c5f8..cde9918 100644
+--- a/xim/ximserver.cpp
++++ b/xim/ximserver.cpp
+@@ -34,6 +34,7 @@
+ # include <config.h>
+ #endif
+ 
++#include <stdlib.h>
+ #include <stdio.h>
+ #include <ctype.h>
+ #include <locale.h>
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
new file mode 100644
index 0000000..61392c9
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/0001-fix-bug-for-cross-compile.patch
@@ -0,0 +1,28 @@
+From 2e87c39ae3a00b8231ee21a54c47361c1bf502f7 Mon Sep 17 00:00:00 2001
+From: Leimaohui <leimaohui@cn.fujitsu.com>
+Date: Fri, 25 Oct 2013 18:23:12 +0900
+Subject: [PATCH] fix bug for cross compile
+
+Signed-off-by: leimaohui <leimaohui@cn.fujitsu.com>
+---
+ configure.ac |    4 ++--
+ 1 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 3b64593..57395d4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -601,8 +601,8 @@ AC_HELP_STRING([--with-libedit[=DIR], Enable libedit support
+  if test "x$use_libedit" != "xno"; then
+      saved_CPPFLAGS=$CPPFLAGS
+      saved_LDFLAGS=$LDFLAGS
+-     CPPFLAGS="${CPPFLAGS} -I$libedit_path/include"
+-     LDFLAGS="${LDFLAGS} -L$libedit_path/lib"
++     CPPFLAGS="${CPPFLAGS} "
++     LDFLAGS="${LDFLAGS} "
+      AC_CHECK_LIB(edit, el_init,	
+      		[
+ 		   LIBEDIT_LIBS="-ledit -lcurses -l$libedit_path/lib"
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/uim/uim/uim-module-manager.patch b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
new file mode 100644
index 0000000..8569bf3
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim/uim-module-manager.patch
@@ -0,0 +1,11 @@
+--- uim-1.1.0/scm/Makefile.am~	2006-06-09 10:46:12.000000000 +0900
++++ uim-1.1.0/scm/Makefile.am	2006-06-19 23:00:15.620000000 +0900
+@@ -58,7 +58,7 @@
+   module_names += "scim"
+ endif
+ 
+-UIM_MODULE_MANAGER = $(top_builddir)/uim/uim-module-manager
++UIM_MODULE_MANAGER = uim-module-manager
+ UIM_MODULE_MANAGER_ENV = \
+         LIBUIM_SCM_FILES=$(abs_srcdir) \
+         LIBUIM_PLUGIN_LIB_DIR=$(abs_top_builddir)/uim/.libs
diff --git a/meta-oe/recipes-support/uim/uim_1.3.1.bb b/meta-oe/recipes-support/uim/uim_1.3.1.bb
new file mode 100644
index 0000000..01657df
--- /dev/null
+++ b/meta-oe/recipes-support/uim/uim_1.3.1.bb
@@ -0,0 +1,128 @@
+DESCRIPTION = "A multilingual user input method library"
+HOMEPAGE = "http://uim.freedesktop.org/"
+LICENSE = "BSD"
+SECTION = "inputmethods"
+
+SRC_URI = "http://uim.googlecode.com/files/uim-${PV}.tar.bz2 \
+           file://0001-fix-bug-about-stdlib.patch "
+
+SRC_URI_append_class-target = "file://uim-module-manager.patch \
+                               file://0001-fix-bug-for-cross-compile.patch"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=9c372efbeca58ce22017a29c1ebf8bf0"
+SRC_URI[md5sum] = "2832e23d4778bbacbfa4b49bf642d667"
+SRC_URI[sha256sum] = "ed2cfa15018a4fd2557e875f66fcb3f0b9dabe12fa0700aa2f11cca69c2cb256"
+
+DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
+DEPENDS_class-target += "gtk+ uim-native takao-fonts"
+
+RDEPENDS_uim = "libuim0 libedit"
+RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
+
+LEAD_SONAME = "libuim.so.1"
+
+inherit autotools pkgconfig gettext
+
+EXTRA_OECONF += "--disable-emacs \
+                 --without-scim \
+                 --without-m17nlib \
+                 --without-prime \
+                 --without-canna \
+                 --without-mana \
+                 --without-eb"
+
+CONFIGUREOPTS_class-target := "${@d.getVar('CONFIGUREOPTS', True).replace('--disable-silent-rules', ' ')}"
+
+PACKAGES += "uim-xim uim-utils uim-skk uim-gtk2.0 uim-fep uim-common uim-anthy libuim0 libuim-dev"
+
+FILES_libuim0 = "${libdir}/uim/plugin/libuim-custom-enabler.* \
+                 ${libdir}/libuim-custom.so.* \
+                 ${datadir}/locale/ja/LC_MESSAGES/uim.mo \
+                 ${datadir}/locale/fr/LC_MESSAGES/uim.mo \
+                 ${datadir}/locale/ko/LC_MESSAGES/uim.mo \
+                 ${libdir}/libuim.so.*"
+
+FILES_libuim-dev = "${libdir}/libuim*.a \
+                    ${libdir}/libuim*.la \
+                    ${libdir}/libuim*.so \
+                    ${includedir}/uim \
+                    ${libdir}/pkgconfig/uim.pc"
+
+FILES_uim-anthy = "${libdir}/uim/plugin/libuim-anthy.* \
+                   ${datadir}/uim/anthy*.scm"
+
+FILES_${PN}-dbg += "${libdir}/*/*/*/.debug ${libdir}/*/*/.debug"
+FILES_${PN}-dev += "${libdir}/uim/plugin/*.la"
+
+FILES_uim-utils = "${bindir}/uim-sh \
+                   ${bindir}/uim-module-manager \
+		   ${libexecdir}/uim-helper-server"
+
+FILES_uim-xim = "${bindir}/uim-xim \
+                 ${libexecdir}/uim-candwin-gtk \
+                 ${datadir}/man/man1/uim-xim.1 \
+                 ${sysconfdir}/X11/xinit/xinput.d/uim*"
+
+FILES_uim-common = "${datadir}/uim/pixmaps/*.png \
+                    ${datadir}/uim"
+
+FILES_uim-fep = "${bindir}/uim-fep*"
+FILES_uim-gtk2.0 = "${libdir}/gtk-2.0 \
+                    ${bindir}/uim-toolbar-gtk* \
+                    ${bindir}/uim-*-gtk \
+                    ${bindir}/uim-input-pad-ja \
+                    ${datadir}/uim/helperdata/uim-dict-ui.xml"
+
+FILES_uim-skk = "${libdir}/uim/plugin/libuim-skk.* \
+                 ${datadir}/uim/skk*.scm"
+
+pkg_postinst_uim-anthy() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --register anthy --path /etc/uim
+    fi
+}
+
+pkg_postrm_uim-anthy() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --path /etc/uim --unregister anthy
+    fi
+}
+
+pkg_prerm_uim-anthy() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --register anthy --path /etc/uim
+    fi
+}
+
+pkg_postinst_uim-gtk2.0() {
+    gtk-query-immodules-2.0 > /etc/gtk-2.0/gtk.immodules
+}
+
+pkg_postinst_uim-skk() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --register skk --path /etc/uim
+    fi
+}
+
+pkg_postrm_uim-skk() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --path /etc/uim --unregister skk
+    fi
+}
+
+pkg_postinst_uim-common() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --path /etc/uim --register \
+                                    tutcode tcode hangul viqr \
+                                    ipa-x-sampa latin byeoru
+    fi
+}
+
+pkg_prerm_uim-common() {
+    if [ -f /usr/bin/uim-module-manager ]; then
+        /usr/bin/uim-module-manager --path /etc/uim --register \
+        tutcode tcode hangul viqr ipa-x-sampa latin byeoru
+    fi
+}
+
+BBCLASSEXTEND = "native"
-- 
1.9.1


