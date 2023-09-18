Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC6AC46CA1
	for <webhook@archiver.kernel.org>; Mon, 18 Sep 2023 21:52:17 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4026.1695073930053611041
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Sep 2023 14:52:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 5283C54F6
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 23:52:08 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.161.214]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qiM9z-3qxV220; Mon, 18 Sep 2023 23:52:03 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/18] gnome-settings-daemon: upgrade 44.1 -> 45.0
Date: Mon, 18 Sep 2023 23:51:37 +0200
Message-ID: <20230918215156.1920452-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918215156.1920452-1-f_l_k@t-online.de>
References: <20230918215156.1920452-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695073923-477FF5E3-AA84C44A/0/0 CLEAN NORMAL
X-TOI-MSGID: c707468a-6330-4520-8a5e-5040db565fd3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Sep 2023 21:52:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104929

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-settings-daemon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_44.1.bb =3D> gnome-settings-daemon_45.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_44.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_45.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_44.1.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_45.0.bb
index 104f4a667..26a7c2ff1 100644
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
@@ -42,5 +42,5 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3D=
false,wayland"
=20
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
-    /usr/lib/gnome-settings-daemon-44/libgsd.so \
+    /usr/lib/gnome-settings-daemon-45/libgsd.so \
 "
--=20
2.41.0


