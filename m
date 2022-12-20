Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C23C4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:15:12 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.48600.1671538508724853035
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Q8fjLU94;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538506; i=@fujitsu.com;
	bh=SjMzkF16f0Vl/hcVXtVHjmWkC1o7RdJTLkpr9BUBnjE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Q8fjLU94WR8O3O0a4youR76hnv1HtW/hq45hgrVUFTJYT+Uqmpvm3eVG3KOTyFIU+
	 r0r479dWvHNoVzUNEBLBrXt0T+AmlRNAN06tYGF1Y6KgggmQ9x13AFJMcmFtzhNpST
	 Vxc5o3883nu8iQZ8hgnwWla7HtH7EFFCWUbDSyRLwjiNVHVci52VXumStKEZskrE2f
	 30RaW5HiuzAvPTw84APj1yPg8CwjUBGlpnPerbdI5AEh+sTBlPDbIMtxBwiofsFIex
	 oWeCjJkvyyeB4yGV2I+dRb78Hwm3WWrYLifldQ4Seo6OYL+R5rme0WplH4C36lEXEK
	 gDf3Km+HEULRw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrEIsWRWlGSWpSXmKPExsViZ8OxWddr+cJ
  kg3eXFC0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oyTv9oYC7ZxVsx/8YKxgfECRxcjB4eQwENG
  iQarLkYuIPMyk8SUB5+YIZw9jBIX/v9i72Lk5GATkJK4cf8/G4gtIqAvsXT2HmYQm1lAReLF7
  x6wGmEBT4neJfdZQGwWAVWJa40fGUFsXgFHiZZte1hBbAkBBYkpD9+D9XIKOEms2LgOLC4EVD
  P76BpmiHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MELaaxNVzm5gnMArOQtI+C0n
  7AkamVYzmxalFZalFuobGeklFmekZJbmJmTl6iVW6iXqppbp5+UUlGbqGeonlxXqpxcV6xZW5
  yTkpenmpJZsYgcGbUpwqsYOxYfkfvUOMkhxMSqK8YeELk4X4kvJTKjMSizPii0pzUosPMcpwc
  ChJ8M5YBJQTLEpNT61Iy8wBRhJMWoKDR0mEt2c2UJq3uCAxtzgzHSJ1ilGXY+bXtgPMQix5+X
  mpUuK8XMuAigRAijJK8+BGwKL6EqOslDAvIwMDgxBPQWpRbmYJqvwrRnEORiVh3q6lQFN4MvN
  K4Da9AjqCCeiIQ5fmghxRkoiQkmpgmvROR1vHq/P9LRU7rbsGXLN36XjV/Xhw4UPM3Zpm8XOq
  U1ev4BPe8jmzbrtO0tEpq0z6FWxmFF9bF/jo95VQqV1r5SdqaLmLPXL88VXxV8DZW88MLEyr5
  j1kdHJN7U60m64hWnxdc4tlA/O6le+33VXwPb9aN/1204ZD/y8pbjpbw5j77fNvp8jZkz32+z
  jly9ycLTffgeuxoc2qoLzWaL8opaULu7qlN1hccZ+5dPGB52K/03hvG21ynGDfccbv7uaJKsW
  5O4+n/ln/YzXnjE0stnx2Yr09+xt1Z5jpLdzz6mn415L7a7bsf7XDRHP/uezrYY/49GfbLfed
  eWD59vVyviw3zCsaHz4XDnn0b6oSS3FGoqEWc1FxIgDReJ6GZQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-728.messagelabs.com!1671538506!382714!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32731 invoked from network); 20 Dec 2022 12:15:06 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-8.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:15:06 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 039DB150
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:06 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id EB72273
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:05 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:15:04 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gmpy2: upgrade 2.1.3 -> 2.1.5
Date: Tue, 20 Dec 2022 20:14:26 +0800
Message-ID: <1671538467-7143-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
References: <1671538467-7143-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:15:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100138

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Fixes to build Apple Silicon binary builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmpy2_2.1.3.bb => python3-gmpy2_2.1.5.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmpy2_2.1.3.bb => python3-gmpy2_2.1.5.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb
rename to meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
index 2db469406..9a66af9a9 100644
--- a/meta-python/recipes-devtools/python/python3-gmpy2_2.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-gmpy2_2.1.5.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
 DEPENDS += "gmp mpfr libmpc"
 
 PYPI_PACKAGE = "gmpy2"
-SRC_URI[sha256sum] = "10360cc39f1eb56e3a833a4d1cae3884c7f65b6ec490994801e6939dc08870ae"
+SRC_URI[sha256sum] = "bc297f1fd8c377ae67a4f493fc0f926e5d1b157e5c342e30a4d84dc7b9f95d96"
 
 inherit pypi setuptools3 python3native
 
-- 
2.25.1


