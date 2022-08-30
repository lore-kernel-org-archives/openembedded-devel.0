Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C413EECAAD8
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 07:14:32 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web08.8718.1661843656593304005
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pqjuEDHE;
 spf=pass (domain: gmail.com, ip: 209.85.214.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id x23so10250603pll.7
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Aug 2022 00:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5SyVCajcnz/viJe/a55fAXh0IRWv2nMTXJ2i/TLYhg4=;
        b=pqjuEDHEZ/PT3riNa6d53iP13PsY98fpYoi4LoNG9hmHg2MSWmJeghR8U33TdLYUG5
         0t9DSqkAl/r7OHmxlgp+ocg5K6aKq3YMke8fdcvQkhoFYiSMmH6PEHERP6cVOJLZZLUT
         rQM/A66KCjTdtVuUDccY1hO1ruyOvte+4d+6Lb5e84+StL3nDr8w0YpsADsxdeg/QSvm
         tG5kLCNUh0YQbKI+wp0GlKLEdtKQtezYGwrjwVyp+dr2gYWxBTN9aGJasHKRG6C32oNG
         81JJmruDBluCkZ+TQPbCIT3VUrEw/9LFWuYsXrTrjY+7WrQTVfiqlp3fiQ4BxaPasaxl
         D3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5SyVCajcnz/viJe/a55fAXh0IRWv2nMTXJ2i/TLYhg4=;
        b=nm/wCaTi7f8D+HLQjoyPsN1RYVQq+qMc+Er6T4CDb0W3GxLsBJ9aSi7hQ2zaN498Ce
         zFEYsMsTJPPcz2m8ktLXwm04ve02BaxNqDu/4dnwMFwQprV+YkrMFtAaJjNAxZRm1jFX
         MSxAOnzGZSeZTEDr9hbKOxSRH4Q3fpyTYwTCKvm/J7zrsMl5EHwA2NmIn8UE+0PLyCXS
         DFbsQMld9HWEcGXOWkKcvGPPrcg+CUYT1E7L3gV9jcRnEnI/tzquARuraia4aENwC04p
         /DG6/TX3n93hFzyS5WyL8/v8//2l12Mqt3fqyHnlrvjbsSlASuHkpH5H+HHhjC35MQ40
         nC5Q==
X-Gm-Message-State: ACgBeo2ML93oG6nDY3KHucBMWd3DkluxKB0YYqaqxt/1nDx7a4jZmbQC
	fwEUFJhki5ifRrGF51uUwZ2zj96+ugrTyA==
X-Google-Smtp-Source: 
 AA6agR7PPxt+ONyIBgn9DuPcNVT77+SCI6UEEV7UU4JWY8NRzL0bYzbL7zX5cnR0GgDmt4WGFfde8w==
X-Received: by 2002:a17:902:ec88:b0:175:d8f:44b with SMTP id
 x8-20020a170902ec8800b001750d8f044bmr3275235plg.84.1661843655566;
        Tue, 30 Aug 2022 00:14:15 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::24e6])
        by smtp.gmail.com with ESMTPSA id
 z24-20020aa79f98000000b00537f9e32b00sm6041616pfr.37.2022.08.30.00.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 00:14:15 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 01/21] gtk+: Fix function signature of create_menu()
Date: Tue, 30 Aug 2022 00:13:53 -0700
Message-Id: <20220830071413.3887189-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Aug 2022 07:14:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98538

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ix-signature-of-create_menu-function.patch | 50 +++++++++++++++++++
 meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb    |  1 +
 2 files changed, 51 insertions(+)
 create mode 100644 meta-oe/recipes-gnome/gtk+/gtk+/0001-Fix-signature-of-create_menu-function.patch

diff --git a/meta-oe/recipes-gnome/gtk+/gtk+/0001-Fix-signature-of-create_menu-function.patch b/meta-oe/recipes-gnome/gtk+/gtk+/0001-Fix-signature-of-create_menu-function.patch
new file mode 100644
index 0000000000..6b5f928391
--- /dev/null
+++ b/meta-oe/recipes-gnome/gtk+/gtk+/0001-Fix-signature-of-create_menu-function.patch
@@ -0,0 +1,50 @@
+From a703e2406fda3dc150574ae2f90cb5f4810d0601 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 29 Aug 2022 00:25:19 -0700
+Subject: [PATCH] Fix signature of create_menu() function
+
+Upstream-Status: Inappropriate [EOL]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ tests/testmenubars.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/tests/testmenubars.c b/tests/testmenubars.c
+index 416a939..7f247f8 100644
+--- a/tests/testmenubars.c
++++ b/tests/testmenubars.c
+@@ -21,7 +21,7 @@
+ #include <gtk/gtk.h>
+ 
+ static GtkWidget *
+-create_menu (depth)
++create_menu (int depth)
+ {
+     GtkWidget *menu;
+     GtkWidget *menuitem;
+@@ -70,19 +70,19 @@ create_menubar (GtkPackDirection pack_dir,
+   menuitem = gtk_image_menu_item_new_from_stock (GTK_STOCK_HOME, NULL);
+   gtk_menu_shell_append (GTK_MENU_SHELL (menubar), menuitem);
+   gtk_label_set_angle (GTK_LABEL (GTK_BIN (menuitem)->child), angle);
+-  menu = create_menu (2, TRUE);
++  menu = create_menu (2);
+   gtk_menu_item_set_submenu (GTK_MENU_ITEM (menuitem), menu);
+ 
+   menuitem = gtk_menu_item_new_with_label ("foo");
+   gtk_menu_shell_append (GTK_MENU_SHELL (menubar), menuitem);
+   gtk_label_set_angle (GTK_LABEL (GTK_BIN (menuitem)->child), angle);
+-  menu = create_menu (2, TRUE);
++  menu = create_menu (2);
+   gtk_menu_item_set_submenu (GTK_MENU_ITEM (menuitem), menu);
+ 
+   menuitem = gtk_menu_item_new_with_label ("bar");
+   gtk_menu_shell_append (GTK_MENU_SHELL (menubar), menuitem);
+   gtk_label_set_angle (GTK_LABEL (GTK_BIN (menuitem)->child), angle);
+-  menu = create_menu (2, TRUE);
++  menu = create_menu (2);
+   gtk_menu_item_set_submenu (GTK_MENU_ITEM (menuitem), menu);
+ 
+   return menubar;
+-- 
+2.37.2
+
diff --git a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
index 082967e04c..5eac641cf3 100644
--- a/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
+++ b/meta-oe/recipes-gnome/gtk+/gtk+_2.24.33.bb
@@ -10,6 +10,7 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://doc-fixes.patch \
            file://strict-prototypes.patch \
            file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
+           file://0001-Fix-signature-of-create_menu-function.patch \
            "
 
 SRC_URI[sha256sum] = "ac2ac757f5942d318a311a54b0c80b5ef295f299c2a73c632f6bfb1ff49cc6da"
-- 
2.37.2


