Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF9DEC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:57:16 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.17833.1702544235726252495
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:57:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="122738769"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="122738769"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:57:13 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 27415D9DA9
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:57:11 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56E25C4A00
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:57:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8DB4E36F447;
	Thu, 14 Dec 2023 17:57:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.33.0 -> 2.33.1
Date: Thu, 14 Dec 2023 16:56:33 +0800
Message-Id: <1702544193-28046-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28056.006
X-TMASE-Result: 10-0.982400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr2FA7wK9mP9ceZzJlaRLGxb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4QzM
	+79j/R530/fx8ApGLvg7zOUIxULYx550PCHeGbZVbLz7rFkp6CyT18DzkH5p17/VtI0ZNxPheG5
	GTEtBfl6XpDhga0+kOCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:57:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107438

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Replace mktemp with mkstemp when caching to disk for legacy plugins
-Fix grammar in ImportError

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.33.0.bb => python3-imageio_2.33.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.33.0.bb => python3-imageio_2.33.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb
index f6275754b..32b4472c6 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.33.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.33.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "39999d05eb500089e60be467dd7d618f56e142229b44c3961c2b420eeb538d7e"
+SRC_URI[sha256sum] = "78722d40b137bd98f5ec7312119f8aea9ad2049f76f434748eb306b6937cc1ce"
 
 inherit pypi setuptools3
 
-- 
2.34.1


