Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4572DC77B75
	for <webhook@archiver.kernel.org>; Tue, 16 May 2023 04:35:40 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web11.13609.1684211731363646473
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 May 2023 21:35:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 8A21D212A3
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 06:35:29 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.228.204]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pymPI-33a7Xy0; Tue, 16 May 2023 06:35:29 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 6/7] gjs: update 1.75.1 -> 1.76.0
Date: Tue, 16 May 2023 06:34:57 +0200
Message-Id: <20230516043458.6180-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516043458.6180-1-f_l_k@t-online.de>
References: <20230516043458.6180-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1684211729-59FF057F-126BC041/0/0 CLEAN NORMAL
X-TOI-MSGID: cec1bf87-76f5-4d3e-9dae-1e3bdb426177
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 May 2023 04:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102612

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.75.1.bb =3D> gjs_1.76.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.75.1.bb =3D> gjs_1.76.0.bb} (=
92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.76.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.76.0.bb
index b2c2b583b0..e6d377cb33 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.75.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.76.0.bb
@@ -8,7 +8,7 @@ DEPENDS =3D "mozjs-102 cairo"
=20
 inherit gnomebase gsettings gobject-introspection vala gettext features_=
check upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "81dcdf49d2665d08fa7e251700ea36466d778774=
18e9186d3a7e7efcd31aa960"
+SRC_URI[archive.sha256sum] =3D "a63f156964b136053eab51ea013114e7d7c193b7=
518d28c040b6b02c3c933a6d"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
--=20
2.34.1


