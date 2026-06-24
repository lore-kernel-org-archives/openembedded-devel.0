Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0651BCDE004
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 09:59:02 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3563.1782295134392619395
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Jun 2026 02:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PpmYsruX;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782295135; x=1813831135;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tQtTbq2hZTQMU5Ziqdo05enDaM9jElNi8wOAWKa0vtM=;
  b=PpmYsruXgxA0MEm7G9JcEKzUv9A3qbBSszH/kDTmee5l7mEll5TNQ/8i
   NQBQdGzOgArYbOJwW8dA1wu2lcxGuw8r0ATHQPHuHogp/Ni01LJuR3RtW
   pxxF7A/Sy+tmbAImlquYAKN5QVG8VvbnCKXKVo/arRkkimB9lP+M5U8E6
   hW55T1JvrlgseKgfHTGUkoIc/HCXuwiy5cbT9JPzWy2GneSsgxryrg6w7
   6Tw32piGmy0SuV3ErEeqY88gNS3OR4SnBEEmqoU448SWFcs5NN3Hh0qa8
   7IHGIOKRq9WDRJw55otK3chZoiGhdHAs+PWDN2xPbtI/jlKNJLjZ5F49O
   Q==;
X-CSE-ConnectionGUID: 6Cs7tCBLRdidjxkO0RWOyQ==
X-CSE-MsgGUID: W5Qbp6ENR3CafQvIwTWV6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11826"; a="231346341"
X-IronPort-AV: E=Sophos;i="6.24,222,1774278000"; 
   d="scan'208";a="231346341"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2026 18:58:54 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id E1DBF1C000E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:53 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 956D31C0029A
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:53 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id F116582DDF1
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:58:51 +0000 (UTC)
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 3/5] jasper: Use virtual/freeglut instead of freeglut
Date: Wed, 24 Jun 2026 17:58:43 +0800
Message-ID: <20260624095845.2294-4-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
References: <20260624095845.2294-1-zhengrq.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Jun 2026 09:59:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127710

Use virtual/freeglut to depends on split version of freeglut.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
index b48fff7081..004231d556 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.2.9.bb
@@ -21,7 +21,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl x11', 'opengl
 		   jpeg"
 
 PACKAGECONFIG[jpeg] = "-DJAS_ENABLE_LIBJPEG=ON,-DJAS_ENABLE_LIBJPEG=OFF,jpeg,"
-PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,freeglut,"
+PACKAGECONFIG[opengl] = "-DJAS_ENABLE_OPENGL=ON,-DJAS_ENABLE_OPENGL=OFF,virtual/freeglut,"
 
 do_install:append() {
     chrpath -d ${D}${bindir}/jasper
-- 
2.43.0


