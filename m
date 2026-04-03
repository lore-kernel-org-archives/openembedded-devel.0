Return-Path: <tafil@tafhub.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73B88E7E366
	for <webhook@archiver.kernel.org>; Fri,  3 Apr 2026 10:18:38 +0000 (UTC)
Received: from mail.tafhub.de (mail.tafhub.de [5.189.191.204])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8676.1775211512848632726
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Apr 2026 03:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@tafhub.de header.s=dkim header.b=LzrIHV9G;
 spf=pass (domain: tafhub.de, ip: 5.189.191.204, mailfrom: tafil@tafhub.de)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6E5718801D8;
	Fri,  3 Apr 2026 12:18:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tafhub.de; s=dkim;
	t=1775211510; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3kdp+5GhkXhwlrdDCUleOFv8uxNueyvPjwtu06vsowc=;
	b=LzrIHV9GZGagPBbMUK2GhEl8csLx5hN107zw12J2Ko1djQRh5KhiRhzNapGsa6+rUarRNS
	JfGyB1pYiNcIncjM7sYIWhRkCqVI8LynC8A0GHvaW0TMHoTn9MPu3paQRg69txuVjtUuLA
	ATdxeAmKsn9kWXEVvQ9L+Ex9IXtnFhNyaMjwHl2gtwGpRibQ7YQiKx04PjoDdLJIdE4sht
	bG1QiztfGnGqAchP5X+WEbUFIrNic0F82Sz8lDQqt8wElk5DXJNbBOD6us99wUIMtfrB9P
	dR2lRXqsid/bWBlm87P7Td4pZy1HlQ+kVWp7/yTJGaL2SVOBgbX2IAWaz2DxcQ==
From: Tafil Avdyli <tafil@tafhub.de>
To: openembedded-devel@lists.openembedded.org
Cc: Tafil Avdyli <tafil@tafhub.de>
Subject: [meta-oe][PATCH] fastfetch: upgrade 2.60.0 -> 2.61.0
Date: Fri,  3 Apr 2026 12:17:22 +0200
Message-ID: <20260403101722.3656941-1-tafil@tafhub.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Apr 2026 10:18:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125984

The directx-headers dependency is no longer required and got removed
from CMakeLists.txt

Full changelog:
https://github.com/fastfetch-cli/fastfetch/releases/tag/2.61.0

Signed-off-by: Tafil Avdyli <tafil@tafhub.de>
---
 .../fastfetch/{fastfetch_2.60.0.bb =3D> fastfetch_2.61.0.bb}     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.60.0.bb =3D> fastf=
etch_2.61.0.bb} (97%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb b/meta=
-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
similarity index 97%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
index dbb999969b..e3394a7af5 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.60.0.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.61.0.bb
@@ -11,13 +11,12 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D2090e7d93d=
f7ad5a3d41f6fb4226ac76"
 DEPENDS =3D "yyjson"
=20
 SRC_URI =3D "git://github.com/fastfetch-cli/fastfetch.git;protocol=3Dhtt=
ps;branch=3Ddev;tag=3D${PV}"
-SRCREV =3D "06ecc9c4805794ca8d632844e64950e82a6d5f7e"
+SRCREV =3D "e5d600600614f5496b02907a11a7bc80c369d266"
=20
 inherit cmake pkgconfig
=20
 EXTRA_OECMAKE +=3D "\
     -DENABLE_SYSTEM_YYJSON=3DON \
-    -DENABLE_DIRECTX_HEADERS=3DOFF \
 "
=20
 PACKAGECONFIG ??=3D "\

