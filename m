Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537CBE7719A
	for <webhook@archiver.kernel.org>; Thu,  9 Jan 2025 22:11:05 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.5371.1736460659164573699
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Jan 2025 14:10:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout12.t-online.de (Postfix) with SMTP id 5F1BAA99
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Jan 2025 23:10:57 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.41]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tW0jw-19CI6r0; Thu, 9 Jan 2025 23:10:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] libde265: update 1.0.12 -> 1.0.15
Date: Thu,  9 Jan 2025 23:11:09 +0100
Message-ID: <20250109221109.375078-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736460656-E0FF6A80-FEE3161B/10/3626336762 SUSPECT URL
X-TOI-MSGID: 6da951ce-aa50-4c95-a3c2-563df3887b94
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Jan 2025 22:11:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114755

- dont use autotools-brokensep
- add PACKAGECONFIG for dec265

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libde265/{libde265_1.0.12.bb =3D> libde265_1.0.15.bb}    | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)
 rename meta-multimedia/recipes-multimedia/libde265/{libde265_1.0.12.bb =3D=
> libde265_1.0.15.bb} (77%)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
similarity index 77%
rename from meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.b=
b
rename to meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index 3c9f899491..280daa4122 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.12.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -9,13 +9,16 @@ LICENSE_FLAGS =3D "commercial"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D695b556799abb2435c97a113cdca5=
12f"
=20
 SRC_URI =3D "git://github.com/strukturag/libde265.git;branch=3Dmaster;pr=
otocol=3Dhttps"
-SRCREV =3D "a267c84707ab264928fa9b86de2ee749c48c318c"
+SRCREV =3D "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
=20
 S =3D "${WORKDIR}/git"
=20
 EXTRA_OECONF =3D "--disable-sherlock265 --disable-dec265"
=20
-inherit autotools-brokensep pkgconfig
+inherit autotools pkgconfig
+
+PACKAGECONFIG ?=3D "dec265"
+PACKAGECONFIG[dec265] =3D "--enable-dec265,--disable-dec265,libsdl2"
=20
 PACKAGES =3D+ "${PN}-tools"
 FILES:${PN}-tools =3D "${bindir}/*"
--=20
2.47.1


