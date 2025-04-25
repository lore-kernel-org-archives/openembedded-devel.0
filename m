Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E487AC369D7
	for <webhook@archiver.kernel.org>; Fri, 25 Apr 2025 17:32:32 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.12165.1745602351062463096
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Apr 2025 10:32:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout07.t-online.de (Postfix) with SMTP id CC3611127
	for <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 19:32:28 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.169.200]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u8MuZ-1Wap610; Fri, 25 Apr 2025 19:32:27 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] libsdl3: dont provide virtual/libsdl3
Date: Fri, 25 Apr 2025 19:32:19 +0200
Message-ID: <20250425173219.9788-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745602347-C57F994A-90C13F4A/10/3626336762 SUSPECT URL
X-TOI-MSGID: 5cddd1b5-af08-4984-8034-04ca9a98ec66
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Apr 2025 17:32:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117135

- depend on libsdl3 directly

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb | 2 +-
 meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb      | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb b/me=
ta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
index 696752d29d..8ef20521a9 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3-image_3.2.4.bb
@@ -4,7 +4,7 @@ SECTION =3D "libs"
 LICENSE =3D "Zlib"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
=20
-DEPENDS =3D "tiff zlib libpng jpeg virtual/libsdl3 libwebp"
+DEPENDS =3D "tiff zlib libpng jpeg libsdl3 libwebp"
=20
 SRC_URI =3D "git://github.com/libsdl-org/SDL_image.git;protocol=3Dhttps;=
branch=3Drelease-3.2.x"
 SRCREV =3D "11154afb7855293159588b245b446a4ef09e574f"
diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb b/meta-oe=
/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
index 25ef8ae70d..b8844ca10d 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.10.bb
@@ -15,8 +15,6 @@ LIC_FILES_CHKSUM =3D "\
     file://src/video/yuv2rgb/LICENSE;md5=3D79f8f3418d91531e05f0fc94ca67e=
071 \
 "
=20
-PROVIDES =3D "virtual/libsdl3"
-
 SRC_URI =3D "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
=20
 S =3D "${WORKDIR}/SDL3-${PV}"
--=20
2.49.0


