Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADA4C47090
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 12:29:12 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.90658.1669552142053372883
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 04:29:02 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout05.t-online.de (Postfix) with SMTP id 542E65D06
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 13:29:00 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.231.234]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozGmJ-0sD6nM0; Sun, 27 Nov 2022 13:28:59 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv3 04/14] gjs: update 1.72.2 -> 1.75.1
Date: Sun, 27 Nov 2022 13:28:36 +0100
Message-Id: <20221127122846.1406944-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127122846.1406944-1-f_l_k@t-online.de>
References: <20221127122846.1406944-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669552139-C37F89D3-C58AAA1A/0/0 CLEAN NORMAL
X-TOI-MSGID: 36a58e2a-cc5b-4c6c-9478-9f41a903fab8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 12:29:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99771

- build with mozjs-102

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.72.2.bb =3D> gjs_1.75.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.72.2.bb =3D> gjs_1.75.1.bb} (=
90%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.75.1.bb
similarity index 90%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb
index 317034156..b2c2b583b 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.72.2.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb
@@ -4,11 +4,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8dcea832f6ac=
f45d856abfeb2d51ec48"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-DEPENDS =3D "mozjs-91 cairo"
+DEPENDS =3D "mozjs-102 cairo"
=20
 inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "ddee379bdc5a7d303a5d894be2b281beb8ac5450=
8604e7d3f20781a869da3977"
+SRC_URI[archive.sha256sum] =3D "81dcdf49d2665d08fa7e251700ea36466d778774=
18e9186d3a7e7efcd31aa960"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
--=20
2.34.1


