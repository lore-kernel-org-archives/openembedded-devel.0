Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E61CC25B7C
	for <webhook@archiver.kernel.org>; Tue, 21 May 2024 18:10:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.3054.1716315038833401542
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 May 2024 11:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OJii3346;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1eca195a7c8so105024105ad.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 11:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716315038; x=1716919838; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c//ZzFJeKnAzUZXplMXKTmD5aTxBECm7Ei3jf72xFpA=;
        b=OJii3346/t1OvwQbZKJSrnMSCgRgXoFHsTboH8o+KsW7sh2yZebFUcjU3h90k8yKtO
         PtJ6kmQQ68hZlCCSuSj0XUhIfDHiGzf98vxHOqTscBKPTmKWtq2dk+poPB0p9a+jTVuU
         /HdgOgn61jPdWSxdiwVCQM+JkFiHhrSZfto+kwhjpAXxHiUqmdtoyd+WUYQhxlMInnsl
         CyR99tCEVLp+s7+PELE7SjpLQYPw5bf29ZPjBmHDo1eG5ZVQRw7fXkz2EcZf0HaBbyLV
         SicID0ZfEL79xHPN+vHRi+6bA2MFU94DeXJCYDGBZvNW048YC2KCVSrBqb9VSIHpJR6z
         J/Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716315038; x=1716919838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c//ZzFJeKnAzUZXplMXKTmD5aTxBECm7Ei3jf72xFpA=;
        b=KDjbG4LYPPB/YXiz+A8FvxRi5odVvmc8ZGxF6fCeWimrKsxB1JTuqujHegTRVAKuhC
         PCvfNLeQN9jxUDUoAzx+3kErzeYIeNQrwavqTYm9JPnp71RrpXVW8p7xws+4Oik/UfCu
         kOJnDmQDTvfIgXtU+Dh88WpCNBp9l2vU86pHuC7qrDhzEwnOLXRToVVF1bNsgvkTWcmy
         cXemex4X9E3b+sKkW3egBISQskx0wLx7uEb+Byj0gp0nuT9OghHrBjkQoiEd1799dYb7
         EApaOe8cr8BOEgN4k9mmQIQ5HQwCN4Dri/6ASoDBNi6clFhVXsET0YRwUJ4p7gb5ql5Y
         E0YQ==
X-Gm-Message-State: AOJu0YzV+urXKI29qC6kPlDYTpQXdMpEPeikjryWAir3hvKtRIJzgA6M
	22iUfNWKASN6JdWj8NOnmqLYsByjvXF6feyA0hBSZy01LZm10NubLJlIAITqEzI=
X-Google-Smtp-Source: AGHT+IFQ0FuPbsHuCNfUgoJh5OU3+3eId0flohFgfe/gJhc2U2qzlaUA/X5Hqie28AQqWVjbLpHXRg==
X-Received: by 2002:a17:902:784b:b0:1f3:11ec:cbbd with SMTP id d9443c01a7336-1f311eccdc9mr15573805ad.5.1716315038028;
        Tue, 21 May 2024 11:10:38 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e8eb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c136354sm224799075ad.244.2024.05.21.11.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 11:10:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][ 12/22] gnome-font-viewer: Fix build with GCC-14
Date: Tue, 21 May 2024 11:10:13 -0700
Message-ID: <20240521181024.426176-12-raj.khem@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521181024.426176-1-raj.khem@gmail.com>
References: <20240521181024.426176-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 May 2024 18:10:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110461

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...dow-Fix-function-callback-definition.patch | 43 +++++++++++++++++++
 .../gnome-font-viewer_46.0.bb                 |  1 +
 2 files changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
new file mode 100644
index 0000000000..be4c002fc3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
@@ -0,0 +1,43 @@
+From ac4a07e7ef3d9d046a4ca2a803c5b649b6f7ddf4 Mon Sep 17 00:00:00 2001
+From: Matt Turner <mattst88@gmail.com>
+Date: Sat, 8 Jul 2023 00:01:07 -0400
+Subject: [PATCH] window: Fix function callback definition
+
+Without this, the build fails with clang with
+CFLAGS=-Werror=incompatible-function-pointer-types
+
+```
+../src/font-view-window.c:864:77: error: incompatible function pointer types passing 'void (FontViewWindow *)' (aka 'void (struct _FontViewWindow *)') to parameter of type 'GtkWidgetActionActivateFunc' (aka 'void (*)(struct _GtkWidget *, const char *, struct _GVariant *)') [-Wincompatible-function-pointer-types]
+  gtk_widget_class_install_action (widget_class, "win.toggle-search", NULL, action_toggle_search_cb);
+                                                                            ^~~~~~~~~~~~~~~~~~~~~~~
+/usr/include/gtk-4.0/gtk/gtkwidget.h:956:87: note: passing argument to parameter 'activate' here
+                                                         GtkWidgetActionActivateFunc  activate);
+                                                                                      ^
+```
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/merge_requests/54]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/font-view-window.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/src/font-view-window.c b/src/font-view-window.c
+index 639ac33..24461f7 100644
+--- a/src/font-view-window.c
++++ b/src/font-view-window.c
+@@ -758,8 +758,11 @@ font_view_window_show_overview (FontViewWindow *self)
+ }
+ 
+ static void
+-action_toggle_search_cb (FontViewWindow *self)
++action_toggle_search_cb (GtkWidget  *widget,
++                         const char *action_name,
++                         GVariant   *parameter)
+ {
++  FontViewWindow *self = FONT_VIEW_WINDOW (widget);
+ 
+  gtk_toggle_button_set_active (self->search_button,
+                                !gtk_toggle_button_get_active (self->search_button));
+-- 
+2.45.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
index dbce71d121..ccf8262dcd 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
@@ -15,6 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
+SRC_URI += "file://0001-window-Fix-function-callback-definition.patch"
 SRC_URI[archive.sha256sum] = "592f401e485d02cc044d487bb5c8e04c961da6856216768a59f1ff98bd2d537c"
 
 FILES:${PN} += " \
-- 
2.45.1


