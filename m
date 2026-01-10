Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4188D277F1
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 15:55:44 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10890.1768060536019442989
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 07:55:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 07D3EE3E7
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 16:55:34 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.238.199]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vebJL-1n8VWL0; Sat, 10 Jan 2026 16:55:31 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libcanberra: add runtime recommendation for sound-theme-freedesktop
Date: Sat, 10 Jan 2026 16:55:24 +0100
Message-ID: <20260110155524.177848-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768060531-FE7FB939-58BE5114/0/0 CLEAN NORMAL
X-TOI-MSGID: 57108663-2945-4a36-b6cf-92ac3626b596
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 15:55:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123331

Required to actually play event sounds

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b=
/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
index b7eb50e463..19900d6cbe 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -45,3 +45,4 @@ FILES:${PN}-dev +=3D "${datadir}/vala"
 # libcanberra-gtk3-module.so ships a symlink to libcanberra-gtk-module.s=
o
 INSANE_SKIP:${PN} =3D "dev-so"
=20
+RRECOMMENDS:${PN} =3D "sound-theme-freedesktop"
--=20
2.52.0


