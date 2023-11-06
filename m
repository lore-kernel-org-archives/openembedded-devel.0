Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17635C4167B
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 09:40:39 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.50182.1699263632916938707
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 01:40:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout07.t-online.de (Postfix) with SMTP id 367BD3479F
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 10:40:31 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzw5u-2nSpof0; Mon, 6 Nov 2023 10:40:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] nv-codec-headers: Upgrade 12.0.16.0 -> 12.1.14.0
Date: Mon,  6 Nov 2023 10:40:54 +0100
Message-ID: <20231106094054.1130990-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699263630-D3FFCD5E-EEFC1242/0/0 CLEAN NORMAL
X-TOI-MSGID: 64b5e54c-2e7d-4e90-a35b-cd9f137dfd6a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106406

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...codec-headers_12.0.16.0.bb =3D> nv-codec-headers_12.1.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-multimedia/recipes-multimedia/nv-codec-headers/{nv-codec-hea=
ders_12.0.16.0.bb =3D> nv-codec-headers_12.1.14.0.bb} (91%)

diff --git a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec=
-headers_12.0.16.0.bb b/meta-multimedia/recipes-multimedia/nv-codec-heade=
rs/nv-codec-headers_12.1.14.0.bb
similarity index 91%
rename from meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-=
headers_12.0.16.0.bb
rename to meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-he=
aders_12.1.14.0.bb
index 4bff4f24b..36885f29e 100644
--- a/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.0.16.0.bb
+++ b/meta-multimedia/recipes-multimedia/nv-codec-headers/nv-codec-header=
s_12.1.14.0.bb
@@ -7,7 +7,7 @@ SRC_URI =3D " \
     git://git.videolan.org/git/ffmpeg/nv-codec-headers.git;branch=3Dmast=
er;protocol=3Dhttps \
     file://0001-Makefile-add-clean-target.patch \
 "
-SRCREV =3D "c5e4af74850a616c42d39ed45b9b8568b71bf8bf"
+SRCREV =3D "1889e62e2d35ff7aa9baca2bceb14f053785e6f1"
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OEMAKE =3D "PREFIX=3D${prefix} DESTDIR=3D${D} LIBDIR=3D${baselib}"
--=20
2.42.0


