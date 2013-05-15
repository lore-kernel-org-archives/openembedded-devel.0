Received: from mail-ee0-f45.google.com ([74.125.83.45])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Ucdpz-0006n8-Km
	for openembedded-devel@lists.openembedded.org;
	Wed, 15 May 2013 17:42:10 +0200
Received: by mail-ee0-f45.google.com with SMTP id l10so1131082eei.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 May 2013 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=ib93y1wKpvL8B85nZpjaW7cmp1mT1RSsqC9VYOeYoD8=;
	b=v4E/UEPDtmJvGKX9oRc2E9fR0pV9FXF0VDl9doeXdm4ycQcc2iL9kZ46HteNTLbrmB
	62f5FU1ZmRncfx7uZLit57qOyoAWRRDbhp5VlUeOOp+l+JDxXRzph/2BfJtsj2gKcZiX
	FktRtlSW79ZeRHSnzrrYc6cFpmDkFt0AHj4sjp5NRXaOU8khXCsOpbUwnUQNoBhmMhVQ
	d/f6s4YBrdGt8S/q5JBD3NhoL49viuokN6x4bzz70Mh6t+jLwA/zX0kuVj6yETSmMEWg
	YyO8CXhpqGSA0Gx9Y7YmFCMSVj/CRCeJ6KrYu3gBmuro5yptaCNnijxRkKUqkN+kKp0l
	pglg==
X-Received: by 10.14.1.7 with SMTP id 7mr61882044eec.41.1368631422935;
	Wed, 15 May 2013 08:23:42 -0700 (PDT)
Received: from localhost.localdomain (ip-95-222-160-204.unitymediagroup.de.
	[95.222.160.204])
	by mx.google.com with ESMTPSA id t9sm4599519eeo.11.2013.05.15.08.23.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 15 May 2013 08:23:42 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 15 May 2013 17:20:58 +0200
Message-Id: <1368631259-13401-14-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368631259-13401-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce 13/14] xfce4-session: update to 4.10.1
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
X-List-Received-Date: Wed, 15 May 2013 15:42:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...n-reboot-functionality-for-systemd-bug-87.patch |  482 --------------------
 ...ultiple-interactive-session-save-bug-5379.patch |  152 ------
 ...1-configure.in-hard-code-path-to-iceauth.patch} |   10 +-
 .../0002-Remove-gnome-keyring-remains.patch        |   82 ----
 ...4-session_4.10.0.bb => xfce4-session_4.10.1.bb} |   11 +-
 5 files changed, 9 insertions(+), 728 deletions(-)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
 rename meta-xfce/recipes-xfce/xfce4-session/xfce4-session/{0003-configure.in-hard-code-path-to-iceauth.patch => 0001-configure.in-hard-code-path-to-iceauth.patch} (87%)
 delete mode 100644 meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
 rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.10.0.bb => xfce4-session_4.10.1.bb} (71%)

diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
deleted file mode 100644
index ca5c362..0000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
+++ /dev/null
@@ -1,482 +0,0 @@
-From ae28aef315a7a6b90f1649ce6d1f30b842791cbf Mon Sep 17 00:00:00 2001
-From: Nick Schermer <nick@xfce.org>
-Date: Sun, 4 Nov 2012 21:23:36 +0100
-Subject: [PATCH] Add shutdown/reboot functionality for systemd (bug #8729).
-
-Based on patch by Christian Hesse and Evangelos Foutras.
-
-Upstream-Status: backport
----
- configure.in                  |    4 +
- xfce4-session/Makefile.am     |   14 ++-
- xfce4-session/xfsm-shutdown.c |   35 ++++++-
- xfce4-session/xfsm-systemd.c  |  229 +++++++++++++++++++++++++++++++++++++++++
- xfce4-session/xfsm-systemd.h  |   55 ++++++++++
- 5 files changed, 333 insertions(+), 4 deletions(-)
- create mode 100644 xfce4-session/xfsm-systemd.c
- create mode 100644 xfce4-session/xfsm-systemd.h
-
-diff --git a/configure.in b/configure.in
-index 9aa4f8f..134d0f7 100644
---- a/configure.in
-+++ b/configure.in
-@@ -96,6 +96,10 @@ XDT_CHECK_PACKAGE([DBUS], [dbus-1], [1.1.0])
- XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.84])
- XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.9.0])
- 
-+dnl Check for polkit / systemd integration
-+XDT_CHECK_OPTIONAL_PACKAGE([SYSTEMD], [polkit-gobject-1], [0.100],
-+                           [systemd], [Systemd support (through polit)])
-+
- dnl Check for debugging support
- XDT_FEATURE_DEBUG([xfsm_debug_default])
- 
-diff --git a/xfce4-session/Makefile.am b/xfce4-session/Makefile.am
-index c015154..f748b2b 100644
---- a/xfce4-session/Makefile.am
-+++ b/xfce4-session/Makefile.am
-@@ -38,8 +38,6 @@ xfce4_session_SOURCES =							\
- 	xfsm-compat-gnome.h						\
- 	xfsm-compat-kde.c						\
- 	xfsm-compat-kde.h						\
--	xfsm-consolekit.c						\
--	xfsm-consolekit.h						\
- 	xfsm-dns.c							\
- 	xfsm-dns.h							\
- 	xfsm-error.c							\
-@@ -65,6 +63,16 @@ xfce4_session_SOURCES =							\
- 	xfsm-upower.c							\
- 	xfsm-upower.h
- 
-+if HAVE_SYSTEMD
-+xfce4_session_SOURCES +=						\
-+	xfsm-systemd.c							\
-+	xfsm-systemd.h
-+else
-+xfce4_session_SOURCES +=						\
-+	xfsm-consolekit.c						\
-+	xfsm-consolekit.h
-+endif
-+
- xfce4_session_CFLAGS =							\
- 	$(LIBSM_CFLAGS)							\
- 	$(LIBX11_CFLAGS)						\
-@@ -72,6 +80,7 @@ xfce4_session_CFLAGS =							\
- 	$(DBUS_CFLAGS)							\
- 	$(DBUS_GLIB_CFLAGS)						\
- 	$(LIBWNCK_CFLAGS)						\
-+	$(SYSTEMD_CFLAGS)						\
- 	$(XFCONF_CFLAGS)						\
- 	$(GMODULE_CFLAGS)						\
- 	$(PLATFORM_CFLAGS)
-@@ -91,6 +100,7 @@ xfce4_session_LDADD =							\
- 	$(DBUS_LIBS)							\
- 	$(DBUS_GLIB_LIBS)						\
- 	$(LIBWNCK_LIBS)							\
-+	$(SYSTEMD_LIBS)							\
- 	$(XFCONF_LIBS)							\
- 	-lm
- 
-diff --git a/xfce4-session/xfsm-shutdown.c b/xfce4-session/xfsm-shutdown.c
-index d8757a8..4c483a7 100644
---- a/xfce4-session/xfsm-shutdown.c
-+++ b/xfce4-session/xfsm-shutdown.c
-@@ -66,10 +66,13 @@
- #include <xfce4-session/xfsm-fadeout.h>
- #include <xfce4-session/xfsm-global.h>
- #include <xfce4-session/xfsm-legacy.h>
--#include <xfce4-session/xfsm-consolekit.h>
- #include <xfce4-session/xfsm-upower.h>
- 
--
-+#ifdef HAVE_SYSTEMD
-+#include <xfce4-session/xfsm-systemd.h>
-+#else
-+#include <xfce4-session/xfsm-consolekit.h>
-+#endif
- 
- static void xfsm_shutdown_finalize  (GObject      *object);
- static void xfsm_shutdown_sudo_free (XfsmShutdown *shutdown);
-@@ -93,7 +96,11 @@ struct _XfsmShutdown
- {
-   GObject __parent__;
- 
-+#ifdef HAVE_SYSTEMD
-+  XfsmSystemd    *systemd;
-+#else
-   XfsmConsolekit *consolekit;
-+#endif
-   XfsmUPower     *upower;
- 
-   /* kiosk settings */
-@@ -131,7 +138,11 @@ xfsm_shutdown_init (XfsmShutdown *shutdown)
- {
-   XfceKiosk *kiosk;
- 
-+#ifdef HAVE_SYSTEMD
-+  shutdown->systemd = xfsm_systemd_get ();
-+#else
-   shutdown->consolekit = xfsm_consolekit_get ();
-+#endif
-   shutdown->upower = xfsm_upower_get ();
-   shutdown->helper_state = SUDO_NOT_INITIAZED;
-   shutdown->helper_require_password = FALSE;
-@@ -150,7 +161,11 @@ xfsm_shutdown_finalize (GObject *object)
- {
-   XfsmShutdown *shutdown = XFSM_SHUTDOWN (object);
- 
-+#ifdef HAVE_SYSTEMD
-+  g_object_unref (G_OBJECT (shutdown->systemd));
-+#else
-   g_object_unref (G_OBJECT (shutdown->consolekit));
-+#endif
-   g_object_unref (G_OBJECT (shutdown->upower));
- 
-   /* close down helper */
-@@ -641,7 +656,11 @@ xfsm_shutdown_try_restart (XfsmShutdown  *shutdown,
-   if (shutdown->helper_state == SUDO_AVAILABLE)
-     return xfsm_shutdown_sudo_try_action (shutdown, XFSM_SHUTDOWN_RESTART, error);
-   else
-+#ifdef HAVE_SYSTEMD
-+    return xfsm_systemd_try_restart (shutdown->systemd, error);
-+#else
-     return xfsm_consolekit_try_restart (shutdown->consolekit, error);
-+#endif
- }
- 
- 
-@@ -658,7 +677,11 @@ xfsm_shutdown_try_shutdown (XfsmShutdown  *shutdown,
-   if (shutdown->helper_state == SUDO_AVAILABLE)
-     return xfsm_shutdown_sudo_try_action (shutdown, XFSM_SHUTDOWN_SHUTDOWN, error);
-   else
-+#ifdef HAVE_SYSTEMD
-+    return xfsm_systemd_try_shutdown (shutdown->systemd, error);
-+#else
-     return xfsm_consolekit_try_shutdown (shutdown->consolekit, error);
-+#endif
- }
- 
- 
-@@ -698,7 +721,11 @@ xfsm_shutdown_can_restart (XfsmShutdown  *shutdown,
-       return TRUE;
-     }
- 
-+#ifdef HAVE_SYSTEMD
-+  if (xfsm_systemd_can_restart (shutdown->systemd, can_restart, error))
-+#else
-   if (xfsm_consolekit_can_restart (shutdown->consolekit, can_restart, error))
-+#endif
-     return TRUE;
- 
-   if (xfsm_shutdown_sudo_init (shutdown, error))
-@@ -725,7 +752,11 @@ xfsm_shutdown_can_shutdown (XfsmShutdown  *shutdown,
-       return TRUE;
-     }
- 
-+#ifdef HAVE_SYSTEMD
-+  if (xfsm_systemd_can_shutdown (shutdown->systemd, can_shutdown, error))
-+#else
-   if (xfsm_consolekit_can_shutdown (shutdown->consolekit, can_shutdown, error))
-+#endif
-     return TRUE;
- 
-   if (xfsm_shutdown_sudo_init (shutdown, error))
-diff --git a/xfce4-session/xfsm-systemd.c b/xfce4-session/xfsm-systemd.c
-new file mode 100644
-index 0000000..7bdd39d
---- /dev/null
-+++ b/xfce4-session/xfsm-systemd.c
-@@ -0,0 +1,229 @@
-+/*-
-+ * Copyright (C) 2012 Christian Hesse
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 2, or (at your option)
-+ * any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program; if not, write to the Free Software
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
-+ * MA 02110-1301 USA.
-+ */
-+
-+#include <config.h>
-+
-+#include <gio/gio.h>
-+#include <polkit/polkit.h>
-+#include <dbus/dbus-glib.h>
-+#include <dbus/dbus-glib-lowlevel.h>
-+
-+#include <xfce4-session/xfsm-systemd.h>
-+
-+
-+
-+#define SYSTEMD_DBUS_NAME               "org.freedesktop.login1"
-+#define SYSTEMD_DBUS_PATH               "/org/freedesktop/login1"
-+#define SYSTEMD_DBUS_INTERFACE          "org.freedesktop.login1.Manager"
-+#define SYSTEMD_REBOOT_ACTION           "Reboot"
-+#define SYSTEMD_POWEROFF_ACTION         "PowerOff"
-+#define SYSTEMD_REBOOT_TEST             "org.freedesktop.login1.reboot"
-+#define SYSTEMD_POWEROFF_TEST           "org.freedesktop.login1.power-off"
-+
-+
-+
-+static void     xfsm_systemd_finalize     (GObject         *object);
-+
-+
-+
-+struct _XfsmSystemdClass
-+{
-+  GObjectClass __parent__;
-+};
-+
-+struct _XfsmSystemd
-+{
-+  GObject __parent__;
-+
-+  PolkitAuthority *authority;
-+  PolkitSubject   *subject;
-+};
-+
-+
-+
-+G_DEFINE_TYPE (XfsmSystemd, xfsm_systemd, G_TYPE_OBJECT)
-+
-+
-+
-+static void
-+xfsm_systemd_class_init (XfsmSystemdClass *klass)
-+{
-+  GObjectClass *gobject_class;
-+
-+  gobject_class = G_OBJECT_CLASS (klass);
-+  gobject_class->finalize = xfsm_systemd_finalize;
-+}
-+
-+
-+
-+static void
-+xfsm_systemd_init (XfsmSystemd *systemd)
-+{
-+  systemd->authority = polkit_authority_get_sync (NULL, NULL);
-+  systemd->subject = polkit_unix_process_new (getpid());
-+}
-+
-+
-+
-+static void
-+xfsm_systemd_finalize (GObject *object)
-+{
-+  XfsmSystemd *systemd = XFSM_SYSTEMD (object);
-+
-+  g_object_unref (G_OBJECT (systemd->authority));
-+  g_object_unref (G_OBJECT (systemd->subject));
-+
-+  (*G_OBJECT_CLASS (xfsm_systemd_parent_class)->finalize) (object);
-+}
-+
-+
-+static gboolean
-+xfsm_systemd_can_method (XfsmSystemd  *systemd,
-+                         gboolean     *can_method,
-+                         const gchar  *method,
-+                         GError      **error)
-+{
-+  PolkitAuthorizationResult *res;
-+  GError                    *local_error = NULL;
-+
-+  *can_method = FALSE;
-+
-+  res = polkit_authority_check_authorization_sync (systemd->authority,
-+                                                   systemd->subject,
-+                                                   method,
-+                                                   NULL,
-+                                                   POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE,
-+                                                   NULL,
-+                                                   &local_error);
-+
-+  if (res == NULL)
-+    {
-+      g_propagate_error (error, local_error);
-+      return FALSE;
-+    }
-+
-+  *can_method = polkit_authorization_result_get_is_authorized (res)
-+                || polkit_authorization_result_get_is_challenge (res);
-+
-+  g_object_unref (G_OBJECT (res));
-+
-+  return TRUE;
-+}
-+
-+
-+
-+static gboolean
-+xfsm_systemd_try_method (XfsmSystemd  *systemd,
-+                         const gchar  *method,
-+                         GError      **error)
-+{
-+  GDBusConnection *bus;
-+  GError          *local_error = NULL;
-+
-+  bus = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, error);
-+  if (G_UNLIKELY (bus == NULL))
-+    return FALSE;
-+
-+  g_dbus_connection_call_sync (bus,
-+                               SYSTEMD_DBUS_NAME,
-+                               SYSTEMD_DBUS_PATH,
-+                               SYSTEMD_DBUS_INTERFACE,
-+                               method,
-+                               g_variant_new ("(b)", TRUE),
-+                               NULL, 0, G_MAXINT, NULL,
-+                               &local_error);
-+
-+  g_object_unref (G_OBJECT (bus));
-+
-+  if (local_error != NULL)
-+    {
-+      g_propagate_error (error, local_error);
-+      return FALSE;
-+    }
-+
-+  return TRUE;
-+}
-+
-+
-+
-+XfsmSystemd *
-+xfsm_systemd_get (void)
-+{
-+  static XfsmSystemd *object = NULL;
-+
-+  if (G_LIKELY (object != NULL))
-+    {
-+      g_object_ref (G_OBJECT (object));
-+    }
-+  else
-+    {
-+      object = g_object_new (XFSM_TYPE_SYSTEMD, NULL);
-+      g_object_add_weak_pointer (G_OBJECT (object), (gpointer) &object);
-+    }
-+
-+  return object;
-+}
-+
-+
-+
-+gboolean
-+xfsm_systemd_try_restart (XfsmSystemd  *systemd,
-+                          GError      **error)
-+{
-+  return xfsm_systemd_try_method (systemd,
-+                                  SYSTEMD_REBOOT_ACTION,
-+                                  error);
-+}
-+
-+
-+
-+gboolean
-+xfsm_systemd_try_shutdown (XfsmSystemd  *systemd,
-+                           GError      **error)
-+{
-+  return xfsm_systemd_try_method (systemd,
-+                                  SYSTEMD_POWEROFF_ACTION,
-+                                  error);
-+}
-+
-+
-+
-+gboolean
-+xfsm_systemd_can_restart (XfsmSystemd  *systemd,
-+                          gboolean     *can_restart,
-+                          GError      **error)
-+{
-+  return xfsm_systemd_can_method (systemd,
-+                                  can_restart,
-+                                  SYSTEMD_REBOOT_TEST,
-+                                  error);
-+}
-+
-+
-+
-+gboolean
-+xfsm_systemd_can_shutdown (XfsmSystemd  *systemd,
-+                           gboolean     *can_shutdown,
-+                           GError      **error)
-+{
-+  return xfsm_systemd_can_method (systemd,
-+                                  can_shutdown,
-+                                  SYSTEMD_POWEROFF_TEST,
-+                                  error);
-+}
-diff --git a/xfce4-session/xfsm-systemd.h b/xfce4-session/xfsm-systemd.h
-new file mode 100644
-index 0000000..8223622
---- /dev/null
-+++ b/xfce4-session/xfsm-systemd.h
-@@ -0,0 +1,55 @@
-+/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
-+ *
-+ * Copyright (C) 2012 Christian Hesse
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
-+ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-+ */
-+
-+#ifndef __XFSM_SYSTEMD_H__
-+#define __XFSM_SYSTEMD_H__
-+
-+typedef struct _XfsmSystemdClass XfsmSystemdClass;
-+typedef struct _XfsmSystemd      XfsmSystemd;
-+
-+#define XFSM_TYPE_SYSTEMD            (xfsm_systemd_get_type ())
-+#define XFSM_SYSTEMD(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), XFSM_TYPE_SYSTEMD, XfsmSystemd))
-+#define XFSM_SYSTEMD_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), XFSM_TYPE_SYSTEMD, XfsmSystemdClass))
-+#define XFSM_IS_SYSTEMD(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), XFSM_TYPE_SYSTEMD))
-+#define XFSM_IS_SYSTEMD_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), XFSM_TYPE_SYSTEMD))
-+#define XFSM_SYSTEMD_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), XFSM_TYPE_SYSTEMD, XfsmSystemdClass))
-+
-+GType           xfsm_systemd_get_type     (void) G_GNUC_CONST;
-+
-+XfsmSystemd *xfsm_systemd_get          (void);
-+
-+gboolean     xfsm_systemd_try_restart  (XfsmSystemd  *systemd,
-+                                        GError      **error);
-+
-+gboolean     xfsm_systemd_try_shutdown (XfsmSystemd  *systemd,
-+                                        GError      **error);
-+
-+gboolean     xfsm_systemd_can_restart  (XfsmSystemd  *systemd,
-+                                        gboolean     *can_restart,
-+                                        GError      **error);
-+
-+gboolean     xfsm_systemd_can_shutdown (XfsmSystemd  *systemd,
-+                                        gboolean     *can_shutdown,
-+                                        GError      **error);
-+
-+G_END_DECLS
-+
-+#endif  /* __XFSM_SYSTEMD_H__ */
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
deleted file mode 100644
index dd9c6d4..0000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-Handle-multiple-interactive-session-save-bug-5379.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From 9f3077be682355e1cd07e9a9463e76307292208c Mon Sep 17 00:00:00 2001
-From: Dimitar Zhekov <hamster@mbox.contact.bg>
-Date: Thu, 30 Aug 2012 22:52:14 +0200
-Subject: [PATCH] Handle multiple interactive session save (bug #5379).
-
-Additionnaly, we now use SmSaveGlobal on log out / shutdown without
-session save which avoids data loss. Previously clients would not save
-anything on log out without session save.
-
-Based on original work by Chris Bainbridge (chris.bainbridge@gmail.com).
----
-Upstream-Status: applied
- xfce4-session/xfsm-manager.c |   81 ++++++++++++++++++++++++-----------------
- 1 files changed, 47 insertions(+), 34 deletions(-)
-
-diff --git a/xfce4-session/xfsm-manager.c b/xfce4-session/xfsm-manager.c
-index bf6a446..35811c5 100644
---- a/xfce4-session/xfsm-manager.c
-+++ b/xfce4-session/xfsm-manager.c
-@@ -98,6 +98,7 @@ struct _XfsmManager
- 
-   XfsmShutdownType  shutdown_type;
-   XfsmShutdown     *shutdown_helper;
-+  gboolean          save_session;
- 
-   gboolean         session_chooser;
-   gchar           *session_name;
-@@ -230,6 +231,7 @@ xfsm_manager_init (XfsmManager *manager)
-   manager->failsafe_mode = TRUE;
-   manager->shutdown_type = XFSM_SHUTDOWN_LOGOUT;
-   manager->shutdown_helper = xfsm_shutdown_get ();
-+  manager->save_session = TRUE;
- 
-   manager->pending_properties = g_queue_new ();
-   manager->starting_properties = g_queue_new ();
-@@ -989,7 +991,9 @@ xfsm_manager_interact (XfsmManager *manager,
-           XfsmClient *cl = lp->data;
-           if (xfsm_client_get_state (cl) == XFSM_CLIENT_INTERACTING)
-             {
--              xfsm_client_set_state (cl, XFSM_CLIENT_WAITFORINTERACT);
-+              /* a client is already interacting, so new client has to wait */
-+              xfsm_client_set_state (client, XFSM_CLIENT_WAITFORINTERACT);
-+              xfsm_manager_cancel_client_save_timeout(manager, client);
-               return;
-             }
-         }
-@@ -1138,44 +1142,47 @@ xfsm_manager_save_yourself_global (XfsmManager     *manager,
-         }
-     }
- 
--  if (!shutdown || shutdown_save)
-+  /* don't save the session if shutting down without save */
-+  manager->save_session = !shutdown || shutdown_save;
-+
-+  if (save_type == SmSaveBoth && !manager->save_session)
-     {
--      xfsm_manager_set_state (manager,
--                              shutdown
--                              ? XFSM_MANAGER_SHUTDOWN
--                              : XFSM_MANAGER_CHECKPOINT);
-+      /* saving the session, so clients should
-+       * (prompt to) save the user data only */
-+      save_type = SmSaveGlobal;
-+    }
- 
--      /* handle legacy applications first! */
--      xfsm_legacy_perform_session_save ();
-+  xfsm_manager_set_state (manager,
-+                          shutdown
-+                          ? XFSM_MANAGER_SHUTDOWN
-+                          : XFSM_MANAGER_CHECKPOINT);
- 
--      for (lp = g_queue_peek_nth_link (manager->running_clients, 0);
--           lp;
--           lp = lp->next)
--        {
--          XfsmClient *client = lp->data;
--          XfsmProperties *properties = xfsm_client_get_properties (client);
--          const gchar *program;
-+  /* handle legacy applications first! */
-+  if (manager->save_session)
-+      xfsm_legacy_perform_session_save ();
- 
--          /* xterm's session management is broken, so we won't
--           * send a SAVE YOURSELF to xterms */
--          program = xfsm_properties_get_string (properties, SmProgram);
--          if (program != NULL && strcasecmp (program, "xterm") == 0)
--            continue;
-+  for (lp = g_queue_peek_nth_link (manager->running_clients, 0);
-+       lp;
-+       lp = lp->next)
-+    {
-+      XfsmClient *client = lp->data;
-+      XfsmProperties *properties = xfsm_client_get_properties (client);
-+      const gchar *program;
- 
--          if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
--            {
--              SmsSaveYourself (xfsm_client_get_sms_connection (client), save_type, shutdown,
--                               interact_style, fast);
--            }
-+      /* xterm's session management is broken, so we won't
-+       * send a SAVE YOURSELF to xterms */
-+      program = xfsm_properties_get_string (properties, SmProgram);
-+      if (program != NULL && strcasecmp (program, "xterm") == 0)
-+        continue;
- 
--          xfsm_client_set_state (client, XFSM_CLIENT_SAVING);
--          xfsm_manager_start_client_save_timeout (manager, client);
-+      if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
-+        {
-+          SmsSaveYourself (xfsm_client_get_sms_connection (client), save_type, shutdown,
-+                           interact_style, fast);
-         }
--    }
--  else
--    {
--      /* shutdown session without saving */
--      xfsm_manager_perform_shutdown (manager);
-+
-+      xfsm_client_set_state (client, XFSM_CLIENT_SAVING);
-+      xfsm_manager_start_client_save_timeout (manager, client);
-     }
- }
- 
-@@ -1249,7 +1256,12 @@ xfsm_manager_save_yourself_done (XfsmManager *manager,
-                                  XfsmClient  *client,
-                                  gboolean     success)
- {
--  if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVING && xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL)
-+  /* In xfsm_manager_interact_done we send SmsShutdownCancelled to clients in
-+     XFSM_CLIENT_WAITFORINTERACT state. They respond with SmcSaveYourselfDone
-+     (xsmp_shutdown_cancelled in libxfce4ui library) so we allow it here. */
-+  if (xfsm_client_get_state (client) != XFSM_CLIENT_SAVING &&
-+      xfsm_client_get_state (client) != XFSM_CLIENT_SAVINGLOCAL &&
-+      xfsm_client_get_state (client) != XFSM_CLIENT_WAITFORINTERACT)
-     {
-       xfsm_verbose ("Client Id = %s send SAVE YOURSELF DONE, while not being "
-                     "in save mode. Prepare to be nuked!\n",
-@@ -1521,7 +1533,8 @@ xfsm_manager_complete_saveyourself (XfsmManager *manager)
-   xfsm_verbose ("Manager finished SAVE YOURSELF, session data will be stored now.\n\n");
- 
-   /* all clients done, store session data */
--  xfsm_manager_store_session (manager);
-+  if (manager->save_session)
-+    xfsm_manager_store_session (manager);
- 
-   if (manager->state == XFSM_MANAGER_CHECKPOINT)
-     {
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0003-configure.in-hard-code-path-to-iceauth.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
similarity index 87%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0003-configure.in-hard-code-path-to-iceauth.patch
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
index 41a527c..d619cde 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0003-configure.in-hard-code-path-to-iceauth.patch
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0001-configure.in-hard-code-path-to-iceauth.patch
@@ -1,7 +1,7 @@
 From a629b051f4e5462150c77b95574bbc7a33bc9666 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
 Date: Mon, 31 Dec 2012 16:35:29 +0100
-Subject: [PATCH] configure.in: hard code path to iceauth
+Subject: [PATCH] configure.ac: hard code path to iceauth
 MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
@@ -13,13 +13,13 @@ Upstream-Status: Inappropriate [config]
 
 Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
 ---
- configure.in |    8 +-------
+ configure.ac |    8 +-------
  1 files changed, 1 insertions(+), 7 deletions(-)
 
-diff --git a/configure.in b/configure.in
+diff --git a/configure.ac b/configure.ac
 index 3cf3510..505e744 100644
---- a/configure.in
-+++ b/configure.in
+--- a/configure.ac
++++ b/configure.ac
 @@ -111,13 +111,7 @@ XDT_FEATURE_DEBUG([xfsm_debug_default])
  dnl Check for linker optimizations
  XDT_FEATURE_LINKER_OPTS()
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
deleted file mode 100644
index b26669f..0000000
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session/0002-Remove-gnome-keyring-remains.patch
+++ /dev/null
@@ -1,82 +0,0 @@
-From 7a75a8a0f7089b716e702e6bb0cf13fc3194e3db Mon Sep 17 00:00:00 2001
-From: Nick Schermer <nick@xfce.org>
-Date: Sun, 29 Apr 2012 13:35:37 +0200
-Subject: [PATCH] Remove gnome-keyring remains.
-
-Not required anymore. gnome_keyring_daemon_prepare_environment_sync
-is a stub function that does nothing.
-
-Upstream-Status: backport [1]
-
-[1] http://git.xfce.org/xfce/xfce4-session/commit/?id=7a75a8a0f7089b716e702e6bb0cf13fc3194e3db
----
- configure.in                   |    5 -----
- xfce4-session/Makefile.am         |    2 --
- xfce4-session/xfsm-compat-gnome.c |    8 --------
- 3 files changed, 0 insertions(+), 15 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index f8684b3..9aa4f8f 100644
---- a/configure.in
-+++ b/configure.in
-@@ -96,11 +96,6 @@ XDT_CHECK_PACKAGE([DBUS], [dbus-1], [1.1.0])
- XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.84])
- XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.9.0])
- 
--dnl Check for gnome support
--XDT_CHECK_OPTIONAL_PACKAGE([GNOME_KEYRING], [gnome-keyring-1], [2.22],
--                           [libgnome-keyring],
--                           [Extra gnome-keyring compatibility support], [no])
--
- dnl Check for debugging support
- XDT_FEATURE_DEBUG([xfsm_debug_default])
- 
-diff --git a/xfce4-session/Makefile.am b/xfce4-session/Makefile.am
-index 5e8343a..c015154 100644
---- a/xfce4-session/Makefile.am
-+++ b/xfce4-session/Makefile.am
-@@ -66,7 +66,6 @@ xfce4_session_SOURCES =							\
- 	xfsm-upower.h
- 
- xfce4_session_CFLAGS =							\
--	$(GNOME_KEYRING_CFLAGS)						\
- 	$(LIBSM_CFLAGS)							\
- 	$(LIBX11_CFLAGS)						\
- 	$(LIBXFCE4UI_CFLAGS)						\
-@@ -93,7 +92,6 @@ xfce4_session_LDADD =							\
- 	$(DBUS_GLIB_LIBS)						\
- 	$(LIBWNCK_LIBS)							\
- 	$(XFCONF_LIBS)							\
--	$(GNOME_KEYRING_LIBS)						\
- 	-lm
- 
- xfce4_session_DEPENDENCIES =						\
-diff --git a/xfce4-session/xfsm-compat-gnome.c b/xfce4-session/xfsm-compat-gnome.c
-index b5b4a99..e1fa16f 100644
---- a/xfce4-session/xfsm-compat-gnome.c
-+++ b/xfce4-session/xfsm-compat-gnome.c
-@@ -59,10 +59,6 @@
- 
- #include <libxfce4util/libxfce4util.h>
- 
--#ifdef HAVE_GNOME_KEYRING
--#include <gnome-keyring.h>
--#endif
--
- #include <xfce4-session/xfsm-compat-gnome.h>
- 
- #define GNOME_KEYRING_DAEMON "gnome-keyring-daemon"
-@@ -154,10 +150,6 @@ gnome_keyring_daemon_startup (void)
-             }
- 
-           g_strfreev (lines);
--
--#ifdef HAVE_GNOME_KEYRING
--          gnome_keyring_daemon_prepare_environment_sync ();
--#endif
-         }
-       else
-         {
--- 
-1.7.4.4
-
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
similarity index 71%
rename from meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
rename to meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
index bbe92e8..f7f4ba0 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.1.bb
@@ -4,16 +4,13 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
 DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth upower"
-PR = "r7"
 
 inherit xfce update-alternatives
 
-SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
-SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
-SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch \
-            file://0002-Remove-gnome-keyring-remains.patch \
-            file://0003-configure.in-hard-code-path-to-iceauth.patch \
-            file://0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch \
+SRC_URI[md5sum] = "1757657c1d590aa6274b7b7cbba33352"
+SRC_URI[sha256sum] = "0154fabdc398798c3445374ccc52a2f5bcb2d867fc94bc54114395b24f9cfc83"
+SRC_URI += " \
+    file://0001-configure.in-hard-code-path-to-iceauth.patch \
 "
 
 ALTERNATIVE_${PN} = "x-session-manager"
-- 
1.7.6.5



