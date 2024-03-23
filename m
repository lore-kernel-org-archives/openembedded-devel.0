Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0034BCD1280
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 08:41:26 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.5317.1711183282200049697
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Mar 2024 01:41:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout03.t-online.de (Postfix) with SMTP id 4ADA25AAC1
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 09:41:18 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.162]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rnwwE-1MMRGj0; Sat, 23 Mar 2024 09:41:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 09/13] gnome-chess: update 43.2 -> 46.0
Date: Sat, 23 Mar 2024 09:41:34 +0100
Message-ID: <20240323084138.178281-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240323084138.178281-1-f_l_k@t-online.de>
References: <20240323084138.178281-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1711183274-0CA7E850-F8A1D631/0/0 CLEAN NORMAL
X-TOI-MSGID: d047d0c2-1fcc-4127-9f28-c1686a057d7b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Mar 2024 08:41:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109541

46.0 - March 14, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

- Updated translations

46.beta - February 9, 2024
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D

- Highlight relevant pieces when king is checked (#46, #78, Mohammadreza =
Shabani)
- Change keyboard shortcut for viewing previous/next moves (#67, Vancha)
- Change tooltips to follow HIG guidelines (#75, Automeris naranja)
- Improve style of message dialogs (#77, Felipe Kinoshita)
- Fix "Time Limit" not translated in new game window (!47, Sabri =C3=9Cna=
l)
- Improvements to main menu (!48, Automeris naranja)
- Improve shortcut names in help overlay (!51, Automeris naranja)
- Updated appstream metainfo (!54, Sabri =C3=9Cnal)
- Fix broken links in user help (Andre Klapper)
- Updated translations

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-chess/{gnome-chess_43.2.bb =3D> gnome-chess_46.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gnome-chess/{gnome-chess_43.2.bb =3D> gn=
ome-chess_46.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
rename to meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
index 58e72efb7..bb53b58df 100644
--- a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_46.0.bb
@@ -29,6 +29,6 @@ inherit meson pkgconfig gobject-introspection gtk-icon-=
cache vala features_check
 GIR_MESON_OPTION =3D ""
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "de47d07ec6fc828b2668ca6ee59fe9bdfa9dc1d6"
+SRCREV =3D "c3625ee59ab3acfd7566ef04300b15ddbadaaac3"
=20
 FILES:${PN} +=3D "${datadir}"
--=20
2.44.0


