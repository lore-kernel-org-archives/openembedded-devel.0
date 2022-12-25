Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78971C4332F
	for <webhook@archiver.kernel.org>; Sun, 25 Dec 2022 13:41:33 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.118088.1671975692078496693
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 05:41:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout09.t-online.de (Postfix) with SMTP id 88B9D1A4C8
	for <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 14:41:23 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.127]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9RFd-0vWWKQ0; Sun, 25 Dec 2022 14:41:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] flatpak: add runtime dependency on flatpak-xdg-utils
Date: Sun, 25 Dec 2022 14:40:52 +0100
Message-Id: <20221225134052.1667387-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221225134052.1667387-1-f_l_k@t-online.de>
References: <20221225134052.1667387-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671975677-2588998D-602B373E/0/0 CLEAN NORMAL
X-TOI-MSGID: 32314e91-c4e2-4abe-a5ee-06c5e765d154
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 25 Dec 2022 13:41:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100227

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.1.bb
index a906e6761..04f4c532a 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb
@@ -39,6 +39,7 @@ RDEPENDS:${PN} =3D " \
     bubblewrap \
     ca-certificates \
     dconf \
+    flatpak-xdg-utils \
 "
=20
 GIR_MESON_OPTION =3D ""
--=20
2.34.1


