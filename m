Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1208C7EE23
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 18:59:43 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.492.1684436377698585411
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 May 2023 11:59:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=J/sSUIQm;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C4BD884694;
	Thu, 18 May 2023 20:59:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1684436375;
	bh=1o3kJunqORZUuYONZIzp7ERUagYiiO39FiEHpjgvr2U=;
	h=From:To:Cc:Subject:Date:From;
	b=J/sSUIQme9eGiuX4EIcQOPpx11/Wi15YZm4YfGbDO9K8RjIM4EK24gHL5VpdlxuRs
	 RWCnzqQJGEgx8K/SriEoEaLvDxVDXgCKQ3SBIKv0OIimEhA/vQe54j5Aa7gRlTx0T6
	 qFEeiJrTyUtpKOMkwX/VCKz1oSWeRdTbYicHSOV5UC3el9lzLUCYBHeti8D41unHuu
	 kVo4Kjcd8YAEoHtXh675R/pS05OyAfSc3pI6RIFsg3oPFrHxKM3DzDq/gUL4qEjA/V
	 R8X0IfCC8zARi4tXMGbIJSJcqovu7fv+I1WhB1+NJ33DJxaT7C8sW4iQzxof1LGQCn
	 D2e+kSSODpoKQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [meta-oe][PATCH] lvgl: lvgl-demo-fb: Switch to CMake and add DRM and SDL support
Date: Thu, 18 May 2023 20:59:20 +0200
Message-Id: <20230518185920.18785-1-marex@denx.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 May 2023 18:59:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102663

Switch the build of this recipe to CMake from the horrible Makefile
which is still part of the source tree and which blatantly encodes
various CFLAGS and co.

Add support for use of DRM and SDL backends and make this configurable.
The FBDEV is deprecated for close to two decades, so provide modern
alternatives -- DRM and SDL.

The DRM uses modern DRM API, but there is no GPU acceleration.
The SDL provides GPU support abstracted via the libSDL2 API and
can use multiple backends, DRM and WL included.

Default to the DRM backend, because FBDEV is just bad for any modern syst=
em.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 .../lvgl/lvgl-demo-fb_8.3.0.bb                | 50 +++++++++++++++++--
 1 file changed, 45 insertions(+), 5 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
index 1dfb199ff..33e7c94e6 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_8.3.0.bb
@@ -8,14 +8,54 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D802d3d83ae80=
ef5f343050bf96cce3a4 \
 SRC_URI =3D "gitsm://github.com/lvgl/lv_port_linux_frame_buffer.git;bran=
ch=3Dmaster;protocol=3Dhttps"
 SRCREV =3D "adf2c4490e17a1b9ec1902cc412a24b3b8235c8e"
=20
+EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
+
+PACKAGECONFIG ??=3D "drm"
+PACKAGECONFIG[drm] =3D ",,libdrm"
+PACKAGECONFIG[fbdev] =3D ",,"
+PACKAGECONFIG[sdl] =3D ",,virtual/libsdl2"
+LVGL_CONFIG_USE_DRM =3D "${@bb.utils.contains('PACKAGECONFIG', 'drm', '1=
', '0', d)}"
+LVGL_CONFIG_DRM_CARD ?=3D "/dev/dri/card0"
+LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
+LVGL_CONFIG_USE_SDL =3D "${@bb.utils.contains('PACKAGECONFIG', 'sdl', '1=
', '0', d)}"
+
+inherit cmake
+
 S =3D "${WORKDIR}/git"
=20
-REQUIRED_DISTRO_FEATURES =3D "fbdev"
+EXTRA_OECMAKE +=3D "-Dinstall:BOOL=3DON -DLIB_INSTALL_DIR=3D${baselib}"
+TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
=20
-inherit features_check
+do_configure:prepend() {
+	sed -i -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${LVGL_CON=
FIG_USE_FBDEV}|g" \
+		-e "s|\(^#  define USE_DRM \).*|#  define USE_DRM ${LVGL_CONFIG_USE_DR=
M}|g" \
+		-e "s|\(^#  define DRM_CARD \).*|#  define DRM_CARD \"${LVGL_CONFIG_DR=
M_CARD}\"|g" \
+		-e "s|\(^# define USE_SDL \).*|#  define USE_SDL ${LVGL_CONFIG_USE_SDL=
}|g" \
+		-e "s|\(^#  define USE_SDL_GPU \).*|#  define USE_SDL_GPU 1|g" \
+		-e "s|\(^#  define SDL_DOUBLE_BUFFERED \).*|#  define SDL_DOUBLE_BUFFE=
RED 1|g" \
+	"${S}/lv_drv_conf.h"
=20
-EXTRA_OEMAKE =3D "DESTDIR=3D${D}"
+	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
+		# Add libdrm build dependency
+		sed -i '/^target_link_libraries/ s@lvgl::drivers@& drm@' "${S}/CMakeLi=
sts.txt"
+		# Switch from fbdev to drm usage
+		sed -i 's@fbdev@drm@g' "${S}/main.c"
+		# Pull resolution from DRM instead of hardcoding it
+		sed -i '/disp_drv.hor_res/ d' "${S}/main.c"
+		sed -i '/disp_drv.ver_res/ s@disp_drv.ver_res.*@drm_get_sizes(\&disp_d=
rv.hor_res, \&disp_drv.ver_res, NULL);@' "${S}/main.c"
+	fi
+
+	if [ "${LVGL_CONFIG_USE_SDL}" -eq 1 ] ; then
+		# Add libsdl build dependency
+		sed -i '/^target_link_libraries/ s@lvgl::drivers@& SDL2@' "${S}/CMakeL=
ists.txt"
+		# Switch from fbdev to sdl usage
+		sed -i 's@fbdev_flush@sdl_display_flush@g' "${S}/main.c"
+		sed -i 's@lv_drivers/display/fbdev.h@lv_drivers/sdl/sdl.h@g' "${S}/mai=
n.c"
+		sed -i 's@fbdev@sdl@g' "${S}/main.c"
+	fi
+}
=20
-do_install() {
-	oe_runmake install
+do_install:append() {
+	install -d ${D}${bindir}
+	install -m 0755 ${B}/lvgl_fb ${D}${bindir}/
 }
--=20
2.39.2


