Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCD6CC4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 14:12:23 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.18697.1672409539969342882
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 06:12:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id C572D1B34C
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 15:12:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBG7N-14qG5B0; Fri, 30 Dec 2022 15:12:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gnome-shell: add missing RDEPENDS
Date: Fri, 30 Dec 2022 15:12:10 +0100
Message-Id: <20221230141210.811193-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672409537-EFFE97E2-7946BA63/0/0 CLEAN NORMAL
X-TOI-MSGID: edd46f67-8ede-415a-bfcd-db116fc89e9c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 14:12:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100313

Add enough runtime dependencies to make gnome-shell start from the termin=
al

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-shell/gnome-shell_43.1.bb              | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
index 980a7b583..f75bad28b 100644
--- a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
@@ -37,7 +37,7 @@ SRC_URI +=3D "file://0001-Introduce-options-gjs_path-to=
-optionally-set-path-to.pat
=20
 PACKAGECONFIG ??=3D "bluetooth nm ${@bb.utils.filter('DISTRO_FEATURES', =
'systemd', d)}"
 PACKAGECONFIG[bluetooth] =3D ",,gnome-bluetooth"
-PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
, networkmanager"
+PACKAGECONFIG[nm] =3D "-Dnetworkmanager=3Dtrue, -Dnetworkmanager=3Dfalse=
,networkmanager,networkmanager"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue, -Dsystemd=3Dfalse, systemd=
"
=20
 EXTRA_OEMESON =3D " \
@@ -65,7 +65,19 @@ FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
 "
=20
-RDEPENDS:${PN} +=3D "gnome-desktop gsettings-desktop-schemas gdm-base li=
brsvg-gtk ${PN}-gsettings"
+RDEPENDS:${PN} +=3D " \
+	accountsservice \
+	gdm-base \
+	gnome-control-center \
+	gnome-backgrounds \
+	gnome-bluetooth \
+	gnome-desktop \
+	gnome-session \
+	gnome-settings-daemon \
+	gnome-shell-gsettings \
+	gsettings-desktop-schemas \
+	librsvg-gtk \
+"
=20
 PACKAGES =3D+ "${PN}-tools ${PN}-gsettings"
 FILES:${PN}-tools =3D "${bindir}/*-tool"
--=20
2.34.1


