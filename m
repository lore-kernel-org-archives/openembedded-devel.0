Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85950E6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 06:47:59 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.75609.1766386070548515117
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Dec 2025 22:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lgi7StWp;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766386069; x=1797922069;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=+AKqWjhhHCrbnAVt9sd+ILaGSg6tFKbGifdLdKdj6m8=;
  b=lgi7StWpdMAdjtnISO6FcMWIowWR2LE6Hp/44CctNY1tXuclS4IoOQbB
   nS3Ydkh8W6hB3w3xhcd3PAXyTeHOAbTSdiGLmYaSyZDa6gT1QWMgcdyot
   ftn63yH2nxoPTW56iom/piMUcdtnM9iu1INsQ3GjVhiC075LE27h39hMd
   vbqMnOdU43e67QCePTgkzPIsQOC5lQ4Y7cqus1P7/gbeG+gi2HwidmAYq
   Tc65abM3AsRDAwAUCC+UHxCY/J9Y2fu+UDweW10/S+yw7fELRDpk2CQ4C
   kKBDS52SJ2kyhrYMUSWGcEEY02H8mhW+1qarDKnKCHlO3c9qQmtGBquwb
   w==;
X-CSE-ConnectionGUID: xCzjrv6rRVi1GjDIYPofng==
X-CSE-MsgGUID: atOSPrgGTpOgBxrBjP+frg==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="202429156"
X-IronPort-AV: E=Sophos;i="6.21,167,1763391600"; 
   d="scan'208";a="202429156"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 15:47:47 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id A961BC00354
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:47:48 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 632C514003CD
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:47:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 23D20101BB71
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:47:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH V2 4/5] gegl: upgrade 0.4.64 -> 0.4.66
Date: Mon, 22 Dec 2025 14:47:40 +0800
Message-ID: <20251222064741.691-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 06:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122783

Add 0001-gegl-Add-gegl-arm.def-file.patch to fix compile fails on qemuarm.

  Problem found in gegl/gegl.def
    the following symbols are in the library,
    but are not listed in the .def-file:
       + gegl_downscale_2x2_arm_neon
       + gegl_downscale_2x2_get_fun_arm_neon
       + gegl_downscale_2x2_nearest_arm_neon
       + gegl_resample_bilinear_arm_neon
       + gegl_resample_boxfilter_arm_neon
       + gegl_resample_nearest_arm_neon

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../0001-gegl-Add-gegl-arm.def-file.patch     | 53 +++++++++++++++++++
 .../gegl/{gegl_0.4.64.bb => gegl_0.4.66.bb}   |  6 ++-
 2 files changed, 57 insertions(+), 2 deletions(-)
 create mode 100644 meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.64.bb => gegl_0.4.66.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch b/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
new file mode 100644
index 0000000000..1a2d39af4a
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
@@ -0,0 +1,53 @@
+From 69c263ae5f3d4a2d251e00c7236efd035db2bb5a Mon Sep 17 00:00:00 2001
+From: Bruno Lopes <brunvonlope@outlook.com>
+Date: Sat, 13 Dec 2025 08:48:21 -0300
+Subject: [PATCH] gegl: Add gegl-arm.def file
+
+Fix def-file problem in arm environment.
+
+Problem found in gegl/gegl.def
+  the following symbols are in the library,
+  but are not listed in the .def-file:
+     + gegl_downscale_2x2_arm_neon
+     + gegl_downscale_2x2_get_fun_arm_neon
+     + gegl_downscale_2x2_nearest_arm_neon
+     + gegl_resample_bilinear_arm_neon
+     + gegl_resample_boxfilter_arm_neon
+     + gegl_resample_nearest_arm_neon
+
+Upstream-Status: Backport [https://github.com/GNOME/gegl/commit/69c263ae5f3d4a2d251e00c7236efd035db2bb5a]
+Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+---
+ gegl/gegl-arm.def | 6 ++++++
+ gegl/meson.build  | 2 +-
+ 2 files changed, 7 insertions(+), 1 deletion(-)
+ create mode 100644 gegl/gegl-arm.def
+
+diff --git a/gegl/gegl-arm.def b/gegl/gegl-arm.def
+new file mode 100644
+index 000000000..cb8277cf6
+--- /dev/null
++++ b/gegl/gegl-arm.def
+@@ -0,0 +1,6 @@
++  gegl_downscale_2x2_arm_neon
++  gegl_downscale_2x2_get_fun_arm_neon
++  gegl_downscale_2x2_nearest_arm_neon
++  gegl_resample_bilinear_arm_neon
++  gegl_resample_boxfilter_arm_neon
++  gegl_resample_nearest_arm_neon
+diff --git a/gegl/meson.build b/gegl/meson.build
+index 0548b069d..85e89bbd2 100644
+--- a/gegl/meson.build
++++ b/gegl/meson.build
+@@ -102,7 +102,7 @@ if host_cpu_family == 'x86_64'
+   simd_extra_def = ['gegl-x86_64.def']
+ elif host_cpu_family == 'arm'
+   simd_extra = [lib_gegl_arm_neon]
+-  simd_extra_def = []
++  simd_extra_def = ['gegl-arm.def']
+ else
+   simd_extra = []
+   simd_extra_def = []
+-- 
+2.43.0
+
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
index 1a31f60f94..3ec7457866 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.64.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
@@ -27,8 +27,10 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
-SRC_URI[sha256sum] = "0de1c9dd22c160d5e4bdfc388d292f03447cca6258541b9a12fed783d0cf7c60"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
+           file://0001-gegl-Add-gegl-arm.def-file.patch \
+          "
+SRC_URI[sha256sum] = "92b05855e2190868949d70cea6e9a50b163a6a441242e740a6263975379f993b"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"
-- 
2.43.0


