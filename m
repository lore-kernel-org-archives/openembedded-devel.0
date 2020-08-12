Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com [209.85.216.67])
 by mx.groups.io with SMTP id smtpd.web12.602.1597269846948991021
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Aug 2020 15:04:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VUNEiGwo;
 spf=pass (domain: gmail.com, ip: 209.85.216.67, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f67.google.com with SMTP id l60so1800859pjb.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Aug 2020 15:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPsO0vKvnaT6diWxZ0EHXldtNWDA8K4D2+VK9C57awU=;
        b=VUNEiGwoO+0Ow7OnUiQmAA1KcIoOrgoh4QXJpmV7EOBv5ukQ40kr32MyOltPrFEDwn
         PJfkb5oYU0tx6EyKE/zwcW6GMMXql6T+X+Gx0vxlaZ4XMIcOLGNOVD0a4cLi8UqouaN8
         k1sGeg3OaQpTzJuDzdmwytOXYQhAPQviIMGESgEx2m9tL1gY0sO6TO6CxkNUpNR50GJD
         r11tPkZRPEIIV1kpF8zEUAPL8jRrsAL2iP1hkLDyiXt657iZgff5kTFn++lIImQwtdvg
         xpFYKyLN9NG0I2lpNzLkLvknk2CjMsioGi2oY1NC7UJKYHodQRTHf6ShKIvFLH8NHzxf
         XTag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gPsO0vKvnaT6diWxZ0EHXldtNWDA8K4D2+VK9C57awU=;
        b=BWHzjBN2KgixXC3xAzHiM8n2hMNTII6OYDYB0IqqnF7L2PCkw6VyA4dGEWWVW7BmPT
         +0h8xGjLP0sH2Scu57jjJ3zbZIKzv6lFQhwvJjjl53YV3CvvQKk8AmhZs2lDCDYLG3p+
         1Qj04YWzEKuGFK1w01USuZD0e0Tk7GxtETDHL2TqAnpRSNBJi8NZz/JCg/M+KjhFd5Pb
         60Ur0asHoDeP4p6aiPiaLryI9TVwq6rYDgIEEUDf4v/ZkzuGqR+x2qh5dyLU2AEXEC3a
         EEm2dCUC2Cst25ncSYNYrt0EgV/SxNZcrdlsoAWvGAFN+XKaOs76GWlv4HkL3+riByXK
         R0jA==
X-Gm-Message-State: AOAM532FYRHferzXIkBJont5KnKr7HJ4FES1UhHnLsQfrjAK7eCtQJDj
	IiVePLnrZpj8UpY4AKhzH94tHctEafw=
X-Google-Smtp-Source: ABdhPJzGLA5s4Y1AkiH6IjqE/HlkBZ4tw/lNkm7u5Qt4DJghSpDD2PchlV3tMBBMcM8a5RkfUcTLlA==
X-Received: by 2002:a17:902:9787:: with SMTP id q7mr1377652plp.0.1597269845980;
        Wed, 12 Aug 2020 15:04:05 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::e60c])
        by smtp.gmail.com with ESMTPSA id x136sm3390745pfc.28.2020.08.12.15.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2020 15:04:05 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: schnitzeltony@gmail.com,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-xfce][PATCH 1/3] xfce4-sensors-plugin: Fix build with -fno-common
Date: Wed, 12 Aug 2020 15:03:56 -0700
Message-Id: <20200812220358.1690080-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ple-definition-errors-under-GCC-10.0.patch | 118 ++++++++++++++++++
 .../sensors/xfce4-sensors-plugin_1.3.92.bb    |   4 +-
 2 files changed, 121 insertions(+), 1 deletion(-)
 create mode 100644 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
new file mode 100644
index 0000000000..30cb487c8f
--- /dev/null
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
@@ -0,0 +1,118 @@
+From 6c6de7c07290248a3c72a50c7790885ee4bc13a2 Mon Sep 17 00:00:00 2001
+From: Robin Lee <cheeselee@fedoraproject.org>
+Date: Mon, 24 Feb 2020 17:52:39 +0800
+Subject: [PATCH] Fix multiple definition errors under GCC 10.0
+
+Fixes #16436, RHBZ#1800268
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ include/sensors-interface-common.h | 22 ++++++++++++++--------
+ lib/sensors-interface-common.c     |  1 +
+ 2 files changed, 15 insertions(+), 8 deletions(-)
+
+diff --git a/include/sensors-interface-common.h b/include/sensors-interface-common.h
+index 62a27eb..05146c5 100644
+--- a/include/sensors-interface-common.h
++++ b/include/sensors-interface-common.h
+@@ -146,6 +146,12 @@ t_sensors_dialog;
+ 
+ 
+ 
++#ifdef XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
++#define EXTERN
++#else
++#define EXTERN extern
++#endif
++
+ /* Extern functions that need to be re-implemented in the sensors-viewer and
+  * the panel code.
+  * They kind of need to be registered at the library by any software
+@@ -157,7 +163,7 @@ t_sensors_dialog;
+  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*adjustment_value_changed) (GtkWidget *ptr_widget,
+                              t_sensors_dialog *ptr_sensorsdialog);
+ 
+@@ -167,7 +173,7 @@ void
+  * @param ptr_widget: Pointer to original widget, i.e, the sensor entry combobox
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*sensor_entry_changed) (GtkWidget *ptr_widget,
+                          t_sensors_dialog *ptr_sensorsdialog);
+ 
+@@ -178,7 +184,7 @@ void
+  * @param ptr_str_newtext: Pointer to the string containing the new label
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*list_cell_text_edited) (GtkCellRendererText *ptr_cellrenderertext,
+                           gchar *ptr_str_path, gchar *ptr_str_newtext,
+                           t_sensors_dialog *ptr_sensorsdialog);
+@@ -189,7 +195,7 @@ void
+  * @param ptr_str_path: pointer to the string with the path of the changed item
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*list_cell_toggle) (GtkCellRendererToggle *ptr_cellrenderertoggle, gchar *ptr_str_path,
+                      t_sensors_dialog *ptr_sensorsdialog);
+ 
+@@ -201,7 +207,7 @@ void
+  *                          hexadecimal rgb format #0011ff
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*list_cell_color_edited) (GtkCellRendererText *ptr_cellrenderertext,
+                            gchar *ptr_str_path, gchar *ptr_str_newcolor,
+                            t_sensors_dialog *ptr_sensorsdialog);
+@@ -214,7 +220,7 @@ void
+  *                        temperature
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*minimum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
+                     gchar *ptr_str_newmin, t_sensors_dialog *ptr_sensorsdialog);
+ 
+@@ -226,7 +232,7 @@ void
+  *                        temperature
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*maximum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
+                     gchar *ptr_str_newmax, t_sensors_dialog *ptr_sensorsdialog);
+ 
+@@ -236,7 +242,7 @@ void
+  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
+  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
+  */
+-void
++EXTERN void
+ (*temperature_unit_change) (GtkWidget *ptr_widget,
+                             t_sensors_dialog *ptr_sensorsdialog);
+ 
+diff --git a/lib/sensors-interface-common.c b/lib/sensors-interface-common.c
+index 70aa154..8c79f1d 100644
+--- a/lib/sensors-interface-common.c
++++ b/lib/sensors-interface-common.c
+@@ -28,6 +28,7 @@
+ #include <libxfce4panel/xfce-panel-plugin.h>
+ 
+ /* Local/package includes */
++#define XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
+ #include <configuration.h>
+ #include <sensors-interface-common.h>
+ #include <middlelayer.h>
+-- 
+2.24.1
+
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
index 3fd0ff6cf4..aa5fe019d5 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
@@ -7,7 +7,9 @@ inherit xfce-panel-plugin
 
 SRC_URI[md5sum] = "7327c4c316ebd5d93665e77b432b8d89"
 SRC_URI[sha256sum] = "3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112"
-SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
+SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch \
+            file://0001-Fix-multiple-definition-errors-under-GCC-10.0.patch \
+           "
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.28.0

