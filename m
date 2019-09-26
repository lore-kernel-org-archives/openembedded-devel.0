Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
	[209.85.221.50])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0207E719
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 07:12:11 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id v8so1398176wrt.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Sep 2019 00:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cBqnVJvInrMGTXfOx1qTJ4R3AB0SV5XKofvEj18fHVs=;
	b=M3qT+fZxt3wk2YcPYFoZkzc0r09vciAtvwxigxjqPgbzAkLFB4kmJY0rfWEX94avnT
	AlBfSaaFDTpF1TF3dznCMnvB7dNw2J7nt6xla9FtBn8mtSupM7gt3Mhq1K53i+tqMTP4
	1fsmWotJ208bAOUf+XONG5PQe2aFNWiMmd0TqHykFX24UBqNxCJTL7xo+VpI2rmLUIfI
	gEmSuIo/dgUPuGFQx90oMSHW3quckVcBFBYOl8edsaIaxA/Hhf/kVetZu5UnsdEnNTZX
	7g5+3om6Osa2O8lQVuI4P5R9F1iRUDUo1idLFsWPixmbVZVcdJEigFXcru6lhLbYmXr4
	YMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=cBqnVJvInrMGTXfOx1qTJ4R3AB0SV5XKofvEj18fHVs=;
	b=cA5uoNvc2sn1rgVrvODuPBOS2YT+OhXZT0pGUPGgqGYWO4GrMeGdFZBshTCg9RJpSj
	yjpPG8Zqi3L71u2AoisD2mnmBb7IowHXfyQ7iO3sXMBe0FQOVRr2fxp8AejXMSN2zJve
	Yq5Dt7Mfilt9gc9VcyxSTvWpatMiqJ13FYLNbYFDsvDPkD11Tgbw83gUeMUAu++5xTVn
	V5e++8G9NajrsggTIVuYmmH30VLtUtpELLgDlTnJR52O0Tv1k2ZRiwz5xhW8Wa+eWUO6
	i4PbL/eGsuj9//fdPQe7628Udf6tAc0iJOXmufY6SGFo++G9jtc+LHqo59lKGP7Qyxre
	D7WQ==
X-Gm-Message-State: APjAAAWZYbZ1z7A+PvC/6RMmwr8J6sQO5yqc8BpMsZWtA3ZMBRCNNoB1
	IE0Hxz3XcTtfS887/+q+JfA3TkGl
X-Google-Smtp-Source: APXvYqwqs61vQIZEF8QsrzkRlY7bosMKev6wxidtSNL9AmiVPXzwyPH5EppG3jAD+Adn5d4W1WHtGQ==
X-Received: by 2002:a5d:5290:: with SMTP id c16mr1610232wrv.381.1569481931376; 
	Thu, 26 Sep 2019 00:12:11 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F05552433B9EECE553F1384.dip0.t-ipconnect.de.
	[2003:f0:7f05:5524:33b9:eece:553f:1384])
	by smtp.gmail.com with ESMTPSA id
	s19sm5183753wrb.14.2019.09.26.00.12.10
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 26 Sep 2019 00:12:10 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org,
	kai.kang@windriver.com
Date: Thu, 26 Sep 2019 09:12:01 +0200
Message-Id: <20190926071202.9750-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [meta-xfce][PATCH 1/2] xfce-panel/systray: Draw icons/background properly when compositing is disabled
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
X-List-Received-Date: Thu, 26 Sep 2019 07:12:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* this was the last long lasting xfce bug that annoyed me
* while at it renumber patches

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...=> 0002-use-lxdm-to-replace-dm-tool.patch} |  0
 ...-icons-without-compositing-Bug-14577.patch | 80 +++++++++++++++++++
 .../xfce4-panel/xfce4-panel_4.14.0.bb         |  3 +-
 3 files changed, 82 insertions(+), 1 deletion(-)
 rename meta-xfce/recipes-xfce/xfce4-panel/files/{0001-use-lxdm-to-replace-dm-tool.patch => 0002-use-lxdm-to-replace-dm-tool.patch} (100%)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-icons-without-compositing-Bug-14577.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-dm-tool.patch
similarity index 100%
rename from meta-xfce/recipes-xfce/xfce4-panel/files/0001-use-lxdm-to-replace-dm-tool.patch
rename to meta-xfce/recipes-xfce/xfce4-panel/files/0002-use-lxdm-to-replace-dm-tool.patch
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-icons-without-compositing-Bug-14577.patch b/meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-icons-without-compositing-Bug-14577.patch
new file mode 100644
index 000000000..12cc3f0dc
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-panel/files/0003-systray-Fix-icons-without-compositing-Bug-14577.patch
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
+Refs: https://bugzilla.xfce.org/show_bug.cgi?id=14577
+Signed-off-by: Ivan A. Melnikov <iv@altlinux.org>
+
+Upstream-Status: Accepted [1]
+
+[1] https://git.xfce.org/xfce/xfce4-panel/commit?id=820de57c44c381e47091d3a7e214852bf8fafb53
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
diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
index 749c3fea4..faec9b2b7 100644
--- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.14.0.bb
@@ -12,7 +12,8 @@ SRC_URI[md5sum] = "940e8b430e28093a2e56e390055bcd51"
 SRC_URI[sha256sum] = "d5f8f3bd7e142139987e5e62cda26135a424baabb5e47aa0c23b4169d0a66ef4"
 SRC_URI += " \
     file://0001-windowmenu-do-not-display-desktop-icon-when-no-windo.patch \
-    file://0001-use-lxdm-to-replace-dm-tool.patch \
+    file://0002-use-lxdm-to-replace-dm-tool.patch \
+    file://0003-systray-Fix-icons-without-compositing-Bug-14577.patch \
 "
 
 python populate_packages_prepend() {
-- 
2.21.0


