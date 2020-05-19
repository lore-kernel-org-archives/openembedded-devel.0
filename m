Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web11.7138.1589869685026269699
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 May 2020 23:28:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zhengrq.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.73,408,1583164800"; 
   d="scan'208";a="92523728"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 19 May 2020 14:27:59 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 2D39D4BCC89E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 May 2020 14:27:57 +0800 (CST)
Received: from localhost.localdomain (10.167.225.35) by
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Tue, 19 May 2020 14:27:57 +0800
From: "zhengruoqin" <zhengrq.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe][PATCH] dstat: Fix runtime error that depend python.
Date: Tue, 19 May 2020 23:27:11 +0800
Message-ID: <1589902031-7723-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD06.g08.fujitsu.local (10.167.33.205) To
 G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206)
X-yoursite-MailScanner-ID: 2D39D4BCC89E.AC709
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Make dstat to depend python3.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../dstat/0001-change-dstat-to-python3.patch  | 89 +++++++++++++++++++
 meta-oe/recipes-support/dstat/dstat_0.7.4.bb  |  4 +-
 2 files changed, 92 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch

diff --git a/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch b/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
new file mode 100644
index 000000000..b009ba589
--- /dev/null
+++ b/meta-oe/recipes-support/dstat/dstat/0001-change-dstat-to-python3.patch
@@ -0,0 +1,89 @@
+From ce0528cb48666843fed2ad10ece5ecb0ac0b8cf8 Mon Sep 17 00:00:00 2001
+From: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+Date: Fri, 15 May 2020 12:38:49 +0900
+Subject: [PATCH] change dstat to python3.
+
+Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
+---
+ dstat               | 2 +-
+ examples/curstest   | 2 +-
+ examples/devtest.py | 2 +-
+ examples/mmpipe.py  | 2 +-
+ examples/mstat.py   | 2 +-
+ examples/read.py    | 2 +-
+ examples/tdbtest    | 2 +-
+ 7 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/dstat b/dstat
+index 9359965..f250f06 100755
+--- a/dstat
++++ b/dstat
+@@ -1,4 +1,4 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+ 
+ ### This program is free software; you can redistribute it and/or
+ ### modify it under the terms of the GNU General Public License
+diff --git a/examples/curstest b/examples/curstest
+index afc4e70..d720cca 100755
+--- a/examples/curstest
++++ b/examples/curstest
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import curses, sys
+ 
+ #c = curses.wrapper(s)
+diff --git a/examples/devtest.py b/examples/devtest.py
+index 0e9e969..e53babd 100755
+--- a/examples/devtest.py
++++ b/examples/devtest.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ import sys
+ sys.path.insert(0, '/usr/share/dstat/')
+diff --git a/examples/mmpipe.py b/examples/mmpipe.py
+index 5c93567..f91515f 100755
+--- a/examples/mmpipe.py
++++ b/examples/mmpipe.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import select, sys, os
+ 
+ def readpipe(file, tmout = 0.001):
+diff --git a/examples/mstat.py b/examples/mstat.py
+index abf4d07..ac157e4 100755
+--- a/examples/mstat.py
++++ b/examples/mstat.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ ### Example2: simple sub-second monitor (ministat)
+ 
+diff --git a/examples/read.py b/examples/read.py
+index 556b7ae..a925109 100755
+--- a/examples/read.py
++++ b/examples/read.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ 
+ ### Example 1: Direct accessing stats
+ ### This is a quick example showing how you can access dstat data
+diff --git a/examples/tdbtest b/examples/tdbtest
+index 528a8ea..ae7fef9 100755
+--- a/examples/tdbtest
++++ b/examples/tdbtest
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/python3
+ import sys, tdb
+ 
+ db = tdb.tdb('/var/cache/samba/connections.tdb')
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
index 2e37dd72e..74af54ca5 100644
--- a/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
+++ b/meta-oe/recipes-support/dstat/dstat_0.7.4.bb
@@ -9,7 +9,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "asciidoc-native xmlto-native"
 
-SRC_URI = "git://github.com/dagwieers/dstat.git"
+SRC_URI = "git://github.com/dagwieers/dstat.git \
+           file://0001-change-dstat-to-python3.patch \
+          "
 
 SRCREV = "6f5db0aed26bf8cf2700d4ffe90a9bd3436ac728"
 
-- 
2.17.1



