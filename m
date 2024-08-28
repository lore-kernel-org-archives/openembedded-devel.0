Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06157C5474A
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:26:02 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8729.1724833560542971353
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C25t49Ma;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833562; x=1756369562;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=kdav+6PVYlwNlsNRNvPMHaqDUc++/8FvfqVAsn6ZTp0=;
  b=C25t49MahWM73y2D08sv7BW+9aKrciihlvU6hZW4XgHqs3eae5vfGTIr
   M1mPdfj8/2Qhd+Gn+DKXEQ+QpAYLlNU6UYKVeDfGBGJGEC7tJ8IPsNfkn
   4P0b4CHLJgExEh5D3c45ErEZCBSh0a1FlXDsTE7oOnlfwIyNH9YosHgGc
   BaEWn8IZt0q/uSNzw41plL+NmNRtRMCaTwIWQO68qqUdFDbxynu+oB1cI
   mdsKKSlQpVrVxBsfWu60UGMG9OWOqrzLJE6iiM/MCT/cHoIxS0kBcRwgx
   i5VehfA3nMpwBQ4x3DnLK7OQVANJE2zBDA78HbMfl5+bXGTw4wNVfKNpy
   w==;
X-CSE-ConnectionGUID: 6Dn1WPY1RGOYPfokrhtx3g==
X-CSE-MsgGUID: hM0fn/pcRx+lEyGtJutZHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171952053"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171952053"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:59 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 32331C68E4
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:56 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F440CFA5F
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14C766BCF0
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5F7B1A000C;
	Wed, 28 Aug 2024 16:25:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 42/46] python3-xxhash: upgrade 3.4.1 -> 3.5.0
Date: Wed, 28 Aug 2024 16:25:20 +0800
Message-Id: <1724833525-2162-41-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--0.050600-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yUIIxwDaU5mrVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJopGZilTi8ctSOwpfLMeBwRsZiTLIQu4YpJsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SBpiF+eVDw1WfsEOTuLleH4jiLKTj0lT5nEix7E+3YV/DmQ
	BMWA4zlva+Z2kfI6B7OXV/P+v7oJTO7ust3HsbTxnTUL3qlWWiS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:26:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112021

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Build wheels for Python 3.13

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-xxhash_3.4.1.bb => python3-xxhash_3.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xxhash_3.4.1.bb => python3-xxhash_3.5.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb b/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
rename to meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
index be9ce005e..bfa14012d 100644
--- a/meta-python/recipes-devtools/python/python3-xxhash_3.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xxhash_3.5.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3a9dab7f159514231249aa3e108ab26b"
 
 DEPENDS += "python3-setuptools-scm-native"
 
-SRC_URI[sha256sum] = "0379d6cf1ff987cd421609a264ce025e74f346e3e145dd106c0cc2e3ec3f99a9"
+SRC_URI[sha256sum] = "84f2caddf951c9cbf8dc2e22a89d4ccf5d86391ac6418fe81e3c67d0cf60b45f"
 
 SRC_URI += " \
     file://run-ptest \
-- 
2.34.1


