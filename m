Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67E07D44C63
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:05:14 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37829.1768489511661623892
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:05:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout01.t-online.de (Postfix) with SMTP id 8AB3E1CFC4
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 16:05:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.202]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgOuK-1BFbkp0; Thu, 15 Jan 2026 16:05:08 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/3] gdm: update 48.0 -> 49.2
Date: Thu, 15 Jan 2026 16:04:59 +0100
Message-ID: <20260115150459.17491-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115150459.17491-1-f_l_k@t-online.de>
References: <20260115150459.17491-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1768489508-27FFCAF5-DB897519/0/0 CLEAN NORMAL
X-TOI-MSGID: 0b2620c4-ca1a-479d-885d-827d9d1ef226
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 15:05:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123509

- build x11 support depending on DISTRO_FEATURES
- add runtime path for nologin to fix reproducibility
- remove backport patch
- use gtk4

49.2
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Fixed bug that prevented X11 fallback whenever autologin fails
* Introduced CI tests built around GNOME OS

49.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Hotfixed a bug that leaves gnome-shell in a locked up state
* Fixed implementation of userdb, so we don't list our users when asked a=
bout
  UID 0 (root)
* Switched safety check that avoids accidentally deleting / and /home fro=
m an
  assertion to an error, so the check always runs even in production buil=
ds
* Fixed bug where gnome-initial-setup's configuration (i.e. input methods=
)
  failed to migrate to the final user session
* Fixed bug where GDM assumed that Wayland is unavailable if Xwayland was=
n't
  installed on the system

49.0.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Follow-up for permissions issue fix, making the fix work in more enviro=
nments

49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Fix build failures when built without plymouth support
* Fix permissions issue on the GDM work dir (/var/lib/gdm) that broke set=
tings
  persistence

49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Fixed a bug in PAM config files, introduced by transition to dynamic us=
ers
* Added logic to retry preferred display server (usually Wayland) before =
falling
  back (usually to X11)
* Fixed a bug where Plymouth keeps running if not display is plugged into=
 the
  system. This would prevent bootup from completing and would prevent the=
 user
  from logging in on a serial console
* Fixed GDM's session file loading logic to search directories in correct
  precedence order
* Fix simpledrm device detection to match the kernel's new device naming =
scheme
* Re-enabled X11 support by default. We found it difficult to cleanly sep=
arate
  GDM's ability to launch modern X11 sessions (which we intended to keep =
enabled
  in GNOME 49) from the rest of GDM's X11 integration (which we intended =
to
  disable but leave intact for GNOME 49). We still plan to remove GDM's f=
ull
  X11 integration in a future version, and leave only the ability to laun=
ch
  modern X11 sessions.
* Worked around a regression introduced by the switch to dynamic users, w=
here
  the login screen no longer persists any settings

49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Switch to using dynamic users for greeter sessions. This enables system=
d-based
  session management on the greeter, removes GDM's dependency on dbus-dae=
mon,
  and frees us to drop gnome-session's builtin service manager.
* Adapt to changes in gnome-session 49, which dropped the builtin service=
 manager
  code and now exclusively relies on systemd for session startup. This me=
ans that
  GDM now depends on gnome-session 49.

49.alpha.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Drop dependency on Wacom g-s-d plugin  [Jordan; !301]
* Drop leftover udev rules  [Alessandro; !299]
* Fix warning when building without libxdmcp support  [Florian; !300]
* Add polkit rules to allow access to smartcards [David, !287]
* Misc [Joan; !298]

Contributors:
  Alessandro Astone, David H=C3=A4rdeman, Joan Torres L=C3=B3pez,
  Florian M=C3=BCllner, Jordan Petridis

Translators:
  Takayuki Kusano [ja], Aefgh Threenine [th]

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Version 49.alpha.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- meson: Change x11-support default value to false
- Disable Xorg session by default
- udev: Drop disable_wayland overrides
- Fix build with gcc 15
- Translation updates

Contributors:
  Zbigniew J=C4=99drzejewski-Szmek, Florian M=C3=BCllner, Jordan Petridis=
,
  Ray Strode, Joan Torres, Adrian Vovk, Alynx Zhou

Translators:
  Antonio Marin [ro], Baxrom Raxmatov [uz], Cheng-Chia Tseng [zh_TW],
  Andi Chandler [en_GB], Peter Mr=C3=A1z [sk], R=C5=ABdolfs Mazurs [lv]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...aca75e16aeafc171751028406b54f5ed8397.patch | 56 -------------------
 .../gdm/{gdm_48.0.bb =3D> gdm_49.2.bb}          | 20 +++++--
 2 files changed, 14 insertions(+), 62 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171=
751028406b54f5ed8397.patch
 rename meta-gnome/recipes-gnome/gdm/{gdm_48.0.bb =3D> gdm_49.2.bb} (80%)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc1717510284=
06b54f5ed8397.patch b/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc1=
71751028406b54f5ed8397.patch
deleted file mode 100644
index 8363a7f41d..0000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5=
ed8397.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2fbc2ac50b9f143eb594e5f77a8051222ffbd2c9 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D <zbyszek@=
in.waw.pl>
-Date: Mon, 27 Jan 2025 14:01:23 +0100
-Subject: [PATCH] gdm-settings-utils: rename variable to fix build with g=
cc 15
-
-In GNU23 C, bool is a keyword. Rename the variable to avoid syntax error=
.
----
- common/gdm-settings-utils.c | 8 ++++----
- common/gdm-settings-utils.h | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-=20
- Signed-off-by: Markus Volk <f_l_k@t-online.de>
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gdm/-/commit/a=
3e0aca75e16aeafc171751028406b54f5ed8397.patch]
-
-diff --git a/common/gdm-settings-utils.c b/common/gdm-settings-utils.c
-index 636be3a9e..da4c7aefb 100644
---- a/common/gdm-settings-utils.c
-+++ b/common/gdm-settings-utils.c
-@@ -287,16 +287,16 @@ gdm_settings_parse_boolean_as_value  (gboolean boo=
lval)
- /* adapted from GKeyFile */
- gboolean
- gdm_settings_parse_value_as_boolean (const char *value,
--                                     gboolean   *bool)
-+                                     gboolean   *boolval)
- {
-         g_return_val_if_fail (value !=3D NULL, FALSE);
--        g_return_val_if_fail (bool !=3D NULL, FALSE);
-+        g_return_val_if_fail (boolval !=3D NULL, FALSE);
-=20
-         if (g_ascii_strcasecmp (value, "true") =3D=3D 0 || strcmp (valu=
e, "1") =3D=3D 0) {
--                *bool =3D TRUE;
-+                *boolval =3D TRUE;
-                 return TRUE;
-         } else if (g_ascii_strcasecmp (value, "false") =3D=3D 0 || strc=
mp (value, "0") =3D=3D 0) {
--                *bool =3D FALSE;
-+                *boolval =3D FALSE;
-                 return TRUE;
-         } else {
-                 return FALSE;
-diff --git a/common/gdm-settings-utils.h b/common/gdm-settings-utils.h
-index 4f2362ce7..734d625c7 100644
---- a/common/gdm-settings-utils.h
-+++ b/common/gdm-settings-utils.h
-@@ -44,7 +44,7 @@ gboolean                  gdm_settings_parse_schemas  =
         (const char  *fil
-                                                                 GSList =
    **list);
-=20
- gboolean                  gdm_settings_parse_value_as_boolean  (const c=
har *value,
--                                                                gboolea=
n   *bool);
-+                                                                gboolea=
n   *boolval);
- gboolean                  gdm_settings_parse_value_as_integer  (const c=
har *value,
-                                                                 int    =
    *intval);
- gboolean                  gdm_settings_parse_value_as_double   (const c=
har *value,
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_49.2.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
index 92ddc143f6..e1f3c488a8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
@@ -5,33 +5,41 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
 DEPENDS =3D " \
     accountsservice \
     audit \
+    dconf \
     dconf-native \
-    gtk+3 \
+    gtk4 \
     json-glib \
     keyutils \
     libcanberra \
     libgudev \
     libpam \
-    xserver-xorg \
 "
=20
-REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit gobject-introspecti=
on-data"
+REQUIRED_DISTRO_FEATURES =3D "systemd pam polkit gobject-introspection-d=
ata"
 GIR_MESON_OPTION =3D ""
=20
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext syst=
emd useradd itstool gnome-help features_check
=20
-SRC_URI +=3D "file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"
-SRC_URI[archive.sha256sum] =3D "1bc06daff093ec7b5e37ecb4f92e5da3474a1b1b=
a076edb9151ee967d1c30adf"
+SRC_URI[archive.sha256sum] =3D "9813631f9f5f0f860ea14a437866e60efc7bed30=
23b7c3b765cc5de1de597a06"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,=
plymouth"
+PACKAGECONFIG[x11] =3D "-Dx11-support=3Dtrue,-Dx11-support=3Dfalse,xau"
=20
 EXTRA_OEMESON =3D " \
     -Ddefault-pam-config=3Dopenembedded \
     -Dpam-mod-dir=3D${base_libdir}/security \
+    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
 "
=20
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+nologin =3D '${sbindir}/nologin'
+EOF
+}
+
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.c
     sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.h
--=20
2.52.0


