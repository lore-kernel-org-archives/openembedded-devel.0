Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251AAC433FE
	for <webhook@archiver.kernel.org>; Sat, 19 Nov 2022 07:45:35 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web11.15805.1668843928152187404
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 18 Nov 2022 23:45:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=sVY7D/N5;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1668843926; i=@fujitsu.com;
	bh=X0+ZjP3uCZiIM1Ve4tQv+bPabq2KS+sNjvPQ66mW4AQ=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=sVY7D/N5qRwm4qQopx2xXyPY+4nmZR0K8wydtWaqwTwwp5BKwxKU9fIcxYOvSrZeL
	 BsOMjbkrjUvqdIWtE+RMitUV5aci+IJCQgFTTxIC39cK6bmBPJcMIgdSqM5kST/Jt2
	 sCCMNUHD9Oeo1q/MhJRKgJdv9A4hm8hZlx5643tmBS2Nv6B3n7CN2Xbw6Ac2v9MjBI
	 hHgxmPx8WoVn7z/CiWYT3UozxWlabhsD+VGlyhJaSqLRL6jrobkZ6xWZyuuuJIc0j+
	 31kmXiysPyxuWlleKrX7pKmuU4AP5GYpCr/q864nM72eKTF1UKtHo1nu55ysEiCCzY
	 UklO7KFmDGGQw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIIsWRWlGSWpSXmKPExsViZ8ORqDu1syL
  ZoO2HocXFw0uZHRg9zm1cwRjAGMWamZeUX5HAmtF6bRdTwXquihdtixkbGA9zdjFycQgJPGGU
  6F/6nwnCuc4ksWrqdcYuRk4gZw+jxIULUiA2m4CUxI37/9lAbBEBfYmls/cwg9jMAioSL373s
  IPYwgJ+Ei1/poHFWQRUJZ5MXQM2h1fAUWLb5yNgcQkBBYkpD9+D2ZwCThLnl12D2uUosefoBz
  aIekGJkzOfsEDMl5A4+OIFVK+ixOzLzSwQdoXErFltTBC2msTVc5uYJzAKzkLSPgtJ+wJGplW
  MpsWpRWWpRbqWeklFmekZJbmJmTl6iVW6iXqppbrlqcUlukZ6ieXFeqnFxXrFlbnJOSl6eakl
  mxiBoZtSrK66g/Hcsj96hxglOZiURHn3tpcnC/El5adUZiQWZ8QXleakFh9ilOHgUJLgjWurS
  BYSLEpNT61Iy8wBxhFMWoKDR0mEV8QHKM1bXJCYW5yZDpE6xajLMfNr2wFmIZa8/LxUKXHe+n
  agIgGQoozSPLgRsJi+xCgrJczLyMDAIMRTkFqUm1mCKv+KUZyDUUmY9yjIFJ7MvBK4Ta+AjmA
  COiLHuQzkiJJEhJRUA5OC5MfyIy9UF94/m1l764jyO7ZtfE8n2Xme2nqyyXHfm2Mn7vdKzvWa
  9yqN4auQ4f26lF3M/jfKjjkpvhc4yfelatqLKV/Taj/eknB/XiJ1a5m4ZsWLT2aJGg9ZtuWcq
  pkiE7hPw+i2lH6/xq7G9npfuaYdXytjGI4GsJgtE/OZebijsSPYL0h4h15jed025zNnXX/wrj
  l7hKfjmAWf7rJZX1hSguomf59m31Uxo2HJP4fqD4v7XG+WLLjIJnTgu3LgAu+Fy3cF3gzzVLh
  7JVDQRn+Nie/Bn/bVDbGJRjxVv/4lqT6L8xENfpFZc2Gd55o6gR23ZlQ5W7MuXpJltGjD8/Y7
  pk1Xq+OnT1DRE1RiKc5INNRiLipOBAAyYBVmZAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-571.messagelabs.com!1668843925!138434!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.101.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27720 invoked from network); 19 Nov 2022 07:45:25 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-21.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Nov 2022 07:45:25 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 87F58106EF9
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7C4BB1035EB
	for <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:25 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Sat, 19 Nov 2022 07:45:24 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eventlet: upgrade 0.33.1 -> 0.33.2
Date: Sat, 19 Nov 2022 15:44:56 +0800
Message-ID: <1668843897-3019-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
References: <1668843897-3019-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Nov 2022 07:45:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99634

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
* greenio: GreenPipe/fdopen() with 'a' in mode raised io.UnsupportedOperation:
  File or stream is not writable https://github.com/eventlet/eventlet/pull/758

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.33.1.bb => python3-eventlet_0.33.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.33.1.bb => python3-eventlet_0.33.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb
index afaaf4a97..6348e9b76 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.33.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.33.2.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "afbe17f06a58491e9aebd7a4a03e70b0b63fd4cf76d8307bae07f280479b1515"
+SRC_URI[sha256sum] = "82c382c2a2c712f1a8320378a9120ac9589d9f1131c36a63780f0b8504afa5bc"
 
 inherit pypi setuptools3
 
-- 
2.25.1


