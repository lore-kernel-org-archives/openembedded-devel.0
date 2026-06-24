Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BAB8CDB47C
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:00 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3563.1782295134392619395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bAVPpSgC;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295137; x=1813831137;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=j5SjVy9Jj/uyTsDbg7vSi70uCAsR/c/ixdEft3T2uHg=;
  b=bAVPpSgClIcAgezIs8jzNvBw6+RLKLEjerrcudr1xEB73VRdwEm1KScJ
   VZdsDUY2rzJLqgGmyueUIpqLdhGKZskAJ7b1YSziOx8ikq7xIJpyQqZWU
   tgfNZwzG2Khq17o0xxG9JwmDtYIZuIp+vd6ufc3lHkMWXrFwJLrJnXVXj
   mfCPoA1fwZtnOm6X8sSSGhqUT1zeLZYuNxi8XZAkW5aqpisSWPE/11NYp
   XCUNRRuiWVpKs4osNo7Ok3HUyyDgZ2EObm/162jRcFkCzq6e23Z1tFL3h
   o1ZI/737HYvdTCFfTjAKUtB2hSbocimx2uVBNSN6Dhc1onIHyJysW8HiR
   w==;
X-CSE-ConnectionGUID: RlnYZLBWSlGdbjGXfYAxJA==
X-CSE-MsgGUID: HbQ/SyhPRm6tVVbfsH0PtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="231346344"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="231346344"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:56 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 971D18200BD
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:56 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4CF6B14003E7
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:56 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 94B6A82DDEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:54 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 5/5] opencl-cts: Use virtual/freeglut instead of freeglut
Date: Wed, 24 Jun 2026 17:58:45 +0800
Message-ID: <20260624095845.2294-6-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
References: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127712

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


