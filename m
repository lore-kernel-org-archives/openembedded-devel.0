Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRC-0004cP-H0
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so3132859eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=UU/o/t9LlkmH+FHG+8IfhjoMlViM7spJ15gs1kHFySk=;
	b=Y9yQ3AdGd+Mq0v+7Um4imBx9SQBOovl00JzDjvLYZ8d9Q83pmKWeLhSPyJ+095iVs1
	CubsN4NMaf8AOXTI0v+Fm8jNM/kbjRF7Mvrz4ux/LQ077LmW9/aYDZkHPrNHKQcS91i5
	LcZ9iDcI+k36OcBdVK+TimQIuVd3GUN+KqG5DvVgU7ckKj1jXg5R1yj6YBlFXu4F+5GS
	maC+BAe8RxC6uhrC8Ety6kWP0/qFz5YvccEetmL8lMLottDlYBQqU3seRP/pQujTvucn
	xdLEMSIPu3kDAO4Ho4egdgghmSwqCSQ1v+9tpXTKC2QrIEMpncDYX3l0z/I4jxau2P+W
	vVaA==
X-Received: by 10.14.225.4 with SMTP id y4mr47650205eep.6.1356267784559;
	Sun, 23 Dec 2012 05:03:04 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:03 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:35 +0100
Message-Id: <1356267761-15152-7-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 06/12] xfce4-settings: Remember the settings manager window size
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...the-settings-manager-window-size-bug-9384.patch |  155 ++++++++++++++++++++
 .../xfce4-settings/xfce4-settings_4.10.0.bb        |    3 +-
 2 files changed, 157 insertions(+), 1 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
new file mode 100644
index 0000000..8c1d1d9
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
@@ -0,0 +1,155 @@
+From b3b1986327b9b42ac6f9442443ff103f6565a323 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Guelfucci?= <jeromeg@xfce.org>
+Date: Wed, 19 Dec 2012 09:53:58 +0100
+Subject: [PATCH] Remember the settings manager window size (bug #9384).
+
+Handy with pluggable dialogs, allows the user to get rid of most of the
+scrollbars.
+
+Upstream-Status: applied
+---
+ xfce4-settings-manager/Makefile.am                 |    2 +
+ xfce4-settings-manager/main.c                      |   13 +++++++
+ .../xfce-settings-manager-dialog.c                 |   38 +++++++++++++++-----
+ 3 files changed, 44 insertions(+), 9 deletions(-)
+
+diff --git a/xfce4-settings-manager/Makefile.am b/xfce4-settings-manager/Makefile.am
+index c6bdc2d..99f9b3f 100644
+--- a/xfce4-settings-manager/Makefile.am
++++ b/xfce4-settings-manager/Makefile.am
+@@ -20,6 +20,7 @@ xfce4_settings_manager_CFLAGS = \
+ 	$(LIBXFCE4UTIL_CFLAGS) \
+ 	$(LIBXFCE4UI_CFLAGS) \
+ 	$(GARCON_CFLAGS) \
++	$(XFCONF_CFLAGS) \
+ 	$(EXO_CFLAGS) \
+ 	$(PLATFORM_CFLAGS)
+ 
+@@ -31,6 +32,7 @@ xfce4_settings_manager_LDADD = \
+ 	$(GTK_LIBS) \
+ 	$(LIBXFCE4UTIL_LIBS) \
+ 	$(LIBXFCE4UI_LIBS) \
++	$(XFCONF_LIBS) \
+ 	$(EXO_LIBS) \
+ 	$(GARCON_LIBS)
+ 
+diff --git a/xfce4-settings-manager/main.c b/xfce4-settings-manager/main.c
+index 3a65879..42bec66 100644
+--- a/xfce4-settings-manager/main.c
++++ b/xfce4-settings-manager/main.c
+@@ -28,6 +28,7 @@
+ #include <gtk/gtk.h>
+ #include <libxfce4util/libxfce4util.h>
+ #include <garcon/garcon.h>
++#include <xfconf/xfconf.h>
+ 
+ #include "xfce-settings-manager-dialog.h"
+ 
+@@ -79,6 +80,16 @@ main(int argc,
+         return EXIT_SUCCESS;
+     }
+ 
++    /* initialize xfconf */
++    if (G_UNLIKELY (!xfconf_init (&error)))
++    {
++        /* print error and leave */
++        g_critical ("Failed to connect to Xfconf daemon: %s", error->message);
++        g_error_free (error);
++
++        return EXIT_FAILURE;
++    }
++
+     garcon_set_environment ("XFCE");
+ 
+     dialog = xfce_settings_manager_dialog_new ();
+@@ -95,5 +106,7 @@ main(int argc,
+ 
+     gtk_main();
+ 
++    xfconf_shutdown ();
++
+     return EXIT_SUCCESS;
+ }
+diff --git a/xfce4-settings-manager/xfce-settings-manager-dialog.c b/xfce4-settings-manager/xfce-settings-manager-dialog.c
+index 043b143..39e33ff 100644
+--- a/xfce4-settings-manager/xfce-settings-manager-dialog.c
++++ b/xfce4-settings-manager/xfce-settings-manager-dialog.c
+@@ -35,6 +35,7 @@
+ 
+ #include <libxfce4util/libxfce4util.h>
+ #include <libxfce4ui/libxfce4ui.h>
++#include <xfconf/xfconf.h>
+ #include <garcon/garcon.h>
+ #include <exo/exo.h>
+ 
+@@ -55,6 +56,7 @@ struct _XfceSettingsManagerDialog
+ {
+     XfceTitledDialog __parent__;
+ 
++    XfconfChannel  *channel;
+     GarconMenu     *menu;
+ 
+     GtkListStore   *store;
+@@ -156,17 +158,19 @@ xfce_settings_manager_dialog_class_init (XfceSettingsManagerDialogClass *klass)
+ static void
+ xfce_settings_manager_dialog_init (XfceSettingsManagerDialog *dialog)
+ {
+-    GtkWidget *scroll;
++    GtkWidget *align;
++    GtkWidget *bbox;
+     GtkWidget *dialog_vbox;
+-    GtkWidget *viewport;
+-    gchar     *path;
+-    GtkWidget *hbox;
++    GtkWidget *ebox;
+     GtkWidget *entry;
+-    GtkWidget *align;
+-    GList     *children;
++    GtkWidget *hbox;
+     GtkWidget *header;
+-    GtkWidget *ebox;
+-    GtkWidget *bbox;
++    GtkWidget *scroll;
++    GtkWidget *viewport;
++    GList     *children;
++    gchar     *path;
++
++    dialog->channel = xfconf_channel_get ("xfce4-settings-manager");
+ 
+     dialog->store = gtk_list_store_new (N_COLUMNS,
+                                         G_TYPE_STRING,
+@@ -180,7 +184,9 @@ xfce_settings_manager_dialog_init (XfceSettingsManagerDialog *dialog)
+     dialog->menu = garcon_menu_new_for_path (path != NULL ? path : MENUFILE);
+     g_free (path);
+ 
+-    gtk_window_set_default_size (GTK_WINDOW (dialog), 640, 500);
++    gtk_window_set_default_size (GTK_WINDOW (dialog),
++      xfconf_channel_get_int (dialog->channel, "/last/window-width", 640),
++      xfconf_channel_get_int (dialog->channel, "/last/window-height", 500));
+     xfce_settings_manager_dialog_set_title (dialog, NULL, NULL, NULL);
+ 
+     dialog->button_back = xfce_gtk_button_new_mixed (GTK_STOCK_GO_BACK, _("All _Settings"));
+@@ -334,6 +340,20 @@ xfce_settings_manager_dialog_response (GtkDialog *widget,
+     }
+     else
+     {
++        GdkWindowState state;
++        gint           width, height;
++
++        /* Don't save the state for full-screen windows */
++        state = gdk_window_get_state (GTK_WIDGET (widget)->window);
++
++        if ((state & (GDK_WINDOW_STATE_MAXIMIZED | GDK_WINDOW_STATE_FULLSCREEN)) == 0)
++        {
++            /* Save window size */
++            gtk_window_get_size (GTK_WINDOW (widget), &width, &height);
++            xfconf_channel_set_int (dialog->channel, "/last/window-width", width),
++            xfconf_channel_set_int (dialog->channel, "/last/window-height", height);
++        }
++
+         gtk_widget_destroy (GTK_WIDGET (widget));
+         gtk_main_quit ();
+     }
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
index 9b6205b..aa878ae 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.10.0.bb
@@ -3,12 +3,13 @@ SECTION = "x11/wm"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 DEPENDS = "exo garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtual/libx11 xrandr libnotify libxcursor libxklavier"
-PR = "r2"
+PR = "r3"
 
 inherit xfce
 
 SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
             file://0002-xsettings.xml-Set-default-themes.patch \
+            file://0003-Remember-the-settings-manager-window-size-bug-9384.patch \
             file://touchscreen/invisible \
             file://touchscreen/wait \
             file://touchscreen/0001-add-cursor-theme-xfce-invisible.patch \
-- 
1.7.4.4



