Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDDFC433EF
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 08:28:31 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web10.48721.1640766510307327011
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 00:28:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=oxgYgQeT;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640766508; i=@fujitsu.com;
	bh=rSgTsDX/+R74a/Ub9UUIlA4fHpJNi3asyZNFTCTmbYE=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=oxgYgQeT0sYMTrmmleYKmhHKpII/hXY1suNCpwEmbBMw82+b38cVoUhxQtmFAiMwX
	 MdFwLsuVub1Hgbl+399qj4y9Yh2dybQ44DuvTWfDvApVhRhxAWka5WRI5mNT9aAy04
	 MGu/UVyQS7bUP5fgk/A98CnotAlflL5sYbQrQXC0OuODsa48LfVQtchs0KT0JOFqbG
	 BTl3lziGKcpgeSpT9hejoLInoA1wKPEhPvvoVr8F9uRZi16rfge0yn9YkTWMPhBRrK
	 GGSlPH8L19+rWqkJiZjIxG8v2TmnKVwIHBjxhqpxTqcjduxTetOrRQk8nazsu+isk/
	 P9pNA8eWLz97w==
Received: from [100.115.35.72] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-2.aws.ess.symcld.net id 23/83-28974-C2C1CC16;
 Wed, 29 Dec 2021 08:28:28 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrEIsWRWlGSWpSXmKPExsViZ8ORqKstcyb
  RYNphU4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeP22qXsBZe5K1a83MzcwHiSq4uRk0NI4Amj
  xNpLhl2MXED2BSaJ9w2v2CGck4wSPb1P2UGq2ATUJR7ffM0IYosI6Essnb2HGcRmFlCV6L64B
  qxGWMBd4vPb1UxdjBwcLEDxGbNiQcK8QOE9F66wgdgSAgoSUx6+Z4aIC0qcnPmEBWKMhMTBFy
  +YIWqUJE6s+MgEYVdIvD58CSquJnH13CbmCYz8s5C0z0LSvoCRaRWjdVJRZnpGSW5iZo6uoYG
  BrqGhqa6xqa6hhYleYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgUKYUK+/Y
  wdi26qfeIUZJDiYlUd56hjOJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4vSSBcoJFqempFWmZO
  cAIgUlLcPAoifA2SwGleYsLEnOLM9MhUqcYFaXEeXlAEgIgiYzSPLg2WFReYpSVEuZlZGBgEO
  IpSC3KzSxBlX/FKM7BqCTMuxBkCk9mXgnc9FdAi5mAFtuangZZXJKIkJJqYEq+fefBixcS5lM
  sQ/WDFNkvhlvc2xBRu76sqfOhmO4yThu1aQ/cN7GfZ1zw5eLXFfMOHNddJSAWtyRqTfiHAsuP
  G51WOj13OZKz5EvgwTtKzRIfGa+tnvTKy7MtRHyZVJ7dAW1v/pAiffWKz6+N3Gs5GwLkdJyyL
  Ph9+168uvXnzpkiDXH+LGWzr2vmcQfVNzCVLWU3urr6Fl8N/1r1qxbHNDa9s762LTAhZcn9P9
  N7euyuba6X7XJ25hNX3VVZVMX+cD9/X1ZVilwa19N7ex99O8Pja3CpxGnJ1x0+9S/zWYtzeKK
  7zQ2uPl+03iDH2dTkCYOI+rToSXf3rd4XFcyU/f6MwRMXPU8euwcZSizFGYmGWsxFxYkAOdvr
  qUUDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-5.tower-571.messagelabs.com!1640766507!142467!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16793 invoked from network); 29 Dec 2021 08:28:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-5.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 29 Dec 2021 08:28:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 73189100195
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:28:27 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 27A8210019F
	for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Dec 2021 08:28:27 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Wed, 29 Dec 2021 08:28:18 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyro4: upgrade 4.81 -> 4.82
Date: Wed, 29 Dec 2021 16:27:07 +0800
Message-ID: <1640766427-27995-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Dec 2021 08:28:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94562

From: Xu Huan <xuhuan.fnst@fujitsu.com>

changelog:
===============================================================================
fixed @expose issue on static method/classmethod due to API change in Python 3.10
switched from travis to using github actions for CI builds and tests
Python 3.10 is now included in the unit test runs

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 .../{python3-pyro4_4.81.bb => python3-pyro4_4.82.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-connectivity/python-pyro4/{python3-pyro4_4.81.bb => python3-pyro4_4.82.bb} (76%)

diff --git a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
similarity index 76%
rename from meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb
rename to meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
index b05ce34f84..a7ed75f018 100644
--- a/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.81.bb
+++ b/meta-python/recipes-connectivity/python-pyro4/python3-pyro4_4.82.bb
@@ -2,7 +2,7 @@ SUMMARY = "Python Remote Objects"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=cd13dafd4eeb0802bb6efea6b4a4bdbc"
 
-SRC_URI[sha256sum] = "e130da06478b813173b959f7013d134865e07fbf58cc5f1a2598f99479cdac5f"
+SRC_URI[sha256sum] = "511f5b0804e92dd77dc33adf9c947787e3f9e9c5a96b12162f0557a7c4ce21fb"
 
 PYPI_PACKAGE = "Pyro4"
 
-- 
2.25.1


