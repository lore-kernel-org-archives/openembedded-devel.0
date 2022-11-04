Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD12C433FE
	for <webhook@archiver.kernel.org>; Fri,  4 Nov 2022 17:43:52 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.648.1667583822961705619
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Nov 2022 10:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout03.t-online.de (Postfix) with SMTP id 89295773D
	for <openembedded-devel@lists.openembedded.org>; Fri,  4 Nov 2022 18:43:40 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.191]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1or0jC-0Jeikz0; Fri, 4 Nov 2022 18:43:38 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] pugixml: upgrade 1.12 -> 1.13
Date: Fri,  4 Nov 2022 18:43:29 +0100
Message-Id: <20221104174329.3403952-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667583818-50A2B689-71048641/0/0 CLEAN NORMAL
X-TOI-MSGID: 3713eb21-2d14-4665-8136-b805f46def73
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Nov 2022 17:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99430

v1.13 2022-11-01
Maintenance release. Changes:

Improvements:
- xml_attribute::set_value, xml_node::set_value and xml_text::set now hav=
e overloads that accept pointer to non-null-terminated string and size
- Improve performance of tree traversal when using compact mode (PUGIXML_=
COMPACT)

Bug fixes:
- Fix error handling in xml_document::save_file that could result in the =
function succeeding while running out of disk space
- Fix memory leak during error handling of some out-of-memory conditions =
during xml_document::load

Compatibility improvements:
- Fix exported symbols in CMake DLL builds when using CMake
- Fix exported symbols in CMake shared object builds when using -fvisibil=
ity=3Dhidden

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pugixml/{pugixml_1.12.bb =3D> pugixml_1.13.bb}                | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.12.bb =3D> pugixml_1.=
13.bb} (90%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb b/meta-oe/r=
ecipes-devtools/pugixml/pugixml_1.13.bb
similarity index 90%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.13.bb
index b09c46a66..7df8fc43b 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.12.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.13.bb
@@ -10,7 +10,7 @@ LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://readme.txt;beginline=3D29;endline=3D52;md5=3D=
d11b640daff611273752ec136394347c"
=20
 SRC_URI =3D "https://github.com/zeux/${BPN}/releases/download/v${PV}/${B=
P}.tar.gz"
-SRC_URI[sha256sum] =3D "fd6922a4448ec2f3eb9db415d10a49660e5d84ce20ce66b8=
a07e72ffc84270a7"
+SRC_URI[sha256sum] =3D "40c0b3914ec131485640fa57e55bf1136446026b41db91c1=
bef678186a12abbe"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/zeux/${BPN}/releases"
=20
--=20
2.34.1


