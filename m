Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03411CDE009
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 02:04:50 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2825.1782353088818582848
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 19:04:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EpGBtJXR;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782353090; x=1813889090;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j5SjVy9Jj/uyTsDbg7vSi70uCAsR/c/ixdEft3T2uHg=;
  b=EpGBtJXRD0NlmzOv2r9vaSsrmSDSgKb70QYTb0UIKRngDjlubWBe5hPC
   vB8lnkneq7lNZECCRhvbDE3FFKts4aKvzqUWvpLo4zot7H8rYmxwosCVg
   ZPwSF/SuK65g5s6+QKlHtenFb0fw60m+bkyIVl6fiK0CeZhfSoqscSov6
   2a9CVpC+EAsTvx6qbhEQFL3sWmcPW+iVyx9wMkMTqk0gWOkjcavwp8iU2
   z9Egj4zWIAHB/WMPJ8VbCty9+i4pZv1gHLCrSSmi0XHuHtPg0/eMr1NFe
   DdTJgFO7ZoTtv2Qjek4fNhga/bullV0b+GHia7tebryv7dqd6fWHSFH4s
   w==;
X-CSE-ConnectionGUID: DwUbyP5jTXmUgT6gLD7mHA==
X-CSE-MsgGUID: 54PFCHKcSD2DgZqdsfFcHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="224129976"
X-IronPort-AV: E=Sophos;i="6.24,223,1774278000"; 
   d="scan'208";a="224129976"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 11:04:48 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0F09A1000346
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:47 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B768E1C00286
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:46 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 18ADD101BB5A
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:44 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH v2 5/5] opencl-cts: Use virtual/freeglut instead of freeglut
Date: Thu, 25 Jun 2026 10:04:37 +0800
Message-ID: <20260625020437.2824-6-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
References: <20260625020437.2824-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 02:04:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127731

Use virtual/freeglut to depends on split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb b/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
index e99c305d9a..08425eaaf8 100644
--- a/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
+++ b/meta-oe/recipes-core/opencl/opencl-cts_2026.05.05.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG = " \
 	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl gles', '', d)} \
 	${@bb.utils.filter('DISTRO_FEATURES', 'vulkan', d)} \
 "
-PACKAGECONFIG[opengl] = "-DGL_IS_SUPPORTED=ON,-DGL_IS_SUPPORTED=OFF,virtual/libgl glew freeglut"
+PACKAGECONFIG[opengl] = "-DGL_IS_SUPPORTED=ON,-DGL_IS_SUPPORTED=OFF,virtual/libgl glew virtual/freeglut"
 PACKAGECONFIG[gles] = "-DGLES_IS_SUPPORTED=ON,-DGLES_IS_SUPPORTED=OFF,virtual/egl virtual/libgles2"
 PACKAGECONFIG[vulkan] = "-DVULKAN_IS_SUPPORTED=ON,-DVULKAN_IS_SUPPORTED=OFF,vulkan-headers glslang-native"
 
-- 
2.43.0


