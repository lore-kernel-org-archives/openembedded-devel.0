Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64667C54E69
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 04:51:28 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.9108.1710305480247195775
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Mar 2024 21:51:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=ATjTDdp0;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id BFD8987DE3;
	Wed, 13 Mar 2024 05:51:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1710305478;
	bh=qT/tHwfmL4zLuh2+RrQZ/MibNJiWtqtG/wr9ITE6ml0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ATjTDdp0LOieCiHGdRtG5/kmDObbwcNqBEsmhgVrk7Q2+BY0jXmVFXS/b8Sx2P7GP
	 gaMuIpd6x9jx3w5uPg9djzu5ZK4At44G/XQX3TT/LAfVHH/WlKreGofQMdY5pXJiE5
	 o6HK4l3J1N+a1E9B042p4loFiEf3gsXfFjEneTngXJhVcsxoZKJvmsyiTZiTgmJ3z8
	 TVJu5umsunsnDsJPZS6R+a9yfC219K+DXY2BW997tD5nAWdOBSUVgvvNqBKHgada4p
	 uOqFYIz8JnOe3HlfpwWFvM0DiBBKHBJVymsdwUYpoecYLjF6uU6yKDgadYyQnp8oV3
	 YoVqUkXlAjqGQ==
From: Marek Vasut <marex@denx.de>
To: openembedded-devel@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>,
	Fabio Estevam <festevam@denx.de>,
	Khem Raj <raj.khem@gmail.com>,
	Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH 6/8] lvgl: Default to XRGB8888 DRM framebuffer
Date: Wed, 13 Mar 2024 05:40:09 +0100
Message-ID: <20240313045038.90500-7-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240313045038.90500-1-marex@denx.de>
References: <20240313045038.90500-1-marex@denx.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 Mar 2024 04:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109286

The ARGB8888 framebuffer format for base canvas makes little sense
as the base canvas is unlikely to be transparent and require alpha.
Use XRGB8888 framebuffer format which is more widely supported by
DRM drivers as base plane pixel format.

This is identical to upstream fix for this issue which already landed:
https://github.com/lvgl/lv_drivers/commit/c71e5f84bb2aebaed0644e31b8868bf=
90b199d32
The upstream fix just never made it into the LVGL 9.0.0 for some reason,
an repeated upstream fix is being worked in now.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Fabio Estevam <festevam@denx.de>
Cc: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <martin.jansa@gmail.com>
---
 meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb | 3 +++
 meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb         | 5 +++++
 2 files changed, 8 insertions(+)

diff --git a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb b/meta-o=
e/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
index 0045706ef..ee3d5ab20 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl-demo-fb_9.0.0.bb
@@ -26,6 +26,9 @@ S =3D "${WORKDIR}/git"
 TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
=20
 do_configure:prepend() {
+	# Fix ARGB8888 base plane format misuse again
+	sed -i 's@ARGB8888@XRGB8888@g' "${S}/lvgl/src/drivers/display/drm/lv_li=
nux_drm.c"
+
 	if [ "${LVGL_CONFIG_USE_DRM}" -eq 1 ] ; then
 		# Add libdrm build dependency
 		sed -i '/^target_link_libraries/ s@pthread@& drm@' "${S}/CMakeLists.tx=
t"
diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb b/meta-oe/recipe=
s-graphics/lvgl/lvgl_9.0.0.bb
index 7a109df45..bdd61d891 100644
--- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
+++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
@@ -22,6 +22,11 @@ ALLOW_EMPTY:${PN} =3D "1"
 PACKAGECONFIG ??=3D "drm"
 require lv-conf.inc
=20
+do_configure:prepend() {
+    # Fix ARGB8888 base plane format misuse again
+    sed -i 's@ARGB8888@XRGB8888@g' "${S}/src/drivers/display/drm/lv_linu=
x_drm.c"
+}
+
 FILES:${PN}-dev +=3D "\
     ${includedir}/${PN}/ \
     ${includedir}/${PN}/lvgl/ \
--=20
2.43.0


