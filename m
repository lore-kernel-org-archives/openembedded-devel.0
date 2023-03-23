Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 131E5C6FD1C
	for <webhook@archiver.kernel.org>; Thu, 23 Mar 2023 05:13:38 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web10.65753.1679548409570956567
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Mar 2023 22:13:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=GUrlZhkt;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1679548407; i=@fujitsu.com;
	bh=b70Gh0ULppg25GWDiWtfXwlFKCYj3G7RwnOjyhb+1SY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=GUrlZhktYunKg9oGe0eYOFqezH2hE4A3uNTcAa9VSJrRdVS8JNmPUh9tw0Un5b8M9
	 pjqap861YHh4eR2FWxEwsmoEY6MnD/mRzONmB/xyVOCqWcbey1BhvwZAY3Q2hrto63
	 yEqLhEom/1aZcybUoo0ZxRUZy5NV70Bpn+IBdc0Wpy9mpyJY6OQwqZSAzZ2WP+MyfK
	 MgS5brbxvBylII3OU0nbM+elps4SfrHlGgOQ6E2QbFck8R6I6JTSSPDd6nse+z8cXv
	 Tw3AjQvSjMW0mHtSsZwJip3tJH7lBNvsXKnLPGqi/O4ba9erpD77QWJJUS9vn8lJxM
	 +brsQQIEJPXHA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKIsWRWlGSWpSXmKPExsViZ8ORqPv9vnS
  KwdQjshYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8b38+UFDdwVW7ZPYWtgnMLVxcjFISTwhFFi
  1+rzrBDOdSaJmf+vMkI4exglTtybw9TFyMnBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sECAxLEN8xlBbBYBVYk/jWvBenkFnCRenfgL1ishoCAx5eF7sF5OAWeJK08usoDYQkA1z7
  dPY4GoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdINE4/xARhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaFqcWlSWWqRrqZdUlJmeUZKbmJmjl1ilm6iXWqpbnlpcomuol1herJdaXKxXXJmbnJOi
  l5dasokRGLopxaxOOxiP9/3VO8QoycGkJMorESqdIsSXlJ9SmZFYnBFfVJqTWnyIUYaDQ0mCV
  +AOUE6wKDU9tSItMwcYRzBpCQ4eJRHeuQeB0rzFBYm5xZnpEKlTjIpS4rzL7wElBEASGaV5cG
  2w2L3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXB2QKT2ZeCdz0V0CLmYAWx82QAFlckoi
  Qkmpgqnyx4rSa60yJJQs5jsU4X5mnXW7GsdB+dQ+j19m9qVxWnVyJHOH/i1+pPlhn47Gh2Vot
  beky6aDK9oczN9vvnuUfWSxpXGtpw9TpFHfpb9OqWcyl7n/liqrlhfbnn3x44qyq5pel0zwOn
  PjC9UDjyrMzu39+PP74vq3J/hL7NU/NvNWMS89e4LsccWONgfruN/GPeWd2zIjRj0jo3bVn4+
  pyhf1hS7/xmd5PVfc4MHWRWbaO5qRtWd5Pb4pO98t9ti1VZtOvCZ8+Fi1TEfPfcKVYsq3dqC0
  /4fCjdAPr1zyCaqqhJd2iId9OOH1MEQk8aRxY/fnQpMNpTXw2HFvKtDt41sw+NzehONjrbvdE
  JZbijERDLeai4kQA6d0fXVgDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-3.tower-587.messagelabs.com!1679548407!170108!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.104.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19327 invoked from network); 23 Mar 2023 05:13:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-3.tower-587.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Mar 2023 05:13:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 172AC10019E
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:27 +0000 (GMT)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 09EE710019C
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:27 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Thu, 23 Mar 2023 05:13:25 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-simplejson: upgrade 3.18.3 -> 3.18.4
Date: Thu, 23 Mar 2023 13:12:54 +0800
Message-ID: <1679548374-20397-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
References: <1679548374-20397-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Mar 2023 05:13:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101656

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Test the sdist to prevent future regressions
  https://github.com/simplejson/simplejson/pull/311
* Enable ppc64le wheels
  https://github.com/simplejson/simplejson/pull/312

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-simplejson_3.18.3.bb => python3-simplejson_3.18.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-simplejson_3.18.3.bb => python3-simplejson_3.18.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb b/meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb
rename to meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb
index 5752a0344..e7d6ca0cf 100644
--- a/meta-python/recipes-devtools/python/python3-simplejson_3.18.3.bb
+++ b/meta-python/recipes-devtools/python/python3-simplejson_3.18.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://cheeseshop.python.org/pypi/simplejson"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=c6338d7abd321c0b50a2a547e441c52e"
 
-SRC_URI[sha256sum] = "ebb53837c5ffcb6100646018565d3f1afed6f4b185b14b2c9cbccf874fe40157"
+SRC_URI[sha256sum] = "6197cfebe659ac802a686b5408494115a7062b45cdf37679c4d6a9d4f39649b7"
 
 inherit pypi setuptools3
 
-- 
2.34.1


