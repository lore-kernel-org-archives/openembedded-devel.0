Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B871CFD379
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 09:12:18 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13192.1764061930390092637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 01:12:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ites07Ss;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764061931; x=1795597931;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=i5d3QdWPOwdo88kgP2lCcKjw6Srhz9l3BmSPhBMBVLY=;
  b=ites07SsWmBQovdDQJXOnIo4eYnVUZpzECkO1sk62zR6qI4/KAWNxrpK
   8Fw7ZKi8SuGrgCVSk1enorc9JADcTp+HpXfK59aYUzLSZle3nsvU/sXVt
   yf9O9oaSdQB2EPCdvcPruHHSaM0+jYME0pkB0ge+JUZP5wpj8tkr9gGJQ
   Timu09peHC8sdbst9Lc3pD1qR8CaMiktcx446BHAvQa7LY4QFcUaUzOBZ
   UfO+9RWbxen34VZcBcnn1xO9F0x8IbxecmZK/mYdUE8UgAI9uFrF+bY4q
   k4z7NGs6v2LPh8sLWEJg1B5bKb3o4jYdT+ezzqbt5KoXiefw7g+w5DNHR
   A==;
X-CSE-ConnectionGUID: GOVGKRcSTMak0MLfB0njRA==
X-CSE-MsgGUID: cy5PTuMsQtGBMOiAYWaymQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="224149373"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="224149373"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 18:12:07 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 4242B1471
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:07 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id E24311C002FB
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 9133F14001D4;
	Tue, 25 Nov 2025 09:12:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/26] fuse3: upgrade 3.16.2 -> 3.17.4
Date: Tue, 25 Nov 2025 17:11:32 +0800
Message-ID: <20251125091156.1376-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251125091156.1376-1-wangmy@fujitsu.com>
References: <20251125091156.1376-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 09:12:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122026

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-support/fuse/{fuse3_3.16.2.bb => fuse3_3.17.4.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/fuse/{fuse3_3.16.2.bb => fuse3_3.17.4.bb} (97%)

diff --git a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
similarity index 97%
rename from meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
rename to meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
index 1c91a1aa17..256c663852 100644
--- a/meta-oe/recipes-support/fuse/fuse3_3.16.2.bb
+++ b/meta-oe/recipes-support/fuse/fuse3_3.17.4.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 SRC_URI = "https://github.com/libfuse/libfuse/releases/download/fuse-${PV}/fuse-${PV}.tar.gz"
-SRC_URI[sha256sum] = "f797055d9296b275e981f5f62d4e32e089614fc253d1ef2985851025b8a0ce87"
+SRC_URI[sha256sum] = "df9e40ae927b73dc702d0bce7925c0c618af47ad0b13204fbf2be66e54d8528b"
 
 S = "${UNPACKDIR}/fuse-${PV}"
 
-- 
2.43.0


