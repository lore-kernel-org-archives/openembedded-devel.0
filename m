Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354CCC3DA6E
	for <webhook@archiver.kernel.org>; Mon,  8 Jan 2024 13:45:15 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6783.1704721507210041156
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Jan 2024 05:45:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="147085872"
X-IronPort-AV: E=Sophos;i="6.04,341,1695654000"; 
   d="scan'208";a="147085872"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2024 22:45:04 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B978D66C3
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:45:00 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 96031F470
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:44:59 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C2D46BC71
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Jan 2024 22:44:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D8A311A0072;
	Mon,  8 Jan 2024 21:44:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.9.1 -> 2.9.2
Date: Mon,  8 Jan 2024 21:44:33 +0800
Message-Id: <1704721473-30653-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28106.007
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28106.007
X-TMASE-Result: 10-1.043700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mre9J6VkwneFaU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNnVTWWiNp+v8Jlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzs6F1HODejOQAXY
	vBzPVtqFkHhCi1m2CsVVSYpL5W0DTm/7FtMrpZqc6S6IavWrTYeHFXIAo+WZUSlgtdy4fNQECKN
	54Ep1HWiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Jan 2024 13:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108153

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 * optimize initialization from strings by not constantly resizing buffer
 * optimize 'util.hex2ba()' and 'util.base2ba()' by avoiding unnecessary
   copies
 * optimize 'util.base2ba()' and 'util.ba2base()' for 'n=16' (hexadecimal)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.9.1.bb => python3-bitarray_2.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.9.1.bb => python3-bitarray_2.9.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb
index 0d7107a0f..7d7be0b1a 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.9.2.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "912efbeed6d8b155c8e8c37464f79d75b1de58936c0f29ffb599ce95af5563f2"
+SRC_URI[sha256sum] = "a8f286a51a32323715d77755ed959f94bef13972e9a2fe71b609e40e6d27957e"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


