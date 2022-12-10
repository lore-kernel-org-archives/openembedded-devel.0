Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A211C4332F
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 08:40:21 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.11022.1670661612280284689
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Dec 2022 00:40:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout12.t-online.de (Postfix) with SMTP id 265F81F929
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 09:40:10 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3vOz-0e9xr70; Sat, 10 Dec 2022 09:40:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3] editorconfig: add recipe
Date: Sat, 10 Dec 2022 09:40:03 +0100
Message-Id: <20221210084003.40568-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670661610-4B7F2689-DD5D6235/0/0 CLEAN NORMAL
X-TOI-MSGID: d0336608-d4a9-41c8-a367-c2b7a17de72a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 08:40:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100023

It is needed by gnome-text-editor

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../editorconfig/editorconfig-core-c_0.12.5.bb    | 15 +++++++++++++++
 1 file changed, 15 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig-co=
re-c_0.12.5.bb

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.=
12.5.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.=
5.bb
new file mode 100644
index 000000000..da5c07ff2
--- /dev/null
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_0.12.5.bb
@@ -0,0 +1,15 @@
+SUMMARY =3D "EditorConfig helps maintain consistent coding styles across=
 various editors and IDEs."
+HOMEPAGE =3D "https://https://editorconfig.org"
+SECTION =3D "libs"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df515fff3ea0a2b9797eda60d83c0e=
5ca"
+
+SRC_URI =3D "git://github.com/editorconfig/editorconfig-core-c.git;proto=
col=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "f6b0ca395149b5a2fbd56a488cae30306a58170f"
+
+inherit cmake
+
+DEPENDS =3D "pcre2"
+
--=20
2.34.1


