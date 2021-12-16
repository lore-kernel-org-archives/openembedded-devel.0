Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D49CC433F5
	for <webhook@archiver.kernel.org>; Thu, 16 Dec 2021 03:37:10 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web08.5673.1639625829022939775
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Dec 2021 19:37:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RwougpqW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639625826; i=@fujitsu.com;
	bh=jkSO0AQlObm+dbvFJHOPxMqQ2ViklURUxUuyREXR84k=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RwougpqW9+UpcTQU7DFxp+f5oQwPIWPZuLaxQwG0jku4FgTz8UiuV4HaVtMVhHbjp
	 hdWVt9ZsFoLHRHj1ciOes6JOt79X3cIIsdMvvlxNkPaJsS+PWUgC1AzhAy3EIjwAAI
	 XQ8AIUepl7+9qmh48kRsHnAG+154WIb7va2uHao/d0O00NFmta6HOVBCPIe1dMSle3
	 qPEJbXAhmc0eN+JPWt/tY6s0JsllEyO1Cm9UxZEFeZ2+G+loKIkRDJlqGhZgYnoBy2
	 3eYfhDg9Ejn7qs014G8PdOdKDEPSPzvgjar0dc30fuj3OLzmMNC6FK0Lg4jZRwUbH3
	 dkK1jgenxR3xA==
Received: from [100.115.3.179] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.ess.symcld.net id EF/96-10124-264BAB16;
 Thu, 16 Dec 2021 03:37:06 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprJIsWRWlGSWpSXmKPExsViZ8MRopu0ZVe
  iwY497BYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a23XdYCr6zVzzZvoetgXEWexcjF4eQwEwm
  iSdf+pghnBOMEt8+PmHrYuTkYBNQk5h+6wYriC0ioC+xdPYeZhCbWUBF4sXvHnYQW1jAX+LLx
  x6wGhYBVYkJCyeDxXkFnCRe3TsDZksIKEhMefieGSIuKHFy5hMWiDkSEgdfvGCGqFGUmH25mQ
  XCrpCYNauNaQIj7ywkLbOQtCxgZFrFaJlUlJmeUZKbmJmja2hgoGtoaKprqGtqqZdYpZuol1q
  qW55aXKJrqJdYXqyXWlysV1yZm5yTopeXWrKJERhiKcWM1jsYO/p+6h1ilORgUhLl7VTelSjE
  l5SfUpmRWJwRX1Sak1p8iFGGg0NJgldhM1BOsCg1PbUiLTMHGO4waQkOHiUR3vKNQGne4oLE3
  OLMdIjUKUZFKXHeR5uAEgIgiYzSPLg2WIxdYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMuw
  ZkCk9mXgnc9FdAi5mAFh/L3Q6yuCQRISXVwJRr8O/DuX5V/gduO1eZrG6Kj9G5pXnCaKXQxgl
  BlZPP2T1a5v1j/qX1p8T4WJsNQ8vKhA75Xs9b/rb8XBLHVq+7kefeyR0Ii/myOfsxz2sN1jfn
  S5btubxjovEZ7aSOmvXJetP/XffnX7Hdd091p2DkCV/9hd+7cp8eVzz6gOPZwStmzybwhD6We
  TRn0e9Sid2TFu04uc1n4ZOaM5MeqzYFpy/LCxKazyt/XOSY1dJVM5L5zTf0zejeN2/jwncqup
  zWZwPC/PbcbVfaa3iT6eJm58bT7p4rTFPYnetdF1fd+vzU+AH7Ege/ipQt3S4zih61N9X193Y
  WPHs0P+CbqdlpjimKWy/K5nYo2kkz7BdTYinOSDTUYi4qTgQA4aExkywDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-17.tower-585.messagelabs.com!1639625825!83142!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3668 invoked from network); 16 Dec 2021 03:37:06 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-17.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 16 Dec 2021 03:37:06 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BG3axHj024662
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Dec 2021 03:37:05 GMT
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 16 Dec 2021 03:36:57 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] dnf-plugin-tu: Fix bug when generating CSV
 file
Date: Thu, 16 Dec 2021 11:36:47 +0800
Message-ID: <1639625807-35126-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Dec 2021 03:37:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94377

If the rpm lacks dependencies, an exception will be thrown and exit
when generating the CSV file.
Modify utils.py to catch and handle exception.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
index d2b1a4ab5..e0f52ea62 100644
--- a/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
+++ b/meta-oe/recipes-devtools/dnf-plugin-tui/dnf-plugin-tui_git.bb
@@ -4,7 +4,7 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ubinux/dnf-plugin-tui.git;branch=master;protocol=https"
-SRCREV = "4b49165051bfdd136986855dd98aa9238eefdf78"
+SRCREV = "3ccf87915ceb70eac055a07eb80bc9105e916620"
 PV = "1.3"
 
 SRC_URI:append:class-target = " file://oe-remote.repo.sample"
-- 
2.25.1


