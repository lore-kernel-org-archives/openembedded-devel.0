Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19514C6FD1F
	for <webhook@archiver.kernel.org>; Tue,  2 Apr 2024 08:05:29 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.7297.1712045124051551204
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Apr 2024 01:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout09.t-online.de (Postfix) with SMTP id E7AE15072C
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Apr 2024 10:05:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.174.110]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rrZ8z-4aqT1l0; Tue, 2 Apr 2024 10:05:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCHv2] highway: add recipe
Date: Tue,  2 Apr 2024 10:05:39 +0200
Message-ID: <20240402080539.28426-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1712045121-E5FF8915-040A7831/0/0 CLEAN NORMAL
X-TOI-MSGID: 48bf7acf-83b6-435a-b5bf-331e7f9439bf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Apr 2024 08:05:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109778

add google highway as a dependency for libjxl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-extended/highway/highway_1.1.0.bb | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-extended/highway/highway_1.1.0.bb

diff --git a/meta-oe/recipes-extended/highway/highway_1.1.0.bb b/meta-oe/=
recipes-extended/highway/highway_1.1.0.bb
new file mode 100644
index 000000000..ec9d8f742
--- /dev/null
+++ b/meta-oe/recipes-extended/highway/highway_1.1.0.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "Highway is a C++ library for SIMD (Single Instruction, Mult=
iple Data)"
+HOMEPAGE =3D "https://github.com/google/highway/"
+
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2b42edef8fa55315f34f2370b4715=
ca9"
+
+inherit cmake
+
+SRC_URI =3D "git://github.com/google/highway.git;protocol=3Dhttps;branch=
=3Dmaster"
+
+SRCREV =3D "58b52a717469e62b2d9b8eaa2f5dddb44d4a4cbf"
+S =3D "${WORKDIR}/git"
+
+EXTRA_OECMAKE =3D "-DBUILD_TESTING=3D0 -DCMAKE_BUILD_TYPE=3DRelease"
+CXXFLAGS:append:arm =3D " -mfp16-format=3Dieee"
--=20
2.44.0


