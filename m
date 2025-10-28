Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18B20CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 16:44:40 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.14130.1761669869822875336
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 09:44:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id 993F339125
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 17:44:27 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.69]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vDmo6-1UgJ170; Tue, 28 Oct 2025 17:44:26 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-remote-desktop: update 48.0 -> 49.1
Date: Tue, 28 Oct 2025 17:44:19 +0100
Message-ID: <20251028164419.462005-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1761669866-76FFAA3C-02B9619A/0/0 CLEAN NORMAL
X-TOI-MSGID: b008e497-0919-4100-97be-de4099bb172c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 16:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121094

- Add '-I${STAGING_INCDIR}/winpr3' to CFLAGS in order to bypass a build f=
ailure
  caused by missing header after freerdp update

| In file included from ../sources/gnome-remote-desktop-49.1/src/grd-sett=
ings.c:28:
| /home/flk/poky/build/tmp/work/corei7-64-poky-linux/gnome-remote-desktop=
/49.1/recipe-sysroot/usr/include/freerdp3/freerdp/freerdp.h:25:10: fatal =
error: winpr/stream.h: No such file or directory
|    25 | #include <winpr/stream.h>
|       |          ^~~~~~~~~~~~~~~~
| compilation terminated.

49.1
=3D=3D=3D=3D
* Fix crash [Jonas; !345]
* Fix image corruption on some NVIDIA GPUs [Stephan; !344]
Contributors:
  Abduqadir Abliz, Jonas =C3=85dahl, Stephan Seitz
Translators:
  twlvnn kraftwerk [bg], Abduqadir Abliz [ug], Jo=C3=A3o Carvalhinho [pt]=
,
  Andi Chandler [en_GB], Quentin PAG=C3=88S [oc]
49.0
=3D=3D=3D=3D
* Handle Vulkan dma-buf format compatibility issues [Pascal; !339]
* Fix crash [Jonas; !341]
Contributors:
  Jonas =C3=85dahl, Pascal Nowack
Translators:
  Makoto Sakaguchi [ja], luming zh [zh_CN], Ekaterine Papava [ka],
  Anders Jonsson [sv], Artur S0 [ru], Daniel Mustieles [es],
  Jordi Mas i Hernandez [ca], Asier Saratsua Garmendia [eu], Seong-ho Cho=
 [ko],
  Yuri Chornoivan [uk], Aurimas Aurimas =C4=8Cernius [lt],
  Juliano de Souza Camargo [pt_BR], Francisco Di=C3=A9guez Souto [gl],
  Ask Hjorth Larsen [da], Nathan Follens [nl], Kristjan SCHMIDT [eo],
  Emin Tufan =C3=87etin [tr]
49.rc
=3D=3D=3D=3D=3D
* Allow systemd service management of all units via grdctl [Joan; !320]
* Misc bug fixes & cleanups [Jonas, Pascal; !329, !331, !324, !333, !326,=
 !336]
* Add support for relative pointer movements via RDP [Pascal; !332]
* Add support for extending desktop with virtual monitor via RDP [Pascal;=
 !334]
Contributors:
  Jonas =C3=85dahl, Joan Torres L=C3=B3pez, Pascal Nowack
Translators:
  Fabio Tomat [fur], Du=C5=A1an Kazik [sk], Antonio Marin [ro], Martin [s=
l],
  Daniel Rusek [cs], Danial Behzadi [fa], Nathan Follens [nl], Bal=C3=A1z=
s =C3=9Ar [hu],
  Piotr Dr=C4=85g [pl], Yaron Shahrabani [he]
49.alpha
=3D=3D=3D=3D=3D=3D=3D=3D
* Add touch support [Pascal; !314]
* Fix failure to connect on some NVIDIA systems [Jonas; !323]
* Plumb locked keyboard modifiers via libei [Jonas; !311]
* Documentation improvements [W.; !317]
* Fix crash [Pascal; !325]
* Plug leak [Michael; !319]
* Misc cleanups & improvements [Pascal, Jonas; !315, !313, !327]
Contributors:
  Jonas =C3=85dahl, Michael Catanzaro, Pascal Nowack, W. Michael Petullo
Translators:
  Takayuki KUSANO [ja], Emilio Sep=C3=BAlveda [ia], Antonio Marin [ro],
  Aefgh Threenine [th]
48.1
=3D=3D=3D=3D
* Reduce latency when PipeWire stream uses shared memories
Contributors:
  Pascal Nowack

Translators:
  Baxrom Raxmatov [uz], Cheng-Chia Tseng [zh_TW], Philipp Kiemle [de]
---
 ...me-remote-desktop_48.0.bb =3D> gnome-remote-desktop_49.1.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_48.0.bb =3D> gnome-remote-desktop_49.1.bb=
} (91%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_49.1=
.bb
similarity index 91%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_48.0.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_49.1.bb
index a80b101a6e..c63ca7fa4a 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
@@ -8,7 +8,7 @@ inherit gnomebase gettext gsettings features_check userad=
d
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "038c42e48fe1d890849bec5d567566c152bd6d7f=
463eadeec59b1eae8fbb32a0"
+SRC_URI[archive.sha256sum] =3D "7800f388301eeb8147b0be55e8fa7cbd7521066a=
48a06115cc0ead9f0cea188a"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -31,6 +31,8 @@ PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd', d)} \
 "
=20
+CFLAGS +=3D "-I${STAGING_INCDIR}/winpr3"
+
 PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,pipewire-native=
 wireplumber-native dbus-native"
 PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,libvncserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common shaderc-native"
--=20
2.51.0


