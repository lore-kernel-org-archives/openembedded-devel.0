Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751D1C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:36:40 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.76837.1703576190010169338
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:36:30 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="146247702"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="146247702"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:36:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A38DD4F6F
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:24 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DAEFDD9680
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:23 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6641A6B350
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:36:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0EE351A0072;
	Tue, 26 Dec 2023 15:36:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-ipython: upgrade 8.18.1 -> 8.19.0
Date: Tue, 26 Dec 2023 15:31:42 +0800
Message-Id: <1703575902-13390-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-2.099800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xLRJq3/nCaAjL6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFMDFNrM5zokuOFLiMLNqvmxwH4
	L20WA5kYKoc4BL6cw3YiX73EC1Ksai3JUfq/6+oJLdcNNyOUTlljQC9IW719RtPDP7q3RFeOx9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:36:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107800

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://github.com/ipython/ipython/blob/8.19.0/docs/source/whatsnew/version8.rst

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.18.1.bb => python3-ipython_8.19.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.18.1.bb => python3-ipython_8.19.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb b/meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb
index 5a7e1fbc5..87474e4ed 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.18.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.19.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "ca6f079bb33457c66e233e4580ebfc4128855b4cf6370dddd73842a9563e8a27"
+SRC_URI[sha256sum] = "ac4da4ecf0042fb4e0ce57c60430c2db3c719fa8bdf92f8631d6bd8a5785d1f0"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-setuptools \
-- 
2.34.1


