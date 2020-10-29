Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.6521.1603965835491692855
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Oct 2020 03:03:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tlJ9IVqd;
 spf=pass (domain: gmail.com, ip: 209.85.218.41, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f41.google.com with SMTP id bn26so2983573ejb.6
        for <openembedded-devel@lists.openembedded.org>; Thu, 29 Oct 2020 03:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DiR+pRHauRP4c3PW6o4LY7KwqKPUCFmbBUcz0TjdntQ=;
        b=tlJ9IVqdyGcJOsyYX+AnK857xRtBsIF223ed/zBKkSb2+85oOMiacIS4NNZjlOpgyC
         ElijR4AMwFCP27G+CuFgZhgg9BFFhRvI8bwnM+621LHk9AtNuFZdDGO+1aFUNuR9QNum
         tkGulFxkTDm2r/9vwn5Ynx4ns/Y4CEKNLiU2OWz5y1zRVMVi9i8xvFkzNvyQPFRN3Oiz
         9GyUCZ82AfOQ7Q5eCbOJUW0loLKgCQmn1lE+8tnyySOjhoDhdlIzQdNpVtFkSrrocm33
         6D3cAq/Dl0vnuC6RJRLUWhzPsFVAYqO9shuNARH3eRXXnAU15AB5vQ1a7CsE3D5pngAI
         ck1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DiR+pRHauRP4c3PW6o4LY7KwqKPUCFmbBUcz0TjdntQ=;
        b=pT+WBIts+nJT5U61iv7jnaziKx3he/d5TQEuGZhtD5qAtMfPMCYzoKTS0LIe+64C3j
         YGp4/RycsoAZb2N//jNym3SVw/Wx+kPyU/BVcgByPlYdbtpGbTVkBYAIaSTTDBY9wbcj
         t/pfe8Q7xqmbWnKTs+vNpACvAhs0+nXtM17/UF0OI+PiTgxEcgtr4EC0XUiavOiIZyJE
         YgrfkUwG0JqEJpEGp0YyIKAyNuJ6vv1DUK66rA2cE2B99HsySJ1BIGSniXlD/WqoFjWH
         +7NQvRrL3VgFKQ4+NnHvMJ2DHXxHcN1QcLRoAv7DyXwSX13seH87+sxlUnDmWFPV4jbK
         rmxw==
X-Gm-Message-State: AOAM530aZEYF71TRLcRvBuh16YcZ/I9zfpDhdJZwl6CRRTIQ4T8ZmUSW
	xGWAS50jSYH6KzFSLCRS8Uor5PkMq5Wh0Q==
X-Google-Smtp-Source: ABdhPJxhKm2kvzvZDseFPo9w6eeFbpH/4nvCDn0+xlwr1EV8cq9u6m5tWmbEylW7bzJEGvTlvGyEiA==
X-Received: by 2002:a17:906:5d9:: with SMTP id t25mr3155471ejt.443.1603965833529;
        Thu, 29 Oct 2020 03:03:53 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q2sm1196316ejd.20.2020.10.29.03.03.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 03:03:53 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 4/4] gnome-calendar: update to 3.38.1, add libhandy 1.x support
Date: Thu, 29 Oct 2020 11:03:39 +0100
Message-Id: <20201029100339.26698-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201029100339.26698-1-alex.kanavin@gmail.com>
References: <20201029100339.26698-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...61b6ce8f0f8053e1609decbdbdc164ec8448.patch | 242 ++++++++++++++++++
 ...dar_3.36.2.bb => gnome-calendar_3.38.1.bb} |   3 +-
 2 files changed, 244 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
 rename meta-gnome/recipes-gnome/gnome-calendar/{gnome-calendar_3.36.2.bb => gnome-calendar_3.38.1.bb} (78%)

diff --git a/meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch b/meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
new file mode 100644
index 000000000..eabf61aa5
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-calendar/files/8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch
@@ -0,0 +1,242 @@
+From 8be361b6ce8f0f8053e1609decbdbdc164ec8448 Mon Sep 17 00:00:00 2001
+From: Evangelos Ribeiro Tzaras <devrtz@fortysixandtwo.eu>
+Date: Sat, 5 Sep 2020 02:06:34 +0200
+Subject: [PATCH] project: Switch to libhandy-1
+
+This commit updates the dependencies for libhandy to the tagged 1.0
+release and changes the code to accomodate the changes from
+libhandy-0 to libhandy-1.
+
+Notable changes:
+edit-dialog: HdyDialog has been dropped in [1]
+alarm-row: action child type in HdyActionRow has been removed.
+
+[1] https://gitlab.gnome.org/GNOME/libhandy/-/merge_requests/434
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ build-aux/flatpak/org.gnome.Calendar.json |  4 ++--
+ meson.build                               |  2 +-
+ src/gui/gcal-alarm-row.c                  |  2 +-
+ src/gui/gcal-alarm-row.ui                 |  2 +-
+ src/gui/gcal-application.c                |  4 ++++
+ src/gui/gcal-edit-dialog.c                |  4 ++--
+ src/gui/gcal-edit-dialog.h                |  3 +--
+ src/gui/gcal-edit-dialog.ui               | 20 ++++++++++----------
+ 8 files changed, 22 insertions(+), 19 deletions(-)
+
+diff --git a/build-aux/flatpak/org.gnome.Calendar.json b/build-aux/flatpak/org.gnome.Calendar.json
+index 18893ad6..0772ca8d 100644
+--- a/build-aux/flatpak/org.gnome.Calendar.json
++++ b/build-aux/flatpak/org.gnome.Calendar.json
+@@ -174,8 +174,8 @@
+             "sources" : [
+                 {
+                     "type" : "git",
+-                    "url" : "https://source.puri.sm/Librem5/libhandy.git",
+-                    "branch" : "libhandy-0-0"
++                    "url" : "https://gitlab.gnome.org/GNOME/libhandy.git",
++                    "tag" : "1.0.0"
+                 }
+             ]
+         },
+diff --git a/meson.build b/meson.build
+index 2a546252..b81b95c9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -165,7 +165,7 @@ libedataserver_dep = dependency('libedataserver-1.2', version: '>= 3.17.1')
+ libecal_dep = dependency('libecal-2.0', version: '>= 3.33.2')
+ libsoup_dep = dependency('libsoup-2.4')
+ libdazzle_dep = dependency('libdazzle-1.0', version: '>= 3.33.1')
+-libhandy_dep = dependency('libhandy-0.0', version: '>= 0.0.9')
++libhandy_dep = dependency('libhandy-1', version: '>= 1.0.0')
+ glib_dep = dependency('glib-2.0', version: '>= 2.58.0')
+ gtk_dep = dependency('gtk+-3.0', version: '>= 3.22.20')
+ gio_dep = dependency('gio-2.0', version: '>= 2.58.0')
+diff --git a/src/gui/gcal-alarm-row.c b/src/gui/gcal-alarm-row.c
+index 1f95426c..1ada82f4 100644
+--- a/src/gui/gcal-alarm-row.c
++++ b/src/gui/gcal-alarm-row.c
+@@ -214,7 +214,7 @@ setup_alarm (GcalAlarmRow *self)
+   duration = e_cal_component_alarm_trigger_get_duration (trigger);
+   formatted_duration = format_alarm_duration (duration);
+ 
+-  hdy_action_row_set_title (HDY_ACTION_ROW (self), formatted_duration);
++  hdy_preferences_row_set_title (HDY_PREFERENCES_ROW (self), formatted_duration);
+ 
+   action = e_cal_component_alarm_get_action (self->alarm);
+   gtk_toggle_button_set_active (self->volume_button, action == E_CAL_COMPONENT_ALARM_AUDIO);
+diff --git a/src/gui/gcal-alarm-row.ui b/src/gui/gcal-alarm-row.ui
+index 7d416c4c..bca8af50 100644
+--- a/src/gui/gcal-alarm-row.ui
++++ b/src/gui/gcal-alarm-row.ui
+@@ -3,7 +3,7 @@
+   <template class="GcalAlarmRow" parent="HdyActionRow">
+     <property name="visible">True</property>
+     <property name="can_focus">False</property>
+-    <child type="action">
++    <child>
+       <object class="GtkBox">
+         <property name="visible">True</property>
+         <property name="can_focus">False</property>
+diff --git a/src/gui/gcal-application.c b/src/gui/gcal-application.c
+index b9d46cec..591b95c8 100644
+--- a/src/gui/gcal-application.c
++++ b/src/gui/gcal-application.c
+@@ -34,6 +34,7 @@
+ #include <glib-object.h>
+ #include <gio/gio.h>
+ #include <glib/gi18n.h>
++#include <handy.h>
+ 
+ struct _GcalApplication
+ {
+@@ -446,6 +447,9 @@ gcal_application_startup (GApplication *app)
+   if ((g_application_get_flags (app) & G_APPLICATION_IS_SERVICE) != 0)
+     g_application_set_inactivity_timeout (app, 3 * 60 * 1000);
+ 
++  /*  initialize libhandy */
++  hdy_init();
++
+   GCAL_EXIT;
+ }
+ 
+diff --git a/src/gui/gcal-edit-dialog.c b/src/gui/gcal-edit-dialog.c
+index ae2b6714..5494a700 100644
+--- a/src/gui/gcal-edit-dialog.c
++++ b/src/gui/gcal-edit-dialog.c
+@@ -47,7 +47,7 @@
+ 
+ struct _GcalEditDialog
+ {
+-  HdyDialog         parent;
++  GtkDialog         parent;
+ 
+   gboolean          writable;
+ 
+@@ -133,7 +133,7 @@ static void          on_location_entry_changed_cb                (GtkEntry
+ static void          on_add_alarm_button_clicked_cb              (GtkWidget          *button,
+                                                                   GcalEditDialog     *self);
+ 
+-G_DEFINE_TYPE (GcalEditDialog, gcal_edit_dialog, HDY_TYPE_DIALOG)
++G_DEFINE_TYPE (GcalEditDialog, gcal_edit_dialog, GTK_TYPE_DIALOG)
+ 
+ enum
+ {
+diff --git a/src/gui/gcal-edit-dialog.h b/src/gui/gcal-edit-dialog.h
+index e4f44ec5..a557916b 100644
+--- a/src/gui/gcal-edit-dialog.h
++++ b/src/gui/gcal-edit-dialog.h
+@@ -22,7 +22,6 @@
+ #include "gcal-event.h"
+ #include "gcal-manager.h"
+ 
+-#include <handy.h>
+ 
+ G_BEGIN_DECLS
+ 
+@@ -32,7 +31,7 @@ G_BEGIN_DECLS
+ 
+ #define GCAL_TYPE_EDIT_DIALOG                (gcal_edit_dialog_get_type ())
+ 
+-G_DECLARE_FINAL_TYPE (GcalEditDialog, gcal_edit_dialog, GCAL, EDIT_DIALOG, HdyDialog);
++G_DECLARE_FINAL_TYPE (GcalEditDialog, gcal_edit_dialog, GCAL, EDIT_DIALOG, GtkDialog);
+ 
+ GtkWidget*           gcal_edit_dialog_new                     (void);
+ 
+diff --git a/src/gui/gcal-edit-dialog.ui b/src/gui/gcal-edit-dialog.ui
+index a36d8ae6..c28c22bb 100644
+--- a/src/gui/gcal-edit-dialog.ui
++++ b/src/gui/gcal-edit-dialog.ui
+@@ -1,6 +1,6 @@
+ <?xml version="1.0" encoding="UTF-8"?>
+ <interface>
+-  <template class="GcalEditDialog" parent="HdyDialog">
++  <template class="GcalEditDialog" parent="GtkDialog">
+     <property name="can_focus">False</property>
+     <property name="resizable">False</property>
+     <property name="modal">True</property>
+@@ -156,7 +156,7 @@
+                         <property name="title" translatable="yes">Title</property>
+                         <property name="activatable-widget">summary_entry</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkEntry" id="summary_entry">
+                             <property name="visible">True</property>
+                             <property name="valign">center</property>
+@@ -177,7 +177,7 @@
+                         <property name="title" translatable="yes">Location</property>
+                         <property name="activatable-widget">location_entry</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkEntry" id="location_entry">
+                             <property name="visible">True</property>
+                             <property name="valign">center</property>
+@@ -226,7 +226,7 @@
+                         <property name="title" translatable="yes">All Day</property>
+                         <property name="activatable-widget">all_day_switch</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkSwitch" id="all_day_switch">
+                             <property name="visible">True</property>
+                             <property name="can_focus">True</property>
+@@ -246,7 +246,7 @@
+                         <property name="visible">True</property>
+                         <property name="title" translatable="yes">Starts</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkLabel" id="event_start_label">
+                             <property name="visible">True</property>
+                             <property name="can_focus">False</property>
+@@ -294,7 +294,7 @@
+                         <property name="visible">True</property>
+                         <property name="title" translatable="yes">Ends</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkLabel" id="event_end_label">
+                             <property name="visible">True</property>
+                             <property name="can_focus">False</property>
+@@ -343,7 +343,7 @@
+                         <property name="title" translatable="yes">Repeat</property>
+                         <property name="activatable-widget">repeat_combo</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkComboBoxText" id="repeat_combo">
+                             <property name="visible">True</property>
+                             <property name="can_focus">False</property>
+@@ -372,7 +372,7 @@
+                         <property name="title" translatable="yes">End Repeat</property>
+                         <property name="activatable-widget">repeat_combo</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class="GtkComboBoxText" id="repeat_duration_combo">
+                             <property name="visible">True</property>
+                             <property name="can_focus">False</property>
+@@ -397,7 +397,7 @@
+                         <property name="title" translatable="yes">Number of Occurrences</property>
+                         <property name="activatable-widget">number_of_occurrences_spin</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class = "GtkSpinButton" id="number_of_occurrences_spin">
+                             <property name="input_purpose">number</property>
+                             <property name="input-hints">no-emoji</property>
+@@ -415,7 +415,7 @@
+                         <property name="title" translatable="yes">End Repeat Date</property>
+                         <property name="activatable-widget">until_date_selector</property>
+ 
+-                        <child type="action">
++                        <child>
+                           <object class = "GcalDateSelector" id="until_date_selector">
+                             <property name="valign">center</property>
+                           </object>
+-- 
+GitLab
+
diff --git a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.38.1.bb
similarity index 78%
rename from meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb
rename to meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.38.1.bb
index 4605857f5..67e251e16 100644
--- a/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.36.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-calendar/gnome-calendar_3.38.1.bb
@@ -22,7 +22,8 @@ inherit gnomebase gsettings gtk-icon-cache gettext features_check upstream-versi
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.sha256sum] = "d0b05345c0555a085e6e5426eab49494aba2826c856eb06fd7fdb762ec0c4c1f"
+SRC_URI += "file://8be361b6ce8f0f8053e1609decbdbdc164ec8448.patch"
+SRC_URI[archive.sha256sum] = "7280880a082d631624d02a102dd547ceb59498da368311f3e49a06cff897f512"
 
 FILES_${PN} += " \
     ${datadir}/gnome-shell \
-- 
2.29.0

