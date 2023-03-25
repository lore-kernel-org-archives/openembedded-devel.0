Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43CFAC77B6E
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17408.1679731394494397679
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4E0371CBEF
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyro-0RoPhZ0; Sat, 25 Mar 2023 09:03:12 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 17/32] gnome-settings-daemon: update 43.0 -> 44.0
Date: Sat, 25 Mar 2023 09:02:41 +0100
Message-Id: <20230325080256.923752-17-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731392-85D6DC08-76323136/0/0 CLEAN NORMAL
X-TOI-MSGID: f928e652-a5d2-4714-8b07-3670b05ead6b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101729

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-settings-daemon_43.0.bb =3D> gnome-settings-daemon_44.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-settings-daemon/{gnome-settings-da=
emon_43.0.bb =3D> gnome-settings-daemon_44.0.bb} (89%)

diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-setting=
s-daemon_43.0.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-s=
ettings-daemon_44.0.bb
similarity index 89%
rename from meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings=
-daemon_43.0.bb
rename to meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-d=
aemon_44.0.bb
index fe246953f..e8f2014bf 100644
--- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_43.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemo=
n_44.0.bb
@@ -25,7 +25,7 @@ DEPENDS =3D " \
 REQUIRED_DISTRO_FEATURES =3D "x11 polkit pulseaudio systemd gobject-intr=
ospection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "3513bb24fc6f8181667223a64a067534fdccf3bf=
66326a9403d38b0f0d6013d0"
+SRC_URI[archive.sha256sum] =3D "b417ada1c1342a8cf29837ecf2dec9bdcdb75423=
5b1a161b6435c3d11f210999"
=20
 PACKAGECONFIG ??=3D " \
     cups nm \
@@ -42,5 +42,5 @@ PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue,-Dwayland=3D=
false,wayland"
=20
 FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
-    /usr/lib/gnome-settings-daemon-43/libgsd.so \
+    /usr/lib/gnome-settings-daemon-44/libgsd.so \
 "
--=20
2.34.1


