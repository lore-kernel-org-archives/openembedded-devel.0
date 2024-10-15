Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205BED1815E
	for <webhook@archiver.kernel.org>; Tue, 15 Oct 2024 00:34:37 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.2122.1728952475736390356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 17:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout03.t-online.de (Postfix) with SMTP id ED823444FE
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 02:34:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.230.111]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1t0VW8-0NQBHN0; Tue, 15 Oct 2024 02:34:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2 1/2] fastfloat: add recipe
Date: Tue, 15 Oct 2024 02:36:26 +0200
Message-ID: <20241015003627.1014058-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1728952468-7EFFB5E0-256BABB7/0/0 CLEAN NORMAL
X-TOI-MSGID: d14e56f8-fa08-4523-b846-ec718085b7d5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Oct 2024 00:34:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112913

fastfloat is needed to compile libplacebo with clang

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-devtools/fastfloat/fastfloat_5.2.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb

diff --git a/meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb b/meta=
-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb
new file mode 100644
index 000000000..b121a97b2
--- /dev/null
+++ b/meta-oe/recipes-devtools/fastfloat/fastfloat_5.2.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "fast_float number parsing library: 4x faster than strtod"
+HOMEPAGE =3D "https://github.com/fastfloat/fast_float"
+LICENSE =3D "Apache-2.0 & BSL-1.0 & MIT"
+LIC_FILES_CHKSUM =3D " \
+	file://LICENSE-MIT;md5=3D32b11d50c7d9788d4270f6a83f3e68eb \
+	file://LICENSE-APACHE;md5=3D81db248e90379bcfc0582b578b009bc3 \
+	file://LICENSE-BOOST;md5=3D2c7a3fa82e66676005cd4ee2608fd7d2 \
+"
+
+SRC_URI =3D "git://github.com/fastfloat/fast_float.git;protocol=3Dhttps;=
branch=3Dmain"
+
+SRCREV =3D "2b2395f9ac836ffca6404424bcc252bff7aa80e4"
+S =3D "${WORKDIR}/git"
+
+inherit cmake
--=20
2.47.0


