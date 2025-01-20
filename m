Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 979D5C0218F
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.32644.1737360863030440152
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=RZV3RCq9;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=i5VauNjFG7r5xQBeM0Kbm7Y9iCSofWGJR45txKxdlEs=;
  b=RZV3RCq9wJTV5OW4zy5IhTFL7Y1lPyTaTQd77q+JlXNZ/eTFf7ytWZTm
   +ZlA+jP/lZD81FMX/p+nmmD9EJAVWm7F5zvja6X2xbvMomRSl/3y0nVgJ
   XWeFnL9/0ydY0CQn4p2rI7om54BjAwX/M5OHpjWfxKdNgdV53OB1AIYd+
   L0xyvukjIIe8n6g+yoet1UE5Cbpg/3u/+e1vkbSPYonRZX8rhNCzqZ+Fp
   bm0rCC6XE2Mk5EbOBAdmSPaSL0vdVdl/t4Ll47Y5nwyyOX86H4g89IH5w
   0eyGhvEh2y1lwLciyP15qH2ePzF6/XS24nTVIFVLJ6YkeBgdI+N16VShi
   A==;
X-CSE-ConnectionGUID: hZcPUs4tQ3CzVnsTj8TxJA==
X-CSE-MsgGUID: pOFBoxqtSfyphuPAy2gTXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="186303497"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="186303497"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B658FE428E
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DFBDD504A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 276EC2007473B
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E73D11A0074;
	Mon, 20 Jan 2025 16:14:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/32] python3-psycopg: upgrade 3.2.3 -> 3.2.4
Date: Mon, 20 Jan 2025 16:13:57 +0800
Message-Id: <1737360846-4824-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10--2.268800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mr2aGwk4OLNSztzqju8pic7Crh
	bel/P/Wq5xfUagMOILB/ffz83O4sA1OyTDZe2oepN2BkxNbZkKNUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRMLky
	6aORxHNY6HM5rqDwqtMsQs4EzGTO4jF7CUsv4GftVEQLv9xyfErJZyCg2viKUokawZnHGqJxkZf
	lOH3dw9/e8tFbhKWOxSEkhpJ3BbYHJ4EUg1gW7hHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114987

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Don't lose notifies received whilst the notifies() iterator is not running
- Make sure that the notifies callback is called during the use of the notifies() generator
- Raise the correct error returned by the database (such as AdminShutdown or
  IdleInTransactionSessionTimeout) instead of a generic OperationalError when
  a server error causes a client disconnection
- Build macOS dependencies from sources instead using the Homebrew versions in
  order to avoid problems with MACOSX_DEPLOYMENT_TARGET
- Bump libpq to 17.2 in Linux and macOS binary packages.
- Bump libpq to 16.4 in Windows binary packages, using the vcpkg library

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-psycopg_3.2.3.bb => python3-psycopg_3.2.4.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/python/{python3-psycopg_3.2.3.bb => python3-psycopg_3.2.4.bb} (85%)

diff --git a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb
similarity index 85%
rename from meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb
rename to meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb
index 8c79958ac4..1c01092691 100644
--- a/meta-oe/recipes-devtools/python/python3-psycopg_3.2.3.bb
+++ b/meta-oe/recipes-devtools/python/python3-psycopg_3.2.4.bb
@@ -7,7 +7,7 @@ features offered by PostgreSQL."
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3000208d539ec061b899bce1d9ce9404"
 
-SRC_URI[sha256sum] = "a5764f67c27bec8bfac85764d23c534af2c27b893550377e37ce59c12aac47a2"
+SRC_URI[sha256sum] = "f26f1346d6bf1ef5f5ef1714dd405c67fb365cfd1c6cea07de1792747b167b92"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


