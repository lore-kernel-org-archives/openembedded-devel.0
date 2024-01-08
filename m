Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D3B4C3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:56:35 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7027.1704722184798770302
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="133099572"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="133099572"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:56:21 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id DE4F3D3EA9
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:17 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 31FF614187
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:17 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B1D126CB32
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:56:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 50FE51A0072;
	Mon,  8 Jan 2024 21:56:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pytest-asyncio: upgrade 0.23.2 -> 0.23.3
Date: Mon,  8 Jan 2024 21:54:49 +0800
Message-Id: <1704722089-30992-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10--5.666000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrG24YVeuZGmOnw6VQ+/MY/bit
	rM0W1iTJnuC4VmJFPYaeDyFF4ZL3fz+Vy5gwgcxtqoeab9Xgz89UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmi7IWnvto+9Z1DXrKt1VG3HG5MoGKfGX+6YA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8h+ICquNi0WJLm+N
	u6LCbKPF7qgVO1mU8rVBvJQGCCdzsww8K7LMAZGftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:56:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108161

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fixes a bug that caused event loops to be closed prematurely when using async
 generator fixtures with class scope or wider in a function-scoped test
-Fixes various bugs that caused an internal pytest error during test collection

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-asyncio_0.23.2.bb => python3-pytest-asyncio_0.23.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-asyncio_0.23.2.bb => python3-pytest-asyncio_0.23.3.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb
rename to meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb
index a00778c99..85f69ac3a 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-asyncio_0.23.3.bb
@@ -3,7 +3,7 @@ DESCRIPTION = "pytest-asyncio is an Apache2 licensed library, written in Python,
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=136e4f49dbf29942c572a3a8f6e88a77"
 
-SRC_URI[sha256sum] = "c16052382554c7b22d48782ab3438d5b10f8cf7a4bdcae7f0f67f097d95beecc"
+SRC_URI[sha256sum] = "af313ce900a62fbe2b1aed18e37ad757f1ef9940c6b6a88e2954de38d6b1fb9f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


