Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA39C4321E
	for <webhook@archiver.kernel.org>; Mon, 28 Nov 2022 06:21:48 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web10.111515.1669616504345229686
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 27 Nov 2022 22:21:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=CnUkWWO1;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1669616502; i=@fujitsu.com;
	bh=ywXAYgbrOUezdDWHx/uUsp96MuV5F5GYwipBYQsITT4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=CnUkWWO1IW8A3SxWmR9dcdeSaFcQZuOVe3v5rYrPJolKzDXmecXliFCpn056eg/25
	 BKEhIebc9fMwRSH5vkN4/TRM13MhnHfMumkIDicdSkMNYuP7hZOfm6FJ+VwFLr+oE3
	 eTeuXd5xsQOKuk9lzB6JLQaPHJz1ubQ5I0cFrLHLdUCFaJkNU1zhRk0/yWPwLIqPHP
	 sHI2pVL7ZZgv5Ko/Z+kClG9nQ7+z+IzpWnF+8DSml55cHDGKdc6YyX9Z/E1HDAjDD0
	 wCKuUVd6qi805cPQaOXvXJjWBUwbgDqecxZ8Cf+bP1hH8pLU1/iLZ8laLvfHPBzirt
	 2R/gXmS9aONMw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8MxSbcsuCX
  ZYNskDouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNeN27y3mghXcFTv2v2VtYJzO1cXIxSEk8IRR
  Yl37L1YI5zqTxOJt55kgnD2MEtfeTQTKcHKwCUhJ3Lj/nw3EFhHQl1g6ew8ziM0soCLx4ncPO
  4gtLBAg0XDsOJjNIqAqceTGCyYQm1fASeLu38tgtoSAgsSUh+/BejkFnCW2/5nIAmILAdW8Xt
  kJVS8ocXLmExaI+RISB1+8YIboVZSYfbmZBcKukJg1qw1qpprE1XObmCcwCs5C0j4LSfsCRqZ
  VjObFqUVlqUW6hmZ6SUWZ6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6
  eaklmxiBAZxSnMq8g/Hysj96hxglOZiURHk/BrYkC/El5adUZiQWZ8QXleakFh9ilOHgUJLgn
  QuSEyxKTU+tSMvMAUYTTFqCg0dJhHexPVCat7ggMbc4Mx0idYrRkmPq7H/7mTmWg8mZX9sOMA
  ux5OXnpUqJ8yYHATUIgDRklObBjYNF/CVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwrx8IFN
  4MvNK4La+AjqICeigTYpNIAeVJCKkpBqYppyZY3/r9u16ldVCLPlfnv3Vk2RyW3TzhPDh8kNy
  3+sfTf58a5Vaxpslid9W1stL7WLq8pocuyFgHU88q9CepAf2dxvWZD3JKGgJnDGLuYJvquED6
  1Nb5mkvvbZ7Zsr+XRkT52aGv/Lbt445ZVHy1guzXqUdrHc/LXJ94xKRxY2HWTi0N3dbJfntdK
  rQFcuT2Xih7vLSs7YzLvvGBJv11Bl+U7gmkq399FtyVIf2rvn6rSeMc14UP7w3naXmzQuBU7q
  BfWw9H1Y8c072lazreWwZ+3YS3xfDu5xO74qUvTdHCxqqLn+VvOqWeOjDb8cWbDgXvph/Mudh
  kzz/ue8+qTzLX7gzcjWj6LoZuXtLvyixFGckGmoxFxUnAgBwRr3ncwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-728.messagelabs.com!1669616501!10720!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2094 invoked from network); 28 Nov 2022 06:21:42 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-16.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 28 Nov 2022 06:21:42 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 965241000E7
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:41 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 8A5601000DB
	for <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:41 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 28 Nov 2022 06:21:40 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycodestyle: upgrade 2.9.1 -> 2.10.0
Date: Mon, 28 Nov 2022 14:20:44 +0800
Message-ID: <1669616444-13316-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
References: <1669616444-13316-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 28 Nov 2022 06:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99815

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
========
    E231: allow trailing comma inside 1-tuples in []. PR #1108.
    W601, W602, W603, W604: removed (no longer relevant in python 3). PR #1111.
    E741: also apply to lambdas. PR #1106.
    E741: fix false positive for comparison operators. PR #1118.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-pycodestyle_2.9.1.bb => python3-pycodestyle_2.10.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.9.1.bb => python3-pycodestyle_2.10.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
index 928e2b2ae..b29fd4861 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.10.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "2c9607871d58c76354b697b42f5d57e1ada7d261c261efac224b664affdc5785"
+SRC_URI[sha256sum] = "347187bdb476329d98f695c213d7295a846d1152ff4fe9bacb8a9590b8ee7053"
 
 inherit pypi setuptools3
 
-- 
2.25.1


