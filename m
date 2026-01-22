Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4961D3EE86
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:45:20 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40534.1769096715950072155
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:45:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id AF22E1CE9C;
	Thu, 22 Jan 2026 16:45:13 +0100 (CET)
Received: from [192.168.178.36] ([84.154.161.253]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwrw-11dAfo0; Thu, 22 Jan 2026 16:45:12 +0100
Date: Thu, 22 Jan 2026 16:45:06 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCH 01/11] mutter: update 48.5 -> 48.7
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Message-Id: <6RV99T.MF41X3453EXX2@t-online.de>
In-Reply-To: <188D1804EEE34AC4.2979268@lists.openembedded.org>
References: <188D1804EEE34AC4.2979268@lists.openembedded.org>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-ctYhhYgKTd+Uw3X3iZrv"
X-TOI-EXPURGATEID: 150726::1769096712-FF7FD939-539E65FC/0/0 CLEAN NORMAL
X-TOI-MSGID: f41757c1-5481-4688-8170-e00b4a7972ff
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123751

--=-ctYhhYgKTd+Uw3X3iZrv
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

This patchset allows me to build gnome-shell without x11

On Thu, Jan 22 2026 at 16:43:24 +01:00:00, Markus Volk via=20
lists.openembedded.org <f_l_k=3Dt-online.de@lists.openembedded.org> wrote:
> 48.7
> =3D=3D=3D=3D
> * Still constrain fullscreen wayland windows with size limits [Jonas=20
> =C5.;
>   !4587]
>   * Fixed crashes [Jonas, Marco; !4643, !4705]
>=20
>   Contributors:
>     Marco Trevisan, Jonas =C5dahl
>=20
> 48.6
>     =3D=3D=3D=3D
> * Fix DND actions not working reliably in some X11 clients [Jonas;
>   #4288]
>   * Fix presentation timings with commit-timing-v1 [Mario; !4645]
>   * Fixed crashes [Sebastian, Milan; !4682, !4592]
>   * Misc. bug fixes and cleanups [Carlos, Raihan; !4697, !4688]
>=20
>   Contributors:
>     Raihan Ahamed, Milan Crha, Carlos Garnacho, Sebastian Keller,
>     Mario Kleiner, Jonas =C5dahl
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../recipes-gnome/mutter/{mutter_48.5.bb =3D> mutter_48.7.bb}  | 5=20
> +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>  rename meta-gnome/recipes-gnome/mutter/{mutter_48.5.bb =3D>=20
> mutter_48.7.bb} (95%)
>=20
> diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb=20
> b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> similarity index 95%
> rename from meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
> rename to meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> index ce7f44947e..0dbdb4b31a 100644
> --- a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
> +++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
> @@ -27,9 +27,8 @@ DEPENDS =3D " \
>=20
>  inherit gnomebase gsettings gobject-introspection gettext=20
> features_check
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "02ed0ab4194fc537540f9ee92acbf5af8209971a404df319c1cb7763294ae58b"
> -
>  SRC_URI +=3D "file://0001-Dont-use-system-sysprof-dbus-folder.patch"=20
> <file://0001-dont-use-system-sysprof-dbus-folder.patch/>
> +SRC_URI[archive.sha256sum] =3D=20
> "ec102aa3cbb0e39001206627aca3055314555f70609de5e6c2b7efcd1fa90f20"
>=20
>  # x11 is still manadatory - see meson.build
>  REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
> @@ -43,7 +42,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
>  PACKAGECONFIG ??=3D " \
>      native-backend \
>      ${@bb.utils.contains=20
> <mailto:${@bb.utils.contains>('DISTRO_FEATURES', 'opengl x11',=20
> 'opengl glx', '', d)} \
> -    sm \
>      startup-notification \
>      gnome-desktop \
>  "
> @@ -61,7 +59,6 @@ PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue,=20
> -Dlibwacom=3Dfalse, libwacom"
>  # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
>  PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue,=20
> -Dremote_desktop=3Dfalse, pipewire"
>  PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue,=20
> -Dlibgnome_desktop=3Dfalse, gnome-desktop gnome-settings-daemon"
> -PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm"
>  PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue,=20
> -Dsound_player=3Dfalse, libcanberra"
>  PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,syspro=
f"
>  PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue,=20
> -Dstartup_notification=3Dfalse, startup-notification,=20
> startup-notification"
> --
> 2.52.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123747):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/123747>
> Mute This Topic: <https://lists.openembedded.org/mt/117401787/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-ctYhhYgKTd+Uw3X3iZrv
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>This patchset allows me to build g=
nome-shell without x11</div></div><div id=3D"geary-quote" dir=3D"auto"><br>=
On Thu, Jan 22 2026 at 16:43:24 +01:00:00, Markus Volk via lists.openembedd=
ed.org &lt;f_l_k=3Dt-online.de@lists.openembedded.org&gt; wrote:<br><blockq=
uote type=3D"cite"><div class=3D"plaintext" style=3D"white-space: break-spa=
ces;">48.7
=3D=3D=3D=3D
* Still constrain fullscreen wayland windows with size limits [Jonas =C5.;
  !4587]
  * Fixed crashes [Jonas, Marco; !4643, !4705]

  Contributors:
    Marco Trevisan, Jonas =C5dahl

48.6
    =3D=3D=3D=3D
* Fix DND actions not working reliably in some X11 clients [Jonas;
  #4288]
  * Fix presentation timings with commit-timing-v1 [Mario; !4645]
  * Fixed crashes [Sebastian, Milan; !4682, !4592]
  * Misc. bug fixes and cleanups [Carlos, Raihan; !4697, !4688]

  Contributors:
    Raihan Ahamed, Milan Crha, Carlos Garnacho, Sebastian Keller,
    Mario Kleiner, Jonas =C5dahl

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 .../recipes-gnome/mutter/{mutter_48.5.bb =3D&gt; mutter_48.7.bb}  | 5 +---=
-
 1 file changed, 1 insertion(+), 4 deletions(-)
 rename meta-gnome/recipes-gnome/mutter/{mutter_48.5.bb =3D&gt; mutter_48.7=
.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb b/meta-gnome/re=
cipes-gnome/mutter/mutter_48.7.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
rename to meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
index ce7f44947e..0dbdb4b31a 100644
--- a/meta-gnome/recipes-gnome/mutter/mutter_48.5.bb
+++ b/meta-gnome/recipes-gnome/mutter/mutter_48.7.bb
@@ -27,9 +27,8 @@ DEPENDS =3D " \
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check
=20
-SRC_URI[archive.sha256sum] =3D "02ed0ab4194fc537540f9ee92acbf5af8209971a40=
4df319c1cb7763294ae58b"
-
 SRC_URI +=3D "<a href=3D"file://0001-Dont-use-system-sysprof-dbus-folder.p=
atch" "=3D"">file://0001-Dont-use-system-sysprof-dbus-folder.patch"</a>
+SRC_URI[archive.sha256sum] =3D "ec102aa3cbb0e39001206627aca3055314555f7060=
9de5e6c2b7efcd1fa90f20"
=20
 # x11 is still manadatory - see meson.build
 REQUIRED_DISTRO_FEATURES =3D "wayland x11 polkit"
@@ -43,7 +42,6 @@ REQUIRED_DISTRO_FEATURES +=3D "systemd"
 PACKAGECONFIG ??=3D " \
     native-backend \
     <a href=3D"mailto:${@bb.utils.contains">${@bb.utils.contains</a>('DIST=
RO_FEATURES', 'opengl x11', 'opengl glx', '', d)} \
-    sm \
     startup-notification \
     gnome-desktop \
 "
@@ -61,7 +59,6 @@ PACKAGECONFIG[libwacom] =3D "-Dlibwacom=3Dtrue, -Dlibwaco=
m=3Dfalse, libwacom"
 # Remove depending on pipewire-0.2 when mutter is upgraded to 3.36+
 PACKAGECONFIG[remote-desktop] =3D "-Dremote_desktop=3Dtrue, -Dremote_deskt=
op=3Dfalse, pipewire"
 PACKAGECONFIG[gnome-desktop] =3D "-Dlibgnome_desktop=3Dtrue, -Dlibgnome_de=
sktop=3Dfalse, gnome-desktop gnome-settings-daemon"
-PACKAGECONFIG[sm] =3D "-Dsm=3Dtrue, -Dsm=3Dfalse, libsm"
 PACKAGECONFIG[sound-player] =3D "-Dsound_player=3Dtrue, -Dsound_player=3Df=
alse, libcanberra"
 PACKAGECONFIG[profiler] =3D "-Dprofiler=3Dtrue,-Dprofiler=3Dfalse,sysprof"
 PACKAGECONFIG[startup-notification] =3D "-Dstartup_notification=3Dtrue, -D=
startup_notification=3Dfalse, startup-notification, startup-notification"
<div>--=20
</div>2.52.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#123747): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/123747">https://lists.openembedded.org/g/openembed=
ded-devel/message/123747</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/117401787/361=
8223">https://lists.openembedded.org/mt/117401787/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-ctYhhYgKTd+Uw3X3iZrv--


