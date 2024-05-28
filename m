Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C35EC25B78
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 11:53:02 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.20028.1716897171641842349
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 May 2024 04:52:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout07.t-online.de (Postfix) with SMTP id DA9DE38D70
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 13:52:49 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.40.240]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sBvNp-3BT2VF0; Tue, 28 May 2024 13:52:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-remote-desktop: update 46.1 -> 46.2
Date: Tue, 28 May 2024 13:53:26 +0200
Message-ID: <20240528115326.3935662-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1716897169-4E770D42-3E35904C/0/0 CLEAN NORMAL
X-TOI-MSGID: f0b51d3b-edc1-46e7-92d4-87bdc7489d7b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 11:53:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110589

46.2
=3D=3D=3D=3D
* Potential crasher fix
* Improved disconnection messages
* Broader client compatibility support
* Various security hardening improvements
* CVE-2024-5148 Limit login screen->user session handover access to appro=
priate user

Contributors:
 Pascal Nowack, Ray Strode

Translators:
  Bal=C3=A1zs =C3=9Ar [hu], Efstathios Iosifidis [el], Fabio Tomat [fur],
  Hugo Carvalho [pt], Jordi Mas i Hernandez [ca],
  Juliano de Souza Camargo [pt_BR]

- add polkitd user and fix permissions to avoid:
Error: Transaction test error:
  file /usr/share/polkit-1/rules.d conflicts between attempted installs o=
f gnome-remote-desktop-46.2-r0.corei7_64 and gnome-control-center-46.2-r0=
.corei7_64

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ktop_46.1.bb =3D> gnome-remote-desktop_46.2.bb} | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)
 rename meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remot=
e-desktop/{gnome-remote-desktop_46.1.bb =3D> gnome-remote-desktop_46.2.bb=
} (64%)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_46.1.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2=
.bb
similarity index 64%
rename from meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-r=
emote-desktop/gnome-remote-desktop_46.1.bb
rename to meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-rem=
ote-desktop/gnome-remote-desktop_46.2.bb
index 634b37971..59ae9383d 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.1.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.2.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5=
fce4486a80fdaf4a4263"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gettext gsettings features_check
+inherit gnomebase gettext gsettings features_check useradd
=20
-REQUIRED_DISTRO_FEATURES =3D "opengl"
+REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
-SRC_URI[archive.sha256sum] =3D "7c62a4281fdfa9522110affbf75d09973035f2ad=
c7fa4577511d733186beb68f"
+SRC_URI[archive.sha256sum] =3D "97443eaffe4b1a69626886a41d25cbeb2c148d3f=
ed43d92115c1b7d20d5238ab"
=20
 DEPENDS =3D " \
     asciidoc-native \
@@ -36,5 +36,15 @@ PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,lib=
vncserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
+
+do_install:append() {
+    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
+        chmod 700 ${D}${datadir}/polkit-1/rules.d
+        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
+    fi
+}
+
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
--=20
2.45.1


