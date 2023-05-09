Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98050C7EE25
	for <webhook@archiver.kernel.org>; Tue,  9 May 2023 02:44:19 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web10.6992.1683600256897231792
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 19:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=jnFsi3Zn;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 0F90E8479C;
	Tue,  9 May 2023 04:44:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1683600255;
	bh=8kyotzs9VAWrVJoj/FzuppPhpe/Sd5rLKNeLDHYKLxg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnFsi3Zn5Hhe7HLys8oiLyNfwsiKzBdSxdkHx5qnhmMro5m/jxS5FR+rLUSIGbB0O
	 8CK2jTbAcyGkwcc2ZmhRrQCkC7MK4O5A4JmVUdzuwpIcjVwJgylbRN/0FVgoob4akC
	 rR+ihD9gADSgkkY+yhaXzHsiLZ5+tgExAvvsxvnCYzab/ithtbWpbYbD0se5jNTB5c
	 F2AuaMGxu+Xe/I/+1CEecepSqTzlIlPk+T4DvWvIRxodzmpcHnKb1Ct8KIabvPcJ+u
	 AgU54vJjoWaDndnOvlEv/bf9lvyFWUqN8FmH0yMmXi31W20Lv0LwPfrK13Zy2sYmdM
	 Z8sSz3UZixrWQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>,
	Philippe Coval <philippe.coval.ext@huawei.com>,
	Philippe Coval <philippe.coval@huawei.com>
Subject: [meta-oe][PATCH v2 4/7] lvgl: Support both fbdev and wayland backends
Date: Tue,  9 May 2023 04:43:52 +0200
Message-Id: <20230509024355.79006-4-marex@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230509024355.79006-1-marex@denx.de>
References: <20230509024355.79006-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 May 2023 02:44:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102457

The LVGL can be operated on top of fbdev as well as on WL compositor.
Support both, which is a matter of configuring lv-drivers package per
required backend. Determine the backend from DISTRO_FEATURES, since
both 'wayland' and 'fbdev' are valid DISTRO_FEATURES. Add a bit more
sed hacking of the configuration, which enables either FBDEV or WL
backend. One notable item here is the enablement of EVDEV support,
which is required for FBDEV backend, so in case FBDEV is enabled, so
is EVDEV.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
Cc: Philippe Coval <philippe.coval.ext@huawei.com>
Cc: Philippe Coval <philippe.coval@huawei.com>
---
V2: No change
---
 meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb | 15 +++++++++++----
 meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb       |  3 ---
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb b/meta-oe/=
recipes-graphics/lvgl/lv-drivers_8.3.0.bb
index d9cde497c..a0a2ee0aa 100644
--- a/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lv-drivers_8.3.0.bb
@@ -11,12 +11,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd6fc0df890=
c5270ef045981b516bb8f2"
 SRC_URI =3D "git://github.com/lvgl/lv_drivers;protocol=3Dhttps;branch=3D=
release/v8.3"
 SRCREV =3D "71830257710f430b6d8d1c324f89f2eab52488f1"
=20
-DEPENDS =3D "libxkbcommon lvgl wayland"
+DEPENDS =3D "lvgl"
=20
-REQUIRED_DISTRO_FEATURES =3D "wayland"
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'wayland fbde=
v', d)}"
+PACKAGECONFIG[fbdev] =3D ",,"
+PACKAGECONFIG[wayland] =3D ",,libxkbcommon wayland"
+LVGL_CONFIG_USE_FBDEV =3D "${@bb.utils.contains('PACKAGECONFIG', 'fbdev'=
, '1', '0', d)}"
+LVGL_CONFIG_USE_WAYLAND =3D "${@bb.utils.contains('PACKAGECONFIG', 'wayl=
and', '1', '0', d)}"
=20
 inherit cmake
-inherit features_check
=20
 S =3D "${WORKDIR}/git"
=20
@@ -34,7 +37,11 @@ TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/lvgl"
 do_configure:append() {
     [ -r "${S}/lv_drv_conf.h" ] \
         || sed -e "s|#if 0 .*Set it to \"1\" to enable the content.*|#if=
 1 // Enabled by ${PN}|g" \
-               -e "s|#  define USE_WAYLAND       0|#  define USE_WAYLAND=
       1|g" \
+	       \
+               -e "s|\(^#  define USE_FBDEV \).*|#  define USE_FBDEV ${L=
VGL_CONFIG_USE_FBDEV}|g" \
+               -e "s|\(^#  define USE_EVDEV \).*|#  define USE_EVDEV ${L=
VGL_CONFIG_USE_FBDEV}|g" \
+	       \
+               -e "s|\(^#  define USE_WAYLAND \).*|#  define USE_WAYLAND=
 ${LVGL_CONFIG_USE_WAYLAND}|g" \
 	       -e "s|\(^ *# *define *WAYLAND_HOR_RES *\).*|\1${LVGL_CONFIG_WAYL=
AND_HOR_RES}|g" \
  	       -e "s|\(^ *# *define *WAYLAND_VER_RES *\).*|\1${LVGL_CONFIG_WAY=
LAND_VER_RES}|g" \
           < "${S}/lv_drv_conf_template.h" > "${S}/lv_drv_conf.h"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_8.3.7.bb
index a3fd7e04c..860ee7a33 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_8.3.7.bb
@@ -11,10 +11,7 @@ LIC_FILES_CHKSUM =3D "file://LICENCE.txt;md5=3Dbf1198c=
89ae87f043108cea62460b03a"
 SRC_URI =3D "git://github.com/lvgl/lvgl;protocol=3Dhttps;branch=3Dreleas=
e/v8.3"
 SRCREV =3D "2b56e04205481daa6575bd5f7ab5df59d11676eb"
=20
-REQUIRED_DISTRO_FEATURES =3D "wayland"
-
 inherit cmake
-inherit features_check
=20
 EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib}"
 S =3D "${WORKDIR}/git"
--=20
2.39.2


