Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D072777376
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Feb 2016 14:23:44 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 23 Feb 2016 06:23:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,489,1449561600"; d="scan'208";a="751677040"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 23 Feb 2016 06:23:44 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 23 Feb 2016 16:20:08 +0200
Message-Id: <9fc6cfed11eaad36b724f579bd8c9fae3e089214.1456236552.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
References: <cover.1456236552.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 29/34] omgps: remove the recipe
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
X-List-Received-Date: Tue, 23 Feb 2016 14:23:45 -0000

The project is dead upstream, and relies on pygobject 2.x which has been replaced
by 3.x in oe.core.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...g_type_init-is-deprecated-for-glib-2.35.0.patch |  33 ------
 .../omgps/omgps/fix.build.with.gcc.4.9.patch       |  22 ----
 .../omgps/omgps/fix.build.with.glib.2.34.patch     | 125 ---------------------
 .../omgps/omgps/fix.capability.patch               |  62 ----------
 .../recipes-navigation/omgps/omgps/gcc-4.4.patch   |  71 ------------
 .../omgps/omgps/gdk-pixbuf-2.26.5.patch            |  15 ---
 .../omgps/omgps/sysfs.node.2.6.32.patch            |  14 ---
 .../omgps/omgps/use.unused.variable.patch          |  15 ---
 meta-oe/recipes-navigation/omgps/omgps_svn.bb      |  29 -----
 9 files changed, 386 deletions(-)
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
 delete mode 100644 meta-oe/recipes-navigation/omgps/omgps_svn.bb

diff --git a/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch b/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
deleted file mode 100644
index 6b9f465..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/0001-g_type_init-is-deprecated-for-glib-2.35.0.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 22bcf06637d64e40af6c152e28b31eef41e3f583 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 13 Jun 2013 02:35:22 -0700
-Subject: [PATCH] g_type_init() is deprecated for glib >= 2.35.0
-
-Call it for old versions.
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
----
- src/main.c |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/main.c b/src/main.c
-index e984da4..a63ddf3 100644
---- a/src/main.c
-+++ b/src/main.c
-@@ -486,9 +486,9 @@ int main(int argc, char **argv)
- 		if (strcmp(argv[1], "-log2file") == 0)
- 			log2console = FALSE;
- 	}
--
-+#if !GLIB_CHECK_VERSION(2,35,0)
- 	g_type_init();
--
-+#endif
- 	gdk_threads_init();
- 
- 	gdk_threads_enter();
--- 
-1.7.9.5
-
diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
deleted file mode 100644
index 1680bc0..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.gcc.4.9.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-omgps: omgps fails compilation due to uninitialized variables
-
-omgps does not compile with gcc 4.9 due to uninitialized variables 
-with the option -Werror=maybe-uninitialized
-To solve the problem, just initiated the variable and checked for side
-effects.
-Upstream-Status: Submitted
-+https://code.google.com/p/omgps/issues/detail?id=16
-
-Signed-off-by: Raphael Silva <rapphil@gmail.com>
-diff -urpN omgps.orig/src/sound.c omgps/src/sound.c
---- omgps.orig/src/sound.c	2014-12-14 15:13:29.609243994 -0200
-+++ omgps/src/sound.c	2014-12-14 15:14:13.831116745 -0200
-@@ -44,7 +44,7 @@ static gboolean play_sound_files(char *f
- 		return FALSE;
- 
- 	char *bak = strdup(files);
--	char *saveptr;
-+	char *saveptr = NULL;
- 	char *p = strtok_r(bak, ";", &saveptr);
- 
- 	#define MAX_SOUND_FILES 14
diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
deleted file mode 100644
index ec3bde0..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/fix.build.with.glib.2.34.patch
+++ /dev/null
@@ -1,125 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
-diff -uNr omgps.orig/src/dbus_intf.c omgps/src/dbus_intf.c
---- omgps.orig/src/dbus_intf.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/dbus_intf.c	2012-11-14 14:44:45.435381443 +0100
-@@ -171,7 +171,7 @@
- 	gpsdata->svinfo_valid = TRUE;
- 
- 	int i, j;
--	GValueArray *val;
-+	GArray *val;
- 	svinfo_channel_t *sv;
- 
- 	j = 0;
-@@ -179,16 +179,16 @@
- 		val = satellites->pdata[i];
- 
- 		sv = &gpsdata->sv_channels[j];
--		sv->sv_id = g_value_get_uint(g_value_array_get_nth(val, 0));
-+		sv->sv_id = g_array_index(val, guint, 0);
- 
--		if (g_value_get_boolean(g_value_array_get_nth(val, 1))) {
-+		if (g_array_index(val, gboolean, 1)) {
- 			++gpsdata->sv_in_use;
- 			sv->flags = 0x01;
- 		}
- 
--		sv->elevation = (int)g_value_get_uint(g_value_array_get_nth(val, 2));
--		sv->azimuth = (int)g_value_get_uint(g_value_array_get_nth(val, 3));
--		sv->cno = g_value_get_uint(g_value_array_get_nth(val, 4));
-+		sv->elevation = (int)g_array_index(val, guint, 2);
-+		sv->azimuth = (int)g_array_index(val, guint, 3);
-+		sv->cno = g_array_index(val, guint, 4);
- 		if (sv->cno > 0)
- 			++gpsdata->sv_get_signal;
- 
-diff -uNr omgps.orig/src/main.c omgps/src/main.c
---- omgps.orig/src/main.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/main.c	2012-11-14 14:46:00.345402222 +0100
-@@ -489,9 +489,6 @@
- 
- 	g_type_init();
- 
--	if (! g_thread_supported ())
--		g_thread_init(NULL);
--
- 	gdk_threads_init();
- 
- 	gdk_threads_enter();
-diff -uNr omgps.orig/src/tab_gpscfg.c omgps/src/tab_gpscfg.c
---- omgps.orig/src/tab_gpscfg.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/tab_gpscfg.c	2012-11-14 15:23:47.526925258 +0100
-@@ -222,7 +222,7 @@
- 
- static gboolean change_platform_model_cmd(void *model_id)
- {
--	U1 model = (U1)(int) model_id;
-+	U1 model = (U1)GPOINTER_TO_INT(model_id);
- 	int gps_dev_fd = 0;
- 
- 	/* non ubx means: we need open serial port
-@@ -269,7 +269,7 @@
- static void change_platmodel_button_clicked(GtkWidget *widget, gpointer data)
- {
- 	int idx = gtk_combo_box_get_active(GTK_COMBO_BOX(platmodel_list));
--	char *model_id = (void *)(int)platmodel_values[idx];
-+	void *model_id = (void *)GINT_TO_POINTER(platmodel_values[idx]);
- 
- 	if (POLL_ENGINE_TEST(UBX)) {
- 		gtk_widget_set_sensitive(change_platmodel_button, FALSE);
-diff -uNr omgps.orig/src/tab_menu.c omgps/src/tab_menu.c
---- omgps.orig/src/tab_menu.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/tab_menu.c	2012-11-14 15:25:08.217941513 +0100
-@@ -65,7 +65,7 @@
- 
- static void poll_button_clicked(GtkWidget *widget, gpointer data)
- {
--	gboolean is_start_bt = (gboolean)data;
-+	gboolean is_start_bt = (gboolean) GPOINTER_TO_INT(data);
- 
- 	if (POLL_STATE_TEST(RUNNING) == is_start_bt)
- 		return;
-diff -uNr omgps.orig/src/tab_tile.c omgps/src/tab_tile.c
---- omgps.orig/src/tab_tile.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/tab_tile.c	2012-11-14 15:25:30.392945800 +0100
-@@ -101,7 +101,7 @@
- static gboolean set_bg_map(GtkTreeModel *model, GtkTreePath *path, GtkTreeIter *iter, gpointer data)
- {
- 	map_repo_t *repo;
--	gboolean clear = (gboolean)data;
-+	gboolean clear = (gboolean)GPOINTER_TO_INT(data);
- 
- 	int type;
- 
-@@ -240,7 +240,7 @@
- 
- static void alpha_radio_toggled (GtkWidget *widget, gpointer user_data)
- {
--	int idx = (int)user_data;
-+	int idx = (int)GPOINTER_TO_INT(user_data);
- 
- 	if (g_view.bg_alpha_idx == idx)
- 		return;
-@@ -384,7 +384,7 @@
- 
- 	for (i=0; i<ALPHA_LEVELS; i++) {
- 		g_signal_connect (G_OBJECT (alpha_radios[i]), "toggled",
--			G_CALLBACK (alpha_radio_toggled), (gpointer)i);
-+			G_CALLBACK (alpha_radio_toggled), GINT_TO_POINTER(i));
- 		gtk_container_add(GTK_CONTAINER (alpha_hbox), alpha_radios[i]);
- 	}
- 
-diff -uNr omgps.orig/src/tab_view.c omgps/src/tab_view.c
---- omgps.orig/src/tab_view.c	2011-12-12 12:22:47.000000000 +0100
-+++ omgps/src/tab_view.c	2012-11-14 15:25:47.018949453 +0100
-@@ -534,7 +534,7 @@
- 
- static void* change_zoom_routine(void *args)
- {
--	gboolean is_zoom_in = (gboolean)args;
-+	gboolean is_zoom_in = (gboolean)GPOINTER_TO_INT(args);
- 	stop = FALSE;
- 
- 	int hi = (is_zoom_in)?
diff --git a/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch b/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
deleted file mode 100644
index 3ed86d8..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/fix.capability.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
-we need to include config.h first to know if HAVE_SYS_CAPABILITY_H is enabled or no, otherwise
-sys/capability.h is not included and later used
-| src/network.c: In function 'can_ping':
-| src/network.c:198:2: error: 'cap_flag_value_t' undeclared (first use in this function)
-| src/network.c:198:2: note: each undeclared identifier is reported only once for each function it appears in
-| src/network.c:198:19: error: expected ';' before 'cap'
-| src/network.c:199:2: error: 'cap_t' undeclared (first use in this function)
-| src/network.c:199:8: error: expected ';' before 'caps'
-| src/network.c:200:6: error: 'caps' undeclared (first use in this function)
-| cc1: warnings being treated as errors
-| src/network.c:203:2: error: implicit declaration of function 'cap_get_flag'
-| src/network.c:203:21: error: 'CAP_SYS_NICE' undeclared (first use in this function)
-| src/network.c:203:35: error: 'CAP_EFFECTIVE' undeclared (first use in this function)
-| src/network.c:203:51: error: 'cap' undeclared (first use in this function)
-| src/network.c:204:17: error: 'CAP_CLEAR' undeclared (first use in this function)
-| src/network.c:210:1: error: control reaches end of non-void function
-| make[1]: *** [omgps-network.o] Error 1
-
-and -lcap is needed for 2 functions later (should be added only for HAVE_SYS_CAPABILITY_H enabled, but I don't care enough)
-| omgps-network.o: In function `can_ping':
-| /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/omgps-0.1+svnr109-r1/omgps/src/network.c:199: undefined reference to `cap_get_proc'
-| /OE/tmpdir-shr/work/armv4t-oe-linux-gnueabi/omgps-0.1+svnr109-r1/omgps/src/network.c:203: undefined reference to `cap_get_flag'
-| collect2: ld returned 1 exit status
-
---- omgps.orig/src/network.c	2009-10-28 18:51:16.000000000 +0100
-+++ omgps/src/network.c	2011-05-09 09:59:11.637676772 +0200
-@@ -19,16 +19,16 @@
- #include <assert.h>
- #include <glib.h>
- 
--#if (HAVE_SYS_CAPABILITY_H)
--#undef _POSIX_SOURCE
--#include <sys/capability.h>
--#endif
--
- #include "config.h"
- #include "util.h"
- #include "network.h"
- #include "customized.h"
- 
-+#if (HAVE_SYS_CAPABILITY_H)
-+#undef _POSIX_SOURCE
-+#include <sys/capability.h>
-+#endif
-+
- /**
-  * Ping: reference <Unix network programming>, volume 1, third edition.
-  */
---- omgps.orig/Makefile.am	2009-10-28 18:51:17.000000000 +0100
-+++ omgps/Makefile.am	2011-05-09 10:04:58.578676679 +0200
-@@ -33,7 +33,7 @@
- 
- omgps_CFLAGS = $(common_CFLAGS) -O2
- omgps_LDFLAGS = 
--omgps_LDADD = @DEPENDENCIES_LIBS@ -lpython$(PY_VERSION)
-+omgps_LDADD = @DEPENDENCIES_LIBS@ -lcap -lpython$(PY_VERSION)
- 
- omgps_SOURCES =          \
-   src/ctx_agps_online.c  \
diff --git a/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch b/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
deleted file mode 100644
index 41f6471..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/gcc-4.4.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
-diff -uNr omgps.orig/src/include/map_repo.h omgps/src/include/map_repo.h
---- omgps.orig/src/include/map_repo.h	2009-07-20 19:54:08.000000000 +0200
-+++ omgps/src/include/map_repo.h	2010-01-17 14:55:24.000000000 +0100
-@@ -3,6 +3,9 @@
- 
- #include <glib.h>
- #include <gdk/gdk.h>
-+// workaround Python.h unconditionally (re)defines _XOPEN_SOURCE and _POSIX_C_SOURCE
-+#undef _XOPEN_SOURCE
-+#undef _POSIX_C_SOURCE
- #include <Python.h>
- 
- #define MAP_MAX_BG_COLORS	5
-diff -uNr omgps.orig/src/include/py_ext.h omgps/src/include/py_ext.h
---- omgps.orig/src/include/py_ext.h	2009-07-20 19:54:08.000000000 +0200
-+++ omgps/src/include/py_ext.h	2010-01-17 14:55:57.000000000 +0100
-@@ -4,8 +4,8 @@
- void py_ext_init();
- void py_ext_cleanup();
- 
--void inline py_ext_trylock();
--void inline py_ext_lock();
--void inline py_ext_unlock();
-+void py_ext_trylock();
-+void py_ext_lock();
-+void py_ext_unlock();
- 
- #endif /* PY_EXT_H_ */
-diff -uNr omgps.orig/src/include/uart.h omgps/src/include/uart.h
---- omgps.orig/src/include/uart.h	2009-07-20 19:54:08.000000000 +0200
-+++ omgps/src/include/uart.h	2010-01-17 14:33:00.000000000 +0100
-@@ -12,9 +12,9 @@
- extern void uart_cleanup();
- extern void uart_close();
- 
--extern inline int read_with_timeout(U1 *buf, int len);
--extern inline int write_with_timeout(U1 *buf, int len);
--extern inline gboolean read_fixed_len(U1 *buf, int expected_len);
-+extern int read_with_timeout(U1 *buf, int len);
-+extern int write_with_timeout(U1 *buf, int len);
-+extern gboolean read_fixed_len(U1 *buf, int expected_len);
- 
- extern int sysfs_get_gps_device_power();
- extern gboolean gps_device_power_on();
-diff -uNr omgps.orig/src/py_ext.c omgps/src/py_ext.c
---- omgps.orig/src/py_ext.c	2009-07-20 19:54:08.000000000 +0200
-+++ omgps/src/py_ext.c	2010-01-17 14:56:46.000000000 +0100
-@@ -26,17 +26,17 @@
- 		Py_Finalize();
- }
- 
--void inline py_ext_trylock()
-+void py_ext_trylock()
- {
- 	TRYLOCK_MUTEX(&lock);
- }
- 
--void inline py_ext_lock()
-+void py_ext_lock()
- {
- 	LOCK_MUTEX(&lock);
- }
- 
--void inline py_ext_unlock()
-+void py_ext_unlock()
- {
- 	UNLOCK_MUTEX(&lock);
- }
diff --git a/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch b/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
deleted file mode 100644
index 6880805..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/gdk-pixbuf-2.26.5.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
-diff -uNr omgps/src/tab_scratch.c omgps.new/src/tab_scratch.c
---- omgps/src/tab_scratch.c	2012-12-22 18:13:25.994788128 +0100
-+++ omgps.new/src/tab_scratch.c	2012-12-22 18:12:45.876790644 +0100
-@@ -51,7 +51,7 @@
- 	}
- 
- 	gboolean ret = gdk_pixbuf_save (pixbuf, buf, SCREENSHOT_FILE_TYPE, &err, "tEXt::Software", "omgps", NULL);
--	gdk_pixbuf_unref(pixbuf);
-+	g_object_unref(pixbuf);
- 
- 	if (ret) {
- 		char buf1[128];
diff --git a/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch b/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
deleted file mode 100644
index 290c5e6..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/sysfs.node.2.6.32.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
-diff -uNr omgps.orig//src/uart.c omgps/src/uart.c
---- omgps.orig//src/uart.c	2010-08-22 23:34:09.000000000 +0200
-+++ omgps/src/uart.c	2010-08-22 23:33:54.000000000 +0200
-@@ -30,6 +30,7 @@
-  * NOTE: these file paths are subject to change according to kernel and distribution.
-  */
- static const char *sysfs_gps_power[] = {
-+	"/sys/bus/platform/devices/gta02-pm-gps.0/power_on",
- 	"/sys/bus/platform/devices/neo1973-pm-gps.0/power_on",
- 	"/sys/bus/platform/devices/neo1973-pm-gps.0/pwron"
- };
diff --git a/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch b/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
deleted file mode 100644
index 3ccb14e..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps/use.unused.variable.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Submitted
-https://code.google.com/p/omgps/issues/detail?id=15
-
---- a/src/settings.c	2011-12-12 13:21:30.573400795 +0100
-+++ b/src/settings.c	2011-12-12 14:11:05.269606119 +0100
-@@ -278,6 +278,9 @@
- 	}
- 
- 	ret = check_settings(errbuf, ERRBUF_LEN);
-+	if (ret == FALSE) {
-+		snprintf(errbuf, ERRBUF_LEN, "Something wrong while loading settings file");
-+	}
- 
- 	if (fd > 0)
- 		close(fd);
diff --git a/meta-oe/recipes-navigation/omgps/omgps_svn.bb b/meta-oe/recipes-navigation/omgps/omgps_svn.bb
deleted file mode 100644
index 696e863..0000000
--- a/meta-oe/recipes-navigation/omgps/omgps_svn.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "GPS application for openmoko freerunner"
-HOMEPAGE = "http://omgps.googlecode.com"
-SECTION = "openmoko/applications"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552"
-DEPENDS = "gtk+ python-pygobject dbus-glib libcap"
-SRCREV = "109"
-PV = "0.1+svnr${SRCPV}"
-PR = "r2"
-S = "${WORKDIR}/${BPN}"
-
-do_configure_prepend() {
-    sed -i "s#PY_VERSION = 2.6#PY_VERSION = ${PYTHON_BASEVERSION}#g" ${S}/Makefile.am
-    sed -i "s#PY_INC_DIR = \$(OPIEDIR)#PY_INC_DIR = ${STAGING_DIR_HOST}#g" ${S}/Makefile.am
-    sed -i "s#dist_conf_DATA = data/etc/\*\.\*#dist_conf_DATA = ${S}/data/etc/\*\.\*#g" ${S}/Makefile.am
-}
-
-SRC_URI = "svn://omgps.googlecode.com/svn/trunk;module=omgps;protocol=http \
-           file://gcc-4.4.patch \
-           file://sysfs.node.2.6.32.patch \
-           file://fix.capability.patch \
-           file://use.unused.variable.patch \
-           file://fix.build.with.glib.2.34.patch \
-           file://gdk-pixbuf-2.26.5.patch \
-           file://0001-g_type_init-is-deprecated-for-glib-2.35.0.patch \
-           file://fix.build.with.gcc.4.9.patch \
-"
-
-inherit autotools pkgconfig
-- 
2.7.0


