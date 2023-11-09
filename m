Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E29AAC4332F
	for <webhook@archiver.kernel.org>; Thu,  9 Nov 2023 05:39:02 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.115444.1699508338351017247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Nov 2023 21:38:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="127393218"
X-IronPort-AV: E=Sophos;i="6.03,288,1694703600"; 
   d="scan'208";a="127393218"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 14:38:55 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A8BCCF1CC
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:38:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 96967D5469
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Nov 2023 14:38:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C93742005019F;
	Thu,  9 Nov 2023 14:38:51 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-python-vlc: upgrade 3.0.18122 -> 3.0.20123
Date: Thu,  9 Nov 2023 13:37:57 +0800
Message-Id: <1699508277-17064-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27986.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27986.002
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Zb056mCmF00ZV4BnlVId1nZsoi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62Scct6tOewLZ94uU6cHsQVPBwsq7OQ73Wc4e9DPKtDGscmXH
	CMFpFSz8QZbc9nLjDAzcnazpaJV33QSXwPBfYE/Py6PhKbJ4VAS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Nov 2023 05:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106506

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-python-vlc_3.0.18122.bb => python3-python-vlc_3.0.20123.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-python-vlc_3.0.18122.bb => python3-python-vlc_3.0.20123.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
rename to meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb
index e67e792f7..960da1437 100644
--- a/meta-python/recipes-devtools/python/python3-python-vlc_3.0.18122.bb
+++ b/meta-python/recipes-devtools/python/python3-python-vlc_3.0.20123.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "wiki.videolan.org/PythonBinding"
 LICENSE = "LGPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "1039bde287853b4b7b61ba22d83761832434f78506da762dfb060291bf32897d"
+SRC_URI[sha256sum] = "244fbb9e392a0326841fca926d6d12a2a36c546982191f493f148fa19e66b1d4"
 
 inherit pypi setuptools3
 
-- 
2.34.1


