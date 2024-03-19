Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 726DCC54E71
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:26 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.8212.1710827179463273382
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nSS+6L2x;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827181; x=1742363181;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BD2lqbSM7nWQ2d2ajYPENXRHkwiK7kYqkPaO4kNI/uM=;
  b=nSS+6L2xsHdiTPh2yeprZ4zSrvY9LsV+xnh5R0YVTY3+qgUnYNcL6ihq
   8Fg6cvjkeD+5/MVYKR8AjE2EL+1lnt1q55pB+cDbJ5xOV6mCNq/0k/ytp
   EzmTwBLn64crtaz50ZlQbmymPFTe4oeXdTir7lre0LUqmT0oeNIlDCSYc
   7SXZw3R5PmqJjN2THsWJio1/oEn4IC5P0e8kVLg9dU9pFZ10OC6Q2695y
   MwBjzNRSeGgHTkAa5rqvr6e9AX5pDMteKNB/hoInEo1bDfS5rit/KQxrD
   IdgxyAdOrmTrwFsS0vBmZTYXVrKXgaYwp4/q6CofYbDdvovu9WXLHXuef
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152721849"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="152721849"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:20 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DFF6141218
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:18 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5088430D9D
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D83892235E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:11 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3DBFB1A006B;
	Tue, 19 Mar 2024 13:46:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/50] libxaw: upgrade 1.0.15 -> 1.0.16
Date: Tue, 19 Mar 2024 13:45:00 +0800
Message-Id: <1710827139-30056-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: V7gFd1X8+4Wjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmK2oB9n2uCv2uVHGbcDbAq6FEUknJ/kEl6YwzE9E8g5OfoLR4+zsDTtfUe
	ErNKFJieE5m6+W4GUtYO6dY33ePii4TgvzzN2F068jlsXtoxg/PmL5U1Y4sYvwHC/5K2FvmC7Rr
	/c94l9zMbrgiq5BST2boWbIt/he57yDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgAQ4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109430

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../xorg-lib/{libxaw_1.0.15.bb => libxaw_1.0.16.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-lib/{libxaw_1.0.15.bb => libxaw_1.0.16.bb} (88%)

diff --git a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.16.bb
similarity index 88%
rename from meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb
rename to meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.16.bb
index 253bb6ff0..ee14cf747 100644
--- a/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.15.bb
+++ b/meta-oe/recipes-graphics/xorg-lib/libxaw_1.0.16.bb
@@ -8,7 +8,7 @@ PE = "1"
 
 XORG_PN = "libXaw"
 
-SRC_URI[sha256sum] = "ab35f70fde9fb02cc71b342f654846a74328b74cb3a0703c02d20eddb212754a"
+SRC_URI[sha256sum] = "731d572b54c708f81e197a6afa8016918e2e06dfd3025e066ca642a5b8c39c8f"
 
 do_install:append () {
     ln -sf libXaw6.so.6 ${D}${libdir}/libXaw.so.6
-- 
2.34.1


