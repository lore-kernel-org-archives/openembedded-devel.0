Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AD1CC433EF
	for <webhook@archiver.kernel.org>; Fri, 22 Jul 2022 02:11:13 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com
 [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web09.3506.1658455867645291378
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Jul 2022 19:11:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Szlzlt6q;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1658455865; i=@fujitsu.com;
	bh=dV7p4gnBBnr8utqeBTRV1kl2XXXisMpjOVB6RklykAM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Szlzlt6q6Y8FLqSS+zzagV4Erv4rcPtOqq4E4uiW0pJpuizWiIrO0wcYwXUeCTGdG
	 +oOGYkrNFMBA5O7OoeavuSUqvptWHrWQDYUUAFUU70sUXOJfygRQ9ZYn/UlsyY/Kqe
	 kavBXv6lm2XrXB5jmY7Dl/MSbXKnQtJD9eDf8LREPeQrLY+vkO4XriRg4vVsZPnetY
	 imq+RUuNyn0/loG6D6dyOocG+wKIDaJpZFlnrPQNLseYNO1ngJMjMbxuIxye4pSC7+
	 teXTHv2hvgaliRLuf16B90NPWGhZOScN9TDe8CxMwmya3Zq8tNO1yTY9qMaGi4s6jM
	 oFWhZir9JpR/w==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrIIsWRWlGSWpSXmKPExsViZ8OxWdeS/Va
  SwZTLrBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8apW7tZCyZxVTx7sJSxgXEhZxcjF4eQwANG
  ia1fXrF2MXICOZeZJFYecIRI7GGUeD55NxNIgk1ATWL6rRtgRSIC+hJLZ+9hBrGZBVQkXvzuY
  QexhQV8JO787QGrZxFQlZhwdxOYzSvgJLHr4FcWEFtCQEFiysP3zBBxQYmTM5+wQMyRkDj44g
  UzRI2ixOzLzVD1FRIzZmxjg7DVJK6e28Q8gZF/FpL2WUjaFzAyrWK0TSrKTM8oyU3MzNE1NDD
  QNTQ0BdLGuoYmRnqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBoZlSnN63
  g3Hjvl96hxglOZiURHn3TbqZJMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9wTbrSQhwaLU9NSKt
  MwcYJzApCU4eJREeC2+ALXyFhck5hZnpkOkTjHqcsz82naAWYglLz8vVUqcVwlkhgBIUUZpHt
  wIWMxeYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTM28YCNIUnM68EbtMroCOYgI4wN78BckR
  JIkJKqoHplIxs9hfVg44beHLMJjL3KqXM7KvwXKR9RDMkbp/u3pmF8ntmv6s3XabvsG72yZPH
  TxyVvj7j2d9yzki72ex2t8VlZ92s1KjdxPRgTk/wpsm5RzNk7FZw5y8Xub2wVV9dbEPtjtiES
  TFvJ4rN4ZRsVDaeKNQu/KvX98yCkleSjxS6zuVv+FfFz95zO1DIa29g41nJPfwzyvWuSN1nnB
  Ah9m/+0TjjkMQEH11bVe7N0g537bUbNpzUe9yYaWSdIdhq6SR3uE0yxGAh/yn/1+Hbz81h/Jd
  /qIjjyp5JL42feczY9eCQDt91V8W92zjmv/ihsl9sAY+c0srjWkdX3vl91Dt95qkbj9buOqBY
  25uuxFKckWioxVxUnAgACzW/11QDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-19.tower-728.messagelabs.com!1658455864!299936!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13210 invoked from network); 22 Jul 2022 02:11:05 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-19.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 22 Jul 2022 02:11:05 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 8024B7B
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:11:04 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126
 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 732D273
	for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Jul 2022 03:11:04 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Fri, 22 Jul 2022 03:11:02 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.7.0 -> 5.7.1
Date: Fri, 22 Jul 2022 10:10:49 +0800
Message-ID: <1658455850-26888-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 22 Jul 2022 02:11:13 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97941

Changelog:
===========
    Add namespaces argument to Server and AsyncServer #822
    Add missing await in asyncio server #952

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.7.0.bb => python3-socketio_5.7.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.7.0.bb => python3-socketio_5.7.1.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb b/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
index 54ea3c2a1b..f71d4dad64 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.7.1.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "82e3c45baa51f2180f176e5e1c4232a4452f7545a3fe3156d093fa7e5890e816"
+SRC_URI[sha256sum] = "5011a0cd2545c954d7df09eef7489ec424c93b001cc146599cd72f1dd20f0d46"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.25.1


