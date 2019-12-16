Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45])
	by mail.openembedded.org (Postfix) with ESMTP id 848027F7DF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Dec 2019 01:20:59 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id m24so3558397wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Dec 2019 17:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=fKiJ5akk2eT/rAIMdc5DyqAvAIyvqOwL1jG/6PW/284=;
	b=isKlNj5KUtsUpmBSk2t9pgg3StiGlZYXiF8acF9xGA27enDNeDRQK0o/MyJWdejw1G
	iICaXDkBcYFJYixjJEtxN+nDSB/mfqOaQAbZ5QjFkHXk8/Cb61dLUIN11EqbGBtFP+FU
	9i+pINrdnOFUtOJd1PdR1NwmXfXmf8QP4yjyYooTv9/lerR43XhRU/R3AhdrhENUdgI0
	zzpDT7MCvFZajJVqnZirajyQ0seLRzcNXxzUu5h5QWbs/Geuvl24+Ny4AbXxBvyG8FBS
	FnGGHowJ6H36dqpxULEKl5Vr7BQnkOlR/1YtFnLRix68tMT81gLhcUPnS9gncLH6mv9L
	2FPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=fKiJ5akk2eT/rAIMdc5DyqAvAIyvqOwL1jG/6PW/284=;
	b=e1Fts0Qqp06QN5pRZR0ct97BOTQJ2Pm9kmbUjp2DmM1SASxHqRS31xoSIECTU0SiV0
	NAvha6ni8Y/50q1402tbwKyAkaGH/3V1ItAh7m0PfApoxLvWh7KoXVrlT20JoBl1dAZu
	SY15g4eGmzHwn80hcmoQBzs33fv90c2uuhJ+nGTjzkfZrS8R87v6jQ6RJ5mJgEClXnPv
	JTImRiiMwne7MuzLqVtmFnXsyKmfUh1NrnvhxKMxzzwvjeMSAMUvB7GcOHj7xxqu2Btz
	G78LjYja/EabQ102PHXV3990QCLMc612CBWjeIob9Qx5pfWsca8ShwBjcMkaQCZ5ZNr1
	3P4A==
X-Gm-Message-State: APjAAAUEC10v0RLBD5Dz3yNDi/Gckxk//zww65uo1MMpfwyMlJhMKOQz
	BIruQR17anopW+t7zN/PDewswm/b
X-Google-Smtp-Source: APXvYqzckaf7fVLTPZUkFpNGSgtYuNq48CF78Q2DQwgwy2+4KMfiMbV+H7vIgV/vsK9UgRKyrFxAwA==
X-Received: by 2002:a1c:638a:: with SMTP id x132mr29078910wmb.43.1576459259520;
	Sun, 15 Dec 2019 17:20:59 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F06A307CB3B21B8240595DD.dip0.t-ipconnect.de.
	[2003:f0:7f06:a307:cb3b:21b8:2405:95dd])
	by smtp.gmail.com with ESMTPSA id
	t190sm10877063wmt.44.2019.12.15.17.20.58
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Dec 2019 17:20:58 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Dec 2019 02:20:43 +0100
Message-Id: <20191216012047.17312-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191216012047.17312-1-schnitzeltony@gmail.com>
References: <20191216012047.17312-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/6] glade3: remove ancient version of glade
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
X-List-Received-Date: Mon, 16 Dec 2019 01:20:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* This was suggested already [1] but I complained that there is a use-case.
  There are several workarounds possible for this so we don't need to keep
  it anymore.
* glade3 popped into focus during preparations for python2 removal. So instead
  of wasting time to keep unmaintained version just drop it

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-May/199523.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...NTF-on-functions-with-format-strings.patch | 62 -------------------
 ...-doc-utils.make-sysrooted-pkg-config.patch | 51 ---------------
 .../glade/glade3/0002-fix-gcc-6-build.patch   | 39 ------------
 .../recipes-devtools/glade/glade3_3.8.5.bb    | 23 -------
 4 files changed, 175 deletions(-)
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
 delete mode 100644 meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb

diff --git a/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch b/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
deleted file mode 100644
index 03cb762ce..000000000
--- a/meta-xfce/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
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
diff --git a/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch b/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
deleted file mode 100644
index 1b24c39ce..000000000
--- a/meta-xfce/recipes-devtools/glade/glade3/0001-gnome-doc-utils.make-sysrooted-pkg-config.patch
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
diff --git a/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch b/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
deleted file mode 100644
index f735ff819..000000000
--- a/meta-xfce/recipes-devtools/glade/glade3/0002-fix-gcc-6-build.patch
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
diff --git a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb b/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
deleted file mode 100644
index 24d0d901f..000000000
--- a/meta-xfce/recipes-devtools/glade/glade3_3.8.5.bb
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
-inherit features_check autotools pkgconfig pythonnative gtk-icon-cache
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
2.21.0


