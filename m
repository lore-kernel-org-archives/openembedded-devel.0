Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A09C3C433EF
	for <webhook@archiver.kernel.org>; Mon, 30 May 2022 10:40:39 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web12.35605.1653907232646998685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 03:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AFX3AbQO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653907230; i=@fujitsu.com;
	bh=HGAcAQItxaFtyeI/jhsnVQhfdpmqgyyiwg30+Yn7tDQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=AFX3AbQOdKOm9MV5ntGomPa0byJysdG0pjj3jxqy7BOI+vwiofsgShc7jZi/iPKnr
	 U4TJ7UVl0udPR0FksA+1Jep0Q2O97dqz+uRftYSzEeyYs4pj2kFGIrhRXij8IHwSL9
	 rZkkRsB0KMVUYHYICWorS7FcGMyPk8kEls+mjRF61xwwGJAjNtWvNLR6BF9uYytxeY
	 45b6xd18tDd2uChmLalVcpn7xJfHIIVirf92fMlOXv9E50qNZciepnXw7nCv6Y9z7K
	 b+znT7vwFgunlKpmqF4gFV0NWw5kAUXuN1V1nAeyIL2u0kztTl74TiOoEnyYb4ZkYt
	 pkn7NC93rBEuA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrBIsWRWlGSWpSXmKPExsViZ8ORqCs3f0q
  SwdlrohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bXzA1MBXO4Kvb/W8HUwDiRs4uRi0NI4Amj
  xKueX0wQzgUmiQfLv7JDOHsYJT5N+M3WxcjJwSagJjH91g1WEFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAm8SMe4+BJnFwsAioSixpcAIJ8wo4Scx/eResREJAQWLKw/dgrZwCzhIbLjeCjRcCqp
  n6u5EFol5Q4uTMJywQ4yUkDr54wQzRqygx+3IzC4RdITFjxjY2CFtN4uq5TcwTGAVnIWmfhaR
  9ASPTKkarpKLM9IyS3MTMHF1DAwNdQ0NTXVNdIyNTvcQq3US91FLd8tTiEl1DvcTyYr3U4mK9
  4src5JwUvbzUkk2MwCBOKWZ9uINxcd9PvUOMkhxMSqK8Z1UnJwnxJeWnVGYkFmfEF5XmpBYfY
  pTh4FCS4M2YOyVJSLAoNT21Ii0zBxhRMGkJDh4lEV6VfqA0b3FBYm5xZjpE6hSjPceHQ1f2Mn
  MsW34NSE6d/W8/M8dyECnEkpeflyolzjsTZKoASFtGaR7cUFgCuMQoKyXMy8jAwCDEU5BalJt
  Zgir/ilGcg1FJmNdmHtAUnsy8Erjdr4DOYgI6i5tpIshZJYkIKakGpuDv7G4+XZv55ed/n+Z4
  YYV3oNy84xplPPc9ghuPtao+WP1lR538slnT26Q6Naryt5+e3zvhxz7VQMHWbb5v1rc/WZq2R
  mr+ra+LRVcxSvG5yCWtcD/+dYKbsqWNKX9uVUD2SpWacL2Tp5yWvDflWWXe+iJNb3+d7u2EjG
  1RjTrdq93kBTjjJ5uV5PL2/v4tWrk9W0vpn4mYNcfWvbmpkn3bjxl1VpREnbx43NAyfeqN5Vv
  jS71qdLRtsksX3IjVy79e4y2wOzhy4QLJfp0rSyaW5dxJZfKz+lumFzF7027nFTwsTkqpem81
  16y4X36l3SqZ54BhxiWxW77xlcK/A5WXTujl+f6OwcQg5LQSS3FGoqEWc1FxIgDmRsL/ewMAA
  A==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-587.messagelabs.com!1653907230!38993!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 1260 invoked from network); 30 May 2022 10:40:30 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 30 May 2022 10:40:30 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DF4B7100190
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:29 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id D313510018C
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 May 2022 11:40:29 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 30 May 2022 11:40:08 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] babeld: upgrade 1.12 -> 1.12.1
Date: Mon, 30 May 2022 18:39:51 +0800
Message-ID: <1653907191-24731-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1653907191-24731-1-git-send-email-wangmy@fujitsu.com>
References: <1653907191-24731-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 May 2022 10:40:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97323

Changelog:
==========
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


