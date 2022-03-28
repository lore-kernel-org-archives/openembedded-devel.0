Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC74C433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Mar 2022 13:12:30 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.10753.1648473148371798144
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 06:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=yHFsqSQh;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1648473146; i=@fujitsu.com;
	bh=oGgs5aDepZcuBf5Ex+/9ZWkOu2i10hLYVzowvohMbDo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=yHFsqSQhi2sMikRvcVlcthm8x2tqeuATske47MbcnxVfAd56LHYA4EHJ4Vv9/nWVZ
	 CAt5FqNLtoox49SYzczvbckI9464SH0mq9RIn6VZZuwZMRmiAL0geAEdSWMcbVyYcm
	 XvobQTjil1OZUqqK734TwHpeelNoA3uYrd9EXQqHsfH22g9PjHzn8dZUlg/a7oWKwu
	 HAiKySpicPyTooxwu75WHLIH/JS+NVO4yOGKUn+83ll14+Qx0VHERq8TLNzAyoCO26
	 u+SOsnFck6kWO+PgST1447Yq3LOP/G/1nifTrAWYBxAO10H+D6Yz3nKvAgkJyPPfUe
	 1+gBaMxrRe/ZQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrIIsWRWlGSWpSXmKPExsViZ8ORqGu5xTH
  JYPdkE4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePr6neMBdc5Kr6+b2ZsYGzk6GLk5BASeMIo
  cXl5WhcjF5B9gUniyrtdbBDOHkaJ/tPzmEGq2ATUJKbfusEKYosI6Essnb0HLM4soCLx4ncPO
  4gtLBAgMXvrKUYQm0VAVeJ4+2+gOAcHr4CTxLyzgSBhCQEFiSkP34O18goISpyc+YQFYoyExM
  EXL5ghahQlZl9uZoGwKyRmzWpjgrDVJK6e28Q8gZF/FpL2WUjaFzAyrWK0SirKTM8oyU3MzNE
  1NDDQNTQ01TXTNTI00Eus0k3USy3VLU8tLtE11EssL9ZLLS7WK67MTc5J0ctLLdnECAzJlGK2
  SzsY5/b91DvEKMnBpCTKe3GuY5IQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCV6XjUA5waLU9NSKt
  MwcYHzApCU4eJREeANmA6V5iwsSc4sz0yFSpxgVpcR52TYDJQRAEhmleXBtsJi8xCgrJczLyM
  DAIMRTkFqUm1mCKv+KUZyDUUmYt3ET0BSezLwSuOmvgBYzAS1e+84WZHFJIkJKqoFJqPfGhnP
  NPKU2Tw2ntByTC9BYvH2VfruJmOtWjZnXtOZ2Kvce0yytncyWcJfLtjtH54MP34O1OgxRtkdi
  Z87xW7RIe+/F6Z9MvcMUHT7JWtSeOnazaaJkXn4e+8EVAg5sPtfnfWf8Kv804cvllxbHfF9kz
  Foa9lXzT9L62K9/+dMWXTHwjP9jZD+5/8iCl3NcOt/KuclwXPrw848T69QV13xKO01vb2tgjf
  Phc5fvETKa3XWll8Wse59LXM4Ozmtr8w4bXBDYlOt5dUNZ3YH4tJ7Wt43npmhbXpno239tZrX
  4yqQHnDJST8ui3e4JJO093CHzKC51xf8Tp2UmvSlJ8fnwIbYtqPSJS9W9+8uVWIozEg21mIuK
  EwF3yoJYRAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-30.tower-587.messagelabs.com!1648473145!47825!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.85.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10607 invoked from network); 28 Mar 2022 13:12:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-30.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 28 Mar 2022 13:12:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 6717B10018B
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:12:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 5AD4D100183
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Mar 2022 14:12:25 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Mar 2022 14:12:03 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-robotframework: upgrade 4.1.3 ->
 5.0
Date: Mon, 28 Mar 2022 21:11:53 +0800
Message-ID: <1648473113-17044-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Mar 2022 13:12:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96242

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-robotframework_4.1.3.bb => python3-robotframework_5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_4.1.3.bb => python3-robotframework_5.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb b/meta-python/recipes-devtools/python/python3-robotframework_5.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_5.0.bb
index a40d047d72..d66fd33e8d 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_5.0.bb
@@ -13,7 +13,7 @@ inherit pypi setuptools3
 
 PYPI_PACKAGE_EXT = "zip"
 
-SRC_URI[sha256sum] = "d2675cbe3e5a4c90be3ddb61be3b88cc0d6ff503c298ad8f8a78aad14e71e886"
+SRC_URI[sha256sum] = "bffecba8c43d4294936d921f0af4941079039edce88194769133719732c608bc"
 
 RDEPENDS:${PN} += " \
     ${PYTHON_PN}-shell \
-- 
2.25.1


