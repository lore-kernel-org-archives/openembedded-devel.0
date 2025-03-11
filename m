Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A6AC35FF1
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.4208.1741683336008692770
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tcy+VtMU;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683336; x=1773219336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UGnjbKpySAE//ImDJlAoca0Bj+5972O68PAw0MiI7W8=;
  b=tcy+VtMUK7DAvb10EqTVQiCBEGwXvBIYvkyi2U/7MeEHICGpT3l/5S/p
   UOgxoqw1/QASdgUfsKwDU49jxcK8+hmdCkgBVjmWiWMM06Js4RYwvSZaY
   zig8tFbFkb5qn+nsrRy8z7w0rv5UTgCqDrNl9t7Ehxawd6zeaX85fB/7u
   iwDR9SOKfqL0GBpK9SNPiAP91sMJGN2kUwPoqDxfW7wtDqEcvCfR3ygTX
   jweqptfLTl98GhaPDoeDQ+g44ZoDdrscafngMO6e1VaGyQ5NEQHAG24Ph
   yud2g0r8v4hVwy3LLC6ck3YSKSqR1IdjLYWriwUoemw0jc2eNjm0O0LIi
   g==;
X-CSE-ConnectionGUID: daBnVD3lT2qqDcEMQCl+aw==
X-CSE-MsgGUID: 7dRhUzysRP+wBnEttd/1MQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="171602374"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="171602374"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F034FDC720
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AED60BDC81
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:31 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4E5FE1A009B;
	Tue, 11 Mar 2025 16:55:31 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 27/36] python3-pymongo: upgrade 4.11.1 -> 4.11.2
Date: Tue, 11 Mar 2025 16:55:01 +0800
Message-Id: <1741683310-8681-27-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115880

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Allow Database.command to run bulkWrite commands
- Use dochub link for fork warning

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.11.1.bb => python3-pymongo_4.11.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.11.1.bb => python3-pymongo_4.11.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb
index df7f2b0f11..a31deba759 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.11.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.11.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "3757ce9257c3486eead45680a8895a0ed9ba27efaf1791fc0cf854367c21c638"
+SRC_URI[sha256sum] = "d0ee3e0275f67bddcd83b2263818b7c4ae7af1ecafebe7eb7fd16389457ec210"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


