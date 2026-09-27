Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945EAC98338
	for <webhook@archiver.kernel.org>; Sun, 27 Sep 2026 18:24:30 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.9.40.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41302.1790533463715040740
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Sep 2026 11:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=dgjAupXi;
 spf=pass (domain: tafhub.de, ip: 5.9.40.180, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7CD902E41100;
	Sun, 27 Sep 2026 20:24:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1790533460; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=WiGj+6TnKD5sqq00j1uHnZBOMcSBgrjl6DlTxlKFF8Y=;
	b=dgjAupXi2TEHR8+Std3Ejs8e5+0Yu9qznLWilaSMykLBm5zr5AsVOU+Q+YB3Xas/13sq4y
	fgw56bAwveXosbMMEEUQvj0R6K5pFGDn7ZUN829VfhCh4SbiDKD/kj5MkZih89ycKT3VRp
	OSkgppnUgocd9C+enBg7M/Sie7uTO7hrgWv/tECDfaOpkz3t/Nl0kG7GjMCWyc/GLOrvEh
	PjTNgUcONKC/DODwpxRHM8Oro/AfN9rag7p/qPkSEn57nfK6vNtkFrvce2gilyZRVCCEPf
	GRU8ESPOfy7KFRLoVOgTzPcXuTSjgnfWCc0rCdN1d9wEa8h6/iF2fI81wHXdzg==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH 1/2] fastfetch: upgrade 2.66.0 -> 2.69.0
Date: Sun, 27 Sep 2026 20:24:17 +0200
Message-ID: <20260927182418.1339166-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 27 Sep 2026 18:24:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130375

Version 2.69.0 added sixel as build option for logo support. The image
support should be off when no option of 'chafa imagemagick sixel' is
enabled.

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/{fastfetch_2.66.0.bb =3D> fastfetch_2.69.0.bb}    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.66.0.bb =3D> fastf=
etch_2.69.0.bb} (93%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
similarity index 93%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
index 8835e3d85d..83f7480011 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.66.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.69.0.bb
@@ -11,11 +11,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93d=
f7ad5a3d41f6fb4226ac76"
 DEPENDS =3D "yyjson"
=20
 SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Dmaster;tag=3D${PV}"
-SRCREV =3D "08698098579bb8b043b0a343159b8018f5cea4fc"
+SRCREV =3D "0c3b852bf7bad2837a814c7a31bf332092048a2b"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "\
+    ${@bb.utils.contains_any('PACKAGECONFIG', 'chafa imagemagick sixel',=
 '-DENABLE_IMAGE_LOGO=3DON', '-DENABLE_IMAGE_LOGO=3DOFF', d)} \
     -DENABLE_SYSTEM_YYJSON=3DON \
     -DENABLE_EET=3DOFF \
     -DENABLE_QUICKJS=3DOFF \
@@ -47,6 +48,7 @@ PACKAGECONFIG[lua] =3D "-DENABLE_LUA=3DON,-DENABLE_LUA=3D=
OFF,lua"
 PACKAGECONFIG[opencl] =3D "-DENABLE_OPENCL=3DON,-DENABLE_OPENCL=3DOFF,op=
encl-headers virtual/libopencl1"
 PACKAGECONFIG[pulseaudio] =3D "-DENABLE_PULSE=3DON,-DENABLE_PULSE=3DOFF,=
pulseaudio"
 PACKAGECONFIG[rpm] =3D "-DENABLE_RPM=3DON,-DENABLE_RPM=3DOFF,rpm"
+PACKAGECONFIG[sixel] =3D "-DENABLE_SIXEL=3DON,-DENABLE_SIXEL=3DOFF,"
 PACKAGECONFIG[sqlite3] =3D "-DENABLE_SQLITE3=3DON,-DENABLE_SQLITE3=3DOFF=
,sqlite3"
 PACKAGECONFIG[va-drm] =3D "-DENABLE_VADRM=3DON,-DENABLE_VADRM=3DOFF,libv=
a"
 PACKAGECONFIG[va-x11] =3D "-DENABLE_VAX11=3DON,-DENABLE_VAX11=3DOFF,libv=
a"

