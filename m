Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.9416.1609946278216889536
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 07:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=oUdi+huk;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: schnitzeltony@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id t16so5396047ejf.13
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Jan 2021 07:17:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=mMC2heq+25axhd+j6qWAHkpwIFcVyhC0AeiTGxIAAF0=;
        b=oUdi+hukk2g7NwY9shK+ztc5AX9RYM8nah/pUCI9QfQ16M3RzqYADP0W2cF3ibFF/m
         HbxEOGxK9EAIj5vt74MrPkeHk1aQfGB0LmULRMyKnerLwhrxZtJbnNKCD+xvYofgerqp
         H5E/oPqLpIfcQkH5KGbz2MCoA54RUks75pOyC8nDTp/yX5eEw6oBDxcbSHC/tV2vuTaw
         +9k7pt+XZ0Po9srqGcYS11ONkZ4FyC+f22oAhp43cYmyb7GSWaoJk37MVUQ98EkFOFne
         vjqpE/WLQW3gbfppVtih/MANoGkZgDTbNuN3xCnWC2V9O85l1WWxn/MgMU7CXMbP4v0z
         cq9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mMC2heq+25axhd+j6qWAHkpwIFcVyhC0AeiTGxIAAF0=;
        b=Cp6YMCoxwbs0fJqxzl7vUR0HohlfQMwHBZE1T2iTgfR5SCSWM4tvMRJMoUX+8RnqZT
         /t6DvDU5QaUOKMWkm0peHlum/D75gDSbe/U8tY8KJQR2bXYB/CziXiw6sOiHSS8A6zqL
         GLekmEi3ZMYw2tgvoS8vp854s6MkmtITUBqw9u7f5SQYiXYTqg5kJ+ZuQpyLp7gFPMZY
         wi//dRq+y2u36gpVNcUCRI3c+ZuahB1JnviOiRTOIsg7luLHEuWxb2U5C5affQPpyjb6
         ILPaXXsaFm1syiYFQMcnLhgS138LsyOdY0Hsw8uP61NtZwsF3PDa6GcrT9PaDGbVixdZ
         MtJA==
X-Gm-Message-State: AOAM530U8LycjFXE+BdKV4JU4opD6ISkRJcNVwuS2UgCSPw+KxzKESkp
	Fy0W201lKwBP6NQStsZL3hpwK9BGKHwQdw==
X-Google-Smtp-Source: ABdhPJwjAajMIFJN4Xz4JHCL8SAHctWZmAvMmXfpBPj4K8oDKLNWN2c4xu6UL81968V/pQgpMslEzg==
X-Received: by 2002:a17:906:4e45:: with SMTP id g5mr3181959ejw.391.1609946276819;
        Wed, 06 Jan 2021 07:17:56 -0800 (PST)
Return-Path: <schnitzeltony@gmail.com>
Received: from superandy.speedport.ip (p200300f07f47431850a04677ec24921a.dip0.t-ipconnect.de. [2003:f0:7f47:4318:50a0:4677:ec24:921a])
        by smtp.gmail.com with ESMTPSA id lc18sm1366899ejb.77.2021.01.06.07.17.55
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jan 2021 07:17:55 -0800 (PST)
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 21/28] xfce4-sensors-plugin: upgrade 1.3.92 -> 1.3.95
Date: Wed,  6 Jan 2021 16:17:10 +0100
Message-Id: <20210106151717.1779543-21-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210106151717.1779543-1-schnitzeltony@gmail.com>
References: <20210106151717.1779543-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

First version compatible to xfce 4.16

Release notes for 1.3.95
========================
Updated translations;
code cleanups (thanks to all contributors and Xfce dev team);
compatibility to Xfce 4.16.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 ...ple-definition-errors-under-GCC-10.0.patch | 118 ------------------
 ...3.92.bb => xfce4-sensors-plugin_1.3.95.bb} |   7 +-
 2 files changed, 2 insertions(+), 123 deletions(-)
 delete mode 100644 meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
 rename meta-xfce/recipes-panel-plugins/sensors/{xfce4-sensors-plugin_1.3.92.bb => xfce4-sensors-plugin_1.3.95.bb} (77%)

diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
deleted file mode 100644
index 30cb487c8..000000000
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin/0001-Fix-multiple-definition-errors-under-GCC-10.0.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From 6c6de7c07290248a3c72a50c7790885ee4bc13a2 Mon Sep 17 00:00:00 2001
-From: Robin Lee <cheeselee@fedoraproject.org>
-Date: Mon, 24 Feb 2020 17:52:39 +0800
-Subject: [PATCH] Fix multiple definition errors under GCC 10.0
-
-Fixes #16436, RHBZ#1800268
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/sensors-interface-common.h | 22 ++++++++++++++--------
- lib/sensors-interface-common.c     |  1 +
- 2 files changed, 15 insertions(+), 8 deletions(-)
-
-diff --git a/include/sensors-interface-common.h b/include/sensors-interface-common.h
-index 62a27eb..05146c5 100644
---- a/include/sensors-interface-common.h
-+++ b/include/sensors-interface-common.h
-@@ -146,6 +146,12 @@ t_sensors_dialog;
- 
- 
- 
-+#ifdef XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
-+#define EXTERN
-+#else
-+#define EXTERN extern
-+#endif
-+
- /* Extern functions that need to be re-implemented in the sensors-viewer and
-  * the panel code.
-  * They kind of need to be registered at the library by any software
-@@ -157,7 +163,7 @@ t_sensors_dialog;
-  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*adjustment_value_changed) (GtkWidget *ptr_widget,
-                              t_sensors_dialog *ptr_sensorsdialog);
- 
-@@ -167,7 +173,7 @@ void
-  * @param ptr_widget: Pointer to original widget, i.e, the sensor entry combobox
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*sensor_entry_changed) (GtkWidget *ptr_widget,
-                          t_sensors_dialog *ptr_sensorsdialog);
- 
-@@ -178,7 +184,7 @@ void
-  * @param ptr_str_newtext: Pointer to the string containing the new label
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*list_cell_text_edited) (GtkCellRendererText *ptr_cellrenderertext,
-                           gchar *ptr_str_path, gchar *ptr_str_newtext,
-                           t_sensors_dialog *ptr_sensorsdialog);
-@@ -189,7 +195,7 @@ void
-  * @param ptr_str_path: pointer to the string with the path of the changed item
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*list_cell_toggle) (GtkCellRendererToggle *ptr_cellrenderertoggle, gchar *ptr_str_path,
-                      t_sensors_dialog *ptr_sensorsdialog);
- 
-@@ -201,7 +207,7 @@ void
-  *                          hexadecimal rgb format #0011ff
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*list_cell_color_edited) (GtkCellRendererText *ptr_cellrenderertext,
-                            gchar *ptr_str_path, gchar *ptr_str_newcolor,
-                            t_sensors_dialog *ptr_sensorsdialog);
-@@ -214,7 +220,7 @@ void
-  *                        temperature
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*minimum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
-                     gchar *ptr_str_newmin, t_sensors_dialog *ptr_sensorsdialog);
- 
-@@ -226,7 +232,7 @@ void
-  *                        temperature
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*maximum_changed) (GtkCellRendererText *ptr_cellrenderertext, gchar *ptr_str_path,
-                     gchar *ptr_str_newmax, t_sensors_dialog *ptr_sensorsdialog);
- 
-@@ -236,7 +242,7 @@ void
-  * @param ptr_widget: Pointer to original widget, i.e, the update timer box
-  * @param ptr_sensorsdialog: argument pointer to sensors dialog data
-  */
--void
-+EXTERN void
- (*temperature_unit_change) (GtkWidget *ptr_widget,
-                             t_sensors_dialog *ptr_sensorsdialog);
- 
-diff --git a/lib/sensors-interface-common.c b/lib/sensors-interface-common.c
-index 70aa154..8c79f1d 100644
---- a/lib/sensors-interface-common.c
-+++ b/lib/sensors-interface-common.c
-@@ -28,6 +28,7 @@
- #include <libxfce4panel/xfce-panel-plugin.h>
- 
- /* Local/package includes */
-+#define XFCE4_SENSORS_INTERFACE_COMMON_DEFINING
- #include <configuration.h>
- #include <sensors-interface-common.h>
- #include <middlelayer.h>
--- 
-2.24.1
-
diff --git a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.95.bb
similarity index 77%
rename from meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
rename to meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.95.bb
index aa5fe019d..3c7fa9a91 100644
--- a/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.92.bb
+++ b/meta-xfce/recipes-panel-plugins/sensors/xfce4-sensors-plugin_1.3.95.bb
@@ -5,11 +5,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b94789bed9aec03b9656a9cc5398c706"
 
 inherit xfce-panel-plugin
 
-SRC_URI[md5sum] = "7327c4c316ebd5d93665e77b432b8d89"
-SRC_URI[sha256sum] = "3dc6643d2c064b7718badff44b948f8d410f00f13db197820b26ae38045f5112"
-SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch \
-            file://0001-Fix-multiple-definition-errors-under-GCC-10.0.patch \
-           "
+SRC_URI[sha256sum] = "83c64ae4618dd592971cfa0bc285a9b47af801a3ed856835cdb2a4c533c7846c"
+SRC_URI += "file://0001-Do-not-check-for-sys-class-power_supply-we-are-cross.patch"
 
 EXTRA_OECONF = " \
     --disable-procacpi \
-- 
2.26.2

