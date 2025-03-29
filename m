Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18FE6C36008
	for <webhook@archiver.kernel.org>; Sat, 29 Mar 2025 08:53:15 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.7339.1743238388562150144
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Mar 2025 01:53:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout08.t-online.de (Postfix) with SMTP id A2084935
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 09:53:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.83]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tyRwA-0umK6z0; Sat, 29 Mar 2025 09:53:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: uodate 47.0 - 48.0
Date: Sat, 29 Mar 2025 09:53:53 +0100
Message-ID: <20250329085353.13993-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1743238386-D8FF6927-15794312/0/0 CLEAN NORMAL
X-TOI-MSGID: 9cf3733d-ed5d-4603-af99-718e24310df4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Mar 2025 08:53:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116369

- add missing dependency for 'rdp'

48.0
=3D=3D=3D=3D
Translators:
  A S Alam [pa], Aurimas =C4=8Cernius [lt], Seong-ho Cho [ko],
  Bal=C3=A1zs =C3=9Ar [hu], Daniel Mustieles [es], Ask Hjorth Larsen [da]=
,
  Andika Triwidada [id], Jiri Gr=C3=B6nroos [fi], Pawan Chitrakar [ne],

48.rc
=3D=3D=3D=3D=3D
* Add support for hardware encoded AVC444

Contributors:
  Pascal Nowack

Translators:
  Rafael Fontenelle [pt_BR], Giannis Antypas [el], Daniel Rusek [cs],
  Piotr Dr=C4=85g [pl], Anders Jonsson [sv], Ekaterine Papava [ka],
  Alexandre Franke [fr], Yuri Chornoivan [uk], twlvnn kraftwerk [bg],
  Scrambled 777 [hi], Quentin PAG=C3=88S [oc], Asier Sarasua Garmendia [e=
u],
  Hugo Carvalho [pt], Fran Dieguez [gl], Jordi Mas i Hernandez [ca]

48.beta
=3D=3D=3D=3D=3D=3D=3D
* Add support for zero copy rendering with Vulkan and VAAPI
  (disabled by default)

Contributors:
  Pascal Nowack, traze

48.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* General code improvements
* Fix gdctl crash when setting VNC password
* Prepare for Vulkan and libva based hardware acceleration
* Add user documentation
* Don't hard code keyboard type

Contributors:
  Jonas =C3=85dahl, Jerry, Pascal Nowack, Bart=C5=82omiej Piotrowski, Dan=
iel Rusek

Translators:
  Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
  Juliano de Souza Camargo [pt_BR], R=C5=ABdolfs Mazurs [lv], Danial Behz=
adi [fa],
  Luming Zh [zh_CN], Martin [sl], Vasil Pupkin [be], Nathan Follens [nl],
  Artur S0 [ru], =D0=9C=D0=B8=D0=BB=D0=BE=D1=88 =D0=9F=D0=BE=D0=BF=D0=BE=D0=
=B2=D0=B8=D1=9B [sr], Quentin PAG=C3=88S [oc], Yaron Shahrabani [he],
  Sabri =C3=9Cnal [tr]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...me-remote-desktop_47.0.bb =3D> gnome-remote-desktop_48.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_47.0.bb =3D> gnome-remote-desktop_48.0.bb=
} (89%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_47.0.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_48.0=
.bb
similarity index 89%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_47.0.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_48.0.bb
index 38a8cc01a3..5f8a06c5c3 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_47.0.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "8aa55775757b299debe417e169e6e28fecbf18ce=
611ed176fa0d650ab5344776"
+SRC_URI[archive.sha256sum] =3D "038c42e48fe1d890849bec5d567566c152bd6d7f=
463eadeec59b1eae8fbb32a0"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -33,7 +33,7 @@ PACKAGECONFIG ??=3D " \
=20
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,pipewire-native=
 wireplumber-native dbus-native"
 PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
-PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common"
+PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common shaderc-native"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
--=20
2.49.0


