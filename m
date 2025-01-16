Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1BEC02180
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 09:58:49 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.44807.1737021525572569530
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jan 2025 01:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id DF1B2F7D
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 10:58:42 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.226.124]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tYMe7-3qIWkD0; Thu, 16 Jan 2025 10:58:39 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] libde265: switch to cmake buildsystem
Date: Thu, 16 Jan 2025 10:58:59 +0100
Message-ID: <20250116095859.4084505-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1737021519-B6FFA9C7-041D6C49/0/0 CLEAN NORMAL
X-TOI-MSGID: d758ff3f-c076-422b-8123-652fb7d9fc20
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jan 2025 09:58:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114909

This fixes build issues with clang/qemuarm

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../recipes-multimedia/libde265/libde265_1.0.15.bb   | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index 818654bdb0..12bdb23354 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -13,12 +13,10 @@ SRCREV =3D "17bb8d9fcea62db8cdeb0fc7ef8d15dbd19a22e4"
=20
 S =3D "${WORKDIR}/git"
=20
-EXTRA_OECONF =3D "--disable-sherlock265"
+inherit cmake pkgconfig
=20
-inherit autotools pkgconfig
+PACKAGECONFIG ?=3D "libsdl"
+PACKAGECONFIG[libsdl] =3D "-DENABLE_SDL=3DON,-DENABLE_SDL=3DOFF,libsdl2"
=20
-PACKAGECONFIG ?=3D "dec265"
-PACKAGECONFIG[dec265] =3D "--enable-dec265,--disable-dec265,libsdl2"
-
-PACKAGES =3D+ "${PN}-tools"
-FILES:${PN}-tools =3D "${bindir}/*"
+FILES:${PN} +=3D "${libdir}/libde265.so"
+FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
--=20
2.47.1


