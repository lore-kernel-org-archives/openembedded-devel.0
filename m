Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E68EC47088
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 23:04:38 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.81050.1669503868321787412
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 15:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout10.t-online.de (Postfix) with SMTP id D227069AA
	for <openembedded-devel@lists.openembedded.org>; Sun, 27 Nov 2022 00:04:26 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oz4DV-1zml0M0; Sun, 27 Nov 2022 00:04:13 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2 02/14] geocode-glib: build with libsoup-3.0
Date: Sun, 27 Nov 2022 00:03:39 +0100
Message-Id: <20221126230351.1431843-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126230351.1431843-1-f_l_k@t-online.de>
References: <20221126230351.1431843-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669503854-177E998D-B1FCD6F5/0/0 CLEAN NORMAL
X-TOI-MSGID: 50d0bdd3-0b06-46f3-b149-3b507fc37c9e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 23:04:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99753

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb=
 b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
index 2b1ecad97..42659d0f6 100644
--- a/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
+++ b/meta-gnome/recipes-gnome/geocode-glib/geocode-glib_3.26.4.bb
@@ -11,9 +11,9 @@ inherit gnomebase gobject-introspection gettext gtk-doc=
 upstream-version-is-even
=20
 DEPENDS =3D " \
     json-glib \
-    libsoup-2.4 \
+    libsoup-3.0 \
 "
=20
 SRC_URI[archive.sha256sum] =3D "2d9a6826d158470449a173871221596da0f83ebd=
cff98b90c7049089056a37aa"
=20
-EXTRA_OEMESON =3D "-Denable-installed-tests=3Dfalse"
+EXTRA_OEMESON =3D "-Denable-installed-tests=3Dfalse -Dsoup2=3Dfalse"
--=20
2.34.1


