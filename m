Received: from mail-ee0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TmlRE-0004cW-L9
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Dec 2012 14:18:10 +0100
Received: by mail-ee0-f50.google.com with SMTP id b45so3236987eek.37
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Dec 2012 05:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=cbHbBsdZJdwYLGZi8RZ2Ep/VIbNbOJFI3CdFu2jshi8=;
	b=SnXiAcLncmYBD+FU0oYjswJ/JgsqF5CNKTdEKz+ytP51pjKsSvWrqmZXPwPUQKsrcR
	9P82JDqgF9vz9buhcZZT7/gWBKC7IV1iWp7oRTHgqrxx0BvO8MtHE764Q6r2f9q+GnV/
	ZODungjW9wJSWAhQK657wH5Gxg5ohTyYUd6tOtNigezg6+KY0FJUzR5zDTLuDmMu829p
	QCK58Ac983Czz4rGvtgcK5Opq0SvDeklGPatBLkS+r7jw98vXkz9/EdLmFmI/zCLZrOo
	tEaLMOAJmhMpdjpc7F4nGM50l+6VMqkRs5dv5RMn+FgZX8qfwEGyz6ZlZ8sdutC+HfeS
	Vp6w==
X-Received: by 10.14.194.195 with SMTP id m43mr48266808een.44.1356267788315;
	Sun, 23 Dec 2012 05:03:08 -0800 (PST)
Received: from localhost.localdomain (p5B0A1394.dip.t-dialin.net.
	[91.10.19.148])
	by mx.google.com with ESMTPS id f49sm34747114eep.12.2012.12.23.05.03.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 23 Dec 2012 05:03:07 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 23 Dec 2012 14:02:37 +0100
Message-Id: <1356267761-15152-9-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
References: <1356267761-15152-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [meta-xfce/meta-gnome 08/12] xfce4-session: remove gnome-keyring dependency
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
X-List-Received-Date: Sun, 23 Dec 2012 13:18:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../files/0002-Remove-gnome-keyring-remains.patch  |   82 ++++++++++++++++++++
 .../xfce4-session/xfce4-session_4.10.0.bb          |    6 +-
 2 files changed, 86 insertions(+), 2 deletions(-)
 create mode 100644 meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch

diff --git a/meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch b/meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch
new file mode 100644
index 0000000..6d5e9c8
--- /dev/null
+++ b/meta-xfce/recipes-xfce/xfce4-session/files/0002-Remove-gnome-keyring-remains.patch
@@ -0,0 +1,82 @@
+From 7a75a8a0f7089b716e702e6bb0cf13fc3194e3db Mon Sep 17 00:00:00 2001
+From: Nick Schermer <nick@xfce.org>
+Date: Sun, 29 Apr 2012 13:35:37 +0200
+Subject: [PATCH] Remove gnome-keyring remains.
+
+Not required anymore. gnome_keyring_daemon_prepare_environment_sync
+is a stub function that does nothing.
+
+Upstream-status: backport [1]
+
+[1] http://git.xfce.org/xfce/xfce4-session/commit/?id=7a75a8a0f7089b716e702e6bb0cf13fc3194e3db
+---
+ configure.in                   |    5 -----
+ xfce4-session/Makefile.am         |    2 --
+ xfce4-session/xfsm-compat-gnome.c |    8 --------
+ 3 files changed, 0 insertions(+), 15 deletions(-)
+
+diff --git a/configure.in b/configure.in
+index f8684b3..9aa4f8f 100644
+--- a/configure.in
++++ b/configure.in
+@@ -96,11 +96,6 @@ XDT_CHECK_PACKAGE([DBUS], [dbus-1], [1.1.0])
+ XDT_CHECK_PACKAGE([DBUS_GLIB], [dbus-glib-1], [0.84])
+ XDT_CHECK_PACKAGE([XFCONF], [libxfconf-0], [4.9.0])
+ 
+-dnl Check for gnome support
+-XDT_CHECK_OPTIONAL_PACKAGE([GNOME_KEYRING], [gnome-keyring-1], [2.22],
+-                           [libgnome-keyring],
+-                           [Extra gnome-keyring compatibility support], [no])
+-
+ dnl Check for debugging support
+ XDT_FEATURE_DEBUG([xfsm_debug_default])
+ 
+diff --git a/xfce4-session/Makefile.am b/xfce4-session/Makefile.am
+index 5e8343a..c015154 100644
+--- a/xfce4-session/Makefile.am
++++ b/xfce4-session/Makefile.am
+@@ -66,7 +66,6 @@ xfce4_session_SOURCES =							\
+ 	xfsm-upower.h
+ 
+ xfce4_session_CFLAGS =							\
+-	$(GNOME_KEYRING_CFLAGS)						\
+ 	$(LIBSM_CFLAGS)							\
+ 	$(LIBX11_CFLAGS)						\
+ 	$(LIBXFCE4UI_CFLAGS)						\
+@@ -93,7 +92,6 @@ xfce4_session_LDADD =							\
+ 	$(DBUS_GLIB_LIBS)						\
+ 	$(LIBWNCK_LIBS)							\
+ 	$(XFCONF_LIBS)							\
+-	$(GNOME_KEYRING_LIBS)						\
+ 	-lm
+ 
+ xfce4_session_DEPENDENCIES =						\
+diff --git a/xfce4-session/xfsm-compat-gnome.c b/xfce4-session/xfsm-compat-gnome.c
+index b5b4a99..e1fa16f 100644
+--- a/xfce4-session/xfsm-compat-gnome.c
++++ b/xfce4-session/xfsm-compat-gnome.c
+@@ -59,10 +59,6 @@
+ 
+ #include <libxfce4util/libxfce4util.h>
+ 
+-#ifdef HAVE_GNOME_KEYRING
+-#include <gnome-keyring.h>
+-#endif
+-
+ #include <xfce4-session/xfsm-compat-gnome.h>
+ 
+ #define GNOME_KEYRING_DAEMON "gnome-keyring-daemon"
+@@ -154,10 +150,6 @@ gnome_keyring_daemon_startup (void)
+             }
+ 
+           g_strfreev (lines);
+-
+-#ifdef HAVE_GNOME_KEYRING
+-          gnome_keyring_daemon_prepare_environment_sync ();
+-#endif
+         }
+       else
+         {
+-- 
+1.7.4.4
+
diff --git a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
index 4df9894..3bd3743 100644
--- a/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
+++ b/meta-xfce/recipes-xfce/xfce4-session/xfce4-session_4.10.0.bb
@@ -2,14 +2,16 @@ DESCRIPTION = "xfce4-session is a session manager for Xfce 4 Desktop Environment
 SECTION = "x11"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=9ac2e7cff1ddaf48b6eab6028f23ef88"
-DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf gnome-keyring"
+DEPENDS = "virtual/libx11 libsm libxfce4util libxfce4ui gtk+ libwnck dbus dbus-glib xfconf"
 RDEPENDS_${PN} = "netbase xinit dbus-x11 iceauth consolekit upower"
+PR = "r1"
 
 inherit xfce
 
 SRC_URI[md5sum] = "4768e1a41a0287af6aad18b329a0f230"
 SRC_URI[sha256sum] = "bb8aa9a74c3d382840596fb4875144d66c7f3f47c8e9ee81d31e3428a72c46ce"
-SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch"
+SRC_URI += "file://0001-Handle-multiple-interactive-session-save-bug-5379.patch \
+            file://0002-Remove-gnome-keyring-remains.patch"
 
 # protect from frightening message that xfce might not work correctly
 pkg_postinst_${PN} () {
-- 
1.7.4.4



