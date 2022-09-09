Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 699A4ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 01:26:29 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.1334.1662686775125631561
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 18:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IIfCKtxb;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662686773; i=@fujitsu.com;
	bh=/858TB7x4VaUO9t9bnccVFr0ZfG8JsjN4ln1OI46JRM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=IIfCKtxb1ZRH8lHZJqVHvQvQLpQ3OnyOWnVfQFR+tbf6Bj6wcNQFcK+2Yc5q0ZAXo
	 +o+/tW1Y4h2fkndqWRfuyD+7TN3cI7t2dvOg828LH4E0VlvS2HYjuRsfYcY9aLRC2A
	 b1HIBV4E2GwZjkEjq19mpEXLXMuiXTggH1GWwaZmDf8VyAAVP1vl5yh3wIvFYbTuDN
	 8Dtc/r1Not3PY4O3FpjIVWpZm+uLu17BPraScNMCew0mUyRfryOR8Df6VpD6u8C4aL
	 SQmvO4CYwK04CJ4C8NQR1IIlL8/Jkf/rLctqf7hTZHsBS+K/GHDozRf0TzL581kGZO
	 +5w2umSVuer5A==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSddkmlS
  ywb1bwhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aay9uYC5o4K6YvP8DewLiBo4uRi0NI4Amj
  xNFPK9ghnOtMEi/PfGeCcPYzSryZvBEow8nBJqAr8eLHYhYQW0RAX2Lp7D3MILawQKDEgjffW
  EFsFgEViWmbPjOB2LwC7hINvf8ZQWwJAQWJKQ/fM0PEBSVOznwCNodZQELi4IsXQHEOoBpFid
  nT5SHKKyQapx9igrDVJK6e28Q8gZFvFpLuWUi6FzAyrWK0SirKTM8oyU3MzNE1NDDQNTQ01TW
  21LUw0kus0k3USy3VLU8tLtEFcsuL9VKLi/WKK3OTc1L08lJLNjECgy+lWD1oB+O3FT/1DjFK
  cjApifI+7ZdKFuJLyk+pzEgszogvKs1JLT7EKMPBoSTBe3kSUE6wKDU9tSItMwcYCTBpCQ4eJ
  RFe28lAad7igsTc4sx0iNQpRl2OmV/bDjALseTl56VKifOenQJUJABSlFGaBzcCFpWXGGWlhH
  kZGRgYhHgKUotyM0tQ5V8xinMwKgnz5k8FmsKTmVcCt+kV0BFMQEdsDRQHOaIkESEl1cB0/7N
  KwO+XzNufGjDFct6qO2l6j5Xl0jl+x2i7cuOc+WVnphtXm1/dsbGB/+5sGUPh9Z5ZmlnH7j34
  /drLwzzt9AHmx4+PldV9aF15qaR3+VYb0SZJ08VW7j8uLa35Je/Fl6lw93bZzBvcC4Rb05727
  3g1WdSb64f6rFub5UTyT//P8Cu6PmFJbvWiCd3WSrzG+xgnP78Q9266VcNs/mPZj7fsmK3keC
  tb5MHSr1N1K/qMtRTErh39kcJySVLPYJ1Vgdifjr9Ckz2PSR/R363Q8HWSf8b9/3zMktKPtMQ
  TvOZe/GCoYduXJLY9m7Ntf+2HKesmWT81M5Oy3hd0OfnecYHrASyBjj5bHTV51ggqsRRnJBpq
  MRcVJwIAxKXR/EUDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-14.tower-565.messagelabs.com!1662686772!30616!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 6871 invoked from network); 9 Sep 2022 01:26:12 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-14.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2022 01:26:12 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0AF571000C1
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:26:12 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id F0F40100078
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:26:11 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 9 Sep 2022 02:26:10 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-parsimonious: upgrade 0.9.0 ->
 0.10.0
Date: Fri, 9 Sep 2022 09:26:03 +0800
Message-ID: <1662686763-2581-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 01:26:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98729

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...on3-parsimonious_0.9.0.bb => python3-parsimonious_0.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-parsimonious_0.9.0.bb => python3-parsimonious_0.10.0.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb b/meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb
rename to meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb
index 5a604fa41c..c2352224ff 100644
--- a/meta-python/recipes-devtools/python/python3-parsimonious_0.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-parsimonious_0.10.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3396ea30f9d21389d7857719816f83b5"
 
-SRC_URI[sha256sum] = "b2ad1ae63a2f65bd78f5e0a8ac510a98f3607a43f1db2a8d46636a5d9e4a30c1"
+SRC_URI[sha256sum] = "8281600da180ec8ae35427a4ab4f7b82bfec1e3d1e52f80cb60ea82b9512501c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


