Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B8BECD3420
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 22:55:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.5539.1695077734504320899
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 15:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout04.t-online.de (Postfix) with SMTP id C713218CE1;
	Tue, 19 Sep 2023 00:55:31 +0200 (CEST)
Received: from [192.168.178.62] ([84.154.161.214]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiN9I-30O8Ke0; Tue, 19 Sep 2023 00:55:24 +0200
Date: Tue, 19 Sep 2023 00:55:30 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-control-center: upgrade 44.3 ->
 45.0
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Message-Id: <ICE71S.VMW0OKNUBX6N1@t-online.de>
In-Reply-To: <1786201CF8D1D805.29813@lists.openembedded.org>
References: <1786201CF8D1D805.29813@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-mO9+6EmaItUu+XLGthi3"
X-TOI-EXPURGATEID: 150726::1695077724-109A9C62-24A8FB0C/0/0 CLEAN NORMAL
X-TOI-MSGID: 20b16135-03d9-4d9f-858a-ecd17e1ae6a9
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 22:55:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104948

--=-mO9+6EmaItUu+XLGthi3
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

v2 also adds a runtime dependency on tecla because it is not=20
automatically installed

On Tue, Sep 19 2023 at 12:53:18 AM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  .../0001-Add-meson-option-to-pass-sysroot.patch  | 16=20
> ++++++++--------
>  ...nter_44.3.bb =3D> gnome-control-center_45.0.bb} | 10 +++++-----
>  2 files changed, 13 insertions(+), 13 deletions(-)
>  rename=20
> meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_44.3.=
bb=20
> =3D> gnome-control-center_45.0.bb} (87%)
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch
> index 5c0eee576..7cd7c0469 100644
> ---=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch
> +++=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch
> @@ -19,7 +19,7 @@ Signed-off-by: Andreas M=FCller=20
> <schnitzeltony@gmail.com>
>   2 files changed, 2 insertions(+), 1 deletion(-)
>=20
>  diff --git a/meson_options.txt b/meson_options.txt
> -index dbca723..af0f871 100644
> +index 8ee7b6e0e..7e6adc668 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
>  @@ -1,3 +1,4 @@
> @@ -28,28 +28,28 @@ index dbca723..af0f871 100644
>   option('ibus', type: 'boolean', value: true, description: 'build=20
> with IBus support')
>   option('privileged_group', type: 'string', value: 'wheel',=20
> description: 'name of group that has elevated permissions')
>  diff --git a/panels/background/meson.build=20
> b/panels/background/meson.build
> -index 69af0cfea..6edcaa5ff 100644
> +index 9bf543538..97f1e0117 100644
>  --- a/panels/background/meson.build
>  +++ b/panels/background/meson.build
>  @@ -19,7 +19,7 @@ common_sources =3D []
>=20
>   enums =3D 'gdesktop-enums-types'
>   enums_header =3D files(
> --  gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -+  get_option('oe_sysroot') +=20
> gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> +-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> ++  get_option('oe_sysroot') +=20
> gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
>     'cc-background-item.h'
>   )
>=20
>  diff --git a/panels/datetime/meson.build=20
> b/panels/datetime/meson.build
> -index 3b6f5e197..30b207882 100644
> +index 8cb3b63f0..8c5a45e7c 100644
>  --- a/panels/datetime/meson.build
>  +++ b/panels/datetime/meson.build
> -@@ -45,7 +45,7 @@ sources =3D files(
> +@@ -37,7 +37,7 @@ sources =3D files(
>=20
>   enums =3D 'gdesktop-enums-types'
>   enums_header =3D files(
> --  gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -+  get_option('oe_sysroot') +=20
> gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> +-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> ++  get_option('oe_sysroot') +=20
> gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
>     'cc-datetime-panel.h'
>   )
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_44.3=
.bb=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.0=
.bb
> similarity index 87%
> rename from=20
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_44.3.b=
b
> rename to=20
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.0.b=
b
> index 0066f5885..1122ee5ea 100644
> ---=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_44.3=
.bb
> +++=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45.0=
.bb
> @@ -28,6 +28,8 @@ DEPENDS =3D " \
>      polkit \
>      pulseaudio \
>      samba \
> +    setxkbmap-native \
> +    tecla \
>      udisks2 \
>      upower \
>  "
> @@ -37,16 +39,14 @@ inherit gtk-icon-cache pkgconfig gnomebase=20
> gsettings gettext upstream-version-is
>  REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
>=20
>  SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"=20
> <file://0001-add-meson-option-to-pass-sysroot.patch/>
> -SRC_URI[archive.sha256sum] =3D=20
> "066a65052fc3ecfae860025e85f797e6ab2b87a58c4f8ab9c66ec20718a80c7a"
> +SRC_URI[archive.sha256sum] =3D=20
> "83df6a90f98914f2c19a872ce06562acef40927637f679c383099265ccfa42cf"
>=20
>  PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[cups] =3D ",,cups,cups"
>  PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
>  PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
>=20
> -EXTRA_OEMESON =3D " \
> -    -Doe_sysroot=3D${STAGING_DIR_HOST} \
> -"
> +EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
>=20
>  USERADD_PACKAGES =3D "${PN}"
>  USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group=20
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> @@ -66,4 +66,4 @@ FILES:${PN} +=3D " \
>=20
>  FILES:${PN}-dev +=3D "${datadir}/gettext"
>=20
> -RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
> +RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla"
> --
> 2.42.0
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#104947):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/104947>
> Mute This Topic: <https://lists.openembedded.org/mt/101445277/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-mO9+6EmaItUu+XLGthi3
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v2 also adds a runtime dependency =
on tecla because it is not automatically installed</div></div><div id=3D"ge=
ary-quote" dir=3D"auto"><br>On Tue, Sep 19 2023 at 12:53:18 AM +02:00:00, M=
arkus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"cite"><d=
iv class=3D"plaintext" style=3D"white-space: break-spaces;">Signed-off-by: =
Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>&=
gt;
---
 .../0001-Add-meson-option-to-pass-sysroot.patch  | 16 ++++++++--------
 ...nter_44.3.bb =3D&gt; gnome-control-center_45.0.bb} | 10 +++++-----
 2 files changed, 13 insertions(+), 13 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center=
_44.3.bb =3D&gt; gnome-control-center_45.0.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-ce=
nter/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gnome=
/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sy=
sroot.patch
index 5c0eee576..7cd7c0469 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/00=
01-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/00=
01-Add-meson-option-to-pass-sysroot.patch
@@ -19,7 +19,7 @@ Signed-off-by: Andreas M=FCller &lt;schnitzeltony@gmail.c=
om&gt;
  2 files changed, 2 insertions(+), 1 deletion(-)
=20
 diff --git a/meson_options.txt b/meson_options.txt
-index dbca723..af0f871 100644
+index 8ee7b6e0e..7e6adc668 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
 @@ -1,3 +1,4 @@
@@ -28,28 +28,28 @@ index dbca723..af0f871 100644
  option('ibus', type: 'boolean', value: true, description: 'build with IBu=
s support')
  option('privileged_group', type: 'string', value: 'wheel', description: '=
name of group that has elevated permissions')
 diff --git a/panels/background/meson.build b/panels/background/meson.build
-index 69af0cfea..6edcaa5ff 100644
+index 9bf543538..97f1e0117 100644
 --- a/panels/background/meson.build
 +++ b/panels/background/meson.build
 @@ -19,7 +19,7 @@ common_sources =3D []
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gset=
tings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variable=
('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/gse=
ttings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconfig=
: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
    'cc-background-item.h'
  )
 =20
 diff --git a/panels/datetime/meson.build b/panels/datetime/meson.build
-index 3b6f5e197..30b207882 100644
+index 8cb3b63f0..8c5a45e7c 100644
 --- a/panels/datetime/meson.build
 +++ b/panels/datetime/meson.build
-@@ -45,7 +45,7 @@ sources =3D files(
+@@ -37,7 +37,7 @@ sources =3D files(
 =20
  enums =3D 'gdesktop-enums-types'
  enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gset=
tings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variable=
('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
+-  gsettings_desktop_dep.get_variable(pkgconfig: 'prefix') + '/include/gse=
ttings-desktop-schemas/gdesktop-enums.h',
++  get_option('oe_sysroot') + gsettings_desktop_dep.get_variable(pkgconfig=
: 'prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
    'cc-datetime-panel.h'
  )
 =20
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-ce=
nter_44.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.0.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_44.3.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cente=
r_45.0.bb
index 0066f5885..1122ee5ea 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_44=
.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_45=
.0.bb
@@ -28,6 +28,8 @@ DEPENDS =3D " \
     polkit \
     pulseaudio \
     samba \
+    setxkbmap-native \
+    tecla \
     udisks2 \
     upower \
 "
@@ -37,16 +39,14 @@ inherit gtk-icon-cache pkgconfig gnomebase gsettings ge=
ttext upstream-version-is
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
 SRC_URI +=3D "<a href=3D"file://0001-Add-meson-option-to-pass-sysroot.patc=
h" "=3D"">file://0001-Add-meson-option-to-pass-sysroot.patch"</a>
-SRC_URI[archive.sha256sum] =3D "066a65052fc3ecfae860025e85f797e6ab2b87a58c=
4f8ab9c66ec20718a80c7a"
+SRC_URI[archive.sha256sum] =3D "83df6a90f98914f2c19a872ce06562acef40927637=
f679c383099265ccfa42cf"
=20
 PACKAGECONFIG ??=3D "ibus <a href=3D"mailto:${@bb.utils.filter">${@bb.util=
s.filter</a>('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[cups] =3D ",,cups,cups"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland"
=20
-EXTRA_OEMESON =3D " \
-    -Doe_sysroot=3D${STAGING_DIR_HOST} \
-"
+EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}"
=20
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-dir=
 ${sysconfdir}/polkit-1 polkitd"
@@ -66,4 +66,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla"
<div>--=20
</div>2.42.0

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#104947): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/104947">https://lists.openembedded.org/g/openembed=
ded-devel/message/104947</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/101445277/361=
8223">https://lists.openembedded.org/mt/101445277/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-mO9+6EmaItUu+XLGthi3--


