Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5386CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:35:19 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.116332.1698050113130129449
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:35:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="137215046"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="137215046"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:35:12 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF89DD618E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:35:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A0D5CFB67
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:35:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 65FAD2005932A;
	Mon, 23 Oct 2023 17:35:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 3.2.0 -> 3.3.0
Date: Mon, 23 Oct 2023 16:32:25 +0800
Message-Id: <1698049945-25129-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-1.118900-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrXs5nqGvDCfOQYkZDE2p7wG8q
	nFk+BWUXc0RMgOcSS306YypHELKPRW8E6Haz3ZNIfOaYwP8dcX6s4IQYg+G3CJgM1EFdeSLaQo6
	O4KTi9/XWOIwXTRQ3JQ3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3vnAw
	8yp081LIGQRIwjTl3iKI5/U0OcIj6tYv/FAmebjp4CIKY/Hg3AaZGo0EeYG97fwtq4jZ/G3iq2r
	l3dzGQ10lpfjRiih6SUCwUOBwAfKor+gFN5S+ArGJIyevY13Hvr/LfyyPhMH3F0bpNP25neUwB+
	IWip+0L1brskVfvNjQbu0vLXVWsRBDlYzH+FaIxTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:35:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105654

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
Added
---------
-Allow to execute the CLI (e.g. normalizer) through python -m
 charset_normalizer.cli or python -m charset_normalizer
-Support for 9 forgotten encoding that are supported by Python but unlisted
 in encoding.aliases as they have no alias (#323)

Removed
---------
-Redundant utils.is_ascii function and unused function is_private_use_only
-charset_normalizer.assets is moved inside charset_normalizer.constant

Changed
----------
-Unicode code blocks in constants are updated using the latest v15.0.0
 definition to improve detection
-Optional mypyc compilation upgraded to version 1.5.1 for Python >= 3.8

Fixed
--------
Unable to properly sort CharsetMatch when both chaos/noise and coherence were close due to an unreachable condition in __lt__ (#350)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.2.0.bb => python3-charset-normalizer_3.3.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.2.0.bb => python3-charset-normalizer_3.3.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb
index 0c2810c62a..8502be7b4e 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace"
+SRC_URI[sha256sum] = "63563193aec44bce707e0c5ca64ff69fa72ed7cf34ce6e11d5127555756fd2f6"
 
 inherit pypi setuptools3
 
-- 
2.34.1


