Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 690B6C433F5
	for <webhook@archiver.kernel.org>; Mon, 23 May 2022 08:07:53 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.24779.1653293271768149873
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 01:07:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=MC/gfAbR;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653293270; i=@fujitsu.com;
	bh=LJsMZT42V+8u6ZNhR1hUtxZRt7sZYCPoJItqI4CPwNE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=MC/gfAbRer5ISSWLlJoJ2WccbdgIKfmNFwRXDZbTmdjsWry1v3BUui2V8agmT6sQI
	 Lp/75CXdZVjQCG7P/V1wXWSh1SnIPuPbqVa8tdYK06+CUEdKwOfVcuxV5qOQoiTFHI
	 K+tzRnubmEBLb/wJuZyHtiGfG39P9jUKpf/QBN8ebjeaGZsbbpOVyQ+aNWeGGGktBH
	 o3YSEVdmICMt0gsciliys78+YkS+tUnQ4FAYnrRRoLTu2cerZ72uyVBeXVnGId+n+j
	 JycMdMfv9UDC3LwgzvlJNh4McqfYPQE6oXmVNYbWf5GRCaPrrRlhom6v2mkfnfuNzv
	 naLFDPc/xVmfg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSfeqQ3e
  SwZOHChYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bBY+uYCxZzVcztfM3UwDiFs4uRi0NI4Amj
  xJN7D9kgnAtMEtPXrWGFcPYwSrza8QDI4eRgE1CTmH7rBpgtIqAvsXT2HmYQm1lAReLF7x52E
  FtYwE1ixr3HTCA2i4CqxLpH91hAbF4BJ4kty96D1UgIKEhMefieGSIuKHFy5hMWiDkSEgdfvG
  CGqFGUmH25mQXCrpCYMWMbG4StJnH13CbmCYz8s5C0z0LSvoCRaRWjVVJRZnpGSW5iZo6uoYG
  BrqGhqa6xsa65iV5ilW6iXmqpbnlqcYmukV5iebFeanGxXnFlbnJOil5easkmRmBYphQreu1g
  fLXip94hRkkOJiVR3qN23UlCfEn5KZUZicUZ8UWlOanFhxhlODiUJHj57IFygkWp6akVaZk5w
  BiBSUtw8CiJ8DIC40SIt7ggMbc4Mx0idYrRmOPDoSt7mTmWLb+2l1mIJS8/L1VKnNcRpFQApD
  SjNA9uECx2LzHKSgnzMjIwMAjxFKQW5WaWoMq/YhTnYFQS5p0Ecg9PZl4J3L5XQKcwAZ3SK9E
  JckpJIkJKqoFJuzv9xnS1NZY7TQ8t2CLqp3So7rNE1jLJ0H87VQ1MuOOX13aY5a2665gS7Rvm
  yHbMouvnp2kxd470ObXFPbkvLemRvu/vdvvn99rKrO4aFx7kXTUtI2DNqfaUJe+j3DuvsBg+8
  o1XmONr8aJo6pHW86tK87cfNd1dKZ96ZLNPMNsLmSOVKgGsfGJLa45WyRipWJtHrDbt7hB2fs
  /p9ONprui+r8q9KzOOLTPe2h6x0ynp3qO5eYnyu2/zR7ZLxJ1+wFPPco63kHnHGc2kIxf6Vk5
  55XGp9+WsI/fn7jS8qCF9+uKd5Tn1Xyc5fBNZ7h8v8IZbabb1O59niTxb3H70P8tMFTl9/k/P
  jhg+p1lKLMUZiYZazEXFiQBcPfZNWAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-18.tower-565.messagelabs.com!1653293269!215230!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7420 invoked from network); 23 May 2022 08:07:49 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-18.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 23 May 2022 08:07:49 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 2850F100445
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:07:49 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 18E871000FF
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 May 2022 09:07:49 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 23 May 2022 09:07:36 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.12 -> 1.12.1
Date: Mon, 23 May 2022 16:07:18 +0800
Message-ID: <1653293241-31418-1-git-send-email-wangmy@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 23 May 2022 08:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97222

18 May 2022: babeld-1.12.1

  * Implement separate PC values for unicast and multicast, which avoids
    dropping packets protected by MAC when WiFi powersave is active.
  * Schedule an interface check just after adding an interface.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../babeld/{babeld_1.12.bb => babeld_1.12.1.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-protocols/babeld/{babeld_1.12.bb => babeld_1.12.1.bb} (94%)

diff --git a/meta-networking/recipes-protocols/babeld/babeld_1.12.bb b/meta-networking/recipes-protocols/babeld/babeld_1.12.1.bb
similarity index 94%
rename from meta-networking/recipes-protocols/babeld/babeld_1.12.bb
rename to meta-networking/recipes-protocols/babeld/babeld_1.12.1.bb
index 747c16cb7..71bd93785 100644
--- a/meta-networking/recipes-protocols/babeld/babeld_1.12.bb
+++ b/meta-networking/recipes-protocols/babeld/babeld_1.12.1.bb
@@ -13,7 +13,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=411a48ac3c2e9e0911b8dd9aed26f754"
 
 SRC_URI = "gitsm://github.com/jech/babeld.git;protocol=https;branch=master"
-SRCREV = "420a7087b7d6350084edfd7d1aef8a62209cbf04"
+SRCREV = "916d3d9aa65683ddf8b96f7f0b466b24cb9d7087"
 
 UPSTREAM_CHECK_GITTAGREGEX = "babeld-(?P<pver>\d+(\.\d+)+)"
 
-- 
2.25.1


