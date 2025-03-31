Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D6EC3601C
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.47782.1743412322116653525
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ToEiu6+X;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=6LscT5PnZmmrGQqQcbe6LVv7Vn/H6A/OICk0qj+IQeI=;
  b=ToEiu6+XGf20swMsqGk0sj4ER8v3yL4Cyq8OXJPicscNrpSpNucZHOcz
   RzcQM2ztuW9N2csAw2GRVbvvJwYPeHqKVFACIHrxAy1NlZjWcsIE6bavS
   MAZ5IEAAAdPj4lp7gpedoiajE/djVmkCMsXENwxhf/eprmddZ1hCW1S6K
   bAmlyY02B+uqL7mbKMuhcL/GXaEkEQ8CwDmZPrFGu2PLIEOJA/DGhn9Px
   KKwNADu8NxvNsPLnMDdU0Jbe+tgGdJr9n9N1bYCrRBNpftlm7gT2sdlb5
   lNbVAosndIowxocZnJXSo5KRE/J8AmN4ETqluUvCzhxauDYjs2UPfdMfd
   w==;
X-CSE-ConnectionGUID: QXMvePR7S9ukBKVB75ujhg==
X-CSE-MsgGUID: VGaN87rNQFOOQji3i5itKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="173852152"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="173852152"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DA21D5011
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E07FD5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D0FE31A009A;
	Mon, 31 Mar 2025 17:11:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/26] python3-icu: upgrade 2.14 -> 2.15
Date: Mon, 31 Mar 2025 17:11:34 +0800
Message-Id: <1743412308-21887-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116412

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-icu_2.14.bb => python3-icu_2.15.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-icu_2.14.bb => python3-icu_2.15.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-icu_2.14.bb b/meta-python/recipes-devtools/python/python3-icu_2.15.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-icu_2.14.bb
rename to meta-python/recipes-devtools/python/python3-icu_2.15.bb
index 25d5925538..f404538537 100644
--- a/meta-python/recipes-devtools/python/python3-icu_2.14.bb
+++ b/meta-python/recipes-devtools/python/python3-icu_2.15.bb
@@ -10,7 +10,7 @@ DEPENDS += "icu"
 PYPI_PACKAGE = "PyICU"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "acc7eb92bd5c554ed577249c6978450a4feda0aa6f01470152b3a7b382a02132"
+SRC_URI[sha256sum] = "241bf4e73851524af67fea5d94ff60bac83dd98ce3ef6fd6f2c00e07e8476c87"
 
 SRC_URI += "file://0001-Fix-host-contamination-of-include-files.patch"
 
-- 
2.43.0


