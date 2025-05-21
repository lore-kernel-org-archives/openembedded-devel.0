Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C0B5C5B552
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.6740.1747817996379290218
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 01:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y84jk6K2;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747817999; x=1779353999;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2E5tYy+C7SGBNPiXj4CMau0EkEAQcXgF7su1ib13nWU=;
  b=Y84jk6K24CdTtMxWCFWA6QdNeej5k4Y7k9fWty6JH60hvSiklrNz7wXN
   nWBogrN6s1O6HH7SdY0q6pa1JLsVdDFYaZI5d10YT1tvHeNSlPMK6DYxN
   rpoui8u5aOV2q0pHPH0/vz1Ukaq/JKxLc4b6ndYeaH9GbfQ5vrFd88BXW
   Qr6pGSOZ9cqbzF8nB8/uSddM2v5xpmi91/rm7AUnfbsN5bSGL58GFnUT/
   q9tKndrPf8mDVWArJX5rbv1tKY3TJdV5F+sjqzxv/9fu/tZwP7EnXpndk
   ZCvC/uELYfKQZT8ye2hWCX/x5DcXzPAg3+wHJY1jk++9YmTDvxxKfKOrf
   A==;
X-CSE-ConnectionGUID: U9QjJnIDQ4uC3N+gnDkE7A==
X-CSE-MsgGUID: ATHUD1mER4GqPABHlOIslg==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200161115"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200161115"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 17:59:58 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A0C88E9EA1
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 613E3D8BCC
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:55 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1E81D1A009A;
	Wed, 21 May 2025 16:59:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/43] python3-joblib: upgrade 1.4.2 -> 1.5.0
Date: Wed, 21 May 2025 16:59:07 +0800
Message-Id: <1747817972-28874-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117541

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.4.2.bb => python3-joblib_1.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.4.2.bb => python3-joblib_1.5.0.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb b/meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb
index 399ccd22e9..5dc5d02f3f 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.4.2.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.5.0.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit python_setuptools_build_meta pypi
 
-SRC_URI[sha256sum] = "2382c5816b2636fbd20a09e0f4e9dad4736765fdfb7dca582943b9c1366b3f0e"
+SRC_URI[sha256sum] = "d8757f955389a3dd7a23152e43bc297c2e0c2d3060056dad0feefc88a06939b5"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.43.0


