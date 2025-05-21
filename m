Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC00C5AD49
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6738.1747817995896623808
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V+6O+tLJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818002; x=1779354002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=OedNZudPN9cozXCDq1/AGYq1B3MAd0f8oOo7LqUP5mw=;
  b=V+6O+tLJhQ04Ou16bCPWDslfBOJk4R5P3JQKQxP0UVqJ0Kaeh5ngSPhW
   LJ5nFp3tStfkwD+Qp8AB/dXY+ijE6D2BOpdJapaVFEoX31ZzB9kqgI/O1
   xEIOECqw5zQ1/5nDqUx+8oE7//puSpEJy8mM0G6yqtUgnbuFSnu1KkFQj
   DsEelT9nRT6XUi32aOcHd8a2MPrgARUf5TxamBhIcYxwSHa8JEfWmP7Cv
   bRHrgfX4m+328JJhT0EDqXfbfXwY5SKIcoVXCmqaaRrvsC+xEbC0bIroP
   1NS+R3fJ4UijVGQVdf7gTUzcjxcKDcjYd6i5avQMiflHP17Rmk+e4J5mW
   w==;
X-CSE-ConnectionGUID: b+vxNPg/SLaHTlq8slg67g==
X-CSE-MsgGUID: Ya6DrylLRBSUdwDUJMCq7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="200152536"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="200152536"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:00 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8EA2BC68A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4EF6BD50B4
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D51621A009A;
	Wed, 21 May 2025 16:59:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 28/43] python3-pyppmd: upgrade 1.1.1 -> 1.2.0
Date: Wed, 21 May 2025 16:59:17 +0800
Message-Id: <1747817972-28874-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117552

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyppmd_1.1.1.bb => python3-pyppmd_1.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyppmd_1.1.1.bb => python3-pyppmd_1.2.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb b/meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb
rename to meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb
index 753ca4be40..046dca271b 100644
--- a/meta-python/recipes-devtools/python/python3-pyppmd_1.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyppmd_1.2.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
 inherit pypi python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "f1a812f1e7628f4c26d05de340b91b72165d7b62778c27d322b82ce2e8ff00cb"
+SRC_URI[sha256sum] = "cc04af92f1d26831ec96963439dfb27c96467b5452b94436a6af696649a121fd"
 
 DEPENDS += " \
     python3-setuptools-scm-native \
-- 
2.43.0


