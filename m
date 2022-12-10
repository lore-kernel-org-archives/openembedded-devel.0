Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C0AC4167B
	for <webhook@archiver.kernel.org>; Sat, 10 Dec 2022 05:22:10 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.9041.1670649724329326986
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Dec 2022 21:22:04 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout12.t-online.de (Postfix) with SMTP id 56567BE43
	for <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 06:22:02 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.225.165]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p3sJB-1hOgEd0; Sat, 10 Dec 2022 06:21:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/6] editorconfig: add recipe
Date: Sat, 10 Dec 2022 06:21:34 +0100
Message-Id: <20221210052137.303984-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221210052137.303984-1-f_l_k@t-online.de>
References: <20221210052137.303984-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670649717-E67DE07E-75DF9B35/0/0 CLEAN NORMAL
X-TOI-MSGID: 42077ea8-1298-41d7-a4eb-aa2c17f714a9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Dec 2022 05:22:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100012

It is needed by gnome-text-editor

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../editorconfig/editorconfig-core-c_git.bb      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/editorconfig/editorconfig-co=
re-c_git.bb

diff --git a/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_gi=
t.bb b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb
new file mode 100644
index 000000000..8b337d307
--- /dev/null
+++ b/meta-oe/recipes-devtools/editorconfig/editorconfig-core-c_git.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "EditorConfig helps maintain consistent coding styles across=
 various editors and IDEs."
+HOMEPAGE =3D "https://https://editorconfig.org"
+SECTION =3D "libs"
+LICENSE =3D "BSD-2-Clause"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db5d973344b3c7bbf7535f0e6e002d=
017"
+
+SRC_URI =3D "git://github.com/editorconfig/editorconfig-core-c.git;proto=
col=3Dhttps;branch=3Dmaster"
+
+S =3D "${WORKDIR}/git"
+PV =3D "0.12.5"
+SRCREV =3D "f6b0ca395149b5a2fbd56a488cae30306a58170f"
+
+inherit cmake
+
+DEPENDS =3D "pcre2"
+
--=20
2.34.1


