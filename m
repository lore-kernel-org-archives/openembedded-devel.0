Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51ED4D43FFB
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:29:46 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.36701.1731922178175713271
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:29:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 3EEF76D6
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:29:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.25]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tCy4a-4UYXg10; Mon, 18 Nov 2024 10:29:32 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] gdm: fix service start
Date: Mon, 18 Nov 2024 10:31:59 +0100
Message-ID: <20241118093159.1890-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1731922172-4A7ECDD7-3C1410A6/0/0 CLEAN NORMAL
X-TOI-MSGID: 38e09448-54a8-494d-9254-48c240b9988f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113866

gdm doesn't require to create a home directory but it needs to be member =
of
the video group to work properly

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_47.0.bb
index 94836cdbc..caf882d02 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -41,7 +41,7 @@ do_install:append() {
 }
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --home ${localstatedi=
r}/lib/gdm --user-group gdm"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --groups video gdm"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
=20
--=20
2.47.0


