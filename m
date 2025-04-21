Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A7CCC369AB
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 10:32:56 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.12602.1745231566490728386
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 03:32:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd83.aul.t-online.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout12.t-online.de (Postfix) with SMTP id 873E92BF
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 12:32:44 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd83.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6oSB-2BxaFt0; Mon, 21 Apr 2025 12:32:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl2-compat: fix to work as drop-in replacement for libsdl2
Date: Mon, 21 Apr 2025 12:32:31 +0200
Message-ID: <20250421103231.314647-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745231563-2F7FDA54-4918F27A/0/0 CLEAN NORMAL
X-TOI-MSGID: 4c96ef34-7d79-41d0-8ba4-f7a488b09f2d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 10:32:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117001

Since libsdl2 and libsdl2-compat are now mutually exclusive
we can afford to rename the .pc file from sdl2-compat.pc to sdl2.pc
This helps other projects which use pkgconfig to find libsdl2

Allow to build libsdl2-compat for native and nativesdk. This is required
to build qemu

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb b=
/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
index 80334e9ad8..cf580e49f8 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl2-compat_2.32.52.bb
@@ -22,7 +22,13 @@ inherit cmake pkgconfig upstream-version-is-even featu=
res_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl x11"
=20
+do_install:append() {
+	mv ${D}${libdir}/pkgconfig/sdl2_compat.pc ${D}${libdir}/pkgconfig/sdl2.=
pc
+}
+
 FILES:${PN} +=3D "${datadir}/licenses"
=20
 RCONFLICTS:${PN} =3D "libsdl2"
 RPROVIDES:${PN} =3D "libsdl2"
+
+BBCLASSEXTEND =3D "nativesdk native"
--=20
2.49.0


