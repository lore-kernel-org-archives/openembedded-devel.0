Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0ABEC47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:47:24 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.1531.1705974438991116924
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:47:19 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="125717721"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="125717721"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:47:16 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B3A92D618D
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:47:14 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E362ECFB9C
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:47:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BE5120074728
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:47:13 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1A4C61A006A;
	Tue, 23 Jan 2024 09:47:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eventlet: upgrade 0.34.2 -> 0.34.3
Date: Tue, 23 Jan 2024 09:45:56 +0800
Message-Id: <1705974356-25867-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.003
X-TMASE-Result: 10--5.326300-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuNJ2ckLRg2UZtX
	hf4dcLJZegz5rXV3e7Qjc+Waz3QIg/CSZ5L8hgdk72Rb2bEJC+2C7C2rJeUToRs9Lp3wSfWd+2o
	iuQ7+XlxddTsTZDFUSQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbaH62
	gsspfBEYGQRIwjTl3iKI5/U0OcIj7lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07fUrO
	TjR0Rj1iRygafnmWIEaozq46Aq6h/zalcsKGy3gARgKN5TM2k8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108412

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Fix security issue in the wsgi module related to RFC 9112
* Fix segfault, a new approach for greening existing locks
* greendns: fix getaddrinfo parameter name
* Fix deprecation warning on ssl.PROTOCOL_TLS
* Pytests, fix error at teardown of TestGreenSocket.test_full_duplex
* Skip test which uses Py cgi module
* Drop old code based on python < 3.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.34.2.bb => python3-eventlet_0.34.3.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.34.2.bb => python3-eventlet_0.34.3.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb
index 86524da42..64db72b2d 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.34.3.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
-SRC_URI[sha256sum] = "2115c7c6742e6893bf1347f82915572f8895c911cb5abaad4d3596a7daa847cc"
+SRC_URI[sha256sum] = "ed2d28a64414a001894b3baf5b650f2c9596b00d57f57d4d7a38f9d3d0c252e8"
 
 inherit pypi setuptools3
 
-- 
2.34.1


