Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3D6CD6E44
	for <webhook@archiver.kernel.org>; Wed, 27 May 2026 09:48:21 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16919.1779875297331449014
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 May 2026 02:48:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FmPUCVep;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1779875297; x=1811411297;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TQcvsLX4hTYKwHt9g2txC9Jq7JWVXMOvtLkjC7s+FfA=;
  b=FmPUCVepBRsux4C1ewP9eooWjm2UCpLx4EX5s/Qp2iieCvw/4CFfimrJ
   mIAhJ4KzJELULH7/4Dc1CqQMhciI+o0nGbfSls/CmSpz4223+vL+oojdj
   tb31lsFesddxdOKALBLyVYfWVNylvj1As1waY6VrAqsjN9FpQE7voZ40o
   XYaQaoJ421ZRFOEghb8YxZWN+mOdn2tKYk2cJzPwPk6GgT6hc67QUErUz
   0y8UNylTaWUdgCZu/5DazNxqnzNzHK//Vt+W2D264EKt/JiUoXZ6m9rvb
   sQgcS1XzsaCydgAalDsGUdvL7A5KEPwMeK7rggBH30t3/WcCZUZRaDw+L
   g==;
X-CSE-ConnectionGUID: krAdNEgBSN6wmMPMkv2lxA==
X-CSE-MsgGUID: RIP8+t1fTKCEjxEWQaoIZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11798"; a="230008170"
X-IronPort-AV: E=Sophos;i="6.24,171,1774278000"; 
   d="scan'208";a="230008170"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2026 18:48:15 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 9189FC00541
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:15 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 478568319F7
	for <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4FEC882A2D5;
	Wed, 27 May 2026 09:48:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/56] drm-framebuffer: upgrade 0.1 -> 1.0.0
Date: Wed, 27 May 2026 17:47:11 +0800
Message-ID: <20260527094805.2039-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260527094805.2039-1-wangmy@fujitsu.com>
References: <20260527094805.2039-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 May 2026 09:48:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127209

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{drm-framebuffer_git.bb => drm-framebuffer_1.0.0.bb}     | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-graphics/drm-framebuffer/{drm-framebuffer_git.bb => drm-framebuffer_1.0.0.bb} (78%)

diff --git a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
similarity index 78%
rename from meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb
rename to meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
index faffca2059..64aa6f655e 100644
--- a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_git.bb
+++ b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
@@ -5,10 +5,9 @@ SECTION = "graphics"
 LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7702f203b58979ebbc31bfaeb44f219c"
 
-SRC_URI = "git://github.com/embear-engineering/drm-framebuffer;protocol=https;branch=main"
+SRC_URI = "git://github.com/embear-engineering/drm-framebuffer;protocol=https;branch=copilot/create-release-v1-0-0"
 
-PV = "0.1+git"
-SRCREV = "a560c2b810c8f677aaaaa9e9e8b1d13854718aba"
+SRCREV = "09df30960552f23d0fa7471be0caf7f095fcd522"
 
 inherit cmake pkgconfig 
 
-- 
2.43.0


