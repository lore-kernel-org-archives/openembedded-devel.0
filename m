Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5989AC369D5
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:49:06 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.12050.1745228945539898047
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:49:05 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout01.t-online.de (Postfix) with SMTP id 04647EC
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlX-0UaYJX0; Mon, 21 Apr 2025 11:48:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 3/9] libsdl2-image: build with cmake
Date: Mon, 21 Apr 2025 11:48:26 +0200
Message-ID: <20250421094832.67450-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228919-CF7FD94A-31409F73/0/0 CLEAN NORMAL
X-TOI-MSGID: 778f0e9c-5e24-49f6-be59-e7bc6622ebf0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:49:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116997

This allows to use with libsdl2-compat

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl/libsdl2-image_2.8.8.bb              | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
index bcd8e35b27..15f7b6f4b7 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.8.bb
@@ -11,20 +11,6 @@ SRC_URI[sha256sum] =3D "2213b56fdaff2220d0e38c8e420cbe=
1a83c87374190cba8c70af215609
=20
 S =3D "${WORKDIR}/SDL2_image-${PV}"
=20
-inherit autotools pkgconfig
+inherit cmake pkgconfig
=20
-# Disable the run-time loading of the libs and bring back the soname dep=
endencies.
-EXTRA_OECONF +=3D "--disable-jpg-shared --disable-png-shared -disable-ti=
f-shared"
-
-do_configure:prepend() {
-    # make autoreconf happy
-    touch ${S}/NEWS ${S}/README ${S}/AUTHORS ${S}/ChangeLog
-    # Removing these files fixes a libtool version mismatch.
-    rm -f ${S}/acinclude/libtool.m4
-    rm -f ${S}/acinclude/sdl2.m4
-    rm -f ${S}/acinclude/pkg.m4
-    rm -f ${S}/acinclude/lt~obsolete.m4
-    rm -f ${S}/acinclude/ltoptions.m4
-    rm -f ${S}/acinclude/ltsugar.m4
-    rm -f ${S}/acinclude/ltversion.m4
-}
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


