Return-Path: <superandy@localhost.localdomain>
Received: from localhost.localdomain (p5B0A2F3E.dip0.t-ipconnect.de
	[91.10.47.62])
	by mail.openembedded.org (Postfix) with ESMTP id 7A1456CA5B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Sep 2013 10:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (8.14.7/8.14.7) with ESMTP id r8LAg9uo013462; 
	Sat, 21 Sep 2013 12:42:10 +0200
Received: (from superandy@localhost)
	by localhost.localdomain (8.14.7/8.14.7/Submit) id r8LAg8oW013461;
	Sat, 21 Sep 2013 12:42:08 +0200
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 21 Sep 2013 12:41:40 +0200
Message-Id: <1379760101-13380-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379760101-13380-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 09/10] xfce4-notes-plugin: initial add 1.7.7
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
X-List-Received-Date: Sat, 21 Sep 2013 10:42:13 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Bump-dependency-to-Xfce-4.10.patch  | 128 +++++++++++++++++++++
 ...atus-icon.c-remove-deprecated-g_type_init.patch |  32 ++++++
 .../notes/xfce4-notes-plugin_1.7.7.bb              |  20 ++++
 3 files changed, 180 insertions(+)
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch
 create mode 100644 meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb

diff --git a/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch b/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
new file mode 100644
index 0000000..4a3b1ce
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
@@ -0,0 +1,128 @@
+From 26c4ad1765d0d59b3918363d38174c5f5bfe0dcd Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 20 Sep 2013 22:49:47 +0200
+Subject: [PATCH] Bump dependency to Xfce 4.10
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Drop support for Xfce <= 4.6.
+Replace libxfcegui4 dependency against libxfce4ui.
+Update to new libtool syntax (use LT_PREREQ.)
+
+Upstream-status: Backport [1]
+
+[1] http://git.xfce.org/panel-plugins/xfce4-notes-plugin/commit/?id=d11fe51fae95b5b4963847be76ae4a07409a6076
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ configure.ac               | 23 ++++++++++-------------
+ src/Makefile.am            |  4 ++--
+ src/xfce4-notes-settings.c |  6 +++---
+ 3 files changed, 15 insertions(+), 18 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 20d27e5..8d4113f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -24,21 +24,17 @@ AC_INIT([Notes], [xfce4_notes_plugin_version], [http://bugzilla.xfce.org/], [xfc
+ AC_REVISION([xfce4_notes_plugin_version_build])
+ AC_CANONICAL_TARGET()
+ 
++LT_PREREQ([2.2.6])
++LT_INIT([disable-static])
++
+ AM_INIT_AUTOMAKE([1.11 dist-bzip2])
+ AM_CONFIG_HEADER([config.h])
+ AM_MAINTAINER_MODE()
+ AM_SILENT_RULES([yes])
+ 
+-dnl Avoid g77 and g++ checks
+-m4_undefine([AC_PROG_CXX])
+-m4_defun([AC_PROG_CXX],[])
+-m4_undefine([AC_PROG_F77])
+-m4_defun([AC_PROG_F77],[])
+-
+ dnl Check for basic programs
+ AM_PROG_CC_C_O()
+ AC_PROG_LD()
+-AC_PROG_LIBTOOL()
+ AC_PROG_INSTALL()
+ AC_PROG_INTLTOOL()
+ 
+@@ -51,12 +47,13 @@ AC_SUBST([MATH_LIBS], [" -lm"])
+ 
+ dnl Check for required packages
+ XDT_CHECK_LIBX11_REQUIRE()
+-XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.16.0])
+-XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.14.0])
+-XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.4.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.4.0])
+-XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.4.0])
+-XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.6.0])
++XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.24.0])
++XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.24.0])
++XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.20.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.10.0])
++XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
++XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.10.0])
++XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.10.0])
+ XDT_CHECK_PACKAGE([UNIQUE], [unique-1.0], [1.0.0])
+ 
+ dnl Check for libxfce4panel >= 4.7
+diff --git a/src/Makefile.am b/src/Makefile.am
+index f69ab0f..2d97b63 100644
+--- a/src/Makefile.am
++++ b/src/Makefile.am
+@@ -36,7 +36,7 @@ xfce4_notes_settings_SOURCES =						\
+ xfce4_notes_settings_CFLAGS =						\
+ 	@LIBX11_CFLAGS@							\
+ 	@GTK_CFLAGS@							\
+-	@LIBXFCEGUI4_CFLAGS@						\
++	@LIBXFCE4UI_CFLAGS@						\
+ 	@XFCONF_CFLAGS@							\
+ 	@UNIQUE_CFLAGS@
+ 
+@@ -44,7 +44,7 @@ xfce4_notes_settings_LDADD =						\
+ 	$(top_builddir)/lib/libnotes.la					\
+ 	@LIBX11_LIBS@							\
+ 	@GTK_LIBS@							\
+-	@LIBXFCEGUI4_LIBS@						\
++	@LIBXFCE4UI_LIBS@						\
+ 	@XFCONF_LIBS@							\
+ 	@UNIQUE_LIBS@
+ 
+diff --git a/src/xfce4-notes-settings.c b/src/xfce4-notes-settings.c
+index f66bb13..1d7cc70 100644
+--- a/src/xfce4-notes-settings.c
++++ b/src/xfce4-notes-settings.c
+@@ -25,7 +25,7 @@
+ #include <xfconf/xfconf.h>
+ #include <gtk/gtk.h>
+ #include <libxfce4util/libxfce4util.h>
+-#include <libxfcegui4/libxfcegui4.h>
++#include <libxfce4ui/libxfce4ui.h>
+ 
+ #include "defines.h"
+ #include "color.h"
+@@ -115,7 +115,7 @@ prop_dialog_new (void)
+ 
+   /* === Global settings === */
+   box = gtk_vbox_new (FALSE, BORDER);
+-  frame = xfce_create_framebox_with_content (_("Global settings"), box);
++  frame = xfce_gtk_frame_box_new_with_content (_("Global settings"), box);
+   gtk_container_set_border_width (GTK_CONTAINER (frame), BORDER);
+   gtk_container_add (GTK_CONTAINER (vbox), frame);
+ 
+@@ -163,7 +163,7 @@ prop_dialog_new (void)
+ 
+   /* === New window settings === */
+   box = gtk_vbox_new (FALSE, BORDER);
+-  frame = xfce_create_framebox_with_content (_("New group settings"), box);
++  frame = xfce_gtk_frame_box_new_with_content (_("New group settings"), box);
+   gtk_container_set_border_width (GTK_CONTAINER (frame), BORDER);
+   gtk_container_add (GTK_CONTAINER (vbox), frame);
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch b/meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch
new file mode 100644
index 0000000..e1ede27
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch
@@ -0,0 +1,32 @@
+From 0218e5ebf38f94d58b908fca451ba3789efa8899 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Fri, 20 Sep 2013 23:09:25 +0200
+Subject: [PATCH] main-status-icon.c remove deprecated g_type_init
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+this file was auto created by valac and xfce-vala when creating tarball. So
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ src/main-status-icon.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/src/main-status-icon.c b/src/main-status-icon.c
+index c6d73f8..f7db773 100644
+--- a/src/main-status-icon.c
++++ b/src/main-status-icon.c
+@@ -290,7 +290,6 @@ gint _vala_main (char** args, int args_length1) {
+ 
+ 
+ int main (int argc, char ** argv) {
+-	g_type_init ();
+ 	return _vala_main (argv, argc);
+ }
+ 
+-- 
+1.8.3.1
+
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
new file mode 100644
index 0000000..b97bc24
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Notes plugin for the Xfce Panel"
+HOMEPAGE = "http://goodies.xfce.org/projects/panel-plugins/xfce4-notes-plugin"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+
+inherit xfce-panel-plugin
+
+DEPENDS = "gtk+ libxfce4ui xfce4-panel xfconf libunique"
+
+SRC_URI += " \
+    file://0001-Bump-dependency-to-Xfce-4.10.patch \
+    file://0002-main-status-icon.c-remove-deprecated-g_type_init.patch \
+"
+SRC_URI[md5sum] = "42b924b23f2fec6a1099e9b7a87db4a3"
+SRC_URI[sha256sum] = "a7baa105b37ad05dea4d6b55d98fd3214c77ad5c7a0e91471d4906c81e5f5217"
+
+FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so.*"
+
+# *.so are required for plugin detection
+INSANE_SKIP_${PN} = "dev-so"
-- 
1.8.3.1


