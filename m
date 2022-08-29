Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29960ECAAD2
	for <webhook@archiver.kernel.org>; Mon, 29 Aug 2022 06:38:24 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.67659.1661755101145801311
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 28 Aug 2022 23:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=taet8vE2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661755099; i=@fujitsu.com;
	bh=JiRhp3fnkVvgwKwcsdW2Zte5trqKkvcpf3MUlMHDx2c=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=taet8vE23lBLq0z13WOLzoHq8bnnZSo8T2rdrj6R09dLdUvVaITekNxwxDjIY+r9q
	 T4dBpKu44QZ0G1n5xhnmhoxj5WGX2vI+m31P8E1aIXzh/P2UQ4TeYB4TZHYLyftE5w
	 2lXeGzFiXY6cQqaR+wzthJqC91JBcVDbhrwMdPY9IfgrWSieCk47Yj+d+Rk8dccrtQ
	 KV8WPpdFi+Y3rJUDa1vMPNvlNfqlhmwoKkgWjitDEQP8nzZZybEC954jtNL3caFaB3
	 XYl4JuXDmHPM+lw89QKVgd6JWgQa528XmIz3hqxAHqXIfIik4qgGdtiI1neGqDVvEA
	 eMNeJDmeseEyQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrKIsWRWlGSWpSXmKPExsViZ8OxWfdWHE+
  ywezV+hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRv5oFmzkrrt+1bmC8w9HFyMUhJPCAUWJf
  z1tWCOcKk8TrlxtZuhg5gZy9jBJrjkuC2GwCahLTb91gBbFFBPQlls7ewwxiMwuoSLz43cMOY
  gsLeEqsnfESrIZFQFVi89eXYDW8Ao4Srz79ArMlBBQkpjx8D2ZzCjhJtO9cyAaxy1Fi8a0P7B
  D1ghInZz5hgZgvIXHwxQuoXkWJ2ZebWSDsSok9s/qZIGw1iavnNjFPYBSchaR9FpL2BYxMqxi
  tk4oy0zNKchMzc3QNDQx0DQ1NdS0tdS1M9BKrdBP1Ukt18/KLSjJ0DfUSy4v1UouL9Yorc5Nz
  UvTyUks2MQJDOKU4OWQH48l9v/QOMUpyMCmJ8pqY8yQL8SXlp1RmJBZnxBeV5qQWH2KU4eBQk
  uB1jAXKCRalpqdWpGXmAOMJJi3BwaMkwnsBJM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKX
  FedmB0CgmAFGWU5sGNgMX2JUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvPwgU3gy80rgNr0
  COoIJ6IiHS7hBjihJREhJNTDZu81M7hFgfnlwvljLPl2ue5MbNFjviZQf/zC184v8bA2rn8Ub
  SguK3sc4HTzT7P48VVX72qTIwoMX7/qU/FwnHW72+IKP0eV5DZ9t3F42eG7dW8ErbiG3cFfqj
  t9z1y4p/PHBLmZW/2ftZxoe+zxEBWfft6lV4Zq3p0ZjvfieM7UCe+7w/ajeOqtsvZ4n6/xZm2
  bodsyQUNSWvtIq6x8Ydcc6LztT9rjMmr89T89c4u06+jHL/NVV06lJqmn8PVr+tlczM083XVl
  dK3csVCF6+QlF2apHs12sGbcr/nnJVWv04cMH9opE18SCCQ2/mWZv935XwW/bZL+saHbzo1J1
  rfIVB5bfalAJFU8OlVRiKc5INNRiLipOBABb+5ajaAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-745.messagelabs.com!1661755098!139311!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26295 invoked from network); 29 Aug 2022 06:38:18 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-18.tower-745.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Aug 2022 06:38:18 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 374567B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:18 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 2B7A373
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Aug 2022 07:38:18 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 29 Aug 2022 07:38:16 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] tcpreplay: upgrade 4.4.1 -> 4.4.2
Date: Mon, 29 Aug 2022 14:37:38 +0800
Message-ID: <1661755059-4785-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
References: <1661755059-4785-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Aug 2022 06:38:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98508

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tcpreplay/{tcpreplay_4.4.1.bb => tcpreplay_4.4.2.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/tcpreplay/{tcpreplay_4.4.1.bb => tcpreplay_4.4.2.bb} (85%)

diff --git a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
similarity index 85%
rename from meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
rename to meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
index 56db66b8eb..165a0e735b 100644
--- a/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.1.bb
+++ b/meta-networking/recipes-support/tcpreplay/tcpreplay_4.4.2.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://docs/LICENSE;md5=10f0474a2f0e5dccfca20f69d6598ad8"
 
 SRC_URI = "https://github.com/appneta/tcpreplay/releases/download/v${PV}/tcpreplay-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "cb67b6491a618867fc4f9848f586019f1bb2ebd149f393afac5544ee55e4544f"
+SRC_URI[sha256sum] = "5b272cd83b67d6288a234ea15f89ecd93b4fadda65eddc44e7b5fcb2f395b615"
 
 UPSTREAM_CHECK_URI = "https://github.com/appneta/tcpreplay/releases"
 
-- 
2.25.1


