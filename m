Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5ABCC4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 18:57:07 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.1364.1672340225009610218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 10:57:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id DAD8EDF59
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 19:57:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.205]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAy5J-2wZNDt0; Thu, 29 Dec 2022 19:56:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] wireplumber: dont start systemd system service by default
Date: Thu, 29 Dec 2022 19:56:46 +0100
Message-Id: <20221229185646.46055-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672340217-E20B2E65-AD807B93/0/0 CLEAN NORMAL
X-TOI-MSGID: b8b69970-9338-4930-8e2d-866f078fe184
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 18:57:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100304

If wireplumber gets started with user services and socket activation,
what I guess is the regular way, the system service fails to come up at b=
oot

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/wireplumber/wireplumber_0.4.13.bb       | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0=
.4.13.bb b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4=
.13.bb
index 166130513..0203f8bf5 100644
--- a/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
+++ b/meta-multimedia/recipes-multimedia/wireplumber/wireplumber_0.4.13.b=
b
@@ -124,7 +124,6 @@ PACKAGES =3D+ "\
=20
 PACKAGES_DYNAMIC =3D "^${PN}-modules.*"
=20
-SYSTEMD_SERVICE:${PN} =3D "wireplumber.service"
 CONFFILES:${PN} +=3D " \
     ${datadir}/wireplumber/wireplumber.conf \
     ${datadir}/wireplumber/*.lua.d/* \
@@ -134,7 +133,7 @@ CONFFILES:${PN} +=3D " \
 # itself to become a daemon, in practice, the PipeWire daemon is used.
 RRECOMMENDS:${PN} +=3D "pipewire ${PN}-scripts ${PN}-modules-meta"
=20
-FILES:${PN} +=3D "${systemd_user_unitdir}"
+FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir}"
=20
 FILES:libwireplumber =3D " \
     ${libdir}/libwireplumber-*.so.* \
--=20
2.34.1


