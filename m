Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7088C001DE
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:41:15 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.151769.1692150073720075168
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:41:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="129515899"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="129515899"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:41:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B17FDB3C1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 59E23D3F1A
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:08 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D7BA521D157;
	Wed, 16 Aug 2023 10:41:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-async-timeout: upgrade 4.0.2 -> 4.0.3
Date: Wed, 16 Aug 2023 09:40:40 +0800
Message-Id: <1692150040-5290-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--0.172300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwjTcUw8L9AtVr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2W79
	Uq8KMo9cWoMmIj2FzF5PKnuxzZyZNDa6ZFdJ4+6myCC72kz3gGy8JrlEpkwvjt6AiFo7hY4lQGv
	FRV+7naNahAz6jsa37vbdEZuo7dmPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:41:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104383

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
  Fixed compatibility with asyncio.timeout() on Python 3.11+.
  Added support for Python 3.11.
  Dropped support for Python 3.6.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-async-timeout_4.0.2.bb => python3-async-timeout_4.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-async-timeout_4.0.2.bb => python3-async-timeout_4.0.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
rename to meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
index b1d19ce619..c16dfd0bf8 100644
--- a/meta-python/recipes-devtools/python/python3-async-timeout_4.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-async-timeout_4.0.3.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/aio-libs/async-timeout"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fa41f15bb5f23b6d3560c5845eb8d57"
 
-SRC_URI[sha256sum] = "2163e1640ddb52b7a8c80d0a67a08587e5d245cc9c553a74a847056bc2976b15"
+SRC_URI[sha256sum] = "4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f"
 
 PYPI_PACKAGE = "async-timeout"
 inherit pypi python_setuptools_build_meta
-- 
2.34.1


