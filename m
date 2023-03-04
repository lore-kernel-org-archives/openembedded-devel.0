Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE494C64EC4
	for <webhook@archiver.kernel.org>; Sat,  4 Mar 2023 11:11:54 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.6950.1677928311054700400
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 04 Mar 2023 03:11:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Yv3/Db70;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677928309; i=@fujitsu.com;
	bh=Mu9DZJWyP4QIdXT3ZwLg3kACGgy70cvOE5H1gonrNHo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Yv3/Db70fhp+o//bFnzsFzPAThWcM4M6HIGiNS2eFPcnt1NAWveB7ZbLPyElwK4SQ
	 9FoTnjC4ZkAM53+RegSk7wGHTn41gviXwT1wVdcEi89UUYExf1JSTcoI3EKVk43cyF
	 J5yLKcV9dJP/m5raYFJ/0ARYifKmV3VW67+JiX3FKx9TuxKhE5AowexoOM8xxzzYpr
	 axofQWxX4K+u58nzTG9jPfo0xZdmSKhGDd4/IQwOaZCGaJReZU9evDxMIyXb49ag/N
	 V/P9XPTjYQAqImmPPSG8SoPLSUJXP0bUdFtWY724hpTOIRZSpOleMA1f7E7BweU3Dp
	 KzAZpPx8yFG+Q==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8MxSbdEnTn
  FYEEHt8XFw0uZHRg9zm1cwRjAGMWamZeUX5HAmrFofgtjwQKeiku7JrI0MDZzdzFycQgJPGGU
  uL3mH3sXIyeQc4NJonmnJkRiD6PEhfY9YAk2ASmJG/f/s4HYIgL6Ektn72EGsZkFVCRe/O4Bq
  xEW8JY4tvsDC4jNAhRfd+oYWD2vgJPEhL93GUFsCQEFiSkP34P1cgo4S1yac4gVYrGTRMeVDl
  aIekGJkzOfsEDMl5A4+OIFM0SvosTsy80sEHalROuHX1C2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MpsWpRWWpRbpGeklFmekZJbmJmTl6iVW6iXqppbrlqcUlQJnE8mK91OJiveLK3OScFL281JJN
  jMDQTSlW7d/BuLb3r94hRkkOJiVR3kmsDClCfEn5KZUZicUZ8UWlOanFhxhlODiUJHhlVJlTh
  ASLUtNTK9Iyc4BxBJOW4OBREuHdIgKU5i0uSMwtzkyHSJ1iVJQS5xVQBkoIgCQySvPg2mCxe4
  lRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMO8WFaApPJl5JXDTXwEtZgJarHGaAWRxSSJCSqq
  BKc7s+tTVafbsQZ7pXA/vKybFxhx3SSi4d/HEh2qP/Jw7TBND/aZmBC2Uayqr+nBtXsyKq++n
  sZvo3NH4L7qwTefwMrejNvvNvpxZv+q85KYfyt9euWZmR5htmrE57eTTlE8H2xO0M58yXvx2c
  BoX17RbS61+aZtdcv9vlco7vUve68HOk9YNJ9wZrKufVPz8k6zkKuZ51cNF4tHyI1ZS3/T9fw
  hL/+PO6k2eKHLra+gKxtcKrQt1T+/u6bGWkz+7VO9n2g+W4okOz06FsJzcFNR/subcvorI9Z1
  svpaHXq262xVzqWZ/mrv28x3v726JjSqbN4E3a/3rSUaBfTKph6t+eRbeq3vw78L+T9VMVUos
  xRmJhlrMRcWJAA0Zd0lYAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1677928308!56915!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 30050 invoked from network); 4 Mar 2023 11:11:48 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 4 Mar 2023 11:11:48 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id DC4591000FB
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:47 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D03381000F5
	for <openembedded-devel@lists.openembedded.org>; Sat,  4 Mar 2023 11:11:47 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sat, 4 Mar 2023 11:11:46 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-watchdog: upgrade 2.3.0-> 2.3.1
Date: Sat, 4 Mar 2023 19:11:33 +0800
Message-ID: <1677928294-23089-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1677928294-23089-1-git-send-email-wangmy@fujitsu.com>
References: <1677928294-23089-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 04 Mar 2023 11:11:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101377

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    Run black on the entire source code
    Bundle the requirements-tests.txt file in the source distribution (#939)
    [watchmedo] Exclude FileOpenedEvent events from AutoRestartTrick, and ShellCommandTrick, to restore watchdog < 2.3.0 behavior. A better solution should be found in the future. (#949)
    [watchmedo] Log FileOpenedEvent, and FileClosedEvent, events in LoggerTrick

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-watchdog_2.3.0.bb => python3-watchdog_2.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-watchdog_2.3.0.bb => python3-watchdog_2.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb b/meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb
index 8b4cdbb3e..b927de41e 100644
--- a/meta-python/recipes-devtools/python/python3-watchdog_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-watchdog_2.3.1.bb
@@ -4,7 +4,7 @@ DEPENDS = "${PYTHON_PN}-argh"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
-SRC_URI[sha256sum] = "9d39effe6909be898ba3e7286a9e9b17a6a9f734fb1ef9dde3e9bb68715fca39"
+SRC_URI[sha256sum] = "d9f9ed26ed22a9d331820a8432c3680707ea8b54121ddcc9dc7d9f2ceeb36906"
 
 inherit pypi setuptools3
 
-- 
2.34.1


