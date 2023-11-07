Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21BF3C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:29:02 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.5683.1699342138770913171
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:28:59 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout08.t-online.de (Postfix) with SMTP id 1871D94F2
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:28:25 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.54]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0GVZ-15yveT0; Tue, 7 Nov 2023 08:28:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] rest: Add packageconfigs for examples and tests
Date: Tue,  7 Nov 2023 08:28:43 +0100
Message-ID: <20231107072843.13024-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699342101-A885C9D6-E9802F32/0/0 CLEAN NORMAL
X-TOI-MSGID: 0a268fae-254b-4b51-b1ea-af2eb7c6dbe8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:29:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106439

Motivation is to not install rest-demos by default.

Allow to build doc and vapi according to DISTRO_FEATURES

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
index 375417d5f..3a81a58f6 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -6,8 +6,6 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2d5025d4aa3495=
befef8f17206a5b0a1"
 GNOMEBASEBUILDCLASS =3D "meson"
=20
 DEPENDS =3D " \
-    gi-docgen \
-    gi-docgen-native \
     glib-2.0 \
     glib-2.0-native \
     gtksourceview5 \
@@ -17,6 +15,12 @@ DEPENDS =3D " \
     libxml2-native \
 "
=20
-inherit gnomebase gobject-introspection vala pkgconfig
+inherit gnomebase gobject-introspection vala pkgconfig gi-docgen
+
+EXTRA_OEMESON =3D "${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dva=
pi=3Dtrue', '-Dvapi=3Dfalse', d)}"
+
+PACKAGECONFIG ?=3D ""
+PACKAGECONFIG[examples] =3D "-Dexamples=3Dtrue,-Dexamples=3Dfalse"
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse"
=20
 SRC_URI[archive.sha256sum] =3D "9266a5c10ece383e193dfb7ffb07b509cc1f5152=
1ab8dad76af96ed14212c2e3"
--=20
2.42.0


