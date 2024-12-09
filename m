Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97645E77181
	for <webhook@archiver.kernel.org>; Mon,  9 Dec 2024 17:26:43 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.107627.1733765193718159317
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Dec 2024 09:26:33 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C847175D
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:27:01 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19D4B3F720
	for <openembedded-devel@lists.openembedded.org>; Mon,  9 Dec 2024 09:26:32 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 5/7] vk-gl-cts: use cmake-qemu
Date: Mon,  9 Dec 2024 17:26:24 +0000
Message-ID: <20241209172626.4144686-5-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209172626.4144686-1-ross.burton@arm.com>
References: <20241209172626.4144686-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Dec 2024 17:26:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114253

Don't configure qemu+cmake manually, use the cmake-qemu class.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc b/meta-oe=
/recipes-graphics/vk-gl-cts/khronos-cts.inc
index cf9eaf6863..0b347cf77e 100644
--- a/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
+++ b/meta-oe/recipes-graphics/vk-gl-cts/khronos-cts.inc
@@ -19,7 +19,7 @@ SRCREV_FORMAT =3D "vk-gl-cts_amber_glslang_spirv-header=
s_spirv-tools_jsoncpp_video
=20
 S =3D "${WORKDIR}/git"
=20
-inherit pkgconfig cmake features_check python3native qemu
+inherit pkgconfig cmake cmake-qemu features_check python3native
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "${BPN}-(?P<pver>\d+(\.\d+)+)"
=20
@@ -42,7 +42,6 @@ SRC_URI:append:toolchain-clang =3D "\
 "
=20
 EXTRA_OECMAKE +=3D "-DAMBER_DISABLE_WERROR=3DON \
-                  -DCMAKE_CROSSCOMPILING_EMULATOR=3D${WORKDIR}/qemuwrapp=
er \
                   -DWAYLAND_SCANNER=3D${STAGING_BINDIR_NATIVE}/wayland-s=
canner \
                   -DWAYLAND_PROTOCOLS_DIR=3D${STAGING_DATADIR}/wayland-p=
rotocols"
=20
@@ -58,17 +57,6 @@ PACKAGECONFIG[x11_egl] =3D "-DDEQP_TARGET=3Dx11_egl,,v=
irtual/libx11 virtual/egl,,,su
 PACKAGECONFIG[x11_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/libx11,,,su=
rfaceless wayland x11_egl x11_egl_glx"
 PACKAGECONFIG[x11_egl_glx] =3D "-DDEQP_TARGET=3Dx11_glx,,virtual/libx11 =
virtual/egl,,,surfaceless wayland x11_egl x11_glx"
=20
-do_configure:append() {
-        # Write out a qemu wrapper that will be used by cmake
-        # so that it can run target helper binaries through that.
-        qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_=
HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR=
_HOST}${base_libdir}')])}"
-        cat > ${WORKDIR}/qemuwrapper << EOF
-#!/bin/sh
-$qemu_binary "\$@"
-EOF
-        chmod +x ${WORKDIR}/qemuwrapper
-}
-
 python __anonymous() {
     # if the user doesn't specify any PACKAGECONFIG then the cts build s=
ystem
     # is going to probe the sysroot to try to figure out what to build
--=20
2.43.0


