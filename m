Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA712C636D4
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 17:18:22 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.89252.1675790301136267363
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Feb 2023 09:18:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout02.t-online.de (Postfix) with SMTP id 646E09ED8
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Feb 2023 18:18:18 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.4]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pPRbi-0ylo820; Tue, 7 Feb 2023 18:18:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 2/2] libdeflate: add recipe
Date: Tue,  7 Feb 2023 18:17:55 +0100
Message-Id: <20230207171755.159316-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230207171755.159316-1-f_l_k@t-online.de>
References: <20230207171755.159316-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1675790294-B2834007-72843907/0/0 CLEAN NORMAL
X-TOI-MSGID: e4db927d-7615-4942-813a-ec8420dc9112
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Feb 2023 17:18:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100963

libdeflate is an optional dependency for libtiff

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libdeflate/libdeflate_1.17.bb                 | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/libdeflate/libdeflate_1.17.b=
b

diff --git a/meta-oe/recipes-extended/libdeflate/libdeflate_1.17.bb b/met=
a-oe/recipes-extended/libdeflate/libdeflate_1.17.bb
new file mode 100644
index 000000000..9cd6baa5b
--- /dev/null
+++ b/meta-oe/recipes-extended/libdeflate/libdeflate_1.17.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "libdeflate is a library for fast, whole-buffer DEFLATE-base=
d compression and decompression."
+HOMEPAGE =3D "https://github.com/ebiggers/libdeflate"
+LICENSE =3D "MIT"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7b6977026437092191e9da699ed9f=
780"
+
+DEPENDS +=3D "gzip zlib"
+
+SRC_URI =3D "git://github.com/ebiggers/libdeflate.git;protocol=3Dhttps;b=
ranch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "bd925ae68e99f65d69f20181cb845aaba5c8f098"
+
+inherit cmake pkgconfig
+
--=20
2.34.1


