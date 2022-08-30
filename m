Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA2E9C64991
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web12.8930.1661843663057816727
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KfCAyPrd;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id y141so10493118pfb.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=12unwtpObbrX3K2L3Pw9clfIe8xLzA+fOGp8jF417AU=;
        b=KfCAyPrd/pL3ip5XwQEVqaVEEAig8xOSJhlHa1JX4+7Kyxwd2IK9nEzUmi2hJUti9S
         30dzGCe+dS/21n/9uHEWwD+OQoJincXQ0jfmfd2Ds9zZy86tZ7TPSL1hNwomSJQ3TLmI
         ktbVke7QdYdDTPaNpfS39Rf41XTiYy/vEUDTSiLxhHfWHPrBhz8128d5GxQ/+a93O5vr
         qQx8qynyALGqzI3y/bym2F9eD7nlizK4zYDm0H2Q3tSc7BmppPCzHt0sg2BBrjz22rdM
         umyOlN22G0Yydxz7+lJHsHANwv70so0sbeMXKNu6OWjgBxx5+wrMqZrKjAT5HNmh23EZ
         jk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=12unwtpObbrX3K2L3Pw9clfIe8xLzA+fOGp8jF417AU=;
        b=0npMAkcOdyQahL/zdvT/OwS/Y8VD/aeBcua0L/BBG/AIJhhzHcnIuslv0nvYUZJPzo
         Xxh9eu0j6sas+fV8bN3UuNzkIUvKTVRq5e6WFZfvpq3WsSD/yoZZEm+WVH1HQQ675KS/
         HJS1j/Qbiwsp1rkwJbgdDQEsxL5PJjrTKTH13FKEKamV/RgATksfnvzwrgKE+mn6f8Nw
         M5UEv7u1ZUzGsDFOccK2vfOycJaynhZKdVZ8fjuwXh3lrbfGBe0RPfKSV85Iyeh3WZ7f
         ja5ifFmwlGKxSQkE+F8wLn2PLRKBS6wlzXcm+whtRmr12T5/NvGZ2JmgnmrlYzA2XAnS
         Xk1w==
X-Gm-Message-State: ACgBeo3zVbKHlqsYVSYDczZmdzCxhvAu2j/4X0iW0NvIXU/7/oByPJlQ
	Iz8eqRL7OohFqSmELbL96ngM9NFhDKetKA==
X-Google-Smtp-Source: 
 AA6agR5liehpyAg7VPcBWd6pLW5e7brVbhKYCpXKluOUaPiMYek4MLfkPTOkT/3aD+/1WRoWOYuyNA==
X-Received: by 2002:a65:6d0f:0:b0:42b:42f8:efe0 with SMTP id
 bf15-20020a656d0f000000b0042b42f8efe0mr17469739pgb.197.1661843662197;
        Tue, 30 Aug 2022 00:14:22 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 08/21] nautilus: Backport a patch to fix
 build with clang-15
Date: Tue, 30 Aug 2022 00:14:00 -0700
Message-Id: <20220830071413.3887189-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220830071413.3887189-1-raj.khem@gmail.com>
References: <20220830071413.3887189-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98545

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...r-prototype-for-functions-without-pa.patch | 94 +++++++++++++++++++
 .../recipes-gnome/nautilus/nautilus_42.2.bb   |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch

diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch
new file mode 100644
index 0000000000..6c743d8ce7
--- /dev/null
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus/0001-Provide-parameter-prototype-for-functions-without-pa.patch
@@ -0,0 +1,94 @@
+From 76f1625bae95212ec6d4bc1bd1c8ff1232150c48 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 13:14:09 -0700
+Subject: [PATCH] Provide parameter prototype for functions without parameter
+
+Fixes build with clang-15 with -Wstrict-prototypes
+
+src/nautilus-toolbar.c:1205:22: error: a function declaration without a prototype is deprecated in all versions of C [-Werror,-Wstrict-prototypes]
+nautilus_toolbar_new ()
+                     ^
+                      void
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/nautilus/-/commit/95d35aedf68f0398a6ee9e0b0af9ce80528fdc22]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/nautilus-file-undo-manager.c | 4 ++--
+ src/nautilus-list-model.c        | 2 +-
+ src/nautilus-starred-directory.c | 2 +-
+ src/nautilus-toolbar.c           | 2 +-
+ src/nautilus-view-model.c        | 2 +-
+ 5 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/nautilus-file-undo-manager.c b/src/nautilus-file-undo-manager.c
+index 2a886176f..f2d1eebcf 100644
+--- a/src/nautilus-file-undo-manager.c
++++ b/src/nautilus-file-undo-manager.c
+@@ -258,13 +258,13 @@ nautilus_file_undo_manager_get_state (void)
+ 
+ 
+ gboolean
+-nautilus_file_undo_manager_is_operating ()
++nautilus_file_undo_manager_is_operating (void)
+ {
+     return undo_singleton->is_operating;
+ }
+ 
+ NautilusFileUndoManager *
+-nautilus_file_undo_manager_get ()
++nautilus_file_undo_manager_get (void)
+ {
+     return undo_singleton;
+ }
+diff --git a/src/nautilus-list-model.c b/src/nautilus-list-model.c
+index 7e2aeeeee..741007105 100644
+--- a/src/nautilus-list-model.c
++++ b/src/nautilus-list-model.c
+@@ -1625,7 +1625,7 @@ nautilus_list_model_get_drag_view (NautilusListModel *model,
+ }
+ 
+ GtkTargetList *
+-nautilus_list_model_get_drag_target_list ()
++nautilus_list_model_get_drag_target_list (void)
+ {
+     GtkTargetList *target_list;
+ 
+diff --git a/src/nautilus-starred-directory.c b/src/nautilus-starred-directory.c
+index fd41418a4..07ed62693 100644
+--- a/src/nautilus-starred-directory.c
++++ b/src/nautilus-starred-directory.c
+@@ -556,7 +556,7 @@ nautilus_starred_directory_class_init (NautilusFavoriteDirectoryClass *klass)
+ }
+ 
+ NautilusFavoriteDirectory *
+-nautilus_starred_directory_new ()
++nautilus_starred_directory_new (void)
+ {
+     NautilusFavoriteDirectory *self;
+ 
+diff --git a/src/nautilus-toolbar.c b/src/nautilus-toolbar.c
+index 5fe4e63a4..15a696827 100644
+--- a/src/nautilus-toolbar.c
++++ b/src/nautilus-toolbar.c
+@@ -1202,7 +1202,7 @@ nautilus_toolbar_class_init (NautilusToolbarClass *klass)
+ }
+ 
+ GtkWidget *
+-nautilus_toolbar_new ()
++nautilus_toolbar_new (void)
+ {
+     return g_object_new (NAUTILUS_TYPE_TOOLBAR,
+                          NULL);
+diff --git a/src/nautilus-view-model.c b/src/nautilus-view-model.c
+index 84c40302d..2935809ae 100644
+--- a/src/nautilus-view-model.c
++++ b/src/nautilus-view-model.c
+@@ -190,7 +190,7 @@ compare_data_func (gconstpointer a,
+ }
+ 
+ NautilusViewModel *
+-nautilus_view_model_new ()
++nautilus_view_model_new (void)
+ {
+     return g_object_new (NAUTILUS_TYPE_VIEW_MODEL, NULL);
+ }
diff --git a/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb b/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
index f9c2ed020b..a0f928ce25 100644
--- a/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
+++ b/meta-gnome/recipes-gnome/nautilus/nautilus_42.2.bb
@@ -21,6 +21,7 @@ inherit gnomebase gsettings gobject-introspection gtk-doc gettext features_check
 def gnome_verdir(v):
     return oe.utils.trim_version(v, 1)
 
+SRC_URI += " file://0001-Provide-parameter-prototype-for-functions-without-pa.patch"
 SRC_URI[archive.sha256sum] = "99212d2eb75996f181728ad04a2e2d86f2577b064e68a34c8b81a7037df4ccb2"
 
 REQUIRED_DISTRO_FEATURES = "x11"
-- 
2.37.2


