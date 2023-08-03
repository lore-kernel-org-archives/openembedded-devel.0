Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C53BEB64DD
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 05:48:06 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.7995.1691041684511732400
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Aug 2023 22:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id 0E1721175C
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Aug 2023 07:48:02 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.165.3]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qRRBp-1wPUmn0; Thu, 3 Aug 2023 07:48:01 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH] fuse3: update 3.14.1 -> 3.15.1
Date: Thu,  3 Aug 2023 07:47:42 +0200
Message-ID: <20230803054742.11458-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1691041681-29FE1D37-C26E29F1/0/0 CLEAN NORMAL
X-TOI-MSGID: b5928ef6-a9ee-4761-900e-8a61b4515a3b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 05:48:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104210

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/fuse/{fuse3_3.14.1.bb =3D> fuse3_3.15.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-filesystems/recipes-support/fuse/{fuse3_3.14.1.bb =3D> fuse3=
_3.15.1.bb} (95%)

diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.14.1.bb b/meta=
-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
similarity index 95%
rename from meta-filesystems/recipes-support/fuse/fuse3_3.14.1.bb
rename to meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
index c8a820a09d..de2996db18 100644
--- a/meta-filesystems/recipes-support/fuse/fuse3_3.14.1.bb
+++ b/meta-filesystems/recipes-support/fuse/fuse3_3.15.1.bb
@@ -11,9 +11,9 @@ LIC_FILES_CHKSUM =3D "file://GPL2.txt;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263 \
                     file://LGPL2.txt;md5=3D4fbd65380cdd255951079008b3645=
16c \
                     file://LICENSE;md5=3Da55c12a2d7d742ecb41ca9ae0a6ddc6=
6"
=20
-SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.xz \
+SRC_URI =3D "https://github.com/libfuse/libfuse/releases/download/fuse-$=
{PV}/fuse-${PV}.tar.gz \
 "
-SRC_URI[sha256sum] =3D "126919d72b46b3e0eb58a9c6933a2a50c36f2ea69f61fe9e=
78bdba9f463ffa20"
+SRC_URI[sha256sum] =3D "13ef77cda531a21c2131f9576042970e98035c0a5f019abf=
661506efd2d38a4e"
=20
 S =3D "${WORKDIR}/fuse-${PV}"
=20
--=20
2.41.0


