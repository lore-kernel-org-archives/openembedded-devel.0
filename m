Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48FACC25B7C
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:54:42 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web11.20351.1716897274679566285
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 04:54:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout02.t-online.de (Postfix) with SMTP id 7581626083;
	Tue, 28 May 2024 13:54:23 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.40.240]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBvPL-2AIjxo0; Tue, 28 May 2024 13:54:23 +0200
Date: Tue, 28 May 2024 13:54:59 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-gnome][PATCHv2] gnome-remote-desktop: update 46.1 ->
 46.2
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Message-Id: <NF27ES.VN54M0OVYXAJ3@t-online.de>
In-Reply-To: <17D3A4E1A62AAF09.7888@lists.openembedded.org>
References: <17D3A4E1A62AAF09.7888@lists.openembedded.org>
X-Mailer: geary/44.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-slH6iU27w5ZywKL5Lj+f"
X-TOI-EXPURGATEID: 150726::1716897263-427FBD34-1A654871/0/0 CLEAN NORMAL
X-TOI-MSGID: a0895ad1-886d-4073-a1e7-c07315746efa
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 11:54:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110590

--=-slH6iU27w5ZywKL5Lj+f
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

v2 fixes transaction test error because of wrong permissions of=20
/usr/share/polkit-1/rules.d

On Tue, May 28 2024 at 01:53:26 PM +02:00:00, Markus Volk=20
<f_l_k@t-online.de> wrote:
> 46.2
> =3D=3D=3D=3D
> * Potential crasher fix
> * Improved disconnection messages
> * Broader client compatibility support
> * Various security hardening improvements
> * CVE-2024-5148 Limit login screen->user session handover access to=20
> appropriate user
>=20
> Contributors:
>  Pascal Nowack, Ray Strode
>=20
> Translators:
>   Bal=E1zs =DAr [hu], Efstathios Iosifidis [el], Fabio Tomat [fur],
>   Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
>   Juliano de Souza Camargo [pt_BR]
>=20
> - add polkitd user and fix permissions to avoid:
> Error: Transaction test error:
>   file /usr/share/polkit-1/rules.d conflicts between attempted=20
> installs of gnome-remote-desktop-46.2-r0.corei7_64 and=20
> gnome-control-center-46.2-r0.corei7_64
>=20
> Signed-off-by: Markus Volk <f_l_k@t-online.de=20
> <mailto:f_l_k@t-online.de>>
> ---
>  ...ktop_46.1.bb =3D> gnome-remote-desktop_46.2.bb} | 16=20
> +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>  rename=20
> meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-deskto=
p/{gnome-remote-desktop_46.1.bb=20
> =3D> gnome-remote-desktop_46.2.bb} (64%)
>=20
> diff --git=20
> a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desk=
top/gnome-remote-desktop_46.1.bb=20
> b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desk=
top/gnome-remote-desktop_46.2.bb
> similarity index 64%
> rename from=20
> meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-deskto=
p/gnome-remote-desktop_46.1.bb
> rename to=20
> meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-deskto=
p/gnome-remote-desktop_46.2.bb
> index 634b37971..59ae9383d 100644
> ---=20
> a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desk=
top/gnome-remote-desktop_46.1.bb
> +++=20
> b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-desk=
top/gnome-remote-desktop_46.2.bb
> @@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D=20
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
>=20
>  GNOMEBASEBUILDCLASS =3D "meson"
>=20
> -inherit gnomebase gettext gsettings features_check
> +inherit gnomebase gettext gsettings features_check useradd
>=20
> -REQUIRED_DISTRO_FEATURES =3D "opengl"
> +REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
>=20
> -SRC_URI[archive.sha256sum] =3D=20
> "7c62a4281fdfa9522110affbf75d09973035f2adc7fa4577511d733186beb68f"
> +SRC_URI[archive.sha256sum] =3D=20
> "97443eaffe4b1a69626886a41d25cbeb2c148d3fed43d92115c1b7d20d5238ab"
>=20
>  DEPENDS =3D " \
>      asciidoc-native \
> @@ -36,5 +36,15 @@ PACKAGECONFIG[vnc] =3D=20
> "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
>  PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3=20
> libxkbcommon"
>  PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
>=20
> +USERADD_PACKAGES =3D "${PN}"
> +USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group=20
> --home-dir ${sysconfdir}/polkit-1 polkitd"
> +
> +do_install:append() {
> +    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
> +        chmod 700 ${D}${datadir}/polkit-1/rules.d
> +        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
> +    fi
> +}
> +
>  PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
>  FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir}=20
> ${datadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
> --
> 2.45.1
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#110589):=20
> <https://lists.openembedded.org/g/openembedded-devel/message/110589>
> Mute This Topic: <https://lists.openembedded.org/mt/106346808/3618223>
> Group Owner: openembedded-devel+owner@lists.openembedded.org=20
> <mailto:openembedded-devel+owner@lists.openembedded.org>
> Unsubscribe:=20
> <https://lists.openembedded.org/g/openembedded-devel/unsub>=20
> [f_l_k@t-online.de <mailto:f_l_k@t-online.de>]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


--=-slH6iU27w5ZywKL5Lj+f
Content-Type: text/html; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto"><div>v2 fixes transaction test error be=
cause of wrong permissions of /usr/share/polkit-1/rules.d</div></div><div i=
d=3D"geary-quote" dir=3D"auto"><br>On Tue, May 28 2024 at 01:53:26 PM +02:0=
0:00, Markus Volk &lt;f_l_k@t-online.de&gt; wrote:<br><blockquote type=3D"c=
ite"><div class=3D"plaintext" style=3D"white-space: break-spaces;">46.2
=3D=3D=3D=3D
* Potential crasher fix
* Improved disconnection messages
* Broader client compatibility support
* Various security hardening improvements
* CVE-2024-5148 Limit login screen-&gt;user session handover access to appr=
opriate user

Contributors:
 Pascal Nowack, Ray Strode

Translators:
  Bal=E1zs =DAr [hu], Efstathios Iosifidis [el], Fabio Tomat [fur],
  Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
  Juliano de Souza Camargo [pt_BR]

- add polkitd user and fix permissions to avoid:
Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs of =
gnome-remote-desktop-46.2-r0.corei7_64 and gnome-control-center-46.2-r0.cor=
ei7_64

Signed-off-by: Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de">f_l_k@t=
-online.de</a>&gt;
---
 ...ktop_46.1.bb =3D&gt; gnome-remote-desktop_46.2.bb} | 16 +++++++++++++--=
-
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/{gnome-remote-desktop_46.1.bb =3D&gt; gnome-remote-desktop_46.2.bb}=
 (64%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-re=
mote-desktop/gnome-remote-desktop_46.1.bb b/meta-gnome/dynamic-layers/meta-=
security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2.bb
similarity index 64%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_46.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/gnome-remote-desktop_46.2.bb
index 634b37971..59ae9383d 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-de=
sktop/gnome-remote-desktop_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-de=
sktop/gnome-remote-desktop_46.2.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gettext gsettings features_check
+inherit gnomebase gettext gsettings features_check useradd
=20
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "7c62a4281fdfa9522110affbf75d09973035f2adc7=
fa4577511d733186beb68f"
+SRC_URI[archive.sha256sum] =3D "97443eaffe4b1a69626886a41d25cbeb2c148d3fed=
43d92115c1b7d20d5238ab"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -36,5 +36,15 @@ PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvn=
cserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkbco=
mmon"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-dir=
 ${sysconfdir}/polkit-1 polkitd"
+
+do_install:append() {
+    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+    fi
+}
+
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${data=
dir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
<div>--=20
</div>2.45.1

</div><div class=3D"plaintext" style=3D"white-space: break-spaces;">
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#110589): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/110589">https://lists.openembedded.org/g/openembed=
ded-devel/message/110589</a>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/106346808/361=
8223">https://lists.openembedded.org/mt/106346808/3618223</a>
Group Owner: <a href=3D"mailto:openembedded-devel+owner@lists.openembedded.=
org">openembedded-devel+owner@lists.openembedded.org</a>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub">https://lists.openembedded.org/g/openembedded-devel/unsub</a> [<a h=
ref=3D"mailto:f_l_k@t-online.de">f_l_k@t-online.de</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</div></blockquote></div>
--=-slH6iU27w5ZywKL5Lj+f--


