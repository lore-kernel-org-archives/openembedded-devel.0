Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0788CCD187
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.5569.1759990097314503746
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IjdlAe92;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990097; x=1791526097;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBzwdcnOzXtjKnQEN8zNMbr2KtdRhdv7AAGT5Ytbp40=;
  b=IjdlAe92+QuBA0l1pZrxdoZ5w4YjhlriWLe2zP9rc/6dyB7vgXk5pUNx
   nnejL6y5IkeqUv/4m4s9wF076LoldBKU4w86l+WdtEIz/UK4BKRNbo/q9
   23i+vYzTU+vmXfdza6aiR3e7+zfE64+ZBf8raOH10XC6qacZEwGCX1Ity
   sjkhlvjpAUeaNL6IpH3QOasbCwIQ0nfwT1iOwHtixXRNSlhoXvxk7fpQE
   lgboCcitH3fiFuVB9flvPu2vFLBy/dpvhg0pKtyH2SxoolyTfrOmDchwe
   +4Eedj82i+rLsqmzkMt4WatxXYonvX8Y6PERK7Os44v02cFNNjl0m42yl
   Q==;
X-CSE-ConnectionGUID: 8LkOvQhXR6ShGUrp+13BvQ==
X-CSE-MsgGUID: rOdbPFtaThqRwkCKN0Vr1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="203965715"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="203965715"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:15 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 5DDAE1000352
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:15 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 18C2BC0219D
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 9AAA51001CE2;
	Thu,  9 Oct 2025 06:08:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/22] flatbuffers: upgrade 25.2.10 -> 25.9.23
Date: Thu,  9 Oct 2025 14:07:48 +0800
Message-ID: <20251009060809.445-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120398

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
index 36b448a41c..8f40cbed4a 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.inc
@@ -1,3 +1,3 @@
-PV = "25.2.10"
-SRCREV = "1c514626e83c20fffa8557e75641848e1e15cd5e"
+PV = "25.9.23"
+SRCREV = "187240970746d00bbd26b0f5873ed54d2477f9f3"
 SRC_URI = "git://github.com/google/flatbuffers.git;branch=master;protocol=https"
-- 
2.43.0


