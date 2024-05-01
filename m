Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3303C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 07:38:58 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.7317.1714549132724898373
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 00:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout04.t-online.de (Postfix) with SMTP id EB8CE236A2
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 May 2024 09:38:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.42.233]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1s24YB-4R1vnN0; Wed, 1 May 2024 09:38:47 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: move printing RDEPENDS to cups PACKAGECONFIG
Date: Wed,  1 May 2024 09:39:11 +0200
Message-ID: <20240501073912.2145036-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1714549127-69FA0D74-EE06A91C/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a78f1b8-c8a6-452b-98ff-fc4d5c531b8f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 07:38:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110201

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_46.1.bb         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.1.bb
index 87daec0c2..9b54a00e6 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.1.bb
@@ -41,7 +41,7 @@ SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysr=
oot.patch"
 SRC_URI[archive.sha256sum] =3D "81792423019deda1d2a074c1ecf6a7e6ef3172c0=
9cbe6f4d7995a4b5dea28312"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
-PACKAGECONFIG[cups] =3D ",,cups,cups"
+PACKAGECONFIG[cups] =3D ",,cups,cups system-config-printer cups-pk-helpe=
r"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
 PACKAGECONFIG[file-share] =3D ",,,gnome-user-share"
@@ -71,4 +71,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla"
--=20
2.44.0


