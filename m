Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81791C76195
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 22:56:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.11152.1679698564119361705
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Mar 2023 15:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dBuizxia;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id l7so2741121pjg.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 15:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679698563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v9TnxgEouYKad6vOWojmb0K45L7+8s3SkRPShANwYuk=;
        b=dBuizxiaZ3A9s9aqrIHVSO4pVx+sfn+wp2dTJMEnxOFrhH/us5Lmc2G4WnUVWKqfHb
         1B3YvHXffajldIMxNh1vMwQ0D2RMqboJNOvbQHhrf2bp/yyaL2QYEp8NahwBjDLuoACW
         dZRHet724Coks8pIfZrrjzs3/olzeV7R78yXZX0xrEq6CmBDV26c1Ths6GS/KxF9Rvvp
         ZHK/QqWmtjEAU8OUOP06XC18LavWS+5bUhMDXp2baY2rvuZVPv0BTwT85lsspXf6DfBD
         ccvDrChXkkTKoEyCaJhXZDAf3n4zVhV/PwVpvfrCO2A//W+8txybpTCM9Ap+O5OTFQ21
         GO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679698563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9TnxgEouYKad6vOWojmb0K45L7+8s3SkRPShANwYuk=;
        b=s4WPRTKvbsR19yLPUNCae95Z47ahqKZBoxMI5UhZIfQSjGvaANbaROqrxTN6Hr0bXd
         3xi3h+thYeRm39cDg6Uf4Cr7UFtev8mx3uvtSOmqU5MR09HG3tXxFE7JrOrK42KYZ/R6
         MYawy6xBXd8FFX21fcE+MrhDtrOD33MPdI3geieR0EmSZPFrIuG5nbpOkQuqpAnmP45r
         a/VDwA39Km9XMONv9TqoBlhlf0++5Scr33NhDRlB33baP9CzW3lPWT3DpPGpF+ew1JCU
         GvGj3146nI45GB13T5O2xztiE1vW04X+2O1M0qWi4sk/oZROEYgEhFzMBdOtLhEPPes6
         7nJw==
X-Gm-Message-State: AAQBX9cf7KnpFDxfhH24D5YYjek9mUSjVFSwWrLdz3auQkbPNSKp5hh5
	ciN+briIawc94XEq8bmqlA2foH4eBP6TxQ==
X-Google-Smtp-Source: AKy350aWOz4Y4S2Vv7ILKTx6eRvqv1yis60J+7ziaqxcQU4HR0kZ3B8/PsWIZucWJviyQpe6BZg8Ig==
X-Received: by 2002:a17:90b:1bcc:b0:237:a174:ce54 with SMTP id oa12-20020a17090b1bcc00b00237a174ce54mr4376503pjb.21.1679698563072;
        Fri, 24 Mar 2023 15:56:03 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:d380::bed3])
        by smtp.gmail.com with ESMTPSA id g2-20020a170902c38200b001960706141fsm14665014plg.149.2023.03.24.15.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 15:56:02 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCH] nautilus: Fix build with clang and drop unused patch
Date: Fri, 24 Mar 2023 15:56:00 -0700
Message-Id: <20230324225600.3891997-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 24 Mar 2023 22:56:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101710

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-prototype-for-functions-without-pa.patch | 94 -------------------
 ...initialize-GdkDragAction-action-to-0.patch | 47 ++++++++++
 .../recipes-gnome/nautilus/nautilus_44.0.bb   |  1 +
 3 files changed, 48 insertions(+), 94 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch
deleted file mode 100644
index 6c743d8ce7..0000000000
--- a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch
+++ /dev/null
@@ -1,94 +0,0 @@
-From 76f1625bae95212ec6d4bc1bd1c8ff1232150c48 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 29 Aug 2022 13:14:09 -0700
-Subject: [PATCH] Provide parameter prototype for functions without parameter
-
-Fixes build with clang-15 with -Wstrict-prototypes
-
-src/nautilus-toolbar.c:1205:22: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
-nautilus_toolbar_new ()
-                     ^
-                      void
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/nautilus/-/commit/95d35aedf68f0398a6ee9e0b0af9ce80528fdc22]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/nautilus-file-undo-manager.c | 4 ++--
- src/nautilus-list-model.c        | 2 +-
- src/nautilus-starred-directory.c | 2 +-
- src/nautilus-toolbar.c           | 2 +-
- src/nautilus-view-model.c        | 2 +-
- 5 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/src/nautilus-file-undo-manager.c b/src/nautilus-file-undo-manager.c
-index 2a886176f..f2d1eebcf 100644
---- a/src/nautilus-file-undo-manager.c
-+++ b/src/nautilus-file-undo-manager.c
-@@ -258,13 +258,13 @@ nautilus_file_undo_manager_get_state (void)
- 
- 
- gboolean
--nautilus_file_undo_manager_is_operating ()
-+nautilus_file_undo_manager_is_operating (void)
- {
-     return undo_singleton->is_operating;
- }
- 
- NautilusFileUndoManager *
--nautilus_file_undo_manager_get ()
-+nautilus_file_undo_manager_get (void)
- {
-     return undo_singleton;
- }
-diff --git a/src/nautilus-list-model.c b/src/nautilus-list-model.c
-index 7e2aeeeee..741007105 100644
---- a/src/nautilus-list-model.c
-+++ b/src/nautilus-list-model.c
-@@ -1625,7 +1625,7 @@ nautilus_list_model_get_drag_view (NautilusListModel *model,
- }
- 
- GtkTargetList *
--nautilus_list_model_get_drag_target_list ()
-+nautilus_list_model_get_drag_target_list (void)
- {
-     GtkTargetList *target_list;
- 
-diff --git a/src/nautilus-starred-directory.c b/src/nautilus-starred-directory.c
-index fd41418a4..07ed62693 100644
---- a/src/nautilus-starred-directory.c
-+++ b/src/nautilus-starred-directory.c
-@@ -556,7 +556,7 @@ nautilus_starred_directory_class_init (NautilusFavoriteDirectoryClass *klass)
- }
- 
- NautilusFavoriteDirectory *
--nautilus_starred_directory_new ()
-+nautilus_starred_directory_new (void)
- {
-     NautilusFavoriteDirectory *self;
- 
-diff --git a/src/nautilus-toolbar.c b/src/nautilus-toolbar.c
-index 5fe4e63a4..15a696827 100644
---- a/src/nautilus-toolbar.c
-+++ b/src/nautilus-toolbar.c
-@@ -1202,7 +1202,7 @@ nautilus_toolbar_class_init (NautilusToolbarClass *klass)
- }
- 
- GtkWidget *
--nautilus_toolbar_new ()
-+nautilus_toolbar_new (void)
- {
-     return g_object_new (NAUTILUS_TYPE_TOOLBAR,
-                          NULL);
-diff --git a/src/nautilus-view-model.c b/src/nautilus-view-model.c
-index 84c40302d..2935809ae 100644
---- a/src/nautilus-view-model.c
-+++ b/src/nautilus-view-model.c
-@@ -190,7 +190,7 @@ compare_data_func (gconstpointer a,
- }
- 
- NautilusViewModel *
--nautilus_view_model_new ()
-+nautilus_view_model_new (void)
- {
-     return g_object_new (NAUTILUS_TYPE_VIEW_MODEL, NULL);
- }
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
new file mode 100644
index 0000000000..abe584874c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-initialize-GdkDragAction-action-to-0.patch
@@ -0,0 +1,47 @@
+From d8f8859369b228d86aeeb043d732b9c60fdce289 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 24 Mar 2023 15:29:04 -0700
+Subject: [PATCH] initialize GdkDragAction action to 0
+
+This helps in silencing clang found warning
+
+autilus-pathbar.c:759:9: error: variable 'action' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
+    if (G_VALUE_HOLDS (value, GDK_TYPE_FILE_LIST))
+        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/nautilus/-/merge_requests/1158]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nautilus-pathbar.c | 2 +-
+ src/nautilus-window.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/nautilus-pathbar.c b/src/nautilus-pathbar.c
+index 1b6ea6a..a5ab780 100644
+--- a/src/nautilus-pathbar.c
++++ b/src/nautilus-pathbar.c
+@@ -746,7 +746,7 @@ on_drag_motion (GtkDropTarget *target,
+                 gpointer       user_data)
+ {
+     ButtonData *button_data = user_data;
+-    GdkDragAction action;
++    GdkDragAction action = 0;
+     const GValue *value;
+     graphene_point_t start;
+ 
+diff --git a/src/nautilus-window.c b/src/nautilus-window.c
+index 30299b1..74c548f 100644
+--- a/src/nautilus-window.c
++++ b/src/nautilus-window.c
+@@ -1476,7 +1476,7 @@ extra_drag_value_cb (AdwTabBar    *self,
+ {
+     NautilusWindowSlot *slot = NAUTILUS_WINDOW_SLOT (adw_tab_page_get_child (page));
+     g_autoptr (NautilusFile) file = nautilus_file_get (nautilus_window_slot_get_location (slot));
+-    GdkDragAction action;
++    GdkDragAction action = 0;
+ 
+     if (value == NULL)
+     {
+-- 
+2.40.0
+
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
index 8fe58a77d8..0ec2ae06a7 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_44.0.bb
@@ -26,6 +26,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+SRC_URIS += "file://0001-initialize-GdkDragAction-action-to-0.patch"
 SRC_URI[archive.sha256sum] = "57b99ebb8e2b9c1512d381e53096188c087b33410d6c52d87a27bd60ee76ac7f"
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
-- 
2.40.0


