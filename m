Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13B73C4332F
	for <webhook@archiver.kernel.org>; Fri,  7 Jan 2022 08:25:20 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.4216.1641543918802699743
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Jan 2022 00:25:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=ad38srYg;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1641543916; i=@fujitsu.com;
	bh=gG5RXq6bRXH65ZrRZDpOAPRaYX1CzdhfHNxNGmkbitc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=ad38srYgAU6ECzFBYWee/Jr9qldWVUFt2Ib0IEfpBRJOp4DT9QibpwRFfr6cbnFdr
	 mnezr+JPR0P2ZIzb4wCzbMWipEQxdbV3sAzrbMpFYIak35Q3vCQY9a2PgQSOXHn58L
	 XrCfPVHU0yeYhWFxp/EHiEz2oNunO6UdsGjqF6bh3pmCWmxg+fdzsHdWFFmBCW2c1A
	 njhaWQgnxnm9KVyKHCHaM+Z5OHAjiq+zA3WZGzEZicf5jgAJcch53Y5hGhIAgVu5n4
	 NyMopOHj6DUr8j0MnRG9PQ6Gq8ybBeAaszCP0kf9zVpEOL92ACoAlaIk8F++Ajnb5e
	 WcWp/UH6FvM5Q==
Received: from [100.115.37.212] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-2.aws.ess.symcld.net id E7/01-27579-CE8F7D16;
 Fri, 07 Jan 2022 08:25:16 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrLIsWRWlGSWpSXmKPExsViZ8MRovv6x/V
  Eg2mdRhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8bi9efYCt4rVnye8oi1gfGhbBcjJ4eQwAwm
  iU2zqiHsPYwSK3ZXgthsAhoSu6deZgaxRQT0JZbO3gNmMwuoSRx9+RPMFhawkXh44QMjiM0io
  CJx9Pl6FhCbV8BFYsamyWwgtoSAgsSUh+/B6jkFXCVm37zJBLHLRWLSXwibV0BQ4uTMJywQ8y
  UkDr54wQzRqyTx9tIeRgi7QmLWrDamCYz8s5C0zELSsoCRaRWjdVJRZnpGSW5iZo6uoYGBrqG
  hqa6xka6hhaVeYpVuol5qqW55anGJrpFeYnmxXmpxsV5xZW5yTopeXmrJJkZgSKYUK+zdwXh5
  5U+9Q4ySHExKorzi764nCvEl5adUZiQWZ8QXleakFh9ilOHgUJLgXXILKCdYlJqeWpGWmQOMD
  5i0BAePkgivADBGhHiLCxJzizPTIVKnGGM57h2dt4iZ483aJUDyLZhsu3cXSLaDyZkLDq5m5p
  gFJu+3HwKSD0CkEEtefl6qlDjv/+9AQwVAhmaU5sGthKWCS4yyUsK8jAwMDEI8BalFuZklqPK
  vGMU5GJWEeZeBTOHJzCuBu+wV0NFMQEevEAY7uiQRISXVwFRbcH520bft5mH8E0JO2vx4/WLx
  oR/tSrdnVLtF+Wk4HCldfGJBqYBksca3Z/vEsqX6n2yo1OLk3HfcP3pZ8M9LH9/dWl/9ltMmK
  6kpdueyk1p1X0sC+tXtmzTndu0oXGLoXh5mtHfiei0PQ9+3zRfXLJtQ9G7RZ5H+tQWeH386qj
  W//lUXxOR24KPHzFbJ8nwrIf3KnpVSE6T4bL5ZeBn8nWh84toqAx2Ff7nLHZSe/N/icts4Ifu
  6ZDHjRumblo5e4rnn965ZNZ3pv+Di3l25S/1Mp/97KvOl6s7M3PzDH9+pbb+/ZP+1G15GL746
  NLeZNrBF3l4xfVXjNfkmm633HSqzU+9uuTft+9a03w+UWIozEg21mIuKEwEAthkzgAMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-3.tower-565.messagelabs.com!1641543915!60249!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3462 invoked from network); 7 Jan 2022 08:25:15 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-565.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 7 Jan 2022 08:25:15 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 2078P7vk004314
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 7 Jan 2022 08:25:15 GMT
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Fri, 7 Jan 2022 08:25:08 +0000
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [oe] [PATCH 1/3] dstat: Deleted terminated project.
Date: Sat, 8 Jan 2022 01:24:55 +0800
Message-ID: <1641576297-3341-2-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
References: <1641576297-3341-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jan 2022 08:25:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94680

Please reference to https://github.com/dstat-real/dstat.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 .../dstat/0001-change-dstat-to-python3.patch  | 89 -------------------
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb  | 24 -----
 2 files changed, 113 deletions(-)
 delete mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
 delete mode 100644 meta-oe/recipes-support/dstat/dstat_0.7.4.bb

diff --git a/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch b/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
deleted file mode 100644
index 06a8498f3c..0000000000
--- a/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From ce0528cb48666843fed2ad10ece5ecb0ac0b8cf8 Mon Sep 17 00:00:00 2001
-From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
-Date: Fri, 15 May 2020 12:38:49 +0900
-Subject: [PATCH] change dstat to python3.
-
-Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
----
- dstat               | 2 +-
- examples/curstest   | 2 +-
- examples/devtest.py | 2 +-
- examples/mmpipe.py  | 2 +-
- examples/mstat.py   | 2 +-
- examples/read.py    | 2 +-
- examples/tdbtest    | 2 +-
- 7 files changed, 7 insertions(+), 7 deletions(-)
-
-diff --git a/dstat b/dstat
-index 9359965..f250f06 100755
---- a/dstat
-+++ b/dstat
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- 
- ### This program is free software; you can redistribute it and/or
- ### modify it under the terms of the GNU General Public License
-diff --git a/examples/curstest b/examples/curstest
-index afc4e70..d720cca 100755
---- a/examples/curstest
-+++ b/examples/curstest
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- import curses, sys
- 
- #c = curses.wrapper(s)
-diff --git a/examples/devtest.py b/examples/devtest.py
-index 0e9e969..e53babd 100755
---- a/examples/devtest.py
-+++ b/examples/devtest.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- import sys
- sys.path.insert(0, '/usr/share/dstat/')
-diff --git a/examples/mmpipe.py b/examples/mmpipe.py
-index 5c93567..f91515f 100755
---- a/examples/mmpipe.py
-+++ b/examples/mmpipe.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- import select, sys, os
- 
- def readpipe(file, tmout = 0.001):
-diff --git a/examples/mstat.py b/examples/mstat.py
-index abf4d07..ac157e4 100755
---- a/examples/mstat.py
-+++ b/examples/mstat.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- ### Example2: simple sub-second monitor (ministat)
- 
-diff --git a/examples/read.py b/examples/read.py
-index 556b7ae..a925109 100755
---- a/examples/read.py
-+++ b/examples/read.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- 
- ### Example 1: Direct accessing stats
- ### This is a quick example showing how you can access dstat data
-diff --git a/examples/tdbtest b/examples/tdbtest
-index 528a8ea..ae7fef9 100755
---- a/examples/tdbtest
-+++ b/examples/tdbtest
-@@ -1,4 +1,4 @@
--#!/usr/bin/python
-+#!/usr/bin/python3
- import sys, tdb
- 
- db = tdb.tdb('/var/cache/samba/connections.tdb')
--- 
-2.17.1
-
diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
deleted file mode 100644
index bc73f639bd..0000000000
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-SUMMARY = "versatile resource statics tool"
-DESCRIPTION = "Dstat is a versatile replacement for vmstat, iostat, netstat and ifstat. \
-Dstat overcomes some of their limitations and adds some extra features, more counters \
-and flexibility. Dstat is handy for monitoring systems during performance tuning tests, \
-benchmarks or troubleshooting."
-HOMEPAGE = "http://dag.wiee.rs/home-made/dstat"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
-
-DEPENDS += "asciidoc-native xmlto-native"
-
-SRC_URI = "git://github.com/dagwieers/dstat.git;branch=master;protocol=https \
-           file://0001-change-dstat-to-python3.patch \
-          "
-
-SRCREV = "6f5db0aed26bf8cf2700d4ffe90a9bd3436ac728"
-
-S = "${WORKDIR}/git"
-
-do_install() {
-    oe_runmake 'DESTDIR=${D}' install
-}
-
-RDEPENDS:${PN} += "python3-core python3-misc python3-resource python3-shell python3-six python3-unixadmin"
-- 
2.25.1


