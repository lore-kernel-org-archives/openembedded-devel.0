Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA54C4708E
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:39:05 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.81])
 by mx.groups.io with SMTP id smtpd.web11.153518.1672123142152898284
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:39:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=EBLA+AJq;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.81, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123140; i=@fujitsu.com;
	bh=z6Nn6K0wUoPIzV3tYiwi7DeNjrOo9y3hQWSaRbPQEUQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=EBLA+AJqIxgMZQvhkAG8CYN+XYasOXF16UWYzkrmjyo1b2HsHlsZ59MvqiK+ZZFhF
	 DCNWYZbv1xmoyShbq+3UmQURuQmXlphnXvE/E5XgjDBP520t74X1Cz0/iLtQ+ilWEN
	 f7u9u+iCngoIE6dTjUixKLopQj0xedwJc7laqIahhb9jTcRw2AOvgfZmIrtrZyYALC
	 lZ0ThsEZ4UFAMxOE5iqLnJtXTjefrS5t9f4Ri775Ycpn8ecAa+lTszkzP9Bc7V1JTL
	 G7H1F+boBE5rX9Z+VKEoMRfoJZYTbQG2LLaRroWnAjT6mTH8yiVioN7yQAYVZFTe84
	 fhPfqXzo7jaPw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8ORpMs0eVW
  ywcqpohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bCa2tZC9bzVXT+a2ZvYHzN08XIxSEk8IBR
  YtOdlYwQzhUmia8rvzNDOHsYJXbe+MXSxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAt8SdqcfA4iwCqhKTXh8D6+UVcJL4sPMTmC0hoCAx5eF7sBpOAWeJzo2/WEFsIaCaI5
  3dUPWCEidnPmGBmC8hcfDFC2aIXkWJ2ZeboeZUSMya1cYEYatJXD23iXkCo+AsJO2zkLQvYGR
  axWhanFpUllqka6SXVJSZnlGSm5iZo5dYpZuol1qqW55aXKJrqJdYXqyXWlysV1yZm5yTopeX
  WrKJERi8KcUss3cw9iz9o3eIUZKDSUmUV6p7VbIQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd7LI
  DnBotT01Iq0zBxgJMGkJTh4lEQgWnmLCxJzizPTIVKnGBWlxHk7JwIlBEASGaV5cG2w6L3EKC
  slzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXHWQ8T2ZeCdz0V0CLmYAWfzi0EmRxSSJCSqqBaZY
  eR3/8F4WsW6cZ3xfN3XS1vTTI4tzjGyrxPQsOnHXru7kk3ZixYl7gEe+6x9dbK9LMXwrwO7xz
  WHzC9s81sfiyPvYiN91pT6v8LpmExlrOXuykcjvAjtHvdf53rVfyR/cxn34/balW9NWkNJmbG
  TmfmLqUt9vlLKnI1v+zx9r+atWlD9NF3lzkevjy7dJ4RavZNyyjfqSxuu8obvoebpm72XS5hO
  G9O6/N2/ntzn32lul6te+8f8M6o4uVK3QEH/DZ/M3hd16vec5+vlVvxfGSyc8mTvQuv9DeJWM
  WXCkdnak3Wb7L+/axOaW68gJFS+ruh0U7P+tz/31EVPjit5QQiYLshraLrcLlz3YosRRnJBpq
  MRcVJwIAmh1Jb1kDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1672123138!308607!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11797 invoked from network); 27 Dec 2022 06:38:58 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:38:58 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id F11227B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:57 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id E529E1AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:38:57 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:38:56 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-alembic: upgrade 1.9.0 -> 1.9.1
Date: Tue, 27 Dec 2022 14:38:17 +0800
Message-ID: <1672123098-31844-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
References: <1672123098-31844-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:39:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100263

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixed issue where server default compare would not work for string defaults
 that contained backslashes, due to mis-rendering of these values when comparing
 their contents.
-Implemented basic server default comparison for the Oracle backend; previously,
 Oracle's formatting of reflected defaults prevented any matches from occurring.
-Adjusted SQLite's compare server default implementation to better handle
 defaults with or without parens around them, from both the reflected and the
 local metadata side.
-Adjusted SQL Server's compare server default implementation to better handle
 defaults with or without parens around them, from both the reflected and the
 local metadata side.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-alembic_1.9.0.bb => python3-alembic_1.9.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-alembic_1.9.0.bb => python3-alembic_1.9.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb b/meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb
rename to meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb
index 071c60705..03a38d5ff 100644
--- a/meta-python/recipes-devtools/python/python3-alembic_1.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-alembic_1.9.1.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f5a8522010db1a393833988dbe2c7f0b"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "6af6792fe699730b27480382701b16028ebbaac6bc5cd4f06daf5fa3e4690364"
+SRC_URI[sha256sum] = "f9f76e41061f5ebe27d4fe92600df9dd612521a7683f904dab328ba02cffa5a2"
 
 PYPI_PACKAGE = "alembic"
 
-- 
2.25.1


