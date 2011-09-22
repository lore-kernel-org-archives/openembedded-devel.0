Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1R6ktH-0007IT-SS
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Sep 2011 17:08:43 +0200
Received: (qmail invoked by alias); 22 Sep 2011 15:03:23 -0000
Received: from p5B0A1554.dip.t-dialin.net (EHLO localhost.localdomain)
	[91.10.21.84]
	by mail.gmx.net (mp069) with SMTP; 22 Sep 2011 17:03:23 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX190UIMPlst0ZF27K3mtbH6jFnXUtPcf60bKIz/ktm
	H+5+hz1/wCXZlc
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Sep 2011 17:06:43 +0200
Message-Id: <1316704004-19647-13-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
References: <1316704004-19647-1-git-send-email-schnitzeltony@gmx.de>
MIME-Version: 1.0
X-Y-GMX-Trusted: 0
Subject: [meta-xfce V2 12/13] thunar: Bump to version 1.2.3
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Sep 2011 15:08:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

fix-segfault-no-icons.patch is now mainline [1]
relative-symlinks-docs.patch is now mainline [2]

[1] http://git.xfce.org/xfce/thunar/commit/?h=xfce-4.8&id=a9a495c31aee0b171807b777b635a480692c6ce7
[2] http://git.xfce.org/xfce/thunar/commit/?h=xfce-4.8&id=432d7abc5b84b7a15bb37d35bb95869d98a824a8

Signed-off-by: Andreas Müller <schnitzeltony@gmx.de>
---
 .../thunar/thunar/fix-segfault-no-icons.patch      |   61 --------------------
 .../thunar/thunar/relative-symlinks-docs.patch     |   28 ---------
 .../thunar/{thunar_1.2.2.bb => thunar_1.2.3.bb}    |   11 +--
 3 files changed, 4 insertions(+), 96 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch
 delete mode 100644 meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
 rename meta-xfce/recipes-xfce/thunar/{thunar_1.2.2.bb => thunar_1.2.3.bb} (75%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch b/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch
deleted file mode 100644
index f0ff412..0000000
--- a/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 5066ca4983d82352fca078525e2be454b263fdfd Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Thu, 11 Aug 2011 10:00:33 +0200
-Subject: [PATCH] Fix segfaults in case icons are missing or not found
-
-
-Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
----
- thunar/thunar-location-button.c |    7 +++++--
- thunar/thunar-window.c          |   13 +++++++++----
- 2 files changed, 14 insertions(+), 6 deletions(-)
-
-diff --git a/thunar/thunar-location-button.c b/thunar/thunar-location-button.c
-index 49be1f4..20d7110 100644
---- a/thunar/thunar-location-button.c
-+++ b/thunar/thunar-location-button.c
-@@ -462,9 +462,12 @@ thunar_location_button_file_changed (ThunarLocationButton *location_button,
-       /* update the icon for the image */
-       icon_factory = thunar_icon_factory_get_for_icon_theme (icon_theme);
-       icon = thunar_icon_factory_load_file_icon (icon_factory, file, location_button->file_icon_state, size);
--      gtk_image_set_from_pixbuf (GTK_IMAGE (location_button->image), icon);
-+      if (G_LIKELY (icon != NULL))
-+      {
-+        gtk_image_set_from_pixbuf (GTK_IMAGE (location_button->image), icon);
-+        g_object_unref (G_OBJECT (icon));
-+      }
-       g_object_unref (G_OBJECT (icon_factory));
--      g_object_unref (G_OBJECT (icon));
- 
-       /* show the image widget */
-       gtk_widget_show (location_button->image);
-diff --git a/thunar/thunar-window.c b/thunar/thunar-window.c
-index d258d8f..2ed1af7 100644
---- a/thunar/thunar-window.c
-+++ b/thunar/thunar-window.c
-@@ -2410,13 +2410,18 @@ thunar_window_current_directory_changed (ThunarFile   *current_directory,
-   gtk_action_set_sensitive (action, (thunar_file_get_item_count (current_directory) > 0));
-   gtk_action_set_visible (action, (thunar_file_is_root (current_directory) && thunar_file_is_trashed (current_directory)));
- 
--  /* set window title and icon */
-+  /* set window title */
-   title = g_strdup_printf ("%s - %s", thunar_file_get_display_name (current_directory), _("File Manager"));
--  icon = thunar_icon_factory_load_file_icon (window->icon_factory, current_directory, THUNAR_FILE_ICON_STATE_DEFAULT, 48);
-   gtk_window_set_title (GTK_WINDOW (window), title);
--  gtk_window_set_icon (GTK_WINDOW (window), icon);
--  g_object_unref (G_OBJECT (icon));
-   g_free (title);
-+
-+  /* set window icon */
-+  icon = thunar_icon_factory_load_file_icon (window->icon_factory, current_directory, THUNAR_FILE_ICON_STATE_DEFAULT, 48);
-+  if (G_LIKELY (icon != NULL))
-+  {
-+    gtk_window_set_icon (GTK_WINDOW (window), icon);
-+    g_object_unref (G_OBJECT (icon));
-+  }
- }
- 
- 
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch b/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
deleted file mode 100644
index 26f35be..0000000
--- a/meta-xfce/recipes-xfce/thunar/thunar/relative-symlinks-docs.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3123ef0e38d18b6dfda644abeb4da48520aa7cb9 Mon Sep 17 00:00:00 2001
-From: Andreas Mueller <schnitzeltony@gmx.de>
-Date: Thu, 21 Jul 2011 23:18:47 +0200
-Subject: [PATCH] docs: On installation create relative paths in symlinks to
- images
-
-
-Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
----
- docs/manual/Makefile.am |    2 +-
- 1 files changed, 1 insertions(+), 1 deletions(-)
-
-diff --git a/docs/manual/Makefile.am b/docs/manual/Makefile.am
-index 57c7c00..5207733 100644
---- a/docs/manual/Makefile.am
-+++ b/docs/manual/Makefile.am
-@@ -20,7 +20,7 @@ install-data-local:
- 			done; \
- 			if test x"$$lang" != x"C" -a ! -d $(srcdir)/images/$$lang; then \
- 				echo "--- Creating symlink to C images for $$lang"; \
--				ln -sf $(docdir)/html/C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
-+				ln -sf ../C/images $(DESTDIR)$(docdir)/html/$$lang/images; \
- 			fi \
- 		fi \
- 	done;
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb
similarity index 75%
rename from meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb
index 1c553ab..a450029 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.2.3.bb
@@ -4,15 +4,12 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
 
-PR = "r1"
+PR = "r0"
 
 inherit xfce
 
 # SRC_URI must follow inherited one
-SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2 \
-           file://relative-symlinks-docs.patch \
-           file://fix-segfault-no-icons.patch \
-"
+SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2"
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
@@ -27,5 +24,5 @@ FILES_${PN}-dbg += "${libdir}/thunarx-2/.debug/ \
                     ${libdir}/xfce4/panel/plugins/.debug/ \
                     ${libdir}/Thunar/.debug/"
 
-SRC_URI[md5sum] = "a86df0212db71e61f459bda6bc7b7fb6"
-SRC_URI[sha256sum] = "56b07dddde423ae7854c5edd433948a912c27afe2a60689ffc50df3d981e90f6"
+SRC_URI[md5sum] = "0a2c36cdd3cb3a2ab52cbf6055415b85"
+SRC_URI[sha256sum] = "e66aa9ad61a9202e15cc7c5fffc7b961da9ab3b4428f874c1ec8e46eb4ffaca6"
-- 
1.7.4.4



