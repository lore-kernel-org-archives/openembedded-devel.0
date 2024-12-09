Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FF37E77180
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:33 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.107624.1733765192710096882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 500241650
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:27:00 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id F1A113F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:31 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 3/7] vk-gl-cts: fix EXTRA_OECMAKE
Date: Mon,  9 Dec 2024 17:26:22 +0000
Message-ID: <20241209172626.4144686-3-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114251

There are no native/nativesdk builds of this recipe, so there's no need
to use a separate class-target assignment.

We should pass AMBER_DISABLE_WERROR in all builds, not just target.

Setting -DUPDATE_DEPS=3DOFF isn't functional as the CMakeLists explictly
set that to ON, so remove it.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index 0322ef453a..ea37425b9d 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -38,8 +38,11 @@ DEPENDS:append:libc-musl =3D " libexecinfo"
 SRC_URI:append:toolchain-clang =3D "\
 	file://fix-clang-private-operator.patch \
 "
-EXTRA_OECMAKE +=3D "-DUPDATE_DEPS=3DOFF"
-EXTRA_OECMAKE:prepend:class-target =3D "-DCMAKE_CROSSCOMPILING_EMULATOR=3D=
${WORKDIR}/qemuwrapper -DWAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayla=
nd-scanner -DWAYLAND_PROTOCOLS_DIR=3D${STAGING_DATADIR}/wayland-protocols=
 -DAMBER_DISABLE_WERROR=3DON"
+
+EXTRA_OECMAKE +=3D "-DAMBER_DISABLE_WERROR=3DON \
+                  -DCMAKE_CROSSCOMPILING_EMULATOR=3D${WORKDIR}/qemuwrapp=
er \
+                  -DWAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayland-s=
canner \
+                  -DWAYLAND_PROTOCOLS_DIR=3D${STAGING_DATADIR}/wayland-p=
rotocols"
=20
 # The best thing for the user to do is to not specify any of the followi=
ng
 # PACKAGECONFIGs (i.e. leave it blank) which tells the project to do its=
 own
--=20
2.43.0


