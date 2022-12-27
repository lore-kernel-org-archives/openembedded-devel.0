Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FFF5C4708D
	for <webhook@archiver.kernel.org>; Tue, 27 Dec 2022 06:44:55 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.4])
 by mx.groups.io with SMTP id smtpd.web10.152440.1672123494886332726
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Dec 2022 22:44:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wuLxKRTi;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.4, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1672123493; i=@fujitsu.com;
	bh=TyABW+SL/WpfoHoRPa3C44QPQ1QksB/TLuMeZqxLqrM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=wuLxKRTiEJGhPAhiR1mykqLGREQJz35P/iM5GeIDXF85LDhUNXFhKU0br7epbAviw
	 nVYk3mlYNVo7Aw/mDy9aFtqmzp2HJNbwGeLJoruNrjwltyIYvCqo6X9kSlItGMjH7x
	 P8nXyMfckM1g6hWqvqPEu51IZa0awry0OQasNriv8vlUKAXyNRGnNCt/9IF9oglE1/
	 Vs3Tw/7MYz/CIKUO8FlIU8VCXNEJZ0gGg6pzPUWySw57iQwrDq0KAhJFiCja5H/dC5
	 oWMdGJWVSjwO8sph7AeHE7tTX4FZer1qfruEy28vgyuZVF66ksoTPg8Qs8V6HSmIt3
	 qDsmP/bYx6Ijg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpJsyZVW
  ywaqbOhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bzfa2CubwVj19sZmtgfM3dxcjFISTwkFHi
  w9mdrBDOZSaJXd//MUM4exglFhybAeRwcrAJSEncuP+fDcQWEdCXWDp7D1icWUBF4sXvHvYuR
  g4OYQEfiWmHrEBMFgFViafzuEEqeAWcJN5+bmMBsSUEFCSmPHwP1skp4CxxfMt9dhBbCKjmVF
  MbE0S9oMTJmU9YIKZLSBx88YIZoldRYvblZqg5FRKzZkHUSwioSVw9t4l5AqPgLCTts5C0L2B
  kWsVoWpxaVJZapGupl1SUmZ5RkpuYmaOXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdcmZuck6KX
  l1qyiREYtinF6qo7GM8t+6N3iFGSg0lJlFeqe1WyEF9SfkplRmJxRnxRaU5q8SFGGQ4OJQne0
  klAOcGi1PTUirTMHGAMwaQlOHiURCBaeYsLEnOLM9MhUqcYFaXEeb+C9AmAJDJK8+DaYHF7iV
  FWSpiXkYGBQYinILUoN7MEVf4VozgHo5IwrzrIeJ7MvBK46a+AFjMBLf5waCXI4pJEhJRUA1O
  dnsPcaAmPNbX78nbEve6uK+kwbTv9Kntrx5Gpp3rtGHPkL6XfNittquH4FLJb5f5N+wKXjzZv
  lQWajnxdsH9ZylIvD8kZiY5RW5hC792fnhTEcZ3z4DfB94sVzDm2p7RIc75snGd2+EP04ldz1
  V907w6/V7MrPaMrcOO5RQnni+N6Z/FIq3qJri629neb3nFqyXNnCd2Z7Xcz/8Q656ts890g2J
  DMfvObc1p5iXC0mkCqoe1UnaUNEpoB517vveeVlWI4fadKfMVEJeMnHuF2E1LDOD051v7xst+
  znMOgg8FSPtr4nf7cdxGXlujJOewRiDWO/H/nWtuyByUzNs7XTNrPv+v6G53DhvdblViKMxIN
  tZiLihMBODnSylYDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-15.tower-565.messagelabs.com!1672123492!864484!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 12245 invoked from network); 27 Dec 2022 06:44:52 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-15.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Dec 2022 06:44:52 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 726FE1AD
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:52 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 6754E7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:52 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Tue, 27 Dec 2022 06:44:50 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 6.5.0 -> 7.0.1
Date: Tue, 27 Dec 2022 14:44:11 +0800
Message-ID: <1672123453-31906-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
References: <1672123453-31906-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Dec 2022 06:44:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100267

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-When checking if a file mapping resolved to a file that exists, we weren't
 considering files in .whl files. This is now fixed, closing issue 1511.
-File pattern rules were too strict, forbidding plus signs and curly braces
 in directory and file names. This is now fixed, closing issue 1513.
-Unusual Unicode or control characters in source files could prevent reporting.
 This is now fixed, closing issue 1512.
-The PyPy wheel now installs on PyPy 3.7, 3.8, and 3.9, closing issue 1510.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_6.5.0.bb => python3-coverage_7.0.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_6.5.0.bb => python3-coverage_7.0.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb
index dfa374d87..caf6ba14f 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_6.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.0.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "f642e90754ee3e06b0e7e51bce3379590e76b7f76b708e1a71ff043f87025c84"
+SRC_URI[sha256sum] = "a4a574a19eeb67575a5328a5760bbbb737faa685616586a9f9da4281f940109c"
 
 inherit pypi setuptools3
 
-- 
2.25.1


