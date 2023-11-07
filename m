Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60D5DC0018C
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 07:09:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.5105.1699340948017441409
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 23:09:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout01.t-online.de (Postfix) with SMTP id CB09A40070
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Nov 2023 08:08:49 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.54]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r0GCf-1iyqh70; Tue, 7 Nov 2023 08:08:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] rest: Add packageconfigs for examples and tests
Date: Tue,  7 Nov 2023 08:09:15 +0100
Message-ID: <20231107070915.9856-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699340929-FE3E1D6D-52639877/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d428b77-91f9-48b8-833f-52444e77a386
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 07:09:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106422

Motivation is to not install rest-demos by default.

Allow to build doc and vapi according to DISTRO_FEATURES

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/rest/rest_0.9.1.bb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb b/meta-gnome/rec=
ipes-gnome/rest/rest_0.9.1.bb
index 375417d5f..988ba8b24 100644
--- a/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
+++ b/meta-gnome/recipes-gnome/rest/rest_0.9.1.bb
@@ -17,6 +17,13 @@ DEPENDS =3D " \
     libxml2-native \
 "
=20
-inherit gnomebase gobject-introspection vala pkgconfig
+inherit gnomebase gobject-introspection vala pkgconfig gtk-doc
+
+GTKDOC_MESON_OPTION =3D 'gtk_doc'
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


