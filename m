Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46117C3DA4A
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.4211.1741683336989887785
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Y7Nhk9oI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683337; x=1773219337;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Dgo9QDWIQEPiGAVXwGA9TRpKeJ0mTIAB4xAwI0g6RB4=;
  b=Y7Nhk9oI5jF7doJhqzggwo0lge50vJiZbmXY1Vc8HUttkgc32VmKoLGj
   JpogYIwx/4YPLmVJSZ9Dd+sdKLnI4VE4oCf+Qi5hvobSFyaVfEBA3I0CY
   tdosvrsnSskWlFoO2rGUJjjQM/OMTUH7jsNT5TCnnTMrCkloCUAkbYceS
   v7Wxc7yXLJubXwdBotWGropBlAYi/YDncfivzgHielBgr/XwN5ROvcBfm
   Nti7XwplBDZGR6xY/rCyPrvqzuRDTy+8TVgoNSGZ4bTr26rOW6nQxLm0E
   ZU+VK4b5l/e+Ogw9S20eeeAcBjiq0gblEoQdCx58gyxsA+VxIgg5lVDIf
   Q==;
X-CSE-ConnectionGUID: rNAoKcRdQHG40YXFVMZwng==
X-CSE-MsgGUID: 76AIrmpgReW63Y3OkyUYIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="181074431"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="181074431"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:35 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CE5C4C2266
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95FCAD8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:32 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5CAF71A00A0;
	Tue, 11 Mar 2025 16:55:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 31/36] python3-tox: upgrade 4.24.1 -> 4.24.2
Date: Tue, 11 Mar 2025 16:55:05 +0800
Message-Id: <1741683310-8681-31-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115883

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- TOX-3117 bugfix -c pyproject with non legacy
- fix(docs): update expected code
- Add missing bracket in config example
- Gh issue 3456 update environment variable documentation
- fix: Respect --parallel N with --parallel-no-spinner
- TOML set_env file support

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.24.1.bb => python3-tox_4.24.2.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.24.1.bb => python3-tox_4.24.2.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.24.1.bb b/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.24.1.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
index 9532c6a094..5c3f2dcaa3 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.24.2.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "083a720adbc6166fff0b7d1df9d154f9d00bfccb9403b8abf6bc0ee435d6a62e"
+SRC_URI[sha256sum] = "d5948b350f76fae436d6545a5e87c2b676ab7a0d7d88c1308651245eadbe8aea"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


