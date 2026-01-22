Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64D6BD3EE84
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.40493.1769096637219893795
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id C1D8DF32F
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqc-1auNgW0; Thu, 22 Jan 2026 16:43:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 08/11] gnome-settings-daemon: fix build without x11
Date: Thu, 22 Jan 2026 16:43:31 +0100
Message-ID: <20260122154334.1872038-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096630-E4FF6925-6194D389/0/0 CLEAN NORMAL
X-TOI-MSGID: bb576433-b5ab-43ff-b3bf-c619cd3444e5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123740

xwayland requires x11, build only if x11 is in DISTRO_FEATURES
---
 .../gnome-settings-daemon/gnome-settings-daemon_49.1.bb     | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_49.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_49.1.bb
index 2125bd91fe..dfda4a3a13 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_49.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_49.1.bb
@@ -21,7 +21,7 @@ DEPENDS =3D " \
 "
=20
 # all these are mandatory
-REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
+REQUIRED_DISTRO_FEATURES =3D "polkit pulseaudio systemd gobject-introspe=
ction-data"
 GIR_MESON_OPTION =3D ""
=20
 SRC_URI +=3D "file://0001-gsd-smartcard-enum-types.c.in-fix-reproducibil=
ity-is.patch"
@@ -29,9 +29,9 @@ SRC_URI[archive.sha256sum] =3D "2a9957fc4f91c3b9127b494=
84179bef485120d9c1c208e44d4
=20
 PACKAGECONFIG ??=3D " \
     ${@bb.utils.filter('DISTRO_FEATURES', 'systemd x11 alsa', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xwayland', '', d)} \
     gudev \
     smartcard \
-    xwayland \
     cups \
 "
 PACKAGECONFIG[alsa] =3D "-Dalsa=3Dtrue,-Dalsa=3Dfalse,alsa-lib"
@@ -39,7 +39,7 @@ PACKAGECONFIG[cups] =3D "-Dcups=3Dtrue,-Dcups=3Dfalse,c=
ups"
 PACKAGECONFIG[gudev] =3D "-Dgudev=3Dtrue,-Dgudev=3Dfalse,libgudev"
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Dtrue,-Dsmartcard=3Dfalse,nss=
"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
-PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dtrue"
+PACKAGECONFIG[xwayland] =3D "-Dxwayland=3Dtrue,-Dxwayland=3Dfalse"
 PACKAGECONFIG[x11] =3D "-Dx11=3Dtrue,-Dx11=3Dfalse,libx11 libxfixes"
=20
 def gnome_verdir(v):
--=20
2.52.0


