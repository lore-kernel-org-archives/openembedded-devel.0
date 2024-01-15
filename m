Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A00EC47DA2
	for <webhook@archiver.kernel.org>; Mon, 15 Jan 2024 18:24:13 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.90161.1705343049221909333
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jan 2024 10:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd73.aul.t-online.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout04.t-online.de (Postfix) with SMTP id 8B660139A6
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 19:24:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.169.126]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1rPRcy-2E8KDk0; Mon, 15 Jan 2024 19:24:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 4/4] gjs: update 1.78.1 -> 1.78.2
Date: Mon, 15 Jan 2024 19:24:01 +0100
Message-ID: <20240115182402.126946-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115182402.126946-1-f_l_k@t-online.de>
References: <20240115182402.126946-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1705343044-DF21A917-6F3FF331/0/0 CLEAN NORMAL
X-TOI-MSGID: 24502c87-7b50-4545-a56b-8ded37094dd3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jan 2024 18:24:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108293

Version 1.78.2
--------------

- Closed bugs and merge requests:
  * Uninitialized memory in float out values can lead to crashes in mozjs=
 gc
    code later on [#591, !902, Philip Chimento]
  * Garbage collection of Gdk surfaces [#592, !905, Philip Chimento]
  * gi/gerror: Fix version of the GIRepository typelib import [!906, Jord=
an
    Petridis]

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/gjs/{gjs_1.78.1.bb =3D> gjs_1.78.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/gjs/{gjs_1.78.1.bb =3D> gjs_1.78.2.bb} (=
92%)

diff --git a/meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb b/meta-gnome/reci=
pes-gnome/gjs/gjs_1.78.2.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb
rename to meta-gnome/recipes-gnome/gjs/gjs_1.78.2.bb
index 34eef1403..c8ffcdaab 100644
--- a/meta-gnome/recipes-gnome/gjs/gjs_1.78.1.bb
+++ b/meta-gnome/recipes-gnome/gjs/gjs_1.78.2.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "mozjs-115 cairo"
=20
 inherit gnomebase gsettings gobject-introspection gettext features_check=
 upstream-version-is-even pkgconfig
=20
-SRC_URI[archive.sha256sum] =3D "7e90511c429127c39eac0068c4ac9a353df7e6fb=
bc646f5f18e8962882c18641"
+SRC_URI[archive.sha256sum] =3D "6a2abeb6bb7b49dd20a2e86475a56c1d992ad271=
a0991e58b1431ad1d4997fd5"
 SRC_URI +=3D " \
     file://0001-Support-cross-builds-a-bit-better.patch \
     file://0002-meson.build-Do-not-add-dir-installed-tests-when-inst.pat=
ch \
--=20
2.43.0


