Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649D2D44C67
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 15:06:44 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37871.1768489594713856649
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 07:06:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id BB463C41;
	Thu, 15 Jan 2026 16:06:32 +0100 (CET)
Received: from [192.168.178.36] ([84.154.167.202]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgOvg-01A2oS0; Thu, 15 Jan 2026 16:06:32 +0100
Date: Thu, 15 Jan 2026 16:06:26 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 3/3] gdm: update 48.0 -> 49.2
To: "Khem Raj via lists.openembedded.org"
	<raj.khem=gmail.com@lists.openembedded.org>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <QAVW8T.2XMJF8AILQXS1@t-online.de>
In-Reply-To: <188AEFD76E637850.3093368@lists.openembedded.org>
References: <20260115150459.17491-1-f_l_k@t-online.de>
	<188AEFD76E637850.3093368@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-Xj6jHg8PAbEjrkYlQabv"
X-TOI-EXPURGATEID: 150726::1768489592-D5FF8BB2-D2B186C3/0/0 CLEAN NORMAL
X-TOI-MSGID: 85c82d8b-6a2a-4df9-b775-ed5633527e3d
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 15:06:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123511

--=-Xj6jHg8PAbEjrkYlQabv
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

These three recipes must be updated as a bundle, otherwise runtime will=20
break.

On Thu, Jan 15 2026 at 16:04:59 +01:00:00, Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> - build x11 support depending on DISTRO_FEATURES
> - add runtime path for nologin to fix reproducibility
> - remove backport patch
> - use gtk4
>=20
> 49.2
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Translation updates
> * Fixed bug that prevented X11 fallback whenever autologin fails
> * Introduced CI tests built around GNOME OS
>=20
> 49.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Translation updates
> * Hotfixed a bug that leaves gnome-shell in a locked up state
> * Fixed implementation of userdb, so we don't list our users when=20
> asked about
>   UID 0 (root)
> * Switched safety check that avoids accidentally deleting / and /home=20
> from an
>   assertion to an error, so the check always runs even in production=20
> builds
> * Fixed bug where gnome-initial-setup's configuration (i.e. input=20
> methods)
>   failed to migrate to the final user session
> * Fixed bug where GDM assumed that Wayland is unavailable if Xwayland=20
> wasn't
>   installed on the system
>=20
> 49.0.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Follow-up for permissions issue fix, making the fix work in more=20
> environments
>=20
> 49.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Translation updates
> * Fix build failures when built without plymouth support
> * Fix permissions issue on the GDM work dir (/var/lib/gdm) that broke=20
> settings
>   persistence
>=20
> 49.rc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Translation updates
> * Fixed a bug in PAM config files, introduced by transition to=20
> dynamic users
> * Added logic to retry preferred display server (usually Wayland)=20
> before falling
>   back (usually to X11)
> * Fixed a bug where Plymouth keeps running if not display is plugged=20
> into the
>   system. This would prevent bootup from completing and would prevent=20
> the user
>   from logging in on a serial console
> * Fixed GDM's session file loading logic to search directories in=20
> correct
>   precedence order
> * Fix simpledrm device detection to match the kernel's new device=20
> naming scheme
> * Re-enabled X11 support by default. We found it difficult to cleanly=20
> separate
>   GDM's ability to launch modern X11 sessions (which we intended to=20
> keep enabled
>   in GNOME 49) from the rest of GDM's X11 integration (which we=20
> intended to
>   disable but leave intact for GNOME 49). We still plan to remove=20
> GDM's full
>   X11 integration in a future version, and leave only the ability to=20
> launch
>   modern X11 sessions.
> * Worked around a regression introduced by the switch to dynamic=20
> users, where
>   the login screen no longer persists any settings
>=20
> 49.beta
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Translation updates
> * Switch to using dynamic users for greeter sessions. This enables=20
> systemd-based
>   session management on the greeter, removes GDM's dependency on=20
> dbus-daemon,
>   and frees us to drop gnome-session's builtin service manager.
> * Adapt to changes in gnome-session 49, which dropped the builtin=20
> service manager
>   code and now exclusively relies on systemd for session startup.=20
> This means that
>   GDM now depends on gnome-session 49.
>=20
> 49.alpha.1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> * Drop dependency on Wacom g-s-d plugin  [Jordan; !301]
> * Drop leftover udev rules  [Alessandro; !299]
> * Fix warning when building without libxdmcp support  [Florian; !300]
> * Add polkit rules to allow access to smartcards [David, !287]
> * Misc [Joan; !298]
>=20
> Contributors:
>   Alessandro Astone, David H=C3=A4rdeman, Joan Torres L=C3=B3pez,
>   Florian M=C3=BCllner, Jordan Petridis
>=20
> Translators:
>   Takayuki Kusano [ja], Aefgh Threenine [th]
>=20
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Version 49.alpha.0
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> - meson: Change x11-support default value to false
> - Disable Xorg session by default
> - udev: Drop disable_wayland overrides
> - Fix build with gcc 15
> - Translation updates
>=20
> Contributors:
>   Zbigniew J=C4=99drzejewski-Szmek, Florian M=C3=BCllner, Jordan Petridis=
,
>   Ray Strode, Joan Torres, Adrian Vovk, Alynx Zhou
>=20
> Translators:
>   Antonio Marin [ro], Baxrom Raxmatov [uz], Cheng-Chia Tseng [zh_TW],
>   Andi Chandler [en_GB], Peter Mr=C3=A1z [sk], R=C5=ABdolfs Mazurs [lv]
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...aca75e16aeafc171751028406b54f5ed8397.patch | 56=20
> -------------------
>  .../gdm/{gdm_48.0.bb =3D> gdm_49.2.bb}          | 20 +++++--
>  2 files changed, 14 insertions(+), 62 deletions(-)
>  delete mode 100644=20
> meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5ed8397=
.patch
>  rename meta-gnome/recipes-gnome/gdm/{gdm_48.0.bb =3D> gdm_49.2.bb}=20
> (80%)
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5ed83=
97.patch=20
> b/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5ed83=
97.patch
> deleted file mode 100644
> index 8363a7f41d..0000000000
> ---=20
> a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5ed83=
97.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 2fbc2ac50b9f143eb594e5f77a8051222ffbd2c9 Mon Sep 17 00:00:00=20
> 2001
> -From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D=20
> <zbyszek@in.waw.pl <mailto:zbyszek@in.waw.pl>>
> -Date: Mon, 27 Jan 2025 14:01:23 +0100
> -Subject: [PATCH] gdm-settings-utils: rename variable to fix build=20
> with gcc 15
> -
> -In GNU23 C, bool is a keyword. Rename the variable to avoid syntax=20
> error.
> ----
> - common/gdm-settings-utils.c | 8 ++++----
> - common/gdm-settings-utils.h | 2 +-
> - 2 files changed, 5 insertions(+), 5 deletions(-)
> -
> - Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> -
> -Upstream-Status: Backport=20
> [<https://gitlab.gnome.org/GNOME/gdm/-/commit/a3e0aca75e16aeafc1717510284=
06b54f5ed8397.patch>]
> -
> -diff --git a/common/gdm-settings-utils.c=20
> b/common/gdm-settings-utils.c
> -index 636be3a9e..da4c7aefb 100644
> ---- a/common/gdm-settings-utils.c
> -+++ b/common/gdm-settings-utils.c
> -@@ -287,16 +287,16 @@ gdm_settings_parse_boolean_as_value  (gboolean=20
> boolval)
> - /* adapted from GKeyFile */
> - gboolean
> - gdm_settings_parse_value_as_boolean (const char *value,
> --                                     gboolean   *bool)
> -+                                     gboolean   *boolval)
> - {
> -         g_return_val_if_fail (value !=3D NULL, FALSE);
> --        g_return_val_if_fail (bool !=3D NULL, FALSE);
> -+        g_return_val_if_fail (boolval !=3D NULL, FALSE);
> -
> -         if (g_ascii_strcasecmp (value, "true") =3D=3D 0 || strcmp=20
> (value, "1") =3D=3D 0) {
> --                *bool =3D TRUE;
> -+                *boolval =3D TRUE;
> -                 return TRUE;
> -         } else if (g_ascii_strcasecmp (value, "false") =3D=3D 0 ||=20
> strcmp (value, "0") =3D=3D 0) {
> --                *bool =3D FALSE;
> -+                *boolval =3D FALSE;
> -                 return TRUE;
> -         } else {
> -                 return FALSE;
> -diff --git a/common/gdm-settings-utils.h=20
> b/common/gdm-settings-utils.h
> -index 4f2362ce7..734d625c7 100644
> ---- a/common/gdm-settings-utils.h
> -+++ b/common/gdm-settings-utils.h
> -@@ -44,7 +44,7 @@ gboolean                 =20
> gdm_settings_parse_schemas           (const char  *fil
> -                                                                =20
> GSList     **list);
> -
> - gboolean                  gdm_settings_parse_value_as_boolean =20
> (const char *value,
> --                                                               =20
> gboolean   *bool);
> -+                                                               =20
> gboolean   *boolval);
> - gboolean                  gdm_settings_parse_value_as_integer =20
> (const char *value,
> -                                                                 int=20
>        *intval);
> - gboolean                  gdm_settings_parse_value_as_double  =20
> (const char *value,
> ---
> -GitLab
> -
> diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb=20
> b/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
> similarity index 80%
> rename from meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
> rename to meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
> index 92ddc143f6..e1f3c488a8 100644
> --- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
> +++ b/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
> @@ -5,33 +5,41 @@ LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>  DEPENDS =3D " \
>      accountsservice \
>      audit \
> +    dconf \
>      dconf-native \
> -    gtk+3 \
> +    gtk4 \
>      json-glib \
>      keyutils \
>      libcanberra \
>      libgudev \
>      libpam \
> -    xserver-xorg \
>  "
>=20
> -REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit=20
> gobject-introspection-data"
> +REQUIRED_DISTRO_FEATURES =3D "systemd pam polkit=20
> gobject-introspection-data"
>  GIR_MESON_OPTION =3D ""
>=20
>=20
>  inherit gnomebase gsettings pkgconfig gobject-introspection gettext=20
> systemd useradd itstool gnome-help features_check
>=20
> -SRC_URI +=3D "file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"=20
> <file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch/>
> -SRC_URI[archive.sha256sum] =3D=20
> "1bc06daff093ec7b5e37ecb4f92e5da3474a1b1ba076edb9151ee967d1c30adf"
> +SRC_URI[archive.sha256sum] =3D=20
> "9813631f9f5f0f860ea14a437866e60efc7bed3023b7c3b765cc5de1de597a06"
>=20
> -PACKAGECONFIG ??=3D ""
> +PACKAGECONFIG ??=3D "${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'x11', d)}"
>  PACKAGECONFIG[plymouth] =3D=20
> "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,plymouth"
> +PACKAGECONFIG[x11] =3D "-Dx11-support=3Dtrue,-Dx11-support=3Dfalse,xau"
>=20
>  EXTRA_OEMESON =3D " \
>      -Ddefault-pam-config=3Dopenembedded \
>      -Dpam-mod-dir=3D${base_libdir}/security \
> +    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
>  "
>=20
> +do_write_config:append() {
> +    cat >${WORKDIR}/meson-${PN}.cross <<EOF
> +[binaries]
> +nologin =3D '${sbindir}/nologin'
> +EOF
> +}
> +
>  do_install:prepend() {
>      sed -i -e 's|${B}/||g'=20
> ${B}/daemon/gdm-session-worker-enum-types.c
>      sed -i -e 's|${B}/||g'=20
> ${B}/daemon/gdm-session-worker-enum-types.h
> --
> 2.52.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123509):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/123509>
> Mute This Topic: <https://lists.openembedded.org/mt/117280466/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-Xj6jHg8PAbEjrkYlQabv
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>These three recipes must be update=
d as a bundle, otherwise runtime will break.</div></div><div id=3D"geary-qu=
ote" dir=3D"auto"><br>On Thu, Jan 15 2026 at 16:04:59 +01:00:00, Markus Vol=
k via lists.openembedded.org &lt;f_l_k=3Dt-online.de@lists.openembedded.org=
&gt; wrote:<br><blockquote type=3D"cite"><div class=3D"plaintext" style=3D"=
white-space: break-spaces;">- build x11 support depending on DISTRO_FEATURE=
S
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
* Fixed implementation of userdb, so we don't list our users when asked abo=
ut
  UID 0 (root)
* Switched safety check that avoids accidentally deleting / and /home from =
an
  assertion to an error, so the check always runs even in production builds
* Fixed bug where gnome-initial-setup's configuration (i.e. input methods)
  failed to migrate to the final user session
* Fixed bug where GDM assumed that Wayland is unavailable if Xwayland wasn'=
t
  installed on the system

49.0.1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Follow-up for permissions issue fix, making the fix work in more environm=
ents

49.0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Fix build failures when built without plymouth support
* Fix permissions issue on the GDM work dir (/var/lib/gdm) that broke setti=
ngs
  persistence

49.rc
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Fixed a bug in PAM config files, introduced by transition to dynamic user=
s
* Added logic to retry preferred display server (usually Wayland) before fa=
lling
  back (usually to X11)
* Fixed a bug where Plymouth keeps running if not display is plugged into t=
he
  system. This would prevent bootup from completing and would prevent the u=
ser
  from logging in on a serial console
* Fixed GDM's session file loading logic to search directories in correct
  precedence order
* Fix simpledrm device detection to match the kernel's new device naming sc=
heme
* Re-enabled X11 support by default. We found it difficult to cleanly separ=
ate
  GDM's ability to launch modern X11 sessions (which we intended to keep en=
abled
  in GNOME 49) from the rest of GDM's X11 integration (which we intended to
  disable but leave intact for GNOME 49). We still plan to remove GDM's ful=
l
  X11 integration in a future version, and leave only the ability to launch
  modern X11 sessions.
* Worked around a regression introduced by the switch to dynamic users, whe=
re
  the login screen no longer persists any settings

49.beta
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

* Translation updates
* Switch to using dynamic users for greeter sessions. This enables systemd-=
based
  session management on the greeter, removes GDM's dependency on dbus-daemo=
n,
  and frees us to drop gnome-session's builtin service manager.
* Adapt to changes in gnome-session 49, which dropped the builtin service m=
anager
  code and now exclusively relies on systemd for session startup. This mean=
s that
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
  Zbigniew J=C4=99drzejewski-Szmek, Florian M=C3=BCllner, Jordan Petridis,
  Ray Strode, Joan Torres, Adrian Vovk, Alynx Zhou

Translators:
  Antonio Marin [ro], Baxrom Raxmatov [uz], Cheng-Chia Tseng [zh_TW],
  Andi Chandler [en_GB], Peter Mr=C3=A1z [sk], R=C5=ABdolfs Mazurs [lv]

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...aca75e16aeafc171751028406b54f5ed8397.patch | 56 -------------------
 .../gdm/{gdm_48.0.bb =3D&gt; gdm_49.2.bb}          | 20 +++++--
 2 files changed, 14 insertions(+), 62 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc17175=
1028406b54f5ed8397.patch
 rename meta-gnome/recipes-gnome/gdm/{gdm_48.0.bb =3D&gt; gdm_49.2.bb} (80%=
)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406=
b54f5ed8397.patch b/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc17175=
1028406b54f5ed8397.patch
deleted file mode 100644
index 8363a7f41d..0000000000
--- a/meta-gnome/recipes-gnome/gdm/gdm/a3e0aca75e16aeafc171751028406b54f5ed=
8397.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 2fbc2ac50b9f143eb594e5f77a8051222ffbd2c9 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Zbigniew=3D20J=3DC4=3D99drzejewski-Szmek?=3D &lt;<a href=
=3D"mailto:zbyszek@in.waw.pl">zbyszek@in.waw.pl</a>&gt;
-Date: Mon, 27 Jan 2025 14:01:23 +0100
-Subject: [PATCH] gdm-settings-utils: rename variable to fix build with gcc=
 15
-
-In GNU23 C, bool is a keyword. Rename the variable to avoid syntax error.
----
- common/gdm-settings-utils.c | 8 ++++----
- common/gdm-settings-utils.h | 2 +-
- 2 files changed, 5 insertions(+), 5 deletions(-)
-=20
- Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k=
@t-online.de</a>&gt;
-
-Upstream-Status: Backport [<a href=3D"https://gitlab.gnome.org/GNOME/gdm/-=
/commit/a3e0aca75e16aeafc171751028406b54f5ed8397.patch">https://gitlab.gnom=
e.org/GNOME/gdm/-/commit/a3e0aca75e16aeafc171751028406b54f5ed8397.patch</a>=
]
-
-diff --git a/common/gdm-settings-utils.c b/common/gdm-settings-utils.c
-index 636be3a9e..da4c7aefb 100644
---- a/common/gdm-settings-utils.c
-+++ b/common/gdm-settings-utils.c
-@@ -287,16 +287,16 @@ gdm_settings_parse_boolean_as_value  (gboolean boolv=
al)
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
-         if (g_ascii_strcasecmp (value, "true") =3D=3D 0 || strcmp (value,=
 "1") =3D=3D 0) {
--                *bool =3D TRUE;
-+                *boolval =3D TRUE;
-                 return TRUE;
-         } else if (g_ascii_strcasecmp (value, "false") =3D=3D 0 || strcmp=
 (value, "0") =3D=3D 0) {
--                *bool =3D FALSE;
-+                *boolval =3D FALSE;
-                 return TRUE;
-         } else {
-                 return FALSE;
-diff --git a/common/gdm-settings-utils.h b/common/gdm-settings-utils.h
-index 4f2362ce7..734d625c7 100644
---- a/common/gdm-settings-utils.h
-+++ b/common/gdm-settings-utils.h
-@@ -44,7 +44,7 @@ gboolean                  gdm_settings_parse_schemas    =
       (const char  *fil
-                                                                 GSList   =
  **list);
-=20
- gboolean                  gdm_settings_parse_value_as_boolean  (const cha=
r *value,
--                                                                gboolean =
  *bool);
-+                                                                gboolean =
  *boolval);
- gboolean                  gdm_settings_parse_value_as_integer  (const cha=
r *value,
-                                                                 int      =
  *intval);
- gboolean                  gdm_settings_parse_value_as_double   (const cha=
r *value,
---=20
-GitLab
-
diff --git a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb b/meta-gnome/recipes-=
gnome/gdm/gdm_49.2.bb
similarity index 80%
rename from meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
rename to meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
index 92ddc143f6..e1f3c488a8 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_48.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_49.2.bb
@@ -5,33 +5,41 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
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
-REQUIRED_DISTRO_FEATURES =3D "x11 systemd pam polkit gobject-introspection=
-data"
+REQUIRED_DISTRO_FEATURES =3D "systemd pam polkit gobject-introspection-dat=
a"
 GIR_MESON_OPTION =3D ""
=20
=20
 inherit gnomebase gsettings pkgconfig gobject-introspection gettext system=
d useradd itstool gnome-help features_check
=20
-SRC_URI +=3D "<a href=3D"file://a3e0aca75e16aeafc171751028406b54f5ed8397.p=
atch" "=3D"">file://a3e0aca75e16aeafc171751028406b54f5ed8397.patch"</a>
-SRC_URI[archive.sha256sum] =3D "1bc06daff093ec7b5e37ecb4f92e5da3474a1b1ba0=
76edb9151ee967d1c30adf"
+SRC_URI[archive.sha256sum] =3D "9813631f9f5f0f860ea14a437866e60efc7bed3023=
b7c3b765cc5de1de597a06"
=20
-PACKAGECONFIG ??=3D ""
+PACKAGECONFIG ??=3D "<a href=3D"mailto:${@bb.utils.filter">${@bb.utils.fil=
ter</a>('DISTRO_FEATURES', 'x11', d)}"
 PACKAGECONFIG[plymouth] =3D "-Dplymouth=3Denabled,-Dplymouth=3Ddisabled,pl=
ymouth"
+PACKAGECONFIG[x11] =3D "-Dx11-support=3Dtrue,-Dx11-support=3Dfalse,xau"
=20
 EXTRA_OEMESON =3D " \
     -Ddefault-pam-config=3Dopenembedded \
     -Dpam-mod-dir=3D${base_libdir}/security \
+    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
 "
=20
+do_write_config:append() {
+    cat &gt;${WORKDIR}/meson-${PN}.cross &lt;&lt;EOF
+[binaries]
+nologin =3D '${sbindir}/nologin'
+EOF
+}
+
 do_install:prepend() {
     sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.c
     sed -i -e 's|${B}/||g' ${B}/daemon/gdm-session-worker-enum-types.h
<div>--=20
</div>2.52.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123509): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123509">https://lists.openembedded.org/g/openembed=
ded-devel/message/123509</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117280466/361=
8223">https://lists.openembedded.org/mt/117280466/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-Xj6jHg8PAbEjrkYlQabv--


