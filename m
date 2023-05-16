Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F9EDC7EE25
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:35:30 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.13606.1684211725962703813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:35:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id CA7611B888
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:35:23 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymPD-33a7Xv0; Tue, 16 May 2023 06:35:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 3/7] fuse3: update 3.12.0 -> 3.14.1
Date: Tue, 16 May 2023 06:34:54 +0200
Message-Id: <20230516043458.6180-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516043458.6180-1-f_l_k@t-online.de>
References: <20230516043458.6180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211723-59FF057F-FCA31050/0/0 CLEAN NORMAL
X-TOI-MSGID: 6f086bb6-3888-41a9-a53d-32b6dec73d48
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:35:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102611

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/fuse/{fuse3_3.12.0.bb =3D> fuse3_3.14.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.12.0.bb =3D> fuse3=
_3.14.1.bb} (96%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb b/meta=
-filesystems/recipes-support/fuse/fuse3_3.14.1.bb
similarity index 96%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.14.1.bb
index b886effc85..c8a820a09d 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.12.0.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.14.1.bb
@@ -13,7 +13,7 @@ LIC_FILES_CHKSUM =3D "file://GPL2.txt;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263 \
=20
 SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.xz \
 "
-SRC_URI[sha256sum] =3D "33b8a92d6f7a88e6a889f0009206933482f48f3eb85d88cf=
09ef551313ac7373"
+SRC_URI[sha256sum] =3D "126919d72b46b3e0eb58a9c6933a2a50c36f2ea69f61fe9e=
78bdba9f463ffa20"
=20
 S =3D "${WORKDIR}/fuse-${PV}"
=20
--=20
2.34.1


