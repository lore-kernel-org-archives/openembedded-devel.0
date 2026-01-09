Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68848D16813
	for <webhook@archiver.kernel.org>; Fri,  9 Jan 2026 11:22:17 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8007.1767957730192333455
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Jan 2026 03:22:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout01.t-online.de (Postfix) with SMTP id 98BE31C823
	for <openembedded-devel@lists.openembedded.org>; Fri,  9 Jan 2026 12:22:07 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.239.35]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1veAZA-0Qedvt0; Fri, 9 Jan 2026 12:22:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-disk-utility: remove outdated patch
Date: Fri,  9 Jan 2026 12:21:59 +0100
Message-ID: <20260109112159.88242-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1767957724-B2FFAA17-0C5265FC/0/0 CLEAN NORMAL
X-TOI-MSGID: 38915d56-f203-4e20-8c6a-0c454fa6b2dc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Jan 2026 11:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123292

Dont remove libcanberra dependency. Meanwhile it can be built without
pulling in gtk2
---
 ...tility-remove-libcanberra-dependency.patch | 135 ------------------
 .../gnome-disk-utility_46.1.bb                |   2 +-
 2 files changed, 1 insertion(+), 136 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-dis=
k-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty/0001-gnome-disk-utility-remove-libcanberra-dependency.patch b/meta-gno=
me/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-ut=
ility-remove-libcanberra-dependency.patch
deleted file mode 100644
index 675f4635ba..0000000000
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001=
-gnome-disk-utility-remove-libcanberra-dependency.patch
+++ /dev/null
@@ -1,135 +0,0 @@
-From 36cbdd82f21e4ef37da9f05c1c5e770b6cd66df2 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Sun, 29 May 2022 06:35:26 +0200
-Subject: [PATCH] gnome-disk-utility: remove libcanberra dependency
-
-libcanberra-gtk3 module isn't buildable for wayland.
-Remove its dpendency.
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Inappropriate
----
- meson.build                           |  1 -
- src/disks/gducreatediskimagedialog.c  | 27 ++-------------------------
- src/disks/gdurestorediskimagedialog.c | 20 +-------------------
- src/disks/meson.build                 |  1 -
- 4 files changed, 3 insertions(+), 46 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 0daf7f82..cba6c74b 100644
---- a/meson.build
-+++ b/meson.build
-@@ -72,7 +72,6 @@ dvdread_dep =3D dependency('dvdread', version: '>=3D 4=
.2.0')
- gio_unix_dep =3D dependency('gio-unix-2.0', version: '>=3D 2.31.0')
- gmodule_dep =3D dependency('gmodule-2.0')
- gtk_dep =3D dependency('gtk+-3.0', version: '>=3D 3.16.0')
--libcanberra_dep =3D dependency('libcanberra-gtk3', version: '>=3D 0.1')
- # Keep the version here synchronised with subprojects/libhandy.wrap
- libhandy_dep =3D dependency('libhandy-1', version: '>=3D 1.5.0', fallba=
ck: ['libhandy', 'libhandy_dep'])
- liblzma_dep =3D dependency('liblzma', version: '>=3D 5.0.5')
-diff --git a/src/disks/gducreatediskimagedialog.c b/src/disks/gducreated=
iskimagedialog.c
-index 181b2892..a22004cf 100644
---- a/src/disks/gducreatediskimagedialog.c
-+++ b/src/disks/gducreatediskimagedialog.c
-@@ -21,8 +21,6 @@
- #include <sys/ioctl.h>
- #include <linux/fs.h>
-=20
--#include <canberra-gtk.h>
--
- #include "gduapplication.h"
- #include "gduwindow.h"
- #include "gducreatediskimagedialog.h"
-@@ -297,19 +295,7 @@ create_disk_image_populate (DialogData *data)
-=20
- static void
- play_read_error_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the sound played when
--   * there's a read error that's being ignored, see
--   * CA_PROP_EVENT_DESCRIPTION
--   */
--  sound_message =3D _("Disk image read error");
--  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
--                          CA_PROP_EVENT_ID, "dialog-warning",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--}
-+{}
-=20
- /* --------------------------------------------------------------------=
-------------------------------- */
-=20
-@@ -403,16 +389,7 @@ update_job (DialogData *data,
-=20
- static void
- play_complete_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the 'complete' sound, see CA=
_PROP_EVENT_DESCRIPTION */
--  sound_message =3D _("Disk image copying complete");
--  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
--                          CA_PROP_EVENT_ID, "complete",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--}
-+{}
-=20
- /* --------------------------------------------------------------------=
-------------------------------- */
-=20
-diff --git a/src/disks/gdurestorediskimagedialog.c b/src/disks/gdurestor=
ediskimagedialog.c
-index bccf97e9..e7ec81cb 100644
---- a/src/disks/gdurestorediskimagedialog.c
-+++ b/src/disks/gdurestorediskimagedialog.c
-@@ -17,8 +17,6 @@
- #include <sys/ioctl.h>
- #include <linux/fs.h>
-=20
--#include <canberra-gtk.h>
--
- #include "gduapplication.h"
- #include "gduwindow.h"
- #include "gdurestorediskimagedialog.h"
-@@ -606,23 +604,7 @@ update_job (DialogData *data,
-=20
- static void
- play_complete_sound (DialogData *data)
--{
--  const gchar *sound_message;
--
--  /* Translators: A descriptive string for the 'complete' sound, see CA=
_PROP_EVENT_DESCRIPTION */
--  sound_message =3D _("Disk image copying complete");
--  ca_gtk_play_for_widget (GTK_WIDGET (data->dialog), 0,
--                          CA_PROP_EVENT_ID, "complete",
--                          CA_PROP_EVENT_DESCRIPTION, sound_message,
--                          NULL);
--
--  if (data->inhibit_cookie > 0)
--    {
--      gtk_application_uninhibit (GTK_APPLICATION (gdu_window_get_applic=
ation (data->window)),
--                                 data->inhibit_cookie);
--      data->inhibit_cookie =3D 0;
--    }
--}
-+{}
-=20
- /* --------------------------------------------------------------------=
-------------------------------- */
-=20
-diff --git a/src/disks/meson.build b/src/disks/meson.build
-index 35b2f103..6fc367b4 100644
---- a/src/disks/meson.build
-+++ b/src/disks/meson.build
-@@ -85,7 +85,6 @@ deps =3D [
-   dvdread_dep,
-   gio_unix_dep,
-   gmodule_dep,
--  libcanberra_dep,
-   libgdu_dep,
-   libhandy_dep,
-   liblzma_dep,
---=20
-2.25.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.1.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_46.1.bb
index 6f910c4c13..f035fe7ac6 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_46.1=
.bb
@@ -7,6 +7,7 @@ SECTION =3D "x11/gnome"
 DEPENDS =3D " \
     desktop-file-utils-native \
     gtk+3 \
+    libcanberra \
     libdvdread \
     libnotify \
     libsecret \
@@ -28,7 +29,6 @@ PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURE=
S', 'systemd x11', d)}"
 PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlogind=3Dnone,system=
d"
 PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
-SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
 SRC_URI[archive.sha256sum] =3D "c24e9439a04d70bcfae349ca134c7005435fe2b6=
f452114df878bff0b89bbffe"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
--=20
2.52.0


