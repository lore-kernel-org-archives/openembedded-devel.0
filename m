Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5D86C61DA4
	for <webhook@archiver.kernel.org>; Sat, 11 Feb 2023 08:25:53 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.5831.1676103948109699593
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Feb 2023 00:25:48 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 5428E1C519
	for <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 09:25:46 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.42.158]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pQlCZ-1NXaHB0; Sat, 11 Feb 2023 09:25:43 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] graphene: remove recipe
Date: Sat, 11 Feb 2023 09:25:36 +0100
Message-Id: <20230211082536.6444-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1676103943-82AE9D99-3679F045/0/0 CLEAN NORMAL
X-TOI-MSGID: 03670348-641f-47a8-b74c-02119437ea61
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 11 Feb 2023 08:25:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101019

It was moved to oe-core

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../graphene/graphene_1.10.8.bb               | 25 -------------------
 1 file changed, 25 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb

diff --git a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb b/meta-=
oe/recipes-graphics/graphene/graphene_1.10.8.bb
deleted file mode 100644
index 1bbe7ecca..000000000
--- a/meta-oe/recipes-graphics/graphene/graphene_1.10.8.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY =3D "A thin layer of graphic data types"
-HOMEPAGE =3D "http://ebassi.github.io/graphene/"
-LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Da7d871d9e23c450c421a85bb2=
819f648"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-
-inherit gnomebase gobject-introspection gtk-doc
-
-SRC_URI[archive.sha256sum] =3D "a37bb0e78a419dcbeaa9c7027bcff52f5ec2367c=
25ec859da31dfde2928f279a"
-
-# gtk4 & mutter 41.0 requires graphene build with introspection
-PACKAGECONFIG ?=3D "introspection"
-PACKAGECONFIG[introspection] =3D "-Dintrospection=3Denabled,-Dintrospect=
ion=3Ddisabled,"
-
-GTKDOC_MESON_OPTION =3D "gtk_doc"
-
-EXTRA_OEMESON =3D "-Dinstalled_tests=3Dfalse"
-
-# Disable ARM NEON support
-EXTRA_OEMESON:append:arm =3D " -Darm_neon=3Dfalse"
-
-FILES:${PN} +=3D "${libdir}/graphene-1.0"
-
-BBCLASSEXTEND =3D "native nativesdk"
--=20
2.34.1


