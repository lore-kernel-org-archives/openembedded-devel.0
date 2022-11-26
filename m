Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2898C47088
	for <webhook@archiver.kernel.org>; Sat, 26 Nov 2022 13:16:45 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.69792.1669468597815003384
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 26 Nov 2022 05:16:38 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout01.t-online.de (Postfix) with SMTP id 0A097D27
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 14:16:36 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.224.10]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oyv2p-28mQBn0; Sat, 26 Nov 2022 14:16:35 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 3/4] geocode-glib: build with libsoup-3.0
Date: Sat, 26 Nov 2022 14:16:11 +0100
Message-Id: <20221126131612.1435270-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221126131612.1435270-1-f_l_k@t-online.de>
References: <20221126131612.1435270-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669468595-EDFED7E2-1BE3C96B/0/0 CLEAN NORMAL
X-TOI-MSGID: 5e9bdbec-05ee-4b1c-8dff-48b16419a8be
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Nov 2022 13:16:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99748

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


