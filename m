Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wg0-f50.google.com (mail-wg0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 98B7A6AC08
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 13:27:55 +0000 (UTC)
Received: by mail-wg0-f50.google.com with SMTP id a1so5319994wgh.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Oct 2014 06:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=ZxhGArVXYmFenl+yqXYCTh6YTlx0IpT389zhaS0v+fc=;
	b=tpWUX+HHQnNBW1PXkFTsL5ahog+y9O1WLeZ7/TCSeJTUm+bGtDrZZ3oX1d5oYh69ex
	d6t31r/GWnoSzV3VQx7ov68WsPIxEztmaxQPbtM3UQZa4m2+zB9Z9P0qTiZ1VNEZ0mTf
	d8qJTskhofZd2jGLhjy/W5pEY2ThT7dG6TlLv4lvveiinulIKNZB6uWp+jmp78BFbY7m
	Ybz05p4ca8+BOZqaaGuEehkLeh/E4Q9td96Bajbm0mjX//CzCL1JClNrkoVOkChFSLev
	GsHq1yutIfCp4rElHFe/JNQz+ei1BC3ypeWOxiqf35++HQzKaVLfphojvXp3X1d+uCW8
	ZjcA==
X-Received: by 10.180.9.51 with SMTP id w19mr20242513wia.13.1413811674729;
	Mon, 20 Oct 2014 06:27:54 -0700 (PDT)
Received: from localhost.localdomain
	(ip-176-198-252-150.hsi05.unitymediagroup.de. [176.198.252.150])
	by mx.google.com with ESMTPSA id
	fm10sm9621757wib.21.2014.10.20.06.27.53
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Oct 2014 06:27:54 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 20 Oct 2014 15:27:43 +0200
Message-Id: <1413811666-20325-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Subject: [PATCH 1/4] xfce4-power-manager: update to 1.4.1 to fix power button
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
X-List-Received-Date: Mon, 20 Oct 2014 13:28:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

with 1.2.0 pressing power button shuts down independent of the setting in
xfce4-power-manager

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...shutdown-reboot-functionality-for-systemd.patch | 677 ---------------------
 ...nager_1.2.0.bb => xfce4-power-manager_1.4.1.bb} |  29 +-
 2 files changed, 19 insertions(+), 687 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch
 rename meta-xfce/recipes-xfce/xfce4-power-manager/{xfce4-power-manager_1.2.0.bb => xfce4-power-manager_1.4.1.bb} (53%)

diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch b/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch
deleted file mode 100644
index d5c5487..0000000
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/files/0001-Add-shutdown-reboot-functionality-for-systemd.patch
+++ /dev/null
@@ -1,677 +0,0 @@
-From 023333688f73ed26097c693d43f76e4b7d5698e2 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
-Date: Fri, 7 Jun 2013 18:38:42 +0200
-Subject: [PATCH] Add shutdown/reboot functionality for systemd
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Submitted [2]
-
-[1] http://git.xfce.org/xfce/xfce4-session/commit/?id=ae28aef315a7a6b90f1649ce6d1f30b842791cbf
-[2] https://bugzilla.xfce.org/show_bug.cgi?id=10167
-
-Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
----
- configure.ac       |    2 +
- src/Makefile.am    |   14 +++-
- src/xfpm-manager.c |   29 ++++++-
- src/xfpm-power.c   |   66 ++++++++++++++-
- src/xfpm-systemd.c |  245 ++++++++++++++++++++++++++++++++++++++++++++++++++++
- src/xfpm-systemd.h |   60 +++++++++++++
- 6 files changed, 411 insertions(+), 5 deletions(-)
- create mode 100644 src/xfpm-systemd.c
- create mode 100644 src/xfpm-systemd.h
-
-diff --git a/configure.ac b/configure.ac
-index 633b340..1db2036 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -95,6 +95,8 @@ if test "x$ac_cv_enable_polkit" = "xno"; then
-     polkit="no"
- else
-     AC_MSG_RESULT([yes])
-+    m4_define([polkit_minimum_version], [0.100])
-+    XDT_CHECK_PACKAGE([SYSTEMD], [polkit-gobject-1], [polkit_minimum_version])
-     AC_DEFINE(ENABLE_POLKIT, 1 , [PolicyKit support])
-     polkit="yes"
- fi
-diff --git a/src/Makefile.am b/src/Makefile.am
-index 0435bed..9b7fdd0 100644
---- a/src/Makefile.am
-+++ b/src/Makefile.am
-@@ -18,8 +18,6 @@ xfce4_power_manager_SOURCES =                   \
- 	xfpm-xfconf.h				\
- 	xfpm-disks.c				\
- 	xfpm-disks.h				\
--	xfpm-console-kit.c			\
--	xfpm-console-kit.h			\
- 	egg-idletime.c				\
- 	egg-idletime.h				\
- 	xfpm-backlight.c			\
-@@ -39,6 +37,16 @@ xfce4_power_manager_SOURCES =                   \
- 	xfpm-errors.c				\
- 	xfpm-errors.h
- 
-+if ENABLE_POLKIT
-+xfce4_power_manager_SOURCES +=			\
-+	xfpm-systemd.c				\
-+	xfpm-systemd.h
-+else
-+xfce4_power_manager_SOURCES +=                  \
-+	xfpm-console-kit.c			\
-+	xfpm-console-kit.h
-+endif
-+
- xfce4_power_manager_CFLAGS =                    \
- 	-I$(top_srcdir)                         \
- 	-I$(top_srcdir)/common                  \
-@@ -52,6 +60,7 @@ xfce4_power_manager_CFLAGS =                    \
- 	$(LIBXFCE4UI_CFLAGS)                    \
- 	$(XFCONF_CFLAGS)                        \
- 	$(LIBNOTIFY_CFLAGS)                     \
-+	$(SYSTEMD_CFLAGS)                       \
- 	$(XRANDR_CFLAGS)			\
- 	$(DPMS_CFLAGS)           		\
- 	$(PLATFORM_CPPFLAGS)			\
-@@ -70,6 +79,7 @@ xfce4_power_manager_LDADD =                     \
- 	$(LIBXFCE4UI_LIBS)                      \
- 	$(XFCONF_LIBS)                          \
- 	$(LIBNOTIFY_LIBS)                       \
-+	$(SYSTEMD_LIBS)                         \
- 	$(XRANDR_LIBS)				\
- 	$(DPMS_LIBS)
- 
-diff --git a/src/xfpm-manager.c b/src/xfpm-manager.c
-index 472ee3e..9bfb53c 100644
---- a/src/xfpm-manager.c
-+++ b/src/xfpm-manager.c
-@@ -43,7 +43,6 @@
- #include "xfpm-disks.h"
- #include "xfpm-dpms.h"
- #include "xfpm-manager.h"
--#include "xfpm-console-kit.h"
- #include "xfpm-button.h"
- #include "xfpm-backlight.h"
- #include "xfpm-inhibit.h"
-@@ -58,6 +57,12 @@
- #include "xfpm-enum-types.h"
- #include "xfpm-dbus-monitor.h"
- 
-+#ifdef ENABLE_POLKIT
-+#include "xfpm-systemd.h"
-+#else
-+#include "xfpm-console-kit.h"
-+#endif
-+
- static void xfpm_manager_finalize   (GObject *object);
- 
- static void xfpm_manager_dbus_class_init (XfpmManagerClass *klass);
-@@ -80,7 +85,11 @@ struct XfpmManagerPrivate
-     XfpmButton      *button;
-     XfpmXfconf      *conf;
-     XfpmBacklight   *backlight;
-+#ifdef ENABLE_POLKIT
-+    XfpmSystemd     *systemd;
-+#else
-     XfpmConsoleKit  *console;
-+#endif
-     XfpmDBusMonitor *monitor;
-     XfpmDisks       *disks;
-     XfpmInhibit     *inhibit;
-@@ -131,7 +140,11 @@ xfpm_manager_finalize (GObject *object)
-     g_object_unref (manager->priv->button);
-     g_object_unref (manager->priv->conf);
-     g_object_unref (manager->priv->client);
-+#ifdef ENABLE_POLKIT
-+    g_object_unref (manager->priv->systemd);
-+#else
-     g_object_unref (manager->priv->console);
-+#endif
-     g_object_unref (manager->priv->monitor);
-     g_object_unref (manager->priv->disks);
-     g_object_unref (manager->priv->inhibit);
-@@ -201,7 +214,11 @@ static void
- xfpm_manager_shutdown (XfpmManager *manager)
- {
-     GError *error = NULL;
-+#ifdef ENABLE_POLKIT
-+    xfpm_systemd_shutdown (manager->priv->systemd, &error );
-+#else
-     xfpm_console_kit_shutdown (manager->priv->console, &error );
-+#endif
-     
-     if ( error )
-     {
-@@ -521,7 +538,11 @@ void xfpm_manager_start (XfpmManager *manager)
-     manager->priv->power = xfpm_power_get ();
-     manager->priv->button = xfpm_button_new ();
-     manager->priv->conf = xfpm_xfconf_new ();
-+#ifdef ENABLE_POLKIT
-+    manager->priv->systemd = xfpm_systemd_new ();
-+#else
-     manager->priv->console = xfpm_console_kit_new ();
-+#endif
-     manager->priv->monitor = xfpm_dbus_monitor_new ();
-     manager->priv->disks = xfpm_disks_new ();
-     manager->priv->inhibit = xfpm_inhibit_new ();
-@@ -603,9 +624,15 @@ GHashTable *xfpm_manager_get_config (XfpmManager *manager)
-     
-     hash = g_hash_table_new_full (g_str_hash, g_str_equal, g_free, g_free);
-     
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (manager->priv->systemd),
-+		  "can-shutdown", &can_shutdown,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (manager->priv->console),
- 		  "can-shutdown", &can_shutdown,
- 		  NULL);
-+#endif
- 
-     g_object_get (G_OBJECT (manager->priv->power),
-                   "auth-suspend", &auth_suspend,
-diff --git a/src/xfpm-power.c b/src/xfpm-power.c
-index 796bef8..391c7fc 100644
---- a/src/xfpm-power.c
-+++ b/src/xfpm-power.c
-@@ -39,7 +39,6 @@
- #include "xfpm-xfconf.h"
- #include "xfpm-notify.h"
- #include "xfpm-errors.h"
--#include "xfpm-console-kit.h"
- #include "xfpm-inhibit.h"
- #include "xfpm-polkit.h"
- #include "xfpm-network-manager.h"
-@@ -51,6 +50,12 @@
- #include "xfpm-enum-types.h"
- #include "egg-idletime.h"
- 
-+#ifdef ENABLE_POLKIT
-+#include "xfpm-systemd.h"
-+#else
-+#include "xfpm-console-kit.h"
-+#endif
-+
- static void xfpm_power_finalize     (GObject *object);
- 
- static void xfpm_power_get_property (GObject *object,
-@@ -75,7 +80,11 @@ struct XfpmPowerPrivate
-     
-     GHashTable      *hash;
-     
-+#ifdef ENABLE_POLKIT
-+    XfpmSystemd     *systemd;
-+#else
-     XfpmConsoleKit  *console;
-+#endif
-     XfpmInhibit	    *inhibit;
-     XfpmXfconf      *conf;
-     GtkStatusIcon   *adapter_icon;
-@@ -680,9 +689,15 @@ xfpm_power_add_actions_to_notification (XfpmPower *power, NotifyNotification *n)
- {
-     gboolean can_shutdown;
-     
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-shutdown", &can_shutdown,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-shutdown", &can_shutdown,
- 		  NULL);
-+#endif
- 		  
-     if (  power->priv->can_hibernate && power->priv->auth_hibernate )
-     {
-@@ -756,9 +771,15 @@ xfpm_power_show_critical_action_gtk (XfpmPower *power)
-     const gchar *message;
-     gboolean can_shutdown;
-     
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-shutdown", &can_shutdown,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-shutdown", &can_shutdown,
- 		  NULL);
-+#endif
-     
-     message = _("System is running on low power. "\
-                "Save your work to avoid losing data");
-@@ -1327,7 +1348,11 @@ xfpm_power_init (XfpmPower *power)
-     power->priv->inhibit = xfpm_inhibit_new ();
-     power->priv->notify  = xfpm_notify_new ();
-     power->priv->conf    = xfpm_xfconf_new ();
-+#ifdef ENABLE_POLKIT
-+    power->priv->systemd = xfpm_systemd_new ();
-+#else
-     power->priv->console = xfpm_console_kit_new ();
-+#endif
-     
-     g_signal_connect_swapped (power->priv->conf, "notify::" SHOW_TRAY_ICON_CFG,
- 			      G_CALLBACK (xfpm_power_refresh_adaptor_visible), power);
-@@ -1445,7 +1470,11 @@ xfpm_power_finalize (GObject *object)
-     g_object_unref (power->priv->inhibit);
-     g_object_unref (power->priv->notify);
-     g_object_unref (power->priv->conf);
-+#ifdef ENABLE_POLKIT
-+    g_object_unref (power->priv->systemd);
-+#else
-     g_object_unref (power->priv->console);
-+#endif
-     
-     xfpm_power_hide_adapter_icon (power);
-     
-@@ -1607,9 +1636,15 @@ static gboolean xfpm_power_dbus_shutdown (XfpmPower *power,
- {
-     gboolean can_reboot;
-     
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-shutdown", &can_reboot,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-shutdown", &can_reboot,
- 		  NULL);
-+#endif
-     
-     if ( !can_reboot)
-     {
-@@ -1618,7 +1653,11 @@ static gboolean xfpm_power_dbus_shutdown (XfpmPower *power,
-         return FALSE;
-     }
-     
-+#ifdef ENABLE_POLKIT
-+    xfpm_systemd_shutdown (power->priv->systemd, error);
-+#else
-     xfpm_console_kit_shutdown (power->priv->console, error);
-+#endif
-     
-     return TRUE;
- }
-@@ -1628,9 +1667,15 @@ static gboolean xfpm_power_dbus_reboot   (XfpmPower *power,
- {
-     gboolean can_reboot;
-     
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-restart", &can_reboot,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-restart", &can_reboot,
- 		  NULL);
-+#endif
-     
-     if ( !can_reboot)
-     {
-@@ -1639,7 +1684,11 @@ static gboolean xfpm_power_dbus_reboot   (XfpmPower *power,
-         return FALSE;
-     }
-     
-+#ifdef ENABLE_POLKIT
-+    xfpm_systemd_reboot (power->priv->systemd, error);
-+#else
-     xfpm_console_kit_reboot (power->priv->console, error);
-+#endif
-     
-     return TRUE;
- }
-@@ -1694,10 +1743,16 @@ static gboolean xfpm_power_dbus_can_reboot (XfpmPower * power,
- 					  gboolean * OUT_can_reboot, 
- 					  GError ** error)
- {
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-reboot", OUT_can_reboot,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-reboot", OUT_can_reboot,
- 		  NULL);
--		  
-+#endif
-+
-     return TRUE;
- }
- 
-@@ -1705,9 +1760,16 @@ static gboolean xfpm_power_dbus_can_shutdown (XfpmPower * power,
- 					    gboolean * OUT_can_shutdown, 
- 					    GError ** error)
- {
-+#ifdef ENABLE_POLKIT
-+    g_object_get (G_OBJECT (power->priv->systemd),
-+		  "can-shutdown", OUT_can_shutdown,
-+		  NULL);
-+#else
-     g_object_get (G_OBJECT (power->priv->console),
- 		  "can-shutdown", OUT_can_shutdown,
- 		  NULL);
-+#endif
-+
-     return TRUE;
- }
- 
-diff --git a/src/xfpm-systemd.c b/src/xfpm-systemd.c
-new file mode 100644
-index 0000000..cc1cba1
---- /dev/null
-+++ b/src/xfpm-systemd.c
-@@ -0,0 +1,245 @@
-+/*
-+ * * Copyright (C) 2009-2011 Ali <aliov@xfce.org>
-+ * * Copyright (C) 2013 Andreas Müller <schnitzeltony@googlemail.com>
-+ *
-+ * Licensed under the GNU General Public License Version 2
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-+ */
-+
-+#ifdef HAVE_CONFIG_H
-+#include <config.h>
-+#endif
-+
-+#include <stdio.h>
-+#include <stdlib.h>
-+#include <string.h>
-+
-+#include <dbus/dbus-glib.h>
-+#include <polkit/polkit.h>
-+
-+#include "xfpm-systemd.h"
-+
-+
-+static void xfpm_systemd_finalize   (GObject *object);
-+
-+static void xfpm_systemd_get_property (GObject *object,
-+                                       guint prop_id,
-+                                       GValue *value,
-+                                       GParamSpec *pspec);
-+
-+#define XFPM_SYSTEMD_GET_PRIVATE(o) \
-+(G_TYPE_INSTANCE_GET_PRIVATE ((o), XFPM_TYPE_SYSTEMD, XfpmSystemdPrivate))
-+
-+struct XfpmSystemdPrivate
-+{
-+    gboolean	     can_shutdown;
-+    gboolean	     can_restart;
-+
-+    PolkitAuthority *authority;
-+    PolkitSubject   *subject;
-+};
-+
-+enum
-+{
-+    PROP_0,
-+    PROP_CAN_RESTART,
-+    PROP_CAN_SHUTDOWN
-+};
-+
-+G_DEFINE_TYPE (XfpmSystemd, xfpm_systemd, G_TYPE_OBJECT)
-+
-+#define SYSTEMD_DBUS_NAME               "org.freedesktop.login1"
-+#define SYSTEMD_DBUS_PATH               "/org/freedesktop/login1"
-+#define SYSTEMD_DBUS_INTERFACE          "org.freedesktop.login1.Manager"
-+#define SYSTEMD_REBOOT_ACTION           "Reboot"
-+#define SYSTEMD_POWEROFF_ACTION         "PowerOff"
-+#define SYSTEMD_REBOOT_TEST             "org.freedesktop.login1.reboot"
-+#define SYSTEMD_POWEROFF_TEST           "org.freedesktop.login1.power-off"
-+
-+static void
-+xfpm_systemd_class_init (XfpmSystemdClass *klass)
-+{
-+    GObjectClass *object_class = G_OBJECT_CLASS (klass);
-+
-+    object_class->finalize = xfpm_systemd_finalize;
-+
-+    object_class->get_property = xfpm_systemd_get_property;
-+
-+    g_object_class_install_property (object_class,
-+                                     PROP_CAN_RESTART,
-+                                     g_param_spec_boolean ("can-restart",
-+                                                           NULL, NULL,
-+                                                           FALSE,
-+                                                           G_PARAM_READABLE));
-+
-+    g_object_class_install_property (object_class,
-+                                     PROP_CAN_SHUTDOWN,
-+                                     g_param_spec_boolean ("can-shutdown",
-+                                                           NULL, NULL,
-+                                                           FALSE,
-+                                                           G_PARAM_READABLE));
-+
-+    g_type_class_add_private (klass, sizeof (XfpmSystemdPrivate));
-+}
-+
-+static gboolean
-+xfpm_systemd_can_method (XfpmSystemd  *systemd,
-+                         gboolean     *can_method,
-+                         const gchar  *method)
-+{
-+    PolkitAuthorizationResult *res;
-+    GError                    *local_error = NULL;
-+
-+    *can_method = FALSE;
-+    res = polkit_authority_check_authorization_sync (systemd->priv->authority,
-+                                                     systemd->priv->subject,
-+                                                     method,
-+                                                     NULL,
-+                                                     POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE,
-+                                                     NULL,
-+                                                     &local_error);
-+    if ( local_error )
-+    {
-+	g_critical ("Unable to get %s : %s", method, local_error->message);
-+	g_error_free (local_error);
-+    }
-+
-+    if(res)
-+    {
-+        *can_method = polkit_authorization_result_get_is_authorized (res) ||
-+                      polkit_authorization_result_get_is_challenge (res);
-+        g_object_unref (G_OBJECT (res));
-+    }
-+}
-+
-+static void
-+xfpm_systemd_init (XfpmSystemd *systemd)
-+{
-+    PolkitAuthorizationResult *res;
-+
-+    systemd->priv = XFPM_SYSTEMD_GET_PRIVATE (systemd);
-+    systemd->priv->authority = polkit_authority_get_sync (NULL, NULL);
-+    systemd->priv->subject = polkit_unix_process_new (getpid());
-+    systemd->priv->can_shutdown = FALSE;
-+    systemd->priv->can_restart  = FALSE;
-+
-+    if(systemd->priv->authority && systemd->priv->subject)
-+    {
-+        xfpm_systemd_can_method (systemd,
-+                                 &systemd->priv->can_shutdown,
-+                                 SYSTEMD_POWEROFF_TEST);
-+        xfpm_systemd_can_method (systemd,
-+                                 &systemd->priv->can_restart,
-+                                 SYSTEMD_REBOOT_TEST);
-+    }
-+}
-+
-+static void xfpm_systemd_get_property (GObject *object,
-+					   guint prop_id,
-+					   GValue *value,
-+					   GParamSpec *pspec)
-+{
-+    XfpmSystemd *systemd;
-+    systemd = XFPM_SYSTEMD (object);
-+
-+    switch (prop_id)
-+    {
-+	case PROP_CAN_SHUTDOWN:
-+	    g_value_set_boolean (value, systemd->priv->can_shutdown);
-+	    break;
-+	case PROP_CAN_RESTART:
-+	    g_value_set_boolean (value, systemd->priv->can_restart);
-+	    break;
-+        default:
-+            G_OBJECT_WARN_INVALID_PROPERTY_ID (object, prop_id, pspec);
-+            break;
-+    }
-+}
-+
-+static void
-+xfpm_systemd_finalize (GObject *object)
-+{
-+    XfpmSystemd *systemd;
-+
-+    systemd = XFPM_SYSTEMD (object);
-+
-+    if(systemd->priv->authority)
-+        g_object_unref (G_OBJECT (systemd->priv->authority));
-+    if(systemd->priv->subject)
-+        g_object_unref (G_OBJECT (systemd->priv->subject));
-+
-+    G_OBJECT_CLASS (xfpm_systemd_parent_class)->finalize (object);
-+}
-+
-+XfpmSystemd *
-+xfpm_systemd_new (void)
-+{
-+    static gpointer systemd_obj = NULL;
-+
-+    if ( G_LIKELY (systemd_obj != NULL ) )
-+    {
-+	g_object_ref (systemd_obj);
-+    }
-+    else
-+    {
-+	systemd_obj = g_object_new (XFPM_TYPE_SYSTEMD, NULL);
-+	g_object_add_weak_pointer (systemd_obj, &systemd_obj);
-+    }
-+
-+    return XFPM_SYSTEMD (systemd_obj);
-+}
-+
-+static void
-+xfpm_systemd_try_method (XfpmSystemd  *systemd,
-+                         const gchar  *method,
-+                         GError      **error)
-+{
-+    GDBusConnection *bus;
-+    GError          *local_error = NULL;
-+
-+    bus = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, error);
-+    if (G_LIKELY (bus != NULL))
-+    {
-+        g_dbus_connection_call_sync (bus,
-+                                     SYSTEMD_DBUS_NAME,
-+                                     SYSTEMD_DBUS_PATH,
-+                                     SYSTEMD_DBUS_INTERFACE,
-+                                     method,
-+                                     g_variant_new ("(b)", TRUE),
-+                                     NULL, 0, G_MAXINT, NULL,
-+                                     &local_error);
-+        g_object_unref (G_OBJECT (bus));
-+
-+        if (local_error != NULL)
-+        {
-+            g_propagate_error (error, local_error);
-+        }
-+    }
-+}
-+
-+void xfpm_systemd_shutdown (XfpmSystemd *systemd, GError **error)
-+{
-+    xfpm_systemd_try_method (systemd,
-+                             SYSTEMD_POWEROFF_ACTION,
-+                             error);
-+}
-+
-+void xfpm_systemd_reboot (XfpmSystemd *systemd, GError **error)
-+{
-+    xfpm_systemd_try_method (systemd,
-+                             SYSTEMD_REBOOT_ACTION,
-+                             error);
-+}
-diff --git a/src/xfpm-systemd.h b/src/xfpm-systemd.h
-new file mode 100644
-index 0000000..2890e08
---- /dev/null
-+++ b/src/xfpm-systemd.h
-@@ -0,0 +1,60 @@
-+/*
-+ * * Copyright (C) 2009-2011 Ali <aliov@xfce.org>
-+ * * Copyright (C) 2013 Andreas Müller <schnitzeltony@googlemail.com>
-+ *
-+ * Licensed under the GNU General Public License Version 2
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2 of the License, or
-+ * (at your option) any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
-+ */
-+
-+#ifndef __XFPM_SYSTEMD_H
-+#define __XFPM_SYSTEMD_H
-+
-+#include <glib-object.h>
-+
-+G_BEGIN_DECLS
-+
-+#define XFPM_TYPE_SYSTEMD            (xfpm_systemd_get_type () )
-+#define XFPM_SYSTEMD(o)              (G_TYPE_CHECK_INSTANCE_CAST ((o), XFPM_TYPE_SYSTEMD, XfpmSystemd))
-+#define XFPM_IS_SYSTEMD(o)           (G_TYPE_CHECK_INSTANCE_TYPE ((o), XFPM_TYPE_SYSTEMD))
-+
-+typedef struct XfpmSystemdPrivate XfpmSystemdPrivate;
-+
-+typedef struct
-+{
-+    GObject         		parent;
-+    XfpmSystemdPrivate		*priv;
-+
-+} XfpmSystemd;
-+
-+typedef struct
-+{
-+    GObjectClass 		parent_class;
-+
-+} XfpmSystemdClass;
-+
-+GType        			XFPM_SYSTEMD_get_type	(void) G_GNUC_CONST;
-+
-+XfpmSystemd       	       *XFPM_SYSTEMD_new	(void);
-+
-+void				XFPM_SYSTEMD_shutdown	(XfpmSystemd *systemd,
-+							 GError **error);
-+
-+void				XFPM_SYSTEMD_reboot	(XfpmSystemd *systemd,
-+							 GError **error);
-+
-+G_END_DECLS
-+
-+#endif /* __XFPM_SYSTEMD_H */
--- 
-1.7.6.5
-
diff --git a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb
similarity index 53%
rename from meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
rename to meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb
index 6e92186..a4aaf66 100644
--- a/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.2.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-power-manager/xfce4-power-manager_1.4.1.bb
@@ -10,9 +10,8 @@ inherit xfce
 DEPENDS = "gtk+ glib-2.0 dbus-glib xfconf libxfce4ui libxfce4util libnotify \
            libxrandr virtual/libx11 libxext xfce4-panel"
 
-SRC_URI += "file://0001-Add-shutdown-reboot-functionality-for-systemd.patch"
-
-RDEPENDS_${PN} = "networkmanager udisks upower ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
+SRC_URI[md5sum] = "808a2630487d75e6eae915e464b7fda3"
+SRC_URI[sha256sum] = "16a9e9bf3e0f8480d05b248817fbdc59e701e9161d3d0c7e53f3de28ed491f58"
 
 EXTRA_OECONF = " \
     --enable-network-manager \
@@ -22,12 +21,22 @@ EXTRA_OECONF = " \
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES','systemd','systemd','',d)}"
 PACKAGECONFIG[systemd] = "--enable-polkit, --disable-polkit, polkit"
 
-PACKAGES += "xfce4-brightness-plugin"
-FILES_${PN} += "${datadir}/polkit-1"
-FILES_xfce4-brightness-plugin = " \
-    ${libdir}/xfce4/panel-plugins/xfce4-brightness-plugin \
-    ${datadir}/xfce4/panel-plugins/xfce4-brightness-plugin.desktop \
+PACKAGES += "xfce4-powermanager-plugin"
+
+FILES_${PN} += " \
+    ${datadir}/polkit-1 \
+    ${datadir}/appdata \
 "
 
-SRC_URI[md5sum] = "935599b7114b0a4b0e2c9a5d6c72524c"
-SRC_URI[sha256sum] = "d7fb98a540284b62f4201527de17d4b24123f9d26c9f49131dd497c8387184e9"
+FILES_xfce4-powermanager-plugin = " \
+    ${libdir}/xfce4 \
+    ${datadir}/xfce4 \
+"
+
+RDEPENDS_xfce4-powermanager-plugin = "${PN}"
+RDEPENDS_${PN} = "networkmanager udisks upower ${@base_contains('DISTRO_FEATURES','systemd','','consolekit',d)}"
+
+# xfce4-brightness-plugin was replaced by xfce4-powermanager-plugin
+RPROVIDES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
+RREPLACES_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
+RCONFLICTS_xfce4-powermanager-plugin += "xfce4-brightness-plugin"
-- 
1.8.3.1


