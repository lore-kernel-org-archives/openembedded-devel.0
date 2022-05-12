Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 402B2C433FE
	for <webhook@archiver.kernel.org>; Thu, 12 May 2022 09:21:22 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web12.2091.1652347273235769227
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 02:21:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Xa77AfRY;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652347271; i=@fujitsu.com;
	bh=3gt311VYinVn+io4Xi8vzRqAZ1w/JqtckOC834PPGvw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Xa77AfRY8BSx2pqje4raRrwwY4VgeKbSHBut2+1xmZ8un22yp9ZZpYfwf7SwE2p1N
	 WtGsqlkrkqSgzHzCNW7fwNBpy+thBhImH3GDSMu3lcnx9davbGQQZ/yJC+wv4+1E8i
	 dZt0T4dNX+Xph2/L8j6YT2o+w1KgisxmkEcHxPqu31/oOdXlGacYzFRHRUDBBdnmrW
	 CmvvY7m/an7Tv/ddKEwAi1mxLMSU7LB7EWd+lpuXgtzJ1Dwj7LAlb9yNL65IrYHiXA
	 nsOk6v7GxUr94eVR7oMNwy98hnxdNhy4+L4pEmUNEikeeWyxHHsxeFXVUqi3zMlRgq
	 YWhouaVYn7LUA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrPIsWRWlGSWpSXmKPExsViZ8ORqNt+sSb
  JYNFCHouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePK7b3sBXe4Kpo2/2BvYHzC2cXIxSEk8IRR
  4mbbJTYI5wKTxL9vn6Cck4wS85YsYO1i5ORgE1CXeHzzNSOILSKgL7F09h5mEJtZQFWi++Iad
  hBbWCBY4tZ5iHoWoPiV/h42EJtXwE3iz8pVYL0SAgoSUx6+B+vlFHCXuH21AaxXCKjm8I9rLB
  D1ghInZz5hgZgvIXHwxQtmiF4liRMrPjJB2BUSrw9fgoqrSVw9t4l5AqPgLCTts5C0L2BkWsV
  ol1SUmZ5RkpuYmaNraGCga2hoqmtmpmtoaqqXWKWbqJdaqpucmldSlAiU1kssL9ZLLS7WK67M
  Tc5J0ctLLdnECAznlGKn2TsYd/T91DvEKMnBpCTKe+58TZIQX1J+SmVGYnFGfFFpTmrxIUYZD
  g4lCd6d54BygkWp6akVaZk5wNiCSUtw8CiJ8BaDpHmLCxJzizPTIVKnGBWlxHk/7ANKCIAkMk
  rz4Npg8XyJUVZKmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvaZDLeDLzSuCmvwJazAS0eL9rJcj
  ikkSElFQDU0SpZ+rVNpnO4sY27f+x9UI+ZefmHTL6znHxaGAcr/tzWfPFHHO9Dl99cTQmdbWb
  b5aSwUkmlUKZS778S94yXFY8fpv7W9QCmQ59MQGW++kWBdOC1hRZW8cfvTdL1Xd27N7322bfV
  1u3wuDaJK+uX1rJW17VB805YcbF+Vfi3eEZK3Z2c81j1+J7nyAxVfSY3/Y+dqeElpiqa9Y+l9
  fZZG0+r7Lx6rkmLq9b/nVFK6bOV3JcWtq64r6aya/zE3d+mS8X1+48c4LpcWveZevy1pxNWhG
  wgTtFZNobDf5XD9xF/rbuu3ZBN3z+LSP7IvnO5Jjea3k3Or5cPTytw+1mZcBLqf2l/0Ia1vIp
  Z5uqK7EUZyQaajEXFScCAFgY8IxiAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-532.messagelabs.com!1652347270!101600!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30030 invoked from network); 12 May 2022 09:21:11 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 12 May 2022 09:21:11 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id B2CF41001AA
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 95C1E1001A1
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 May 2022 10:21:10 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 12 May 2022 10:20:54 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-core: upgrade 2.7.1 ->
 2.7.3
Date: Thu, 12 May 2022 17:20:34 +0800
Message-ID: <1652347241-2533-4-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652347241-2533-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 May 2022 09:21:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97072

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
==========
    allow grpc without grpcio-status
    remove dependency on pkg_resources
    Avoid AttributeError if grpcio-status is not installed

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...oogle-api-core_2.7.1.bb => python3-google-api-core_2.7.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.7.1.bb => python3-google-api-core_2.7.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb
index 55884e99c..3422dd711 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.7.3.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "b0fa577e512f0c8e063386b974718b8614586a798c5894ed34bedf256d9dae24"
+SRC_URI[sha256sum] = "17957f0704cbe95bd2ce25019efd2046423978594d181d4263e5dcffd2dbbc79"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-asyncio \
-- 
2.25.1


