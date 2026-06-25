Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A10ACDB47C
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:49 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2822.1782353083857755898
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sRRS/wUJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353084; x=1813889084;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=fvoPF2gvoH/5wjZgYShLprswHkt6fxGEB8XcCQaxvkE=;
  b=sRRS/wUJ4NVwJAFtj3Rj4KDJ8QCWEhhgSgKBMrb9FCe0m1Uy4cmIohP3
   1ggc1AeroIcsSrw4ju9OF7ITVmZbshSPIs4YMs02bjMNJ/zwG7ADl5irW
   ZNPbeJ10a57wZfxPfXrj3IJt9qDazNTg6rMoKgBnhomJkdBweYQF5LbWC
   tX0wtkR2oEi+TrDYM2/WLBapaW9DCWpEGbLJKCzgy5EUHKWR8DWXSeSI/
   972BsFA3FPF6ROxb0TKD623RjjkMrDTa2EzmfHwR+pGrc7FHYVUxQ7gNW
   JdToZQtuWA6IejKspHmc0gH7VnXVVSxUr4DdWEOyKiWx3sdKaNAx+kliR
   g==;
X-CSE-ConnectionGUID: B8SxKz7LSnyanORknaSyuA==
X-CSE-MsgGUID: QQfax7vqR9SFLK2octrujw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="244687288"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="244687288"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:41 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id C26A7100280E
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:41 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7E705C00407
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:41 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id CC1C3101BB71
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:39 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 1/5] freeglut-gles: Add symbol link to fix opencl-cts compile error
Date: Thu, 25 Jun 2026 10:04:33 +0800
Message-ID: <20260625020437.2824-2-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127727

opencl-cts depends on freeglut-gles which will cause can't find so file error when using freeglut-gles as:
opencl-cts/2026.05.05/recipe-sysroot-native/usr/bin/aarch64-oe-linux/aarch64-oe-linux-ld: cannot find -lglut: No such file or directory

It was caused by the CMake definition in opencl-cts

In test_conformance/gl/CMakeLists.txt, it will always find glut file to link but the realname is libfreeglut-gles.so or libfreeglut.so.
  if(WIN32)
  ......
      list(APPEND CLConform_LIBRARIES opengl32 freeglut glew32)
  else(WIN32)
      list(APPEND CLConform_LIBRARIES  GL glut GLEW GLU)
  endif(WIN32)

So add symbol link for so file in freeglut-gles.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index a00519f0d7..f9fe540c63 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -36,4 +36,7 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 do_install:append() {
     # Remove buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
+    if [ -f "${D}${libdir}/libfreeglut-gles.so" ]; then
+        ln -sf libfreeglut-gles.so ${D}${libdir}/libglut.so
+    fi
 }
-- 
2.43.0


