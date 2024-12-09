Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 883A1E7717D
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.107626.1733765193356907546
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DD2B61650
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:27:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 80EAD3F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 4/7] vk-gl-cts: set the git tag regex for release checking
Date: Mon,  9 Dec 2024 17:26:23 +0000
Message-ID: <20241209172626.4144686-4-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114252

Add BPN to the tag name to differentiate vulkan-cts and opengl-es-cts
releases.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index ea37425b9d..cf9eaf6863 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -21,6 +21,8 @@ S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig cmake features_check python3native qemu
=20
+UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
+
 ANY_OF_DISTRO_FEATURES +=3D "opengl vulkan"
=20
 DEPENDS +=3D "python3-lxml-native libpng zlib virtual/libgles2 qemu-nati=
ve"
--=20
2.43.0


