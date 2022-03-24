Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F22DC433FE
	for <webhook@archiver.kernel.org>; Thu, 24 Mar 2022 09:18:34 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.1])
 by mx.groups.io with SMTP id smtpd.web08.8666.1648113512857969392
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 02:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=R+akh+zu;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648113511; i=@fujitsu.com;
	bh=zxAx7wrwOaxq51ay1sBXBc+8KBMTLGKTWLMfp7EvFdQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=R+akh+zuvh8P/3IO2+sDWXGh/HJ751+rzRgfX6+JGbkT2GMHAZ61UR0jnfDcaJ9Zo
	 zpiRScPqtH6Q8ibKX17EztgjzdIZ/UaX6NJaWcg14ibREuUATTAPHmdiSaXvFukKgr
	 uLF9vpmuM1lYOqeuPCeMH7SVJ4b03l9Orv2ObyQvYV+t9aPHBmUq1EU9S3HGkkYAaH
	 P4hujD3kCqq4p3jnfSyvbrhASWzeyotpxkxIdp7jPFsax7To8z6pAGHY7NoJfBXxKG
	 JJyVWBW6vJ1rg+sjAjFPf0DQbWvIPkmQrMWMPanT2ZuTQzqPLra+N0AC1drbpVYtpm
	 O5SFALTXxTXNQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBIsWRWlGSWpSXmKPExsViZ8MxSTfN3Cb
  J4NhKVYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePQ107Wgm8cFfu3/2BvYFzE0cXIxSEk8IRR
  4lzbJXYI5wKTxKU375i6GDmBnJOMErduxIDYbALqEo9vvmYEsUUE9CWWzt7DDGIzC6hKdF9cw
  w5iCwskSvxedB6slwUovufGZzYQm1fAXWL3nmNgcQkBBYkpD98D9XJwcAp4SHx5bw5iCgGV/F
  ocCVEtKHFy5hMWiOkSEgdfvGCG6FSSOLHiI9SUConXhy9BxdUkrp7bxDyBUXAWkvZZSNoXMDK
  tYrRKKspMzyjJTczM0TU0MNA1NDTVNdA1MjTVS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxN
  zknRy0st2cQIDOCUYobrOxgn9v3UO8QoycGkJMr72dgmSYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE7y4joJxgUWp6akVaZg4wmmDSEhw8SiK8NYZAad7igsTc4sx0iNQpRkUpcd5YM6CEAEgioz
  QPrg0WwZcYZaWEeRkZGBiEeApSi3IzS1DlXzGKczAqCfOWgkzhycwrgZv+CmgxE9Di5z8tQRa
  XJCKkpBqYzCwNjCw5hX55JR+avn7z6g6OhadcvxyZzxWpx3fpdTKbKDPf4utnjWMOTbhnkj9V
  pXah3G6V3dqTftntOzbjpX60xYq+NXL7jwd5GUjm9bNNPvf6x7y9XJcu8R7smd3+suyYlUdp7
  9/JorZfhVb/vp3RHS0wMXZbZHbGlj55iTRxyQViNaVN9zwbbxyYJ3WnaNOP0p2SjLPZeK8Jan
  Wk7X2gPyXradXvnrfzLmieMqlxlvth+Wjhw0063J/mrjOLEff97PvxbE/rIS7lOb61Jk0xGwJ
  +/XN0n+8l7eS8ITM56tR9h5KXCj53vspH2MRfuj99ebv0m5ITa69lq185ULRjm7VrtnDDlu3v
  DJ6sV2Ipzkg01GIuKk4EAMG5+opbAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-587.messagelabs.com!1648113510!997!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.10; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25297 invoked from network); 24 Mar 2022 09:18:30 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 Mar 2022 09:18:30 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 29F6E100464
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 1D81D100359
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Mar 2022 09:18:30 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 24 Mar 2022 09:18:14 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [PATCH 5/5] [oe] [meta-python] [PATCH] python3-intervals: upgrade
 1.10.0.post1 -> 1.10.0
Date: Thu, 24 Mar 2022 17:18:00 +0800
Message-ID: <1648113480-29846-5-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1648113480-29846-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Mar 2022 09:18:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96189

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...n3-intervals_1.10.0.post1.bb => python3-intervals_1.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-intervals_1.10.0.post1.bb => python3-intervals_1.10.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
rename to meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
index d841f92343..abf87c597c 100644
--- a/meta-python/recipes-devtools/python/python3-intervals_1.10.0.post1.bb
+++ b/meta-python/recipes-devtools/python/python3-intervals_1.10.0.bb
@@ -22,6 +22,6 @@ do_install_ptest() {
 	cp -f ${S}/README.md ${D}${PTEST_PATH}
 }
 
-SRC_URI[sha256sum] = "68a772dc2de6b2b2e83b457329ffa8f9286710994b8070db54348a05762515d2"
+SRC_URI[sha256sum] = "0d26746eaed0be78a61dd289bb7a10721b08770bb3e807614835f490d514f2a5"
 
 BBCLASSEXTEND = "native"
-- 
2.25.1


