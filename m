Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B45AC43458
	for <webhook@archiver.kernel.org>; Sat,  4 Jul 2026 22:33:39 +0000 (UTC)
Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.123013.1783204409179694168
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Jul 2026 15:33:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=oaDYTHiD;
 spf=pass (domain: gmail.com, ip: 74.125.224.42, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6649ffb1d01so2821086d50.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 15:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783204408; x=1783809208; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Udguw0osmjvxngUJbFGBYXCvQzt+fE/dkcaO+xXAgE=;
        b=oaDYTHiDptPN/NscRjy2JXM9GV0Q62dIqf8MPdVzCVDd6AJH0++fvZez738iUnAUYz
         0Vl4nGAXLfJJckg1c4pR9HXo9WfiBnxrnOlUiB29pxSUL0P3FxgX9heeg7Nu7lv0IKQs
         YR5uTJSxjEIvXvBJL5F3h3Ng2c38z4wGumY18KmSDDsLlVKFU9lxQM+abeoXoL6oi3io
         4rqBtMXaVRZSru6Gnoctm8f+iQkM5R6pk36R2C5KQEg7DS75PcGWeIx2RzgXLhgUIOOd
         AswVSCeCxprxhaXnxbdhXi89L0kYHZ39G2CywnO6xjgBQrmUyFN+KJ/k5jkaVA2r7NP7
         o4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783204408; x=1783809208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Udguw0osmjvxngUJbFGBYXCvQzt+fE/dkcaO+xXAgE=;
        b=mtxpZ4wqqJ8vOz9YYRpgBqxOW0KdFHL6PNWJzMwvj4eG/MH1b6z9n73cGZYDA+sQ8R
         lkQ97BZ8InzKzxHIpKI2XOTUYgPMd7gBgG5K93I/5cUhfhLfzuukLB5wmQI24sqC5m8/
         fUQyAvz/Cz39GhYHhWGdcBVyS+IGcQY7n2fpTDra8+u9a56H6QBs7/u2Uvoxu5wgtrdx
         EcK+5uIfa/OZ2fL2RlhNyBMR2O5BC5AuCSx3hTpd4U/nch63P0PyANbiO/j6wBKmQDFR
         SHM31TyA5Pa/krWHk6VgI39AkjCf7cXdNPDIcPxvSlDiwX+sniM6ZP2fGxkFtcM9SKnP
         sQGw==
X-Gm-Message-State: AOJu0YwQckxtcsD2PCB/+QXUGypJu7jDzCxaAA9nzt1+rjA1cIaqODBv
	uD+lwgQm6hWlIBkJWn8r4mH/n4tax8UT8l2L+JvFNa//4+CvQqMUC0qR7Nw8kbo5
X-Gm-Gg: AfdE7ckjnJtcOJ58EzdVuoMRl2Hmfu2flU5fhH97+r6T8k/RkN+VDIjg0iV96jxNuV4
	5V0lp/euYG2AZc2CSz4jA0gfsEl8fHMH2nFCDfZQc/LSKDTGdUMJcN/XAHgYRYNEq3rxSK5elBZ
	BJUP6/9F7LY3P6FdQxr67+CdcM1Ulrsy+A9HU+A/n+KsnbTOUz01uIu9RkJTfRC0c4qVI+qtAtF
	jP6U2Q2Fcul5gqY+j6vtUAXkdgaILCO95RALNVdv8KD15Fneb/77boMCt3thoR+MK9oIyAWT48q
	dORPVlc9pF6Nzf97a1XCpMggQ+7I+8EOVGR4FAGXxxz6LPmhANYG9nstad7H6sja5ufhZK8vYpr
	CTaroZhu82RUa66PbgcvwV/AsnVbToQAPrqDDTkk893S4CrXeik+2AiXESocpJoHO/ecsax4nN9
	XoSbWUNmRRflDlORdAmO7Enw4yZsPMxLD+Kj/CGfjOpTOZSqAuG7w9aZ2ljfkpdJPQMD3CF5K4w
	sYmKaVTrV25sboM+lyb4p+gBybEA9DEIJ0doz5z
X-Received: by 2002:a05:690e:1c08:b0:666:3917:fbdf with SMTP id 956f58d0204a3-66652e568f1mr4307780d50.26.1783204407584;
        Sat, 04 Jul 2026 15:33:27 -0700 (PDT)
Received: from localhost.localdomain ([71.54.207.93])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-666405289f2sm2663242d50.7.2026.07.04.15.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Jul 2026 15:33:27 -0700 (PDT)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-xfce][PATCH] xfce4-panel : upgrade 4.21.1 -> 4.21.2
Date: Sat,  4 Jul 2026 18:33:10 -0400
Message-ID: <20260704223310.12922-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Jul 2026 22:33:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128024

Drop backported patches which are already included in this version.

Update 0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch for member name
changes.

Changelog: https://gitlab.xfce.org/xfce/xfce4-panel/-/tags/xfce4-panel-4.21.2

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 ...-generate-sub-headers-before-includi.patch | 311 ------------------
 ...splay-full-path-in-generated-headers.patch |  36 --
 ...oe-Remove-wrong-autoptr-define-guard.patch |  42 ---
 ...t-display-desktop-icon-when-no-windo.patch |  28 +-
 ...uild-Install-missing-libxfce4panel.h.patch |  30 --
 ...-panel_4.21.1.bb => xfce4-panel_4.21.2.bb} |   6 +-
 6 files changed, 17 insertions(+), 436 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch
 rename meta-xfce/recipes-xfce/xfce4-panel/{xfce4-panel_4.21.1.bb => xfce4-panel_4.21.2.bb} (83%)

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
deleted file mode 100644
index 67d2b4eaa8..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Be-sure-to-generate-sub-headers-before-includi.patch
+++ /dev/null
@@ -1,311 +0,0 @@
-From c259dfbbb8e139b43af179acec9824ecf849d34d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Thu, 19 Feb 2026 11:44:35 +0100
-Subject: [PATCH 1/2] build: Be sure to generate sub-headers before including
- libxfce4panel.h
-
-Fixes: #969
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/c259dfbbb8e139b43af179acec9824ecf849d34d]
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- common/meson.build                              |  3 +++
- .../{libxfce4panel.h => libxfce4panel.h.in}     |  0
- libxfce4panel/meson.build                       | 17 +++++++++++++++--
- migrate/meson.build                             |  3 +++
- panel/meson.build                               |  1 +
- plugins/actions/meson.build                     |  5 ++++-
- plugins/applicationsmenu/meson.build            |  5 ++++-
- plugins/clock/meson.build                       |  5 ++++-
- plugins/directorymenu/meson.build               |  5 ++++-
- plugins/launcher/meson.build                    |  5 ++++-
- plugins/pager/meson.build                       |  5 ++++-
- plugins/separator/meson.build                   |  5 ++++-
- plugins/showdesktop/meson.build                 |  5 ++++-
- plugins/systray/meson.build                     |  5 ++++-
- plugins/tasklist/meson.build                    |  5 ++++-
- plugins/windowmenu/meson.build                  |  5 ++++-
- wrapper/meson.build                             |  3 +++
- 17 files changed, 69 insertions(+), 13 deletions(-)
- rename libxfce4panel/{libxfce4panel.h => libxfce4panel.h.in} (100%)
-
-diff --git a/common/meson.build b/common/meson.build
-index ce7f3a98c..d880455ac 100644
---- a/common/meson.build
-+++ b/common/meson.build
-@@ -8,6 +8,9 @@ libpanel_common = static_library(
-     'panel-xfconf.c',
-     'panel-xfconf.h',
-   ],
-+  sources: [
-+    libxfce4panel_h,
-+  ],
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libpanel-common'),
-   ],
-diff --git a/libxfce4panel/libxfce4panel.h b/libxfce4panel/libxfce4panel.h.in
-similarity index 100%
-rename from libxfce4panel/libxfce4panel.h
-rename to libxfce4panel/libxfce4panel.h.in
-diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
-index bb66b1534..150319388 100644
---- a/libxfce4panel/meson.build
-+++ b/libxfce4panel/meson.build
-@@ -6,7 +6,6 @@ libpanel_install_dir = get_option('prefix') / get_option('includedir') / libpane
- 
- libpanel_headers = [
-   'libxfce4panel-enums.h',
--  'libxfce4panel.h',
-   'xfce-arrow-button.h',
-   'xfce-panel-convenience.h',
-   'xfce-panel-image.h',
-@@ -16,7 +15,7 @@ libpanel_headers = [
- 
- # do not add this header to GI sources, it creates unsolvable conflicts with other
- # libs whose identifier prefix is Xfce, e.g. libxfce4ui and libxfce4util
--configure_file(
-+libpanel_config_h = configure_file(
-   configuration: configuration_data({
-     'LIBXFCE4PANEL_VERSION': meson.project_version(),
-     'LIBXFCE4PANEL_VERSION_MAJOR': version_parts[0],
-@@ -84,6 +83,20 @@ libpanel_enums += gnome.mkenums(
-   ftail: '\n#define __LIBXFCE4PANEL_ENUM_TYPES_C__\n#include "libxfce4panel-visibility.c"\n',
- )
- 
-+libxfce4panel_h = custom_target(
-+  'libxfce4panel.h',
-+  input: 'libxfce4panel.h.in',
-+  output: 'libxfce4panel.h',
-+  command: ['cp', '@INPUT@', '@OUTPUT@'],
-+  depends: [
-+    libpanel_enums,
-+  ],
-+  depend_files: [
-+    libpanel_config_h,
-+  ],
-+)
-+libpanel_sources += libxfce4panel_h
-+
- libpanel_deps = [
-   glib,
-   gmodule,
-diff --git a/migrate/meson.build b/migrate/meson.build
-index 8159f6336..19d95a2eb 100644
---- a/migrate/meson.build
-+++ b/migrate/meson.build
-@@ -21,6 +21,9 @@ migrate_sources = [
- executable(
-   'migrate',
-   migrate_sources,
-+  sources: [
-+    libxfce4panel_h,
-+  ],
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel-migrate'),
-     '-DXDGCONFIGDIR="@0@"'.format(xdgconfdir),
-diff --git a/panel/meson.build b/panel/meson.build
-index 78e2d8d15..6c2fd4e1e 100644
---- a/panel/meson.build
-+++ b/panel/meson.build
-@@ -73,6 +73,7 @@ executable(
-   sources: [
-     xfce_revision_h,
-     xfce4_panel_resources_c,
-+    libxfce4panel_h,
-   ],
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel'),
-diff --git a/plugins/actions/meson.build b/plugins/actions/meson.build
-index 55dcd2e1f..c3d824d41 100644
---- a/plugins/actions/meson.build
-+++ b/plugins/actions/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'actions',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libactions'),
-diff --git a/plugins/applicationsmenu/meson.build b/plugins/applicationsmenu/meson.build
-index efa825f00..15e06af0f 100644
---- a/plugins/applicationsmenu/meson.build
-+++ b/plugins/applicationsmenu/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'applicationsmenu',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libapplicationsmenu'),
-diff --git a/plugins/clock/meson.build b/plugins/clock/meson.build
-index b08f3c39c..8e005f486 100644
---- a/plugins/clock/meson.build
-+++ b/plugins/clock/meson.build
-@@ -22,7 +22,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'clock',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libclock'),
-diff --git a/plugins/directorymenu/meson.build b/plugins/directorymenu/meson.build
-index 43e81abf3..0bf48bae6 100644
---- a/plugins/directorymenu/meson.build
-+++ b/plugins/directorymenu/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'directorymenu',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libdirectorymenu'),
-diff --git a/plugins/launcher/meson.build b/plugins/launcher/meson.build
-index d228eca54..8815b5baa 100644
---- a/plugins/launcher/meson.build
-+++ b/plugins/launcher/meson.build
-@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'launcher',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('liblauncher'),
-diff --git a/plugins/pager/meson.build b/plugins/pager/meson.build
-index 30fcbdef6..45e34c62b 100644
---- a/plugins/pager/meson.build
-+++ b/plugins/pager/meson.build
-@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'pager',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libpager'),
-diff --git a/plugins/separator/meson.build b/plugins/separator/meson.build
-index 9de0289b3..26581e90e 100644
---- a/plugins/separator/meson.build
-+++ b/plugins/separator/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'separator',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libseparator'),
-diff --git a/plugins/showdesktop/meson.build b/plugins/showdesktop/meson.build
-index 2e4812de4..c599138c2 100644
---- a/plugins/showdesktop/meson.build
-+++ b/plugins/showdesktop/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'showdesktop',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libshowdesktop'),
-diff --git a/plugins/systray/meson.build b/plugins/systray/meson.build
-index 2efa088d4..ea364ccff 100644
---- a/plugins/systray/meson.build
-+++ b/plugins/systray/meson.build
-@@ -52,7 +52,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'systray',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libsystray'),
-diff --git a/plugins/tasklist/meson.build b/plugins/tasklist/meson.build
-index 333e91c21..61b889536 100644
---- a/plugins/tasklist/meson.build
-+++ b/plugins/tasklist/meson.build
-@@ -10,7 +10,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'tasklist',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libtasklist'),
-diff --git a/plugins/windowmenu/meson.build b/plugins/windowmenu/meson.build
-index 71125ffc7..07a6d767a 100644
---- a/plugins/windowmenu/meson.build
-+++ b/plugins/windowmenu/meson.build
-@@ -8,7 +8,10 @@ plugin_install_subdir = 'xfce4' / 'panel' / 'plugins'
- shared_module(
-   'windowmenu',
-   plugin_sources,
--  sources: xfce4_panel_resources_c,
-+  sources: [
-+    xfce4_panel_resources_c,
-+    libxfce4panel_h,
-+  ],
-   gnu_symbol_visibility: 'hidden',
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('libwindowmenu'),
-diff --git a/wrapper/meson.build b/wrapper/meson.build
-index 4f33fd89a..e88644c1f 100644
---- a/wrapper/meson.build
-+++ b/wrapper/meson.build
-@@ -31,6 +31,9 @@ wrapper_sources += gnome.gdbus_codegen(
- executable(
-   'wrapper-2.0',
-   wrapper_sources,
-+  sources: [
-+    libxfce4panel_h,
-+  ],
-   c_args: [
-     '-DG_LOG_DOMAIN="@0@"'.format('xfce4-panel-wrapper'),
-   ],
--- 
-2.43.0
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
deleted file mode 100644
index 34ec80b47e..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-build-Do-not-display-full-path-in-generated-headers.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 61f40b65637695abe9d9e2f80ca99d3c076c96e8 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Mon, 16 Mar 2026 16:31:23 +0100
-Subject: [PATCH] build: Do not display full path in generated headers
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/61f40b65637695abe9d9e2f80ca99d3c076c96e8]
-
-Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
----
- libxfce4panel/meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
-index 38d8ad198..3fee75d58 100644
---- a/libxfce4panel/meson.build
-+++ b/libxfce4panel/meson.build
-@@ -67,7 +67,7 @@ libpanel_enums += gnome.mkenums(
-   install_dir: libpanel_install_dir,
-   sources: libpanel_headers,
-   fhead: '#if !defined(_LIBXFCE4PANEL_INSIDE_LIBXFCE4PANEL_H) && !defined(LIBXFCE4PANEL_COMPILATION)\n#error "Only <libxfce4panel/libxfce4panel.h> can be included directly, this file may disappear or change contents"\n#endif\n\n#ifndef __LIBXFCE4PANEL_ENUM_TYPES_H__\n#define __LIBXFCE4PANEL_ENUM_TYPES_H__\n#include <glib-object.h>\nG_BEGIN_DECLS\n',
--  fprod: '/* enumerations from "@filename@" */\n',
-+  fprod: '/* enumerations from "@basename@" */\n',
-   vhead: 'GType @enum_name@_get_type (void) G_GNUC_CONST;\n#define XFCE_TYPE_@ENUMSHORT@ (@enum_name@_get_type())\n',
-   ftail: 'G_END_DECLS\n\n#endif /* !__LIBXFCE4PANEL_ENUM_TYPES_H__ */',
- )
-@@ -76,7 +76,7 @@ libpanel_enums += gnome.mkenums(
-   install_header: false,
-   sources: libpanel_headers,
-   fhead: '#include "libxfce4panel-enums.h"\n#include "libxfce4panel-enum-types.h"\n\n#include "libxfce4panel-visibility.h"',
--  fprod: '\n/* enumerations from "@filename@" */',
-+  fprod: '\n/* enumerations from "@basename@" */',
-   vhead: 'GType\n@enum_name@_get_type (void)\n{\n\tstatic GType type = 0;\n\tif (type == 0) {\n\tstatic const G@Type@Value values[] = {',
-   vprod: '\t{ @VALUENAME@, "@VALUENAME@", "@valuenick@" },',
-   vtail: '\t{ 0, NULL, NULL }\n\t};\n\ttype = g_@type@_register_static ("@EnumName@", values);\n  }\n\treturn type;\n}\n',
---
-2.34.1
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch
deleted file mode 100644
index 493e468bc4..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jun 2026 00:00:00 +0000
-Subject: [PATCH] panel: tic-tac-toe: Remove wrong autoptr define guard
-
-panel-tic-tac-toe.h guarded its own
-G_DEFINE_AUTOPTR_CLEANUP_FUNC (XfceTitledDialog, g_object_unref) with
-"#ifndef glib_autoptr_clear_XfceTitledDialog". That macro is never
-defined: G_DEFINE_AUTOPTR_CLEANUP_FUNC emits static inline functions, not
-a glib_autoptr_clear_* macro, so the guard is always true.
-
-libxfce4ui (>= 4.21.8) now defines the XfceTitledDialog autoptr cleanup
-functions itself in xfce-titled-dialog.h. Because the guard never
-triggers, the panel header redefines the same static inline cleanup
-functions, which is a hard error with GCC 16 / recent clang:
-
-  error: redefinition of 'glib_autoptr_clear_XfceTitledDialog'
-
-Drop the redundant definition entirely; rely on libxfce4ui to provide it.
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/3ac941fc083fee5e56b0f3e509d6f6b461b48e39]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- panel/panel-tic-tac-toe.h | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/panel/panel-tic-tac-toe.h b/panel/panel-tic-tac-toe.h
-index 1111111..2222222 100644
---- a/panel/panel-tic-tac-toe.h
-+++ b/panel/panel-tic-tac-toe.h
-@@ -24,9 +24,6 @@ G_BEGIN_DECLS
- G_BEGIN_DECLS
-
- #define PANEL_TYPE_TIC_TAC_TOE (panel_tic_tac_toe_get_type ())
--#ifndef glib_autoptr_clear_XfceTitledDialog
--G_DEFINE_AUTOPTR_CLEANUP_FUNC (XfceTitledDialog, g_object_unref)
--#endif
- G_DECLARE_FINAL_TYPE (PanelTicTacToe, panel_tic_tac_toe, PANEL, TIC_TAC_TOE, XfceTitledDialog)
-
- void
--- 
-2.43.0
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
index 690deefc91..894580d576 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
@@ -22,24 +22,28 @@ Rebase for xfce4-panel 4.20.0.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
 
+Rebase for xfce4-panel 4.21.2 (field renamed from `icon` to `widget`).
+
+Signed-off-by: Jason Schonberg <schonm@gmail.com>
+
 ---
  plugins/windowmenu/windowmenu.c | 10 +++++-----
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/windowmenu.c
-index 9a73f29..eab0547 100644
+index 4e49277..29be92f 100644
 --- a/plugins/windowmenu/windowmenu.c
 +++ b/plugins/windowmenu/windowmenu.c
-@@ -266,7 +266,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+@@ -267,7 +267,7 @@
    g_signal_connect (G_OBJECT (plugin->button), "toggled",
                      G_CALLBACK (window_menu_plugin_menu), plugin);
  
--  plugin->icon = gtk_image_new_from_icon_name ("user-desktop", GTK_ICON_SIZE_BUTTON);
-+  plugin->icon = gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BUTTON);
-   gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
-   gtk_widget_show (plugin->icon);
+-  plugin->widget = gtk_image_new_from_icon_name ("user-desktop", GTK_ICON_SIZE_BUTTON);
++  plugin->widget = gtk_image_new_from_icon_name (NULL, GTK_ICON_SIZE_BUTTON);
+   gtk_container_add (GTK_CONTAINER (plugin->button), plugin->widget);
+   gtk_widget_show (plugin->widget);
  }
-@@ -706,19 +706,19 @@ window_menu_plugin_active_window_changed (XfwScreen *screen,
+@@ -772,19 +772,19 @@
            /* skip 'fake' windows */
            type = xfw_window_get_window_type (window);
            if (type == XFW_WINDOW_TYPE_DESKTOP || type == XFW_WINDOW_TYPE_DOCK)
@@ -55,11 +59,11 @@ index 9a73f29..eab0547 100644
  
            /* desktop is shown right now */
            icon_size = xfce_panel_plugin_get_icon_size (XFCE_PANEL_PLUGIN (plugin));
--          gtk_image_set_from_icon_name (GTK_IMAGE (icon), "user-desktop", icon_size);
-+          gtk_image_set_from_icon_name (GTK_IMAGE (icon), NULL, icon_size);
-           gtk_image_set_pixel_size (GTK_IMAGE (icon), icon_size);
--          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("Desktop"));
-+          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("No Windows"));
+-          gtk_image_set_from_icon_name (GTK_IMAGE (widget), "user-desktop", icon_size);
++          gtk_image_set_from_icon_name (GTK_IMAGE (widget), NULL, icon_size);
+           gtk_image_set_pixel_size (GTK_IMAGE (widget), icon_size);
+-          gtk_widget_set_tooltip_text (GTK_WIDGET (widget), _("Desktop"));
++          gtk_widget_set_tooltip_text (GTK_WIDGET (widget), _("No Windows"));
          }
      }
  }
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch
deleted file mode 100644
index ee1f48086a..0000000000
--- a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-build-Install-missing-libxfce4panel.h.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 151fec5f91fcb3dc5d55aee82a6d717dad77e877 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Ga=C3=ABl=20Bonithon?= <gael@xfce.org>
-Date: Sun, 22 Feb 2026 17:11:05 +0100
-Subject: [PATCH 2/2] build: Install missing libxfce4panel.h
-
-Fixes: c259dfbbb8e139b43af179acec9824ecf849d34d
-
-Upstream-Status: Backport [https://gitlab.xfce.org/xfce/xfce4-panel/-/commit/151fec5f91fcb3dc5d55aee82a6d717dad77e877]
-
-Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
----
- libxfce4panel/meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/libxfce4panel/meson.build b/libxfce4panel/meson.build
-index 150319388..38d8ad198 100644
---- a/libxfce4panel/meson.build
-+++ b/libxfce4panel/meson.build
-@@ -94,6 +94,8 @@ libxfce4panel_h = custom_target(
-   depend_files: [
-     libpanel_config_h,
-   ],
-+  install: true,
-+  install_dir: libpanel_install_dir,
- )
- libpanel_sources += libxfce4panel_h
- 
--- 
-2.43.0
-
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.2.bb
similarity index 83%
rename from meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
rename to meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.2.bb
index 1998a9f23e..6af2a78b9a 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.1.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.21.2.bb
@@ -14,12 +14,8 @@ inherit xfce gtk-doc gobject-introspection features_check mime-xdg
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
     file://0002-use-lxdm-to-replace-dm-tool.patch \
-    file://0001-build-Do-not-display-full-path-in-generated-headers.patch \
-    file://0001-build-Be-sure-to-generate-sub-headers-before-includi.patch \
-    file://0002-build-Install-missing-libxfce4panel.h.patch \
-    file://0001-panel-tic-tac-toe-Remove-wrong-autoptr-define-guard.patch \
 "
-SRC_URI[sha256sum] = "c940dae515bef4af08a126011d2fd873ce99e815157ba8cef5332195bb60e51e"
+SRC_URI[sha256sum] = "ba490351b7837fa345385c830d118a1c85f7400672f7f0525095c739e83d9a43"
 
 EXTRA_OEMESON += "-Dvala=disabled"
 
-- 
2.43.0


