Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F0B10A1E92
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:57:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45639.1774526217146304796
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:56:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=lEHzFAAR;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526216; x=1806062216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eFsq/kg1rKjOcuVAslu7hRNTSO5ejbRTbZe/EQd1bCY=;
  b=lEHzFAAR7Ic9Xt23xHqB21NYWYTNZi4YeIHFBWNLE/8cci1s0GeG+qa+
   JPUymQcZZ8e0gJqmemFBlbAJ30MTpo5l1ENDt/TGfeBJFjqdV1AG69ghf
   qLPlO2DXym/xUwt3W5hXAkm5DDi/WFa28M5cqdI7+3sFA5al5n89B7IfV
   6HnTWzeQrFqHJEo5oVozh2zYzqD3ustJIDxTtZYZR4BDVW4oTOakS3ceM
   iIjz78oDBGLnZ2PgGhCzIKpGAo6dmTmoNbi65Qsb0VUTOsTkYIul6LtXJ
   OJglax7aBemrJSbnzpMkrvu//upNs/fANGxeyNIXL5qVGtYum178Fd93c
   Q==;
X-CSE-ConnectionGUID: LIOxN7K8SWyeAFcKaCBddg==
X-CSE-MsgGUID: 4bY65KPfR4yG1bThggWUdQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="222181244"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="222181244"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:56:55 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 327F91C166CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:57 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DFBF5181AA4C
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:56:56 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 8DEFA180714B;
	Thu, 26 Mar 2026 11:56:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH 10/63] gegl: upgrade 0.4.66 -> 0.4.68
Date: Thu, 26 Mar 2026 19:55:40 +0800
Message-ID: <20260326115634.1199-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125665

From: Wang Mingyu <wangmy@fujitsu.com>

0001-gegl-Add-gegl-arm.def-file.patch
removed since it's included in 0.4.68

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-gegl-Add-gegl-arm.def-file.patch     | 53 -------------------
 .../gegl/{gegl_0.4.66.bb => gegl_0.4.68.bb}   |  6 +--
 2 files changed, 2 insertions(+), 57 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
 rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.66.bb => gegl_0.4.68.bb} (93%)

diff --git a/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch b/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
deleted file mode 100644
index 1a2d39af4a..0000000000
--- a/meta-gnome/recipes-gimp/gegl/gegl/0001-gegl-Add-gegl-arm.def-file.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 69c263ae5f3d4a2d251e00c7236efd035db2bb5a Mon Sep 17 00:00:00 2001
-From: Bruno Lopes <brunvonlope@outlook.com>
-Date: Sat, 13 Dec 2025 08:48:21 -0300
-Subject: [PATCH] gegl: Add gegl-arm.def file
-
-Fix def-file problem in arm environment.
-
-Problem found in gegl/gegl.def
-  the following symbols are in the library,
-  but are not listed in the .def-file:
-     + gegl_downscale_2x2_arm_neon
-     + gegl_downscale_2x2_get_fun_arm_neon
-     + gegl_downscale_2x2_nearest_arm_neon
-     + gegl_resample_bilinear_arm_neon
-     + gegl_resample_boxfilter_arm_neon
-     + gegl_resample_nearest_arm_neon
-
-Upstream-Status: Backport [https://github.com/GNOME/gegl/commit/69c263ae5f3d4a2d251e00c7236efd035db2bb5a]
-Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
----
- gegl/gegl-arm.def | 6 ++++++
- gegl/meson.build  | 2 +-
- 2 files changed, 7 insertions(+), 1 deletion(-)
- create mode 100644 gegl/gegl-arm.def
-
-diff --git a/gegl/gegl-arm.def b/gegl/gegl-arm.def
-new file mode 100644
-index 000000000..cb8277cf6
---- /dev/null
-+++ b/gegl/gegl-arm.def
-@@ -0,0 +1,6 @@
-+  gegl_downscale_2x2_arm_neon
-+  gegl_downscale_2x2_get_fun_arm_neon
-+  gegl_downscale_2x2_nearest_arm_neon
-+  gegl_resample_bilinear_arm_neon
-+  gegl_resample_boxfilter_arm_neon
-+  gegl_resample_nearest_arm_neon
-diff --git a/gegl/meson.build b/gegl/meson.build
-index 0548b069d..85e89bbd2 100644
---- a/gegl/meson.build
-+++ b/gegl/meson.build
-@@ -102,7 +102,7 @@ if host_cpu_family == 'x86_64'
-   simd_extra_def = ['gegl-x86_64.def']
- elif host_cpu_family == 'arm'
-   simd_extra = [lib_gegl_arm_neon]
--  simd_extra_def = []
-+  simd_extra_def = ['gegl-arm.def']
- else
-   simd_extra = []
-   simd_extra_def = []
--- 
-2.43.0
-
diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb
similarity index 93%
rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb
index 3ec7457866..83612aa3f7 100644
--- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.66.bb
+++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.68.bb
@@ -27,10 +27,8 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
 SHPV = "${@gnome_verdir("${PV}")}"
 
-SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz \
-           file://0001-gegl-Add-gegl-arm.def-file.patch \
-          "
-SRC_URI[sha256sum] = "92b05855e2190868949d70cea6e9a50b163a6a441242e740a6263975379f993b"
+SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
+SRC_URI[sha256sum] = "5002309b9a701260658e8b3a61540fd5673887cef998338e1992524a33b23ae3"
 
 PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
 PACKAGECONFIG:class-native = "librsvg"
-- 
2.43.0


