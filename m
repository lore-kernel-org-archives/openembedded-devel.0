Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C42B4C433F5
	for <webhook@archiver.kernel.org>; Tue, 29 Mar 2022 08:35:15 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web09.4350.1648542914686547731
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 01:35:15 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22,
 mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout12.t-online.de (Postfix) with SMTP id 33ABFEAD2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 29 Mar 2022 10:34:34 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.227.151]) by fwd85.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nZ7JB-2BG8Wn0; Tue, 29 Mar 2022 10:34:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-multimedia][PATCH] crossguid: update
Date: Tue, 29 Mar 2022 10:34:27 +0200
Message-Id: <20220329083427.402421-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1648542873-00014AB5-FB96CBBE/0/0 CLEAN NORMAL
X-TOI-MSGID: 3aa49c2a-4c92-45f2-982d-de09c8bb3d77
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Mar 2022 08:35:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96252

v0.2.2 is from 2017. meanwhile there have been some important improvement=
s
and also some renaming of headers and such but unfortunately there has ne=
ver
been a new release. Kodi uses the latest crossguid. Update it accordingly=
 to
avoid having to patch Kodi.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-support/crossguid/crossguid_0.2.2.bb            | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb=
 b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
index bc54ea9fe..b496531ab 100644
--- a/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
+++ b/meta-multimedia/recipes-support/crossguid/crossguid_0.2.2.bb
@@ -7,14 +7,10 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1373274bc8d8001edc54933919f36=
f68"
 DEPENDS +=3D "util-linux"
=20
-SRCREV =3D "5b45cdd9a56ca9da35ee0f8845cb4e2603d245dc"
+SRCREV =3D "ca1bf4b810e2d188d04cb6286f957008ee1b7681"
 SRC_URI =3D "git://github.com/graeme-hill/crossguid;protocol=3Dhttps;bra=
nch=3Dmaster"
=20
 S =3D "${WORKDIR}/git"
=20
 inherit cmake
=20
-do_install() {
-	install -D -m 0644 ${B}/libxg.a ${D}${libdir}/libxg.a
-	install -D -m 0644 ${S}/Guid.hpp ${D}${includedir}/Guid.hpp
-}
--=20
2.25.1


