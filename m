Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693E6C7EE39
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:57:47 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.6205.1684997863768376244
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:57:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117964406"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117964406"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:57:42 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 862CBD29E6
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:39 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B40D7D88DC
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:57:38 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id E20DE2FC91FB;
	Thu, 25 May 2023 15:57:37 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-can: upgrade 4.2.0 -> 4.2.1
Date: Thu, 25 May 2023 14:57:23 +0800
Message-Id: <1684997851-2098-6-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
References: <1684997851-2098-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27648.005
X-TMASE-Result: 10-0.308800-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/ySrLqyE6Ur/jjCNKvDZ6b86U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFPWQakv5hyf6RrW54/gEi1ah3x
	fdk3W2WhwJeKZLn+isENEQy6YK9COcmHTS+T6yZwR/D47U53ezonRF40tYJ0Jj20GNgF7UI+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:57:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102820

From: Wang Mingyu <wangmy@fujitsu.com>

Bugfixes:
===========
 The ASCWriter now logs the correct channel for error frames (#1578, #1583).
 Fix PCAN library detection (#1579, #1580).
 On Windows, the first two periodic frames were sent without delay (#1590).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-can_4.2.0.bb => python3-can_4.2.1.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.2.0.bb => python3-can_4.2.1.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.0.bb b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-can_4.2.0.bb
rename to meta-python/recipes-devtools/python/python3-can_4.2.1.bb
index 7562b977b..d7b2a9573 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "0fbda7217523b802f36a8d5a3cd26a35baad2795965f7f09bfa3dd1dfb6fbaf0"
+SRC_URI[sha256sum] = "f1ace82545cb4c7edf92a5aa6024bbb8ad23331ee5b0a1f441e782bf680a67ac"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.34.1


