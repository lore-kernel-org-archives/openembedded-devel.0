Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60038C54748
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.8725.1724833549838242274
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HPGeeQ59;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833550; x=1756369550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Cln1jOVzPSB8ZtYqoC4fRrSj6jiU4QS8YLVR70JMa4g=;
  b=HPGeeQ59T38SQ3zY6BH33wlt48q8R4ILI1pU7zMtMLt/ZVtUyaeItEsN
   /aaashyigkpKFoTjKuqFBAqqrqP2uE8niDhI7I4zgIk6hxhacIbtWZDk7
   axFcVTW7cd4wfR3ur2wh1U3SzPa2CfKylGTBYG4dEFbbDJ/cCCqMk1zjL
   i+nWzN0JDpYpiCN70HP+Fdpp/P99XASKlkdaYh2xejhjJOgFdwsgr7vDN
   Wi60Mp9lU8vLRtpYUc0X3+VEyv8w4pzNfWbiSlkVwB7HM9zbsCNUj8+yp
   AgO0rw8hPIS9JMGp4JUs2Vb9umRgduNPqgGCmz6xtlefaJOb3u6H0+W4c
   Q==;
X-CSE-ConnectionGUID: UbuUN6PdQnSlfx+6GojPFg==
X-CSE-MsgGUID: qoK9oXb0QmaJv7A8hwX8Tw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="159288804"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="159288804"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:47 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3AF99C68E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 89D63D50E9
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:44 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 235816BD4A
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C55E81A0002;
	Wed, 28 Aug 2024 16:25:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/46] python3-eth-utils: upgrade 4.1.1 -> 5.0.0
Date: Wed, 28 Aug 2024 16:25:01 +0800
Message-Id: <1724833525-2162-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--7.044200-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yRMxKDqgAFSzyiKgKtIyB4pqTj+cW75OIIVD
	0TJVgsKEegz5rXV3e7SNDkA/QkkTIZT6aKfZ6tn9A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYg5iBOE74OZf3PhwfmFb3pg7Cl8sx4HBG30tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqt7lTGje1p50Uqco1Cr06+Yu1B9iWW6Yto1CMuzO5/aMARBsgBFa/PYA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112000

From: Wang Mingyu <wangmy@fujitsu.com>

Chaneglog:
============
- Run mypy locally via pre-commit hook, bump to mypy==1.10.0
- Updates to the latest eth-typing to use new ABI types for improved type
  checking in existing ABI utility functions.
- Contract Application Binary Interface (ABI) utilities to obtain type and
  value information for functions and events.
- Merge template to use bump-my-version and update release Make commands.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_4.1.1.bb => python3-eth-utils_5.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_4.1.1.bb => python3-eth-utils_5.0.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
index 54bd9a67c..f0a5e2441 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_5.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "71c8d10dec7494aeed20fa7a4d52ec2ce4a2e52fdce80aab4f5c3c19f3648b25"
+SRC_URI[sha256sum] = "a5eb9555f43f4579eb83cb84f9dda9f3d6663bbd4a5a6b693f8d35045f305a1f"
 
 PYPI_PACKAGE = "eth_utils"
 
-- 
2.34.1


