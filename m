Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700EBECAAD5
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 01:25:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.1329.1662686729057943910
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Sep 2022 18:25:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=bLAHj/8E;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1662686727; i=@fujitsu.com;
	bh=bkmF68EAFW+0CaiV0iNQptnl5CWaMkd0NMtUEH7PsAM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=bLAHj/8Ez74+duUT9QXr58IwA7V0mSk5S7Af01+xkkqjJFYpoXfAjHGraJi1bNmQd
	 rearmUrHay+Qj+fG5x6ADeBcKQyJDYof6AbQfv/hYsgWcFWWBIOdybDJ9+kOyzi3Ms
	 3p8cSTDGi1A294OWFMM3Qk8P3tJ8hbD/+iJUGSjdmuabsRlMNqAVfRvjWxumm5ieDO
	 WcGOXdAleNpTkVZ4DLEGxBFrcOvSWdfXyUT1TKcYlL7dtvWAUp/+pUm5/D6yo8W7Pe
	 4jSFjtxP/BZOFAhnGhXx1omEr+UKT2qqa+kelLZPEtzRO2TjsMbw2PKz4tCKNnFk2y
	 hBSmNqjc+b+Uw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8MxSZdtmlS
  ywbZp8hYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aalmbGgqccFb8efGZtYJzM0cXIxSEk8IRR
  4ube7ewQznUmiS/LpjJDOPsZJe60nwfKcHKwCehKvPixmAXEFhHQl1g6ew8ziC0s4CXR1PaWD
  cRmEVCR+PCohxXE5hVwl/h7/w1YXEJAQWLKw/fMEHFBiZMzn4DNYRaQkDj44gVQnAOoRlFi9n
  R5iPIKicbph5ggbDWJq+c2MU9g5JuFpHsWku4FjEyrGK2SijLTM0pyEzNzdA0NDHQNDU11TYA
  sQ73EKt1EvdRS3fLU4hJdILe8WC+1uFivuDI3OSdFLy+1ZBMjMPhSillSdzD29f3UO8QoycGk
  JMr7tF8qWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7+VJQDnBotT01Iq0zBxgJMCkJTh4lER4b
  ScDpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc57dgpQkQBIUUZpHtwIWFReYpSVEuZlZG
  BgEOIpSC3KzSxBlX/FKM7BqCTMmz8VaApPZl4J3KZXQEcwAR2xNVAc5IiSRISUVAPTog2rCla
  XX5iqMeeO4yvT/V2qP16r817nnsM5q4tb8eTbj/1W629nHMz767NlRVC5lh7Hr94ze6Lk6hJ/
  5jZrvlv6fGdMVF7i3I+tTsn6T2K8XrwXc53srmT58Oxh76TXpS0L9fX/HdtY95DPJVZzwYk5g
  WfD/LLWHZZcWyHwUXWbi8Zqo2eNFopFs2a9PrFTOCCh+Et3gmyF2s8VHSI8k5nr61ZKPZRwPz
  lrf+P+/xrOAaLzo800SvmX9RXtmnOgfudBAZ5fK/Zf12jLeyN5oO7krZhT/tfaWaJ2LVdbo/X
  x3vSMsm0zb8e8XXzgavv/+Q++Tdl0dt/jtwUCzeqB5t8nPmx7HJebvNFVQYOTSYmlOCPRUIu5
  qDgRABmPEdZFAwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-18.tower-591.messagelabs.com!1662686726!480784!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 8580 invoked from network); 9 Sep 2022 01:25:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 Sep 2022 01:25:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 23F281000C2
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:26 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1642C100078
	for <openembedded-devel@lists.openembedded.org>;
 Fri,  9 Sep 2022 02:25:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 9 Sep 2022 02:25:24 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-pandas: upgrade 1.4.3 -> 1.4.4
Date: Fri, 9 Sep 2022 09:25:17 +0800
Message-ID: <1662686717-2496-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Sep 2022 01:25:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98727

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../python/{python3-pandas_1.4.3.bb => python3-pandas_1.4.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pandas_1.4.3.bb => python3-pandas_1.4.4.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb b/meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb
rename to meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb
index 2d3333c3ea..60e908bf49 100644
--- a/meta-python/recipes-devtools/python/python3-pandas_1.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pandas_1.4.4.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://pandas.pydata.org/"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3f23c5c092b74d245d48eeef72bc3fd2"
 
-SRC_URI[sha256sum] = "2ff7788468e75917574f080cd4681b27e1a7bf36461fe968b49a87b5a54d007c"
+SRC_URI[sha256sum] = "ab6c0d738617b675183e5f28db32b5148b694ad9bba0a40c3ea26d96b431db67"
 
 inherit pypi setuptools3
 
-- 
2.25.1


