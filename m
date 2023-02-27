Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0A3C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 08:14:21 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.112])
 by mx.groups.io with SMTP id smtpd.web11.85564.1677485658731547410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Feb 2023 00:14:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=n9Uk5to/;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.112, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1677485656; i=@fujitsu.com;
	bh=B5ShkKvhq0uEa/tRd5vZEjf/zo9zsO5otqRfC84sy9I=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=n9Uk5to/dnLiyftx5yhEkxLklXf5af3ea3dVpA2pH3OxBg90eJl2kadaQUKqfp7ag
	 r32T4myyT2ynu3Da6RHHYMxAS4VBo1A9ZKQ9Yyq6j9/zhCihrZlh+5MQc+V4asta9g
	 /RS+6dBPVCwP8r0B7Qrq2yh2hX4GTL1+BwsAQN0sRoPqiLw63x6pLcn67JZ4Zn/u0/
	 IjPmV8ZiMoHBbyQuTok3+mhkIvcauRJIkvzKCxDLDudT4YDQXpmHy0ZhlreF+heGaP
	 gxu/10yvb4HGjl67yRZ2PMJfIUJohqjwZmKfWMO+7OKQeZBiv5EB9T8OgOY0EaBj9o
	 SCBkEma6aAIKw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRWlGSWpSXmKPExsViZ8OxWTci7U+
  ywc49bBYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bJr59YCvq4Kv6+ucTewLiJs4uRi0NI4AGj
  xMT9s1kgnCtMElenbGWFcPYySpxuecbYxcjJwSYgJXHj/n82EFtEQF9i6ew9zCA2s4CKxIvfP
  ewgtrCAn8TcZReAmjk4WARUJd7fDgYJ8wo4SZy43gw2RkJAQWLKw/fMEHFBiZMzn7BAjJGQOP
  jiBTNEjaLE7MvNLBB2pUTrh19QtprE1XObmCcw8s9C0j4LSfsCRqZVjObFqUVlqUW6hhZ6SUW
  Z6RkluYmZOXqJVbqJeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiB4ZhSnFi3g3FF
  31+9Q4ySHExKoryLnP4kC/El5adUZiQWZ8QXleakFh9ilOHgUJLgPZgElBMsSk1PrUjLzAHGB
  kxagoNHSYSX2QgozVtckJhbnJkOkTrFqCglzsuXCJQQAElklObBtcHi8RKjrJQwLyMDA4MQT0
  FqUW5mCar8K0ZxDkYlYd6oBKApPJl5JXDTXwEtZgJavP3hD5DFJYkIKakGJgWb2Oh3sl7lzIt
  WLGffm5JydQ9b8MMqyalhcydclG7K8qgzZ2a0fswQuG4eQ//6k+Jvg4x3rZ/f2GonzbT2usnq
  pVs1lz55d+bSwdWKV9b80t35ukfK2bXaR9pw29OGQ2sTw/iDT97acWJx0pEEjyW1FTee7U9sb
  xLX0Lv63LxpiY3R/6Wus8PeH1G+LPBUTmmH/ve5MfYCU/SOPI7Z+qmOU9mkdOb9hPeMxlq7zi
  rO1nxaVafmZMz5T/TknZm7hM4fluzYt6137bKplcUfHLMVnBUuv5leM4GXIXub87m5y01frSi
  ZeK3zgdzMr74eNQmLOE8/fzpfOrDrj3tXY81eQYXlFuErFizXzxIRFlZiKc5INNRiLipOBAAs
  Ll60QgMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-20.tower-732.messagelabs.com!1677485655!211902!1
X-Originating-IP: [62.60.8.179]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.103.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16929 invoked from network); 27 Feb 2023 08:14:16 -0000
Received: from unknown (HELO n03ukasimr04.n03.fujitsu.local) (62.60.8.179)
  by server-20.tower-732.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 27 Feb 2023 08:14:16 -0000
Received: from n03ukasimr04.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTP id 7976773
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:15 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr04.n03.fujitsu.local (Postfix) with ESMTPS id 5EE0D7B
	for <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:15 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Mon, 27 Feb 2023 08:14:14 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-sqlalchemy: upgrade 2.0.3 -> 2.0.4
Date: Mon, 27 Feb 2023 16:13:57 +0800
Message-ID: <1677485641-11740-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 27 Feb 2023 08:14:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101288

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://docs.sqlalchemy.org/en/20/changelog/changelog_20.html#change-2.0.4

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-sqlalchemy_2.0.3.bb => python3-sqlalchemy_2.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sqlalchemy_2.0.3.bb => python3-sqlalchemy_2.0.4.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb
rename to meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb
index d2ff35fb0..e5d0212a6 100644
--- a/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-sqlalchemy_2.0.4.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://www.sqlalchemy.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b707d50badb798e1d897f2c8f649382d"
 
-SRC_URI[sha256sum] = "c2b924f6d0162ed1c0d8f47db1e56498702b1c3c953ad84f0eefbf5b4e53bb05"
+SRC_URI[sha256sum] = "95a18e1a6af2114dbd9ee4f168ad33070d6317e11bafa28d983cc7b585fe900b"
 
 PYPI_PACKAGE = "SQLAlchemy"
 inherit pypi setuptools3
-- 
2.34.1


