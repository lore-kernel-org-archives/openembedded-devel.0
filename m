Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 686ECC36010
	for <webhook@archiver.kernel.org>; Sat,  5 Apr 2025 07:02:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web10.2115.1743836548573299273
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 05 Apr 2025 00:02:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout07.t-online.de (Postfix) with SMTP id 3E2A91FF4
	for <openembedded-devel@lists.openembedded.org>; Sat,  5 Apr 2025 09:02:26 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.168.218]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u0xXr-0u7tvF0; Sat, 5 Apr 2025 09:02:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] evolution-data-server: fix lack of whitespace around the assignment
Date: Sat,  5 Apr 2025 09:02:09 +0200
Message-ID: <20250405070210.1416757-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743836543-0AFFACE7-2311F847/0/0 CLEAN NORMAL
X-TOI-MSGID: d2aa2864-03f3-4fdf-8007-e43761af4d49
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 05 Apr 2025 07:02:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116597

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.bb              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.bb b/meta-gnome/recipes-gnome/evolution-data-server/evolution-da=
ta-server.bb
index 713d5ae289..c3c4e3eae5 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.bb
@@ -55,7 +55,7 @@ PACKAGECONFIG[weather] =3D "-DENABLE_WEATHER=3DON,-DENA=
BLE_WEATHER=3DOFF,libgweather4"
 LDFLAGS +=3D "-lpthread -lgmodule-2.0 -lgthread-2.0"
=20
 # invokes libraries from build host
-GI_DATA_ENABLED:libc-musl=3D"False"
+GI_DATA_ENABLED:libc-musl =3D "False"
=20
 do_configure:append () {
     cp ${UNPACKDIR}/iconv-detect.h ${S}/src
--=20
2.49.0


