Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 696E1C4332F
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 09:52:41 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web08.5681.1646214759861181296
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 01:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EdBdva25;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1646214757; i=@fujitsu.com;
	bh=5oy6x9yXBUPcd0k09b3Qlg8cfgI2jbXko4SyKjvvMZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EdBdva25bs46L0ukWba8Jbqz4cA6oBUMgOhiqTpoVwbGQz3bYpq9qVNH4gxTg2C3z
	 jP6m6wOA0IFTzzIRrQi1VLmGb+8KJkJYyc/E7ilfDLs2l6oZLZcPvOUCpmP480AmF1
	 n3Gyzs1sY8u9P7SSTpHy+WFiSXX/s9v61FfUdnGNTLVFQublfN3ST1QrEfOpB1VIda
	 hzJAq4gcsbRRguTAytEa8gz31JaHN336KScDmas6mETv8VFohDUULd6Y8WUVVPxJBL
	 aN8nzK8XDd4hGy3Qw+0mqlJc+1YOeEtJPoEIojOGtSyPZZH6Jl2kptDMTPWZhWa/qR
	 O9v+n66rMLpzg==
Received: from [100.115.68.61] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 08/40-30582-56E3F126; Wed, 02 Mar 2022 09:52:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrLIsWRWlGSWpSXmKPExsViZ8MxSTfVTj7
  J4P1OZYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPWLu2CzxwVR9d/YmtgnMPRxcjFISTwhFFi
  8/XjLBDOBSaJ5okXGSGcE4wSszcvYe1i5ORgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWCBU4t2XXWA1LAIqEvPPLgWr4RVwlbi77wILiC0hoCAx5eF7sDingJvEkbXTwXqFgGpary
  9nh6gXlDg58wkLxHwJiYMvXjBD9CpJnFjxkQnCrpB4ffgSVFxN4uq5TcwTGAVnIWmfhaR9ASP
  TKkbbpKLM9IyS3MTMHF1DAwNdQ0NTXTNLXWNjvcQq3US91FLd5NS8kqJEoKxeYnmxXmpxsV5x
  ZW5yTopeXmrJJkZgKKcUuyruYLzW91PvEKMkB5OSKO9yMfkkIb6k/JTKjMTijPii0pzU4kOMM
  hwcShK8GtZAOcGi1PTUirTMHGBcwaQlOHiURHhX2QKleYsLEnOLM9MhUqcYFaXEeZfaACUEQB
  IZpXlwbbBYvsQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmLcZZDxPZl4J3PRXQIuZgBZv9ZA
  DWVySiJCSamBa9efV9Knb3ggf8JuqV3XwSdnkFpkTu+UXCjlO0fqySaZGOjO931shQ2Jn6INo
  ja+uT7OTZ5erHTypkysi21j488IpSStNp8CvezmT3v6weMRcyHXHam2hU2eDXcCiL9esPk95O
  6E50HjP72lhx86/53svahUammx8890TwdaNX/vmaq7eHcHke2tLgpuiSIPPhhMZe+4cXO6cuO
  PZ6iPsf58vX3/t6lmRdav31b1VsI/o2RZx8onCIu6DfaEPuR6/kHD9V9nvuCvh0vdlt58oza5
  95bWO93OCFo/Qqgfn56/7/s4y4RkTz55W9zslNbGe/jNX9SyoTKuenVbzwPVwv+eU6A9+sVpJ
  q/hFmNbtVWIpzkg01GIuKk4EAFMw2PFgAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-4.tower-532.messagelabs.com!1646214757!10355!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.8; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28939 invoked from network); 2 Mar 2022 09:52:37 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 2 Mar 2022 09:52:37 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 0A3B6100458
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:37 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id E7DB5100452
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 09:52:36 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Wed, 2 Mar 2022 09:52:17 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 2/3] [oe] [meta-python] [PATCH] python3-snappy upgrade 0.6.0
 -> 0.6.1
Date: Wed, 2 Mar 2022 17:52:51 +0800
Message-ID: <1646214772-692-2-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1646214772-692-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1646214772-692-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 09:52:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95684

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../python/{python3-snappy_0.6.0.bb => python3-snappy_0.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-snappy_0.6.0.bb => python3-snappy_0.6.1.bb} (78%)

diff --git a/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
similarity index 78%
rename from meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
rename to meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
index f8e6281a1..8a30f7cb7 100644
--- a/meta-python/recipes-devtools/python/python3-snappy_0.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-snappy_0.6.1.bb
@@ -4,7 +4,7 @@ DEPENDS += "snappy"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b3090152f53ee19f6a7b64b1a36384fb"
 
-SRC_URI[sha256sum] = "168a98d3f597b633cfeeae7fe1c78a8dfd81f018b866cf7ce9e4c56086af891a"
+SRC_URI[sha256sum] = "b6a107ab06206acc5359d4c5632bd9b22d448702a79b3169b0c62e0fb808bb2a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


