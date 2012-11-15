Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TYy5X-0001t1-VA
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 12:58:37 +0100
Received: by mail-bk0-f47.google.com with SMTP id jk7so626991bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2012 03:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=K7wLw7AoTa3BJfEk0vfpxGvd1pK5MDDuKfNKIXx39X4=;
	b=ML4v9y/cJko7XNdBCKyotGBZ+jT/v+qfstYgqMmpnZ999KdNjBb3Jnz/ov7avOykG0
	4SHGW/EJA+owXSmOkLQb4g8APqlrPUUy0+5leM6eddcRcDhY1C/8XkN2yYBBS59I93Bv
	tJjX73Fgc8wXc5vRYC3TTAHWLwJQ3swSmnOSVo+4WboUAKXe7c2LPMtqVGb3Ywcv1mcd
	6zRQvyAdi73XdT1jclnmG1ksOQ/6aLkGVMq2aD7Ec6BkbWuK0QUzlNbHuLnzYAI3BwzC
	64nr9GAp8pk3XtgqfOFiiwRGZ0yYwyfgRo1R3Po1lnnTY4pJzyQjTBnQ9a3r8gWi9iCw
	QJJw==
Received: by 10.204.145.217 with SMTP id e25mr266407bkv.123.1352979874557;
	Thu, 15 Nov 2012 03:44:34 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ia2sm9964081bkc.11.2012.11.15.03.44.32
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Nov 2012 03:44:33 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 15 Nov 2012 12:44:46 +0100
Message-Id: <1352979886-24043-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
Subject: [meta-oe][PATCH] omgps: add patch to fix build with latest glib from oe-core
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
X-List-Received-Date: Thu, 15 Nov 2012 11:58:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../omgps/omgps/fix.build.with.glib.2.34.patch     | 122 +++++++++++++++++++++
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |   2 +
 2 files changed, 124 insertions(+)
 create mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch

diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
new file mode 100644
index 0000000..e953663
--- /dev/null
+++ b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
@@ -0,0 +1,122 @@
+diff -uNr omgps.orig/src/dbus_intf.c omgps/src/dbus_intf.c
+--- omgps.orig/src/dbus_intf.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/dbus_intf.c	2012-11-14 14:44:45.435381443 +0100
+@@ -171,7 +171,7 @@
+ 	gpsdata->svinfo_valid = TRUE;
+ 
+ 	int i, j;
+-	GValueArray *val;
++	GArray *val;
+ 	svinfo_channel_t *sv;
+ 
+ 	j = 0;
+@@ -179,16 +179,16 @@
+ 		val = satellites->pdata[i];
+ 
+ 		sv = &gpsdata->sv_channels[j];
+-		sv->sv_id = g_value_get_uint(g_value_array_get_nth(val, 0));
++		sv->sv_id = g_array_index(val, guint, 0);
+ 
+-		if (g_value_get_boolean(g_value_array_get_nth(val, 1))) {
++		if (g_array_index(val, gboolean, 1)) {
+ 			++gpsdata->sv_in_use;
+ 			sv->flags = 0x01;
+ 		}
+ 
+-		sv->elevation = (int)g_value_get_uint(g_value_array_get_nth(val, 2));
+-		sv->azimuth = (int)g_value_get_uint(g_value_array_get_nth(val, 3));
+-		sv->cno = g_value_get_uint(g_value_array_get_nth(val, 4));
++		sv->elevation = (int)g_array_index(val, guint, 2);
++		sv->azimuth = (int)g_array_index(val, guint, 3);
++		sv->cno = g_array_index(val, guint, 4);
+ 		if (sv->cno > 0)
+ 			++gpsdata->sv_get_signal;
+ 
+diff -uNr omgps.orig/src/main.c omgps/src/main.c
+--- omgps.orig/src/main.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/main.c	2012-11-14 14:46:00.345402222 +0100
+@@ -489,9 +489,6 @@
+ 
+ 	g_type_init();
+ 
+-	if (! g_thread_supported ())
+-		g_thread_init(NULL);
+-
+ 	gdk_threads_init();
+ 
+ 	gdk_threads_enter();
+diff -uNr omgps.orig/src/tab_gpscfg.c omgps/src/tab_gpscfg.c
+--- omgps.orig/src/tab_gpscfg.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/tab_gpscfg.c	2012-11-14 15:23:47.526925258 +0100
+@@ -222,7 +222,7 @@
+ 
+ static gboolean change_platform_model_cmd(void *model_id)
+ {
+-	U1 model = (U1)(int) model_id;
++	U1 model = (U1)GPOINTER_TO_INT(model_id);
+ 	int gps_dev_fd = 0;
+ 
+ 	/* non ubx means: we need open serial port
+@@ -269,7 +269,7 @@
+ static void change_platmodel_button_clicked(GtkWidget *widget, gpointer data)
+ {
+ 	int idx = gtk_combo_box_get_active(GTK_COMBO_BOX(platmodel_list));
+-	char *model_id = (void *)(int)platmodel_values[idx];
++	void *model_id = (void *)GINT_TO_POINTER(platmodel_values[idx]);
+ 
+ 	if (POLL_ENGINE_TEST(UBX)) {
+ 		gtk_widget_set_sensitive(change_platmodel_button, FALSE);
+diff -uNr omgps.orig/src/tab_menu.c omgps/src/tab_menu.c
+--- omgps.orig/src/tab_menu.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/tab_menu.c	2012-11-14 15:25:08.217941513 +0100
+@@ -65,7 +65,7 @@
+ 
+ static void poll_button_clicked(GtkWidget *widget, gpointer data)
+ {
+-	gboolean is_start_bt = (gboolean)data;
++	gboolean is_start_bt = (gboolean) GPOINTER_TO_INT(data);
+ 
+ 	if (POLL_STATE_TEST(RUNNING) == is_start_bt)
+ 		return;
+diff -uNr omgps.orig/src/tab_tile.c omgps/src/tab_tile.c
+--- omgps.orig/src/tab_tile.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/tab_tile.c	2012-11-14 15:25:30.392945800 +0100
+@@ -101,7 +101,7 @@
+ static gboolean set_bg_map(GtkTreeModel *model, GtkTreePath *path, GtkTreeIter *iter, gpointer data)
+ {
+ 	map_repo_t *repo;
+-	gboolean clear = (gboolean)data;
++	gboolean clear = (gboolean)GPOINTER_TO_INT(data);
+ 
+ 	int type;
+ 
+@@ -240,7 +240,7 @@
+ 
+ static void alpha_radio_toggled (GtkWidget *widget, gpointer user_data)
+ {
+-	int idx = (int)user_data;
++	int idx = (int)GPOINTER_TO_INT(user_data);
+ 
+ 	if (g_view.bg_alpha_idx == idx)
+ 		return;
+@@ -384,7 +384,7 @@
+ 
+ 	for (i=0; i<ALPHA_LEVELS; i++) {
+ 		g_signal_connect (G_OBJECT (alpha_radios[i]), "toggled",
+-			G_CALLBACK (alpha_radio_toggled), (gpointer)i);
++			G_CALLBACK (alpha_radio_toggled), GINT_TO_POINTER(i));
+ 		gtk_container_add(GTK_CONTAINER (alpha_hbox), alpha_radios[i]);
+ 	}
+ 
+diff -uNr omgps.orig/src/tab_view.c omgps/src/tab_view.c
+--- omgps.orig/src/tab_view.c	2011-12-12 12:22:47.000000000 +0100
++++ omgps/src/tab_view.c	2012-11-14 15:25:47.018949453 +0100
+@@ -534,7 +534,7 @@
+ 
+ static void* change_zoom_routine(void *args)
+ {
+-	gboolean is_zoom_in = (gboolean)args;
++	gboolean is_zoom_in = (gboolean)GPOINTER_TO_INT(args);
+ 	stop = FALSE;
+ 
+ 	int hi = (is_zoom_in)?
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
index 59fd9b0..0d788b6 100644
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
 DEPENDS = "gtk+ python-pygobject dbus-glib"
 SRCREV = "109"
 PV = "0.1+svnr${SRCPV}"
+PR = "r1"
 S = "${WORKDIR}/${PN}"
 
 do_configure_prepend() {
@@ -18,6 +19,7 @@ SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
            file://sysfs.node.2.6.32.patch \
            file://fix.capability.patch \
            file://use.unused.variable.patch \
+           file://fix.build.with.glib.2.34.patch \
 "
 
 inherit autotools
-- 
1.8.0



