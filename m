Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD6A1C001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:25:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.116212.1698049554287622831
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:25:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137213865"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137213865"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:25:53 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C06F4D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:25:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 06F28CFB9B
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:25:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3529B6BA7B;
	Mon, 23 Oct 2023 17:25:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-mypy: upgrade 1.5.1 -> 1.6.1
Date: Mon, 23 Oct 2023 16:25:22 +0800
Message-Id: <1698049522-24795-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.080100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/ySAWHOR37+ATVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJorNUVnqixiMOuce7gFxhKa0BQOqUsWgx5oFum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJmi+BBzzNJ8a+L/desw2y/rcXHm79cazCBLl
	HbOxHCyzcg6RINDIHhu00im4X0QVfzrkAyB1iF6OdvbLicqu6hFytKrk00gn3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:25:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105646

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-mypy_1.5.1.bb => python3-mypy_1.6.1.bb}   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-mypy_1.5.1.bb => python3-mypy_1.6.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb b/meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb
rename to meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb
index 50ad9efea1..fe9e3e3864 100644
--- a/meta-python/recipes-devtools/python/python3-mypy_1.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-mypy_1.6.1.bb
@@ -1,11 +1,11 @@
 SUMMARY = "Optional static typing for Python 3 and 2 (PEP 484)"
 HOMEPAGE = "https://github.com/python/mypy"
 LICENSE = "MIT & Python-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=6ba8ec528da02073b7e1f4124c0f836f"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d62fd8f8648cb018e52857347e340b9"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "b031b9601f1060bf1281feab89697324726ba0c0bae9d7cd7ab4b690940f0b92"
+SRC_URI[sha256sum] = "4d01c00d09a0be62a4ca3f933e315455bde83f37f892ba4b08ce92f3cf44bcc1"
 
 BBCLASSEXTEND = "native"
 
-- 
2.34.1


