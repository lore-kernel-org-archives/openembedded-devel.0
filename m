Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47D81C7EE2C
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6078.1684997864245712497
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117900025"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117900025"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FC0FDDC60
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:43 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 737D7D63B6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9E2972FC91FB;
	Thu, 25 May 2023 15:57:41 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.28.1 -> 2.29.0
Date: Thu, 25 May 2023 14:57:29 +0800
Message-Id: <1684997851-2098-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-0.696800-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yb/HywF9D+dARealVAhocE+U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzPPK95fu+7EVTjH
	GZfwyQXKxeCORtXYYPtuf7Zrh3HDsS8nTKUAHLXWOIJmJIRmxgmmAUurR8urrKfjqB3wERqnDxN
	zZjow3diB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102827

From: Wang Mingyu <wangmy@fujitsu.com>

Feature:
 New SPE v3 plugin

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.28.1.bb => python3-imageio_2.29.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.28.1.bb => python3-imageio_2.29.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb b/meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb
index a747609d7..3ca9e3c1e 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.28.1.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5db5087be5c814ecf7e2c7d30a1a15c97eca97d8c26f31ddc54d767d4a43bce8"
+SRC_URI[sha256sum] = "5aa207ab61aca233a7a312951ac603d618b78418eac749e3dc5035010531e25b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


