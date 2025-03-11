Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5419FC2BA1B
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.4162.1741683327332887572
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X170zrXO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683338; x=1773219338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=ajtsmnV5vR/s7SqS32dJ+FIrOqgoMprWE8a5LXoJEXQ=;
  b=X170zrXOnBdzYE2p4IhyrSnM4ghX2Kd8ueFG2v1pDFM9bKaLwv75pNMm
   cn7/GqDYEpssdiz9XUteQ9/ayjNV0RuuFx7qeY9d+IhBu5ibkTUqnXDHU
   5/iJ5VbdGyuxNwsH1tm1LIiZza4KD5P+KiM8ueHsufcKISdFMibidE8p5
   CMtYDxdXX96NFKB4m5nsd6fSVg7GPpdI6NI7reOhMOO7WYI6ZeX2V/YLo
   ZjCt2Kc9eYuy76dlO5nPENZ2JspBp7EX8TI/79a+rUYecE1vNMMdXuQ0n
   dysQoHOAUdtCFZHnIvSNbd3oyE8Ch9zCh5kVvgVgynb/+wHOjwabnOpFH
   A==;
X-CSE-ConnectionGUID: 8oJWaEPiQImd3ylM+181GQ==
X-CSE-MsgGUID: tz7Y/U4aRVOZYzo/SJ7DyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="192660324"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="192660324"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:36 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E5C8CD4809
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id ABC7CD8B31
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:33 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4B8821A00A0;
	Tue, 11 Mar 2025 16:55:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/36] python3-virtualenv: upgrade 20.29.2 -> 20.29.3
Date: Tue, 11 Mar 2025 16:55:07 +0800
Message-Id: <1741683310-8681-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115882

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove duplicate bug report template
- Fix debug logging interpolation
- Ignore directories in PATH that can't be opened

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-virtualenv_20.29.2.bb => python3-virtualenv_20.29.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-virtualenv_20.29.2.bb => python3-virtualenv_20.29.3.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb
rename to meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb
index c9f20d44e3..f60c0ba8f6 100644
--- a/meta-python/recipes-devtools/python/python3-virtualenv_20.29.2.bb
+++ b/meta-python/recipes-devtools/python/python3-virtualenv_20.29.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://github.com/pypa/virtualenv"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0ce089158cf60a8ab6abb452b6405538"
 
-SRC_URI[sha256sum] = "fdaabebf6d03b5ba83ae0a02cfe96f48a716f4fae556461d180825866f75b728"
+SRC_URI[sha256sum] = "95e39403fcf3940ac45bc717597dba16110b74506131845d9b687d5e73d947ac"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


