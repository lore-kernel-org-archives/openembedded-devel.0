Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.54334.1622527724908651778
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 May 2021 23:08:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 15168fT2019252
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 31 May 2021 23:08:41 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Mon, 31 May 2021 23:08:40 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Mon, 31 May 2021 23:08:39 -0700
From: "kai" <kai.kang@windriver.com>
To: <schnitzeltony@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-xfce][PATCH] thunar: 4.16.6 -> 4.16.8
Date: Tue, 1 Jun 2021 14:08:37 +0800
Message-ID: <20210601060837.35359-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The commits to fix CVE-2021-32563 have been merged in 4.16.8.

4.16.8
======
- Activating Desktop Icon does not Use Default Application (Issue #575)
- Translation Updates: Spanish

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../thunar/thunar/CVE-2021-32563-1.patch      |  97 --------
 .../thunar/thunar/CVE-2021-32563-2.patch      | 208 ------------------
 .../{thunar_4.16.6.bb => thunar_4.16.8.bb}    |   6 +-
 3 files changed, 1 insertion(+), 310 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
 delete mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
 rename meta-xfce/recipes-xfce/thunar/{thunar_4.16.6.bb => thunar_4.16.8.bb} (80%)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
deleted file mode 100644
index f942f990b..000000000
--- a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 9165a61f95e43cc0b5abf9b98eee2818a0191e0b Mon Sep 17 00:00:00 2001
-From: Alexander Schwinn <alexxcons@xfce.org>
-Date: Sat, 1 May 2021 00:40:44 +0200
-Subject: [PATCH 1/2] Dont execute files, passed via command line due to
- security risks
-
-Instead open the containing folder and select the file.
-
-Fixes #121
-
-Upstream-Status: Backport
-CVE: CVE-2021-32563
-
-Reference to upstream patch:
-[https://gitlab.xfce.org/xfce/thunar/-/commit/9165a61f95e43cc0b5abf9b98eee2818a0191e0b]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- thunar/thunar-application.c | 25 +++++++++++++++++++++++--
- thunar/thunar-window.c      |  4 +---
- thunar/thunar-window.h      |  2 ++
- 3 files changed, 26 insertions(+), 5 deletions(-)
-
-diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
-index df862fd..1243940 100644
---- a/thunar/thunar-application.c
-+++ b/thunar/thunar-application.c
-@@ -1512,8 +1512,29 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
-     }
-   else
-     {
--      /* try to open the file or directory */
--      thunar_file_launch (target_file, screen, startup_id, &error);
-+      if (thunar_file_is_directory (file))
-+        {
-+          thunar_application_open_window (application, file, screen, startup_id, FALSE);
-+        }
-+      else
-+        {
-+          /* Note that for security reasons we do not execute files passed via command line */
-+          /* Lets rather open the containing directory and select the file */
-+          ThunarFile *parent = thunar_file_get_parent (file, NULL);
-+
-+          if (G_LIKELY (parent != NULL))
-+            {
-+              GList* files = NULL;
-+              GtkWidget *window;
-+
-+              window = thunar_application_open_window (application, parent, screen, startup_id, FALSE);
-+              g_object_unref (parent);
-+
-+              files = g_list_append (files, thunar_file_get_file (file));
-+              thunar_window_select_files (THUNAR_WINDOW (window), files);
-+              g_list_free (files);
-+            }
-+        }
- 
-       /* remove the file from the list */
-       application->files_to_launch = g_list_delete_link (application->files_to_launch,
-diff --git a/thunar/thunar-window.c b/thunar/thunar-window.c
-index b330a87..b234fd3 100644
---- a/thunar/thunar-window.c
-+++ b/thunar/thunar-window.c
-@@ -243,8 +243,6 @@ static void      thunar_window_update_go_menu             (ThunarWindow
-                                                            GtkWidget              *menu);
- static void      thunar_window_update_help_menu           (ThunarWindow           *window,
-                                                            GtkWidget              *menu);
--static void      thunar_window_select_files               (ThunarWindow           *window,
--                                                           GList                  *path_list);
- static void      thunar_window_binding_create             (ThunarWindow           *window,
-                                                            gpointer                src_object,
-                                                            const gchar            *src_prop,
-@@ -891,7 +889,7 @@ thunar_window_screen_changed (GtkWidget *widget,
-  *
-  * Visually selects the files, given by the list
-  **/
--static void
-+void
- thunar_window_select_files (ThunarWindow *window,
-                             GList        *files_to_selected)
- {
-diff --git a/thunar/thunar-window.h b/thunar/thunar-window.h
-index 9cbcc85..3c1aad2 100644
---- a/thunar/thunar-window.h
-+++ b/thunar/thunar-window.h
-@@ -126,6 +126,8 @@ void                      thunar_window_redirect_menu_tooltips_to_statusbar (Thu
-                                                                              GtkMenu             *menu);
- const XfceGtkActionEntry* thunar_window_get_action_entry                    (ThunarWindow        *window,
-                                                                              ThunarWindowAction   action);
-+ void                     thunar_window_select_files                        (ThunarWindow         *window,
-+                                                                             GList                *path_list);
- G_END_DECLS;
- 
- #endif /* !__THUNAR_WINDOW_H__ */
--- 
-2.17.1
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
deleted file mode 100644
index a22cdc6d8..000000000
--- a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
+++ /dev/null
@@ -1,208 +0,0 @@
-From 3b54d9d7dbd7fd16235e2141c43a7f18718f5664 Mon Sep 17 00:00:00 2001
-From: Alexander Schwinn <alexxcons@xfce.org>
-Date: Fri, 7 May 2021 15:21:27 +0200
-Subject: [PATCH 2/2] Regression: Activating Desktop Icon does not Use Default
- Application (Issue #575)
-
-- Introduced by 9165a61f (Dont execute files, passed via command line
-due to security risks)
-- Now via DBus files are executed, and via CLI, files are just selected
-
-Fixes #575
-
-Upstream-Status: Backport
-CVE: CVE-2021-32563
-
-Reference to upstream patch:
-[https://gitlab.xfce.org/xfce/thunar/-/commit/3b54d9d7dbd7fd16235e2141c43a7f18718f5664]
-
-Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
----
- thunar/thunar-application.c  | 68 +++++++++++++++++++++---------------
- thunar/thunar-application.h  |  9 ++++-
- thunar/thunar-dbus-service.c |  2 +-
- 3 files changed, 49 insertions(+), 30 deletions(-)
-
-diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
-index 1243940..53d0b23 100644
---- a/thunar/thunar-application.c
-+++ b/thunar/thunar-application.c
-@@ -182,37 +182,38 @@ struct _ThunarApplicationClass
- 
- struct _ThunarApplication
- {
--  GtkApplication         __parent__;
-+  GtkApplication                 __parent__;
- 
--  ThunarSessionClient   *session_client;
-+  ThunarSessionClient            *session_client;
- 
--  ThunarPreferences     *preferences;
--  GtkWidget             *progress_dialog;
-+  ThunarPreferences              *preferences;
-+  GtkWidget                      *progress_dialog;
- 
--  ThunarThumbnailCache  *thumbnail_cache;
--  ThunarThumbnailer     *thumbnailer;
-+  ThunarThumbnailCache           *thumbnail_cache;
-+  ThunarThumbnailer              *thumbnailer;
- 
--  ThunarDBusService     *dbus_service;
-+  ThunarDBusService              *dbus_service;
- 
--  gboolean               daemon;
-+  gboolean                        daemon;
- 
--  guint                  accel_map_save_id;
--  GtkAccelMap           *accel_map;
-+  guint                           accel_map_save_id;
-+  GtkAccelMap                    *accel_map;
- 
--  guint                  show_dialogs_timer_id;
-+  guint                           show_dialogs_timer_id;
- 
- #ifdef HAVE_GUDEV
--  GUdevClient           *udev_client;
-+  GUdevClient                    *udev_client;
- 
--  GSList                *volman_udis;
--  guint                  volman_idle_id;
--  guint                  volman_watch_id;
-+  GSList                         *volman_udis;
-+  guint                           volman_idle_id;
-+  guint                           volman_watch_id;
- #endif
- 
--  GList                 *files_to_launch;
-+  GList                          *files_to_launch;
-+  ThunarApplicationProcessAction  process_file_action;
- 
--  guint                  dbus_owner_id_xfce;
--  guint                  dbus_owner_id_fdo;
-+  guint                           dbus_owner_id_xfce;
-+  guint                           dbus_owner_id_fdo;
- };
- 
- 
-@@ -279,6 +280,7 @@ thunar_application_init (ThunarApplication *application)
-    * in the primary instance anyways */
- 
-   application->files_to_launch = NULL;
-+  application->process_file_action = THUNAR_APPLICATION_SELECT_FILES;
-   application->progress_dialog = NULL;
-   application->preferences     = NULL;
- 
-@@ -531,7 +533,7 @@ thunar_application_command_line (GApplication            *gapp,
-     }
-   else if (filenames != NULL)
-     {
--      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error))
-+      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
-         {
-           /* we failed to process the filenames or the bulk rename failed */
-           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
-@@ -539,7 +541,7 @@ thunar_application_command_line (GApplication            *gapp,
-     }
-   else if (!daemon)
-     {
--      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error))
-+      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
-         {
-           /* we failed to process the filenames or the bulk rename failed */
-           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
-@@ -1512,7 +1514,12 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
-     }
-   else
-     {
--      if (thunar_file_is_directory (file))
-+      if (application->process_file_action == THUNAR_APPLICATION_LAUNCH_FILES)
-+        {
-+          /* try to launch the file / open the directory */
-+          thunar_file_launch (target_file, screen, startup_id, &error);
-+        }
-+      else if (thunar_file_is_directory (file))
-         {
-           thunar_application_open_window (application, file, screen, startup_id, FALSE);
-         }
-@@ -1603,18 +1610,20 @@ thunar_application_process_files (ThunarApplication *application)
-  * @startup_id        : startup id to finish startup notification and properly focus the
-  *                      window when focus stealing is enabled or %NULL.
-  * @error             : return location for errors or %NULL.
-+ * @action            : action to invoke on the files
-  *
-  * Tells @application to process the given @filenames and launch them appropriately.
-  *
-  * Return value: %TRUE on success, %FALSE if @error is set.
-  **/
- gboolean
--thunar_application_process_filenames (ThunarApplication *application,
--                                      const gchar       *working_directory,
--                                      gchar            **filenames,
--                                      GdkScreen         *screen,
--                                      const gchar       *startup_id,
--                                      GError           **error)
-+thunar_application_process_filenames (ThunarApplication               *application,
-+                                      const gchar                     *working_directory,
-+                                      gchar                          **filenames,
-+                                      GdkScreen                       *screen,
-+                                      const gchar                     *startup_id,
-+                                      GError                         **error,
-+                                      ThunarApplicationProcessAction   action)
- {
-   ThunarFile *file;
-   GError     *derror = NULL;
-@@ -1686,7 +1695,10 @@ thunar_application_process_filenames (ThunarApplication *application,
- 
-   /* start processing files if we have any to launch */
-   if (application->files_to_launch != NULL)
--    thunar_application_process_files (application);
-+    {
-+      application->process_file_action = action;
-+      thunar_application_process_files (application);
-+    }
- 
-   /* free the file list */
-   g_list_free (file_list);
-diff --git a/thunar/thunar-application.h b/thunar/thunar-application.h
-index 547cb70..8c180e8 100644
---- a/thunar/thunar-application.h
-+++ b/thunar/thunar-application.h
-@@ -31,6 +31,12 @@ G_BEGIN_DECLS;
- typedef struct _ThunarApplicationClass ThunarApplicationClass;
- typedef struct _ThunarApplication      ThunarApplication;
- 
-+typedef enum
-+{
-+  THUNAR_APPLICATION_LAUNCH_FILES,
-+  THUNAR_APPLICATION_SELECT_FILES
-+} ThunarApplicationProcessAction;
-+
- #define THUNAR_TYPE_APPLICATION             (thunar_application_get_type ())
- #define THUNAR_APPLICATION(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), THUNAR_TYPE_APPLICATION, ThunarApplication))
- #define THUNAR_APPLICATION_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), THUNAR_TYPE_APPLICATION, ThunarApplicationClass))
-@@ -74,7 +80,8 @@ gboolean              thunar_application_process_filenames          (ThunarAppli
-                                                                      gchar            **filenames,
-                                                                      GdkScreen         *screen,
-                                                                      const gchar       *startup_id,
--                                                                     GError           **error);
-+                                                                     GError           **error,
-+                                                                     ThunarApplicationProcessAction action);
- 
- void                  thunar_application_rename_file                (ThunarApplication *application,
-                                                                      ThunarFile        *file,
-diff --git a/thunar/thunar-dbus-service.c b/thunar/thunar-dbus-service.c
-index 2d27642..4205a2b 100644
---- a/thunar/thunar-dbus-service.c
-+++ b/thunar/thunar-dbus-service.c
-@@ -991,7 +991,7 @@ thunar_dbus_service_launch_files (ThunarDBusFileManager  *object,
-     {
-       /* let the application process the filenames */
-       application = thunar_application_get ();
--      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error);
-+      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error, THUNAR_APPLICATION_LAUNCH_FILES);
-       g_object_unref (G_OBJECT (application));
- 
-       /* release the screen */
--- 
-2.17.1
-
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb
similarity index 80%
rename from meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
rename to meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb
index 7bef08ed9..bdc357f76 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.8.bb
@@ -8,11 +8,7 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI += "file://CVE-2021-32563-1.patch \
-            file://CVE-2021-32563-2.patch \
-           "
-
-SRC_URI[sha256sum] = "cb531d3fe67196a43ca04979ef271ece7858bbc80c15b0ee4323c1252a1a02b7"
+SRC_URI[sha256sum] = "038ca228d220cd0ba1b7b76465d8a51f2433ad1f74648d1d291daa0a24cb3195"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre"
-- 
2.17.1

