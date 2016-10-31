Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 0853271AFC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 22:11:14 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id c17so20256764wmc.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=QcKHzgM7uhfKHFO7z4JXSHDjql/PPSv5TDSLtHy22/o=;
	b=UAOQvrvz7ozsKAbCOpzyYsRNpkT4HbHiNZ/ak2PZqLU56m5gpFAkQkAidOhG5Xzwae
	n5C0W2dgM6G89+CYxxTb21djF6uxmoEAtLlfbw29KkjNdDy+WQAb9CSmwzpJ+ZfmBuge
	0szi+FHXhXtEKqBD/1BGZlUohh+984x+h/ghsu7WOG4uFTHfy/xK+87p/3kbmGEiGlY6
	SbAQVVEQdJIaJ6Glvu0Cxh1rUvlZmxCSPe7WXFg7CSQeXo6To/TRtX4RZbaktUAVti69
	+V5148p0C/D2w77EOqm0Rqw2LAOhyjOudAQBloLOem4tGLVl8znNXPa9lvSK+TSODF6r
	nvcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=QcKHzgM7uhfKHFO7z4JXSHDjql/PPSv5TDSLtHy22/o=;
	b=gmTjI2LridgD/H4EW4lcCtUwrEcl9uDhNCv9Ufa/TypJuzwhGGpvEb0OVE6PYs/ebC
	CD/lFuOaZnNyLkr/3Ddw/cW6/6YbGPZLwxD8Hy+DMIof8IiVg/Kog0UmIMb8ay7V93/E
	4HB+ukImR6c/HFktR+74/eFHENq3B0+W44L9mOsoEfGqVDhFITgXawb4ghRqMWs/OCgb
	J6b7UMf8vH/SRZEvWDSfDSRiyp1UnUMqEjupnGe2Bteb3Rr3n9av1bvztlbu199L8RMH
	mXMh4rQAhM+or3p+IRjXtWyRyFSPqpLQjOSBsvTenGiay/502rFBY2pvinSXlytfbSSc
	5h8Q==
X-Gm-Message-State: ABUngvfqorgajR5jFoVtp1Lma7EKkIaeKhzbcrjOT3Q5ftmkcr22Wov5uAfTttocEOlfWw==
X-Received: by 10.28.216.17 with SMTP id p17mr12535641wmg.11.1477951875010;
	Mon, 31 Oct 2016 15:11:15 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3FE5.dip0.t-ipconnect.de.
	[91.10.63.229]) by smtp.googlemail.com with ESMTPSA id
	129sm26918697wmq.9.2016.10.31.15.11.14
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 31 Oct 2016 15:11:14 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 31 Oct 2016 23:10:48 +0100
Message-Id: <1477951849-32149-12-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
References: <1477951849-32149-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 12/13] xfce4-panel: do not display desktop icon when no window is opened
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
X-List-Received-Date: Mon, 31 Oct 2016 22:11:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...do-not-display-desktop-icon-when-no-windo.patch | 60 ++++++++++++++++++++++
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb |  1 +
 2 files changed, 61 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
new file mode 100644
index 0000000..b2d960c
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch
@@ -0,0 +1,60 @@
+From 0651f228cef01a6c3e4758a991cace1cd7721031 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
+Date: Mon, 24 Sep 2012 09:57:46 +0200
+Subject: [PATCH] windowmenu: do not display desktop icon when no window is
+ active
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+* desktop icon is of no use
+* desktop icon confuses when using showdesktop plugin
+
+Upstream-Status: Pending
+
+Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
+---
+ plugins/windowmenu/windowmenu.c |   12 ++++++------
+ 1 files changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/plugins/windowmenu/windowmenu.c b/plugins/windowmenu/windowmenu.c
+index c96123a..9404021 100644
+--- a/plugins/windowmenu/windowmenu.c
++++ b/plugins/windowmenu/windowmenu.c
+@@ -256,7 +256,7 @@ window_menu_plugin_init (WindowMenuPlugin *plugin)
+   g_signal_connect (G_OBJECT (plugin->button), "toggled",
+       G_CALLBACK (window_menu_plugin_menu), plugin);
+ 
+-  plugin->icon = xfce_panel_image_new_from_source ("user-desktop");
++  plugin->icon = xfce_panel_image_new_from_source (NULL);
+   gtk_container_add (GTK_CONTAINER (plugin->button), plugin->icon);
+   gtk_widget_show (plugin->icon);
+ }
+@@ -634,7 +634,7 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
+           /* skip 'fake' windows */
+           type = wnck_window_get_window_type (window);
+           if (type == WNCK_WINDOW_DESKTOP || type == WNCK_WINDOW_DOCK)
+-            goto show_desktop_icon;
++            goto show_no_icon;
+ 
+           /* get the window icon and set the tooltip */
+           gtk_widget_set_tooltip_text (GTK_WIDGET (icon),
+@@ -648,11 +648,11 @@ window_menu_plugin_active_window_changed (WnckScreen       *screen,
+         }
+       else
+         {
+-          show_desktop_icon:
++          show_no_icon:
+ 
+-          /* desktop is shown right now */
+-          xfce_panel_image_set_from_source (icon, "user-desktop");
+-          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("Desktop"));
++          /* no icon is shown right now */
++          xfce_panel_image_set_from_source (icon, NULL);
++          gtk_widget_set_tooltip_text (GTK_WIDGET (icon), _("No Windows"));
+         }
+     }
+ }
+-- 
+1.7.6.5
+
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
index 6a2b944..4148d9a 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.12.0.bb
@@ -11,6 +11,7 @@ SRC_URI[sha256sum] = "30920fc2e2fc26279a82b5261a155c2cc15ab2aa1ced2275684a6ff826
 SRC_URI += " \
     file://0001-Fix-compiler-warning-in-clock-plugin-about-shadowed-.patch \
     file://0002-clock-time-make-change-of-system-s-timezone-change-t.patch \
+    file://0003-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
 "
 
 EXTRA_OECONF += "--enable-gtk3"
-- 
2.5.5


