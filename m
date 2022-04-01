Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E753C433F5
	for <webhook@archiver.kernel.org>; Fri,  1 Apr 2022 02:43:06 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.5888.1648780985387714581
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:43:06 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 2312gx4e019024
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:43:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 2312gwlX005775
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Mar 2022 19:42:59 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 31 Mar 2022 19:42:58 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 31 Mar 2022 19:42:58 -0700
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] mcelog: fix compile error
Date: Fri, 1 Apr 2022 10:42:51 +0800
Message-ID: <20220401024251.6248-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Apr 2022 02:43:06 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96312

From: Kai Kang <kai.kang@windriver.com>

Fix compile error of mcelog if no /usr/bin/python exists on build
machine. And adjust indent as well.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../0001-genconfig.py-update-shebang.patch    | 33 +++++++++++++++++++
 meta-oe/recipes-support/mcelog/mcelog_180.bb  |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch

diff --git a/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch b/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch
new file mode 100644
index 000000000..10d17f57d
--- /dev/null
+++ b/meta-oe/recipes-support/mcelog/mcelog/0001-genconfig.py-update-shebang.patch
@@ -0,0 +1,33 @@
+From b09ff147e9383d33e6adbcb356b52236610fceda Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 1 Apr 2022 10:00:00 +0800
+Subject: [PATCH] genconfig.py: update shebang
+
+It fails to call genconfig.py if no /usr/bin/python on build machine:
+
+| ./genconfig.py mcelog.conf config-intro.man > mcelog.conf.5
+| /bin/sh: ./genconfig.py: /usr/bin/python: bad interpreter: No such file or directory
+| Makefile:71: recipe for target 'mcelog.conf.5' failed
+
+Update shebang with 'env python3' instead.
+
+Upstream-Status: Pending
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ genconfig.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/genconfig.py b/genconfig.py
+index ce9987f..982cac6 100755
+--- a/genconfig.py
++++ b/genconfig.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python
++#!/usr/bin/env python3
+ # generate man config documentation from mcelog.conf example
+ # genconfig.py mcelog.conf intro.html
+ from __future__ import print_function
+-- 
+2.17.1
+
diff --git a/meta-oe/recipes-support/mcelog/mcelog_180.bb b/meta-oe/recipes-support/mcelog/mcelog_180.bb
index 249e2421c..a64aacabf 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_180.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_180.bb
@@ -5,8 +5,10 @@ and should run on all Linux systems that need error handling."
 HOMEPAGE = "https://mcelog.org/"
 SECTION = "System Environment/Base"
 
-SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
+SRC_URI = "\
+    git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git;protocol=http;;branch=master \
     file://run-ptest \
+    file://0001-genconfig.py-update-shebang.patch \
 "
 
 SRCREV = "4146c9296a0cbd26f1c5e411cb44877f350053bd"
-- 
2.17.1


