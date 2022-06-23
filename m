Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E490CC43334
	for <webhook@archiver.kernel.org>; Thu, 23 Jun 2022 07:08:36 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.4528.1655968109156060296
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 00:08:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kMz1Kya2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1655968107; i=@fujitsu.com;
	bh=I6arG3R93wi+xoF7cEsS3abwPxn1E723/1mmunlUS/k=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kMz1Kya2558q4kw19GDkdlT6cTXjE8MIq4+rbW+hUbfgrQKNs4fOHzGzlE00Xj7uR
	 AZ0QfUiwRYOgJXLTolkh5JYZi2kREDoLmoC53xkj3XJfF4V4T1MaMJ0Jd9GK/A/s1R
	 IHXXjOVgcpc9vuRPCJzbtH1TvqOYS2LYdtE6ZWdbTwFPc6gvkgef9TPvMSLcJMBW8Z
	 aN9E0cOC+xzt2cwWPAfgxOh2pHdvTlR+YuJ8Xg0+ieph4C1alxvF/2OL2X1fMctsHK
	 y4LX5h0/+P/13rJmAlI6bHrbkc5YIBOO0i/6j59jzbADlyVa6q1HQkjLqg5dke06vY
	 /UYwAOJLB6qkw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSTdLcEu
  SwbZ31hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bfDy9ZCqZxVexYLtPAeISzi5GLQ0jgCaPE
  1s0PmSGcu0wS2/7cYYFwDjBKXFx6lrGLkZODTUBX4sWPxSwgtoiAvsTS2XuYQWxhgTiJr32/w
  OIsAqoS82ceYQOxeQXcJZY2bAOrkRBQkJjy8D0zRFxQ4uTMJ2D1zAISEgdfvACKcwDVKErMni
  4PUV4h8frwJahWNYmr5zYxT2Dkm4WkexaS7gWMTKsYrZKKMtMzSnITM3N0DQ0MdA0NTXUNdY0
  MjPUSq3QT9VJLdctTi0t0DfUSy4v1UouL9Yorc5NzUvTyUks2MQJDL6WY8fQOxk19P/UOMUpy
  MCmJ8j7j3ZIkxJeUn1KZkVicEV9UmpNafIhRhoNDSYL3Ej9QTrAoNT21Ii0zBxgHMGkJDh4lE
  d45IGne4oLE3OLMdIjUKUZFKXHeBjaghABIIqM0D64NFnuXGGWlhHkZGRgYhHgKUotyM0tQ5V
  8xinMwKgnz+oKM58nMK4Gb/gpoMRPQ4ifLN4AsLklESEk1MKmFe8+4e0/UyTdiibJix8Rt+it
  eNV1nm3TKzp1D8o2I9qyTJhXxm1ZOVO/aNfXPhP58sT0frhgGnIq2/CQdor90IuOFQ+X8aZaa
  B4IP8az6qrnj0euohsx1npVfpjRXmcfnslRJbpz8bOH19pO6n9f7S57ft/Rs/ZX7C2zuajBP0
  3CsUdsT/PLXw68lxpP8L/m/7py5jF3y4UGDrb4h67+VxC1P+eGUfmpKpoNJl4q2CZ9FMce6tX
  Jf9rlzaL08e3ivNXO/zeK8J1c27RKxu+5tMr0i7ov812et2teWX3tglP1ubkWE+rXqVTPu6X6
  uKqmYutk/bM97gx12ttELJAN5rT5s+e123qbaM1aneYcSS3FGoqEWc1FxIgCCS6X5OAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-591.messagelabs.com!1655968106!40942!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13318 invoked from network); 23 Jun 2022 07:08:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-3.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 Jun 2022 07:08:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 85EC81000CC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown10-183-43-178
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 787301000C0
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jun 2022 08:08:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 23 Jun 2022 08:08:25 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade
 2.50.0 -> 2.51.0
Date: Thu, 23 Jun 2022 15:08:16 +0800
Message-ID: <1655968096-2483-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Jun 2022 07:08:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97576

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ent_2.50.0.bb => python3-google-api-python-client_2.51.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.50.0.bb => python3-google-api-python-client_2.51.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb
index c6e82f5c0..d52b34ade 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.50.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.51.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "159aa2d5f67998f39b06f28f38d6621389dda099c56f0fde46e9070dabdd5b40"
+SRC_URI[sha256sum] = "a573373041b3f6ccbd04877b70e7425c52daec5b4fe5f440e8f5895c87d1a69c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


