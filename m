Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CF6ECDE005
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:02 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3561.1782295132791835080
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aVIk/d5h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295137; x=1813831137;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=EbbzvJk0fxcsrYNoPOdjz4k0bhVbEwHPpb5byx2rPFI=;
  b=aVIk/d5hIBOVpSFi9UoUAPOVtklWOMfb/RHlfM+KOdy5oiMfU11rDqYi
   HMvAdNXI+RbTMcGC872ZxG1+2EXGp0DeI/RnmnR/wj29gL5SyzXGGYpp+
   /ISorB7gjsL5ZRoYnnpHwMzjd/FmfuuliDXFyAlzo+E/8h8egybz5CKIQ
   mlre3TGUUFflZISolz0b+EEvvUiCF8DCZKt4fla3Y8TDVgMxZyyXsXhbm
   0DP47s9W6HChYLa8V5drWa2ksMdg9bfdLo/GMxmypfPHCMaq3MoqBXxOP
   Vh3tFuWAq1pxqAbK36WBKPFn0yOT044CrO58YOZ2wOFoyOfCNsNKhp4nB
   g==;
X-CSE-ConnectionGUID: z+F3LMSFSpuwXkofrAb5Rg==
X-CSE-MsgGUID: yHLLVx6KRhCMyBo2C0flMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="245113333"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="245113333"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:56 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 5112282073B
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:55 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 07586180A31B
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:55 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 48D4182DDF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:53 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 4/5] ftgl: Use virtual/freeglut instead of freeglut
Date: Wed, 24 Jun 2026 17:58:44 +0800
Message-ID: <20260624095845.2294-5-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
References: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127711

Use virtual/freeglut to depends on split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
index c5c547186f..eac65e7c0b 100644
--- a/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
+++ b/meta-oe/recipes-graphics/ftgl/ftgl_2.4.0.bb
@@ -9,7 +9,7 @@ REQUIRED_DISTRO_FEATURES = "opengl x11"
 
 DEPENDS += " \
     freetype \
-    freeglut \
+    virtual/freeglut \
 "
 SRCREV = "b787042cc1d1e4861337d5f9a6727e4c6900a4f2"
 PV .= "+git"
-- 
2.43.0


