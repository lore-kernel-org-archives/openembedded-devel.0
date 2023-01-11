Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BCD7C46467
	for <webhook@archiver.kernel.org>; Wed, 11 Jan 2023 05:26:48 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.16687.1673414799542171637
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Jan 2023 21:26:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=NBGK/jyp;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1673414798; i=@fujitsu.com;
	bh=i67gcjlxXxsPcij/Um6xopU6PkrcbyyBPofMgErL6Rs=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=NBGK/jypH2JyaDbE/M65mG4PRkOVPuBPyT8w+cgUeER5AhCu2rRnxLTbM/e17hgwj
	 ujCxr79UzBm5f+XpZV7IGUNp0UsqNDAjTXzUMa7rVMU9Fro0zgGzg5gQEurcS7fcAm
	 6fLeTgJIfv8UERZ8FMqf24sArDPcFDi4UW0sHFgPCuvOkoQq0CKz7c49RXI99uHhYU
	 7Qjgiehka1B3rP2J1ce9SxA4CT50KVYCugNSE69f4BJZQSdMo7EeEAIA3l6Hx1Uhd7
	 rcZjflT22DFle1/WY2nYgAAIG7TayJ4pe4DzopeQyLWJGMsK1y4g0uW8tukPU+ubWD
	 +KatihKOE3iAQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRWlGSWpSXmKPExsViZ8ORpNvrsS/
  ZYO8WEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePlnyuMBYeFKt50LWBsYFwo0MXIxSEk8JBR
  Ym7DZjYI5wqTxKdlK1khnL2MEpOOP2LsYuTkYBOQkrhx/z8biC0ioC+xdPYeZhCbWUBF4sXvH
  nYQW1jAU2LTrG1MIDaLgKrEz8OnwWxeASeJc0cheiUEFCSmPHwP1ssp4CzRdPIHWK8QUM2FJd
  sZIeoFJU7OfMICMV9C4uCLF8wQvYoSsy83s0DYlRKtH35B2WoSV89tYp7AKDgLSfssJO0LGJl
  WMZoVpxaVpRbpGlroJRVlpmeU5CZm5uglVukm6qWW6panFpfoGukllhfrpRYX6xVX5ibnpOjl
  pZZsYgSGb0qx+skdjBuW/dE7xCjJwaQkypsnsS9ZiC8pP6UyI7E4I76oNCe1+BCjDAeHkgSvi
  itQTrAoNT21Ii0zBxhLMGkJDh4lEd5aR6A0b3FBYm5xZjpE6hSjopQ4r7M7UEIAJJFRmgfXBo
  vfS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZmdgabwZOaVwE1/BbSYCWjx4a69IItLEhF
  SUg1MEXw8f0WsbLr+He5zO2l6xva6WM2Nf1Niy2+s5v6z0iOF6djy3pICv/Dq2PK1WYcT/1tu
  05gS77+wgT9h1vPJV9g9Cr/ETnV8rbLe8qjc5lNWAhGW/nkvj1a7uPI9OBPFMDNA6O6b2+I8X
  ZrvCuTU96h4LIizOrrGdpJoRPz+uRs7v3DeYK3hDmz6WlqvcmdtUJzo6pXPWJd6HtCzb1zlqB
  p3wYfV2Ow6x5oVx8qKX2Uxrj2afbTL0Jc5+Lpdg4bDOr0VL/bNymR9yDZpisrVo7XuZa0n/vA
  sDO60lvjFrvstzfrS6jSWI185V3mcXz2h9MijeLaF11szfr7mj5T1dlKYdnla7rWlj8sClX4p
  sRRnJBpqMRcVJwIAPSyZkloDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-8.tower-571.messagelabs.com!1673414797!499655!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11296 invoked from network); 11 Jan 2023 05:26:37 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-8.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 11 Jan 2023 05:26:37 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 0E94C1AF
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:37 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 02C8D7B
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:37 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Wed, 11 Jan 2023 05:26:35 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-redis: upgrade 4.4.0 -> 4.4.1
Date: Wed, 11 Jan 2023 13:26:18 +0800
Message-ID: <1673414780-13856-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
References: <1673414780-13856-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 Jan 2023 05:26:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100535

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 New Features
-------------
  Add dialect to FT.AGGREGATE (#2537)
  Add support for resetchannels in ACL SETUSER (#2514)
  Allow EVAL_RO and EVALSHA_RO to be routed to read replica (#2494)
  Add timeout parameter for SentinelManagedConnection (#2495)
  Add TIMEOUT to query class (#2519)
  Add support for certain LATENCY commands (#2503)

 Bug Fixes
-----------
  Add type checking to __eq__ in graph classes (#2531)
  Accept str for ex parameter in set command (#2529)
  Fix for Unhandled exception related to self.host with unix socket (#2520)
  Make PythonParser resumable (#2510)

 Maintenance
------------
  Fix incorrect _disconnect_raise docstring (#2534)
  Remove DeprecationWarning by replace get_event_loop with get_running_loop (#2530)
  Fix AttributeError when trying to split library version (#2539)
  Including startup instructions via redis-stack docker (#2535)
  Fix JSON.ARRINDEX test (#2527)
  Add OpenTelemetry example with Uptrace backend (#2452)
  Switch docs to furo theme (#2492)
  Combine auto-concatenated strings (#2482)
  Updating graph tests to support new execution plan (#2486)
  Raising NotImplementedError for certain CLUSTER and LATENCY commands (#2504) (#2501)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_4.4.0.bb => python3-redis_4.4.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_4.4.0.bb => python3-redis_4.4.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_4.4.0.bb b/meta-python/recipes-devtools/python/python3-redis_4.4.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-redis_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_4.4.1.bb
index a9ff015c5..d805a6ef2 100644
--- a/meta-python/recipes-devtools/python/python3-redis_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_4.4.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://github.com/andymccurdy/redis-py"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=1db1f331d351900707368237cc4880cf"
 
-SRC_URI[sha256sum] = "7b8c87d19c45d3f1271b124858d2a5c13160c4e74d4835e28273400fa34d5228"
+SRC_URI[sha256sum] = "f7a870c44868ab87bbecd6211c6d7c8720b1e9a796b743fbc4725d7ec75651c3"
 
 inherit pypi setuptools3
 
-- 
2.25.1


