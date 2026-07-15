Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF981C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:39:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3414.1784111979570710578
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:39:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OyXDstrc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784111982; x=1815647982;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=iCw6g6th568WGpBR3LEYz9HDiQPwUhPIZQi+nYMzSto=;
  b=OyXDstrcnrCF+LLWEYWUweDwppSAps7WHcPuFRk3lZuNHhNVFTJImH8K
   3Dscqq7cDMOMCpylqsHcU7Fu5ZR+NSpT6fztmXCVP5Hkf+JvzAj0BVy1H
   a+DpOmYGgogCKpXDAMJGFOyuWEVWppn4TqvfJMqyxB7r3WBOusE7xetAG
   2x1SEHZLsbX09dW6+5VCPFUk1K9NZGWzAxV+DvAdsqxkNir/isiSNoxy2
   kRNMICHGR2nmZ7g5St1J/bxmYXaCItIicOtnccRT9R356eThKRMtAofGm
   DKgXEMMk1/Cv6A6fVCxC5Q0Tgxm3J3FSrF2J+k6x+xzEkvVAVA2QIsPBK
   Q==;
X-CSE-ConnectionGUID: zMQpBYckSVOPop664DJJMw==
X-CSE-MsgGUID: WVbN7p3mQ7+wGn0gJSXgFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="250998990"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="250998990"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:39:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C1626100014F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:37 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 6D275102095F
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 74094180113F;
	Wed, 15 Jul 2026 10:39:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/44] freerdp3: upgrade 3.27.1 -> 3.28.0
Date: Wed, 15 Jul 2026 18:38:33 +0800
Message-ID: <20260715103914.2120-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:39:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128176

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freerdp/{freerdp3_3.27.1.bb => freerdp3_3.28.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freerdp/{freerdp3_3.27.1.bb => freerdp3_3.28.0.bb} (99%)

diff --git a/meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb b/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
similarity index 99%
rename from meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb
rename to meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
index f01fd5634b..628b69cc2c 100644
--- a/meta-oe/recipes-support/freerdp/freerdp3_3.27.1.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp3_3.28.0.bb
@@ -8,7 +8,7 @@ RDEPENDS:${PN}-ptest += "cmake coreutils"
 
 inherit pkgconfig cmake ptest
 
-SRCREV = "6099a8d64624458ebce20e185a6d02a3ea791842"
+SRCREV = "5370fb26fbf034ecd11d3026b6ad639b5fff493f"
 SRC_URI = "git://github.com/FreeRDP/FreeRDP.git;nobranch=1;protocol=https;tag=${PV} \
            file://run-ptest"
 
-- 
2.43.0


