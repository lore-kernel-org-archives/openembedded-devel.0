Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B09C7EE31
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 06:56:37 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6061.1684997788859697057
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 May 2023 23:56:33 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="117405093"
X-IronPort-AV: E=Sophos;i="6.00,190,1681138800"; 
   d="scan'208";a="117405093"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2023 15:56:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 34992DDC64
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:25 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B632D63A4
	for <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 15:56:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E952C2007CA80;
	Thu, 25 May 2023 15:56:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] double-conversion: upgrade 3.2.1 -> 3.3.0
Date: Thu, 25 May 2023 14:56:08 +0800
Message-Id: <1684997777-2061-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
References: <1684997777-2061-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27648.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27648.005
X-TMASE-Result: 10--3.177000-10.000000
X-TMASE-MatchedRID: eeAH3N1ZYkgFWIzFaWZsv31zro62qhdCpxAd6mi1Ga14YeSlHZYFotSH
	nJDq2yhMjnkaZ2PKfBzFJ2ubYcrNGBxWWTdljgMel1VzLtWj2rwnhzAhgvoq55Tx+2LIqNmt0yO
	PBv1B9XYILxoCYZ47qVXTT7CHDFVDL/tBTZzO5Q0hXJsS++injoLsLasl5ROhW1EpqtJXzRujxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcsA2PUQ+tRwqx5cd3dAsBdoyChw/hhm3O44OR
	maMYW9LaG3wokXTdr5LGzqk/smfeTIFh/RIg1qvaLhB2pfk0CcW5p5MOWOFAP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 25 May 2023 06:56:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102812

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Fix some compile warnings in Visual Studio
Set permissions for github workflows
Add flags to control trailing decimal and zero in exponent form when input has one significant digit

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{double-conversion_3.2.1.bb => double-conversion_3.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/dc/{double-conversion_3.2.1.bb => double-conversion_3.3.0.bb} (96%)

diff --git a/meta-oe/recipes-support/dc/double-conversion_3.2.1.bb b/meta-oe/recipes-support/dc/double-conversion_3.3.0.bb
similarity index 96%
rename from meta-oe/recipes-support/dc/double-conversion_3.2.1.bb
rename to meta-oe/recipes-support/dc/double-conversion_3.3.0.bb
index 92466f67a..a8fd88a9a 100644
--- a/meta-oe/recipes-support/dc/double-conversion_3.2.1.bb
+++ b/meta-oe/recipes-support/dc/double-conversion_3.3.0.bb
@@ -12,7 +12,7 @@ SRC_URI = " \
         git://github.com/google/double-conversion.git;protocol=https;branch=master \
         file://run-ptest \
 "
-SRCREV = "af09fd65fcf24eee95dc62813ba9123414635428"
+SRCREV = "4f7a25d8ced8c7cf6eee6fd09d6788eaa23c9afe"
 
 inherit cmake ptest
 
-- 
2.34.1


