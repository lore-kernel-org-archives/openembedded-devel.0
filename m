Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C47FC36017
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.61533.1742893341762466579
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qZQI/AtC;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893342; x=1774429342;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=k9nIO+NxbNlNR5ZSvaqM7JwSD310eqkwgNeLeFMCzAc=;
  b=qZQI/AtCoZF2pTw6nfGEUEvTQumw3vwNF8dwp0ocRuHxCwUKQbpsqulB
   e+d3lD+3GkW7H1R0rv7PW3Nr9O0YP6SQfP2agYdi3TVIubWoo/ZEWAtvZ
   0V+nhYmUbJG8YdDLMeM29VIA/TWByyBTkiu7Liq7Ju+4BZsn+gAVmzeBw
   vclcrI+rTNlTNhRL2XDdV/WcAwLHCD5HUKJYXLbB6DgpL9/0SCCVmiynN
   qc/XUXS+1tBNoraLlU+ujmA+xBvKUC2DOEZGE67IP7CjNoQ3TRJnn7t9d
   TndLc52isCYGuVkrOX2TgoeeRmlItjy855cOn0VRBtjYC1TllmoF6DT5f
   g==;
X-CSE-ConnectionGUID: g6o8CwdTTpmeeTCHNybbJQ==
X-CSE-MsgGUID: 0eIOAEM+QYCwKREL5mlkJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194202332"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194202332"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:20 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8744BB406E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 427A2D50E5
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:17 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 037091A009B;
	Tue, 25 Mar 2025 17:02:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/45] python3-grpcio-tools: upgrade 1.70.0 -> 1.71.0
Date: Tue, 25 Mar 2025 17:01:35 +0800
Message-Id: <1742893312-3809-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116254

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-grpcio-tools_1.70.0.bb => python3-grpcio-tools_1.71.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-tools_1.70.0.bb => python3-grpcio-tools_1.71.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
index 38440edbee..7448ff55b2 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-tools_1.70.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-tools_1.71.0.bb
@@ -15,7 +15,7 @@ DEPENDS += "python3-grpcio"
 SRC_URI += "file://0001-setup.py-Do-not-mix-C-and-C-compiler-options.patch \
             file://0001-protobuf-Disable-musttail-attribute-on-mips.patch \
             "
-SRC_URI[sha256sum] = "e578fee7c1c213c8e471750d92631d00f178a15479fb2cb3b939a07fc125ccd3"
+SRC_URI[sha256sum] = "38dba8e0d5e0fb23a034e09644fdc6ed862be2371887eee54901999e8f6792a8"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


