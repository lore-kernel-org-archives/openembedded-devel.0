Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 143FFC636CC
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 09:28:24 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.6358.1676107699514593913
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 01:28:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd78.dcpf.telekom.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout10.t-online.de (Postfix) with SMTP id 6425822F3E
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 10:28:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.42.158]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pQmB7-28ws2z0; Sat, 11 Feb 2023 10:28:17 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] pipewire-media-session: update 0.4.1 -> 0.4.2
Date: Sat, 11 Feb 2023 10:27:56 +0100
Message-Id: <20230211092756.19039-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676107697-C6FEC4E4-9B4E2369/0/0 CLEAN NORMAL
X-TOI-MSGID: c01b1283-72f9-4876-9b93-6a3fb7818cb0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:28:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101020

Media Session 0.4.2 (2023-01-20)

This is a small release to keep the dead corpse walking... Repeated attem=
pts to
shoot it in the head seem to have failed (We don't think it is running wi=
th a lot
of brains left). It does not look pretty and we don't know yet when it wi=
ll finally
stay down. What we do know is that some creatures (humans?) have been sec=
retly
feeding it with their brain cells and as such, here we are...

Anyway, it contains some minor patches for some organ (memory?) leaks. It=
 also adds
some fixes to make things stumble on (compile?) and make disturbing slurp=
ing sounds
again (work?) with the latest PipeWire versions.

Seriously.. back off.. don't become a victim... use Wireplumber.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...e-media-session_0.4.1.bb =3D> pipewire-media-session_0.4.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/pipewire/{pipewire-media-sessi=
on_0.4.1.bb =3D> pipewire-media-session_0.4.2.bb} (92%)

diff --git a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-s=
ession_0.4.1.bb b/meta-multimedia/recipes-multimedia/pipewire/pipewire-me=
dia-session_0.4.2.bb
similarity index 92%
rename from meta-multimedia/recipes-multimedia/pipewire/pipewire-media-se=
ssion_0.4.1.bb
rename to meta-multimedia/recipes-multimedia/pipewire/pipewire-media-sess=
ion_0.4.2.bb
index da8d1d7ad..8ae062413 100644
--- a/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.1.bb
+++ b/meta-multimedia/recipes-multimedia/pipewire/pipewire-media-session_=
0.4.2.bb
@@ -13,7 +13,7 @@ DEPENDS =3D " \
 SRC_URI =3D "git://gitlab.freedesktop.org/pipewire/media-session.git;pro=
tocol=3Dhttps;branch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "e5d5cf2404786af8bcc40bdb8a2962bef4ec18b6"
+SRCREV =3D "80dae7e24bec02b2befe09a72fbac6e2b38ccb5c"
=20
 inherit meson pkgconfig
 # https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/2952
--=20
2.34.1


