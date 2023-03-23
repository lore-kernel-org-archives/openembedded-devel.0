Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D659C6FD1D
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:14:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.65401.1679548485459840286
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:14:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=kwQ+33AK;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548483; i=@fujitsu.com;
	bh=KurcJPZ3VkbC5hp3G87X32YXcwqZeXpUiORSzoE5qFs=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=kwQ+33AK2ahf6tmq63P1Pf6A8m+Zeick+A6aQSa1zvrwete7AETNYXE5lKS7zVhBy
	 EVZ5pc2isL9ro9zrUimk8JLzL+YOrgGs9HyTbxv6y9Fr75f3ZMDueuagBHjzPfvvC3
	 H2A8vgsyxFaTlR12gOvM4bqVXM7NcuQqD/mhl9LDdnnzKwUYsEILYs7fbxuh/Ur8CZ
	 qFR6ekkJYlgYed1DqTpNUu3nFDI3qlPUA6/doS5/NINgHIe6YCwbU29OM7hzlF7Nwr
	 6MeBGK3WUQiUG9vJ3muEsu9KhIAeC4fDdeLTa/c8CFCCEarpVPsqwTzc0nXI2H/N0J
	 ZHWYZNODxlAeA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8ORqOv4QDr
  FYPlbfYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPKL9mC9zwVO3/9YGxgPMndxcjFISTwhFHi
  wfWNzBDOdSaJb8uamLoYOYGcPYwSU1dxg9hsAlISN+7/ZwOxRQT0JZbO3sMMYjMLqEi8+N3D3
  sXIwSEs4CMx5ZU9iMkioCqx5ZYqSAWvgJPEvWcPGEFsCQEFiSkP3zNDxAUlTs58wgIxRULi4I
  sXzBA1ihKzLzezQNgVEo3TDzFB2GoSV89tYp7AyD8LSfssJO0LGJlWMZoXpxaVpRbpGhnoJRV
  lpmeU5CZm5uglVukm6qWW6ublF5Vk6BrqJZYX66UWF+sVV+Ym56To5aWWbGIEBmJKcdq+HYwd
  fX/1DjFKcjApifJKhEqnCPEl5adUZiQWZ8QXleakFh9ilOHgUJLgFbgDlBMsSk1PrUjLzAFGB
  UxagoNHSYR37kGgNG9xQWJucWY6ROoUo6KUOC/TfaCEAEgiozQPrg0WiZcYZaWEeRkZGBiEeA
  pSi3IzS1DlXzGKczAqCfPq3AOawpOZVwI3/RXQYiagxXEzJEAWlyQipKQamIzvzePktG+KKFR
  Srdimn6bI1nJ7z9fWd05bVp0SS1Y8ZtHYYqBQwNzmvCxe/uwE/yzpedsirzkKfGM+1F26SveS
  3LWErby7yr7tq6h6pvB0QYLM8t9O9Q+//ua5MmvDo8Ole72zEt/HCFfs+Tx9avL6LSrmE8LkK
  uSjfJ9+P380NGuZs9+Ruws0X1+aNlP4RK4Du7OB/IPtgf+MLmQ1XQ9KXvV64l1hv1ghqwr/pJ
  WTj1jvXhCut8xq+rlV0g+P/Ba9sfSyFf+eKxct91qW75y05WCLfvgX0Yda95ocFl5PqTrkZrZ
  /tmrAMm31jvu/u/jzxfy0zFe3iX/YcuXH8cnZHZ8qpkxa8ra9qXtHTYQSS3FGoqEWc1FxIgBP
  eFz7PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-14.tower-728.messagelabs.com!1679548481!170747!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 23023 invoked from network); 23 Mar 2023 05:14:41 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-14.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:14:41 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 2A32E10019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:41 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 1DD6410019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:14:39 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-socketio: upgrade 5.7.2 -> 5.8.0
Date: Thu, 23 Mar 2023 13:14:22 +0800
Message-ID: <1679548466-20438-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:14:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101657

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 Made kombu client manager more robust and efficient
 Made aio_pika client manager more robust and efficient 
 Correctly handle emits to multiple rooms in the async server 
 Expose the ignore_queue option in namespaces 
 Do not automatically import zmq
 TLS/SSL client documentation 
 Removed incorrect reference to multiple callback invocations in documentation 
 Fix documentation typos
 Add Python 3.11 to builds

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-socketio_5.7.2.bb => python3-socketio_5.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-socketio_5.7.2.bb => python3-socketio_5.8.0.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb b/meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
rename to meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb
index bfc543734..5de749081 100644
--- a/meta-python/recipes-devtools/python/python3-socketio_5.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-socketio_5.8.0.bb
@@ -9,7 +9,7 @@ inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "python-socketio"
 
-SRC_URI[sha256sum] = "92395062d9db3c13d30e7cdedaa0e1330bba78505645db695415f9a3c628d097"
+SRC_URI[sha256sum] = "e714f4dddfaaa0cb0e37a1e2deef2bb60590a5b9fea9c343dd8ca5e688416fd9"
 
 PACKAGECONFIG ?= "asyncio_client client"
 PACKAGECONFIG[asyncio_client] = ",,,${PYTHON_PN}-aiohttp ${PYTHON_PN}-websockets"
-- 
2.34.1


