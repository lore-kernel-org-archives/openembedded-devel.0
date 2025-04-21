Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BEE0C369D6
	for <webhook@archiver.kernel.org>; Mon, 21 Apr 2025 09:48:46 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.12038.1745228922196668158
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Apr 2025 02:48:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout06.t-online.de (Postfix) with SMTP id 9121459E
	for <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 11:48:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.37.191]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u6nlY-0UaYJd0; Mon, 21 Apr 2025 11:48:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 9/9] libsdl3-image: add recipe
Date: Mon, 21 Apr 2025 11:48:32 +0200
Message-ID: <20250421094832.67450-9-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250421094832.67450-1-f_l_k@t-online.de>
References: <20250421094832.67450-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745228920-FE7FB94A-54C7C6EF/10/3626336762 SUSPECT URL
X-TOI-MSGID: dd174948-7a87-46d2-bd39-cac8c5832c3e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 21 Apr 2025 09:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116994

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libsdl3/libsdl3-image_3.2.4.bb               | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.=
bb

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
new file mode 100644
index 0000000000..fa0f3cf45d
--- /dev/null
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
@@ -0,0 +1,16 @@
+SUMMARY =3D "Simple DirectMedia Layer image library v2"
+SECTION =3D "libs"
+
+LICENSE =3D "Zlib"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
+
+DEPENDS =3D "tiff zlib libpng jpeg libsdl2 libwebp"
+
+SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
+SRCREV =3D "11154afb7855293159588b245b446a4ef09e574f"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+FILES:${PN} +=3D "${datadir}/licenses"
--=20
2.49.0


