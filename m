Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wi0-f179.google.com (mail-wi0-f179.google.com
	[209.85.212.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9343765C7E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 21:14:39 +0000 (UTC)
Received: by wifw1 with SMTP id w1so8765614wif.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 May 2015 14:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=cEOwfMTr3pQN+cgKVa2lhpmCf0YgNYkPDYw1sO7WdUw=;
	b=VgeBYY38LUszfe4ufAUt2y+pI16yOOQqdyKiOiWneFZcfV4n/C6s9ezOHIKoJmStT5
	HfUM/KqeExwBXGbt+B9yVUFoUVkP2HPfL+P986zfZdpc2KOuPJkhQwylUrOw0xQDWyjq
	1gsck4zSLvNiK4zt0wDir5+ctUDiHI/QUFtrDeNhIanwsFoRF/6lP9YPgP+jYTCZ+lJO
	JiD1yLxzrbpBuiSAj7F6RahPtJPwzeDwerXr5sT/Ac+4+9FANI429gMoubNIwmOUpjLK
	IPMEUsrW2I5PkAv9nzUUYwRUSNp59epSLSXDadzGTybSeIo8LE8YU0DPMXFeaJMPcWYb
	nm7w==
X-Received: by 10.194.203.138 with SMTP id kq10mr41997952wjc.124.1432588480196;
	Mon, 25 May 2015 14:14:40 -0700 (PDT)
Received: from localhost.localdomain (p5B0A35C6.dip0.t-ipconnect.de.
	[91.10.53.198])
	by mx.google.com with ESMTPSA id 16sm18515406wjs.41.2015.05.25.14.14.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 May 2015 14:14:39 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 25 May 2015 23:14:06 +0200
Message-Id: <1432588449-31413-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 09/12] xfce4-notes-plugin: update to 1.8.0
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
X-List-Received-Date: Mon, 25 May 2015 21:14:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

removed patch is upstream

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0001-Bump-dependency-to-Xfce-4.10.patch  | 128 ---------------------
 ...tus-icon.c-remove-deprecated-g_type_init.patch} |   0
 ...plugin_1.7.7.bb => xfce4-notes-plugin_1.8.0.bb} |   7 +-
 3 files changed, 3 insertions(+), 132 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
 rename meta-xfce/recipes-panel-plugins/notes/files/{0002-main-status-icon.c-remove-deprecated-g_type_init.patch => 0001-main-status-icon.c-remove-deprecated-g_type_init.patch} (100%)
 rename meta-xfce/recipes-panel-plugins/notes/{xfce4-notes-plugin_1.7.7.bb => xfce4-notes-plugin_1.8.0.bb} (63%)

diff --git a/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch b/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
deleted file mode 100644
index 4a3b1ce..0000000
--- a/meta-xfce/recipes-panel-plugins/notes/files/0001-Bump-dependency-to-Xfce-4.10.patch
+++ /dev/null
@@ -1,128 +0,0 @@
-From 26c4ad1765d0d59b3918363d38174c5f5bfe0dcd Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 20 Sep 2013 22:49:47 +0200
-Subject: [PATCH] Bump dependency to Xfce 4.10
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Drop support for Xfce <= 4.6.
-Replace libxfcegui4 dependency against libxfce4ui.
-Update to new libtool syntax (use LT_PREREQ.)
-
-Upstream-status: Backport [1]
-
-[1] http://git.xfce.org/panel-plugins/xfce4-notes-plugin/commit/?id=d11fe51fae95b5b4963847be76ae4a07409a6076
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac               | 23 ++++++++++-------------
- src/Makefile.am            |  4 ++--
- src/xfce4-notes-settings.c |  6 +++---
- 3 files changed, 15 insertions(+), 18 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 20d27e5..8d4113f 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -24,21 +24,17 @@ AC_INIT([Notes], [xfce4_notes_plugin_version], [http://bugzilla.xfce.org/], [xfc
- AC_REVISION([xfce4_notes_plugin_version_build])
- AC_CANONICAL_TARGET()
- 
-+LT_PREREQ([2.2.6])
-+LT_INIT([disable-static])
-+
- AM_INIT_AUTOMAKE([1.11 dist-bzip2])
- AM_CONFIG_HEADER([config.h])
- AM_MAINTAINER_MODE()
- AM_SILENT_RULES([yes])
- 
--dnl Avoid g77 and g++ checks
--m4_undefine([AC_PROG_CXX])
--m4_defun([AC_PROG_CXX],[])
--m4_undefine([AC_PROG_F77])
--m4_defun([AC_PROG_F77],[])
--
- dnl Check for basic programs
- AM_PROG_CC_C_O()
- AC_PROG_LD()
--AC_PROG_LIBTOOL()
- AC_PROG_INSTALL()
- AC_PROG_INTLTOOL()
- 
-@@ -51,12 +47,13 @@ AC_SUBST([MATH_LIBS], [" -lm"])
- 
- dnl Check for required packages
- XDT_CHECK_LIBX11_REQUIRE()
--XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.16.0])
--XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.14.0])
--XDT_CHECK_PACKAGE([LIBXFCEGUI4], [libxfcegui4-1.0], [4.4.0])
--XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.4.0])
--XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.4.0])
--XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.6.0])
-+XDT_CHECK_PACKAGE([GLIB], [glib-2.0], [2.24.0])
-+XDT_CHECK_PACKAGE([GIO], [gio-2.0], [2.24.0])
-+XDT_CHECK_PACKAGE([GTK], [gtk+-2.0], [2.20.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4UI], [libxfce4ui-1], [4.10.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4UTIL], [libxfce4util-1.0], [4.10.0])
-+XDT_CHECK_PACKAGE([LIBXFCE4PANEL], [libxfce4panel-1.0], [4.10.0])
-+XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.10.0])
- XDT_CHECK_PACKAGE([UNIQUE], [unique-1.0], [1.0.0])
- 
- dnl Check for libxfce4panel >= 4.7
-diff --git a/src/Makefile.am b/src/Makefile.am
-index f69ab0f..2d97b63 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -36,7 +36,7 @@ xfce4_notes_settings_SOURCES =						\
- xfce4_notes_settings_CFLAGS =						\
- 	@LIBX11_CFLAGS@							\
- 	@GTK_CFLAGS@							\
--	@LIBXFCEGUI4_CFLAGS@						\
-+	@LIBXFCE4UI_CFLAGS@						\
- 	@XFCONF_CFLAGS@							\
- 	@UNIQUE_CFLAGS@
- 
-@@ -44,7 +44,7 @@ xfce4_notes_settings_LDADD =						\
- 	$(top_builddir)/lib/libnotes.la					\
- 	@LIBX11_LIBS@							\
- 	@GTK_LIBS@							\
--	@LIBXFCEGUI4_LIBS@						\
-+	@LIBXFCE4UI_LIBS@						\
- 	@XFCONF_LIBS@							\
- 	@UNIQUE_LIBS@
- 
-diff --git a/src/xfce4-notes-settings.c b/src/xfce4-notes-settings.c
-index f66bb13..1d7cc70 100644
---- a/src/xfce4-notes-settings.c
-+++ b/src/xfce4-notes-settings.c
-@@ -25,7 +25,7 @@
- #include <xfconf/xfconf.h>
- #include <gtk/gtk.h>
- #include <libxfce4util/libxfce4util.h>
--#include <libxfcegui4/libxfcegui4.h>
-+#include <libxfce4ui/libxfce4ui.h>
- 
- #include "defines.h"
- #include "color.h"
-@@ -115,7 +115,7 @@ prop_dialog_new (void)
- 
-   /* === Global settings === */
-   box = gtk_vbox_new (FALSE, BORDER);
--  frame = xfce_create_framebox_with_content (_("Global settings"), box);
-+  frame = xfce_gtk_frame_box_new_with_content (_("Global settings"), box);
-   gtk_container_set_border_width (GTK_CONTAINER (frame), BORDER);
-   gtk_container_add (GTK_CONTAINER (vbox), frame);
- 
-@@ -163,7 +163,7 @@ prop_dialog_new (void)
- 
-   /* === New window settings === */
-   box = gtk_vbox_new (FALSE, BORDER);
--  frame = xfce_create_framebox_with_content (_("New group settings"), box);
-+  frame = xfce_gtk_frame_box_new_with_content (_("New group settings"), box);
-   gtk_container_set_border_width (GTK_CONTAINER (frame), BORDER);
-   gtk_container_add (GTK_CONTAINER (vbox), frame);
- 
--- 
-1.8.3.1
-
diff --git a/meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch b/meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch
similarity index 100%
rename from meta-xfce/recipes-panel-plugins/notes/files/0002-main-status-icon.c-remove-deprecated-g_type_init.patch
rename to meta-xfce/recipes-panel-plugins/notes/files/0001-main-status-icon.c-remove-deprecated-g_type_init.patch
diff --git a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb
similarity index 63%
rename from meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
rename to meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb
index fee5a4d..451ec55 100644
--- a/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.7.7.bb
+++ b/meta-xfce/recipes-panel-plugins/notes/xfce4-notes-plugin_1.8.0.bb
@@ -8,11 +8,10 @@ inherit xfce-panel-plugin
 DEPENDS = "gtk+ libxfce4ui xfce4-panel xfconf libunique"
 
 SRC_URI += " \
-    file://0001-Bump-dependency-to-Xfce-4.10.patch \
-    file://0002-main-status-icon.c-remove-deprecated-g_type_init.patch \
+    file://0001-main-status-icon.c-remove-deprecated-g_type_init.patch \
 "
-SRC_URI[md5sum] = "42b924b23f2fec6a1099e9b7a87db4a3"
-SRC_URI[sha256sum] = "a7baa105b37ad05dea4d6b55d98fd3214c77ad5c7a0e91471d4906c81e5f5217"
+SRC_URI[md5sum] = "569341bc27e2e46d23b6bffc14bff41a"
+SRC_URI[sha256sum] = "3627b7da0533ca3fb10310f287dc0d569470960ffdaea7678fd878a20d409678"
 
 FILES_${PN} += "${libdir}/xfce4/panel-plugins/*.so.*"
 
-- 
1.9.3


