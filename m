Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776F6C4332F
	for <webhook@archiver.kernel.org>; Mon, 26 Dec 2022 06:19:18 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.131361.1672035553188058955
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Dec 2022 22:19:13 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout06.t-online.de (Postfix) with SMTP id 0B0401ABEF
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 07:19:11 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.166]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p9gpE-1EIWLx0; Mon, 26 Dec 2022 07:19:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [RFC][meta-multimedia][PATCH] wireplumber: build with dbus support by default
Date: Mon, 26 Dec 2022 07:18:56 +0100
Message-Id: <20221226061856.206386-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672035545-09691417-6C05637D/0/0 CLEAN NORMAL
X-TOI-MSGID: 2023e724-ce79-4375-ba86-e138e3aa56f2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Dec 2022 06:19:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100241

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/wireplumber/wireplumber_0.4.13.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.13.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.13.bb
index 5277626fa..166130513 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
@@ -36,7 +36,7 @@ EXTRA_OEMESON +=3D " \
     -Dtests=3Dfalse \
 "
=20
-PACKAGECONFIG ??=3D "\
+PACKAGECONFIG ??=3D " dbus \
     ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd systemd-=
system-service systemd-user-service', '', d)} \
 "
=20
--=20
2.34.1


