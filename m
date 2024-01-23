Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8811C46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:20:34 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.998.1705972824131947933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:20:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146415037"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146415037"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:20:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 70142E0401
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:20:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B604D9481
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:20:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 327781E9C8D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:20:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C04151A006A;
	Tue, 23 Jan 2024 09:20:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] python3-apscheduler: add new recipe
Date: Tue, 23 Jan 2024 09:20:04 +0800
Message-Id: <1705972804-25125-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--2.249000-10.000000
X-TMASE-MatchedRID: 4r2MyAYFTndSuJfEWZSQfArcxrzwsv5uTJDl9FKHbrm+f7ap9DJaDe79
	DJRUi35pTQ0JkPG287/mn3xyPJAJoo3oygjMeK7eSs47mbT7SAQcDnAff/bXERHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2eVW
	/ZdL52j1ZVc/gvczVcs3U541sialan8aOoBS3xT2bVeKdV6wO/Drh375zQ8lL9jIQcnRy9Mxnj+
	fUY1n9Sh/JH/pga7gci0MQvlAIn+PIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:20:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108395

From: Wang Mingyu <wangmy@fujitsu.com>

Add a new recipe for python3-apscheduler, a task scheduler and task queue system for Python.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/python3-apscheduler_3.10.4.bb            | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb

diff --git a/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb b/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
new file mode 100644
index 000000000..01ffa25ac
--- /dev/null
+++ b/meta-oe/recipes-devtools/python/python3-apscheduler_3.10.4.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Advanced Python Scheduler (APScheduler) is a Python library that lets you schedule your Python code to be executed later, either just once or periodically."
+HOMEPAGE = "https://github.com/agronholm/apscheduler"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=f0e423eea5c91e7aa21bdb70184b3e53"
+
+SRC_URI[sha256sum] = "e6df071b27d9be898e486bc7940a7be50b4af2e9da7c08f0744a96d4bd4cef4a"
+
+PYPI_PACKAGE = "APScheduler"
+
+inherit pypi python_setuptools_build_meta
+
+DEPENDS += "python3-setuptools-scm-native"
-- 
2.34.1


