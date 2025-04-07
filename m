Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC48C369AF
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.42481.1744017450044790475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VnYOCoOM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017451; x=1775553451;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=wQzEstMyXFghEY5keCVH3g5q8/6EURVnChd3JA8f4VU=;
  b=VnYOCoOMV13Ef9VgMfjscZPXBLbICPimaZ4VCe3/WXljvnYwLXiNvIeP
   qzd7wzcCr/6fjhncZ0ffd33NDVgHbHNySU6TABgMfgcBPxgYGy8FnTLvk
   u2dGXz0EVnQk18wrOknrZauCkkKxmHjp4dzR3xKv+bXaN1Blj0D7cbOAE
   kbm4LBKbTSeBWsbAWdKHmykyLOt4GdlHShNLv762D6vauD8Gq0Ga568B2
   DYCjOTkbLl4CJnsmpFNp6Ea4os3wdeZ8uSnIR/D6LUWEPg2wm5d+drWcx
   Q2pRpRpEZcFgYZLu4YcYiEctCLZKe68Soj8uYnfyh6fgmCJ6qFgg3BoXs
   A==;
X-CSE-ConnectionGUID: 1O4aIeUsQa6LEgq1JWeoPQ==
X-CSE-MsgGUID: W/bedKKoRniMoOqGxOOMxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195668928"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195668928"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 01774D480A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id B6E37D4C36
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 741A91A0071;
	Mon,  7 Apr 2025 17:17:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/30] python3-lz4: upgrade 4.4.3 -> 4.4.4
Date: Mon,  7 Apr 2025 17:16:56 +0800
Message-Id: <1744017431-22217-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116640

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-lz4_4.4.3.bb => python3-lz4_4.4.4.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-lz4_4.4.3.bb => python3-lz4_4.4.4.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb b/meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb
rename to meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb
index d29166079b..8d336df4a9 100644
--- a/meta-python/recipes-devtools/python/python3-lz4_4.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-lz4_4.4.4.bb
@@ -9,7 +9,7 @@ DEPENDS += " \
     python3-pkgconfig-native \
 "
 
-SRC_URI[sha256sum] = "91ed5b71f9179bf3dbfe85d92b52d4b53de2e559aa4daa3b7de18e0dd24ad77d"
+SRC_URI[sha256sum] = "070fd0627ec4393011251a094e08ed9fdcc78cb4e7ab28f507638eee4e39abda"
 
 inherit pkgconfig pypi python_setuptools_build_meta ptest-python-pytest
 
-- 
2.43.0


