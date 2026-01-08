Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DBB2D14888
	for <webhook@archiver.kernel.org>; Thu,  8 Jan 2026 01:19:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22148.1767835142822845372
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 17:19:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nhrBGDak;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767835143; x=1799371143;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=BzfXAnVNJ4AvQGIkAZbDUD8fe6raIh+NZUk7Y0xU7NA=;
  b=nhrBGDakJFOuwIRb7dwvDe1bYySVmHYj9YrN3RtvR+BjA2p4+JdSvuLU
   343riJYsk9eyVqkLrcqWLSdLV1/7wmIwPxCNyxxzlJZL9kPsJEmbBPZ4F
   58FZ1qviQ+b7jF1u6d6xBdH2BHa8khzZYBJBVIqS8cYglhHWM5W/fV6QV
   4L8q5P3yHcrvIraYSc/Q1XxS7IACDhh9LOChCtTCw+Uunk7/LKzGATFIf
   J5JfLigiF4n3uiPXwf/McGH9943nTPq43VlUcdJidm2heVvqGLmii7cDA
   oBWRx5MdXolBcDUnGu2GcoOjNTxvk8yVG79IloCjypWCLbUO2qlySpE7s
   g==;
X-CSE-ConnectionGUID: 5sRDt07OTKSf61LQ0nAzOg==
X-CSE-MsgGUID: BAJEqpr7TAiFY76+q1wTQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11664"; a="224528150"
X-IronPort-AV: E=Sophos;i="6.21,209,1763391600"; 
   d="scan'208";a="224528150"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 10:19:02 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 597061000345
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 01:19:01 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 0E63C100087F
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 01:19:01 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id B9B1D8214D9
	for <openembedded-devel@lists.openembedded.org>; Thu,  8 Jan 2026 01:18:58 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH] libsdl3: upgrade 3.2.28 -> 3.2.30
Date: Thu,  8 Jan 2026 09:18:55 +0800
Message-ID: <20260108011855.1938-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Jan 2026 01:19:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123242

Changelog:
  https://github.com/libsdl-org/SDL/releases/tag/release-3.2.30

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../libsdl3/{libsdl3_3.2.28.bb => libsdl3_3.2.30.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libsdl3/{libsdl3_3.2.28.bb => libsdl3_3.2.30.bb} (97%)

diff --git a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
similarity index 97%
rename from meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
rename to meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
index 98eebd30e8..bb111050e1 100644
--- a/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.28.bb
+++ b/meta-oe/recipes-graphics/libsdl3/libsdl3_3.2.30.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://www.libsdl.org/release/SDL3-${PV}.tar.gz"
 
 S = "${UNPACKDIR}/SDL3-${PV}"
 
-SRC_URI[sha256sum] = "1330671214d146f8aeb1ed399fc3e081873cdb38b5189d1f8bb6ab15bbc04211"
+SRC_URI[sha256sum] = "4c3b09330d866dc52eb65b66259a6684ad387252ca8c57901b3a2b534eb42e3d"
 
 inherit cmake lib_package binconfig-disabled pkgconfig upstream-version-is-even
 
-- 
2.43.0


