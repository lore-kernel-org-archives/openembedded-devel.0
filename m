Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19767C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 02:06:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.23245.1643249213585295863
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Jan 2022 18:06:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=SPd1IGq2;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643249211; i=@fujitsu.com;
	bh=Kp6qaHailBRJrjbnBQh/C+T8VhIxB+Ib8fro7sa89Jo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=SPd1IGq22WQLvumGEaUJoiFpc/FePQp1Jw+igmx9bMjJ0fewYkLI13WlqidzBMo4F
	 RL7E75EN/kbdSP/JEs3RGfhlJuu77Hs94N0cqbl4tZPCTuOWWnrI0uVGmoUuVbc3sS
	 DUILTps01mgwJ+g9E18KF2dIIhcc1Ogk8ukdF/7oFqmfEyScmh05fLoEKy1eehLfoi
	 1fpGpjAvMjMGNUmhM1JjBmO1Rldepm7Eo54rt2JNdfHzjXY9hoOcuMJI08Ou2A2gDs
	 PxwMcnFoEJFwFDcaf2beH5DkAA567Y2ZXXay79nAT1c50Mb8QbnYpPp1gr4H4KgY4M
	 TN1PdVO2HhgbQ==
Received: from [100.115.34.7] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 6B/DC-14616-B3EF1F16;
 Thu, 27 Jan 2022 02:06:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqGv972O
  iwfHLLBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRf8oFs7gq/h87x9bAuIWzi5GTQ0jgCaPE
  0z1CXYxcQPYFJonWq2uYIZyTjBI7135nA6liE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWMBXovXNPzCbBSi+4vh/MJtXwE3i8fL9TCC2hICCxJSH75kh4oISJ2c+YYGYIyFx8MULZo
  gaJYkTKz5C1VdIvD58CSquJnH13CbmCYz8s5C0z0LSvoCRaRWjVVJRZnpGSW5iZo6uoYGBrqG
  hqa6xpa6pkV5ilW6iXmqpbnlqcYkukFterJdaXKxXXJmbnJOil5dasokRGJIpxeomOxi7V/7U
  O8QoycGkJMort+tjohBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3nefgHKCRanpqRVpmTnA+IBJS
  3DwKInwnv4NlOYtLkjMLc5Mh0idYlSUEuc99AcoIQCSyCjNg2uDxeQlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK8P0Gm8GTmlcBNfwW0mAlo8e/z70AWlyQipKQamCSjNiyWEtk6oc+nVGr
  pBeODEuYrbKJml3549c9fx/xHyesIzkh7/13zi/LYfr1d4RK66LoF5yy12H9SN5+s2ufwoHpL
  i8Wdj95/17sYVcVz87slThDZ2dzi8nuVp/MugUrm7u/bZpmsy2M+e6zOxSzQR31z+tI7BffWn
  V/nnNdnuH3zSZUjd/RK9CRl471Uircp2q1lXnvpEOvmsO/HXuac5/POjdeY/khf/pbmayVFjV
  PW3yzDF1yxV74YeWN10TYR89J8pg36zC9un3jILHPTSMTgFc868cVedU3ae9Y1+2o5zH3863e
  aDceOAobvJcKHzNKZD69a7r6r4a57wQTlFZNf5gdLHonyOJAcqcRSnJFoqMVcVJwIAOzhUllE
  AwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1643249210!27844!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25834 invoked from network); 27 Jan 2022 02:06:51 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jan 2022 02:06:51 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B20D1100192
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:06:50 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id A510910018B
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:06:50 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 02:06:29 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-multidict: upgrade 5.2.0 -> 6.0.2
Date: Thu, 27 Jan 2022 10:06:51 +0800
Message-ID: <1643249211-2594-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 02:06:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95112

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
Bugfixes
Revert :issue:`644`
restore type annotations to as-of 5.2.0 version. (:issue:`688`)

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-multidict_5.2.0.bb => python3-multidict_6.0.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-multidict_5.2.0.bb => python3-multidict_6.0.2.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb b/meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb
rename to meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb
index 05b18fa0b5..b0e111d643 100644
--- a/meta-python/recipes-devtools/python/python3-multidict_5.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-multidict_6.0.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/multidict/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=84c63e2bcd84e619d249af5181e2147f"
 
-SRC_URI[sha256sum] = "0dd1c93edb444b33ba2274b66f63def8a327d607c6c790772f448a53b6ea59ce"
+SRC_URI[sha256sum] = "5ff3bd75f38e4c43f1f470f2df7a4d430b821c4ce22be384e1459cb57d6bb013"
 
 inherit pypi setuptools3 ptest
 
-- 
2.25.1


