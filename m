Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A4E0C433EF
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 04:28:33 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web12.2753.1657859311962064278
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Jul 2022 21:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Iij9DOVA;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1657859310; i=@fujitsu.com;
	bh=E9HnPnIN6CmqAKluOA8RSqxSOE5EUP7o1EPkQDHL0ug=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Iij9DOVAThU2Arh2oxC50RpaJnMg92AupiejO55X/cmzp3XuMI0mpt5NCA80LwzS8
	 30Recm7LH+YgbQa6lCFKanlCcee33E765MeYMkVCIbDcn2rtG8IbyuqtOvEEQriuVm
	 0gw1n8A8CGnT/suPYi41xUzZlR31+LKBg0NmbIQgodwBz5gujS4J7GBNNkuFRn5l/i
	 PrRIx/UT2wqYOeKRCzqSVaZfLv8fvsmyjWFTNBQwIvRWpUXSHkTGPf9UMzm6c8Q8aU
	 MnCE/E87yzlKZqG7cyhjWd/U67eZwljum3CjBIlufx8nukCq2pdPRACE+xKc8+U0DG
	 6AN7zD4rCynlA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrOIsWRWlGSWpSXmKPExsViZ8ORqPv2zYU
  kg5tH5SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owTJ86zFjznqPh06CFrA+NEji5GLg4hgSeM
  Emvf9TJCONeZJN5c+MgM4RxglNi8/jp7FyMnB5uArsSLH4tZQGwRAX2JpbP3MIPYwgLeEhM/r
  GEEsVkEVCX2vu4Bq+EV8JB40HMdLC4hoCAx5eF7Zoi4oMTJmU/AapgFJCQOvngBFOcAqlGUmD
  1dHqK8QuL14UvMELaaxNVzm5gnMPLNQtI9C0n3AkamVYzWSUWZ6RkluYmZObqGBga6hoamusb
  GuobmlnqJVbqJeqmluuWpxSW6RnqJ5cV6qcXFesWVuck5KXp5qSWbGIHhl1KsuHkH48SVP/UO
  MUpyMCmJ8h7Kv5AkxJeUn1KZkVicEV9UmpNafIhRhoNDSYKXARjQQoJFqempFWmZOcBYgElLc
  PAoifCueAWU5i0uSMwtzkyHSJ1iVJQS5y15CJQQAElklObBtcHi7xKjrJQwLyMDA4MQT0FqUW
  5mCar8K0ZxDkYlYd4QkO08mXklcNNfAS1mAlr80BdscUkiQkqqgckgyqJb89ahud0rE68t/Lq
  tf4th+z3OCyu4LjgLLlyv3fhpIWNGcp2gWkbjvxffvm9fW2qnGHW6pnvKhNlaTx+aXW1lnCdX
  /Ubl6wpuTY2Ht1k9+vyZjwjX+Bfcuerh+MXQrys5Q7D0zSErvtenLTdUH9O+MvesrdpeH/+L/
  +uWyIhXR3QdnL7cRi11c51XXPD+nL6ChJezQjgmlheG3csXnBXH5CnPHW38Q/L0LgHB1Oi8nO
  DCDzcb5lfXrGqSnrm+6cUShh85i5bwecyWyTsv1mNzL940iem+zb0vGZdOHYs7bp8nmy919+V
  CxrOPrOuWJ/z8L98yz1Ndf/Pr3Tdeer+LD1hxar2SnN8zKyWW4oxEQy3mouJEAGAe+GI6AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1657859309!137365!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 18258 invoked from network); 15 Jul 2022 04:28:29 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Jul 2022 04:28:29 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 38294100190
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 2C7EF10018D
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 05:28:29 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 15 Jul 2022 05:28:27 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python][PATCH] python3-pylint: upgrade 2.14.3 -> 2.14.4
Date: Fri, 15 Jul 2022 12:28:22 +0800
Message-ID: <1657859302-15262-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 04:28:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97839

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../{python3-pylint_2.14.3.bb => python3-pylint_2.14.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pylint_2.14.3.bb => python3-pylint_2.14.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb b/meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb
rename to meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb
index 835ed2203..39bd17dfe 100644
--- a/meta-python/recipes-devtools/python/python3-pylint_2.14.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pylint_2.14.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE= "http://www.pylint.org/"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c107cf754550e65755c42985a5d4e9c9"
 
-SRC_URI[sha256sum] = "4e1378f815c63e7e44590d0d339ed6435f5281d0a0cc357d29a86ea0365ef868"
+SRC_URI[sha256sum] = "47705453aa9dce520e123a7d51843d5f0032cbfa06870f89f00927aa1f735a4a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


