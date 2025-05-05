Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00487C3ABB9
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 06:21:54 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.44203.1746426109525845740
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 May 2025 23:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/loIDeM;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-736b98acaadso3676717b3a.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 May 2025 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746426109; x=1747030909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J4blmx6sWmEPljFoOyK0K15/g1LtQKLoBxyf0uSV9rU=;
        b=J/loIDeMNt5GSWEzZiBoCFI6oOUScZY0aOCjzRCTBuiX2bXiwZjtyoR+uD/s+QdCCz
         dplhYDkExPwLe2xex1c/kfMNuEHe1QwBHoNXBcc389GBYtXqFal4Rz8ghoSF73i1/RWr
         s9oXCNQFASLnn6KyszKpt088aIF5hJ6rXLMrUqag5iNmmjVh65/jpaBiXdyB9qMu+VwC
         CHB0GmyiSfD2MSg2N7qt7yRbUc8fq2pRn4wBnFTOI/jHxQ0+9Xkzt5q7eTB85NN6QYic
         Eb4R6VYG/2We/kKCOVJOLxXc+aYYHcDaOuKLHZxQ6sBMasFaAOnlu0to38oHQ0GwrCCm
         Irzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746426109; x=1747030909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J4blmx6sWmEPljFoOyK0K15/g1LtQKLoBxyf0uSV9rU=;
        b=cFleO1+xizpUhGT8cdtlqrKh3wPxeQHjff7F4QC5tNG0X70ySjN1jGtda/Z+xLkTu1
         oYAiMZt9U/iJGHaRJhZTtNAzzM4q1usAzUQuQcjr/FVldVLiqlSb+2+xa76OM1BlvD7Y
         vVqzj+8eyp9FbVwIL6oMNyRuNgePM/cbhICrOnQocFD9Iim5PjjF7SwalPBIU0Q3IffJ
         TDTwfuoyxd1n0QmODo1a5L1SXpp0Szt6pePurO1POOgxHDMv4PpY37LECqCpWxGuFAtN
         qfDYR9KV5KFKf2EKl+bOPGrEzNdwDPJHkkPFpN4iZg8J/DAdnauxPeCEURyrk1gHDsI6
         NtpQ==
X-Gm-Message-State: AOJu0YzIUQXk4ViE1n4t6FhFPTSsblon4qYiqXeVF+P/O5C8I/1I1AXr
	KrNKdILkyJhXhjFPLE/LiA8r6A3Xf5fVJoA5FH3mJDce428VV9JAUk7vMyu6
X-Gm-Gg: ASbGncuhCBq8LasrvYsPnbWXGWwPIFtBWe579l695J74rlBoRNSqhsoD9F+sAVhJVi4
	0YjkgmuYDEH2F/2MZFOh5o7rcNHKh9ynsLd73ilNeWnnKat/NxZFAV3zI+MJOAOwT4WEG1qiP/3
	JACXYrS+/Mj4tojz8mcz1gcHv7iw8sCKuQ42QRk6+d7he3Fdkl1F5rYKeJ7pGAT/kXa50oYGsPf
	tlfpHTMCqJ2A4mSipLqLaTpamz/ia08EWFOTdPIz/3favfxa/HSpMvI73uHmnnFr/BH2gI5iqvJ
	nOeuI7HT6KA5ncHABAsmSy8Wf3rcCfOi
X-Google-Smtp-Source: AGHT+IEjj7bkeVhkczBVu0FRAh+2eHyGzBXhj7A72hwuMP3c/vmGFTbGqqmiv/lg7Js5rm1ppk0Tyg==
X-Received: by 2002:a05:6a21:600e:b0:1f5:8179:4f43 with SMTP id adf61e73a8af0-20e06834e78mr11655260637.23.1746426108610;
        Sun, 04 May 2025 23:21:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7b1cdsm5952352b3a.25.2025.05.04.23.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 23:21:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 5/7] geany-plugins: Upgrade to 2.0 release
Date: Sun,  4 May 2025 23:21:40 -0700
Message-ID: <20250505062142.3478500-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505062142.3478500-1-raj.khem@gmail.com>
References: <20250505062142.3478500-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 06:21:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117294

Backport build fixed for gcc-15

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...anizer-fix-invalid-string-comparison.patch | 24 +++++
 ...rojectorganizer-fix-various-warnings.patch | 45 ++++++++++
 ...-Use-g_pattern_spec_match_string-ins.patch | 89 +++++++++++++++++++
 .../geany-plugins-2.0-gcc15.patch             | 30 +++++++
 ...y-plugins_1.38.bb => geany-plugins_2.0.bb} | 14 ++-
 5 files changed, 193 insertions(+), 9 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0001-projectorganizer-fix-invalid-string-comparison.patch
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0002-projectorganizer-fix-various-warnings.patch
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/0003-projectorganizer-Use-g_pattern_spec_match_string-ins.patch
 create mode 100644 meta-oe/recipes-devtools/geany/geany-plugins/geany-plugins-2.0-gcc15.patch
 rename meta-oe/recipes-devtools/geany/{geany-plugins_1.38.bb => geany-plugins_2.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0001-projectorganizer-fix-invalid-string-comparison.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0001-projectorganizer-fix-invalid-string-comparison.patch
new file mode 100644
index 0000000000..5a0650aec1
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0001-projectorganizer-fix-invalid-string-comparison.patch
@@ -0,0 +1,24 @@
+From 8dfd7f2cba428f5eb232fbbe3427c64171bae0f4 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Techet?= <techet@gmail.com>
+Date: Tue, 5 Mar 2024 18:36:37 +0100
+Subject: [PATCH 1/3] projectorganizer: fix invalid string comparison
+
+Upstream-Status: Backport [https://github.com/geany/geany-plugins/commit/8dfd7f2cba428f5eb232fbbe3427c64171bae0f4]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ projectorganizer/src/prjorg-sidebar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/projectorganizer/src/prjorg-sidebar.c b/projectorganizer/src/prjorg-sidebar.c
+index b6422f0..0139473 100644
+--- a/projectorganizer/src/prjorg-sidebar.c
++++ b/projectorganizer/src/prjorg-sidebar.c
+@@ -346,7 +346,7 @@ static gchar *get_fallback_dir_of_selection(void)
+ 		{
+ 			locale_path = g_path_get_dirname(doc->real_path);
+ 
+-			if (locale_path && locale_path == '.')
++			if (locale_path && *locale_path == '.')
+ 			{
+ 				g_free(locale_path);
+ 				locale_path = NULL;
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0002-projectorganizer-fix-various-warnings.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0002-projectorganizer-fix-various-warnings.patch
new file mode 100644
index 0000000000..c70f4d6e15
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0002-projectorganizer-fix-various-warnings.patch
@@ -0,0 +1,45 @@
+From 58d47e60bdcec62fe74b4a38eaf39d16a9c80d42 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Techet?= <techet@gmail.com>
+Date: Tue, 5 Mar 2024 18:40:10 +0100
+Subject: [PATCH 2/3] projectorganizer: fix various warnings
+
+Upstream-Status: Backport [https://github.com/geany/geany-plugins/commit/58d47e60bdcec62fe74b4a38eaf39d16a9c80d42]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ projectorganizer/src/prjorg-sidebar.c | 9 +++------
+ 1 file changed, 3 insertions(+), 6 deletions(-)
+
+diff --git a/projectorganizer/src/prjorg-sidebar.c b/projectorganizer/src/prjorg-sidebar.c
+index 0139473..e67cce2 100644
+--- a/projectorganizer/src/prjorg-sidebar.c
++++ b/projectorganizer/src/prjorg-sidebar.c
+@@ -382,7 +382,8 @@ void on_open_file_manager(G_GNUC_UNUSED GtkMenuItem * menuitem, G_GNUC_UNUSED gp
+ 
+ 	if (locale_path)
+ 	{
+-		gchar *command, *open_command;
++		const gchar *open_command;
++		gchar *command;
+ 
+ 		open_command = PRJORG_COMMAND_OPEN;
+ 		command = g_strconcat (open_command, " \"", locale_path, "\"", NULL);
+@@ -1562,7 +1563,7 @@ gchar **prjorg_sidebar_get_expanded_paths(void)
+ 		(GtkTreeViewMappingFunc)on_map_expanded, expanded_paths);
+ 	g_ptr_array_add(expanded_paths, NULL);
+ 
+-	return g_ptr_array_free(expanded_paths, FALSE);
++	return (gchar **)g_ptr_array_free(expanded_paths, FALSE);
+ }
+ 
+ 
+@@ -1587,10 +1588,6 @@ void prjorg_sidebar_update_full(gboolean reload, gchar **expanded_paths)
+ 
+ 	if (reload)
+ 	{
+-		GtkTreeSelection *treesel;
+-		GtkTreeIter iter;
+-		GtkTreeModel *model;
+-
+ 		expand_data->expanded_paths = expanded_paths != NULL ? expanded_paths : prjorg_sidebar_get_expanded_paths();
+ 		expand_data->selected_path = get_selected_path();
+ 
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/0003-projectorganizer-Use-g_pattern_spec_match_string-ins.patch b/meta-oe/recipes-devtools/geany/geany-plugins/0003-projectorganizer-Use-g_pattern_spec_match_string-ins.patch
new file mode 100644
index 0000000000..4c4e11c6cd
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/0003-projectorganizer-Use-g_pattern_spec_match_string-ins.patch
@@ -0,0 +1,89 @@
+From a4a7c4af7f62eb55c0bd100ed1d308e6512a66ce Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ji=C5=99=C3=AD=20Techet?= <techet@gmail.com>
+Date: Tue, 23 Apr 2024 18:43:51 +0200
+Subject: [PATCH 3/3] projectorganizer: Use g_pattern_spec_match_string() instead of g_pattern_match_string()
+
+Eliminates a warning on newer glib versions. Adds a fallback on older versions.
+
+Upstream-Status: Backport [https://github.com/geany/geany-plugins/commit/a4a7c4af7f62eb55c0bd100ed1d308e6512a66ce]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ projectorganizer/src/prjorg-project.c | 2 +-
+ projectorganizer/src/prjorg-sidebar.c | 4 ++--
+ projectorganizer/src/prjorg-utils.c   | 4 ++--
+ projectorganizer/src/prjorg-utils.h   | 5 +++++
+ 4 files changed, 10 insertions(+), 5 deletions(-)
+
+diff --git a/projectorganizer/src/prjorg-project.c b/projectorganizer/src/prjorg-project.c
+index a767ab8..71dc6e1 100644
+--- a/projectorganizer/src/prjorg-project.c
++++ b/projectorganizer/src/prjorg-project.c
+@@ -216,7 +216,7 @@ static gboolean match_basename(gconstpointer pft, gconstpointer user_data)
+ 	{
+ 		GPatternSpec *pattern = g_pattern_spec_new(ft->pattern[j]);
+ 
+-		if (g_pattern_match_string(pattern, utf8_base_filename))
++		if (g_pattern_spec_match_string(pattern, utf8_base_filename))
+ 		{
+ 			ret = TRUE;
+ 			g_pattern_spec_free(pattern);
+diff --git a/projectorganizer/src/prjorg-sidebar.c b/projectorganizer/src/prjorg-sidebar.c
+index e67cce2..b7536ee 100644
+--- a/projectorganizer/src/prjorg-sidebar.c
++++ b/projectorganizer/src/prjorg-sidebar.c
+@@ -657,7 +657,7 @@ static void find_file_recursive(GtkTreeIter *iter, gboolean case_sensitive, gboo
+ 		if (!case_sensitive)
+ 			SETPTR(utf8_name, g_utf8_strdown(utf8_name, -1));
+ 
+-		if (g_pattern_match_string(pattern, utf8_name))
++		if (g_pattern_spec_match_string(pattern, utf8_name))
+ 		{
+ 			gchar *utf8_base_path = get_project_base_path();
+ 			gchar *utf8_path, *rel_path;
+@@ -840,7 +840,7 @@ static gboolean match(TMTag *tag, const gchar *name, gboolean declaration, gbool
+ 				matches = g_strcmp0(name_case, name) == 0;
+ 				break;
+ 			case MATCH_PATTERN:
+-				matches = g_pattern_match_string(pspec, name_case);
++				matches = g_pattern_spec_match_string(pspec, name_case);
+ 				break;
+ 			case MATCH_PREFIX:
+ 				matches = g_str_has_prefix(name_case, name);
+diff --git a/projectorganizer/src/prjorg-utils.c b/projectorganizer/src/prjorg-utils.c
+index 2a8847e..0b573e5 100644
+--- a/projectorganizer/src/prjorg-utils.c
++++ b/projectorganizer/src/prjorg-utils.c
+@@ -80,7 +80,7 @@ gboolean patterns_match(GSList *patterns, const gchar *str)
+ 	foreach_slist (elem, patterns)
+ 	{
+ 		GPatternSpec *pattern = elem->data;
+-		if (g_pattern_match_string(pattern, str))
++		if (g_pattern_spec_match_string(pattern, str))
+ 			return TRUE;
+ 	}
+ 	return FALSE;
+@@ -269,7 +269,7 @@ gchar *try_find_header_source(gchar *utf8_file_name, gboolean is_header, GSList
+ 		full_name = elem->data;
+ 		gchar *base_name = g_path_get_basename(full_name);
+ 
+-		if (g_pattern_match_string(pattern, base_name))
++		if (g_pattern_spec_match_string(pattern, base_name))
+ 		{
+ 			if ((is_header && patterns_match(source_patterns, base_name)) ||
+ 				(!is_header && patterns_match(header_patterns, base_name)))
+diff --git a/projectorganizer/src/prjorg-utils.h b/projectorganizer/src/prjorg-utils.h
+index c3719a9..50ed123 100644
+--- a/projectorganizer/src/prjorg-utils.h
++++ b/projectorganizer/src/prjorg-utils.h
+@@ -19,6 +19,11 @@
+ #ifndef __PRJORG_UTILS_H__
+ #define __PRJORG_UTILS_H__
+ 
++
++ #if ! GLIB_CHECK_VERSION(2, 70, 0)
++ # define g_pattern_spec_match_string g_pattern_match_string
++ #endif
++ 
+ gchar *get_relative_path(const gchar *utf8_parent, const gchar *utf8_descendant);
+ 
+ gboolean patterns_match(GSList *patterns, const gchar *str);
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins/geany-plugins-2.0-gcc15.patch b/meta-oe/recipes-devtools/geany/geany-plugins/geany-plugins-2.0-gcc15.patch
new file mode 100644
index 0000000000..563416bf92
--- /dev/null
+++ b/meta-oe/recipes-devtools/geany/geany-plugins/geany-plugins-2.0-gcc15.patch
@@ -0,0 +1,30 @@
+Fix build with GCC-15
+
+Upstream-Status: Backport [https://github.com/geany/geany-plugins/pull/1389]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/git-changebar/src/gcb-plugin.c
++++ b/git-changebar/src/gcb-plugin.c
+@@ -1410,9 +1410,9 @@ read_setting_boolean (GKeyFile     *kf,
+                       const gchar  *key,
+                       gpointer      value)
+ {
+-  gboolean *bool = value;
++  gboolean *boolean = value;
+   
+-  *bool = utils_get_setting_boolean (kf, group, key, *bool);
++  *boolean = utils_get_setting_boolean (kf, group, key, *boolean);
+ }
+ 
+ static void
+@@ -1421,9 +1421,9 @@ write_setting_boolean (GKeyFile      *kf,
+                        const gchar   *key,
+                        gconstpointer  value)
+ {
+-  const gboolean *bool = value;
++  const gboolean *boolean = value;
+   
+-  g_key_file_set_boolean (kf, group, key, *bool);
++  g_key_file_set_boolean (kf, group, key, *boolean);
+ }
+ 
+ /* loads @filename in @kf and return %FALSE if failed, emitting a warning
diff --git a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
rename to meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
index 1ed2993bf0..bd10c09195 100644
--- a/meta-oe/recipes-devtools/geany/geany-plugins_1.38.bb
+++ b/meta-oe/recipes-devtools/geany/geany-plugins_2.0.bb
@@ -30,12 +30,12 @@ REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
     https://plugins.geany.org/${BPN}/${BP}.tar.bz2 \
-    file://0001-Use-pkg-config-to-find-gpgme.patch \
-    file://0001-git-changebar-Adjust-structs-for-libgit2-1.4.x.patch \
-    file://0001-geany.m4-Do-not-tinker-with-pkg-config-paths.patch \
-    file://0001-scope-Use-0-instead-of-NULL-for-gboolean.patch \
+    file://geany-plugins-2.0-gcc15.patch \
+    file://0001-projectorganizer-fix-invalid-string-comparison.patch \
+    file://0002-projectorganizer-fix-various-warnings.patch \
+    file://0003-projectorganizer-Use-g_pattern_spec_match_string-ins.patch \
 "
-SRC_URI[sha256sum] = "1c578a7ebb390aa8882f195acd3d8da3ceb73925d291b28dec90cd3e5fd20586"
+SRC_URI[sha256sum] = "9fc2ec5c99a74678fb9e8cdfbd245d3e2061a448d70fd110a6aefb62dd514705"
 
 do_configure:prepend() {
     rm -f ${S}/build/cache/glib-gettext.m4
@@ -75,8 +75,6 @@ PLUGINS += "${PN}-defineformat"
 LIC_FILES_CHKSUM += "file://defineformat/COPYING;md5=751419260aa954499f7abaabaa882bbe"
 FILES:${PN}-defineformat = "${libdir}/geany/defineformat.so"
 
-# no gnome devhelp in some common layer
-EXTRA_OECONF += "--disable-devhelp"
 #PLUGINS += "${PN}-devhelp"
 #LIC_FILES_CHKSUM += "file://devhelp/COPYING;md5=d32239bcb673463ab874e80d47fae504"
 #LICENSE:${PN}-devhelp = "GPLv3"
@@ -165,8 +163,6 @@ EXTRA_OECONF += "--disable-peg-markdown"
 #LIC_FILES_CHKSUM += "file://markdown/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 #FILES:${PN}-markdown = "${libdir}/geany/markdown.so"
 
-# | checking whether the GTK version in use is compatible with plugin multiterm... no
-EXTRA_OECONF += "--disable-multiterm"
 #PLUGINS += "${PN}-multiterm"
 #LIC_FILES_CHKSUM += "file://multiterm/COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 #FILES:${PN}-multiterm = "${libdir}/geany/multiterm.so"

