Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14C58C1B087
	for <webhook@archiver.kernel.org>; Wed, 26 Feb 2025 15:50:32 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.8937.1740585028097850885
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Feb 2025 07:50:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1B7FFEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:43 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6240C3F673
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 07:50:27 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2 03/23] libsdl2-image: upgrade to 2.8.5
Date: Wed, 26 Feb 2025 15:50:00 +0000
Message-ID: <20250226155022.1989209-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226155022.1989209-1-ross.burton@arm.com>
References: <20250226155022.1989209-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 15:50:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115655

Upstream rebuilt the 2.8.4 tarball[1] so builds without an existing
download fail.

License-Update: copyright years updated.

[1] https://github.com/libsdl-org/SDL_image/issues/515

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../libsdl/{libsdl2-image_2.8.4.bb =3D> libsdl2-image_2.8.5.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/libsdl/{libsdl2-image_2.8.4.bb =3D> libs=
dl2-image_2.8.5.bb} (84%)

diff --git a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb b/met=
a-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb
similarity index 84%
rename from meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb
rename to meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb
index c73a3c3dc0..bbd1c83535 100644
--- a/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.4.bb
+++ b/meta-oe/recipes-graphics/libsdl/libsdl2-image_2.8.5.bb
@@ -2,12 +2,12 @@ SUMMARY =3D "Simple DirectMedia Layer image library v2"
 SECTION =3D "libs"
=20
 LICENSE =3D "Zlib"
-LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D2f6d9e01c97958aa851954ed5=
acf82ee"
+LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dfbb0010b2f7cf6e8a13bcac1e=
f4d2455"
=20
 DEPENDS =3D "tiff zlib libpng jpeg libsdl2 libwebp"
=20
 SRC_URI =3D "http://www.libsdl.org/projects/SDL_image/release/SDL2_image=
-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "5a89a01420a192b89dbcc5f5267448181d5dcc81d2f5a168=
8cb1eac6f557da67"
+SRC_URI[sha256sum] =3D "8bc4c57f41e2c0db7f9b749b253ef6cecdc6f0b689ecbe36=
ee97b50115fff645"
=20
 S =3D "${WORKDIR}/SDL2_image-${PV}"
=20
--=20
2.43.0


