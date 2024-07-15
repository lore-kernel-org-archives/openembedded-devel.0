Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FF8BC41513
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 09:03:05 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.33835.1721034183324665813
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Jul 2024 02:03:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kqjoBmsp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1721034183; x=1752570183;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ZShuc5maE5XMfj/LAraNfJ9KSG3PM3Ktd3AZoH4lfjY=;
  b=kqjoBmspLnyhyr6BvZVa1/EXURbnsryrEPZH3xicFOOqyQTvFiqf3Hgu
   00UHhIf65/Qj7MyJmHjh2V7G+A288C2g0NZBhen6mkrh/dnbFzT2a84hw
   RU2reJNH8BbVpJ9PfeH7xXBSm70M6oxfVSxLvcxv5aq4+nRW6OvfHo88n
   XeE4bmw/yp7UUzMTxBqPNQ0GvheySW3iy6jweScD3mJQe0zyVVMlMvY6w
   hbBCCndw6WINZL8kn65lU65ioIiFAqGfWZ/AWrBs3gFoZEPHlkqmeSgtj
   5M4R2vVbgtnY2LHEpHr+0KH6AYdTO09bM4aJc0Gvfv22rNbf578N9W+/D
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="145800158"
X-IronPort-AV: E=Sophos;i="6.09,209,1716217200"; 
   d="scan'208";a="145800158"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2024 18:03:00 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id AA991D6192
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:58 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id EC671D3F02
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7977F20071A31
	for <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 18:02:57 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2A03E1A000A;
	Mon, 15 Jul 2024 17:02:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/38] python3-py7zr: upgrade 0.21.0 -> 0.21.1
Date: Mon, 15 Jul 2024 17:02:19 +0800
Message-Id: <1721034151-540-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
References: <1721034151-540-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28530.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28530.006
X-TMASE-Result: 10--3.753700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrBGvINcfHqhdvdamP01JcrHMI
	apaDo9OKmC+wH+KoDcrn6OxAOOQ89liS8MnhiXFpKsurITpSv+MMDKjaL38DqJTx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q3cgUVP3Cp+vZiQDIJsDspXmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1bSi/tybVVl450YjhLPCjqO7UnZig9rZ08R1mU0Ude0tptDcBySfwaYZcN
	ojw+ullt4XRivrSuSdZ2xYpXWMdMKKcDQ4rxsOzBDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Jul 2024 09:03:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111352

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Treat zero byte stream as a file.
- feat: check targets argument type for read and extract method
- feat: Add recursive sudirectories and files extraction.
- feat: ensure unpack_7zarchive closes the archive
- docs: Use same format for unpack_archive example as for make_archive
- fix bug in function is_64bit()
- feat: make unpack_7zarchive raise ReadError for invalid files

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-py7zr_0.21.0.bb => python3-py7zr_0.21.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_0.21.0.bb => python3-py7zr_0.21.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb b/meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb
index cb405a535..0dec16151 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_0.21.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_0.21.1.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "213a9cc46940fb8f63b4163643a8f5b36bbc798134746c3992d3bc6b14edab87"
+SRC_URI[sha256sum] = "dede8ed8b7b32b3586ac476da3a482b69dd433229420bf0f62c495404b72c799"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


