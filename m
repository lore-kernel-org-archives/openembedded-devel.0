Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7389EC43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 09:09:53 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40731.1782896991699498643
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 02:09:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HhiurSM5;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782896991; x=1814432991;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Z4a3IY2A8Egm17JVAOMO3v+wJ7Fsx7heq87R/NB2XnI=;
  b=HhiurSM5E1mSclrtJr4jXI1evbTxyPy/vvNgoYAf4BAjVrypX6N6qLGz
   07udPNoI5MOe5P7szj5PgNO7bLHJ0r3EQYSeD+38iAsVCzR0bdFTcrXop
   CxB3mfDmBK3WaoUrQlJ/OtPKiHrprxVLfknxRMTkVUdbU+r5dw4Yt4Yej
   Kr/xWHuZNwRyAzXXaLB7qeKxvp1aXBc99awl4anV9L1NNufr6Tu7e3gXv
   WgY1riv7nfwmSHR5Wa6S0uDEDM+eIc2u3MVcUYeTUYLkR4MeQBOYBWyxt
   sVely2bpVD+gRWloZHNdtiIenOg2HpA7K4tiNSy88cIRbBA89YjuNHLmZ
   A==;
X-CSE-ConnectionGUID: n0YBur0vSIW4RUp6HynuIg==
X-CSE-MsgGUID: 1EnOJQ/2TJSan3jZIuG+Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="233909624"
X-IronPort-AV: E=Sophos;i="6.24,235,1774278000"; 
   d="scan'208";a="233909624"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 18:09:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9998E1C01681
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2026 09:09:49 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 5276614003D5
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2026 09:09:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 808C2405E2A;
	Wed,  1 Jul 2026 09:09:47 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] fastfetch: upgrade 2.64.2 -> 2.65.2
Date: Wed,  1 Jul 2026 17:09:42 +0800
Message-ID: <20260701090942.419-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 09:09:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127991

From: Wang Mingyu <wangmy@fujitsu.com>

* Drop drm-amdgpu PACKAGECONFIG (removed upstream, replaced by raw ioctl)
* Replace vaapi with va-drm and va-x11 (upstream split, commits:
  55eb3c59, eff0108b)
* Adjust PACKAGECONFIG defaults to reflect the changes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{fastfetch_2.64.2.bb => fastfetch_2.65.2.bb}       | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-support/fastfetch/{fastfetch_2.64.2.bb => fastfetch_2.65.2.bb} (91%)

diff --git a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
similarity index 91%
rename from meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
rename to meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
index 8a953508eb..33a0d2fbf0 100644
--- a/meta-oe/recipes-support/fastfetch/fastfetch_2.64.2.bb
+++ b/meta-oe/recipes-support/fastfetch/fastfetch_2.65.2.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2090e7d93df7ad5a3d41f6fb4226ac76"
 DEPENDS = "yyjson"
 
 SRC_URI = "git://github.com/fastfetch-cli/fastfetch.git;protocol=https;branch=master;tag=${PV}"
-SRCREV = "636471c3669201b37fca587e2882eaf3c7062aeb"
+SRCREV = "0e90f3a7d4ac5a7857a968a6f52ea1205be5f404"
 
 inherit cmake pkgconfig
 
@@ -24,18 +24,18 @@ EXTRA_OECMAKE += "\
 PACKAGECONFIG ??= "\
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'egl', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'glx', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrandr', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xcb xrandr va-x11', '', d)} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'opencl pulseaudio vulkan wayland', d)} \
     dbus \
     drm \
     sqlite3 \
+    va-drm \
 "
 
 PACKAGECONFIG[chafa] = "-DENABLE_CHAFA=ON,-DENABLE_CHAFA=OFF,chafa"
 PACKAGECONFIG[dbus] = "-DENABLE_DBUS=ON,-DENABLE_DBUS=OFF,dbus"
 PACKAGECONFIG[dconf] = "-DENABLE_DCONF=ON,-DENABLE_DCONF=OFF,dconf"
 PACKAGECONFIG[ddcutil] = "-DENABLE_DDCUTIL=ON,-DENABLE_DDCUTIL=OFF,ddcutil"
-PACKAGECONFIG[drm-amdgpu] = "-DENABLE_DRM_AMDGPU=ON,-DENABLE_DRM_AMDGPU=OFF,"
 PACKAGECONFIG[drm] = "-DENABLE_DRM=ON,-DENABLE_DRM=OFF,libdrm"
 PACKAGECONFIG[egl] = "-DENABLE_EGL=ON,-DENABLE_EGL=OFF,virtual/egl"
 PACKAGECONFIG[elf] = "-DENABLE_ELF=ON,-DENABLE_ELF=OFF,elfutils"
@@ -49,7 +49,8 @@ PACKAGECONFIG[opencl] = "-DENABLE_OPENCL=ON,-DENABLE_OPENCL=OFF,opencl-headers v
 PACKAGECONFIG[pulseaudio] = "-DENABLE_PULSE=ON,-DENABLE_PULSE=OFF,pulseaudio"
 PACKAGECONFIG[rpm] = "-DENABLE_RPM=ON,-DENABLE_RPM=OFF,rpm"
 PACKAGECONFIG[sqlite3] = "-DENABLE_SQLITE3=ON,-DENABLE_SQLITE3=OFF,sqlite3"
-PACKAGECONFIG[vaapi] = "-DENABLE_VA=ON,-DENABLE_VA=OFF,libva"
+PACKAGECONFIG[va-drm] = "-DENABLE_VADRM=ON,-DENABLE_VADRM=OFF,libva"
+PACKAGECONFIG[va-x11] = "-DENABLE_VAX11=ON,-DENABLE_VAX11=OFF,libva"
 PACKAGECONFIG[vdpau] = "-DENABLE_VDPAU=ON,-DENABLE_VDPAU=OFF,libvdpau"
 PACKAGECONFIG[vulkan] = "-DENABLE_VULKAN=ON,-DENABLE_VULKAN=OFF,vulkan-loader"
 PACKAGECONFIG[wayland] = "-DENABLE_WAYLAND=ON,-DENABLE_WAYLAND=OFF,wayland"
@@ -57,7 +58,6 @@ PACKAGECONFIG[xcb] = "-DENABLE_XCB_RANDR=ON,-DENABLE_XCB_RANDR=OFF,libxcb"
 PACKAGECONFIG[xrandr] = "-DENABLE_XRANDR=ON,-DENABLE_XRANDR=OFF,libxrandr"
 PACKAGECONFIG[zfs] = "-DENABLE_LIBZFS=ON,-DENABLE_LIBZFS=OFF,zfs"
 PACKAGECONFIG[zlib] = "-DENABLE_ZLIB=ON,-DENABLE_ZLIB=OFF,zlib"
-
 PACKAGES =+ "${PN}-completions"
 
 FILES:${PN} += "${datadir}/licenses"
-- 
2.43.0


