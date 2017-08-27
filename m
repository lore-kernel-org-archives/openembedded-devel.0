Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 0DD8E7772F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 19:12:11 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id q16so4749759pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Aug 2017 12:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AZsiw5SJT9Bix7iHz41d+WDm+GZI43icF7TQWOTIWtM=;
	b=gIl864ayQWy1DUcPup25RTCWgtsr664INJ3a1ut1JXNowjMd+wFVrsG9V+zdNit9KN
	00xmT5ArS094oLutgmzGEewLjBR+zevN5I7OoE1AVaFmql1YBHrXuITT08amaVXvzfF/
	4P9Rhkw/uh4sP8N2clIBz02mST5bgzVI/HwMKkHDqEqF3tEfRcAVBYI4/sK0qx2SCyyb
	t6Q2z40rrJJURmzq+rPzrNsSuXsCGdJqUul0tMTVxO+LGulP8fZQj7hxlbQkpRDxIz8N
	C7JNIGxRJyQZkC3ZELvtSm8mR7Tv1p+uSQfTLNN9Mph9P3l9LshkOWrB06SJvLFTMxv9
	gnDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AZsiw5SJT9Bix7iHz41d+WDm+GZI43icF7TQWOTIWtM=;
	b=oiGBY2+poB0avN6uCaauvjaExW2VCEjqD6Z6iZjMYhFHvHGIu/0XfwahTxQ7Mtbqjp
	EZh7ogv57HkdHhcMZSoUCdNOFT4PI8DGDJGeUCY8p7ru5aqt6tdg/iwypbI1I1kj6DmG
	H9JEMmaggU3BQjYZlQGAInOvDECHWmsFgo6uOAZgRV1a5ZAxsNCDMNxxVT3uxuI8FOlM
	iJMudfDS61XQ4AQcEuXSPs4cM0+Qr9k8KJLQ7DZ1cCaVtCHEm3ButdQT3Q+JyaNl6/Of
	2Dy/KyMWpxSuC8lpAbrLe9VBnESq+kWtNl/SfDQFXOYkKmc/nBmpCsE1YEmzSjkxci9j
	zd3w==
X-Gm-Message-State: AHYfb5jLor4n9Fptd8hvQRNI0K2bXkm+MVHzWmf3X0YcFZvXvN1M5pV0
	XC6nlqeY6biND5NN
X-Received: by 10.99.63.206 with SMTP id m197mr4984677pga.170.1503861132735;
	Sun, 27 Aug 2017 12:12:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::79ab])
	by smtp.gmail.com with ESMTPSA id
	e184sm19231277pfe.172.2017.08.27.12.12.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 27 Aug 2017 12:12:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 27 Aug 2017 12:12:03 -0700
Message-Id: <20170827191204.8442-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
Subject: [meta-oe][PATCH 1/2] glade: Fix format string warnings with clang
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
X-List-Received-Date: Sun, 27 Aug 2017 19:12:12 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...C_PRINTF-on-functions-with-format-strings.patch | 62 ++++++++++++++++++++++
 meta-oe/recipes-devtools/glade/glade3_3.8.5.bb     | 10 ++--
 2 files changed, 67 insertions(+), 5 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch

diff --git a/meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch b/meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
new file mode 100644
index 000000000..03cb762ce
--- /dev/null
+++ b/meta-oe/recipes-devtools/glade/glade3/0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch
@@ -0,0 +1,62 @@
+From fcf29abe59607b5791f9de18ddb86b9ae3c9b7cc Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 26 Aug 2017 23:50:05 -0700
+Subject: [PATCH] Add G_GNUC_PRINTF on functions with format strings
+
+This allows compilation with clang without errors, even when
+-Wformat-nonliteral is active (as long as there are no real cases of
+non literal formatting).
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ gladeui/glade-command.c | 4 ++--
+ gladeui/glade-utils.c   | 4 ++--
+ 2 files changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/gladeui/glade-command.c b/gladeui/glade-command.c
+index 9819766..4ac40ee 100644
+--- a/gladeui/glade-command.c
++++ b/gladeui/glade-command.c
+@@ -266,7 +266,7 @@ glade_command_collapse (GladeCommand  *command,
+  *
+  * Marks the begining of a group.
+  */
+-void
++G_GNUC_PRINTF(1, 2) void
+ glade_command_push_group (const gchar *fmt, ...)
+ {
+ 	va_list         args;
+@@ -655,7 +655,7 @@ glade_command_set_properties_list (GladeProject *project, GList *props)
+ 
+ 	multiple = g_list_length (me->sdata) > 1;
+ 	if (multiple)
+-		glade_command_push_group (cmd->description);
++		glade_command_push_group ("%s", cmd->description);
+ 
+ 
+ 	glade_command_check_group (GLADE_COMMAND (me));
+diff --git a/gladeui/glade-utils.c b/gladeui/glade-utils.c
+index ae52501..c51ae59 100644
+--- a/gladeui/glade-utils.c
++++ b/gladeui/glade-utils.c
+@@ -197,7 +197,7 @@ glade_utils_get_pspec_from_funcname (const gchar *funcname)
+  *          selected "OK", True if the @type was GLADE_UI_YES_OR_NO and
+  *          the user selected "YES"; False otherwise.
+  */
+-gint
++G_GNUC_PRINTF(4, 5) gint
+ glade_util_ui_message (GtkWidget           *parent, 
+ 		       GladeUIMessageType   type,
+ 		       GtkWidget           *widget,
+@@ -320,7 +320,7 @@ remove_message_timeout (FlashInfo * fi)
+  *
+  * Flash a temporary message on the statusbar.
+  */
+-void
++G_GNUC_PRINTF(3, 4) void
+ glade_util_flash_message (GtkWidget *statusbar, guint context_id, gchar *format, ...)
+ {
+ 	va_list args;
+-- 
+2.14.1
+
diff --git a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
index fd655366f..c4f600095 100644
--- a/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
+++ b/meta-oe/recipes-devtools/glade/glade3_3.8.5.bb
@@ -8,11 +8,11 @@ DEPENDS = "gtk+ gnome-doc-utils gnome-common libxml2 intltool-native"
 
 inherit autotools pkgconfig pythonnative gtk-icon-cache
 
-SRC_URI = " \
-    http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
-    file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
-    file://0002-fix-gcc-6-build.patch \
-"
+SRC_URI = "http://ftp.gnome.org/pub/GNOME/sources/glade3/3.8/glade3-${PV}.tar.xz \
+           file://0001-gnome-doc-utils.make-sysrooted-pkg-config.patch \
+           file://0002-fix-gcc-6-build.patch \
+           file://0001-Add-G_GNUC_PRINTF-on-functions-with-format-strings.patch \
+           "
 SRC_URI[md5sum] = "4e4b4f5ee34a03e017e4cef97d796c1f"
 SRC_URI[sha256sum] = "58a5f6e4df4028230ddecc74c564808b7ec4471b1925058e29304f778b6b2735"
 
-- 
2.14.1


