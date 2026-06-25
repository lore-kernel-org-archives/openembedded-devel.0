Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDBACDE008
	for <webhook@archiver.kernel.org>; Thu, 25 Jun 2026 09:01:57 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7001.1782378107121451713
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Jun 2026 02:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=cSAXkdqF;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782378107; x=1813914107;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4FEW2XaJQqyxHifQ58m6mHvAc3LeGcGcHsrYGFsX0Og=;
  b=cSAXkdqFiNrDS9GrNOCT3u+J+HSCN+iBPBLODjV7fn3y4iAp/+/xj9st
   FFeySWVyEMVUofFAThIB2eLYRG5f/llDKmHEYI42zMIoW0mpEKQaVMHec
   1xTsW5XTYzer6zaxyqrEqCf8QP6Qz6sT1LiYpqplvryUxhPJKZywlaYCT
   LTuo2Gc7SwfCVhBtBgbk5fy4gGZ+BVH075Pvc4qrQeqNuxCNI783apTNr
   pAX1jdCIn1Ew8ctckpFiDClYGR3PpvnCUeqdRdEPSlGLD1+nodqim1OYG
   lB5dE5rt/IusdKa8sdCmD2j55zoP/oYa1UG4g0Dm2lzfhwqUc3tvMd7xv
   Q==;
X-CSE-ConnectionGUID: vlGOVqErR92s9V8yhshWAQ==
X-CSE-MsgGUID: 0bTM99qLQOiJ174ypzCmfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11827"; a="245233676"
X-IronPort-AV: E=Sophos;i="6.24,224,1774278000"; 
   d="scan'208";a="245233676"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2026 18:01:45 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 624E31C00184
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:45 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (unknown [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 16BC5C00FDB
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 2B262101732B;
	Thu, 25 Jun 2026 09:01:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/47] libtsm: upgrade 4.5.0 -> 4.6.0
Date: Thu, 25 Jun 2026 17:00:49 +0800
Message-ID: <20260625090127.1563-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260625090127.1563-1-wangmy@fujitsu.com>
References: <20260625090127.1563-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 Jun 2026 09:01:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127741

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- vte: map mouse wheel up/down buttons correctly
- fix CSI default parameter
- vte: Fix ctrl+shift+arrows
- Add a new draw2 interface
- vte: Add dim support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libtsm/{libtsm_4.5.0.bb => libtsm_4.6.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.5.0.bb => libtsm_4.6.0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb b/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
index 9e999fe970..99c603f994 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.6.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM = "\
 DEPENDS = "xkeyboard-config"
 
 SRC_URI = "git://github.com/kmscon/libtsm;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "556373437d1c5f57f4dfc7c6cc1330e5088a4174"
+SRCREV = "e1e4d296f0963d1641456f1f778f0ac090429a3e"
 
 inherit meson pkgconfig
 
-- 
2.43.0


