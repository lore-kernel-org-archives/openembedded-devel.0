Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E86C369D3
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:48:46 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.12039.1745228922201832749
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 8F0ED565
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJc0; Mon, 21 Apr 2025 11:48:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 8/9] libsdl2-compat: make mutually exclusive with libsdl2
Date: Mon, 21 Apr 2025 11:48:31 +0200
Message-ID: <20250421094832.67450-8-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228920-E7FFC94A-02E533CD/0/0 CLEAN NORMAL
X-TOI-MSGID: 6d05991e-a4b0-4e04-ba7c-8cd53854818e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116995

libsdl2 and libsdl2-compat share the same headers.
Therefore, using one or the other is an either-or decision

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
index de47f174b1..80334e9ad8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -16,8 +16,13 @@ S =3D "${WORKDIR}/sdl2-compat-${PV}"
=20
 DEPENDS +=3D "libsdl3"
=20
+PROVIDES =3D "libsdl2"
+
 inherit cmake pkgconfig upstream-version-is-even features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
 FILES:${PN} +=3D "${datadir}/licenses"
+
+RCONFLICTS:${PN} =3D "libsdl2"
+RPROVIDES:${PN} =3D "libsdl2"
--=20
2.49.0


