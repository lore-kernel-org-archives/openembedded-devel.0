Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ee0-f41.google.com (mail-ee0-f41.google.com [74.125.83.41])
	by mail.openembedded.org (Postfix) with ESMTP id 0B25D6C872
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 09:04:36 +0000 (UTC)
Received: by mail-ee0-f41.google.com with SMTP id d17so1894636eek.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-type:content-transfer-encoding;
	bh=y/EoD9D2HDFHQqzNHx315/B5+5JY5R23p+eOKDy9AN4=;
	b=MEGMoGelyo1+RQJJGQQU/uH4UzHbY9ci+q3w4KQWtA6jvhA0sj08f98wpR9NELlVXg
	sWiajFxfxoUOt5x3dvuzjMQXHuVGXod90m6BT5Rqw3HRREIZK7rTpIN9j9U34y3+hVXv
	0tMNEdseyG4e8GSx7cy7x3+JXqMPXOglTFsd5LiDRAJWAzqO2R19YSR5G58EDGTAGaEu
	rk3pTIToM3V0HMw2AX0qIGORTEg841ROve2sHFuAYGpmObDpvZj/KGTYbXw52Ve7YkwG
	yqKR5TfT7gNQqVmvErhPw9/DQSnqwuyYj7lhB/xNcwgiEq8LF8T9s0CKk82a9pA18azU
	71LQ==
X-Received: by 10.15.76.73 with SMTP id m49mr654750eey.91.1379322278553;
	Mon, 16 Sep 2013 02:04:38 -0700 (PDT)
Received: from localhost.localdomain (ip-178-200-247-59.unitymediagroup.de.
	[178.200.247.59])
	by mx.google.com with ESMTPSA id f49sm40119433eec.7.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 16 Sep 2013 02:04:37 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:04:15 +0200
Message-Id: <1379322259-3831-6-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
References: <1379322259-3831-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-oe/meta-xfce 5/9] xfce4-settings: move to schnitzeltony's git repo to get new datetime setter
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 16 Sep 2013 09:04:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I implemented a datetime setting dialog based on gnome-control-center and
submitted a pull-request in [1,2]. As long as it is not submitted - or as long
as I find no way to patch binary files (e.g. icons - I asked for that in [3] -
no response yet) we use the git repo and a copied branch of the pull-request
(just in case some feedback from xfce-devels requires modifcations).

Some patches had to be modified/removed to apply against mainline HEAD still.
Furthermore in 0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
label 'alignment8' was introduced mainline and we do not need mouse-dialog_ui.h
when building from git in maintainer-mode - this file is created during build
process.

[1] http://mail.xfce.org/pipermail/xfce4-dev/2013-September/030442.html
[2] https://bugzilla.xfce.org/show_bug.cgi?id=10354
[3] http://lists.openembedded.org/pipermail/openembedded-core/2013-September/083804.html

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...the-settings-manager-window-size-bug-9384.patch |  155 ---
 .../0001-add-cursor-theme-xfce-invisible.patch     |    8 +-
 ...ngs-dialog-add-touchscreen-pointer-option.patch | 1083 +-------------------
 ...tect-a-change-of-pointer-device-used-and-.patch |   10 +-
 ...e4-settings_4.11.0.bb => xfce4-settings_git.bb} |   23 +-
 5 files changed, 30 insertions(+), 1249 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
 rename meta-xfce/recipes-xfce/xfce4-settings/{xfce4-settings_4.11.0.bb => xfce4-settings_git.bb} (64%)

diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
deleted file mode 100644
index 8c1d1d9..0000000
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/0003-Remember-the-settings-manager-window-size-bug-9384.patch
+++ /dev/null
@@ -1,155 +0,0 @@
-From b3b1986327b9b42ac6f9442443ff103f6565a323 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Guelfucci?= <jeromeg@xfce.org>
-Date: Wed, 19 Dec 2012 09:53:58 +0100
-Subject: [PATCH] Remember the settings manager window size (bug #9384).
-
-Handy with pluggable dialogs, allows the user to get rid of most of the
-scrollbars.
-
-Upstream-Status: applied
----
- xfce4-settings-manager/Makefile.am                 |    2 +
- xfce4-settings-manager/main.c                      |   13 +++++++
- .../xfce-settings-manager-dialog.c                 |   38 +++++++++++++++-----
- 3 files changed, 44 insertions(+), 9 deletions(-)
-
-diff --git a/xfce4-settings-manager/Makefile.am b/xfce4-settings-manager/Makefile.am
-index c6bdc2d..99f9b3f 100644
---- a/xfce4-settings-manager/Makefile.am
-+++ b/xfce4-settings-manager/Makefile.am
-@@ -20,6 +20,7 @@ xfce4_settings_manager_CFLAGS = \
- 	$(LIBXFCE4UTIL_CFLAGS) \
- 	$(LIBXFCE4UI_CFLAGS) \
- 	$(GARCON_CFLAGS) \
-+	$(XFCONF_CFLAGS) \
- 	$(EXO_CFLAGS) \
- 	$(PLATFORM_CFLAGS)
- 
-@@ -31,6 +32,7 @@ xfce4_settings_manager_LDADD = \
- 	$(GTK_LIBS) \
- 	$(LIBXFCE4UTIL_LIBS) \
- 	$(LIBXFCE4UI_LIBS) \
-+	$(XFCONF_LIBS) \
- 	$(EXO_LIBS) \
- 	$(GARCON_LIBS)
- 
-diff --git a/xfce4-settings-manager/main.c b/xfce4-settings-manager/main.c
-index 3a65879..42bec66 100644
---- a/xfce4-settings-manager/main.c
-+++ b/xfce4-settings-manager/main.c
-@@ -28,6 +28,7 @@
- #include <gtk/gtk.h>
- #include <libxfce4util/libxfce4util.h>
- #include <garcon/garcon.h>
-+#include <xfconf/xfconf.h>
- 
- #include "xfce-settings-manager-dialog.h"
- 
-@@ -79,6 +80,16 @@ main(int argc,
-         return EXIT_SUCCESS;
-     }
- 
-+    /* initialize xfconf */
-+    if (G_UNLIKELY (!xfconf_init (&error)))
-+    {
-+        /* print error and leave */
-+        g_critical ("Failed to connect to Xfconf daemon: %s", error->message);
-+        g_error_free (error);
-+
-+        return EXIT_FAILURE;
-+    }
-+
-     garcon_set_environment ("XFCE");
- 
-     dialog = xfce_settings_manager_dialog_new ();
-@@ -95,5 +106,7 @@ main(int argc,
- 
-     gtk_main();
- 
-+    xfconf_shutdown ();
-+
-     return EXIT_SUCCESS;
- }
-diff --git a/xfce4-settings-manager/xfce-settings-manager-dialog.c b/xfce4-settings-manager/xfce-settings-manager-dialog.c
-index 043b143..39e33ff 100644
---- a/xfce4-settings-manager/xfce-settings-manager-dialog.c
-+++ b/xfce4-settings-manager/xfce-settings-manager-dialog.c
-@@ -35,6 +35,7 @@
- 
- #include <libxfce4util/libxfce4util.h>
- #include <libxfce4ui/libxfce4ui.h>
-+#include <xfconf/xfconf.h>
- #include <garcon/garcon.h>
- #include <exo/exo.h>
- 
-@@ -55,6 +56,7 @@ struct _XfceSettingsManagerDialog
- {
-     XfceTitledDialog __parent__;
- 
-+    XfconfChannel  *channel;
-     GarconMenu     *menu;
- 
-     GtkListStore   *store;
-@@ -156,17 +158,19 @@ xfce_settings_manager_dialog_class_init (XfceSettingsManagerDialogClass *klass)
- static void
- xfce_settings_manager_dialog_init (XfceSettingsManagerDialog *dialog)
- {
--    GtkWidget *scroll;
-+    GtkWidget *align;
-+    GtkWidget *bbox;
-     GtkWidget *dialog_vbox;
--    GtkWidget *viewport;
--    gchar     *path;
--    GtkWidget *hbox;
-+    GtkWidget *ebox;
-     GtkWidget *entry;
--    GtkWidget *align;
--    GList     *children;
-+    GtkWidget *hbox;
-     GtkWidget *header;
--    GtkWidget *ebox;
--    GtkWidget *bbox;
-+    GtkWidget *scroll;
-+    GtkWidget *viewport;
-+    GList     *children;
-+    gchar     *path;
-+
-+    dialog->channel = xfconf_channel_get ("xfce4-settings-manager");
- 
-     dialog->store = gtk_list_store_new (N_COLUMNS,
-                                         G_TYPE_STRING,
-@@ -180,7 +184,9 @@ xfce_settings_manager_dialog_init (XfceSettingsManagerDialog *dialog)
-     dialog->menu = garcon_menu_new_for_path (path != NULL ? path : MENUFILE);
-     g_free (path);
- 
--    gtk_window_set_default_size (GTK_WINDOW (dialog), 640, 500);
-+    gtk_window_set_default_size (GTK_WINDOW (dialog),
-+      xfconf_channel_get_int (dialog->channel, "/last/window-width", 640),
-+      xfconf_channel_get_int (dialog->channel, "/last/window-height", 500));
-     xfce_settings_manager_dialog_set_title (dialog, NULL, NULL, NULL);
- 
-     dialog->button_back = xfce_gtk_button_new_mixed (GTK_STOCK_GO_BACK, _("All _Settings"));
-@@ -334,6 +340,20 @@ xfce_settings_manager_dialog_response (GtkDialog *widget,
-     }
-     else
-     {
-+        GdkWindowState state;
-+        gint           width, height;
-+
-+        /* Don't save the state for full-screen windows */
-+        state = gdk_window_get_state (GTK_WIDGET (widget)->window);
-+
-+        if ((state & (GDK_WINDOW_STATE_MAXIMIZED | GDK_WINDOW_STATE_FULLSCREEN)) == 0)
-+        {
-+            /* Save window size */
-+            gtk_window_get_size (GTK_WINDOW (widget), &width, &height);
-+            xfconf_channel_set_int (dialog->channel, "/last/window-width", width),
-+            xfconf_channel_set_int (dialog->channel, "/last/window-height", height);
-+        }
-+
-         gtk_widget_destroy (GTK_WIDGET (widget));
-         gtk_main_quit ();
-     }
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
index 9272081..4d8e01d 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0001-add-cursor-theme-xfce-invisible.patch
@@ -11,7 +11,7 @@ Upstream-Status: Submitted [1]
 [1] https://bugzilla.xfce.org/show_bug.cgi?id=9474
 ---
  Makefile.am         |    1 +
- configure.ac        |    2 +
+ configure.ac.in        |    2 +
  cursors/Makefile.am |  178 +++++++++++++++++++++++++++++++++++++++++++++++++++
  cursors/index.theme |    3 +
  6 files changed, 184 insertions(+), 0 deletions(-)
@@ -30,10 +30,10 @@ index 3060bac..3f0dd1d 100644
  	dialogs \
  	xfce4-settings-manager \
  	xfce4-settings-editor \
-diff --git a/configure.ac b/configure.ac
+diff --git a/configure.ac.in b/configure.ac.in
 index 0e7907d..1378049 100644
---- a/configure.ac
-+++ b/configure.ac
+--- a/configure.ac.in
++++ b/configure.ac.in
 @@ -157,6 +157,7 @@ dnl *** Optional support for Xcursor ***
  dnl ************************************
  XDT_CHECK_OPTIONAL_PACKAGE([XCURSOR], [xcursor], [1.1.0],
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
index d5a1f2c..cf58f73 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0002-mouse-settings-dialog-add-touchscreen-pointer-option.patch
@@ -13,7 +13,6 @@ Upstream-Status: Submitted [1]
 ---
  dialogs/mouse-settings/main.c             |   56 +++++++++++++++++++++++++++++
  dialogs/mouse-settings/mouse-dialog.glade |   28 ++++++++++++++-
- dialogs/mouse-settings/mouse-dialog_ui.h  | 1056 +++++++++++++++---------------
  3 files changed, 422 insertions(+), 329 deletions(-)
 
 diff --git a/dialogs/mouse-settings/main.c b/dialogs/mouse-settings/main.c
@@ -120,7 +119,7 @@ index d3aab0d..573c551 100644
                                        </packing>
                                      </child>
 +                                    <child>
-+                                      <object class="GtkAlignment" id="alignment8">
++                                      <object class="GtkAlignment" id="alignment9">
 +                                        <property name="visible">True</property>
 +                                        <property name="can_focus">False</property>
 +                                        <property name="xalign">0</property>
@@ -148,1086 +147,6 @@ index d3aab0d..573c551 100644
                                    </object>
                                  </child>
                                </object>
-diff --git a/dialogs/mouse-settings/mouse-dialog_ui.h b/dialogs/mouse-settings/mouse-dialog_ui.h
-index 59806a2..8a68c3b 100644
---- a/dialogs/mouse-settings/mouse-dialog_ui.h
-+++ b/dialogs/mouse-settings/mouse-dialog_ui.h
-@@ -31,540 +31,555 @@ static const char mouse_dialog_ui[] =
-   "</property></object><object class=\"GtkImage\" id=\"image5\"><property "
-   "name=\"visible\">True</property><property name=\"can_focus\">False</pro"
-   "perty><property name=\"stock\">gtk-revert-to-saved</property></object><"
--  "object class=\"XfceTitledDialog\" id=\"mouse-dialog\"><property name=\""
--  "can_focus\">False</property><property name=\"title\" translatable=\"yes"
--  "\">Mouse and Touchpad</property><property name=\"window_position\">cent"
--  "er-on-parent</property><property name=\"icon_name\">preferences-desktop"
--  "-peripherals</property><property name=\"type_hint\">dialog</property><p"
--  "roperty name=\"subtitle\" translatable=\"yes\">Configure pointer device"
--  " behavior and appearance</property><child internal-child=\"vbox\"><obje"
--  "ct class=\"GtkVBox\" id=\"dialog-vbox1\"><property name=\"visible\">Tru"
--  "e</property><property name=\"can_focus\">False</property><property name"
--  "=\"spacing\">2</property><child internal-child=\"action_area\"><object "
--  "class=\"GtkHButtonBox\" id=\"dialog-action_area1\"><property name=\"vis"
--  "ible\">True</property><property name=\"can_focus\">False</property><pro"
--  "perty name=\"layout_style\">end</property><child><object class=\"GtkBut"
--  "ton\" id=\"button1\"><property name=\"label\">gtk-close</property><prop"
--  "erty name=\"visible\">True</property><property name=\"can_focus\">True<"
--  "/property><property name=\"receives_default\">True</property><property "
--  "name=\"use_action_appearance\">False</property><property name=\"use_sto"
--  "ck\">True</property></object><packing><property name=\"expand\">False</"
--  "property><property name=\"fill\">False</property><property name=\"posit"
--  "ion\">0</property></packing></child><child><object class=\"GtkButton\" "
--  "id=\"button2\"><property name=\"label\">gtk-help</property><property na"
--  "me=\"use_action_appearance\">False</property><property name=\"visible\""
--  ">True</property><property name=\"can_focus\">True</property><property n"
--  "ame=\"receives_default\">True</property><property name=\"use_stock\">Tr"
--  "ue</property></object><packing><property name=\"expand\">False</propert"
--  "y><property name=\"fill\">False</property><property name=\"position\">0"
--  "</property><property name=\"secondary\">True</property></packing></chil"
--  "d></object><packing><property name=\"expand\">False</property><property"
--  " name=\"fill\">True</property><property name=\"pack_type\">end</propert"
--  "y><property name=\"position\">0</property></packing></child><child><obj"
--  "ect class=\"GtkNotebook\" id=\"plug-child\"><property name=\"visible\">"
--  "True</property><property name=\"can_focus\">True</property><property na"
--  "me=\"border_width\">6</property><child><object class=\"GtkVBox\" id=\"v"
--  "box1\"><property name=\"visible\">True</property><property name=\"can_f"
--  "ocus\">False</property><property name=\"border_width\">12</property><pr"
--  "operty name=\"spacing\">6</property><child><object class=\"GtkHBox\" id"
--  "=\"hbox1\"><property name=\"visible\">True</property><property name=\"c"
--  "an_focus\">False</property><property name=\"spacing\">12</property><chi"
--  "ld><object class=\"GtkLabel\" id=\"label7\"><property name=\"visible\">"
--  "True</property><property name=\"can_focus\">False</property><property n"
--  "ame=\"label\" translatable=\"yes\">De_vice:</property><property name=\""
--  "use_underline\">True</property><property name=\"mnemonic_widget\">devic"
--  "e-combobox</property><property name=\"angle\">0.050000000000000003</pro"
--  "perty></object><packing><property name=\"expand\">False</property><prop"
--  "erty name=\"fill\">True</property><property name=\"position\">0</proper"
--  "ty></packing></child><child><object class=\"GtkComboBox\" id=\"device-c"
--  "ombobox\"><property name=\"visible\">True</property><property name=\"ca"
--  "n_focus\">False</property></object><packing><property name=\"expand\">T"
--  "rue</property><property name=\"fill\">True</property><property name=\"p"
--  "osition\">1</property></packing></child></object><packing><property nam"
--  "e=\"expand\">False</property><property name=\"fill\">True</property><pr"
--  "operty name=\"position\">0</property></packing></child><child><object c"
--  "lass=\"GtkCheckButton\" id=\"device-enabled\"><property name=\"label\" "
--  "translatable=\"yes\">_Enable this device</property><property name=\"vis"
--  "ible\">True</property><property name=\"can_focus\">True</property><prop"
--  "erty name=\"receives_default\">False</property><property name=\"use_act"
--  "ion_appearance\">False</property><property name=\"use_underline\">True<"
--  "/property><property name=\"draw_indicator\">True</property></object><pa"
--  "cking><property name=\"expand\">False</property><property name=\"fill\""
--  ">True</property><property name=\"position\">1</property></packing></chi"
--  "ld><child><object class=\"GtkNotebook\" id=\"device-notebook\"><propert"
--  "y name=\"visible\">True</property><property name=\"can_focus\">True</pr"
--  "operty><child><object class=\"GtkVBox\" id=\"device-box\"><property nam"
--  "e=\"visible\">True</property><property name=\"can_focus\">False</proper"
--  "ty><property name=\"border_width\">6</property><property name=\"spacing"
--  "\">6</property><child><object class=\"GtkFrame\" id=\"frame1\"><propert"
--  "y name=\"visible\">True</property><property name=\"can_focus\">False</p"
--  "roperty><property name=\"label_xalign\">0</property><property name=\"sh"
--  "adow_type\">none</property><child><object class=\"GtkAlignment\" id=\"a"
--  "lignment1\"><property name=\"visible\">True</property><property name=\""
--  "can_focus\">False</property><property name=\"left_padding\">12</propert"
--  "y><child><object class=\"GtkVBox\" id=\"vbox12\"><property name=\"visib"
--  "le\">True</property><property name=\"can_focus\">False</property><prope"
--  "rty name=\"border_width\">6</property><property name=\"spacing\">6</pro"
--  "perty><child><object class=\"GtkHBox\" id=\"hbox3\"><property name=\"vi"
--  "sible\">True</property><property name=\"can_focus\">False</property><pr"
--  "operty name=\"spacing\">12</property><child><object class=\"GtkRadioBut"
--  "ton\" id=\"device-right-handed\"><property name=\"label\" translatable="
--  "\"yes\">_Right-handed</property><property name=\"visible\">True</proper"
--  "ty><property name=\"can_focus\">True</property><property name=\"receive"
--  "s_default\">False</property><property name=\"use_action_appearance\">Fa"
--  "lse</property><property name=\"use_underline\">True</property><property"
--  " name=\"active\">True</property><property name=\"draw_indicator\">True<"
--  "/property></object><packing><property name=\"expand\">False</property><"
--  "property name=\"fill\">True</property><property name=\"position\">0</pr"
--  "operty></packing></child><child><object class=\"GtkRadioButton\" id=\"d"
--  "evice-left-handed\"><property name=\"label\" translatable=\"yes\">_Left"
--  "-handed</property><property name=\"visible\">True</property><property n"
--  "ame=\"can_focus\">True</property><property name=\"receives_default\">Fa"
--  "lse</property><property name=\"use_action_appearance\">False</property>"
--  "<property name=\"use_underline\">True</property><property name=\"draw_i"
--  "ndicator\">True</property><property name=\"group\">device-right-handed<"
--  "/property></object><packing><property name=\"expand\">False</property><"
--  "property name=\"fill\">True</property><property name=\"position\">1</pr"
--  "operty></packing></child></object><packing><property name=\"expand\">Tr"
--  "ue</property><property name=\"fill\">True</property><property name=\"po"
--  "sition\">0</property></packing></child><child><object class=\"GtkCheckB"
--  "utton\" id=\"device-reverse-scrolling\"><property name=\"label\" transl"
--  "atable=\"yes\">Reverse scroll d_irection</property><property name=\"vis"
--  "ible\">True</property><property name=\"can_focus\">True</property><prop"
--  "erty name=\"receives_default\">False</property><property name=\"tooltip"
--  "_text\" translatable=\"yes\">When selected, the scroll wheel will work "
--  "in the opposite direction</property><property name=\"use_action_appeara"
--  "nce\">False</property><property name=\"use_underline\">True</property><"
--  "property name=\"draw_indicator\">True</property></object><packing><prop"
--  "erty name=\"expand\">True</property><property name=\"fill\">True</prope"
--  "rty><property name=\"position\">1</property></packing></child></object>"
--  "</child></object></child><child type=\"label\"><object class=\"GtkLabel"
--  "\" id=\"label14\"><property name=\"visible\">True</property><property n"
--  "ame=\"can_focus\">False</property><property name=\"label\" translatable"
--  "=\"yes\">Buttons</property><attributes><attribute name=\"weight\" value"
--  "=\"bold\"/></attributes></object></child></object><packing><property na"
--  "me=\"expand\">False</property><property name=\"fill\">True</property><p"
--  "roperty name=\"position\">0</property></packing></child><child><object "
--  "class=\"GtkFrame\" id=\"frame2\"><property name=\"visible\">True</prope"
--  "rty><property name=\"can_focus\">False</property><property name=\"label"
--  "_xalign\">0</property><property name=\"shadow_type\">none</property><ch"
--  "ild><object class=\"GtkAlignment\" id=\"alignment2\"><property name=\"v"
-+  "object class=\"GtkListStore\" id=\"synaptics-scroll-store\"><columns><c"
-+  "olumn type=\"gchararray\"/><column type=\"gboolean\"/></columns><data><"
-+  "row><col id=\"0\" translatable=\"yes\">Disabled</col><col id=\"1\">True"
-+  "</col></row><row><col id=\"0\" translatable=\"yes\">Edge scrolling</col"
-+  "><col id=\"1\">True</col></row><row><col id=\"0\" translatable=\"yes\">"
-+  "Two-finger scrolling</col><col id=\"1\">True</col></row><row><col id=\""
-+  "0\" translatable=\"yes\">Circular scrolling</col><col id=\"1\">True</co"
-+  "l></row></data></object><object class=\"GtkAdjustment\" id=\"theme-curs"
-+  "or-size\"><property name=\"lower\">16</property><property name=\"upper\""
-+  ">48</property><property name=\"value\">24</property><property name=\"st"
-+  "ep_increment\">1</property><property name=\"page_increment\">11</proper"
-+  "ty></object><object class=\"XfceTitledDialog\" id=\"mouse-dialog\"><pro"
-+  "perty name=\"can_focus\">False</property><property name=\"title\" trans"
-+  "latable=\"yes\">Mouse and Touchpad</property><property name=\"window_po"
-+  "sition\">center-on-parent</property><property name=\"icon_name\">prefer"
-+  "ences-desktop-peripherals</property><property name=\"type_hint\">dialog"
-+  "</property><property name=\"subtitle\" translatable=\"yes\">Configure p"
-+  "ointer device behavior and appearance</property><child internal-child=\""
-+  "vbox\"><object class=\"GtkVBox\" id=\"dialog-vbox1\"><property name=\"v"
-   "isible\">True</property><property name=\"can_focus\">False</property><p"
--  "roperty name=\"left_padding\">12</property><child><object class=\"GtkTa"
--  "ble\" id=\"table1\"><property name=\"visible\">True</property><property"
--  " name=\"can_focus\">False</property><property name=\"border_width\">6</"
--  "property><property name=\"n_rows\">3</property><property name=\"n_colum"
--  "ns\">2</property><property name=\"column_spacing\">12</property><proper"
--  "ty name=\"row_spacing\">6</property><child><object class=\"GtkLabel\" i"
--  "d=\"device-acceleration-label\"><property name=\"visible\">True</proper"
--  "ty><property name=\"can_focus\">False</property><property name=\"xalign"
--  "\">0</property><property name=\"label\" translatable=\"yes\">_Accelerat"
--  "ion:</property><property name=\"use_underline\">True</property><propert"
--  "y name=\"mnemonic_widget\">device-acceleration-scale</property></object"
--  "><packing><property name=\"x_options\">GTK_FILL</property><property nam"
--  "e=\"y_options\">GTK_FILL</property></packing></child><child><object cla"
--  "ss=\"GtkHScale\" id=\"device-acceleration-scale\"><property name=\"visi"
--  "ble\">True</property><property name=\"can_focus\">True</property><prope"
--  "rty name=\"tooltip_text\" translatable=\"yes\">The factor at which the "
--  "pointer\'s speed will increase as the mouse is moved</property><propert"
--  "y name=\"update_policy\">delayed</property><property name=\"adjustment\""
--  ">device-acceleration</property><property name=\"round_digits\">1</prope"
--  "rty><property name=\"value_pos\">right</property></object><packing><pro"
--  "perty name=\"left_attach\">1</property><property name=\"right_attach\">"
--  "2</property></packing></child><child><object class=\"GtkHScale\" id=\"d"
--  "evice-threshold-scale\"><property name=\"visible\">True</property><prop"
--  "erty name=\"can_focus\">True</property><property name=\"tooltip_text\" "
--  "translatable=\"yes\">The number of pixels the pointer must move in a sh"
--  "ort time before it starts accelerating</property><property name=\"updat"
--  "e_policy\">delayed</property><property name=\"adjustment\">device-thres"
--  "hold</property><property name=\"round_digits\">0</property><property na"
--  "me=\"digits\">0</property><property name=\"value_pos\">right</property>"
--  "</object><packing><property name=\"left_attach\">1</property><property "
--  "name=\"right_attach\">2</property><property name=\"top_attach\">1</prop"
--  "erty><property name=\"bottom_attach\">2</property></packing></child><ch"
--  "ild><object class=\"GtkLabel\" id=\"device-threshold-label\"><property "
-+  "roperty name=\"spacing\">2</property><child internal-child=\"action_are"
-+  "a\"><object class=\"GtkHButtonBox\" id=\"dialog-action_area1\"><propert"
-+  "y name=\"visible\">True</property><property name=\"can_focus\">False</p"
-+  "roperty><property name=\"layout_style\">end</property><child><object cl"
-+  "ass=\"GtkButton\" id=\"button2\"><property name=\"label\">gtk-help</pro"
-+  "perty><property name=\"use_action_appearance\">False</property><propert"
-+  "y name=\"visible\">True</property><property name=\"can_focus\">True</pr"
-+  "operty><property name=\"receives_default\">True</property><property nam"
-+  "e=\"use_stock\">True</property></object><packing><property name=\"expan"
-+  "d\">False</property><property name=\"fill\">False</property><property n"
-+  "ame=\"position\">0</property><property name=\"secondary\">True</propert"
-+  "y></packing></child><child><object class=\"GtkButton\" id=\"button1\"><"
-+  "property name=\"label\">gtk-close</property><property name=\"use_action"
-+  "_appearance\">False</property><property name=\"visible\">True</property"
-+  "><property name=\"can_focus\">True</property><property name=\"receives_"
-+  "default\">True</property><property name=\"use_stock\">True</property></"
-+  "object><packing><property name=\"expand\">False</property><property nam"
-+  "e=\"fill\">False</property><property name=\"position\">0</property></pa"
-+  "cking></child></object><packing><property name=\"expand\">False</proper"
-+  "ty><property name=\"fill\">True</property><property name=\"pack_type\">"
-+  "end</property><property name=\"position\">0</property></packing></child"
-+  "><child><object class=\"GtkNotebook\" id=\"plug-child\"><property name="
-+  "\"visible\">True</property><property name=\"can_focus\">True</property>"
-+  "<property name=\"border_width\">6</property><child><object class=\"GtkV"
-+  "Box\" id=\"vbox1\"><property name=\"visible\">True</property><property "
-+  "name=\"can_focus\">False</property><property name=\"border_width\">12</"
-+  "property><property name=\"spacing\">6</property><child><object class=\""
-+  "GtkHBox\" id=\"hbox1\"><property name=\"visible\">True</property><prope"
-+  "rty name=\"can_focus\">False</property><property name=\"spacing\">12</p"
-+  "roperty><child><object class=\"GtkLabel\" id=\"label7\"><property name="
-+  "\"visible\">True</property><property name=\"can_focus\">False</property"
-+  "><property name=\"label\" translatable=\"yes\">De_vice:</property><prop"
-+  "erty name=\"use_underline\">True</property><property name=\"mnemonic_wi"
-+  "dget\">device-combobox</property><property name=\"angle\">0.05000000000"
-+  "0000003</property></object><packing><property name=\"expand\">False</pr"
-+  "operty><property name=\"fill\">True</property><property name=\"position"
-+  "\">0</property></packing></child><child><object class=\"GtkComboBox\" i"
-+  "d=\"device-combobox\"><property name=\"visible\">True</property><proper"
-+  "ty name=\"can_focus\">False</property></object><packing><property name="
-+  "\"expand\">True</property><property name=\"fill\">True</property><prope"
-+  "rty name=\"position\">1</property></packing></child></object><packing><"
-+  "property name=\"expand\">False</property><property name=\"fill\">True</"
-+  "property><property name=\"position\">0</property></packing></child><chi"
-+  "ld><object class=\"GtkCheckButton\" id=\"device-enabled\"><property nam"
-+  "e=\"label\" translatable=\"yes\">_Enable this device</property><propert"
-+  "y name=\"use_action_appearance\">False</property><property name=\"visib"
-+  "le\">True</property><property name=\"can_focus\">True</property><proper"
-+  "ty name=\"receives_default\">False</property><property name=\"use_under"
-+  "line\">True</property><property name=\"draw_indicator\">True</property>"
-+  "</object><packing><property name=\"expand\">False</property><property n"
-+  "ame=\"fill\">True</property><property name=\"position\">1</property></p"
-+  "acking></child><child><object class=\"GtkNotebook\" id=\"device-noteboo"
-+  "k\"><property name=\"visible\">True</property><property name=\"can_focu"
-+  "s\">True</property><child><object class=\"GtkVBox\" id=\"device-box\"><"
-+  "property name=\"visible\">True</property><property name=\"can_focus\">F"
-+  "alse</property><property name=\"border_width\">6</property><property na"
-+  "me=\"spacing\">6</property><child><object class=\"GtkFrame\" id=\"frame"
-+  "1\"><property name=\"visible\">True</property><property name=\"can_focu"
-+  "s\">False</property><property name=\"label_xalign\">0</property><proper"
-+  "ty name=\"shadow_type\">none</property><child><object class=\"GtkAlignm"
-+  "ent\" id=\"alignment1\"><property name=\"visible\">True</property><prop"
-+  "erty name=\"can_focus\">False</property><property name=\"left_padding\""
-+  ">12</property><child><object class=\"GtkVBox\" id=\"vbox12\"><property "
-   "name=\"visible\">True</property><property name=\"can_focus\">False</pro"
--  "perty><property name=\"xalign\">0</property><property name=\"label\" tr"
--  "anslatable=\"yes\">_Sensitivity:</property><property name=\"use_underli"
--  "ne\">True</property><property name=\"mnemonic_widget\">device-threshold"
--  "-scale</property></object><packing><property name=\"top_attach\">1</pro"
--  "perty><property name=\"bottom_attach\">2</property><property name=\"x_o"
--  "ptions\">GTK_FILL</property></packing></child><child><object class=\"Gt"
--  "kAlignment\" id=\"alignment7\"><property name=\"visible\">True</propert"
--  "y><property name=\"can_focus\">False</property><property name=\"xalign\""
--  ">0</property><property name=\"xscale\">0</property><property name=\"ysc"
--  "ale\">0</property><child><object class=\"GtkButton\" id=\"device-reset-"
--  "feedback\"><property name=\"label\" translatable=\"yes\">Reset to De_fa"
--  "ults</property><property name=\"visible\">True</property><property name"
--  "=\"can_focus\">True</property><property name=\"receives_default\">True<"
--  "/property><property name=\"tooltip_text\" translatable=\"yes\">Set the "
--  "acceleration and sensitivity for the selected device to the default val"
--  "ues</property><property name=\"use_action_appearance\">False</property>"
--  "<property name=\"image\">image5</property><property name=\"use_underlin"
--  "e\">True</property></object></child></object><packing><property name=\""
--  "right_attach\">2</property><property name=\"top_attach\">2</property><p"
--  "roperty name=\"bottom_attach\">3</property></packing></child></object><"
--  "/child></object></child><child type=\"label\"><object class=\"GtkLabel\""
--  " id=\"label15\"><property name=\"visible\">True</property><property nam"
--  "e=\"can_focus\">False</property><property name=\"label\" translatable=\""
--  "yes\">Pointer Speed</property><attributes><attribute name=\"weight\" va"
--  "lue=\"bold\"/></attributes></object></child></object><packing><property"
--  " name=\"expand\">False</property><property name=\"fill\">True</property"
--  "><property name=\"position\">1</property></packing></child></object></c"
--  "hild><child type=\"tab\"><object class=\"GtkLabel\" id=\"label4\"><prop"
--  "erty name=\"visible\">True</property><property name=\"can_focus\">False"
--  "</property><property name=\"label\" translatable=\"yes\">B_uttons and F"
--  "eedback</property><property name=\"use_underline\">True</property></obj"
--  "ect><packing><property name=\"tab_fill\">False</property></packing></ch"
--  "ild><child><object class=\"GtkVBox\" id=\"synaptics-tab\"><property nam"
--  "e=\"visible\">True</property><property name=\"can_focus\">False</proper"
--  "ty><property name=\"border_width\">6</property><property name=\"spacing"
--  "\">6</property><child><object class=\"GtkFrame\" id=\"frame11\"><proper"
-+  "perty><property name=\"border_width\">6</property><property name=\"spac"
-+  "ing\">6</property><child><object class=\"GtkHBox\" id=\"hbox3\"><proper"
-   "ty name=\"visible\">True</property><property name=\"can_focus\">False</"
--  "property><property name=\"label_xalign\">0</property><property name=\"s"
--  "hadow_type\">none</property><child><object class=\"GtkAlignment\" id=\""
--  "alignment13\"><property name=\"visible\">True</property><property name="
--  "\"can_focus\">False</property><property name=\"left_padding\">12</prope"
--  "rty><child><object class=\"GtkVBox\" id=\"vbox11\"><property name=\"vis"
--  "ible\">True</property><property name=\"can_focus\">False</property><pro"
--  "perty name=\"border_width\">6</property><property name=\"spacing\">6</p"
--  "roperty><child><object class=\"GtkCheckButton\" id=\"synaptics-disable-"
--  "while-type\"><property name=\"label\" translatable=\"yes\">Disable to_u"
--  "chpad while typing</property><property name=\"visible\">True</property>"
-+  "property><property name=\"spacing\">12</property><child><object class=\""
-+  "GtkRadioButton\" id=\"device-right-handed\"><property name=\"label\" tr"
-+  "anslatable=\"yes\">Ri_ght-handed</property><property name=\"use_action_"
-+  "appearance\">False</property><property name=\"visible\">True</property>"
-   "<property name=\"can_focus\">True</property><property name=\"receives_d"
--  "efault\">False</property><property name=\"tooltip_text\" translatable=\""
--  "yes\">When selected, the touchpad will be disabled when the keyboard is"
--  " being used</property><property name=\"use_action_appearance\">False</p"
--  "roperty><property name=\"use_underline\">True</property><property name="
--  "\"draw_indicator\">True</property></object><packing><property name=\"ex"
--  "pand\">True</property><property name=\"fill\">True</property><property "
--  "name=\"position\">0</property></packing></child><child><object class=\""
--  "GtkCheckButton\" id=\"synaptics-tap-to-click\"><property name=\"label\""
--  " translatable=\"yes\">T_ap touchpad to click</property><property name=\""
--  "visible\">True</property><property name=\"can_focus\">True</property><p"
--  "roperty name=\"receives_default\">False</property><property name=\"use_"
--  "action_appearance\">False</property><property name=\"use_underline\">Tr"
--  "ue</property><property name=\"draw_indicator\">True</property></object>"
--  "<packing><property name=\"expand\">True</property><property name=\"fill"
--  "\">True</property><property name=\"position\">1</property></packing></c"
--  "hild></object></child></object></child><child type=\"label\"><object cl"
--  "ass=\"GtkLabel\" id=\"label16\"><property name=\"visible\">True</proper"
--  "ty><property name=\"can_focus\">False</property><property name=\"label\""
--  " translatable=\"yes\">General</property><property name=\"use_markup\">T"
--  "rue</property><attributes><attribute name=\"weight\" value=\"bold\"/></"
--  "attributes></object></child></object><packing><property name=\"expand\""
--  ">False</property><property name=\"fill\">True</property><property name="
--  "\"position\">0</property></packing></child><child><object class=\"GtkFr"
--  "ame\" id=\"frame10\"><property name=\"visible\">True</property><propert"
--  "y name=\"can_focus\">False</property><property name=\"label_xalign\">0<"
--  "/property><property name=\"shadow_type\">none</property><child><object "
--  "class=\"GtkAlignment\" id=\"alignment12\"><property name=\"visible\">Tr"
--  "ue</property><property name=\"can_focus\">False</property><property nam"
--  "e=\"left_padding\">12</property><child><object class=\"GtkVBox\" id=\"v"
--  "box10\"><property name=\"visible\">True</property><property name=\"can_"
--  "focus\">False</property><property name=\"border_width\">6</property><pr"
--  "operty name=\"spacing\">6</property><child><object class=\"GtkHBox\" id"
--  "=\"hbox4\"><property name=\"visible\">True</property><property name=\"c"
--  "an_focus\">False</property><property name=\"spacing\">12</property><chi"
--  "ld><object class=\"GtkLabel\" id=\"label23\"><property name=\"visible\""
--  ">True</property><property name=\"can_focus\">False</property><property "
--  "name=\"xalign\">0</property><property name=\"label\" translatable=\"yes"
--  "\">Scro_lling mode:</property><property name=\"use_underline\">True</pr"
--  "operty><property name=\"mnemonic_widget\">synaptics-scroll</property></"
--  "object><packing><property name=\"expand\">False</property><property nam"
--  "e=\"fill\">True</property><property name=\"position\">0</property></pac"
--  "king></child><child><object class=\"GtkComboBox\" id=\"synaptics-scroll"
--  "\"><property name=\"visible\">True</property><property name=\"can_focus"
--  "\">False</property><property name=\"model\">synaptics-scroll-store</pro"
--  "perty><child><object class=\"GtkCellRendererText\" id=\"cellrenderertex"
--  "t3\"/><attributes><attribute name=\"text\">0</attribute><attribute name"
--  "=\"sensitive\">1</attribute></attributes></child></object><packing><pro"
--  "perty name=\"expand\">True</property><property name=\"fill\">True</prop"
--  "erty><property name=\"position\">1</property></packing></child></object"
--  "><packing><property name=\"expand\">True</property><property name=\"fil"
--  "l\">True</property><property name=\"position\">0</property></packing></"
--  "child><child><object class=\"GtkCheckButton\" id=\"synaptics-scroll-hor"
--  "iz\"><property name=\"label\" translatable=\"yes\">Enable hori_zontal s"
--  "crolling</property><property name=\"visible\">True</property><property "
--  "name=\"can_focus\">True</property><property name=\"receives_default\">F"
--  "alse</property><property name=\"use_action_appearance\">False</property"
--  "><property name=\"use_underline\">True</property><property name=\"draw_"
--  "indicator\">True</property></object><packing><property name=\"expand\">"
--  "True</property><property name=\"fill\">True</property><property name=\""
--  "position\">1</property></packing></child></object></child></object></ch"
--  "ild><child type=\"label\"><object class=\"GtkLabel\" id=\"label17\"><pr"
--  "operty name=\"visible\">True</property><property name=\"can_focus\">Fal"
--  "se</property><property name=\"label\" translatable=\"yes\">Scrolling</p"
--  "roperty><property name=\"use_markup\">True</property><attributes><attri"
--  "bute name=\"weight\" value=\"bold\"/></attributes></object></child></ob"
--  "ject><packing><property name=\"expand\">False</property><property name="
--  "\"fill\">True</property><property name=\"position\">1</property></packi"
--  "ng></child></object><packing><property name=\"position\">1</property></"
--  "packing></child><child type=\"tab\"><object class=\"GtkLabel\" id=\"syn"
--  "aptics-label\"><property name=\"visible\">True</property><property name"
--  "=\"can_focus\">False</property><property name=\"label\" translatable=\""
--  "yes\">T_ouchpad</property><property name=\"use_underline\">True</proper"
--  "ty></object><packing><property name=\"position\">1</property><property "
--  "name=\"tab_fill\">False</property></packing></child><child><object clas"
--  "s=\"GtkVBox\" id=\"wacom-tab\"><property name=\"visible\">True</propert"
-+  "efault\">False</property><property name=\"use_underline\">True</propert"
-+  "y><property name=\"active\">True</property><property name=\"draw_indica"
-+  "tor\">True</property></object><packing><property name=\"expand\">False<"
-+  "/property><property name=\"fill\">True</property><property name=\"posit"
-+  "ion\">0</property></packing></child><child><object class=\"GtkRadioButt"
-+  "on\" id=\"device-left-handed\"><property name=\"label\" translatable=\""
-+  "yes\">Le_ft-handed</property><property name=\"use_action_appearance\">F"
-+  "alse</property><property name=\"visible\">True</property><property name"
-+  "=\"can_focus\">True</property><property name=\"receives_default\">False"
-+  "</property><property name=\"use_underline\">True</property><property na"
-+  "me=\"draw_indicator\">True</property><property name=\"group\">device-ri"
-+  "ght-handed</property></object><packing><property name=\"expand\">False<"
-+  "/property><property name=\"fill\">True</property><property name=\"posit"
-+  "ion\">1</property></packing></child></object><packing><property name=\""
-+  "expand\">True</property><property name=\"fill\">True</property><propert"
-+  "y name=\"position\">0</property></packing></child><child><object class="
-+  "\"GtkCheckButton\" id=\"device-reverse-scrolling\"><property name=\"lab"
-+  "el\" translatable=\"yes\">Reverse scroll d_irection</property><property"
-+  " name=\"use_action_appearance\">False</property><property name=\"visibl"
-+  "e\">True</property><property name=\"can_focus\">True</property><propert"
-+  "y name=\"receives_default\">False</property><property name=\"tooltip_te"
-+  "xt\" translatable=\"yes\">When selected, the scroll wheel will work in "
-+  "the opposite direction</property><property name=\"use_underline\">True<"
-+  "/property><property name=\"draw_indicator\">True</property></object><pa"
-+  "cking><property name=\"expand\">True</property><property name=\"fill\">"
-+  "True</property><property name=\"position\">1</property></packing></chil"
-+  "d></object></child></object></child><child type=\"label\"><object class"
-+  "=\"GtkLabel\" id=\"label14\"><property name=\"visible\">True</property>"
-+  "<property name=\"can_focus\">False</property><property name=\"label\" t"
-+  "ranslatable=\"yes\">Buttons</property><attributes><attribute name=\"wei"
-+  "ght\" value=\"bold\"/></attributes></object></child></object><packing><"
-+  "property name=\"expand\">False</property><property name=\"fill\">True</"
-+  "property><property name=\"position\">0</property></packing></child><chi"
-+  "ld><object class=\"GtkFrame\" id=\"frame2\"><property name=\"visible\">"
-+  "True</property><property name=\"can_focus\">False</property><property n"
-+  "ame=\"label_xalign\">0</property><property name=\"shadow_type\">none</p"
-+  "roperty><child><object class=\"GtkAlignment\" id=\"alignment2\"><proper"
-+  "ty name=\"visible\">True</property><property name=\"can_focus\">False</"
-+  "property><property name=\"left_padding\">12</property><child><object cl"
-+  "ass=\"GtkTable\" id=\"table1\"><property name=\"visible\">True</propert"
-   "y><property name=\"can_focus\">False</property><property name=\"border_"
--  "width\">6</property><property name=\"spacing\">6</property><child><obje"
--  "ct class=\"GtkFrame\" id=\"frame12\"><property name=\"visible\">True</p"
--  "roperty><property name=\"can_focus\">False</property><property name=\"l"
--  "abel_xalign\">0</property><property name=\"shadow_type\">none</property"
--  "><child><object class=\"GtkAlignment\" id=\"alignment14\"><property nam"
--  "e=\"visible\">True</property><property name=\"can_focus\">False</proper"
--  "ty><property name=\"left_padding\">12</property><child><object class=\""
--  "GtkTable\" id=\"table2\"><property name=\"visible\">True</property><pro"
--  "perty name=\"can_focus\">False</property><property name=\"border_width\""
--  ">6</property><property name=\"n_rows\">2</property><property name=\"n_c"
--  "olumns\">2</property><property name=\"column_spacing\">12</property><pr"
--  "operty name=\"row_spacing\">6</property><child><object class=\"GtkLabel"
--  "\" id=\"label9\"><property name=\"visible\">True</property><property na"
--  "me=\"can_focus\">False</property><property name=\"xalign\">0</property>"
--  "<property name=\"label\" translatable=\"yes\">Tr_acking mode:</property"
--  "><property name=\"use_underline\">True</property><property name=\"mnemo"
--  "nic_widget\">wacom-mode</property></object><packing><property name=\"x_"
--  "options\">GTK_FILL</property></packing></child><child><object class=\"G"
--  "tkLabel\" id=\"label10\"><property name=\"visible\">True</property><pro"
--  "perty name=\"can_focus\">False</property><property name=\"xalign\">0</p"
--  "roperty><property name=\"label\" translatable=\"yes\">_Rotation:</prope"
--  "rty><property name=\"use_underline\">True</property><property name=\"mn"
--  "emonic_widget\">wacom-rotation</property></object><packing><property na"
--  "me=\"top_attach\">1</property><property name=\"bottom_attach\">2</prope"
--  "rty><property name=\"x_options\">GTK_FILL</property></packing></child><"
--  "child><object class=\"GtkComboBox\" id=\"wacom-mode\"><property name=\""
--  "visible\">True</property><property name=\"can_focus\">False</property><"
--  "property name=\"model\">wacom-mode-store</property><child><object class"
--  "=\"GtkCellRendererText\" id=\"cellrenderertext1\"/><attributes><attribu"
--  "te name=\"text\">1</attribute></attributes></child></object><packing><p"
--  "roperty name=\"left_attach\">1</property><property name=\"right_attach\""
--  ">2</property></packing></child><child><object class=\"GtkComboBox\" id="
--  "\"wacom-rotation\"><property name=\"visible\">True</property><property "
--  "name=\"can_focus\">False</property><property name=\"model\">wacom-rotat"
--  "ion-store</property><child><object class=\"GtkCellRendererText\" id=\"c"
--  "ellrenderertext2\"/><attributes><attribute name=\"text\">1</attribute><"
--  "/attributes></child></object><packing><property name=\"left_attach\">1<"
--  "/property><property name=\"right_attach\">2</property><property name=\""
--  "top_attach\">1</property><property name=\"bottom_attach\">2</property><"
--  "/packing></child></object></child></object></child><child type=\"label\""
--  "><object class=\"GtkLabel\" id=\"label18\"><property name=\"visible\">T"
-+  "width\">6</property><property name=\"n_rows\">4</property><property nam"
-+  "e=\"n_columns\">2</property><property name=\"column_spacing\">12</prope"
-+  "rty><property name=\"row_spacing\">6</property><child><object class=\"G"
-+  "tkLabel\" id=\"device-acceleration-label\"><property name=\"visible\">T"
-   "rue</property><property name=\"can_focus\">False</property><property na"
--  "me=\"label\" translatable=\"yes\">General</property><property name=\"us"
--  "e_markup\">True</property><attributes><attribute name=\"weight\" value="
--  "\"bold\"/></attributes></object></child></object><packing><property nam"
--  "e=\"expand\">False</property><property name=\"fill\">True</property><pr"
--  "operty name=\"position\">0</property></packing></child></object><packin"
--  "g><property name=\"position\">2</property></packing></child><child type"
--  "=\"tab\"><object class=\"GtkLabel\" id=\"wacom-label\"><property name=\""
--  "visible\">True</property><property name=\"can_focus\">False</property><"
--  "property name=\"label\" translatable=\"yes\">Table_t</property><propert"
--  "y name=\"use_underline\">True</property></object><packing><property nam"
--  "e=\"position\">2</property><property name=\"tab_fill\">False</property>"
--  "</packing></child></object><packing><property name=\"expand\">True</pro"
--  "perty><property name=\"fill\">True</property><property name=\"position\""
--  ">2</property></packing></child></object></child><child type=\"tab\"><ob"
--  "ject class=\"GtkLabel\" id=\"label1\"><property name=\"visible\">True</"
--  "property><property name=\"can_focus\">False</property><property name=\""
--  "label\" translatable=\"yes\">_Devices</property><property name=\"use_un"
--  "derline\">True</property></object><packing><property name=\"tab_fill\">"
--  "False</property></packing></child><child><object class=\"GtkVBox\" id=\""
--  "vbox3\"><property name=\"visible\">True</property><property name=\"can_"
--  "focus\">False</property><property name=\"border_width\">12</property><p"
--  "roperty name=\"spacing\">6</property><child><object class=\"GtkFrame\" "
--  "id=\"frame3\"><property name=\"visible\">True</property><property name="
--  "\"can_focus\">False</property><property name=\"label_xalign\">0</proper"
--  "ty><property name=\"shadow_type\">none</property><child><object class=\""
--  "GtkAlignment\" id=\"alignment3\"><property name=\"visible\">True</prope"
--  "rty><property name=\"can_focus\">False</property><property name=\"left_"
--  "padding\">12</property><child><object class=\"GtkVBox\" id=\"vbox4\"><p"
--  "roperty name=\"visible\">True</property><property name=\"can_focus\">Fa"
--  "lse</property><property name=\"border_width\">6</property><property nam"
--  "e=\"spacing\">6</property><child><object class=\"GtkLabel\" id=\"mouse-"
--  "dnd-label\"><property name=\"visible\">True</property><property name=\""
--  "can_focus\">False</property><property name=\"xalign\">0</property><prop"
--  "erty name=\"label\" translatable=\"yes\">Th_reshold:</property><propert"
--  "y name=\"use_underline\">True</property><property name=\"mnemonic_widge"
--  "t\">dnd-threshold-scale</property></object><packing><property name=\"ex"
--  "pand\">True</property><property name=\"fill\">True</property><property "
--  "name=\"position\">0</property></packing></child><child><object class=\""
--  "GtkHScale\" id=\"dnd-threshold-scale\"><property name=\"visible\">True<"
--  "/property><property name=\"can_focus\">True</property><property name=\""
--  "tooltip_text\" translatable=\"yes\">The number of pixels the pointer mu"
--  "st move before a drag operation will start</property><property name=\"u"
--  "pdate_policy\">delayed</property><property name=\"adjustment\">dnd-thre"
--  "shold</property><property name=\"digits\">0</property><property name=\""
--  "value_pos\">right</property></object><packing><property name=\"expand\""
--  ">True</property><property name=\"fill\">True</property><property name=\""
--  "position\">1</property></packing></child></object></child></object></ch"
--  "ild><child type=\"label\"><object class=\"GtkLabel\" id=\"label6\"><pro"
--  "perty name=\"visible\">True</property><property name=\"can_focus\">Fals"
--  "e</property><property name=\"label\" translatable=\"yes\">Drag and Drop"
--  "</property><attributes><attribute name=\"weight\" value=\"bold\"/></att"
--  "ributes></object></child></object><packing><property name=\"expand\">Fa"
--  "lse</property><property name=\"fill\">True</property><property name=\"p"
--  "osition\">0</property></packing></child><child><object class=\"GtkFrame"
--  "\" id=\"frame4\"><property name=\"visible\">True</property><property na"
--  "me=\"can_focus\">False</property><property name=\"label_xalign\">0</pro"
--  "perty><property name=\"shadow_type\">none</property><child><object clas"
--  "s=\"GtkAlignment\" id=\"alignment4\"><property name=\"visible\">True</p"
--  "roperty><property name=\"can_focus\">False</property><property name=\"l"
--  "eft_padding\">12</property><child><object class=\"GtkVBox\" id=\"vbox5\""
-+  "me=\"xalign\">0</property><property name=\"label\" translatable=\"yes\""
-+  ">Acceleratio_n:</property><property name=\"use_underline\">True</proper"
-+  "ty><property name=\"mnemonic_widget\">device-acceleration-scale</proper"
-+  "ty></object><packing><property name=\"x_options\">GTK_FILL</property><p"
-+  "roperty name=\"y_options\">GTK_FILL</property></packing></child><child>"
-+  "<object class=\"GtkHScale\" id=\"device-acceleration-scale\"><property "
-+  "name=\"visible\">True</property><property name=\"can_focus\">True</prop"
-+  "erty><property name=\"tooltip_text\" translatable=\"yes\">The factor at"
-+  " which the pointer\'s speed will increase as the mouse is moved</proper"
-+  "ty><property name=\"update_policy\">delayed</property><property name=\""
-+  "adjustment\">device-acceleration</property><property name=\"round_digit"
-+  "s\">1</property><property name=\"value_pos\">right</property></object><"
-+  "packing><property name=\"left_attach\">1</property><property name=\"rig"
-+  "ht_attach\">2</property></packing></child><child><object class=\"GtkHSc"
-+  "ale\" id=\"device-threshold-scale\"><property name=\"visible\">True</pr"
-+  "operty><property name=\"can_focus\">True</property><property name=\"too"
-+  "ltip_text\" translatable=\"yes\">The number of pixels the pointer must "
-+  "move in a short time before it starts accelerating</property><property "
-+  "name=\"update_policy\">delayed</property><property name=\"adjustment\">"
-+  "device-threshold</property><property name=\"round_digits\">0</property>"
-+  "<property name=\"digits\">0</property><property name=\"value_pos\">righ"
-+  "t</property></object><packing><property name=\"left_attach\">1</propert"
-+  "y><property name=\"right_attach\">2</property><property name=\"top_atta"
-+  "ch\">1</property><property name=\"bottom_attach\">2</property></packing"
-+  "></child><child><object class=\"GtkLabel\" id=\"device-threshold-label\""
-   "><property name=\"visible\">True</property><property name=\"can_focus\""
--  ">False</property><property name=\"border_width\">6</property><property "
--  "name=\"spacing\">6</property><child><object class=\"GtkLabel\" id=\"dcl"
--  "ick-time-label\"><property name=\"visible\">True</property><property na"
--  "me=\"can_focus\">False</property><property name=\"xalign\">0</property>"
--  "<property name=\"label\" translatable=\"yes\">Ti_me:</property><propert"
--  "y name=\"use_underline\">True</property><property name=\"mnemonic_widge"
--  "t\">dclick-time-scale</property></object><packing><property name=\"expa"
--  "nd\">True</property><property name=\"fill\">True</property><property na"
--  "me=\"position\">0</property></packing></child><child><object class=\"Gt"
--  "kHScale\" id=\"dclick-time-scale\"><property name=\"visible\">True</pro"
--  "perty><property name=\"can_focus\">True</property><property name=\"tool"
--  "tip_text\" translatable=\"yes\">Two mouse clicks in less than this leng"
--  "th of time (in milliseconds) will be considered a double click</propert"
--  "y><property name=\"update_policy\">delayed</property><property name=\"a"
--  "djustment\">dclick-time</property><property name=\"digits\">0</property"
--  "><property name=\"value_pos\">right</property></object><packing><proper"
--  "ty name=\"expand\">True</property><property name=\"fill\">True</propert"
--  "y><property name=\"position\">1</property></packing></child><child><obj"
--  "ect class=\"GtkLabel\" id=\"dclick-distance-label\"><property name=\"vi"
--  "sible\">True</property><property name=\"can_focus\">False</property><pr"
--  "operty name=\"xalign\">0</property><property name=\"label\" translatabl"
--  "e=\"yes\">D_istance:</property><property name=\"use_underline\">True</p"
--  "roperty><property name=\"mnemonic_widget\">dclick-distance-scale</prope"
--  "rty></object><packing><property name=\"expand\">True</property><propert"
--  "y name=\"fill\">True</property><property name=\"position\">2</property>"
--  "</packing></child><child><object class=\"GtkHScale\" id=\"dclick-distan"
--  "ce-scale\"><property name=\"visible\">True</property><property name=\"c"
--  "an_focus\">True</property><property name=\"tooltip_text\" translatable="
--  "\"yes\">The mouse pointer cannot move farther than this distance betwee"
--  "n two clicks for them to be considered a double click</property><proper"
--  "ty name=\"update_policy\">delayed</property><property name=\"adjustment"
--  "\">dclick-distance</property><property name=\"digits\">0</property><pro"
--  "perty name=\"value_pos\">right</property></object><packing><property na"
--  "me=\"expand\">True</property><property name=\"fill\">True</property><pr"
--  "operty name=\"position\">3</property></packing></child></object></child"
--  "></object></child><child type=\"label\"><object class=\"GtkLabel\" id=\""
--  "label8\"><property name=\"visible\">True</property><property name=\"can"
--  "_focus\">False</property><property name=\"label\" translatable=\"yes\">"
--  "Double Click</property><attributes><attribute name=\"weight\" value=\"b"
--  "old\"/></attributes></object></child></object><packing><property name=\""
--  "expand\">False</property><property name=\"fill\">True</property><proper"
--  "ty name=\"position\">1</property></packing></child></object><packing><p"
--  "roperty name=\"position\">1</property></packing></child><child type=\"t"
--  "ab\"><object class=\"GtkLabel\" id=\"label2\"><property name=\"visible\""
--  ">True</property><property name=\"can_focus\">False</property><property "
--  "name=\"label\" translatable=\"yes\">_Behavior</property><property name="
--  "\"use_underline\">True</property></object><packing><property name=\"pos"
--  "ition\">1</property><property name=\"tab_fill\">False</property></packi"
--  "ng></child><child><object class=\"GtkHBox\" id=\"themes-hbox\"><propert"
--  "y name=\"visible\">True</property><property name=\"can_focus\">False</p"
--  "roperty><property name=\"border_width\">12</property><property name=\"s"
--  "pacing\">12</property><child><object class=\"GtkScrolledWindow\" id=\"s"
--  "crolledwindow2\"><property name=\"visible\">True</property><property na"
--  "me=\"can_focus\">True</property><property name=\"hscrollbar_policy\">au"
--  "tomatic</property><property name=\"vscrollbar_policy\">automatic</prope"
--  "rty><property name=\"shadow_type\">etched-in</property><child><object c"
--  "lass=\"GtkTreeView\" id=\"theme-treeview\"><property name=\"width_reque"
--  "st\">200</property><property name=\"visible\">True</property><property "
--  "name=\"can_focus\">True</property><property name=\"headers_visible\">Fa"
--  "lse</property></object></child></object><packing><property name=\"expan"
--  "d\">True</property><property name=\"fill\">True</property><property nam"
--  "e=\"position\">0</property></packing></child><child><object class=\"Gtk"
--  "VBox\" id=\"vbox9\"><property name=\"visible\">True</property><property"
--  " name=\"can_focus\">False</property><property name=\"spacing\">6</prope"
--  "rty><child><object class=\"GtkFrame\" id=\"frame5\"><property name=\"vi"
--  "sible\">True</property><property name=\"can_focus\">False</property><pr"
--  "operty name=\"label_xalign\">0</property><property name=\"shadow_type\""
--  ">none</property><child><object class=\"GtkAlignment\" id=\"alignment5\""
-+  ">False</property><property name=\"xalign\">0</property><property name=\""
-+  "label\" translatable=\"yes\">Sensitivit_y:</property><property name=\"u"
-+  "se_underline\">True</property><property name=\"mnemonic_widget\">device"
-+  "-threshold-scale</property></object><packing><property name=\"top_attac"
-+  "h\">1</property><property name=\"bottom_attach\">2</property><property "
-+  "name=\"x_options\">GTK_FILL</property></packing></child><child><object "
-+  "class=\"GtkAlignment\" id=\"alignment7\"><property name=\"visible\">Tru"
-+  "e</property><property name=\"can_focus\">False</property><property name"
-+  "=\"xalign\">0</property><property name=\"xscale\">0</property><property"
-+  " name=\"yscale\">0</property><child><object class=\"GtkButton\" id=\"de"
-+  "vice-reset-feedback\"><property name=\"label\" translatable=\"yes\">_Re"
-+  "set to Defaults</property><property name=\"use_action_appearance\">Fals"
-+  "e</property><property name=\"visible\">True</property><property name=\""
-+  "can_focus\">True</property><property name=\"receives_default\">True</pr"
-+  "operty><property name=\"tooltip_text\" translatable=\"yes\">Set the acc"
-+  "eleration and sensitivity for the selected device to the default values"
-+  "</property><property name=\"image\">image5</property><property name=\"u"
-+  "se_underline\">True</property></object></child></object><packing><prope"
-+  "rty name=\"right_attach\">2</property><property name=\"top_attach\">2</"
-+  "property><property name=\"bottom_attach\">3</property></packing></child"
-+  "><child><object class=\"GtkAlignment\" id=\"alignment8\"><property name"
-+  "=\"visible\">True</property><property name=\"can_focus\">False</propert"
-+  "y><property name=\"xalign\">0</property><property name=\"xscale\">0</pr"
-+  "operty><property name=\"yscale\">0</property><child><object class=\"Gtk"
-+  "CheckButton\" id=\"touchscreen-pointer\"><property name=\"label\" trans"
-+  "latable=\"yes\">_Touchscreen pointer</property><property name=\"use_act"
-+  "ion_appearance\">False</property><property name=\"visible\">True</prope"
-+  "rty><property name=\"can_focus\">True</property><property name=\"receiv"
-+  "es_default\">False</property><property name=\"tooltip_text\" translatab"
-+  "le=\"yes\">When selected, no mouse pointer is displayed for this device"
-+  " and gtk TouchscreenMode is activated</property><property name=\"use_un"
-+  "derline\">True</property><property name=\"draw_indicator\">True</proper"
-+  "ty></object></child></object><packing><property name=\"right_attach\">2"
-+  "</property><property name=\"top_attach\">3</property><property name=\"b"
-+  "ottom_attach\">4</property></packing></child></object></child></object>"
-+  "</child><child type=\"label\"><object class=\"GtkLabel\" id=\"label15\""
-   "><property name=\"visible\">True</property><property name=\"can_focus\""
--  ">False</property><property name=\"left_padding\">12</property><child><o"
--  "bject class=\"GtkHBox\" id=\"hbox7\"><property name=\"visible\">True</p"
-+  ">False</property><property name=\"label\" translatable=\"yes\">Pointer "
-+  "Speed</property><attributes><attribute name=\"weight\" value=\"bold\"/>"
-+  "</attributes></object></child></object><packing><property name=\"expand"
-+  "\">False</property><property name=\"fill\">True</property><property nam"
-+  "e=\"position\">1</property></packing></child></object></child><child ty"
-+  "pe=\"tab\"><object class=\"GtkLabel\" id=\"label4\"><property name=\"vi"
-+  "sible\">True</property><property name=\"can_focus\">False</property><pr"
-+  "operty name=\"label\" translatable=\"yes\">B_uttons and Feedback</prope"
-+  "rty><property name=\"use_underline\">True</property></object><packing><"
-+  "property name=\"tab_fill\">False</property></packing></child><child><ob"
-+  "ject class=\"GtkVBox\" id=\"synaptics-tab\"><property name=\"visible\">"
-+  "True</property><property name=\"can_focus\">False</property><property n"
-+  "ame=\"border_width\">6</property><property name=\"spacing\">6</property"
-+  "><child><object class=\"GtkFrame\" id=\"frame11\"><property name=\"visi"
-+  "ble\">True</property><property name=\"can_focus\">False</property><prop"
-+  "erty name=\"label_xalign\">0</property><property name=\"shadow_type\">n"
-+  "one</property><child><object class=\"GtkAlignment\" id=\"alignment13\">"
-+  "<property name=\"visible\">True</property><property name=\"can_focus\">"
-+  "False</property><property name=\"left_padding\">12</property><child><ob"
-+  "ject class=\"GtkVBox\" id=\"vbox11\"><property name=\"visible\">True</p"
-   "roperty><property name=\"can_focus\">False</property><property name=\"b"
--  "order_width\">6</property><property name=\"spacing\">12</property><chil"
--  "d><object class=\"GtkLabel\" id=\"label21\"><property name=\"visible\">"
-+  "order_width\">6</property><property name=\"spacing\">6</property><child"
-+  "><object class=\"GtkCheckButton\" id=\"synaptics-disable-while-type\"><"
-+  "property name=\"label\" translatable=\"yes\">Disable touchpad _while ty"
-+  "ping</property><property name=\"use_action_appearance\">False</property"
-+  "><property name=\"visible\">True</property><property name=\"can_focus\""
-+  ">True</property><property name=\"receives_default\">False</property><pr"
-+  "operty name=\"tooltip_text\" translatable=\"yes\">When selected, the to"
-+  "uchpad will be disabled when the keyboard is being used</property><prop"
-+  "erty name=\"use_underline\">True</property><property name=\"draw_indica"
-+  "tor\">True</property></object><packing><property name=\"expand\">True</"
-+  "property><property name=\"fill\">True</property><property name=\"positi"
-+  "on\">0</property></packing></child><child><object class=\"GtkCheckButto"
-+  "n\" id=\"synaptics-tap-to-click\"><property name=\"label\" translatable"
-+  "=\"yes\">Tap touchpad to clic_k</property><property name=\"use_action_a"
-+  "ppearance\">False</property><property name=\"visible\">True</property><"
-+  "property name=\"can_focus\">True</property><property name=\"receives_de"
-+  "fault\">False</property><property name=\"use_underline\">True</property"
-+  "><property name=\"draw_indicator\">True</property></object><packing><pr"
-+  "operty name=\"expand\">True</property><property name=\"fill\">True</pro"
-+  "perty><property name=\"position\">1</property></packing></child></objec"
-+  "t></child></object></child><child type=\"label\"><object class=\"GtkLab"
-+  "el\" id=\"label16\"><property name=\"visible\">True</property><property"
-+  " name=\"can_focus\">False</property><property name=\"label\" translatab"
-+  "le=\"yes\">General</property><property name=\"use_markup\">True</proper"
-+  "ty><attributes><attribute name=\"weight\" value=\"bold\"/></attributes>"
-+  "</object></child></object><packing><property name=\"expand\">False</pro"
-+  "perty><property name=\"fill\">True</property><property name=\"position\""
-+  ">0</property></packing></child><child><object class=\"GtkFrame\" id=\"f"
-+  "rame10\"><property name=\"visible\">True</property><property name=\"can"
-+  "_focus\">False</property><property name=\"label_xalign\">0</property><p"
-+  "roperty name=\"shadow_type\">none</property><child><object class=\"GtkA"
-+  "lignment\" id=\"alignment12\"><property name=\"visible\">True</property"
-+  "><property name=\"can_focus\">False</property><property name=\"left_pad"
-+  "ding\">12</property><child><object class=\"GtkVBox\" id=\"vbox10\"><pro"
-+  "perty name=\"visible\">True</property><property name=\"can_focus\">Fals"
-+  "e</property><property name=\"border_width\">6</property><property name="
-+  "\"spacing\">6</property><child><object class=\"GtkHBox\" id=\"hbox4\"><"
-+  "property name=\"visible\">True</property><property name=\"can_focus\">F"
-+  "alse</property><property name=\"spacing\">12</property><child><object c"
-+  "lass=\"GtkLabel\" id=\"label23\"><property name=\"visible\">True</prope"
-+  "rty><property name=\"can_focus\">False</property><property name=\"xalig"
-+  "n\">0</property><property name=\"label\" translatable=\"yes\">Scrolling"
-+  " _mode:</property><property name=\"use_underline\">True</property><prop"
-+  "erty name=\"mnemonic_widget\">synaptics-scroll</property></object><pack"
-+  "ing><property name=\"expand\">False</property><property name=\"fill\">T"
-+  "rue</property><property name=\"position\">0</property></packing></child"
-+  "><child><object class=\"GtkComboBox\" id=\"synaptics-scroll\"><property"
-+  " name=\"visible\">True</property><property name=\"can_focus\">False</pr"
-+  "operty><property name=\"model\">synaptics-scroll-store</property><child"
-+  "><object class=\"GtkCellRendererText\" id=\"cellrenderertext3\"/><attri"
-+  "butes><attribute name=\"sensitive\">1</attribute><attribute name=\"text"
-+  "\">0</attribute></attributes></child></object><packing><property name=\""
-+  "expand\">True</property><property name=\"fill\">True</property><propert"
-+  "y name=\"position\">1</property></packing></child></object><packing><pr"
-+  "operty name=\"expand\">True</property><property name=\"fill\">True</pro"
-+  "perty><property name=\"position\">0</property></packing></child><child>"
-+  "<object class=\"GtkCheckButton\" id=\"synaptics-scroll-horiz\"><propert"
-+  "y name=\"label\" translatable=\"yes\">Enable hori_zontal scrolling</pro"
-+  "perty><property name=\"use_action_appearance\">False</property><propert"
-+  "y name=\"visible\">True</property><property name=\"can_focus\">True</pr"
-+  "operty><property name=\"receives_default\">False</property><property na"
-+  "me=\"use_underline\">True</property><property name=\"draw_indicator\">T"
-+  "rue</property></object><packing><property name=\"expand\">True</propert"
-+  "y><property name=\"fill\">True</property><property name=\"position\">1<"
-+  "/property></packing></child></object></child></object></child><child ty"
-+  "pe=\"label\"><object class=\"GtkLabel\" id=\"label17\"><property name=\""
-+  "visible\">True</property><property name=\"can_focus\">False</property><"
-+  "property name=\"label\" translatable=\"yes\">Scrolling</property><prope"
-+  "rty name=\"use_markup\">True</property><attributes><attribute name=\"we"
-+  "ight\" value=\"bold\"/></attributes></object></child></object><packing>"
-+  "<property name=\"expand\">False</property><property name=\"fill\">True<"
-+  "/property><property name=\"position\">1</property></packing></child></o"
-+  "bject><packing><property name=\"position\">1</property></packing></chil"
-+  "d><child type=\"tab\"><object class=\"GtkLabel\" id=\"synaptics-label\""
-+  "><property name=\"visible\">True</property><property name=\"can_focus\""
-+  ">False</property><property name=\"label\" translatable=\"yes\">T_ouchpa"
-+  "d</property><property name=\"use_underline\">True</property></object><p"
-+  "acking><property name=\"position\">1</property><property name=\"tab_fil"
-+  "l\">False</property></packing></child><child><object class=\"GtkVBox\" "
-+  "id=\"wacom-tab\"><property name=\"visible\">True</property><property na"
-+  "me=\"can_focus\">False</property><property name=\"border_width\">6</pro"
-+  "perty><property name=\"spacing\">6</property><child><object class=\"Gtk"
-+  "Frame\" id=\"frame12\"><property name=\"visible\">True</property><prope"
-+  "rty name=\"can_focus\">False</property><property name=\"label_xalign\">"
-+  "0</property><property name=\"shadow_type\">none</property><child><objec"
-+  "t class=\"GtkAlignment\" id=\"alignment14\"><property name=\"visible\">"
-   "True</property><property name=\"can_focus\">False</property><property n"
--  "ame=\"label\" translatable=\"yes\">Cursor _size:</property><property na"
--  "me=\"use_underline\">True</property><property name=\"mnemonic_widget\">"
--  "spin1</property></object><packing><property name=\"expand\">False</prop"
--  "erty><property name=\"fill\">True</property><property name=\"position\""
--  ">0</property></packing></child><child><object class=\"GtkSpinButton\" i"
--  "d=\"spin1\"><property name=\"visible\">True</property><property name=\""
--  "can_focus\">True</property><property name=\"primary_icon_activatable\">"
--  "False</property><property name=\"secondary_icon_activatable\">False</pr"
--  "operty><property name=\"primary_icon_sensitive\">True</property><proper"
--  "ty name=\"secondary_icon_sensitive\">True</property><property name=\"ad"
--  "justment\">theme-cursor-size</property><property name=\"snap_to_ticks\""
--  ">True</property><property name=\"numeric\">True</property></object><pac"
--  "king><property name=\"expand\">False</property><property name=\"fill\">"
--  "True</property><property name=\"position\">1</property></packing></chil"
-+  "ame=\"left_padding\">12</property><child><object class=\"GtkTable\" id="
-+  "\"table2\"><property name=\"visible\">True</property><property name=\"c"
-+  "an_focus\">False</property><property name=\"border_width\">6</property>"
-+  "<property name=\"n_rows\">2</property><property name=\"n_columns\">2</p"
-+  "roperty><property name=\"column_spacing\">12</property><property name=\""
-+  "row_spacing\">6</property><child><object class=\"GtkLabel\" id=\"label9"
-+  "\"><property name=\"visible\">True</property><property name=\"can_focus"
-+  "\">False</property><property name=\"xalign\">0</property><property name"
-+  "=\"label\" translatable=\"yes\">Trac_king mode:</property><property nam"
-+  "e=\"use_underline\">True</property><property name=\"mnemonic_widget\">w"
-+  "acom-mode</property></object><packing><property name=\"x_options\">GTK_"
-+  "FILL</property></packing></child><child><object class=\"GtkLabel\" id=\""
-+  "label10\"><property name=\"visible\">True</property><property name=\"ca"
-+  "n_focus\">False</property><property name=\"xalign\">0</property><proper"
-+  "ty name=\"label\" translatable=\"yes\">_Rotation:</property><property n"
-+  "ame=\"use_underline\">True</property><property name=\"mnemonic_widget\""
-+  ">wacom-rotation</property></object><packing><property name=\"top_attach"
-+  "\">1</property><property name=\"bottom_attach\">2</property><property n"
-+  "ame=\"x_options\">GTK_FILL</property></packing></child><child><object c"
-+  "lass=\"GtkComboBox\" id=\"wacom-mode\"><property name=\"visible\">True<"
-+  "/property><property name=\"can_focus\">False</property><property name=\""
-+  "model\">wacom-mode-store</property><child><object class=\"GtkCellRender"
-+  "erText\" id=\"cellrenderertext1\"/><attributes><attribute name=\"text\""
-+  ">1</attribute></attributes></child></object><packing><property name=\"l"
-+  "eft_attach\">1</property><property name=\"right_attach\">2</property></"
-+  "packing></child><child><object class=\"GtkComboBox\" id=\"wacom-rotatio"
-+  "n\"><property name=\"visible\">True</property><property name=\"can_focu"
-+  "s\">False</property><property name=\"model\">wacom-rotation-store</prop"
-+  "erty><child><object class=\"GtkCellRendererText\" id=\"cellrenderertext"
-+  "2\"/><attributes><attribute name=\"text\">1</attribute></attributes></c"
-+  "hild></object><packing><property name=\"left_attach\">1</property><prop"
-+  "erty name=\"right_attach\">2</property><property name=\"top_attach\">1<"
-+  "/property><property name=\"bottom_attach\">2</property></packing></chil"
-   "d></object></child></object></child><child type=\"label\"><object class"
--  "=\"GtkLabel\" id=\"label20\"><property name=\"visible\">True</property>"
-+  "=\"GtkLabel\" id=\"label18\"><property name=\"visible\">True</property>"
-   "<property name=\"can_focus\">False</property><property name=\"label\" t"
--  "ranslatable=\"yes\">Size</property><attributes><attribute name=\"weight"
--  "\" value=\"bold\"/></attributes></object></child></object><packing><pro"
--  "perty name=\"expand\">False</property><property name=\"fill\">True</pro"
--  "perty><property name=\"position\">0</property></packing></child><child>"
--  "<object class=\"GtkFrame\" id=\"frame6\"><property name=\"visible\">Tru"
-+  "ranslatable=\"yes\">General</property><property name=\"use_markup\">Tru"
-+  "e</property><attributes><attribute name=\"weight\" value=\"bold\"/></at"
-+  "tributes></object></child></object><packing><property name=\"expand\">F"
-+  "alse</property><property name=\"fill\">True</property><property name=\""
-+  "position\">0</property></packing></child></object><packing><property na"
-+  "me=\"position\">2</property></packing></child><child type=\"tab\"><obje"
-+  "ct class=\"GtkLabel\" id=\"wacom-label\"><property name=\"visible\">Tru"
-   "e</property><property name=\"can_focus\">False</property><property name"
--  "=\"label_xalign\">0</property><property name=\"shadow_type\">none</prop"
--  "erty><child><object class=\"GtkAlignment\" id=\"alignment6\"><property "
--  "name=\"visible\">True</property><property name=\"can_focus\">False</pro"
--  "perty><property name=\"border_width\">6</property><property name=\"xali"
--  "gn\">0</property><property name=\"yalign\">0</property><property name=\""
--  "xscale\">0</property><property name=\"yscale\">0</property><property na"
--  "me=\"top_padding\">6</property><property name=\"bottom_padding\">6</pro"
--  "perty><property name=\"left_padding\">18</property><property name=\"rig"
--  "ht_padding\">6</property><child><object class=\"GtkImage\" id=\"theme-p"
--  "review\"><property name=\"visible\">True</property><property name=\"can"
--  "_focus\">False</property><property name=\"stock\">gtk-missing-image</pr"
--  "operty></object></child></object></child><child type=\"label\"><object "
--  "class=\"GtkLabel\" id=\"label22\"><property name=\"visible\">True</prop"
-+  "=\"label\" translatable=\"yes\">Tab_let</property><property name=\"use_"
-+  "underline\">True</property></object><packing><property name=\"position\""
-+  ">2</property><property name=\"tab_fill\">False</property></packing></ch"
-+  "ild></object><packing><property name=\"expand\">True</property><propert"
-+  "y name=\"fill\">True</property><property name=\"position\">2</property>"
-+  "</packing></child></object></child><child type=\"tab\"><object class=\""
-+  "GtkLabel\" id=\"label1\"><property name=\"visible\">True</property><pro"
-+  "perty name=\"can_focus\">False</property><property name=\"label\" trans"
-+  "latable=\"yes\">_Devices</property><property name=\"use_underline\">Tru"
-+  "e</property></object><packing><property name=\"tab_fill\">False</proper"
-+  "ty></packing></child><child><object class=\"GtkVBox\" id=\"vbox3\"><pro"
-+  "perty name=\"visible\">True</property><property name=\"can_focus\">Fals"
-+  "e</property><property name=\"border_width\">12</property><property name"
-+  "=\"spacing\">6</property><child><object class=\"GtkFrame\" id=\"frame3\""
-+  "><property name=\"visible\">True</property><property name=\"can_focus\""
-+  ">False</property><property name=\"label_xalign\">0</property><property "
-+  "name=\"shadow_type\">none</property><child><object class=\"GtkAlignment"
-+  "\" id=\"alignment3\"><property name=\"visible\">True</property><propert"
-+  "y name=\"can_focus\">False</property><property name=\"left_padding\">12"
-+  "</property><child><object class=\"GtkVBox\" id=\"vbox4\"><property name"
-+  "=\"visible\">True</property><property name=\"can_focus\">False</propert"
-+  "y><property name=\"border_width\">6</property><property name=\"spacing\""
-+  ">6</property><child><object class=\"GtkLabel\" id=\"mouse-dnd-label\"><"
-+  "property name=\"visible\">True</property><property name=\"can_focus\">F"
-+  "alse</property><property name=\"xalign\">0</property><property name=\"l"
-+  "abel\" translatable=\"yes\">Th_reshold:</property><property name=\"use_"
-+  "underline\">True</property><property name=\"mnemonic_widget\">dnd-thres"
-+  "hold-scale</property></object><packing><property name=\"expand\">True</"
-+  "property><property name=\"fill\">True</property><property name=\"positi"
-+  "on\">0</property></packing></child><child><object class=\"GtkHScale\" i"
-+  "d=\"dnd-threshold-scale\"><property name=\"visible\">True</property><pr"
-+  "operty name=\"can_focus\">True</property><property name=\"tooltip_text\""
-+  " translatable=\"yes\">The number of pixels the pointer must move before"
-+  " a drag operation will start</property><property name=\"update_policy\""
-+  ">delayed</property><property name=\"adjustment\">dnd-threshold</propert"
-+  "y><property name=\"digits\">0</property><property name=\"value_pos\">ri"
-+  "ght</property></object><packing><property name=\"expand\">True</propert"
-+  "y><property name=\"fill\">True</property><property name=\"position\">1<"
-+  "/property></packing></child></object></child></object></child><child ty"
-+  "pe=\"label\"><object class=\"GtkLabel\" id=\"label6\"><property name=\""
-+  "visible\">True</property><property name=\"can_focus\">False</property><"
-+  "property name=\"label\" translatable=\"yes\">Drag and Drop</property><a"
-+  "ttributes><attribute name=\"weight\" value=\"bold\"/></attributes></obj"
-+  "ect></child></object><packing><property name=\"expand\">False</property"
-+  "><property name=\"fill\">True</property><property name=\"position\">0</"
-+  "property></packing></child><child><object class=\"GtkFrame\" id=\"frame"
-+  "4\"><property name=\"visible\">True</property><property name=\"can_focu"
-+  "s\">False</property><property name=\"label_xalign\">0</property><proper"
-+  "ty name=\"shadow_type\">none</property><child><object class=\"GtkAlignm"
-+  "ent\" id=\"alignment4\"><property name=\"visible\">True</property><prop"
-+  "erty name=\"can_focus\">False</property><property name=\"left_padding\""
-+  ">12</property><child><object class=\"GtkVBox\" id=\"vbox5\"><property n"
-+  "ame=\"visible\">True</property><property name=\"can_focus\">False</prop"
-+  "erty><property name=\"border_width\">6</property><property name=\"spaci"
-+  "ng\">6</property><child><object class=\"GtkLabel\" id=\"dclick-time-lab"
-+  "el\"><property name=\"visible\">True</property><property name=\"can_foc"
-+  "us\">False</property><property name=\"xalign\">0</property><property na"
-+  "me=\"label\" translatable=\"yes\">Ti_me:</property><property name=\"use"
-+  "_underline\">True</property><property name=\"mnemonic_widget\">dclick-t"
-+  "ime-scale</property></object><packing><property name=\"expand\">True</p"
-+  "roperty><property name=\"fill\">True</property><property name=\"positio"
-+  "n\">0</property></packing></child><child><object class=\"GtkHScale\" id"
-+  "=\"dclick-time-scale\"><property name=\"visible\">True</property><prope"
-+  "rty name=\"can_focus\">True</property><property name=\"tooltip_text\" t"
-+  "ranslatable=\"yes\">Two mouse clicks in less than this length of time ("
-+  "in milliseconds) will be considered a double click</property><property "
-+  "name=\"update_policy\">delayed</property><property name=\"adjustment\">"
-+  "dclick-time</property><property name=\"digits\">0</property><property n"
-+  "ame=\"value_pos\">right</property></object><packing><property name=\"ex"
-+  "pand\">True</property><property name=\"fill\">True</property><property "
-+  "name=\"position\">1</property></packing></child><child><object class=\""
-+  "GtkLabel\" id=\"dclick-distance-label\"><property name=\"visible\">True"
-+  "</property><property name=\"can_focus\">False</property><property name="
-+  "\"xalign\">0</property><property name=\"label\" translatable=\"yes\">D_"
-+  "istance:</property><property name=\"use_underline\">True</property><pro"
-+  "perty name=\"mnemonic_widget\">dclick-distance-scale</property></object"
-+  "><packing><property name=\"expand\">True</property><property name=\"fil"
-+  "l\">True</property><property name=\"position\">2</property></packing></"
-+  "child><child><object class=\"GtkHScale\" id=\"dclick-distance-scale\"><"
-+  "property name=\"visible\">True</property><property name=\"can_focus\">T"
-+  "rue</property><property name=\"tooltip_text\" translatable=\"yes\">The "
-+  "mouse pointer cannot move farther than this distance between two clicks"
-+  " for them to be considered a double click</property><property name=\"up"
-+  "date_policy\">delayed</property><property name=\"adjustment\">dclick-di"
-+  "stance</property><property name=\"digits\">0</property><property name=\""
-+  "value_pos\">right</property></object><packing><property name=\"expand\""
-+  ">True</property><property name=\"fill\">True</property><property name=\""
-+  "position\">3</property></packing></child></object></child></object></ch"
-+  "ild><child type=\"label\"><object class=\"GtkLabel\" id=\"label8\"><pro"
-+  "perty name=\"visible\">True</property><property name=\"can_focus\">Fals"
-+  "e</property><property name=\"label\" translatable=\"yes\">Double Click<"
-+  "/property><attributes><attribute name=\"weight\" value=\"bold\"/></attr"
-+  "ibutes></object></child></object><packing><property name=\"expand\">Fal"
-+  "se</property><property name=\"fill\">True</property><property name=\"po"
-+  "sition\">1</property></packing></child></object><packing><property name"
-+  "=\"position\">1</property></packing></child><child type=\"tab\"><object"
-+  " class=\"GtkLabel\" id=\"label2\"><property name=\"visible\">True</prop"
-   "erty><property name=\"can_focus\">False</property><property name=\"labe"
--  "l\" translatable=\"yes\">Preview</property><attributes><attribute name="
--  "\"weight\" value=\"bold\"/></attributes></object></child></object><pack"
--  "ing><property name=\"expand\">False</property><property name=\"fill\">T"
--  "rue</property><property name=\"position\">1</property></packing></child"
--  "></object><packing><property name=\"expand\">False</property><property "
--  "name=\"fill\">True</property><property name=\"position\">1</property></"
--  "packing></child></object><packing><property name=\"position\">2</proper"
--  "ty></packing></child><child type=\"tab\"><object class=\"GtkLabel\" id="
--  "\"label3\"><property name=\"visible\">True</property><property name=\"c"
--  "an_focus\">False</property><property name=\"label\" translatable=\"yes\""
--  ">T_heme</property><property name=\"use_underline\">True</property></obj"
--  "ect><packing><property name=\"position\">2</property><property name=\"t"
--  "ab_fill\">False</property></packing></child></object><packing><property"
--  " name=\"expand\">True</property><property name=\"fill\">True</property>"
--  "<property name=\"position\">1</property></packing></child></object></ch"
--  "ild><action-widgets><action-widget response=\"0\">button1</action-widge"
--  "t><action-widget response=\"-11\">button2</action-widget></action-widge"
--  "ts></object><object class=\"GtkAdjustment\" id=\"theme-cursor-size\"><p"
--  "roperty name=\"lower\">16</property><property name=\"upper\">48</proper"
--  "ty><property name=\"value\">24</property><property name=\"step_incremen"
--  "t\">1</property><property name=\"page_increment\">11</property></object"
--  "><object class=\"GtkListStore\" id=\"synaptics-scroll-store\"><columns>"
--  "<column type=\"gchararray\"/><column type=\"gboolean\"/></columns><data"
--  "><row><col id=\"0\" translatable=\"yes\">Disabled</col><col id=\"1\">Tr"
--  "ue</col></row><row><col id=\"0\" translatable=\"yes\">Edge scrolling</c"
--  "ol><col id=\"1\">True</col></row><row><col id=\"0\" translatable=\"yes\""
--  ">Two-finger scrolling</col><col id=\"1\">True</col></row><row><col id=\""
--  "0\" translatable=\"yes\">Circular scrolling</col><col id=\"1\">True</co"
--  "l></row></data></object><object class=\"GtkListStore\" id=\"wacom-mode-"
--  "store\"><columns><column type=\"gchararray\"/><column type=\"gchararray"
--  "\"/></columns><data><row><col id=\"0\">ABSOLUTE</col><col id=\"1\" tran"
--  "slatable=\"yes\">Pen (absolute)</col></row><row><col id=\"0\">RELATIVE<"
--  "/col><col id=\"1\" translatable=\"yes\">Mouse (relative)</col></row></d"
--  "ata></object><object class=\"GtkListStore\" id=\"wacom-rotation-store\""
--  "><columns><column type=\"gint\"/><column type=\"gchararray\"/></columns"
--  "><data><row><col id=\"0\">0</col><col id=\"1\" translatable=\"yes\">Non"
--  "e (right-handed)</col></row><row><col id=\"0\">3</col><col id=\"1\" tra"
--  "nslatable=\"yes\">Half (left-handed)</col></row><row><col id=\"0\">1</c"
--  "ol><col id=\"1\" translatable=\"yes\">Clockwise</col></row><row><col id"
--  "=\"0\">2</col><col id=\"1\" translatable=\"yes\">Counterclockwise</col>"
--  "</row></data></object></interface>"
-+  "l\" translatable=\"yes\">_Behavior</property><property name=\"use_under"
-+  "line\">True</property></object><packing><property name=\"position\">1</"
-+  "property><property name=\"tab_fill\">False</property></packing></child>"
-+  "<child><object class=\"GtkHBox\" id=\"themes-hbox\"><property name=\"vi"
-+  "sible\">True</property><property name=\"can_focus\">False</property><pr"
-+  "operty name=\"border_width\">12</property><property name=\"spacing\">12"
-+  "</property><child><object class=\"GtkScrolledWindow\" id=\"scrolledwind"
-+  "ow2\"><property name=\"visible\">True</property><property name=\"can_fo"
-+  "cus\">True</property><property name=\"hscrollbar_policy\">automatic</pr"
-+  "operty><property name=\"vscrollbar_policy\">automatic</property><proper"
-+  "ty name=\"shadow_type\">etched-in</property><child><object class=\"GtkT"
-+  "reeView\" id=\"theme-treeview\"><property name=\"width_request\">200</p"
-+  "roperty><property name=\"visible\">True</property><property name=\"can_"
-+  "focus\">True</property><property name=\"headers_visible\">False</proper"
-+  "ty></object></child></object><packing><property name=\"expand\">True</p"
-+  "roperty><property name=\"fill\">True</property><property name=\"positio"
-+  "n\">0</property></packing></child><child><object class=\"GtkVBox\" id=\""
-+  "vbox9\"><property name=\"visible\">True</property><property name=\"can_"
-+  "focus\">False</property><property name=\"spacing\">6</property><child><"
-+  "object class=\"GtkFrame\" id=\"frame5\"><property name=\"visible\">True"
-+  "</property><property name=\"can_focus\">False</property><property name="
-+  "\"label_xalign\">0</property><property name=\"shadow_type\">none</prope"
-+  "rty><child><object class=\"GtkAlignment\" id=\"alignment5\"><property n"
-+  "ame=\"visible\">True</property><property name=\"can_focus\">False</prop"
-+  "erty><property name=\"left_padding\">12</property><child><object class="
-+  "\"GtkHBox\" id=\"hbox7\"><property name=\"visible\">True</property><pro"
-+  "perty name=\"can_focus\">False</property><property name=\"border_width\""
-+  ">6</property><property name=\"spacing\">12</property><child><object cla"
-+  "ss=\"GtkLabel\" id=\"label21\"><property name=\"visible\">True</propert"
-+  "y><property name=\"can_focus\">False</property><property name=\"label\""
-+  " translatable=\"yes\">Cursor si_ze:</property><property name=\"use_unde"
-+  "rline\">True</property><property name=\"mnemonic_widget\">spin1</proper"
-+  "ty></object><packing><property name=\"expand\">False</property><propert"
-+  "y name=\"fill\">True</property><property name=\"position\">0</property>"
-+  "</packing></child><child><object class=\"GtkSpinButton\" id=\"spin1\"><"
-+  "property name=\"visible\">True</property><property name=\"can_focus\">T"
-+  "rue</property><property name=\"primary_icon_activatable\">False</proper"
-+  "ty><property name=\"secondary_icon_activatable\">False</property><prope"
-+  "rty name=\"primary_icon_sensitive\">True</property><property name=\"sec"
-+  "ondary_icon_sensitive\">True</property><property name=\"adjustment\">th"
-+  "eme-cursor-size</property><property name=\"snap_to_ticks\">True</proper"
-+  "ty><property name=\"numeric\">True</property></object><packing><propert"
-+  "y name=\"expand\">False</property><property name=\"fill\">True</propert"
-+  "y><property name=\"position\">1</property></packing></child></object></"
-+  "child></object></child><child type=\"label\"><object class=\"GtkLabel\""
-+  " id=\"label20\"><property name=\"visible\">True</property><property nam"
-+  "e=\"can_focus\">False</property><property name=\"label\" translatable=\""
-+  "yes\">Size</property><attributes><attribute name=\"weight\" value=\"bol"
-+  "d\"/></attributes></object></child></object><packing><property name=\"e"
-+  "xpand\">False</property><property name=\"fill\">True</property><propert"
-+  "y name=\"position\">0</property></packing></child><child><object class="
-+  "\"GtkFrame\" id=\"frame6\"><property name=\"visible\">True</property><p"
-+  "roperty name=\"can_focus\">False</property><property name=\"label_xalig"
-+  "n\">0</property><property name=\"shadow_type\">none</property><child><o"
-+  "bject class=\"GtkAlignment\" id=\"alignment6\"><property name=\"visible"
-+  "\">True</property><property name=\"can_focus\">False</property><propert"
-+  "y name=\"border_width\">6</property><property name=\"xalign\">0</proper"
-+  "ty><property name=\"yalign\">0</property><property name=\"xscale\">0</p"
-+  "roperty><property name=\"yscale\">0</property><property name=\"top_padd"
-+  "ing\">6</property><property name=\"bottom_padding\">6</property><proper"
-+  "ty name=\"left_padding\">18</property><property name=\"right_padding\">"
-+  "6</property><child><object class=\"GtkImage\" id=\"theme-preview\"><pro"
-+  "perty name=\"visible\">True</property><property name=\"can_focus\">Fals"
-+  "e</property><property name=\"stock\">gtk-missing-image</property></obje"
-+  "ct></child></object></child><child type=\"label\"><object class=\"GtkLa"
-+  "bel\" id=\"label22\"><property name=\"visible\">True</property><propert"
-+  "y name=\"can_focus\">False</property><property name=\"label\" translata"
-+  "ble=\"yes\">Preview</property><attributes><attribute name=\"weight\" va"
-+  "lue=\"bold\"/></attributes></object></child></object><packing><property"
-+  " name=\"expand\">False</property><property name=\"fill\">True</property"
-+  "><property name=\"position\">1</property></packing></child></object><pa"
-+  "cking><property name=\"expand\">False</property><property name=\"fill\""
-+  ">True</property><property name=\"position\">1</property></packing></chi"
-+  "ld></object><packing><property name=\"position\">2</property></packing>"
-+  "</child><child type=\"tab\"><object class=\"GtkLabel\" id=\"label3\"><p"
-+  "roperty name=\"visible\">True</property><property name=\"can_focus\">Fa"
-+  "lse</property><property name=\"label\" translatable=\"yes\">_Theme</pro"
-+  "perty><property name=\"use_underline\">True</property></object><packing"
-+  "><property name=\"position\">2</property><property name=\"tab_fill\">Fa"
-+  "lse</property></packing></child></object><packing><property name=\"expa"
-+  "nd\">True</property><property name=\"fill\">True</property><property na"
-+  "me=\"position\">1</property></packing></child></object></child><action-"
-+  "widgets><action-widget response=\"-11\">button2</action-widget><action-"
-+  "widget response=\"0\">button1</action-widget></action-widgets></object>"
-+  "<object class=\"GtkListStore\" id=\"wacom-mode-store\"><columns><column"
-+  " type=\"gchararray\"/><column type=\"gchararray\"/></columns><data><row"
-+  "><col id=\"0\">ABSOLUTE</col><col id=\"1\" translatable=\"yes\">Pen (ab"
-+  "solute)</col></row><row><col id=\"0\">RELATIVE</col><col id=\"1\" trans"
-+  "latable=\"yes\">Mouse (relative)</col></row></data></object><object cla"
-+  "ss=\"GtkListStore\" id=\"wacom-rotation-store\"><columns><column type=\""
-+  "gint\"/><column type=\"gchararray\"/></columns><data><row><col id=\"0\""
-+  ">0</col><col id=\"1\" translatable=\"yes\">None (right-handed)</col></r"
-+  "ow><row><col id=\"0\">3</col><col id=\"1\" translatable=\"yes\">Half (l"
-+  "eft-handed)</col></row><row><col id=\"0\">1</col><col id=\"1\" translat"
-+  "able=\"yes\">Clockwise</col></row><row><col id=\"0\">2</col><col id=\"1"
-+  "\" translatable=\"yes\">Counterclockwise</col></row></data></object></i"
-+  "nterface>"
- };
- 
--static const unsigned mouse_dialog_ui_length = 37588u;
-+static const unsigned mouse_dialog_ui_length = 38582u;
- 
 -- 
 1.7.6.5
 
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
index edcb4e1..f4c2839 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings/touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch
@@ -133,7 +133,7 @@ index 62ebc60..32662cc 100644
  
      (*G_OBJECT_CLASS (xfce_pointers_helper_parent_class)->finalize) (object);
  }
-@@ -267,17 +295,17 @@ static void
+@@ -267,19 +295,19 @@ static void
  xfce_pointers_helper_syndaemon_check (XfcePointersHelper *helper)
  {
  #ifdef DEVICE_PROPERTIES
@@ -146,7 +146,9 @@ index 62ebc60..32662cc 100644
 -    Atom        *props;
 -    gint         i, nprops;
 -    gboolean     have_synaptics = FALSE;
--    gchar       *args[] = { "syndaemon", "-i", "2.0", "-K", "-R", NULL };
+-    gdouble      disable_duration;
+-    gchar        disable_duration_string[64];
+-    gchar       *args[] = { "syndaemon", "-i", disable_duration_string, "-K", "-R", NULL };
 -    GError      *error = NULL;
 +    Display               *xdisplay = GDK_DISPLAY ();
 +    XDeviceInfo           *device_list;
@@ -157,7 +159,9 @@ index 62ebc60..32662cc 100644
 +    Atom                  *props;
 +    gint                   i, nprops;
 +    gboolean               have_synaptics = FALSE;
-+    gchar                 *args[] = { "syndaemon", "-i", "2.0", "-K", "-R", NULL };
++    gdouble                disable_duration;
++    gchar                  disable_duration_string[64];
++    gchar                 *args[] = { "syndaemon", "-i", disable_duration_string, "-K", "-R", NULL };
 +    GError                *error = NULL;
  
      /* only stop a running daemon */
diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
similarity index 64%
rename from meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
rename to meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
index d633fa6..dec1f0b 100644
--- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_4.11.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
@@ -6,9 +6,9 @@ DEPENDS = "exo garcon gtk+ libxfce4util libxfce4ui xfconf dbus-glib libxi virtua
 
 inherit xfce
 
-SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
+SRC_URI = " git://gitorious.org/xfce/xfce4-settings.git;protocol=git;branch=for-oe \
+            file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
             file://0002-xsettings.xml-Set-default-themes.patch \
-            file://0003-Remember-the-settings-manager-window-size-bug-9384.patch \
             file://touchscreen/invisible \
             file://touchscreen/wait \
             file://touchscreen/0001-add-cursor-theme-xfce-invisible.patch \
@@ -17,10 +17,23 @@ SRC_URI += "file://0001-xsettings.xml-remove-trouble-causing-comment.patch \
             file://touchscreen/0004-XfceXSettingsHelper-gets-a-property-touchscreen-poin.patch \
             file://touchscreen/0005-pointers-detect-a-change-of-pointer-device-used-and-.patch \
 "
-SRC_URI[md5sum] = "3bf42281b64b10b2691008cd693f7dbd"
-SRC_URI[sha256sum] = "4a4f1e79a58b524f3a6dd030b6fc687671b35566f847e6f516c6f84211191698"
+SRCREV = "b7a0e1fd77f5bb5c372223ff62aec7acf252f061"
+S = "${WORKDIR}/git"
+PV = "4.10.0+git${SRCPV}"
 
-FILES_${PN} += "${libdir}/xfce4"
+EXTRA_OECONF += "--enable-maintainer-mode --disable-debug"
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','datetime-setter','',d)}"
+PACKAGECONFIG[datetime-setter] = "--enable-datetime-settings, --disable-datetime-settings,, tzdata"
+
+do_configure_prepend() {
+       NOCONFIGURE=yes ./autogen.sh
+}
+
+FILES_${PN} += " \
+    ${libdir}/xfce4 \
+    ${datadir}/xfce4 \
+"
 
 do_install_prepend() {
     # somehow binary files are not patched correctly by oe-patch - so copy them
-- 
1.7.6.5


