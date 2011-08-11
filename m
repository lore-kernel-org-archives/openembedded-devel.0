Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1QrdeA-0004Ty-3i
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Aug 2011 00:22:38 +0200
Received: (qmail invoked by alias); 11 Aug 2011 22:18:06 -0000
Received: from p4FDF1A77.dip.t-dialin.net (EHLO localhost.localdomain)
	[79.223.26.119]
	by mail.gmx.net (mp071) with SMTP; 12 Aug 2011 00:18:06 +0200
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX198T7gDFV58u3lXZUYl0PKj3DsZDS1vArGj1N1V7S
	7pAambf2v09eiX
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:21:22 +0200
Message-Id: <1313101282-4158-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.4.4
X-Y-GMX-Trusted: 0
Subject: [meta-xfce] thunar: Fix segfault in case no icon-theme is selected/installed
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
X-List-Received-Date: Thu, 11 Aug 2011 22:22:38 -0000

The patch was sent to xfce bug list [1]. As long as it not applied, make
thunar work for us.

[1] https://bugzilla.xfce.org/show_bug.cgi?id=7880

Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 .../thunar/thunar/fix-segfault-no-icons.patch      |   61 ++++++++++++++++++++
 meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb      |    7 +--
 2 files changed, 63 insertions(+), 5 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch b/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch
new file mode 100644
index 0000000..f0ff412
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/fix-segfault-no-icons.patch
@@ -0,0 +1,61 @@
+From 5066ca4983d82352fca078525e2be454b263fdfd Mon Sep 17 00:00:00 2001
+From: Andreas Mueller <schnitzeltony@gmx.de>
+Date: Thu, 11 Aug 2011 10:00:33 +0200
+Subject: [PATCH] Fix segfaults in case icons are missing or not found
+
+
+Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
+---
+ thunar/thunar-location-button.c |    7 +++++--
+ thunar/thunar-window.c          |   13 +++++++++----
+ 2 files changed, 14 insertions(+), 6 deletions(-)
+
+diff --git a/thunar/thunar-location-button.c b/thunar/thunar-location-button.c
+index 49be1f4..20d7110 100644
+--- a/thunar/thunar-location-button.c
++++ b/thunar/thunar-location-button.c
+@@ -462,9 +462,12 @@ thunar_location_button_file_changed (ThunarLocationButton *location_button,
+       /* update the icon for the image */
+       icon_factory = thunar_icon_factory_get_for_icon_theme (icon_theme);
+       icon = thunar_icon_factory_load_file_icon (icon_factory, file, location_button->file_icon_state, size);
+-      gtk_image_set_from_pixbuf (GTK_IMAGE (location_button->image), icon);
++      if (G_LIKELY (icon != NULL))
++      {
++        gtk_image_set_from_pixbuf (GTK_IMAGE (location_button->image), icon);
++        g_object_unref (G_OBJECT (icon));
++      }
+       g_object_unref (G_OBJECT (icon_factory));
+-      g_object_unref (G_OBJECT (icon));
+ 
+       /* show the image widget */
+       gtk_widget_show (location_button->image);
+diff --git a/thunar/thunar-window.c b/thunar/thunar-window.c
+index d258d8f..2ed1af7 100644
+--- a/thunar/thunar-window.c
++++ b/thunar/thunar-window.c
+@@ -2410,13 +2410,18 @@ thunar_window_current_directory_changed (ThunarFile   *current_directory,
+   gtk_action_set_sensitive (action, (thunar_file_get_item_count (current_directory) > 0));
+   gtk_action_set_visible (action, (thunar_file_is_root (current_directory) && thunar_file_is_trashed (current_directory)));
+ 
+-  /* set window title and icon */
++  /* set window title */
+   title = g_strdup_printf ("%s - %s", thunar_file_get_display_name (current_directory), _("File Manager"));
+-  icon = thunar_icon_factory_load_file_icon (window->icon_factory, current_directory, THUNAR_FILE_ICON_STATE_DEFAULT, 48);
+   gtk_window_set_title (GTK_WINDOW (window), title);
+-  gtk_window_set_icon (GTK_WINDOW (window), icon);
+-  g_object_unref (G_OBJECT (icon));
+   g_free (title);
++
++  /* set window icon */
++  icon = thunar_icon_factory_load_file_icon (window->icon_factory, current_directory, THUNAR_FILE_ICON_STATE_DEFAULT, 48);
++  if (G_LIKELY (icon != NULL))
++  {
++    gtk_window_set_icon (GTK_WINDOW (window), icon);
++    g_object_unref (G_OBJECT (icon));
++  }
+ }
+ 
+ 
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb b/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
index c978855..1c553ab 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_1.2.2.bb
@@ -4,21 +4,18 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo gtk+ gdk-pixbuf libxfce4util libxfce4ui libsm dbus-glib startup-notification libnotify"
 
-PR = "r0"
+PR = "r1"
 
 inherit xfce
 
 # SRC_URI must follow inherited one
 SRC_URI = "http://archive.xfce.org/src/xfce/${PN}/${@'${PV}'[0:3]}/Thunar-${PV}.tar.bz2 \
            file://relative-symlinks-docs.patch \
+           file://fix-segfault-no-icons.patch \
 "
 
 S = "${WORKDIR}/Thunar-${PV}/"
 
-
-# no/minimum(default)/yes/full(fails <- Werror)
-#EXTRA_OECONF += "--enable-debug=yes"
-
 FILES_${PN} += "${libdir}/thunarx-2/* \
                 ${libdir}/xfce4/panel/plugins/* \
                 ${libdir}/Thunar/[Tt]hunar* \
-- 
1.7.4.4



