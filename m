Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 120E9C4829B
	for <webhook@archiver.kernel.org>; Mon, 12 Feb 2024 13:09:39 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.5966.1707743375912576674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Feb 2024 05:09:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd77.aul.t-online.de (fwd77.aul.t-online.de [10.223.144.103])
	by mailout01.t-online.de (Postfix) with SMTP id 0A9A619B4C
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 14:09:33 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.40.44]) by fwd77.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rZW3v-1xRZBJ0; Mon, 12 Feb 2024 14:09:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] flatpak: remove unneeded RDEPENDS
Date: Mon, 12 Feb 2024 14:09:33 +0100
Message-ID: <20240212130933.319770-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1707743371-3FFFC877-AFE685C4/0/0 CLEAN NORMAL
X-TOI-MSGID: 99b265ae-e111-49df-953e-80447e8e4e0c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Feb 2024 13:09:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108710

The build has been modified to use internal copies of bubblewrap and xdg-=
dbus-proxy.
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D9c68079a26b64b836bc6a28e422a1099f48726d2

We can additionally remove the RDEPENDS for these tools, since flatpak no=
w creates
its own copies of the files in /usr/libexec.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.6.bb
index 19f6f45fc..97e57c13d 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.6.bb
@@ -37,11 +37,9 @@ DEPENDS =3D " \
 "
=20
 RDEPENDS:${PN} =3D " \
-    bubblewrap \
     ca-certificates \
     dconf \
     flatpak-xdg-utils \
-    xdg-dbus-proxy \
 "
=20
 GIR_MESON_OPTION =3D "gir"
--=20
2.43.0


