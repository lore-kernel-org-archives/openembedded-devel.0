Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676DBD3EE86
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40180.1769096637744800938
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id C3E1EF34B
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgZ0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 11/11] gnome-shell: fix build without x11 in DISTRO_FEATURES
Date: Thu, 22 Jan 2026 16:43:34 +0100
Message-ID: <20260122154334.1872038-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-417F9925-C1E8FD9A/0/0 CLEAN NORMAL
X-TOI-MSGID: fc3d7e74-a58c-40e0-a304-44e345b0728a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123749

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...c-only-include-x11-headers-if-HAVE_X.patch | 30 +++++++++++++++++++
 .../gnome-shell/gnome-shell_48.3.bb           |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001=
-shell-app-usage.c-only-include-x11-headers-if-HAVE_X.patch

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-shell-=
app-usage.c-only-include-x11-headers-if-HAVE_X.patch b/meta-gnome/recipes=
-gnome/gnome-shell/gnome-shell/0001-shell-app-usage.c-only-include-x11-he=
aders-if-HAVE_X.patch
new file mode 100644
index 0000000000..e9cee8e91a
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell/0001-shell-app-usa=
ge.c-only-include-x11-headers-if-HAVE_X.patch
@@ -0,0 +1,30 @@
+From 2ae299419ec7b15a59e2b2b8a5b266b9f29df5a4 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 22 Jan 2026 12:52:34 +0100
+Subject: [PATCH] shell-app-usage.c: only include x11 headers if HAVE_X11
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Pending
+---
+ src/shell-app-usage.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/shell-app-usage.c b/src/shell-app-usage.c
+index 9e57a91b2..77adcf6a2 100644
+--- a/src/shell-app-usage.c
++++ b/src/shell-app-usage.c
+@@ -5,8 +5,10 @@
+ #include <string.h>
+ #include <stdlib.h>
+=20
++#ifdef HAVE_X11
+ #include <X11/Xlib.h>
+ #include <X11/Xatom.h>
++#endif
+ #include <glib.h>
+ #include <gio/gio.h>
+ #include <meta/display.h>
+--=20
+2.52.0
+
diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
index 33ba5eaa39..c8a5e20899 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_48.3.bb
@@ -24,7 +24,7 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gettext gobject-introspection gtk-icon-cache=
 features_check bash-completion
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
+REQUIRED_DISTRO_FEATURES =3D "polkit systemd pam"
=20
 GTKIC_VERSION =3D "4"
 GTKDOC_MESON_OPTION =3D "gtk_doc"
@@ -33,6 +33,7 @@ GIR_MESON_OPTION =3D ""
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
=20
+SRC_URI +=3D "file://0001-shell-app-usage.c-only-include-x11-headers-if-=
HAVE_X.patch"
 SRC_URI[archive.sha256sum] =3D "fb0203fc748593f14e51732618e1f042525fd719=
764a0fdb0ee3f6fe413a9b2b"
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
--=20
2.52.0


