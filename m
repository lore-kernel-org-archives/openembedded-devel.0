Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D655C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:15:22 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.205877.1672326913381916664
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:15:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout08.t-online.de (Postfix) with SMTP id 7AA7D1CBA6
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 16:15:11 +0100 (CET)
Received: from [192.168.178.83] ([79.219.226.205]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAuch-0YVdY00; Thu, 29 Dec 2022 16:15:11 +0100
Date: Thu, 29 Dec 2022 16:15:06 +0100
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [meta-gnome][PATCH] gnome-control-center: update 42.0 -> 43.2
To: openembedded-devel@lists.openembedded.org
Message-Id: <6PRNNR.YNL7GSWNVOU21@t-online.de>
In-Reply-To: <20221229151332.224449-1-f_l_k@t-online.de>
References: <20221229151332.224449-1-f_l_k@t-online.de>
X-Mailer: geary/40.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-qGTW5ogxsZHe3GoGSdLU"
X-TOI-EXPURGATEID: 150726::1672326911-2E0B6EA1-1CCF1452/0/0 CLEAN NORMAL
X-TOI-MSGID: 4b50d11c-b324-4df8-b583-e112e26a7c05
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 15:15:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100301

--=-qGTW5ogxsZHe3GoGSdLU
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

Note: This update would require 2 patches applied to oe-core that I=20
recently sent for testing.

Am Do, 29. Dez 2022 um 16:13:32 +0100 schrieb Markus Volk=20
<f_l_k@t-online.de>:
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...001-Add-meson-option-to-pass-sysroot.patch | 45 ------------------
>  ...r_42.0.bb =3D> gnome-control-center_43.2.bb} | 46=20
> ++++++++++---------
>  2 files changed, 24 insertions(+), 67 deletions(-)
>  delete mode 100644=20
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001-A=
dd-meson-option-to-pass-sysroot.patch
>  rename=20
> meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center_42.0.=
bb=20
> =3D> gnome-control-center_43.2.bb} (68%)
>=20
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch
> deleted file mode 100644
> index 768ba5439..000000000
> ---=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/0001=
-Add-meson-option-to-pass-sysroot.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00=20
> 2001
> -From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om=20
> <mailto:schnitzeltony@gmail.com>>
> -Date: Tue, 21 May 2019 16:07:46 +0200
> -Subject: [PATCH] Add meson option to pass sysroot
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -We need to pass this to meson to help it finding gdesktop-enums.h:
> -
> -| panels/background/meson.build:38:0: ERROR: File=20
> /usr/include/gsettings-desktop-schemas/gdesktop-enums.h does not=20
> exist.
> -
> -Upstream-Status: Inappropriate [OE specific]
> -
> -Signed-off-by: Andreas M=FCller <schnitzeltony@gmail.com=20
> <mailto:schnitzeltony@gmail.com>>
> ----
> - meson_options.txt             | 1 +
> - panels/background/meson.build | 2 +-
> - 2 files changed, 2 insertions(+), 1 deletion(-)
> -
> -diff --git a/meson_options.txt b/meson_options.txt
> -index dbca723..af0f871 100644
> ---- a/meson_options.txt
> -+++ b/meson_options.txt
> -@@ -1,3 +1,4 @@
> -+option('oe_sysroot', type: 'string', value: '', description:=20
> 'Directory for OE-sysroot')
> - option('documentation', type: 'boolean', value: false, description:=20
> 'build documentation')
> - option('ibus', type: 'boolean', value: true, description: 'build=20
> with IBus support')
> - option('privileged_group', type: 'string', value: 'wheel',=20
> description: 'name of group that has elevated permissions')
> -diff --git a/panels/background/meson.build=20
> b/panels/background/meson.build
> -index 3634c47..459ccfe 100644
> ---- a/panels/background/meson.build
> -+++ b/panels/background/meson.build
> -@@ -25,7 +25,7 @@ common_sources =3D []
> -
> - enums =3D 'gdesktop-enums-types'
> - enums_header =3D files(
> --  gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -+  get_option('oe_sysroot') +=20
> gsettings_desktop_dep.get_pkgconfig_variable('prefix') +=20
> '/include/gsettings-desktop-schemas/gdesktop-enums.h',
> -   'cc-background-item.h'
> - )
> -
> ---
> -2.34.1
> -
> diff --git=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0=
.bb=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2=
.bb
> similarity index 68%
> rename from=20
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0.b=
b
> rename to=20
> meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2.b=
b
> index 6fe999a19..5772d6b73 100644
> ---=20
> a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42.0=
.bb
> +++=20
> b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43.2=
.bb
> @@ -4,46 +4,48 @@ LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3D75859989545e37968a99b631ef42722e"=20
> <file://copying;md5=3D75859989545e37968a99b631ef42722e/>
>=20
>  GNOMEBASEBUILDCLASS =3D "meson"
> +GTKIC_VERSION =3D "4"
>=20
> -inherit gnomebase gsettings gettext vala upstream-version-is-even=20
> bash-completion features_check
> +inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext=20
> upstream-version-is-even bash-completion features_check useradd
>=20
>  DEPENDS =3D " \
> -    gdk-pixbuf-native \
> -    colord-gtk \
> -    udisks2 \
> -    upower \
> -    polkit \
> -    pulseaudio \
>      accountsservice \
> -    samba \
> -    gsettings-desktop-schemas \
> -    gnome-settings-daemon \
> +    colord-gtk \
> +    gcr3 \
> +    gdk-pixbuf \
> +    glib-2.0 \
> +    gnome-bluetooth \
>      gnome-desktop \
>      gnome-online-accounts \
> -    libnma \
> -    gnome-bluetooth \
> -    grilo \
> +    gnome-settings-daemon \
> +    gsettings-desktop-schemas \
> +    gtk4 \
> +    libadwaita \
> +    libepoxy \
>      libgtop \
> -    gsound \
> +    libgudev \
> +    libnma \
>      libpwquality \
> -    libadwaita \
> +    libxml2 \
> +    polkit \
> +    pulseaudio \
> +    samba \
> +    udisks2 \
> +    upower \
>  "
>=20
> -REQUIRED_DISTRO_FEATURES +=3D "polkit pulseaudio systemd x11"
> +REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "0732efa7c4171ce0a0ed4106580b4ce35a57b10152c0ea36d239134913777eda"
> -SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"=20
> <file://0001-add-meson-option-to-pass-sysroot.patch/>
> +SRC_URI[archive.sha256sum] =3D=20
> "d7f256aba80a92c727b329fd01c8602da4b78f0fddaec93fcd91096964700563"
>=20
>  PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter=20
> <mailto:${@bb.utils.filter>('DISTRO_FEATURES', 'wayland', d)}"
>  PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
>  PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
>=20
> -EXTRA_OEMESON =3D " \
> -    -Doe_sysroot=3D${STAGING_DIR_HOST} \
> -"
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group=20
> --home-dir ${sysconfdir}/polkit-1 polkitd"
>=20
>  do_install:append() {
> -	# If polkit is setup fixup permissions and ownership
>      if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
>          chmod 700 ${D}${datadir}/polkit-1/rules.d
>          chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> --
> 2.34.1
>=20


--=-qGTW5ogxsZHe3GoGSdLU
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>Note: This update would require 2 =
patches applied to oe-core that I recently sent for testing.</div></div><di=
v id=3D"geary-quote" dir=3D"auto"><br>Am Do, 29. Dez 2022 um 16:13:32 +0100=
 schrieb Markus Volk &lt;f_l_k@t-online.de&gt;:<br><blockquote type=3D"cite=
"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Signed-off-=
by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de<=
/a>&gt;
---
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 ------------------
 ...r_42.0.bb =3D&gt; gnome-control-center_43.2.bb} | 46 ++++++++++--------=
-
 2 files changed, 24 insertions(+), 67 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-con=
trol-center/0001-Add-meson-option-to-pass-sysroot.patch
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-center=
_42.0.bb =3D&gt; gnome-control-center_43.2.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-ce=
nter/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-gnome=
/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-pass-sy=
sroot.patch
deleted file mode 100644
index 768ba5439..000000000
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/00=
01-Add-meson-option-to-pass-sysroot.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D &lt;<a href=3D"mailto:sc=
hnitzeltony@gmail.com">schnitzeltony@gmail.com</a>&gt;
-Date: Tue, 21 May 2019 16:07:46 +0200
-Subject: [PATCH] Add meson option to pass sysroot
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-We need to pass this to meson to help it finding gdesktop-enums.h:
-
-| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings-d=
esktop-schemas/gdesktop-enums.h does not exist.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=FCller &lt;<a href=3D"mailto:schnitzeltony@gmail.=
com">schnitzeltony@gmail.com</a>&gt;
----
- meson_options.txt             | 1 +
- panels/background/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index dbca723..af0f871 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,3 +1,4 @@
-+option('oe_sysroot', type: 'string', value: '', description: 'Directory f=
or OE-sysroot')
- option('documentation', type: 'boolean', value: false, description: 'buil=
d documentation')
- option('ibus', type: 'boolean', value: true, description: 'build with IBu=
s support')
- option('privileged_group', type: 'string', value: 'wheel', description: '=
name of group that has elevated permissions')
-diff --git a/panels/background/meson.build b/panels/background/meson.build
-index 3634c47..459ccfe 100644
---- a/panels/background/meson.build
-+++ b/panels/background/meson.build
-@@ -25,7 +25,7 @@ common_sources =3D []
-=20
- enums =3D 'gdesktop-enums-types'
- enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gset=
tings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variable=
('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
-   'cc-background-item.h'
- )
-=20
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-ce=
nter_42.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_43.2.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cente=
r_43.2.bb
index 6fe999a19..5772d6b73 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_42=
.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_43=
.2.bb
@@ -4,46 +4,48 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "<a href=3D"file://COPYING;md5=3D75859989545e37968a99=
b631ef42722e" "=3D"">file://COPYING;md5=3D75859989545e37968a99b631ef42722e"=
</a>
=20
 GNOMEBASEBUILDCLASS =3D "meson"
+GTKIC_VERSION =3D "4"
=20
-inherit gnomebase gsettings gettext vala upstream-version-is-even bash-com=
pletion features_check
+inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-vers=
ion-is-even bash-completion features_check useradd
=20
 DEPENDS =3D " \
-    gdk-pixbuf-native \
-    colord-gtk \
-    udisks2 \
-    upower \
-    polkit \
-    pulseaudio \
     accountsservice \
-    samba \
-    gsettings-desktop-schemas \
-    gnome-settings-daemon \
+    colord-gtk \
+    gcr3 \
+    gdk-pixbuf \
+    glib-2.0 \
+    gnome-bluetooth \
     gnome-desktop \
     gnome-online-accounts \
-    libnma \
-    gnome-bluetooth \
-    grilo \
+    gnome-settings-daemon \
+    gsettings-desktop-schemas \
+    gtk4 \
+    libadwaita \
+    libepoxy \
     libgtop \
-    gsound \
+    libgudev \
+    libnma \
     libpwquality \
-    libadwaita \
+    libxml2 \
+    polkit \
+    pulseaudio \
+    samba \
+    udisks2 \
+    upower \
 "
=20
-REQUIRED_DISTRO_FEATURES +=3D "polkit pulseaudio systemd x11"
+REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
-SRC_URI[archive.sha256sum] =3D "0732efa7c4171ce0a0ed4106580b4ce35a57b10152=
c0ea36d239134913777eda"
-SRC_URI +=3D "<a href=3D"file://0001-Add-meson-option-to-pass-sysroot.patc=
h" "=3D"">file://0001-Add-meson-option-to-pass-sysroot.patch"</a>
+SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0fdd=
aec93fcd91096964700563"
=20
 PACKAGECONFIG ??=3D "ibus <a href=3D"mailto:${@bb.utils.filter">${@bb.util=
s.filter</a>('DISTRO_FEATURES', 'wayland', d)}"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland"
=20
-EXTRA_OEMESON =3D " \
-    -Doe_sysroot=3D${STAGING_DIR_HOST} \
-"
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-dir=
 ${sysconfdir}/polkit-1 polkitd"
=20
 do_install:append() {
-	# If polkit is setup fixup permissions and ownership
     if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
         chmod 700 ${D}${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
<div>--=20
</div>2.34.1

</div></blockquote></div>
--=-qGTW5ogxsZHe3GoGSdLU--


