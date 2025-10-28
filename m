Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF7D2CCD1BF
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 19:03:40 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.20562.1761678210688955143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 12:03:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id C23ADF32F
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 20:03:28 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vDoye-1wuIGP0; Tue, 28 Oct 2025 20:03:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-remote-desktop: update 48.0 -> 49.1
Date: Tue, 28 Oct 2025 20:03:22 +0100
Message-ID: <20251028190322.1447001-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1761678208-7A7F3A62-CFB284FF/0/0 CLEAN NORMAL
X-TOI-MSGID: 76e0707f-1a78-47a1-b3fd-70d4ece9fee2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Oct 2025 19:03:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121097

- inherit pkgconfig
- Add a	patch that adds a missing dependency on winpr

This fixes:
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
 ...uild-add-missing-dependency-on-winpr.patch | 34 +++++++++++++++++++
 ...p_48.0.bb =3D> gnome-remote-desktop_49.1.bb} |  5 +--
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/dynamic-layers/meta-security/recipes-gnome=
/gnome-remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-missi=
ng-dependency-on-winpr.patch
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_48.0.bb =3D> gnome-remote-desktop_49.1.bb=
} (85%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-missing-depe=
ndency-on-winpr.patch b/meta-gnome/dynamic-layers/meta-security/recipes-g=
nome/gnome-remote-desktop/gnome-remote-desktop/0001-src-meson.build-add-m=
issing-dependency-on-winpr.patch
new file mode 100644
index 0000000000..c10962a447
--- /dev/null
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop/0001-src-meson.build-add-missing-dependency-=
on-winpr.patch
@@ -0,0 +1,34 @@
+From 22f223873de1e805ad8760cdf59a1e7af89a436c Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 28 Oct 2025 19:33:44 +0100
+Subject: [PATCH] src/meson.build: add missing dependency on winpr
+
+This fixes:
+    | In file included from ../sources/gnome-remote-desktop-49.1/src/grd=
-settings.c:28:
+    | /home/flk/poky/build/tmp/work/corei7-64-poky-linux/gnome-remote-de=
sktop/49.1/recipe-sysroot/usr/include/freerdp3/freerdp/freerdp.h:25:10: f=
atal error: winpr/stream.h: No such file or directory
+    |    25 | #include <winpr/stream.h>
+    |       |          ^~~~~~~~~~~~~~~~
+    | compilation terminated.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gnome-remote-=
desktop/-/merge_requests/350]
+---
+ src/meson.build | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/meson.build b/src/meson.build
+index 1b2cb93..cca475a 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -360,6 +360,7 @@ if have_rdp
+   ctl_deps +=3D [
+     freerdp_dep,
+     polkit_dep,
++    winpr_dep,
+   ]
+=20
+   enable_service_sources =3D ([
+--=20
+2.51.0
+
diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_48.0.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_49.1=
.bb
similarity index 85%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_48.0.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_49.1.bb
index a80b101a6e..a102af9792 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_48.0.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_49.1.bb
@@ -4,11 +4,12 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gettext gsettings features_check useradd
+inherit gnomebase pkgconfig gettext gsettings features_check useradd
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "038c42e48fe1d890849bec5d567566c152bd6d7f=
463eadeec59b1eae8fbb32a0"
+SRC_URI +=3D "file://0001-src-meson.build-add-missing-dependency-on-winp=
r.patch"
+SRC_URI[archive.sha256sum] =3D "7800f388301eeb8147b0be55e8fa7cbd7521066a=
48a06115cc0ead9f0cea188a"
=20
 DEPENDS =3D " \
     asciidoc-native \
--=20
2.51.0


