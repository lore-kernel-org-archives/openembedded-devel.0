Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBD6C7EE22
	for <webhook@archiver.kernel.org>; Mon,  8 May 2023 10:10:28 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.103687.1683540618162162360
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 May 2023 03:10:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=vrvCI8OJ;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1683540616; i=@fujitsu.com;
	bh=dLettwpGeW3WiOUPI1pg8eNXC+FozwDGkwyv1y9tKeA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
	b=vrvCI8OJ8283YZHKiErfQTW7NoHHeeHf1TlFjCa4lDtzowtFwu+tL3ktbhjkiGgMg
	 DMPQnKqgxAkT/5Oig0LR9ZP6BvcpkWDIHxyI3n8stkZe8sfprPtziAw9ty/2Cb0dpm
	 7r8450xMkzRieMX8ejaQI1JUYlc1Y9tjX6Jbo0hUc/qbwGYp+m2uJe7bfUHMEhXLI0
	 wATMEbzURSAURw+IgILvNg9nrDv+X7xqdypJIQ2rgoVOP5g36Ghh1cSQ+LuuZvdbv7
	 q42AA1jtCRi09ncgoT9DvItZrsT+P8EUjJH6Zcs3xgUAViMtxzM0ruoJmAHLvZ0hRu
	 7hiQWAWfG0R6g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrILMWRWlGSWpSXmKPExsViZ8ORpNt+KiL
  F4EuTnsXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnF2z23mgqfcFevPvmJtYLzF1cXIySEksJFR
  4vftyC5GLiB7GpNEz7NrLCAJNgEJiel7T7KD2CICuhIfP8xlBLGZBVQkZkw+wgRiCwt4SDQv/
  MgMYrMIqEr0fPgDVsMr4CTx+sJXsF4JAQWJKQ/fg9VwCjhL3Ll3lwlisZPEm4//2SBq1CSunt
  vEPIGRZwEjwypGs+LUorLUIl1DvaSizPSMktzEzBy9xCrdRL3UUt28/KKSDKBUYnmxXmpxsV5
  xZW5yTopeXmrJJkZgSKQUJ3zbwdi286/eIUZJDiYlUV7Tg2EpQnxJ+SmVGYnFGfFFpTmpxYcY
  ZTg4lCR427ZFpAgJFqWmp1akZeYAwxMmLcHBoyTCK3sEKM1bXJCYW5yZDpE6xagoJc5beRIoI
  QCSyCjNg2uDxcQlRlkpYV5GBgYGIZ6C1KLczBJU+VeM4hyMSsK8m08ATeHJzCuBm/4KaDET0G
  L/y+Egi0sSEVJSDUxLWTMbF+2cpSI297L1g5kNtT/nh1z2drya+m3HAUFmrUXrrmRsNDwvrHR
  SV1Zqe8sih4NCT1cp35gs3rjRcSNP7YOTotzLX5iFr99s9l52VvJsi68HjC5vucNWqrfxnwzj
  F5dPCyqrbun2/l5mwFcxr/b399Zow9jnHknCWZXvuRawvCpd2Wg7+Z13C59AfvUHNoPlJRP7s
  g9JTT3ElfdPlFV9+c31Sv/CKk3kl02IDyxPv8ZTxGO36W/xittszixLPqYJBd4Wk9RXf1Z7d6
  c7S8Z+l4Uyh2b+rX5x8nq6zpOZf5dzPF5iVbukbd3Z5VcWdHMdjfSaOPX3cUYfx8OH/m+buEH
  hyOfQu2lWipsWKrEUZyQaajEXFScCAC2QlokEAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-24.tower-728.messagelabs.com!1683540615!495724!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.105.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30190 invoked from network); 8 May 2023 10:10:15 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-24.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 May 2023 10:10:15 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 383F31D4;
	Mon,  8 May 2023 11:10:15 +0100 (BST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 5F6FA1D2;
	Mon,  8 May 2023 11:10:14 +0100 (BST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-yarl: upgrade 1.8.2 -> 1.9.2
Date: Mon,  8 May 2023 18:09:59 +0800
Message-Id: <1683540600-25325-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
References: <1683540600-25325-1-git-send-email-wangmy@fujitsu.com>
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 May 2023 10:10:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102404

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix regression with truediv and absolute URLs with empty paths causing the raw path to lack the leading /.

License-Update:Update the LICENSE file to contain the license used (Apache-2.0)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-yarl_1.8.2.bb => python3-yarl_1.9.2.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-yarl_1.8.2.bb => python3-yarl_1.9.2.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb b/meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb
rename to meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb
index 6f6f85d78a..63700024c2 100644
--- a/meta-python/recipes-devtools/python/python3-yarl_1.8.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yarl_1.9.2.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The module provides handy URL class for url parsing and changing"
 HOMEPAGE = "https://github.com/aio-libs/yarl/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=e581798a7b985311f29fa3e163ea27ae"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "49d43402c6e3013ad0978602bf6bf5328535c48d192304b91b97a3c6790b1562"
+SRC_URI[sha256sum] = "04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.34.1


