Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8856C77B7A
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.17457.1679731394230868032
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 4289D1BA05
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:12 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrm-0RoPhR0; Sat, 25 Mar 2023 09:03:10 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 09/32] gnome-chess: update 43.2 -> 44.0
Date: Sat, 25 Mar 2023 09:02:33 +0100
Message-Id: <20230325080256.923752-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731390-8556AC08-A4791BAF/0/0 CLEAN NORMAL
X-TOI-MSGID: b37ceb37-08e4-4306-a327-979d019a7b7b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101722

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../{gnome-chess_43.2.bb =3D> gnome-chess_44.0.bb}         | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb =3D> gn=
ome-chess_44.0.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
index 343135bfa..d9727ec1c 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_44.0.bb
@@ -22,13 +22,12 @@ DEPENDS =3D " \
=20
 RRECOMMENDS:${PN}  =3D "gnuchess"
=20
-SRC_URI =3D "git://github.com/GNOME/gnome-chess.git;protocol=3Dhttps;nob=
ranch=3D1"
+SRC_URI[archive.sha256sum] =3D "734f092d95fc60409eeaca3427b5a48cb9b599da=
11995119d85baa99653e0292"
=20
-inherit meson pkgconfig gobject-introspection gtk-icon-cache vala featur=
es_check mime-xdg gsettings
+inherit gnomebase meson pkgconfig gobject-introspection gtk-icon-cache v=
ala features_check mime-xdg gsettings
=20
+GNOMEBASEBUILDCLASS =3D "meson"
+GTKIC_VERSION =3D '4'
 GIR_MESON_OPTION =3D ""
=20
-S =3D "${WORKDIR}/git"
-SRCREV =3D "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
-
 FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


