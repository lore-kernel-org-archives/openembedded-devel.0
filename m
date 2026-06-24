Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E7DCCDE002
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:01 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3563.1782295134392619395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=noFq9TMl;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295134; x=1813831134;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=dFmZLpOshfTQghxzW58gBNvPC3LPoxlzTHZ1d5MKyCU=;
  b=noFq9TMlG9EP5V6WAGiE6pFQFltEvHY6fRCFld1R+ZCZMZoxpge8BwaR
   67OopB1rFjc0laoVDEjYtiKad/YetwWzvrE997qM3KD4gwiqahK31Mjft
   shHY/fRhYi2xE3WJdvnVDC3mnKHU7iGn+YO6tVZsYgJZcchfWRAQFxhr/
   U3SjyBxqnt4VKCJP7ip5B6RVvK2qc1omsXXVBsc93Uvl7/Ye4y8hOOEAi
   PdHI4mQaR5ORaT8LGPl402GKWVdmAbNUZDLG9y5jatYd8mFNsRytwigNH
   kCH0F03ILIfgVeoTtTSX8Hm+B3Nt8Rp4AiHe0pix3LbxAF1T96Fxtv2GR
   w==;
X-CSE-ConnectionGUID: HyUgzMeVSLy7oD1SOI6xug==
X-CSE-MsgGUID: 50J3KXXtS1ijJYmH4og9Vw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="231346337"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="231346337"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:52 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 9460D1000157
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:52 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 49A4E100008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:52 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 3B48D82DDEE
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:49 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 2/5] freeglut: Add virtual/freeglut to PROVIDES
Date: Wed, 24 Jun 2026 17:58:42 +0800
Message-ID: <20260624095845.2294-3-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
References: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127709

Since commit f7735c920472 ("freeglut: split normal and gles packages")
in meta-oe, the freeglut recipe only provides the classic OpenGL version,
while the GLES-compatible variant is now available as freeglut-gles.

The jasper,ftgl and opencl-cts package fails to configure when depending on freeglut in a
GLES-only build environment, because freeglut's do_configure cannot
locate the legacy OpenGL libraries.
So add virtual/freeglut to provide split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
index 7d1e8b6856..407fd831ba 100644
--- a/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
+++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
@@ -26,7 +26,7 @@ PACKAGECONFIG[x11] = ",,virtual/libx11 libice libxmu libglu libxrandr libxext"
 # error by clang16+ and this is not really a problem
 CFLAGS += "-Wno-implicit-function-declaration"
 
-PROVIDES += "mesa-glut"
+PROVIDES += "mesa-glut virtual/freeglut"
 
 DEPENDS = "virtual/libgl libxi"
 
-- 
2.43.0


