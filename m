Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
	[209.85.214.176])
	by mail.openembedded.org (Postfix) with ESMTP id 6A0D17F891
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Jan 2020 04:42:21 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id y8so7780338pll.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Jan 2020 20:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HQh86ZSVoWklzt+K61qP3zd4tRIw+cK0dcN4bWe72Gw=;
	b=bxHU3u8+NWjQeaLOdOHG5jODDcg73Ap4TrTpMEZpJlO+paLt4A1TfwmaORgVQOm1fa
	Bzsql1tam0bb3GuxmZfReT2MIdTWF4X0aWyjXDuxUi6SinXV1B+fOB8FOnSdsjLBf/nb
	YpkAhnMjNug1UbdUR2C6bmUcOBInCtLxv0XjeN5208gOL1raNU76z0vGwBpdr6Yiu+/i
	cZtNRLdcRSWahEs0a7vYmfP9ZDTSvgM+nblvnvy8vgtPXOccAC4Py+9Sf7I04gkvmSVH
	mNb12+xMyOii6oUBCLrPX4g29jCZoJM3QT1ewjq52X81E+AKJCLrkSUMQy0A3gDlKxbD
	ATtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=HQh86ZSVoWklzt+K61qP3zd4tRIw+cK0dcN4bWe72Gw=;
	b=psyJslOyfG80s+y9smFGNcjF1AbUyXJwCep3f+glL5T7R1dREReBDZy+I64RC7hhs1
	AGj0A7YbiGWBLQNMv/+ONMCGqa7dcjnURZK9ZZC4kR11Is8N/ziaPPkf5ufAyH5xBif5
	Q/nIDdvqaxQ1VGsNmh80RkKQlP8jx65WQ5gWAAfuKqpNs4anva4vlOZ1teawsYOwuqqD
	E7uRGII3vQ9LvmWGMOfHu41un8G392bGq29smkoh8kp6c4JKirXmIxNYpKzruYb2Walf
	dKQJ4I6QHvw9gI8+aFv9P+t4HuEvxTW9SZwNoENlcEM3zgtY90A3aoW3dGfOj9vakDJI
	lsIQ==
X-Gm-Message-State: APjAAAW8uWXXHXM+zxNIYbI8x9RUX2W8iGPNh/649XqhUR1/eHOInH3u
	bodlfNE2TJkopsI/YlFmRiGxvJOCxng=
X-Google-Smtp-Source: APXvYqyD3j+c9biImo6rSwgsNVs1e943i62xL9WjypE3lqNqEKutsL8QWmpefND4BRk7mKYfgKP6BA==
X-Received: by 2002:a17:902:9686:: with SMTP id
	n6mr6351217plp.238.1579149741970; 
	Wed, 15 Jan 2020 20:42:21 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e77a])
	by smtp.gmail.com with ESMTPSA id l14sm1425742pjq.5.2020.01.15.20.42.21
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 15 Jan 2020 20:42:21 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 Jan 2020 20:42:16 -0800
Message-Id: <20200116044220.3667460-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH 1/5] sysprof: avoid namesapace conflict with glibc headers
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
X-List-Received-Date: Thu, 16 Jan 2020 04:42:21 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...rof-ui-Rename-environ-to-sys_environ.patch | 63 +++++++++++++++++++
 .../recipes-kernel/sysprof/sysprof_3.34.1.bb  |  5 +-
 2 files changed, 66 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch

diff --git a/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch b/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
new file mode 100644
index 0000000000..1e2b3c92b4
--- /dev/null
+++ b/meta-gnome/recipes-kernel/sysprof/files/0001-libsysprof-ui-Rename-environ-to-sys_environ.patch
@@ -0,0 +1,63 @@
+From 4bd0d5d5dd6841fbac8385527617d18e7731244d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 15 Jan 2020 13:17:58 -0800
+Subject: [PATCH] libsysprof-ui: Rename environ to sys_environ
+
+This helps avoid namesapace conflict with glibc headers
+
+Fixes
+/usr/include/unistd.h:545:15: note: previous declaration is here
+
+extern char **environ;
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/libsysprof-ui/sysprof-profiler-assistant.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/libsysprof-ui/sysprof-profiler-assistant.c b/src/libsysprof-ui/sysprof-profiler-assistant.c
+index 22e3e24..c55d551 100644
+--- a/src/libsysprof-ui/sysprof-profiler-assistant.c
++++ b/src/libsysprof-ui/sysprof-profiler-assistant.c
+@@ -235,7 +235,7 @@ sysprof_profiler_assistant_record_clicked_cb (SysprofProfilerAssistant *self,
+     {
+       g_auto(GStrv) argv = NULL;
+       g_auto(GStrv) env = NULL;
+-      SysprofEnviron *environ;
++      SysprofEnviron *sys_environ;
+       const gchar *command;
+       gint argc;
+ 
+@@ -245,8 +245,8 @@ sysprof_profiler_assistant_record_clicked_cb (SysprofProfilerAssistant *self,
+       sysprof_profiler_set_spawn (profiler, TRUE);
+       sysprof_profiler_set_spawn_argv (profiler, (const gchar * const *)argv);
+ 
+-      environ = sysprof_environ_editor_get_environ (self->environ_editor);
+-      env = sysprof_environ_get_environ (environ);
++      sys_environ = sysprof_environ_editor_get_environ (self->environ_editor);
++      env = sysprof_environ_get_environ (sys_environ);
+       sysprof_profiler_set_spawn_env (profiler, (const gchar * const *)env);
+ 
+       sysprof_profiler_set_spawn_inherit_environ (profiler,
+@@ -405,7 +405,7 @@ sysprof_profiler_assistant_class_init (SysprofProfilerAssistantClass *klass)
+ static void
+ sysprof_profiler_assistant_init (SysprofProfilerAssistant *self)
+ {
+-  g_autoptr(SysprofEnviron) environ = sysprof_environ_new ();
++  g_autoptr(SysprofEnviron) sys_environ = sysprof_environ_new ();
+ 
+   gtk_widget_init_template (GTK_WIDGET (self));
+ 
+@@ -445,7 +445,7 @@ sysprof_profiler_assistant_init (SysprofProfilerAssistant *self)
+                            self,
+                            G_CONNECT_SWAPPED);
+ 
+-  sysprof_environ_editor_set_environ (self->environ_editor, environ);
++  sysprof_environ_editor_set_environ (self->environ_editor, sys_environ);
+ }
+ 
+ void
+-- 
+2.25.0
+
diff --git a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
index fd1b77eced..920bf10d65 100644
--- a/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
+++ b/meta-gnome/recipes-kernel/sysprof/sysprof_3.34.1.bb
@@ -12,8 +12,9 @@ DEPENDS = "glib-2.0 libxml2-native glib-2.0-native"
 SRC_URI[archive.md5sum] = "cc32455277b31afb1965d627ae3e3629"
 SRC_URI[archive.sha256sum] = "844bbb8d8b65071b3bca96f8e921319ceef81f2d2c51fcc9da63a4b355c893d0"
 SRC_URI += "file://0001-sysprof-Define-NT_GNU_BUILD_ID-if-undefined.patch \
-           file://0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
-           "
+            file://0001-meson.build-do-not-hardcode-linux-as-host_machine-.s.patch \
+            file://0001-libsysprof-ui-Rename-environ-to-sys_environ.patch \
+            "
 
 PACKAGECONFIG ?= "sysprofd libsysprof ${@bb.utils.contains_any('DISTRO_FEATURES', '${GTK3DISTROFEATURES}', 'gtk', '', d)}"
 PACKAGECONFIG[gtk] = "-Denable_gtk=true,-Denable_gtk=false,gtk+3 libdazzle"
-- 
2.25.0


