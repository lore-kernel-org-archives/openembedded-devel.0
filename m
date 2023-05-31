Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A497C7EE32
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 11:13:43 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.11455.1685531620343180383
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 04:13:40 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=Ts8hgAOE;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ba818eb96dcso4386314276.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685531619; x=1688123619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CltrQRpMB0rOKpdrS+2ahoXkrc4ZURY6MyC1tDus7gg=;
        b=Ts8hgAOEtsQrk8QTTopPvQcDAAMB9lopPqPNlIo+O1f5TQKJfwl1skV7BasvtNfKBC
         9Umn0LhfB/qZRsw0eiH1Sesb8WnjOMXw3mtkoHAxMdoB4HEV2xJJ+wvfv8OZ5mvSijvN
         0HZ1Am6vFKX0rGYsmRxMFQR7mvAM0CgNhAXLrF/RCBknJE0FUGTAUd8wlrn6LfSPPUg6
         a9k+vB3TRbGPwn40On3UPdazwZHZ4syIs59hRXiYodEPnKzrU7lZLLB3qHyH2g8s7lfO
         pn+QXXtGk19gFK/KJdQDP0xBxAmqd1g/sJVE8MW/2b1lWZx+V6k7bLAfffdgDZul+CI9
         udcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685531619; x=1688123619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CltrQRpMB0rOKpdrS+2ahoXkrc4ZURY6MyC1tDus7gg=;
        b=ctarm4zmx+X2aDzk9yx88TW96LVEE2Q+JDuzB0y+7IhgeHugKgQmz9a0jOnWgDiria
         Fb/lrPhRC/3T9pQFkneCw63AccAygXUE2tCwHeYUVJzKvuCcf/Hwx05yDbVMx7fPkNyh
         d1WUc0H56m7LCmhpKX1ytsQE/qJslwtK7/ilufHbJJYZHz5KMAZU0iXivaS3BguxWlPQ
         2eYN85+swiGeG+8GydkPmacuJsypVN0e7DNNtnp0zwcD1KBwjTHzgVs7VDrTO6EpDZK2
         bdDP39cNpR+PkXNMPKrR4fNBQujQrBC3a+YI31CgDFGVnBtyt/5hf+dqDXyjBBccLhF8
         eaiw==
X-Gm-Message-State: AC+VfDwptUHJY0+ENWOvG1mBdMUtDL19lllZq3YYgtgNUnE2jFJXuf0h
	b2eIXKfrUkvz3wVCxj3t9qF4DMsXxr8=
X-Google-Smtp-Source: ACHHUZ7nND9ejh9ppWUG+hvfdcwoboAH+UjBvG046giPKEGk67m8sjOtWJ7nj91R1AJbvIr3jAObBg==
X-Received: by 2002:a0d:ca8b:0:b0:568:9785:3f05 with SMTP id m133-20020a0dca8b000000b0056897853f05mr4594205ywd.31.1685531619241;
        Wed, 31 May 2023 04:13:39 -0700 (PDT)
Received: from keaua.attlocal.net ([2600:1700:9190:ba10:a3c5:f403:52db:88cf])
        by smtp.gmail.com with ESMTPSA id t129-20020a814687000000b00545a08184fdsm5246897ywa.141.2023.05.31.04.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 May 2023 04:13:38 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][mickledore][PATCH 28/36] nautilus: upgrade 44.0 -> 44.1
Date: Wed, 31 May 2023 07:13:01 -0400
Message-Id: <20230531111309.2454603-28-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230531111309.2454603-1-akuster808@gmail.com>
References: <20230531111309.2454603-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 11:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103057

From: Wang Mingyu <wangmy@fujitsu.com>

0001-initialize-GdkDragAction-action-to-0.patch
removed since it's included in 44.1

Changelog:
==========
* Resolve some crashes
* Visual bugfixes:
  - Tweak style colors in view items
  - Show custom emblems from extensions again
  - Relayout SELinux property row
  - Flip switches correctly
* Other bugfixes:
  - Disable some actions when not useful
  - Fix dead characters handling in batch rename dialog
  - Fix crashes when rapidly opening and closing windows
  - Prevent location change when autofs timeouts
  - Fix issues with translations in libadwaita widgets
  - Drop workarounds for fixed GTK bugs
  - Fix other issues
* Enhancements:
  - Dismiss toast on undo
  - Select right items after some operations
  - Paste into expanded folders
  - Allow extraction of .tar.zst and .zstd archives
  - Performance optimization
* Translation updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0398ebda1188038e95196bd84673ea63a3b89f70)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...initialize-GdkDragAction-action-to-0.patch | 47 -------------------
 .../{nautilus_44.0.bb => nautilus_44.1.bb}    |  3 +-
 2 files changed, 1 insertion(+), 49 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
 rename meta-gnome/recipes-gnome/nautilus/{nautilus_44.0.bb => nautilus_44.1.bb} (88%)

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
deleted file mode 100644
index abe584874c..0000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From d8f8859369b228d86aeeb043d732b9c60fdce289 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 24 Mar 2023 15:29:04 -0700
-Subject: [PATCH] initialize GdkDragAction action to 0
-
-This helps in silencing clang found warning
-
-autilus-pathbar.c:759:9: error: variable 'action' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
-    if (G_VALUE_HOLDS (value, GDK_TYPE_FILE_LIST))
-        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/1158]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nautilus-pathbar.c | 2 +-
- src/nautilus-window.c  | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/nautilus-pathbar.c b/src/nautilus-pathbar.c
-index 1b6ea6a..a5ab780 100644
---- a/src/nautilus-pathbar.c
-+++ b/src/nautilus-pathbar.c
-@@ -746,7 +746,7 @@ on_drag_motion (GtkDropTarget *target,
-                 gpointer       user_data)
- {
-     ButtonData *button_data = user_data;
--    GdkDragAction action;
-+    GdkDragAction action = 0;
-     const GValue *value;
-     graphene_point_t start;
- 
-diff --git a/src/nautilus-window.c b/src/nautilus-window.c
-index 30299b1..74c548f 100644
---- a/src/nautilus-window.c
-+++ b/src/nautilus-window.c
-@@ -1476,7 +1476,7 @@ extra_drag_value_cb (AdwTabBar    *self,
- {
-     NautilusWindowSlot *slot = NAUTILUS_WINDOW_SLOT (adw_tab_page_get_child (page));
-     g_autoptr (NautilusFile) file = nautilus_file_get (nautilus_window_slot_get_location (slot));
--    GdkDragAction action;
-+    GdkDragAction action = 0;
- 
-     if (value == NULL)
-     {
--- 
-2.40.0
-
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
similarity index 88%
rename from meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
rename to meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
index e066556177..9c60d15d86 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.1.bb
@@ -26,8 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
-SRC_URI += "file://0001-initialize-GdkDragAction-action-to-0.patch"
-SRC_URI[archive.sha256sum] = "57b99ebb8e2b9c1512d381e53096188c087b33410d6c52d87a27bd60ee76ac7f"
+SRC_URI[archive.sha256sum] = "360802a595e3edbad962c8cea353b62baa8be407513b5162c89c933ca5387aa9"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-- 
2.25.1


