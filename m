Received: from mail-ea0-f178.google.com ([209.85.215.178])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRG-0004cX-6X
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ea0-f178.google.com with SMTP id k11so2608946eaa.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=N5wnw9mak0OFA7r0QVY/nX5etsf1zy3d8NaefNKVXLo=;
	b=zTD41uREu4GrEKqQDvGWU1fv56oswBZgrEIZxW9LgJFPIxbXsYrdgIAzacY8IuCN3M
	zfSSfhK4bvp7em9q81jZOGF+FLse8HcUPx43ZNq3ru9tV/j0STB16CQeZLBC6t0H9ZZ+
	mNQgeWbAGX50NmWiPDDKwG3ZGpEvIb5dsP3z/ptoFJErb8WEN1Lb6E/mMjbMaqRCcq5u
	qM8ceDkL3IlEnadJjmnzOfBeR5KNrEuUMUZOI44zupFROJlrgOihGRnbctXEPJdvT1vB
	ECIhZAcweEXpUjHfofq+3kwkc6mugmQBbB6Ia4fHn+xmBd66qO7GQhvd5o0CXMej588N
	iWqQ==
X-Received: by 10.14.215.6 with SMTP id d6mr47982402eep.40.1356267789864;
	Sun, 23 Dec 2012 05:03:09 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:09 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:38 +0100
Message-Id: <1356267761-15152-10-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 09/12] xfce4-session: Add shutdown/reboot functionality for systemd
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

can't wait for stable xfce 4.12 in 03/2013

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 ...n-reboot-functionality-for-systemd-bug-87.patch |  482 ++++++++++++++++++++
 .../xfce4-session/xfce4-session_4.10.0.bbappend    |    8 +
 2 files changed, 490 insertions(+), 0 deletions(-)
 create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
 create mode 100644 meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend

diff --git a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
new file mode 100644
index 0000000..eedbd6f
--- /dev/null
+++ b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/files/0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch
@@ -0,0 +1,482 @@
+From ae28aef315a7a6b90f1649ce6d1f30b842791cbf Mon Sep 17 00:00:00 2001
+From: Nick Schermer <nick@xfce.org>
+Date: Sun, 4 Nov 2012 21:23:36 +0100
+Subject: [PATCH] Add shutdown/reboot functionality for systemd (bug #8729).
+
+Based on patch by Christian Hesse and Evangelos Foutras.
+---
+
+Upstream-status: backport
+ configure.in                  |    4 +
+ xfce4-session/Makefile.am     |   14 ++-
+ xfce4-session/xfsm-shutdown.c |   35 ++++++-
+ xfce4-session/xfsm-systemd.c  |  229 +++++++++++++++++++++++++++++++++++++++++
+ xfce4-session/xfsm-systemd.h  |   55 ++++++++++
+ 5 files changed, 333 insertions(+), 4 deletions(-)
+ create mode 100644 xfce4-session/xfsm-systemd.c
+ create mode 100644 xfce4-session/xfsm-systemd.h
+
+diff --git a/configure.in b/configure.in
+index 9aa4f8f..134d0f7 100644
+--- a/configure.in
++++ b/configure.in
+@@ -96,6 +96,10 @@ XDT_CHECK_PACKAGE([DBUS], [dbus-1], [1.1.0])
+ XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.84])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.9.0])
+ 
++dnl Check for polkit / systemd integration
++XDT_CHECK_OPTIONAL_PACKAGE([SYSTEMD], [polkit-gobject-1], [0.100],
++                           [systemd], [Systemd support (through polit)])
++
+ dnl Check for debugging support
+ XDT_FEATURE_DEBUG([xfsm_debug_default])
+ 
+diff --git a/xfce4-session/Makefile.am b/xfce4-session/Makefile.am
+index c015154..f748b2b 100644
+--- a/xfce4-session/Makefile.am
++++ b/xfce4-session/Makefile.am
+@@ -38,8 +38,6 @@ xfce4_session_SOURCES =							\
+ 	xfsm-compat-gnome.h						\
+ 	xfsm-compat-kde.c						\
+ 	xfsm-compat-kde.h						\
+-	xfsm-consolekit.c						\
+-	xfsm-consolekit.h						\
+ 	xfsm-dns.c							\
+ 	xfsm-dns.h							\
+ 	xfsm-error.c							\
+@@ -65,6 +63,16 @@ xfce4_session_SOURCES =							\
+ 	xfsm-upower.c							\
+ 	xfsm-upower.h
+ 
++if HAVE_SYSTEMD
++xfce4_session_SOURCES +=						\
++	xfsm-systemd.c							\
++	xfsm-systemd.h
++else
++xfce4_session_SOURCES +=						\
++	xfsm-consolekit.c						\
++	xfsm-consolekit.h
++endif
++
+ xfce4_session_CFLAGS =							\
+ 	$(LIBSM_CFLAGS)							\
+ 	$(LIBX11_CFLAGS)						\
+@@ -72,6 +80,7 @@ xfce4_session_CFLAGS =							\
+ 	$(DBUS_CFLAGS)							\
+ 	$(DBUS_GLIB_CFLAGS)						\
+ 	$(LIBWNCK_CFLAGS)						\
++	$(SYSTEMD_CFLAGS)						\
+ 	$(XFCONF_CFLAGS)						\
+ 	$(GMODULE_CFLAGS)						\
+ 	$(PLATFORM_CFLAGS)
+@@ -91,6 +100,7 @@ xfce4_session_LDADD =							\
+ 	$(DBUS_LIBS)							\
+ 	$(DBUS_GLIB_LIBS)						\
+ 	$(LIBWNCK_LIBS)							\
++	$(SYSTEMD_LIBS)							\
+ 	$(XFCONF_LIBS)							\
+ 	-lm
+ 
+diff --git a/xfce4-session/xfsm-shutdown.c b/xfce4-session/xfsm-shutdown.c
+index d8757a8..4c483a7 100644
+--- a/xfce4-session/xfsm-shutdown.c
++++ b/xfce4-session/xfsm-shutdown.c
+@@ -66,10 +66,13 @@
+ #include <xfce4-session/xfsm-fadeout.h>
+ #include <xfce4-session/xfsm-global.h>
+ #include <xfce4-session/xfsm-legacy.h>
+-#include <xfce4-session/xfsm-consolekit.h>
+ #include <xfce4-session/xfsm-upower.h>
+ 
+-
++#ifdef HAVE_SYSTEMD
++#include <xfce4-session/xfsm-systemd.h>
++#else
++#include <xfce4-session/xfsm-consolekit.h>
++#endif
+ 
+ static void xfsm_shutdown_finalize  (GObject      *object);
+ static void xfsm_shutdown_sudo_free (XfsmShutdown *shutdown);
+@@ -93,7 +96,11 @@ struct _XfsmShutdown
+ {
+   GObject __parent__;
+ 
++#ifdef HAVE_SYSTEMD
++  XfsmSystemd    *systemd;
++#else
+   XfsmConsolekit *consolekit;
++#endif
+   XfsmUPower     *upower;
+ 
+   /* kiosk settings */
+@@ -131,7 +138,11 @@ xfsm_shutdown_init (XfsmShutdown *shutdown)
+ {
+   XfceKiosk *kiosk;
+ 
++#ifdef HAVE_SYSTEMD
++  shutdown->systemd = xfsm_systemd_get ();
++#else
+   shutdown->consolekit = xfsm_consolekit_get ();
++#endif
+   shutdown->upower = xfsm_upower_get ();
+   shutdown->helper_state = SUDO_NOT_INITIAZED;
+   shutdown->helper_require_password = FALSE;
+@@ -150,7 +161,11 @@ xfsm_shutdown_finalize (GObject *object)
+ {
+   XfsmShutdown *shutdown = XFSM_SHUTDOWN (object);
+ 
++#ifdef HAVE_SYSTEMD
++  g_object_unref (G_OBJECT (shutdown->systemd));
++#else
+   g_object_unref (G_OBJECT (shutdown->consolekit));
++#endif
+   g_object_unref (G_OBJECT (shutdown->upower));
+ 
+   /* close down helper */
+@@ -641,7 +656,11 @@ xfsm_shutdown_try_restart (XfsmShutdown  *shutdown,
+   if (shutdown->helper_state == SUDO_AVAILABLE)
+     return xfsm_shutdown_sudo_try_action (shutdown, XFSM_SHUTDOWN_RESTART, error);
+   else
++#ifdef HAVE_SYSTEMD
++    return xfsm_systemd_try_restart (shutdown->systemd, error);
++#else
+     return xfsm_consolekit_try_restart (shutdown->consolekit, error);
++#endif
+ }
+ 
+ 
+@@ -658,7 +677,11 @@ xfsm_shutdown_try_shutdown (XfsmShutdown  *shutdown,
+   if (shutdown->helper_state == SUDO_AVAILABLE)
+     return xfsm_shutdown_sudo_try_action (shutdown, XFSM_SHUTDOWN_SHUTDOWN, error);
+   else
++#ifdef HAVE_SYSTEMD
++    return xfsm_systemd_try_shutdown (shutdown->systemd, error);
++#else
+     return xfsm_consolekit_try_shutdown (shutdown->consolekit, error);
++#endif
+ }
+ 
+ 
+@@ -698,7 +721,11 @@ xfsm_shutdown_can_restart (XfsmShutdown  *shutdown,
+       return TRUE;
+     }
+ 
++#ifdef HAVE_SYSTEMD
++  if (xfsm_systemd_can_restart (shutdown->systemd, can_restart, error))
++#else
+   if (xfsm_consolekit_can_restart (shutdown->consolekit, can_restart, error))
++#endif
+     return TRUE;
+ 
+   if (xfsm_shutdown_sudo_init (shutdown, error))
+@@ -725,7 +752,11 @@ xfsm_shutdown_can_shutdown (XfsmShutdown  *shutdown,
+       return TRUE;
+     }
+ 
++#ifdef HAVE_SYSTEMD
++  if (xfsm_systemd_can_shutdown (shutdown->systemd, can_shutdown, error))
++#else
+   if (xfsm_consolekit_can_shutdown (shutdown->consolekit, can_shutdown, error))
++#endif
+     return TRUE;
+ 
+   if (xfsm_shutdown_sudo_init (shutdown, error))
+diff --git a/xfce4-session/xfsm-systemd.c b/xfce4-session/xfsm-systemd.c
+new file mode 100644
+index 0000000..7bdd39d
+--- /dev/null
++++ b/xfce4-session/xfsm-systemd.c
+@@ -0,0 +1,229 @@
++/*-
++ * Copyright (C) 2012 Christian Hesse
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2, or (at your option)
++ * any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
++ * MA 02110-1301 USA.
++ */
++
++#include <config.h>
++
++#include <gio/gio.h>
++#include <polkit/polkit.h>
++#include <dbus/dbus-glib.h>
++#include <dbus/dbus-glib-lowlevel.h>
++
++#include <xfce4-session/xfsm-systemd.h>
++
++
++
++#define SYSTEMD_DBUS_NAME               "org.freedesktop.login1"
++#define SYSTEMD_DBUS_PATH               "/org/freedesktop/login1"
++#define SYSTEMD_DBUS_INTERFACE          "org.freedesktop.login1.Manager"
++#define SYSTEMD_REBOOT_ACTION           "Reboot"
++#define SYSTEMD_POWEROFF_ACTION         "PowerOff"
++#define SYSTEMD_REBOOT_TEST             "org.freedesktop.login1.reboot"
++#define SYSTEMD_POWEROFF_TEST           "org.freedesktop.login1.power-off"
++
++
++
++static void     xfsm_systemd_finalize     (GObject         *object);
++
++
++
++struct _XfsmSystemdClass
++{
++  GObjectClass __parent__;
++};
++
++struct _XfsmSystemd
++{
++  GObject __parent__;
++
++  PolkitAuthority *authority;
++  PolkitSubject   *subject;
++};
++
++
++
++G_DEFINE_TYPE (XfsmSystemd, xfsm_systemd, G_TYPE_OBJECT)
++
++
++
++static void
++xfsm_systemd_class_init (XfsmSystemdClass *klass)
++{
++  GObjectClass *gobject_class;
++
++  gobject_class = G_OBJECT_CLASS (klass);
++  gobject_class->finalize = xfsm_systemd_finalize;
++}
++
++
++
++static void
++xfsm_systemd_init (XfsmSystemd *systemd)
++{
++  systemd->authority = polkit_authority_get_sync (NULL, NULL);
++  systemd->subject = polkit_unix_process_new (getpid());
++}
++
++
++
++static void
++xfsm_systemd_finalize (GObject *object)
++{
++  XfsmSystemd *systemd = XFSM_SYSTEMD (object);
++
++  g_object_unref (G_OBJECT (systemd->authority));
++  g_object_unref (G_OBJECT (systemd->subject));
++
++  (*G_OBJECT_CLASS (xfsm_systemd_parent_class)->finalize) (object);
++}
++
++
++static gboolean
++xfsm_systemd_can_method (XfsmSystemd  *systemd,
++                         gboolean     *can_method,
++                         const gchar  *method,
++                         GError      **error)
++{
++  PolkitAuthorizationResult *res;
++  GError                    *local_error = NULL;
++
++  *can_method = FALSE;
++
++  res = polkit_authority_check_authorization_sync (systemd->authority,
++                                                   systemd->subject,
++                                                   method,
++                                                   NULL,
++                                                   POLKIT_CHECK_AUTHORIZATION_FLAGS_NONE,
++                                                   NULL,
++                                                   &local_error);
++
++  if (res == NULL)
++    {
++      g_propagate_error (error, local_error);
++      return FALSE;
++    }
++
++  *can_method = polkit_authorization_result_get_is_authorized (res)
++                || polkit_authorization_result_get_is_challenge (res);
++
++  g_object_unref (G_OBJECT (res));
++
++  return TRUE;
++}
++
++
++
++static gboolean
++xfsm_systemd_try_method (XfsmSystemd  *systemd,
++                         const gchar  *method,
++                         GError      **error)
++{
++  GDBusConnection *bus;
++  GError          *local_error = NULL;
++
++  bus = g_bus_get_sync (G_BUS_TYPE_SYSTEM, NULL, error);
++  if (G_UNLIKELY (bus == NULL))
++    return FALSE;
++
++  g_dbus_connection_call_sync (bus,
++                               SYSTEMD_DBUS_NAME,
++                               SYSTEMD_DBUS_PATH,
++                               SYSTEMD_DBUS_INTERFACE,
++                               method,
++                               g_variant_new ("(b)", TRUE),
++                               NULL, 0, G_MAXINT, NULL,
++                               &local_error);
++
++  g_object_unref (G_OBJECT (bus));
++
++  if (local_error != NULL)
++    {
++      g_propagate_error (error, local_error);
++      return FALSE;
++    }
++
++  return TRUE;
++}
++
++
++
++XfsmSystemd *
++xfsm_systemd_get (void)
++{
++  static XfsmSystemd *object = NULL;
++
++  if (G_LIKELY (object != NULL))
++    {
++      g_object_ref (G_OBJECT (object));
++    }
++  else
++    {
++      object = g_object_new (XFSM_TYPE_SYSTEMD, NULL);
++      g_object_add_weak_pointer (G_OBJECT (object), (gpointer) &object);
++    }
++
++  return object;
++}
++
++
++
++gboolean
++xfsm_systemd_try_restart (XfsmSystemd  *systemd,
++                          GError      **error)
++{
++  return xfsm_systemd_try_method (systemd,
++                                  SYSTEMD_REBOOT_ACTION,
++                                  error);
++}
++
++
++
++gboolean
++xfsm_systemd_try_shutdown (XfsmSystemd  *systemd,
++                           GError      **error)
++{
++  return xfsm_systemd_try_method (systemd,
++                                  SYSTEMD_POWEROFF_ACTION,
++                                  error);
++}
++
++
++
++gboolean
++xfsm_systemd_can_restart (XfsmSystemd  *systemd,
++                          gboolean     *can_restart,
++                          GError      **error)
++{
++  return xfsm_systemd_can_method (systemd,
++                                  can_restart,
++                                  SYSTEMD_REBOOT_TEST,
++                                  error);
++}
++
++
++
++gboolean
++xfsm_systemd_can_shutdown (XfsmSystemd  *systemd,
++                           gboolean     *can_shutdown,
++                           GError      **error)
++{
++  return xfsm_systemd_can_method (systemd,
++                                  can_shutdown,
++                                  SYSTEMD_POWEROFF_TEST,
++                                  error);
++}
+diff --git a/xfce4-session/xfsm-systemd.h b/xfce4-session/xfsm-systemd.h
+new file mode 100644
+index 0000000..8223622
+--- /dev/null
++++ b/xfce4-session/xfsm-systemd.h
+@@ -0,0 +1,55 @@
++/* -*- Mode: C; tab-width: 8; indent-tabs-mode: t; c-basic-offset: 8 -*-
++ *
++ * Copyright (C) 2012 Christian Hesse
++ *
++ * Licensed under the GNU General Public License Version 2
++ *
++ * This program is free software; you can redistribute it and/or modify
++ * it under the terms of the GNU General Public License as published by
++ * the Free Software Foundation; either version 2 of the License, or
++ * (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
++ */
++
++#ifndef __XFSM_SYSTEMD_H__
++#define __XFSM_SYSTEMD_H__
++
++typedef struct _XfsmSystemdClass XfsmSystemdClass;
++typedef struct _XfsmSystemd      XfsmSystemd;
++
++#define XFSM_TYPE_SYSTEMD            (xfsm_systemd_get_type ())
++#define XFSM_SYSTEMD(obj)            (G_TYPE_CHECK_INSTANCE_CAST ((obj), XFSM_TYPE_SYSTEMD, XfsmSystemd))
++#define XFSM_SYSTEMD_CLASS(klass)    (G_TYPE_CHECK_CLASS_CAST ((klass), XFSM_TYPE_SYSTEMD, XfsmSystemdClass))
++#define XFSM_IS_SYSTEMD(obj)         (G_TYPE_CHECK_INSTANCE_TYPE ((obj), XFSM_TYPE_SYSTEMD))
++#define XFSM_IS_SYSTEMD_CLASS(klass) (G_TYPE_CHECK_CLASS_TYPE ((klass), XFSM_TYPE_SYSTEMD))
++#define XFSM_SYSTEMD_GET_CLASS(obj)  (G_TYPE_INSTANCE_GET_CLASS ((obj), XFSM_TYPE_SYSTEMD, XfsmSystemdClass))
++
++GType           xfsm_systemd_get_type     (void) G_GNUC_CONST;
++
++XfsmSystemd *xfsm_systemd_get          (void);
++
++gboolean     xfsm_systemd_try_restart  (XfsmSystemd  *systemd,
++                                        GError      **error);
++
++gboolean     xfsm_systemd_try_shutdown (XfsmSystemd  *systemd,
++                                        GError      **error);
++
++gboolean     xfsm_systemd_can_restart  (XfsmSystemd  *systemd,
++                                        gboolean     *can_restart,
++                                        GError      **error);
++
++gboolean     xfsm_systemd_can_shutdown (XfsmSystemd  *systemd,
++                                        gboolean     *can_shutdown,
++                                        GError      **error);
++
++G_END_DECLS
++
++#endif  /* __XFSM_SYSTEMD_H__ */
+-- 
+1.7.4.4
+
diff --git a/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
new file mode 100644
index 0000000..100f34b
--- /dev/null
+++ b/meta-systemd/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bbappend
@@ -0,0 +1,8 @@
+# look for files in the layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
+
+DEPENDS += "systemd"
+
+PRINC := "${@int(PRINC) + 1}"
+
+SRC_URI += "file://0001-Add-shutdown-reboot-functionality-for-systemd-bug-87.patch"
-- 
1.7.4.4



