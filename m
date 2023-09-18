Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E920CD3421
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 23:00:39 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.5643.1695078033904183105
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 16:00:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout04.t-online.de (Postfix) with SMTP id 764441510
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 01:00:32 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiNED-1Aibsv0; Tue, 19 Sep 2023 01:00:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gnome-settings-daemon: upgrade 44.1 -> 45.0
Date: Tue, 19 Sep 2023 01:00:27 +0200
Message-ID: <20230918230027.13333-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695078029-BFFE59BF-3B4BD1CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 04dcc034-7a9d-4578-95a1-355caa5a3698
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:00:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104949

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...ttings-daemon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_44.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_45.0.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_45.0.bb
index 104f4a667..16b7f2367 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_44.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_45.0.bb
@@ -25,7 +25,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "12653b72d81f151300a47d700ac9410ac1bcce38=
e83f1bdd19cded2932943989"
+SRC_URI[archive.sha256sum] =3D "bb4dc46950e2a90f38f23225848856d2a7b1b718=
c89d0285ce197b7016bb1dc8"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
@@ -40,7 +40,10 @@ PACKAGECONFIG[nm] =3D "-Dnetwork_manager=3Dtrue,-Dnetw=
ork_manager=3Dfalse,networkmanag
 PACKAGECONFIG[smartcard] =3D "-Dsmartcard=3Dtrue,-Dsmartcard=3Dfalse,nss=
"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3Dfalse,wayland"
=20
+def gnome_verdir(v):
+   return oe.utils.trim_version(v, 1)
+
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
-    /usr/lib/gnome-settings-daemon-44/libgsd.so \
+    ${libdir}/gnome-settings-daemon-${@gnome_verdir("${PV}")}/libgsd.so =
\
 "
--=20
2.42.0


