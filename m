Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38F3ECAAA3
	for <webhook@archiver.kernel.org>; Fri, 26 Aug 2022 02:52:02 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.32802.1661482316478297075
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Aug 2022 19:51:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=UXgOBXup;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1661482314; i=@fujitsu.com;
	bh=PxygKJ7dkrRozSKdjPhjFD6I6ufTtwSjvx/Dxfkd0Uk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=UXgOBXupuWHbPHq62BvG5smebzTmoaWBHSpEzV+YkT/UsBBr5/+o4zS0/Wb127EXR
	 Kb20sPwEVQ2FbStbkDKtRjpNN+7VsgQPTM9+UX2tVcv1plk2kbW7IzLkIVn9dSEDRO
	 iJHEKMYMEhq3hJelwKxTt9XPqV0pEu1q99CzF0LIqtWcOuQYWyt1vWYfewT2n58x6B
	 LPvdUJMQ+7yzmme8XGiiafl4nZCGDzTJFaObYYJdxffgvzvYe6AYdyvJsn6sYRl2Y0
	 nv8vpsF0e1/RIE6KIsmgpeD7/h7t+is36peA5iKBywfZMgHfGqGrJPEoVjOltl32Gq
	 PM3pjmvXTtxSg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRWlGSWpSXmKPExsViZ8MxSdfLlCP
  ZYG4fo8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmnFt5lHmgm8cFQ2H/zM2MC7h6GLk4hASeMIo
  cXXaIjYI5waTxPu+X0wQzkFGiY7G16xdjJwcbAK6Ei9+LGYBsUUE9CWWzt7DDGILC7hLvPlwm
  gnEZhFQlWg9sZkdxOYV8JBYvGMCI4gtIaAgMeXhe2aIuKDEyZlPwOYwC0hIHHzxAijOAVSjKD
  F7ujyEWSlx43EqRKeaxNVzm5gnMPLNQtI8C0nzAkamVYxWSUWZ6RkluYmZObqGBga6hoamusa
  WuqZGeolVuol6qaW65anFJbpAbnmxXmpxsV5xZW5yTopeXmrJJkZg6KUUq5vsYOxe+VPvEKMk
  B5OSKK/+M/ZkIb6k/JTKjMTijPii0pzU4kOMMhwcShK8aiYcyUKCRanpqRVpmTnAOIBJS3DwK
  InwSosCpXmLCxJzizPTIVKnGBWlxHn/GwElBEASGaV5cG2w2LvEKCslzMvIwMAgxFOQWpSbWY
  Iq/4pRnINRSZg31RBoCk9mXgnc9FdAi5mAFkttYAdZXJKIkJJqYOJZ8/rKPfO6kn2/n2o8uia
  y49Jyi7W5Uswbl7WnB54SXbgz+Oy9xdFiHiHzZxR3uPQ//WvN8lvn6fNde79KmvX4nRN+tUrB
  toFnR+e1iqCAu8JVMTcEOO7avVkYOGPnt1tOvmuUL3DLXYqa80R4tpP3prO/Nhe6+V9hltweK
  1f4ml//c29SZs1GloPmXHPeR8yXsb2sqifkzLfx//0wjuf7dta47Wl+/+GoNKeznjRHTvCdeZ
  wbD/HyyMsq8X/PDPtY3hk7m5GxxsxPWns7xxfGAI3geUGW5n9M5z69oLOLW+/rit7rxY88fG0
  m+P9q5WVt5zp4X1xt8+O19gUhGkd13cJ36rSIta+xZi35ocRSnJFoqMVcVJwIABLPbgM4AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-12.tower-548.messagelabs.com!1661482313!62081!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16400 invoked from network); 26 Aug 2022 02:51:54 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-12.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 26 Aug 2022 02:51:54 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id B3D9F1000C1
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:53 +0100 (BST)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223
 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A6990100078
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 26 Aug 2022 03:51:53 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 26 Aug 2022 03:51:52 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-eth-account: 0.6.1 -> 0.7.0
Date: Fri, 26 Aug 2022 10:51:45 +0800
Message-ID: <1661482305-13257-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 26 Aug 2022 02:52:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98453

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 ...ython3-eth-account_0.6.1.bb => python3-eth-account_0.7.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-account_0.6.1.bb => python3-eth-account_0.7.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb b/meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb
index 9c87d3f5d1..5b8c34ec8d 100644
--- a/meta-python/recipes-devtools/python/python3-eth-account_0.6.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-account_0.7.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "54b0b7d661e73f4cd12d508c9baa5c9a6e8c194aa7bafc39277cd673683ae50e"
+SRC_URI[sha256sum] = "61360e9e514e09e49929ed365ca0e1656758ecbd11248c629ad85b4335c2661a"
 
 inherit pypi setuptools3
 
-- 
2.25.1


