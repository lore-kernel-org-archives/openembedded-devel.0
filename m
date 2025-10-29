Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9846DCCD1BF
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 00:16:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.27245.1761696954308589112
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Oct 2025 17:15:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pG1ddDPf;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761696954; x=1793232954;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qkST8+UBef2xt1fJTwmP4yuIKGL1d3P/oQktWIQL1SI=;
  b=pG1ddDPf7k28JMnW41Wp0voYzlA33ryAac2dTgowcWQ2NMcvV/hWb9fM
   veoh2eKVlen3rttwco+wp9DpFYjqhFSVswn0PmW3DbzB1/+jceH3Zufgf
   gOopc61CC6e9lTZ7XSMdOkjQGXsc448C4sLSjoQ66bb+iJrGFj0NLHvjZ
   VCvOXVBhhckFT/nbwNm1bf4jZiJMZv/8V855ktHFrsPpeu1CVGYXieos/
   wTYEeJD07hWSgezaLCJu07Y8mXsOK7z9rrxYMVS0IRrX6cNXkW08X2Ga3
   +ltMhxh8Rt0wgWbD+yvO1S1K+wuY2aSmcq20+FZx3MTQQN/HTNfiX2WKj
   w==;
X-CSE-ConnectionGUID: NjSbIPlSSbmCXnf3P3QoiA==
X-CSE-MsgGUID: wKN3JFRATROhgqLQrmBrSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="205948881"
X-IronPort-AV: E=Sophos;i="6.19,262,1754924400"; 
   d="scan'208";a="205948881"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 09:15:53 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id D8237188A
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9157A1801988
	for <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:15:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id E73D382C0F2;
	Wed, 29 Oct 2025 00:15:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/32] python3-huey: upgrade 2.5.3 -> 2.5.4
Date: Wed, 29 Oct 2025 08:14:52 +0800
Message-ID: <20251029001505.528-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251029001505.528-1-wangmy@fujitsu.com>
References: <20251029001505.528-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Oct 2025 00:16:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121125

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-huey_2.5.3.bb => python3-huey_2.5.4.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-huey_2.5.3.bb => python3-huey_2.5.4.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-huey_2.5.3.bb b/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-huey_2.5.3.bb
rename to meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
index cb033712d9..9402dee2f1 100644
--- a/meta-python/recipes-devtools/python/python3-huey_2.5.3.bb
+++ b/meta-python/recipes-devtools/python/python3-huey_2.5.4.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5cac039fcc82f01141cc170b48f315d4"
 
 PYPI_PACKAGE = "huey"
 
-SRC_URI[sha256sum] = "089fc72b97fd26a513f15b09925c56fad6abe4a699a1f0e902170b37e85163c7"
+SRC_URI[sha256sum] = "4b7fb217b640fbb46efc4f4681b446b40726593522f093e8ef27c4a8fcb6cfbb"
 
 RDEPENDS:${PN} += " \
 	python3-datetime \
-- 
2.43.0


