Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9668BC4167B
	for <webhook@archiver.kernel.org>; Sat,  4 Nov 2023 07:33:32 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.5555.1699083208367186705
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Nov 2023 00:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 7D2D033076
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Nov 2023 08:33:26 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.35.165]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzB9p-1L3at90; Sat, 4 Nov 2023 08:33:25 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/5] evolution-data-server: Upgrade 3.50.0 -> 3.50.1
Date: Sat,  4 Nov 2023 08:33:46 +0100
Message-ID: <20231104073348.132975-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104073348.132975-1-f_l_k@t-online.de>
References: <20231104073348.132975-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699083205-CF573E93-80B11137/0/0 CLEAN NORMAL
X-TOI-MSGID: 2497c17b-3af0-4e17-831e-ca1a790a0734
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Nov 2023 07:33:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106352

Evolution-Data-Server 3.50.1 2023-10-20
---------------------------------------

Bug Fixes:
	I#494 - Update default calendar colors
	evo-I#1436 - Mail: Correct conversion of UTF-16 encoded text files

Translations:
	Alan Mortensen (da)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../evolution-data-server/evolution-data-server.inc           | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evolution-data-server/evolution-dat=
a-server.inc b/meta-gnome/recipes-gnome/evolution-data-server/evolution-d=
ata-server.inc
index 511cc04af..195b8cb85 100644
--- a/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
+++ b/meta-gnome/recipes-gnome/evolution-data-server/evolution-data-serve=
r.inc
@@ -9,5 +9,5 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D6a6e689d19255c=
f0557f3fe7d7068212 \
=20
 inherit gnomebase upstream-version-is-even
=20
-SRC_URI[archive.sha256sum] =3D "c9f793d99ba188ef8cf2891b8062d7e570e3cba2=
2b8cfc46eb561c6cecc81d3a"
-PV =3D "3.50.0"
+SRC_URI[archive.sha256sum] =3D "91f4ffc38a1b8d2fe8939834449ac541c0bff4a3=
9b444edc2a9529344a28e98a"
+PV =3D "3.50.1"
--=20
2.42.0


