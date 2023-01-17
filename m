Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C4C6379F
	for <webhook@archiver.kernel.org>; Tue, 17 Jan 2023 07:18:32 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web11.191275.1673939911400215187
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Jan 2023 23:18:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fkqdGGSO;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673939909; i=@fujitsu.com;
	bh=uPNpOz9ZOOMrKUrbj0BmHbxhrvKNNSG8az8nybIDEmA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=fkqdGGSOisSLU4B78ro4y9JjrI894tecjddCxqtWx3HMhuqsOZQa4z4PHG2JmMWbK
	 TtpXdBvvt8YAdE5wuPyKCQ1mBF4c0aFDbJreE5PUyrBNBJoFXZkoHUzbW7BJ2LIb7E
	 QvGovQsBuzm/lDwBEUSHX9XwVx5omOI9kle2CXqCO1FmTjhoNTZ1bM2XXbAumakBjs
	 H0s/2HnPtjVGNHbY3gxR8a4orJ8xCzFqkRh8IxmQKmJboIVvji3PhMzROe86ZPqV42
	 hgPOCImVlG7pkhm53SHIw89R1y1Yfep3iEKmKrweheo2rCekEtlBvDRaNNyb9erpds
	 1ZCcwgq03ZpYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8OxWfeI97F
  kg303TSwuHl7K7MDocW7jCsYAxijWzLyk/IoE1owzjTvZC1ZxVPw/u465gfEYexcjF4eQwANG
  iTX390M5V5kk9i54zwTh7GWU+HBgJmsXIycHm4CUxI37/9lAbBEBfYmls/cwg9jMAioSL373A
  HVzcAgLeEjs+B0FEmYRUJU4eOodC4jNK+Ak8XzbPTBbQkBBYsrD92CtnALOEnNeLmUHsYWAan
  5cWMkKUS8ocXLmExaI8RISB1+8YIboVZSYfbkZak6lROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJ
  GplWMpsWpRWWpRbpmeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBoZtSrHRvB+O0ZX/0DjFKcjApifKeND2WLMSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mC9
  5QXUE6wKDU9tSItMwcYRzBpCQ4eJRHecEugNG9xQWJucWY6ROoUo6KUOO81kD4BkERGaR5cGy
  x2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5n3iATSFJzOvBG76K6DFTECLPUqOgiwuSUR
  ISTUw6SyLElWpCWB7WzRB18klOu/OO5ayP9YzBTqYQ66se394svctdfXfV5qWLJgY326YLHJg
  eWCyDaPf3m9LDsnvW/wr++0W55Qpl5JOmxspdyh2z5MN/Dkzo6fslNPsU6LXzrzk3PY+IpLZN
  SGkW71zjX+YPtvqvDm7N++Zu97ublfj39jTk7dsnSBb0rvqeKWxzWKOY7cXhZRKOT2NE5C/wu
  Wh8eWUSYbU4425+mzenBP3n1oh8WDHlWvW04PjVzls4Upe9kty0ak9mh9vPKvffMtwp/oHptt
  qiXHf79y33ne3uPyCcq8yIx+D6Ry/bw+7TqvNzNq35Cj3Q8fZlSv5DfNdZs20s5Nd2x7YqnzI
  SYmlOCPRUIu5qDgRALT7LvdYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-565.messagelabs.com!1673939908!403442!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32760 invoked from network); 17 Jan 2023 07:18:28 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-21.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 17 Jan 2023 07:18:28 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 9347A7C
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:28 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 87738150
	for <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:28 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 17 Jan 2023 07:18:26 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] nbdkit: upgrade 1.33.4 -> 1.33.7
Date: Tue, 17 Jan 2023 15:18:13 +0800
Message-ID: <1673939896-20171-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
References: <1673939896-20171-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Jan 2023 07:18:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100605

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nbdkit/{nbdkit_1.33.4.bb => nbdkit_1.33.7.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/nbdkit/{nbdkit_1.33.4.bb => nbdkit_1.33.7.bb} (95%)

diff --git a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb
similarity index 95%
rename from meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb
rename to meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb
index bc28eb84f..2af649cb4 100644
--- a/meta-networking/recipes-support/nbdkit/nbdkit_1.33.4.bb
+++ b/meta-networking/recipes-support/nbdkit/nbdkit_1.33.7.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9dcc2d8acdde215fa4bd6ac12bb14f0"
 
 SRC_URI = "git://github.com/libguestfs/nbdkit.git;protocol=https;branch=master \
 "
-SRCREV = "eaca70ec362dcf745fc81188f6008528d1b17961"
+SRCREV = "a5f804180240aea7031470cb8ed294f904268f0a"
 
 S = "${WORKDIR}/git"
 
-- 
2.25.1


