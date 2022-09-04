Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFC03C6FA90
	for <webhook@archiver.kernel.org>; Sun,  4 Sep 2022 07:35:04 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.web10.11316.1662276896476478517
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IHi3te/B;
 spf=pass (domain: gmail.com, ip: 209.85.214.180,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id u22so5728781plq.12
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Sep 2022 00:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=AK7XA8KIYV+a9G/nrhI+lgO7Hr4O+eW3yETZ4pdSMno=;
        b=IHi3te/B4QrRleWYzJmURCzE2IjvgaG8mIByxjxjQuFk/7bZDIbObJiHhJwDCS2Dg1
         l5z6fLdWOcJUK7pYoHiB8yTKYmh52wnQtzN9jSIJQRNuDH8ESv3ME29LKsqylxCWuJcQ
         RdCFNhO30h5GEPEwDpiH5LiPEZ20rwj3pzidAkZBZnDpdXGdPwdvqK5rxYSoEygGJAaQ
         jf+v3GNNvwXosWFvcHfF2tH+KuGTl9XEWhvzvdq3OXuodvjxO40FdmFEyyDXU2PENnaM
         Wdb7qWd31kEHB4vPOt2Ee6BrABfp8PXXigdHSwO11wD3EKpUoip2U904nSieBzylgCLx
         KgLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=AK7XA8KIYV+a9G/nrhI+lgO7Hr4O+eW3yETZ4pdSMno=;
        b=wbQ45Lv7rr2xYpTIn42SQFgvqwRLaZkueSB4izdt6VokQ5DEaz1X2ePkN+Wuu5TYBv
         1DtF9OP4pmTPvRsCQfRO3lV4FMxkwhGjY3/ZASVIfUNJMMnKSwFIz7U0t5DGVaFC5WOo
         ZdIg6AvB3T4YA8c6ua6HTaGzTkBjFZvW21Eaipp3sGTpm7XG9Fzgt+UuR6Pdi3sdX1tJ
         wiSJErmDPNSk0Gip6S/Kgewl+j7SjrlY2UYA1fbgzCaRitvqZN3UIDUOjiAjM67mxRRA
         SNBKBNhLA48IeDu1c/69LaXsuNieVk5HG3tneLZh67J8a9F8pT7DgfT5SVFHji8MdOnv
         e8mQ==
X-Gm-Message-State: ACgBeo2ajchPaZIEVpqXaO9BaKaTSGYqxS07ltYtIU5p4zv6bIEuUl6K
	2xyoCUSliOag3VJ55mifml7NTNbtNQnhyQ==
X-Google-Smtp-Source: 
 AA6agR7c3F7Q2l3v9u6g02WxPMu+Pa2LyVqM5/zCATCk/FcHf9AFT/O/ciO53OGpj62qvV5Wcbv+iQ==
X-Received: by 2002:a17:903:22c4:b0:175:41bc:9596 with SMTP id
 y4-20020a17090322c400b0017541bc9596mr21107999plg.112.1662276895643;
        Sun, 04 Sep 2022 00:34:55 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::48c3])
        by smtp.gmail.com with ESMTPSA id
 w11-20020a62820b000000b00537a38ec2c6sm5089800pfd.164.2022.09.04.00.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Sep 2022 00:34:55 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 34/63] obconf: Add fixes for missing function
 prototypes
Date: Sun,  4 Sep 2022 00:33:48 -0700
Message-Id: <20220904073417.3251865-34-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220904073417.3251865-1-raj.khem@gmail.com>
References: <20220904073417.3251865-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Sep 2022 07:35:04 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98628

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Fix-function-protype-visibility.patch | 94 +++++++++++++++++++
 .../recipes-graphics/openbox/obconf_git.bb    |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openbox/files/0001-Fix-function-protype-visibility.patch

diff --git a/meta-oe/recipes-graphics/openbox/files/0001-Fix-function-protype-visibility.patch b/meta-oe/recipes-graphics/openbox/files/0001-Fix-function-protype-visibility.patch
new file mode 100644
index 0000000000..344c5d149b
--- /dev/null
+++ b/meta-oe/recipes-graphics/openbox/files/0001-Fix-function-protype-visibility.patch
@@ -0,0 +1,94 @@
+From 941d5ff3426e68cb9bcb4ae86066124cb2535b69 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 2 Sep 2022 12:32:20 -0700
+Subject: [PATCH] Fix function protype visibility
+
+Include ctye.h for toupper
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/appearance.c | 1 +
+ src/desktops.c   | 2 +-
+ src/desktops.h   | 2 +-
+ src/main.c       | 1 +
+ src/moveresize.c | 2 +-
+ src/moveresize.h | 2 +-
+ 6 files changed, 6 insertions(+), 4 deletions(-)
+
+diff --git a/src/appearance.c b/src/appearance.c
+index 4fb3f0c..ee55661 100644
+--- a/src/appearance.c
++++ b/src/appearance.c
+@@ -20,6 +20,7 @@
+ #include "main.h"
+ #include "tree.h"
+ #include "preview_update.h"
++#include <ctype.h> /* for toupper */
+ 
+ static gboolean mapping = FALSE;
+ 
+diff --git a/src/desktops.c b/src/desktops.c
+index 8297f00..27ca514 100644
+--- a/src/desktops.c
++++ b/src/desktops.c
+@@ -38,7 +38,7 @@ static void on_desktop_names_cell_edited(GtkCellRendererText *cell,
+                                          gpointer data);
+ static void enable_stuff();
+ 
+-void desktops_setup_tab()
++void desktops_setup_tab(void)
+ {
+     GtkWidget *w;
+     GtkCellRenderer *render;
+diff --git a/src/desktops.h b/src/desktops.h
+index 1ba3e36..446bfbb 100644
+--- a/src/desktops.h
++++ b/src/desktops.h
+@@ -24,5 +24,5 @@
+ 
+ void desktops_setup_num(GtkWidget *w);
+ void desktops_setup_names(GtkWidget *w);
+-
++void desktops_setup_tab(void);
+ #endif
+diff --git a/src/main.c b/src/main.c
+index d7e3446..0176035 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -28,6 +28,7 @@
+ #include "dock.h"
+ #include "preview_update.h"
+ #include "gettext.h"
++#include "moveresize.h"
+ 
+ #include <gdk/gdkx.h>
+ #define SN_API_NOT_YET_FROZEN
+diff --git a/src/moveresize.c b/src/moveresize.c
+index c6fb3dd..bb52729 100644
+--- a/src/moveresize.c
++++ b/src/moveresize.c
+@@ -37,7 +37,7 @@ static gboolean mapping = FALSE;
+ static void enable_stuff();
+ static void write_fixed_position(const gchar *coord);
+ 
+-void moveresize_setup_tab()
++void moveresize_setup_tab(void)
+ {
+     GtkWidget *w, *w1, *w2, *w3;
+     GtkSizeGroup *group;
+diff --git a/src/moveresize.h b/src/moveresize.h
+index 82ecc96..8faf526 100644
+--- a/src/moveresize.h
++++ b/src/moveresize.h
+@@ -20,6 +20,6 @@
+ #ifndef obconf__moveresize_h
+ #define obconf__moveresize_h
+ 
+-void moveresize_setup_tab();
++void moveresize_setup_tab(void);
+ 
+ #endif
+-- 
+2.37.3
+
diff --git a/meta-oe/recipes-graphics/openbox/obconf_git.bb b/meta-oe/recipes-graphics/openbox/obconf_git.bb
index 772347190d..053af5a770 100644
--- a/meta-oe/recipes-graphics/openbox/obconf_git.bb
+++ b/meta-oe/recipes-graphics/openbox/obconf_git.bb
@@ -14,6 +14,7 @@ PV = "2.0.4+git${SRCPV}"
 SRCREV = "63ec47c5e295ad4f09d1df6d92afb7e10c3fec39"
 SRC_URI = " \
     git://git.openbox.org/dana/obconf;branch=master \
+    file://0001-Fix-function-protype-visibility.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.37.3


