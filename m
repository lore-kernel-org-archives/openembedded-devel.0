Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFE7AC4332F
	for <webhook@archiver.kernel.org>; Tue, 20 Dec 2022 12:23:22 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.3])
 by mx.groups.io with SMTP id smtpd.web10.48739.1671538998098860928
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 04:23:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wKcnjOVr;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.3, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1671538996; i=@fujitsu.com;
	bh=tVkTMYg7eyh8SilKbCknsC84J89iU9Lf6VEamzXTgQo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wKcnjOVrsXplZ6snUwniq+AKPb/aSAyDtuo4jAIZxgXYkS8WrajRYzzIlo01+A7o9
	 MZrRFPvZiDFeYzbgb+ivdGYlUPBWvPOqeab0V82vcGmKEpbUMalNoJ//6XE9KBLtZ/
	 60xGDA93LbMCyqysrq3ud6LUFShkyHIG4DUhJF9e0YEWazPmHPVtvGanbOF1nlcD83
	 oLdmcIyVKyoc5witSggegTu7+6B952pMpi8AY8NAeC9oSa4oZ0pOQUMVO6EzyGW1tt
	 C81O8MFqJLo8mZuY2uRUnCifz8aLgqgxJSO6JrcWaYs+qHm+/gQI8jK74/uyGibHi7
	 JZdZoKRUHBkuQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8MxSddk5cJ
  kg9stPBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8avPQtZC+bxVHxcl93A+I+ri5GLQ0jgCaPE
  z0/vmSGc60wS9zbMYIdw9jBKvN+7jK2LkZODTUBK4sb9/2C2iIC+xNLZe5hBbGYBFYkXv3vYQ
  WxhgQCJ5zOuMILYLAKqEud3zgSzeQUcJb5vmsMKYksIKEhMefgerJdTwEli05m5LCC2EFDNwT
  kHWCHqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYxmhanFpWlFuka6iUVZaZnlOQmZuboJVbpJuqlluqWpxaX6BrpJZYX66UWF+sVV+Ym56To
  5aWWbGIEhm5KseqhHYyvlvzRO8QoycGkJMobFr4wWYgvKT+lMiOxOCO+qDQntfgQowwHh5IE7
  4xFQDnBotT01Iq0zBxgHMGkJTh4lER4e2YDpXmLCxJzizPTIVKnGHU5Zn5tO8AsxJKXn5cqJc
  77YjlQkQBIUUZpHtwIWExfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMawQyhSczrwRu0yu
  gI5iAjjh0aS7IESWJCCmpBib3jcUrLhUeddcUuNWwl93pvHcq7960OTLeFxSuFTPt414fNjXq
  1o7sjTYvA0WuPGLlzXPzW8ssoK0WEDkrp1pW8OejPVUZIXp+Jc3Oc08HS8V+yBQsf3hhFcv8j
  8vuV/3oS+/YJ+n96s0000rXvKAfbEJO4nzRM99orrCr8L94XWk5ryXDjZ0MGZu/WXqr/jqhWN
  1zj2/p/M7v/7JXzOjw/+kp0HtjtXoE53b3yssOHHYzjirtuJsR2rfi1C/vn0I+V15nbIqxM+W
  fctD50e2b81M5uoP+3yq0M6s1S/tRsMr64Vv77wFrOC7ExC7p+bFM8Zx79jP/WXd4t7pvMfn9
  VtvaaOZ85WkB+5OLdJVYijMSDbWYi4oTAUJNTxJkAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-5.tower-548.messagelabs.com!1671538996!115960!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 32500 invoked from network); 20 Dec 2022 12:23:16 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-5.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Dec 2022 12:23:16 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id E18571000DC
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:15 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id D58711000DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 20 Dec 2022 12:23:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sentry-sdk: upgrade 1.11.1 -> 1.12.0
Date: Tue, 20 Dec 2022 20:22:29 +0800
Message-ID: <1671538949-7267-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
References: <1671538949-7267-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Dec 2022 12:23:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100149

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Basic OTel support
-------------------
This adds support to automatically integrate OpenTelemetry performance tracing with Sentry.

Various fixes & improvements
-------------------------------
    Tox Cleanup (#1749)
    CI: Fix Github action checks (#1780)
    Profiling: Introduce active thread id on scope (#1764)
    Profiling: Eagerly hash stack for profiles (#1755)
    Profiling: Resolve inherited method class names (#1756)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-sentry-sdk_1.11.1.bb => python3-sentry-sdk_1.12.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sentry-sdk_1.11.1.bb => python3-sentry-sdk_1.12.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb
rename to meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb
index 5b2cc4851..455faf8a5 100644
--- a/meta-python/recipes-devtools/python/python3-sentry-sdk_1.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-sentry-sdk_1.12.0.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN} += "\
 	${PYTHON_PN}-datetime \
 "
 
-SRC_URI[sha256sum] = "675f6279b6bb1fea09fd61751061f9a90dca3b5929ef631dd50dc8b3aeb245e9"
+SRC_URI[sha256sum] = "dc0fe6ef2f77a3853b399c75c97d87be7666098817c1c314f8fcdf68a6865914"
 
 PYPI_PACKAGE = "sentry-sdk"
 
-- 
2.25.1


