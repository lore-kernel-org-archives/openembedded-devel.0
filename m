Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9C14D2B942
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 14:36:49 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.web10.19583.1730817403103386551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 06:36:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b9ajx4oH;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e8063533b5so45924487b3.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 06:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730817402; x=1731422202; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MrXsHt9nm5jicxil1KytSfWbSxd/b+l9vQclBZS43lg=;
        b=b9ajx4oHducj692fJWXGYU+wl4FqMmwbZG3xHXuO9aoYqNijM7MAjQVNKaI7YMaINO
         Dj8C37k8U7R9cnZNhqdKfhCNd6WGgXATfl68MLcnJkP7/EDX5WB/UhPtuREYSpkn4478
         1VZ82Ip8V9Lkfe3n+v93+6/gnWSDSY2W4glGs5QCgBIZZjLEkwlK7V3AtTn/d6cAnmJG
         nHhZBwACjhqYmT3csdK2OuRhg+3Tp0Gs2S4emnTvD+vQvwFmFts/La+OskUmFPF0iKSc
         PsWK1/Mh2I/awOj7XiTVTU5urCJ79CyD7dEvc9PQqybk/veS2vcEFXxh8E51C/ihVP94
         uRxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730817402; x=1731422202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrXsHt9nm5jicxil1KytSfWbSxd/b+l9vQclBZS43lg=;
        b=o3k1iDW/FcDjpcXfR3L3yVqwK3m0ZDYtADduNUU0raDRdqv27CucZRRVaDC+6/jbPy
         ttFYCFQycgyS7ezWYUyXWBofWyqGyw1ubdhnQpUFKZyJ3BpRonxqFFIUoda735fkt1Uv
         L9I4gFo4el+pZNaGbkVUkn+4UgMk1tLLFlqisNLARdWjAuccJDjdpOLN1B+x1prxdp9U
         EzId2CCMLvepOaAEHLm/+wYdIjpW/6+9YmEQsUx8wPrp/iyBcu8r3FjhWf71SgaCC467
         JsAKtNy54Mfah6+fUhFKO9fLQo5T3vC0DNEcXMWTiRv8y2S+DEFy4wZWmzSmmmxuiPSA
         NFuA==
X-Gm-Message-State: AOJu0YzhxkveW7iBi0PlVO78VjmmzUM+wSKS0Vph2VdY/XParc15pt0b
	8co+aroyUlXo90C8huIcm3RyevZle4nKT5DBZpo/y87JcMRxbURcAURzAA==
X-Google-Smtp-Source: AGHT+IGu+cWzKG7loUBdepItaeS2G6KvwMbZF+w/oUEU0irEDjKGaOKvPYOSnthpgGkU5Q//LHlOeg==
X-Received: by 2002:a05:690c:3709:b0:6de:2ae:811f with SMTP id 00721157ae682-6ea64bf4929mr167816387b3.35.1730817401850;
        Tue, 05 Nov 2024 06:36:41 -0800 (PST)
Received: from keaua.attlocal.net ([2600:1700:45dd:7000::29])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea55c8723esm22495977b3.126.2024.11.05.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 06:36:41 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][styhead][PATCH 05/90] gnome-font-viewer: upgrade 46.0 -> 47.0
Date: Tue,  5 Nov 2024 09:34:30 -0500
Message-ID: <20241105143638.2301245-6-akuster808@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241105143638.2301245-1-akuster808@gmail.com>
References: <20241105143638.2301245-1-akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Nov 2024 14:36:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113422

From: Wang Mingyu <wangmy@fujitsu.com>

0001-window-Fix-function-callback-definition.patch
removed since it's included in 47.0

Changelog:
=========
* Set application name and icon
* Remove unused dependency on gnome-desktop
* Add slant preview
* Fix install button mnemonic
* Fix the "Install" button stuck in "Installing" when font install is successful
* Use adaptive dialogs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...dow-Fix-function-callback-definition.patch | 43 -------------------
 ...ewer_46.0.bb => gnome-font-viewer_47.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 45 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
 rename meta-gnome/recipes-gnome/gnome-font-viewer/{gnome-font-viewer_46.0.bb => gnome-font-viewer_47.0.bb} (71%)

diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
deleted file mode 100644
index be4c002fc3..0000000000
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer/0001-window-Fix-function-callback-definition.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From ac4a07e7ef3d9d046a4ca2a803c5b649b6f7ddf4 Mon Sep 17 00:00:00 2001
-From: Matt Turner <mattst88@gmail.com>
-Date: Sat, 8 Jul 2023 00:01:07 -0400
-Subject: [PATCH] window: Fix function callback definition
-
-Without this, the build fails with clang with
-CFLAGS=-Werror=incompatible-function-pointer-types
-
-```
-../src/font-view-window.c:864:77: error: incompatible function pointer types passing 'void (FontViewWindow *)' (aka 'void (struct _FontViewWindow *)') to parameter of type 'GtkWidgetActionActivateFunc' (aka 'void (*)(struct _GtkWidget *, const char *, struct _GVariant *)') [-Wincompatible-function-pointer-types]
-  gtk_widget_class_install_action (widget_class, "win.toggle-search", NULL, action_toggle_search_cb);
-                                                                            ^~~~~~~~~~~~~~~~~~~~~~~
-/usr/include/gtk-4.0/gtk/gtkwidget.h:956:87: note: passing argument to parameter 'activate' here
-                                                         GtkWidgetActionActivateFunc  activate);
-                                                                                      ^
-```
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gnome-font-viewer/-/merge_requests/54]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/font-view-window.c | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/src/font-view-window.c b/src/font-view-window.c
-index 639ac33..24461f7 100644
---- a/src/font-view-window.c
-+++ b/src/font-view-window.c
-@@ -758,8 +758,11 @@ font_view_window_show_overview (FontViewWindow *self)
- }
- 
- static void
--action_toggle_search_cb (FontViewWindow *self)
-+action_toggle_search_cb (GtkWidget  *widget,
-+                         const char *action_name,
-+                         GVariant   *parameter)
- {
-+  FontViewWindow *self = FONT_VIEW_WINDOW (widget);
- 
-  gtk_toggle_button_set_active (self->search_button,
-                                !gtk_toggle_button_get_active (self->search_button));
--- 
-2.45.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
similarity index 71%
rename from meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
rename to meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
index ccf8262dcd..4763d1717d 100644
--- a/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_46.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-font-viewer/gnome-font-viewer_47.0.bb
@@ -15,8 +15,7 @@ inherit gnomebase gtk-icon-cache gettext features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11 opengl"
 
-SRC_URI += "file://0001-window-Fix-function-callback-definition.patch"
-SRC_URI[archive.sha256sum] = "592f401e485d02cc044d487bb5c8e04c961da6856216768a59f1ff98bd2d537c"
+SRC_URI[archive.sha256sum] = "b8e5a042e0b241b0c7cae43f74da0d5f88e6423017a91feb86e7617edb4080ed"
 
 FILES:${PN} += " \
     ${datadir}/dbus-1 \
-- 
2.43.0


