Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC27BC4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 06:03:56 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web09.4308.1652940226815996617
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 May 2022 23:03:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=mgk+sk+W;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652940225; i=@fujitsu.com;
	bh=puF40Eruw0tYGeMRHwV0wecHyqFaaJiV29nIQTPUWUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=mgk+sk+WqmRHcN6/sKIOpn6oTY83v+qlecyWlA+F0nJKiwwX7HfYSIY+vGD6xMiK6
	 gyKAnyRrYa3eNsmh6AJzFlK6oEGrfdKS8qfFmXbYQ5fEdA5f/IB8U6p/VnHbJqNlEH
	 qb1FT0tg7/R1IPNxX65t8GnhNd/8rA0gFOkaFy/HWFyix0m9XIxGm7+FWyzM1Bi4tn
	 vfZCpPa5H+rJcRk0Tgns8FfaMkb66lTvMqAlvIcK303MvG7kQhIqVYoc/+EjZQUnID
	 drPOvjLvS7oY88wPgRcLKd896e93evq/0AqLx5K8/Tyszl7JsuiUqph2gtO+FUPK08
	 4LLmgHsdFCF7g==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNIsWRWlGSWpSXmKPExsViZ8ORqHvgbmu
  Swb+ZahYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aRSxuZC35zVrxolmhgnM3ZxcjFISTwhFGi
  7cY9NgjnApPEvJebWCCck4wSXV//MnUxcnKwCahLPL75mhHEFhHQl1g6ew8ziM0soCrRfXENO
  4gtLOAnsWVHDyuIzQIU7/rSCNbLK+Am8b35FVivhICCxJSH78F6OQXcJZbu+A0WFwKquX/1OR
  tEvaDEyZlPWCDmS0gcfPGCGaJXSeLEio9MEHaFxOvDl6DiahJXz21insAoOAtJ+ywk7QsYmVY
  xWicVZaZnlOQmZuboGhoY6Boamuoam+gaGVroJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym
  56To5aWWbGIEhnFKsdKtHYwbVv3UO8QoycGkJMrrfqQ1SYgvKT+lMiOxOCO+qDQntfgQowwHh
  5IE7+cbQDnBotT01Iq0zBxgTMGkJTh4lER4W3YBpXmLCxJzizPTIVKnGBWlxHkT7gAlBEASGa
  V5cG2wOL7EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3FWQKT2ZeCdz0V0CLmYAW31IGW1y
  SiJCSamCy2iwwLZnLvTBhvtnGxD1rgmZFxOd3OO+N/yajkDrj/CbWrktnXRYeP/1KgultcZFf
  UUhmSsz7yw/0l37Or7/aqbFmq/RVxVv/dROfuO84+Ha550Sr85NOH9BsTqkVesmY46K8TNGh7
  Hpcj8EV1dRJRf83MJYpTS1PP+91UGPb3ZtKchMeTTp3S2jTxp8r72pfEvl0/N0xm47js8KWL9
  CRfXBsKnv1Cu7+T38TXz3h6z9q+2I+C/OuWWqvz6RblO3/VnY568YdO5kp7Nr19gLnl+51n2S
  Q+Yr1/cEG9fhr6ma3lypJ92Vslw5X7BM8weSfw5Z7V6NkbeLLyYd/Fgst5Jc60PYj8vC2ogUM
  j48WKbEUZyQaajEXFScCAEHmPiReAwAA
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-548.messagelabs.com!1652940224!87385!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10968 invoked from network); 19 May 2022 06:03:44 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-9.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 19 May 2022 06:03:44 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 02C1610018F
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:44 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id C7735100195
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 07:03:43 +0100 (BST)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Thu, 19 May 2022 07:03:34 +0100
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.38.4 -> 0.38.6
Date: Thu, 19 May 2022 14:03:08 +0800
Message-ID: <1652940188-8005-6-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
References: <1652940188-8005-1-git-send-email-xuhuan.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 06:03:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97180

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Changelog:
===========
Performance improvements for fetching ServiceInfo

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-zeroconf_0.38.4.bb => python3-zeroconf_0.38.6.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.38.4.bb => python3-zeroconf_0.38.6.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb
index d305f2b83..bf97e4ff9 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.38.4.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.38.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=3bb705b228ea4a14ea2728215b780d80"
 
-SRC_URI[sha256sum] = "080c540ea4b8b9defa9f3ac05823c1725ea2c8aacda917bfc0193f6758b95aeb"
+SRC_URI[sha256sum] = "c98f87a9145c58ad544cf1708b5eb2f444d40cd5defc69c88eeaac0527a28795"
 
 inherit pypi setuptools3
 
-- 
2.25.1


