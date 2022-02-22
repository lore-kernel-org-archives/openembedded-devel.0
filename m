Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90186C433F5
	for <webhook@archiver.kernel.org>; Tue, 22 Feb 2022 06:42:50 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web12.9740.1645512168995019553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Feb 2022 22:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84,
 mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout09.t-online.de (Postfix) with SMTP id 10CA4E828
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Feb 2022 07:42:47 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.173.113]) by fwd81.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nMOsn-1k2ZNp0; Tue, 22 Feb 2022 07:42:45 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH 1/2] libxfce4ui: disable vala
Date: Tue, 22 Feb 2022 07:42:37 +0100
Message-Id: <20220222064238.2554257-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1645512165-0000BD0E-77D542A1/0/0 CLEAN NORMAL
X-TOI-MSGID: d79c72d2-39a4-4514-90c0-65bd3129d6ff
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Feb 2022 06:42:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95440

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb b/met=
a-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
index a8ede836e..2c6c7424e 100644
--- a/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
+++ b/meta-xfce/recipes-xfce/libxfce4ui/libxfce4ui_4.16.1.bb
@@ -13,6 +13,7 @@ SRC_URI +=3D "file://0001-libxfce4kbd-private-xfce4-key=
board-shortcuts.xml-fix.pat
 SRC_URI[sha256sum] =3D "d96946ae5af6bf078dda415419e0021909f763ee0020b42f=
3e26f603e51585f6"
=20
 EXTRA_OECONF +=3D "--with-vendor-info=3D${DISTRO}"
+EXTRA_OECONF +=3D "--disable-vala"
=20
 PACKAGECONFIG ??=3D ""
 PACKAGECONFIG[gladeui2] =3D "--enable-gladeui2,--disable-gladeui2,glade"
--=20
2.25.1


