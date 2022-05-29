Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55F96C433F5
	for <webhook@archiver.kernel.org>; Sun, 29 May 2022 12:44:03 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.24736.1653828232948454205
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 05:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout07.t-online.de (Postfix) with SMTP id 355B71394E
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 May 2022 14:43:51 +0200 (CEST)
Received: from localhost.localdomain ([84.163.37.187]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nvIGp-1a7Qyg0; Sun, 29 May 2022 14:43:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] gnome-disk-utility: fix build for wayland only
Date: Sun, 29 May 2022 14:43:32 +0200
Message-Id: <20220529124332.28817-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220529124332.28817-1-f_l_k@t-online.de>
References: <20220529124332.28817-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1653828227-01421A9A-37C82E01/0/0 CLEAN NORMAL
X-TOI-MSGID: b4f7f580-f3f9-4b3e-baf7-b87ef29f7546
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 29 May 2022 12:44:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97318

libcanberra-gtk3 module isn't buildable for wayland.
Remove its dpendency.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tility-remove-libcanberra-dependency.patch | 135 ++++++++++++++++++
 .../gnome-disk-utility_42.0.bb                |   8 +-
 2 files changed, 140 insertions(+), 3 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/gnome-disk-utility/gnome-dis=
k-utility/0001-gnome-disk-utility-remove-libcanberra-dependency.patch

diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty/0001-gnome-disk-utility-remove-libcanberra-dependency.patch b/meta-gno=
me/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001-gnome-disk-ut=
ility-remove-libcanberra-dependency.patch
new file mode 100644
index 000000000..675f4635b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility/0001=
-gnome-disk-utility-remove-libcanberra-dependency.patch
@@ -0,0 +1,135 @@
+From 36cbdd82f21e4ef37da9f05c1c5e770b6cd66df2 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 29 May 2022 06:35:26 +0200
+Subject: [PATCH] gnome-disk-utility: remove libcanberra dependency
+
+libcanberra-gtk3 module isn't buildable for wayland.
+Remove its dpendency.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate
+---
+ meson.build                           |  1 -
+ src/disks/gducreatediskimagedialog.c  | 27 ++-------------------------
+ src/disks/gdurestorediskimagedialog.c | 20 +-------------------
+ src/disks/meson.build                 |  1 -
+ 4 files changed, 3 insertions(+), 46 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 0daf7f82..cba6c74b 100644
+--- a/meson.build
++++ b/meson.build
+@@ -72,7 +72,6 @@ dvdread_dep =3D dependency('dvdread', version: '>=3D 4=
.2.0')
+ gio_unix_dep =3D dependency('gio-unix-2.0', version: '>=3D 2.31.0')
+ gmodule_dep =3D dependency('gmodule-2.0')
+ gtk_dep =3D dependency('gtk+-3.0', version: '>=3D 3.16.0')
+-libcanberra_dep =3D dependency('libcanberra-gtk3', version: '>=3D 0.1')
+ # Keep the version here synchronised with subprojects/libhandy.wrap
+ libhandy_dep =3D dependency('libhandy-1', version: '>=3D 1.5.0', fallba=
ck: ['libhandy', 'libhandy_dep'])
+ liblzma_dep =3D dependency('liblzma', version: '>=3D 5.0.5')
+diff --git a/src/disks/gducreatediskimagedialog.c b/src/disks/gducreated=
iskimagedialog.c
+index 181b2892..a22004cf 100644
+--- a/src/disks/gducreatediskimagedialog.c
++++ b/src/disks/gducreatediskimagedialog.c
+@@ -21,8 +21,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+=20
+-#include <canberra-gtk.h>
+-
+ #include "gduapplication.h"
+ #include "gduwindow.h"
+ #include "gducreatediskimagedialog.h"
+@@ -297,19 +295,7 @@ create_disk_image_populate (DialogData *data)
+=20
+ static void
+ play_read_error_sound (DialogData *data)
+-{
+-  const gchar *sound_message;
+-
+-  /* Translators: A descriptive string for the sound played when
+-   * there's a read error that's being ignored, see
+-   * CA_PROP_EVENT_DESCRIPTION
+-   */
+-  sound_message =3D _("Disk image read error");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
+-                          CA_PROP_EVENT_ID, "dialog-warning",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
+-}
++{}
+=20
+ /* --------------------------------------------------------------------=
-------------------------------- */
+=20
+@@ -403,16 +389,7 @@ update_job (DialogData *data,
+=20
+ static void
+ play_complete_sound (DialogData *data)
+-{
+-  const gchar *sound_message;
+-
+-  /* Translators: A descriptive string for the 'complete' sound, see CA=
_PROP_EVENT_DESCRIPTION */
+-  sound_message =3D _("Disk image copying complete");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->window), 0,
+-                          CA_PROP_EVENT_ID, "complete",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
+-}
++{}
+=20
+ /* --------------------------------------------------------------------=
-------------------------------- */
+=20
+diff --git a/src/disks/gdurestorediskimagedialog.c b/src/disks/gdurestor=
ediskimagedialog.c
+index bccf97e9..e7ec81cb 100644
+--- a/src/disks/gdurestorediskimagedialog.c
++++ b/src/disks/gdurestorediskimagedialog.c
+@@ -17,8 +17,6 @@
+ #include <sys/ioctl.h>
+ #include <linux/fs.h>
+=20
+-#include <canberra-gtk.h>
+-
+ #include "gduapplication.h"
+ #include "gduwindow.h"
+ #include "gdurestorediskimagedialog.h"
+@@ -606,23 +604,7 @@ update_job (DialogData *data,
+=20
+ static void
+ play_complete_sound (DialogData *data)
+-{
+-  const gchar *sound_message;
+-
+-  /* Translators: A descriptive string for the 'complete' sound, see CA=
_PROP_EVENT_DESCRIPTION */
+-  sound_message =3D _("Disk image copying complete");
+-  ca_gtk_play_for_widget (GTK_WIDGET (data->dialog), 0,
+-                          CA_PROP_EVENT_ID, "complete",
+-                          CA_PROP_EVENT_DESCRIPTION, sound_message,
+-                          NULL);
+-
+-  if (data->inhibit_cookie > 0)
+-    {
+-      gtk_application_uninhibit (GTK_APPLICATION (gdu_window_get_applic=
ation (data->window)),
+-                                 data->inhibit_cookie);
+-      data->inhibit_cookie =3D 0;
+-    }
+-}
++{}
+=20
+ /* --------------------------------------------------------------------=
-------------------------------- */
+=20
+diff --git a/src/disks/meson.build b/src/disks/meson.build
+index 35b2f103..6fc367b4 100644
+--- a/src/disks/meson.build
++++ b/src/disks/meson.build
+@@ -85,7 +85,6 @@ deps =3D [
+   dvdread_dep,
+   gio_unix_dep,
+   gmodule_dep,
+-  libcanberra_dep,
+   libgdu_dep,
+   libhandy_dep,
+   liblzma_dep,
+--=20
+2.25.1
+
diff --git a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_42.0.bb b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utili=
ty_42.0.bb
index e9724748c..c3789b0c1 100644
--- a/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0=
.bb
+++ b/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_42.0=
.bb
@@ -7,7 +7,6 @@ SECTION =3D "x11/gnome"
 DEPENDS =3D " \
     gtk+3 \
     libdvdread \
-    libcanberra \
     libnotify \
     libsecret \
     libpwquality \
@@ -19,13 +18,16 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gtk-icon-cache gettext features_check mime-x=
dg
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit"
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)=
}"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11'=
, d)}"
=20
 # As soon as elogind is of interest this needs rework: meson option is c=
ombo
 PACKAGECONFIG[systemd] =3D "-Dlogind=3Dlibsystemd,-Dlogind=3Dnone,system=
d"
+PACKAGECONFIG[x11] =3D ",,libcanberra"
=20
+SRC_URI:append =3D " ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', =
'file://0001-gnome-disk-utility-remove-libcanberra-dependency.patch', '',=
 d)}"
 SRC_URI[archive.sha256sum] =3D "1b6564454d67426322cb3bfc5a5558653bfc7dfe=
ea2ae0825b1d08629f01090b"
=20
 EXTRA_OEMESON =3D "-Dman=3Dfalse"
--=20
2.25.1


