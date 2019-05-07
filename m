Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 96F5F7D69E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 21:44:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zCmZ6FJ0z4H
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 May 2019 23:44:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557265455;
	bh=+KI8pvOzt2M3mSdOpyKbvdTC6UUSGtiPAwQPLmAt/i4=;
	h=From:To:Subject:Date:From;
	b=sDwpLhguPsyWdujNDQeQcs0b254s3xnWVJecDqjGiUEjyWHkta1oaETUh6Vefhqe6
	Emji4IzGqXm8HRKxendGR9u7pnpN5PzRwEoLSjS3DngZekzamCC1s3nv3TvvdbtRMC
	vvMGvLu8k/OXfBDcgRVdIRszYOVEmAPNEZXkY1SIIpqdpsJiF8L+y295XDS6bcrWj2
	5373gkLg4A1XPp+NiAe5hTCumHyCq2nrueECDgFDouO24KLlpWIDNxzrl7CQWae5rt
	+9jNDTXLdmSzngyk97gkAW+PjYrhXYVczAhwKcGSX14XAkxVOITv55ou59BayHn5hH
	2imx5w82ZF6YyzOI+KTGHylyUo1btC3QQc+qc0dUIODP8YcIJjJt8j9mmG69TRVQ+c
	1FzRkO+zsbME4MBnucEaypH8YYUFzywAip4b31pc3kQlsS6epyVzKJbqHxX9pgpItm
	NwD4DrXEhZJpB2HG7dxJTvpPzTsAaNVjs1B0CfMnBHq2eo1QEZkXdQd0wHPQBN3JVG
	z42KkTtKE00A05j0nFc+itFL9AjL5pMDCO/tESTgXRo76qD8KI2dxJVtk9x35N4aIR
	2xUeJs50bCJ4vnlJXEixuU3D5B7h0g1i4VvuOjHsUABrg1hxJ9qdZZReN9N9BeSsdV
	VDbgzhus68dV29zM2uQZ19tQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 May 2019 00:44:13 +0300
Message-Id: <20190507214414.19696-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] Remove the obsolete glade3 recipe
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
X-List-Received-Date: Tue, 07 May 2019 21:44:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

After the libbonoboui removal there shouldn't be any reason
left for this ancient version instead of the glade recipe
in meta-oe that currently builds version 3.22.1.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...NTF-on-functions-with-format-strings.patch | 62 -------------------
 ...-doc-utils.make-sysrooted-pkg-config.patch | 51 ---------------
 .../glade/glade3/0002-fix-gcc-6-build.patch   | 39 ------------
 .../recipes-devtools/glade/glade3_3.8.5.bb    | 23 -------
 4 files changed, 175 deletions(-)
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
 delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb

diff --git a/meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch b/meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
deleted file mode 100644
index 03cb762ce..000000000
--- a/meta-gnome/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fcf29abe59607b5791f9de18ddb86b9ae3c9b7cc Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 26 Aug 2017 23:50:05 -0700
-Subject: [PATCH] Add G_GNUC_PRINTF on functions with format strings
-
-This allows compilation with clang without errors, even when
--Wformat-nonliteral is active (as long as there are no real cases of
-non literal formatting).
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- gladeui/glade-command.c | 4 ++--
- gladeui/glade-utils.c   | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/gladeui/glade-command.c b/gladeui/glade-command.c
-index 9819766..4ac40ee 100644
---- a/gladeui/glade-command.c
-+++ b/gladeui/glade-command.c
-@@ -266,7 +266,7 @@ glade_command_collapse (GladeCommand  *command,
-  *
-  * Marks the begining of a group.
-  */
--void
-+G_GNUC_PRINTF(1, 2) void
- glade_command_push_group (const gchar *fmt, ...)
- {
- 	va_list         args;
-@@ -655,7 +655,7 @@ glade_command_set_properties_list (GladeProject *project, GList *props)
- 
- 	multiple = g_list_length (me->sdata) > 1;
- 	if (multiple)
--		glade_command_push_group (cmd->description);
-+		glade_command_push_group ("%s", cmd->description);
- 
- 
- 	glade_command_check_group (GLADE_COMMAND (me));
-diff --git a/gladeui/glade-utils.c b/gladeui/glade-utils.c
-index ae52501..c51ae59 100644
---- a/gladeui/glade-utils.c
-+++ b/gladeui/glade-utils.c
-@@ -197,7 +197,7 @@ glade_utils_get_pspec_from_funcname (const gchar *funcname)
-  *          selected "OK", True if the @type was GLADE_UI_YES_OR_NO and
-  *          the user selected "YES"; False otherwise.
-  */
--gint
-+G_GNUC_PRINTF(4, 5) gint
- glade_util_ui_message (GtkWidget           *parent, 
- 		       GladeUIMessageType   type,
- 		       GtkWidget           *widget,
-@@ -320,7 +320,7 @@ remove_message_timeout (FlashInfo * fi)
-  *
-  * Flash a temporary message on the statusbar.
-  */
--void
-+G_GNUC_PRINTF(3, 4) void
- glade_util_flash_message (GtkWidget *statusbar, guint context_id, gchar *format, ...)
- {
- 	va_list args;
--- 
-2.14.1
-
diff --git a/meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
deleted file mode 100644
index 1b24c39ce..000000000
--- a/meta-gnome/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From aed002cd9ff9e8f972120fbac33b4a65aba952e1 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Tue, 25 Sep 2012 10:28:33 +0200
-Subject: [PATCH] gnome-doc-utils.make: sysrooted pkg-config
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-same approach as used used in gnome-disk-utility:
-
-In cross environment we have to prepend the sysroot to the path found by
-pkgconfig since the path returned from pkgconfig does not have sysroot prefixed
-it ends up using the files from host system. Now usually people have gnome installed
-so the build succeeds but if you dont have gnome installed on build host then
-it wont find the files on host system and packages using gnome-doc-utils wont
-compile.
-
-This should work ok with non sysrooted builds too since in those cases PKG_CONFIG_SYSROOT_DIR
-will be empty
-
-Upstream-Status: pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- gnome-doc-utils.make |   10 +++++-----
- 1 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/gnome-doc-utils.make b/gnome-doc-utils.make
-index 42d9df3..f71bbfa 100644
---- a/gnome-doc-utils.make
-+++ b/gnome-doc-utils.make
-@@ -133,11 +133,11 @@ _DOC_ABS_SRCDIR = @abs_srcdir@
- _xml2po ?= `which xml2po`
- _xml2po_mode = $(if $(DOC_ID),mallard,docbook)
- 
--_db2html ?= `$(PKG_CONFIG) --variable db2html gnome-doc-utils`
--_db2omf  ?= `$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
--_chunks  ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
--_credits ?= `$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
--_ids ?= $(shell $(PKG_CONFIG) --variable xmldir gnome-doc-utils)/gnome/xslt/docbook/utils/ids.xsl
-+_db2html ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2html gnome-doc-utils`
-+_db2omf  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable db2omf gnome-doc-utils`
-+_chunks  ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/chunks.xsl
-+_credits ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/credits.xsl
-+_ids ?= ${PKG_CONFIG_SYSROOT_DIR}`$(PKG_CONFIG) --variable xmldir gnome-doc-utils`/gnome/xslt/docbook/utils/ids.xsl
- 
- if ENABLE_SK
- _ENABLE_SK = true
--- 
-1.7.6.5
-
diff --git a/meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch b/meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
deleted file mode 100644
index f735ff819..000000000
--- a/meta-gnome/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 5aa3d2abb905fa8594f6c6572a87809da54c9342 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Mon, 5 Sep 2016 11:25:27 +0200
-Subject: [PATCH] fix gcc-6 build
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Pending
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- gladeui/glade-editor-property.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/gladeui/glade-editor-property.c b/gladeui/glade-editor-property.c
-index a0c1039..5e9ac38 100644
---- a/gladeui/glade-editor-property.c
-+++ b/gladeui/glade-editor-property.c
-@@ -2703,6 +2703,8 @@ glade_eprop_object_view (gboolean             radio)
- }
- 
- 
-+#pragma GCC diagnostic push
-+#pragma GCC diagnostic ignored "-Wformat-nonliteral"
- static gchar *
- glade_eprop_object_dialog_title (GladeEditorProperty *eprop)
- {
-@@ -2731,6 +2733,7 @@ glade_eprop_object_dialog_title (GladeEditorProperty *eprop)
- 	return g_strdup_printf (format, g_type_name 
- 				(eprop->klass->pspec->value_type));
- }
-+#pragma GCC diagnostic pop
- 
- 
- gboolean
--- 
-2.5.5
-
diff --git a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb b/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
deleted file mode 100644
index c3da3e9b9..000000000
--- a/meta-gnome/recipes-devtools/glade/glade3_3.8.5.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "Glade - A User Interface Designer"
-HOMEPAGE = "http://www.gnu.org/software/gnash"
-LICENSE = "GPLv2 & LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=aabe87591cb8ae0f3c68be6977bb5522 \
-                    file://COPYING.GPL;md5=9ac2e7cff1ddaf48b6eab6028f23ef88 \
-                    file://COPYING.LGPL;md5=252890d9eee26aab7b432e8b8a616475"
-DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
-
-inherit distro_features_check autotools pkgconfig pythonnative gtk-icon-cache
-
-REQUIRED_DISTRO_FEATURES = "x11"
-
-SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
-           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
-           file://0002-fix-gcc-6-build.patch \
-           file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
-           "
-SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
-SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
-
-EXTRA_OECONF += "--disable-scrollkeeper"
-
-FILES_${PN} += "${datadir}/icons"
-- 
2.17.1


