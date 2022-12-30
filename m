Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BCB6C4167B
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 10:59:02 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.16056.1672397939760903099
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 02:59:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout12.t-online.de (Postfix) with SMTP id 94627FEDA
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 11:58:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBD6F-4cGBd40; Fri, 30 Dec 2022 11:58:55 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/5] gnome-shell: add missing RDEPENDS
Date: Fri, 30 Dec 2022 11:58:41 +0100
Message-Id: <20221230105844.428064-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230105844.428064-1-f_l_k@t-online.de>
References: <20221230105844.428064-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672397935-3B7ED81E-78B88121/0/0 CLEAN NORMAL
X-TOI-MSGID: 0f116799-79ab-4d0e-9a5c-4b9750114912
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 10:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100309

Add enough runtime dependencies to make gnome-shell start from the termin=
al

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-gnome/gnome-shell/gnome-shell_43.1.bb | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-shell/gnome-shell_43.1.bb
index 980a7b583..f82879ebd 100644
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
@@ -65,7 +65,18 @@ FILES:${PN} +=3D " \
     ${systemd_user_unitdir} \
 "
=20
-RDEPENDS:${PN} +=3D "gnome-desktop gsettings-desktop-schemas gdm-base li=
brsvg-gtk ${PN}-gsettings"
+RDEPENDS:${PN} +=3D " \
+	accountsservice \
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


