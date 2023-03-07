Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4498C6FD1B
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 02:05:41 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.5152.1678154731455963172
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 18:05:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 585751B4BD
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Mar 2023 03:05:29 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.81]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pZMhY-3Q6Tti0; Tue, 7 Mar 2023 03:05:16 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH 2/2] libavif: add recipe
Date: Tue,  7 Mar 2023 03:05:08 +0100
Message-Id: <20230307020508.3897850-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307020508.3897850-1-f_l_k@t-online.de>
References: <20230307020508.3897850-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1678154716-16FFC778-FAB3B942/0/0 CLEAN NORMAL
X-TOI-MSGID: 406d0034-a13a-4a9b-97aa-af3b9b4727a5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Mar 2023 02:05:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101401

libavif is a needed dependency to add av1 support for the upcoming webkit=
gtk release

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libavif/libavif_0.11.1.bb | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libavif/libavif_0.=
11.1.bb

diff --git a/meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb=
 b/meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb
new file mode 100644
index 000000000..f01024e8a
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libavif/libavif_0.11.1.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "This library aims to be a friendly, portable C implementati=
on of the AV1 Image File Format"
+HOMEPAGE =3D "https://github.com/AOMediaCodec/libavif"
+SECTION =3D "libs"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dc528b75b07425b5c1d2e34de98c39=
7b5"
+
+SRC_URI =3D "git://github.com/AOMediaCodec/libavif.git;protocol=3Dhttps;=
branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "6ab53189045e7a6fe0bd93d14977b2a4f8efa5e9"
+
+DEPENDS =3D "dav1d"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DAVIF_CODEC_DAV1D=3DON"
--=20
2.34.1


