Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FF1C54E41
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 19:09:14 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.1680.1709924948044034956
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 11:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout07.t-online.de (Postfix) with SMTP id 54A88DF96
	for <openembedded-devel@lists.openembedded.org>; Fri,  8 Mar 2024 20:08:23 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.167.68]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rifZu-1zryvx0; Fri, 8 Mar 2024 20:08:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/5] gnome-control-center: fix reproducibility issue
Date: Fri,  8 Mar 2024 20:08:25 +0100
Message-ID: <20240308190829.2442866-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1709924902-2F7FD9FB-4AA0ABF1/0/0 CLEAN NORMAL
X-TOI-MSGID: 02ca6dc5-5323-4d45-9a60-7324ffb46da3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 19:09:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109237

gnome-control-center inserts lines containing ${S} into the source. Altho=
ugh required for
compilation, it affects reproducibility for the src package.

Fix this by simply not packaging the modified source code

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-control-center/gnome-control-center_45.3.bb           | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_45.3.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_45.3.bb
index cb9a57798..96fe9c9ff 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.3.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
45.3.bb
@@ -59,6 +59,8 @@ do_install:append() {
     fi
 }
=20
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/gnome-shell \
--=20
2.44.0


