Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0A1BE75455
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 12:31:59 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.107093.1696336311122809848
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout02.t-online.de (Postfix) with SMTP id 9659627CE5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Oct 2023 14:31:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.171.156]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qneZ0-1wY1In0; Tue, 3 Oct 2023 14:31:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] pugixml: Update 1.13 -> 1.14
Date: Tue,  3 Oct 2023 14:31:50 +0200
Message-ID: <20231003123150.1115587-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1696336306-3CFF6EA2-7C18B914/0/0 CLEAN NORMAL
X-TOI-MSGID: f2c6afe4-fc6b-4006-9e21-7b5efed942c1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 12:31:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105321

Improvements:

xml_attribute::set_name and xml_node::set_name now have overloads that ac=
cept pointer to non-null-terminated string and size
Implement parse_merge_pcdata parsing mode in which PCDATA contents is mer=
ged into a single node when original document had comments that were skip=
ped during parsing
xml_document::load_file now returns a more consistent error status when g=
iven a path to a folder
Bug fixes:

Fix assertion in XPath number=E2=86=92string conversion when using non-En=
glish locales
Fix PUGIXML_STATIC_CRT CMake option to correctly select static CRT when u=
sing MSVC and recent CMake
Compatibility improvements:

Fix GCC 2.95/3.3 builds
Fix CMake 3.27 deprecation warnings
Fix XCode 14 sprintf deprecation warning when compiling in C++03 mode
Fix clang/gcc warnings -Wweak-vtables, -Wreserved-macro-identifier
Thanks to @DavidKorczynski, @jiangqucheng, @SoapGentoo, @asmaloney, @Arch=
XUser, @stefanroellin and @vineethkuttan for contributions!

- license checksum has changed because of copyright year

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../pugixml/{pugixml_1.13.bb =3D> pugixml_1.14.bb}              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/pugixml/{pugixml_1.13.bb =3D> pugixml_1.=
14.bb} (86%)

diff --git a/meta-oe/recipes-devtools/pugixml/pugixml_1.13.bb b/meta-oe/r=
ecipes-devtools/pugixml/pugixml_1.14.bb
similarity index 86%
rename from meta-oe/recipes-devtools/pugixml/pugixml_1.13.bb
rename to meta-oe/recipes-devtools/pugixml/pugixml_1.14.bb
index 7df8fc43b..458958edf 100644
--- a/meta-oe/recipes-devtools/pugixml/pugixml_1.13.bb
+++ b/meta-oe/recipes-devtools/pugixml/pugixml_1.14.bb
@@ -7,10 +7,10 @@ data-driven tree queries."
 HOMEPAGE =3D "https://pugixml.org/"
=20
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://readme.txt;beginline=3D29;endline=3D52;md5=3D=
d11b640daff611273752ec136394347c"
+LIC_FILES_CHKSUM =3D "file://readme.txt;beginline=3D29;endline=3D52;md5=3D=
ad370df61d83846cf9e4726244671201"
=20
 SRC_URI =3D "https://github.com/zeux/${BPN}/releases/download/v${PV}/${B=
P}.tar.gz"
-SRC_URI[sha256sum] =3D "40c0b3914ec131485640fa57e55bf1136446026b41db91c1=
bef678186a12abbe"
+SRC_URI[sha256sum] =3D "2f10e276870c64b1db6809050a75e11a897a8d7456c4be5c=
6b2e35a11168a015"
=20
 UPSTREAM_CHECK_URI =3D "https://github.com/zeux/${BPN}/releases"
=20
--=20
2.42.0


