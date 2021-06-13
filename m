Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web09.23550.1623627172454142906
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Jun 2021 16:32:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jq2+eNu7;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id e1so5604113plh.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 13 Jun 2021 16:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=6oIYOhGzsxbaHu4p1EEXTkiMGkQF+S4UTOoI5rW0Nac=;
        b=jq2+eNu7W23teLjlILGgZvNDKiZFuJmDBpPkTmGmlCwSIt0HdBuPDxaF+euyZ5bFxy
         guhO7bwxtSPiXCVuvkAcuYJdn3gNXDQZ1kugKv7Dgy0qt5bnyyuPB3idSSH+kPXXPfu7
         1BTUcr+EP63HxMRTEdNriEggMYInYIjYAHq/ZOnX5lfqDUiwsGdPzphvuzH9c2uMvsgJ
         Fd2CXwzdp71O7Rr41+B0daYRGzfEPic4sAw1k43wecak4ACC7C8+ZqJjMceyfD+L6IWm
         mPEw6AH0JuJyIDMxVocXs8G3ZYnxxp5UfzV0Ck0HtOR7xl6SnbnN8SJJbjG12ibnyezJ
         Xevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=6oIYOhGzsxbaHu4p1EEXTkiMGkQF+S4UTOoI5rW0Nac=;
        b=PgHIHGi5AcbxYX8FnbeEkTrDHoyu0YN3A46lJ4NS9WeFmnI6VTMCoDTN1/XcggNAfE
         nvsrUJhcE21I1ltxyIraKPYRHh0k24sKgqLAxCq6vUuOtWqfxB5FNJBAtd0DLSpoI0kK
         M4h4fTPPkt43Re7DyWh855L+Wd+J8Obl6AXVvkhmTA3vMt3CPkLVDhgqO50O9IG5DQSg
         e8KcKO7bSyHk2pcfTcYgSA+Jp1lZ+y+TlodHPpVcPbV3XwOtFx13LdftPlP6bSY9+fw5
         EfNMl+L6JeMY1djxCSIvRPF446U0BojaWSMsNhtqdAeNF9G61NrjUfAvuAkoilwB0J+h
         W3Cw==
X-Gm-Message-State: AOAM533N47boAoMhtCxjQcn0YwwatT9Je9SCvdtvuz1PE4PvSS+RS7Mh
	pyxDEnZCLBOwN3T8V6ktrlPpHkAyHlA/fg==
X-Google-Smtp-Source: ABdhPJyJ1oaedOotGkq15Ipl+aQKFMNDLm4K5KZ/3f1mIJrSyFPX8jIbeJRCsx/4+yNvzjvDz2GQ3w==
X-Received: by 2002:a17:90b:1215:: with SMTP id gl21mr16163757pjb.33.1623627171733;
        Sun, 13 Jun 2021 16:32:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:ed93:eb87:6dc9:a518])
        by smtp.gmail.com with ESMTPSA id gd10sm9933924pjb.0.2021.06.13.16.32.51
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jun 2021 16:32:51 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [Hardknott 5/5] thunar: fix CVE-2021-32563
Date: Sun, 13 Jun 2021 16:32:44 -0700
Message-Id: <aca88908fd329f5cef6f19995b072397fb2d8ec6.1623627089.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1623627089.git.akuster808@gmail.com>
References: <cover.1623627089.git.akuster808@gmail.com>

From: Stefan Ghinea <stefan.ghinea@windriver.com>

An issue was discovered in Thunar before 4.16.7 and 4.17.x before 4.17.2.
When called with a regular file as a command-line argument, it delegates
to a different program (based on the file type) without user confirmation.
This could be used to achieve code execution.

References:
https://nvd.nist.gov/vuln/detail/CVE-2021-32563

Upstream patches:
https://gitlab.xfce.org/xfce/thunar/-/commit/9165a61f95e43cc0b5abf9b98eee2818a0191e0b
https://gitlab.xfce.org/xfce/thunar/-/commit/3b54d9d7dbd7fd16235e2141c43a7f18718f5664

Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit baa9453d57aa06554c823b5c7bd9c029e1858f89)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../thunar/thunar/CVE-2021-32563-1.patch      |  97 ++++++++
 .../thunar/thunar/CVE-2021-32563-2.patch      | 208 ++++++++++++++++++
 .../recipes-xfce/thunar/thunar_4.16.6.bb      |   4 +
 3 files changed, 309 insertions(+)
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
 create mode 100644 meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch

diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
new file mode 100644
index 0000000000..f942f990bd
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-1.patch
@@ -0,0 +1,97 @@
+From 9165a61f95e43cc0b5abf9b98eee2818a0191e0b Mon Sep 17 00:00:00 2001
+From: Alexander Schwinn <alexxcons@xfce.org>
+Date: Sat, 1 May 2021 00:40:44 +0200
+Subject: [PATCH 1/2] Dont execute files, passed via command line due to
+ security risks
+
+Instead open the containing folder and select the file.
+
+Fixes #121
+
+Upstream-Status: Backport
+CVE: CVE-2021-32563
+
+Reference to upstream patch:
+[https://gitlab.xfce.org/xfce/thunar/-/commit/9165a61f95e43cc0b5abf9b98eee2818a0191e0b]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ thunar/thunar-application.c | 25 +++++++++++++++++++++++--
+ thunar/thunar-window.c      |  4 +---
+ thunar/thunar-window.h      |  2 ++
+ 3 files changed, 26 insertions(+), 5 deletions(-)
+
+diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
+index df862fd..1243940 100644
+--- a/thunar/thunar-application.c
++++ b/thunar/thunar-application.c
+@@ -1512,8 +1512,29 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
+     }
+   else
+     {
+-      /* try to open the file or directory */
+-      thunar_file_launch (target_file, screen, startup_id, &error);
++      if (thunar_file_is_directory (file))
++        {
++          thunar_application_open_window (application, file, screen, startup_id, FALSE);
++        }
++      else
++        {
++          /* Note that for security reasons we do not execute files passed via command line */
++          /* Lets rather open the containing directory and select the file */
++          ThunarFile *parent = thunar_file_get_parent (file, NULL);
++
++          if (G_LIKELY (parent != NULL))
++            {
++              GList* files = NULL;
++              GtkWidget *window;
++
++              window = thunar_application_open_window (application, parent, screen, startup_id, FALSE);
++              g_object_unref (parent);
++
++              files = g_list_append (files, thunar_file_get_file (file));
++              thunar_window_select_files (THUNAR_WINDOW (window), files);
++              g_list_free (files);
++            }
++        }
+ 
+       /* remove the file from the list */
+       application->files_to_launch = g_list_delete_link (application->files_to_launch,
+diff --git a/thunar/thunar-window.c b/thunar/thunar-window.c
+index b330a87..b234fd3 100644
+--- a/thunar/thunar-window.c
++++ b/thunar/thunar-window.c
+@@ -243,8 +243,6 @@ static void      thunar_window_update_go_menu             (ThunarWindow
+                                                            GtkWidget              *menu);
+ static void      thunar_window_update_help_menu           (ThunarWindow           *window,
+                                                            GtkWidget              *menu);
+-static void      thunar_window_select_files               (ThunarWindow           *window,
+-                                                           GList                  *path_list);
+ static void      thunar_window_binding_create             (ThunarWindow           *window,
+                                                            gpointer                src_object,
+                                                            const gchar            *src_prop,
+@@ -891,7 +889,7 @@ thunar_window_screen_changed (GtkWidget *widget,
+  *
+  * Visually selects the files, given by the list
+  **/
+-static void
++void
+ thunar_window_select_files (ThunarWindow *window,
+                             GList        *files_to_selected)
+ {
+diff --git a/thunar/thunar-window.h b/thunar/thunar-window.h
+index 9cbcc85..3c1aad2 100644
+--- a/thunar/thunar-window.h
++++ b/thunar/thunar-window.h
+@@ -126,6 +126,8 @@ void                      thunar_window_redirect_menu_tooltips_to_statusbar (Thu
+                                                                              GtkMenu             *menu);
+ const XfceGtkActionEntry* thunar_window_get_action_entry                    (ThunarWindow        *window,
+                                                                              ThunarWindowAction   action);
++ void                     thunar_window_select_files                        (ThunarWindow         *window,
++                                                                             GList                *path_list);
+ G_END_DECLS;
+ 
+ #endif /* !__THUNAR_WINDOW_H__ */
+-- 
+2.17.1
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
new file mode 100644
index 0000000000..a22cdc6d8d
--- /dev/null
+++ b/meta-xfce/recipes-xfce/thunar/thunar/CVE-2021-32563-2.patch
@@ -0,0 +1,208 @@
+From 3b54d9d7dbd7fd16235e2141c43a7f18718f5664 Mon Sep 17 00:00:00 2001
+From: Alexander Schwinn <alexxcons@xfce.org>
+Date: Fri, 7 May 2021 15:21:27 +0200
+Subject: [PATCH 2/2] Regression: Activating Desktop Icon does not Use Default
+ Application (Issue #575)
+
+- Introduced by 9165a61f (Dont execute files, passed via command line
+due to security risks)
+- Now via DBus files are executed, and via CLI, files are just selected
+
+Fixes #575
+
+Upstream-Status: Backport
+CVE: CVE-2021-32563
+
+Reference to upstream patch:
+[https://gitlab.xfce.org/xfce/thunar/-/commit/3b54d9d7dbd7fd16235e2141c43a7f18718f5664]
+
+Signed-off-by: Stefan Ghinea <stefan.ghinea@windriver.com>
+---
+ thunar/thunar-application.c  | 68 +++++++++++++++++++++---------------
+ thunar/thunar-application.h  |  9 ++++-
+ thunar/thunar-dbus-service.c |  2 +-
+ 3 files changed, 49 insertions(+), 30 deletions(-)
+
+diff --git a/thunar/thunar-application.c b/thunar/thunar-application.c
+index 1243940..53d0b23 100644
+--- a/thunar/thunar-application.c
++++ b/thunar/thunar-application.c
+@@ -182,37 +182,38 @@ struct _ThunarApplicationClass
+ 
+ struct _ThunarApplication
+ {
+-  GtkApplication         __parent__;
++  GtkApplication                 __parent__;
+ 
+-  ThunarSessionClient   *session_client;
++  ThunarSessionClient            *session_client;
+ 
+-  ThunarPreferences     *preferences;
+-  GtkWidget             *progress_dialog;
++  ThunarPreferences              *preferences;
++  GtkWidget                      *progress_dialog;
+ 
+-  ThunarThumbnailCache  *thumbnail_cache;
+-  ThunarThumbnailer     *thumbnailer;
++  ThunarThumbnailCache           *thumbnail_cache;
++  ThunarThumbnailer              *thumbnailer;
+ 
+-  ThunarDBusService     *dbus_service;
++  ThunarDBusService              *dbus_service;
+ 
+-  gboolean               daemon;
++  gboolean                        daemon;
+ 
+-  guint                  accel_map_save_id;
+-  GtkAccelMap           *accel_map;
++  guint                           accel_map_save_id;
++  GtkAccelMap                    *accel_map;
+ 
+-  guint                  show_dialogs_timer_id;
++  guint                           show_dialogs_timer_id;
+ 
+ #ifdef HAVE_GUDEV
+-  GUdevClient           *udev_client;
++  GUdevClient                    *udev_client;
+ 
+-  GSList                *volman_udis;
+-  guint                  volman_idle_id;
+-  guint                  volman_watch_id;
++  GSList                         *volman_udis;
++  guint                           volman_idle_id;
++  guint                           volman_watch_id;
+ #endif
+ 
+-  GList                 *files_to_launch;
++  GList                          *files_to_launch;
++  ThunarApplicationProcessAction  process_file_action;
+ 
+-  guint                  dbus_owner_id_xfce;
+-  guint                  dbus_owner_id_fdo;
++  guint                           dbus_owner_id_xfce;
++  guint                           dbus_owner_id_fdo;
+ };
+ 
+ 
+@@ -279,6 +280,7 @@ thunar_application_init (ThunarApplication *application)
+    * in the primary instance anyways */
+ 
+   application->files_to_launch = NULL;
++  application->process_file_action = THUNAR_APPLICATION_SELECT_FILES;
+   application->progress_dialog = NULL;
+   application->preferences     = NULL;
+ 
+@@ -531,7 +533,7 @@ thunar_application_command_line (GApplication            *gapp,
+     }
+   else if (filenames != NULL)
+     {
+-      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error))
++      if (!thunar_application_process_filenames (application, cwd, filenames, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
+         {
+           /* we failed to process the filenames or the bulk rename failed */
+           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
+@@ -539,7 +541,7 @@ thunar_application_command_line (GApplication            *gapp,
+     }
+   else if (!daemon)
+     {
+-      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error))
++      if (!thunar_application_process_filenames (application, cwd, cwd_list, NULL, NULL, &error, THUNAR_APPLICATION_SELECT_FILES))
+         {
+           /* we failed to process the filenames or the bulk rename failed */
+           g_application_command_line_printerr (command_line, "Thunar: %s\n", error->message);
+@@ -1512,7 +1514,12 @@ thunar_application_process_files_finish (ThunarBrowser *browser,
+     }
+   else
+     {
+-      if (thunar_file_is_directory (file))
++      if (application->process_file_action == THUNAR_APPLICATION_LAUNCH_FILES)
++        {
++          /* try to launch the file / open the directory */
++          thunar_file_launch (target_file, screen, startup_id, &error);
++        }
++      else if (thunar_file_is_directory (file))
+         {
+           thunar_application_open_window (application, file, screen, startup_id, FALSE);
+         }
+@@ -1603,18 +1610,20 @@ thunar_application_process_files (ThunarApplication *application)
+  * @startup_id        : startup id to finish startup notification and properly focus the
+  *                      window when focus stealing is enabled or %NULL.
+  * @error             : return location for errors or %NULL.
++ * @action            : action to invoke on the files
+  *
+  * Tells @application to process the given @filenames and launch them appropriately.
+  *
+  * Return value: %TRUE on success, %FALSE if @error is set.
+  **/
+ gboolean
+-thunar_application_process_filenames (ThunarApplication *application,
+-                                      const gchar       *working_directory,
+-                                      gchar            **filenames,
+-                                      GdkScreen         *screen,
+-                                      const gchar       *startup_id,
+-                                      GError           **error)
++thunar_application_process_filenames (ThunarApplication               *application,
++                                      const gchar                     *working_directory,
++                                      gchar                          **filenames,
++                                      GdkScreen                       *screen,
++                                      const gchar                     *startup_id,
++                                      GError                         **error,
++                                      ThunarApplicationProcessAction   action)
+ {
+   ThunarFile *file;
+   GError     *derror = NULL;
+@@ -1686,7 +1695,10 @@ thunar_application_process_filenames (ThunarApplication *application,
+ 
+   /* start processing files if we have any to launch */
+   if (application->files_to_launch != NULL)
+-    thunar_application_process_files (application);
++    {
++      application->process_file_action = action;
++      thunar_application_process_files (application);
++    }
+ 
+   /* free the file list */
+   g_list_free (file_list);
+diff --git a/thunar/thunar-application.h b/thunar/thunar-application.h
+index 547cb70..8c180e8 100644
+--- a/thunar/thunar-application.h
++++ b/thunar/thunar-application.h
+@@ -31,6 +31,12 @@ G_BEGIN_DECLS;
+ typedef struct _ThunarApplicationClass ThunarApplicationClass;
+ typedef struct _ThunarApplication      ThunarApplication;
+ 
++typedef enum
++{
++  THUNAR_APPLICATION_LAUNCH_FILES,
++  THUNAR_APPLICATION_SELECT_FILES
++} ThunarApplicationProcessAction;
++
+ #define THUNAR_TYPE_APPLICATION             (thunar_application_get_type ())
+ #define THUNAR_APPLICATION(obj)             (G_TYPE_CHECK_INSTANCE_CAST ((obj), THUNAR_TYPE_APPLICATION, ThunarApplication))
+ #define THUNAR_APPLICATION_CLASS(klass)     (G_TYPE_CHECK_CLASS_CAST ((klass), THUNAR_TYPE_APPLICATION, ThunarApplicationClass))
+@@ -74,7 +80,8 @@ gboolean              thunar_application_process_filenames          (ThunarAppli
+                                                                      gchar            **filenames,
+                                                                      GdkScreen         *screen,
+                                                                      const gchar       *startup_id,
+-                                                                     GError           **error);
++                                                                     GError           **error,
++                                                                     ThunarApplicationProcessAction action);
+ 
+ void                  thunar_application_rename_file                (ThunarApplication *application,
+                                                                      ThunarFile        *file,
+diff --git a/thunar/thunar-dbus-service.c b/thunar/thunar-dbus-service.c
+index 2d27642..4205a2b 100644
+--- a/thunar/thunar-dbus-service.c
++++ b/thunar/thunar-dbus-service.c
+@@ -991,7 +991,7 @@ thunar_dbus_service_launch_files (ThunarDBusFileManager  *object,
+     {
+       /* let the application process the filenames */
+       application = thunar_application_get ();
+-      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error);
++      thunar_application_process_filenames (application, working_directory, filenames, screen, startup_id, &error, THUNAR_APPLICATION_LAUNCH_FILES);
+       g_object_unref (G_OBJECT (application));
+ 
+       /* release the screen */
+-- 
+2.17.1
+
diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
index 128043d19b..7bef08ed95 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.16.6.bb
@@ -8,6 +8,10 @@ inherit xfce gobject-introspection features_check mime-xdg
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
+SRC_URI += "file://CVE-2021-32563-1.patch \
+            file://CVE-2021-32563-2.patch \
+           "
+
 SRC_URI[sha256sum] = "cb531d3fe67196a43ca04979ef271ece7858bbc80c15b0ee4323c1252a1a02b7"
 
 PACKAGECONFIG ??= ""
-- 
2.17.1

