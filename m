Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E5E0C4453E
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 10:25:01 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44805.1784715896305954452
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Jul 2026 03:24:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RiGOatt2;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784715899; x=1816251899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bsqoJsgypb7lRO5e+/AxV1FZiDrBX5tEle079QiAU0k=;
  b=RiGOatt2v6JtxCKnnlbF1D4hugC8aetuqSoTQxqEi/Wh55LntAIxLSHs
   29gQmzkHHkQdRzhq2Pv1Gl5D+fvFdbWxPk1JYXedzc2+IYlTNEa1oE2+n
   5aPJsw7kRagOCTUGew/hKuzq51N2cOFxZ5+eacufUe7qVCo3DHd4NX4Vs
   ie/ebIZnQYyvHj/Trp6AvMYzBbRRWe4qqVa+cKEWSdXzEthO7oEknCCX6
   GGtAJiYG5iWnRh+repXAM1fDAMHECZKQ37MZsHnR3oCk6KzzNnJan63jX
   ip7KIzNZbb/zXoPPpOUyNnJuHVMg1k7LeCuNVDm/vDZ4TAeclLt/AD3kN
   w==;
X-CSE-ConnectionGUID: 1X/4qjoTQvmU0EKDyQZx6Q==
X-CSE-MsgGUID: nybUYwf5SnqnieAUuDd4zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="225933653"
X-IronPort-AV: E=Sophos;i="6.25,178,1779116400"; 
   d="scan'208";a="225933653"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 19:24:57 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id BB27B82008F
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:54 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 7054A14003C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTP id 84CB24064B2;
	Wed, 22 Jul 2026 10:24:52 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 37/37] xkbprint: upgrade 1.0.7 -> 1.0.8
Date: Wed, 22 Jul 2026 18:23:20 +0800
Message-ID: <20260722102320.1019-37-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260722102320.1019-1-wangmy@fujitsu.com>
References: <20260722102320.1019-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Jul 2026 10:25:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128407

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-app/{xkbprint_1.0.7.bb => xkbprint_1.0.8.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xkbprint_1.0.7.bb => xkbprint_1.0.8.bb} (81%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.8.bb
similarity index 81%
rename from meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.8.bb
index 9b8c655acd..0d674c732b 100644
--- a/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xkbprint_1.0.8.bb
@@ -9,5 +9,5 @@ DEPENDS += "libxkbfile"
 
 BBCLASSEXTEND = "native"
 
-SRC_URI[sha256sum] = "1c4f49c030329e0defd8c7bc3739e60f2aa1d2aabe0e2d7e63740ab629aa59cc"
+SRC_URI[sha256sum] = "6dbb3dc79b1d1e17045a65f86e7581e149c75ee5aacae69a6cf685acf78fc31b"
 SRC_URI_EXT = "xz"
-- 
2.43.0


