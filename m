Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30B75D43FF5
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:07:06 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.36440.1731920825331837693
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:07:05 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id D8BD33ED
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 10:06:56 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.230.25]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tCxih-3uIHoH0; Mon, 18 Nov 2024 10:06:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] gdm: fix service start
Date: Mon, 18 Nov 2024 10:09:21 +0100
Message-ID: <20241118090921.13936-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1731920816-76FF410B-E265EAFB/0/0 CLEAN NORMAL
X-TOI-MSGID: af7a6511-72eb-45cd-8017-bac2806c6341
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113865

gdm doesn't require to create a home directory but it needs to be member =
of
the video group to work properly

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gdm/gdm_47.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb b/meta-gnome/recipe=
s-gnome/gdm/gdm_47.0.bb
index 94836cdbc..a99589ffc 100644
--- a/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
+++ b/meta-gnome/recipes-gnome/gdm/gdm_47.0.bb
@@ -41,7 +41,7 @@ do_install:append() {
 }
=20
 USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --home ${localstatedi=
r}/lib/gdm --user-group gdm"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --groups=
 video gdm"
=20
 SYSTEMD_SERVICE:${PN} =3D "${BPN}.service"
=20
--=20
2.47.0


