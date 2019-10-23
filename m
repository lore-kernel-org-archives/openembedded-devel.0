Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
	[209.85.210.181])
	by mail.openembedded.org (Postfix) with ESMTP id 7410E7F882
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 16:13:59 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id q5so13219817pfg.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Oct 2019 09:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=uwxs1tQSUPKJZZFthrZRB2PpXm+lTtQrDdXY94yNyJ4=;
	b=DGed9M0adAJht/ZeJ7Bl0+ieFNG+aGFhEs/XvDzPudsaD8woERHgeBPOnUd19KSuN/
	nd5PrNGEYxBTBtQxjY3flUb6/aPDTHFN+rtDkGYEtNU2p8DfpSn5Zb8wU7Rl/as3EhzW
	v9VoPTPvSmsD/K/0GdJ1JE0FaLQEZC4Fg79jCNaRCv8bulJ/39k9DxJEp7RmNLsk/VOg
	KXf7/3Al1Q4TjWqbu66A2mBfoh9uoW9ue7d3kKmCTglQPBaquEq4sj8mNSQlyMZ9RQXF
	AbmWPeV5xYOoTdfhNXqED4ml6edgcHNuYl/Qfkm+QpEtsunzVT142wvzKNglu2LyBskY
	+Glg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uwxs1tQSUPKJZZFthrZRB2PpXm+lTtQrDdXY94yNyJ4=;
	b=k7RYa1OHvgQcv+FFrSh9sabi3UylQEnUfECIZZlgqd01p9wwQbnodF9mKWEoyxtOhh
	ypRw8P8ISiMrI2+VYiyuxoxykABpohVmdmb6Ak0/MDa8tacbE37tpoqDIb6B04ZW5O9D
	yo7UoFzoFZjbRFKMMllzvkbW0x58WOB46NhZ+7H3EXatEaDALCLTLgRAvd1JojmFtSVz
	Fp3LyEFDW3WZIXF1flKcdFzKSJVOyEE0IcvPp2pAejVy8ckeGArb9xrUaMuvbdZbbocU
	WiNY3g609of1DOA/8FrllOnkul4mbc3gzXYrzCEcCnUC/rjPVZZ8jT6fz2cfl43QG4Ew
	L4Ng==
X-Gm-Message-State: APjAAAW9mE10S5SnKlwFAlebw+jFoAL0ieVB5lSy7ZkcSTpd0qdI4zah
	Rwq7ZkBWWGDGWx9+6fuR6h/4KJZg
X-Google-Smtp-Source: APXvYqxoTnpYSquCmFw/xY/eeaRmmK2ZRPxkwmhTkXS9WYL++v2th3CYfhWSWvwA7gU1BcJYcUEBTg==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr11197816pgs.219.1571847239971;
	Wed, 23 Oct 2019 09:13:59 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:d998:942e:6613:6ef4])
	by smtp.gmail.com with ESMTPSA id
	d19sm23179067pjz.5.2019.10.23.09.13.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Oct 2019 09:13:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 23 Oct 2019 09:13:46 -0700
Message-Id: <9949bbf7deee741297e79850b4a22bf29a579157.1571847041.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1571847041.git.akuster808@gmail.com>
References: <cover.1571847041.git.akuster808@gmail.com>
MIME-Version: 1.0
Subject: [warrior 01/10] xfce4-panel: Draw icons/background properly when compositing is disabled
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
X-List-Received-Date: Wed, 23 Oct 2019 16:13:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Andreas Müller <schnitzeltony@gmail.com>

A similar patch was sent for master [1] but that was superseded by upgrade of
xfce4-panel 4.14.0 -> 4.14.1 [2]

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-September/201966.html
[2] http://lists.openembedded.org/pipermail/openembedded-devel/2019-September/201986.html

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
Acked-by: Kai Kang <kai.kang@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...y-Fix-icons-without-compositing-Bug-14577.patch | 80 ++++++++++++++++++++++
 .../recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch
new file mode 100644
index 0000000..8fac5ad
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-systray-Fix-icons-without-compositing-Bug-14577.patch
@@ -0,0 +1,80 @@
+From f6f70cce417fd2982c2ce6f01016ed01deb6a9ae Mon Sep 17 00:00:00 2001
+From: "Ivan A. Melnikov" <iv@altlinux.org>
+Date: Mon, 23 Sep 2019 16:18:10 +0400
+Subject: [PATCH] systray: Fix icons without compositing (Bug #14577)
+
+Wrapper window uses RGBA visual when it's available;
+systray manager should try to do the same for
+the transparent or parent-relative background to work.
+
+That means that the manager and icons will work with
+RGBA visual even if the screen is not compositing; so
+we should always force-redraw the icons.
+
+Upstream-Status: Accepted [1]
+
+[1] https://git.xfce.org/xfce/xfce4-panel/commit?id=f6f70cce417fd2982c2ce6f01016ed01deb6a9ae
+
+Refs: https://bugzilla.xfce.org/show_bug.cgi?id=14577
+Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
+---
+ plugins/systray/systray-manager.c | 10 ++++++----
+ plugins/systray/systray.c         | 10 ----------
+ 2 files changed, 6 insertions(+), 14 deletions(-)
+
+diff --git a/plugins/systray/systray-manager.c b/plugins/systray/systray-manager.c
+index 68836554..4915649c 100644
+--- a/plugins/systray/systray-manager.c
++++ b/plugins/systray/systray-manager.c
+@@ -751,6 +751,7 @@ static void
+ systray_manager_set_visual (SystrayManager *manager)
+ {
+   GdkDisplay  *display;
++  GdkVisual   *visual;
+   Visual      *xvisual;
+   Atom         visual_atom;
+   gulong       data[1];
+@@ -768,11 +769,12 @@ systray_manager_set_visual (SystrayManager *manager)
+   visual_atom = gdk_x11_get_xatom_by_name_for_display (display,
+       "_NET_SYSTEM_TRAY_VISUAL");
+ 
+-  if (gdk_screen_is_composited (gtk_widget_get_screen (manager->invisible))
+-      && (gdk_screen_get_rgba_visual (screen) != NULL))
++  visual = gdk_screen_get_rgba_visual (screen);
++  panel_debug (PANEL_DEBUG_SYSTRAY, "rgba visual is %p", visual);
++  if (visual != NULL)
+     {
+-      /* get the rgba visual */
+-      xvisual = GDK_VISUAL_XVISUAL (gdk_screen_get_rgba_visual (screen));
++      /* use the rgba visual */
++      xvisual = GDK_VISUAL_XVISUAL (visual);
+     }
+   else
+     {
+diff --git a/plugins/systray/systray.c b/plugins/systray/systray.c
+index 3fb9520c..beae1973 100644
+--- a/plugins/systray/systray.c
++++ b/plugins/systray/systray.c
+@@ -728,19 +728,9 @@ systray_plugin_box_draw (GtkWidget *box,
+                          gpointer   user_data)
+ {
+   SystrayPlugin *plugin = XFCE_SYSTRAY_PLUGIN (user_data);
+-  GdkScreen      *screen;
+-
+   panel_return_if_fail (XFCE_IS_SYSTRAY_PLUGIN (plugin));
+   panel_return_if_fail (cr != NULL);
+ 
+-  screen = gtk_widget_get_screen (GTK_WIDGET (plugin));
+-
+-  if (G_LIKELY (screen != NULL))
+-    {
+-      if (!gdk_screen_is_composited (screen))
+-        return;
+-    }
+-
+   /* separately draw all the composed tray icons after gtk
+    * handled the draw event */
+   gtk_container_foreach (GTK_CONTAINER (box),
+-- 
+2.21.0
+
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
index 18e054c..ecae873 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.13.4.bb
@@ -12,6 +12,7 @@ SRC_URI[md5sum] = "c0f132fed2110d37f351aadc9e80a034"
 SRC_URI[sha256sum] = "36ffd26ef7f5867c01ba310475b4358ff0e588cfd5599a266f0037a6c20052a1"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
+    file://0002-systray-Fix-icons-without-compositing-Bug-14577.patch \
 "
 
 python populate_packages_prepend() {
-- 
2.7.4


