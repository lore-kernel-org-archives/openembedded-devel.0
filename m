Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0926CCD18D
	for <webhook@archiver.kernel.org>; Mon, 13 Oct 2025 13:36:59 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43827.1760362617859756964
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Oct 2025 06:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D80C113E
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:36:49 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 0A66A3F6A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 06:36:56 -0700 (PDT)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH] taisei: clean up recipe slightly
Date: Mon, 13 Oct 2025 14:36:55 +0100
Message-ID: <20251013133655.2994657-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Oct 2025 13:36:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120537

There's no need to inherit python3native as there are no python3- native
dependencies.

Remove RDEPENDS_${PN}, these are all libraries that are linked to so the
relevant RDEPENDS are created. The fact that this recipe is still using
the old syntax suggests that they're not needed.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../recipes-graphics/taisei/taisei_1.4.4.bb        | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/tai=
sei/taisei_1.4.4.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-gra=
phics/taisei/taisei_1.4.4.bb
index 4af2712140..bb08ad4a1c 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.4.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/tai=
sei_1.4.4.bb
@@ -20,22 +20,10 @@ DEPENDS =3D "\
 DEPENDS:append:libc-musl =3D " libucontext"
 LDFLAGS:append:libc-musl =3D " -lucontext"
=20
-RDEPENDS_${PN} =3D "\
-    cglm (>=3D 0.7.8) \
-    freetype \
-    libsdl2 (>=3D 2.0.16) \
-    libpng (>=3D 1.5.0) \
-    libwebp (>=3D 0.5) \
-    libzstd (>=3D 1.4.0) \
-    opengl (>=3D 3.3) \
-    opusfile \
-    zlib \
-"
-
 SRC_URI =3D "gitsm://github.com/taisei-project/taisei.git;branch=3Dv1.4.=
x;protocol=3Dhttps;tag=3Dv${PV}"
 SRCREV =3D "6a484e6e61cc51a22a9943762dc2ff6883914f38"
=20
-inherit features_check meson mime mime-xdg pkgconfig python3native
+inherit features_check meson mime mime-xdg pkgconfig
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl"
=20
--=20
2.43.0


