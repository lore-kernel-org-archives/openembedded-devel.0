Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D603BC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 14:40:13 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.13579.1672843203119858261
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 06:40:03 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout06.t-online.de (Postfix) with SMTP id 90B658A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  4 Jan 2023 15:40:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.80]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pD4vw-1zGJEX0; Wed, 4 Jan 2023 15:40:00 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-xfce][PATCH] thunar: add tumbler to RRECOMMENDS
Date: Wed,  4 Jan 2023 15:39:46 +0100
Message-Id: <20230104143946.1296570-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672843200-6BFFB9DD-6EAE9CAB/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b7220b7-d36f-4c1b-a21d-e5ca4e314498
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 14:40:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100398

In a dbus session thunar requests tumbler for thumbnailing support

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb b/meta-xfce/r=
ecipes-xfce/thunar/thunar_4.18.0.bb
index 3c05dacc6..508416b03 100644
--- a/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
+++ b/meta-xfce/recipes-xfce/thunar/thunar_4.18.0.bb
@@ -28,4 +28,8 @@ FILES:${PN} +=3D " \
     ${datadir}/xfce4/panel/plugins/* \
 "
=20
-RRECOMMENDS:${PN} =3D "gvfs gvfsd-trash"
+RRECOMMENDS:${PN} =3D " \
+    gvfs \
+    gvfsd-trash \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'dbus', 'tumbler', '', d)} \
+"
--=20
2.34.1


