Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEF0ECDB479
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:00 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3561.1782295132791835080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l1QhJATR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295134; x=1813831134;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=sEkYkUZ1c77sjP6CpUm+Feq2NWFuSTiglBW6G/cbIqk=;
  b=l1QhJATRtCHODZi+9ylPxMqXKvj82hHw0+8HBeDuNiXGcz79oqGGfnpd
   qMoDwDdTqKmhM/fw+mlvTU+BLg8GZ2DaIlt8aivXwhCYOEcl/qoqweyTG
   JR0tPFzBV77JMz2DvUFt6Ba0cEew03+V7HaDO3jkozJuo0RTZ3ucWQuu1
   qZrtlrCHiqd0JGkZAdNKSM6sTMQeTwGonDvWGq7tj0M4HYlep2EFC5yh2
   7t+uMBukKMelqGoDNQt0E48PHU3qUNyn2ILMdIvkTLFh6nJ3uC0DFIAoq
   yDo8RX9Oe5e7WH158tTef5tf3OfdQBLFeGzrUN0U2LbscTrCabjcVHrkx
   Q==;
X-CSE-ConnectionGUID: ezX6CCYTQLC+MEwQ2jYeUA==
X-CSE-MsgGUID: D0+jj/jPRPOj2JGJZ1pKMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="245113330"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="245113330"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:52 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id DAFDD1000157
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:50 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 8C4411C0029A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:50 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id EC6C982DDF1
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:48 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/5] freeglut: Add symbol link to fix opencl-cts compile error
Date: Wed, 24 Jun 2026 17:58:41 +0800
Message-ID: <20260624095845.2294-2-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
References: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127708

opencl-cts depends on freeglut which will cause can't find so file error as:
opencl-cts/2026.05.05/recipe-sysroot-native/usr/bin/aarch64-oe-linux/aarch64-oe-linux-ld: cannot find -lglut: No such file or directory

It was caused by the CMake definition in opencl-cts

In test_conformance/gl/CMakeLists.txt, it will always find glut file to link but the realname is libfreeglut-gles.so or libfreeglut.so.
  if(WIN32)
  ......
      list(APPEND CLConform_LIBRARIES opengl32 freeglut glew32)
  else(WIN32)
      list(APPEND CLConform_LIBRARIES  GL glut GLEW GLU)
  endif(WIN32)

So add symbol link for so file in freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index a00519f0d7..7d1e8b6856 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -36,4 +36,9 @@ UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 do_install:append() {
     # Remove buildpaths
     sed -i "s#${RECIPE_SYSROOT}##g" ${D}${libdir}/cmake/FreeGLUT/FreeGLUTTargets.cmake
+    if [ -f "${D}${libdir}/libfreeglut-gles.so" ]; then
+        ln -sf libfreeglut-gles.so ${D}${libdir}/libglut.so
+    else
+        ln -sf libfreeglut.so ${D}${libdir}/libglut.so
+    fi
 }
-- 
2.43.0


