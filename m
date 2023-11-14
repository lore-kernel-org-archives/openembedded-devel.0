Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 253C5C4332F
	for <webhook@archiver.kernel.org>; Tue, 14 Nov 2023 12:15:21 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.11184.1699964117997603922
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Nov 2023 04:15:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout02.t-online.de (Postfix) with SMTP id D64EE1B8F3
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 13:15:15 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.170.36]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r2sJz-22yTAX0; Tue, 14 Nov 2023 13:15:11 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gnome-control-center: Add rdepends
Date: Tue, 14 Nov 2023 13:15:43 +0100
Message-ID: <20231114121543.2717-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699964112-CDFF8957-FC823E06/0/0 CLEAN NORMAL
X-TOI-MSGID: ba064176-2e9f-4413-a199-877fb666d153
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Nov 2023 12:15:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106714

Add cups-pk-helper and system-config-printer to rdepends
Both are needed to get printer config working out of the box

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_45.1.bb           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.1.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.1.bb
index 123c0b89f..8402fcea9 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.1.bb
@@ -67,4 +67,4 @@ FILES:${PN} +=3D " \
=20
 FILES:${PN}-dev +=3D "${datadir}/gettext"
=20
-RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla"
+RDEPENDS:${PN} +=3D "gsettings-desktop-schemas tecla system-config-print=
er cups-pk-helper"
--=20
2.42.0


