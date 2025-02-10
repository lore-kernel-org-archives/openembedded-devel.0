Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 263A6C021A4
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:18 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.46626.1739178120512085675
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SDm2Ldxp;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178129; x=1770714129;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=HvFwxaAUASpfO+bZbGSmzfME4SsIT3tvzqqVzvDcXLo=;
  b=SDm2LdxpFd0sGG/EdUo+SojL8lPbd+VNpnCHVBH+UeF3XBgk/aj+9ic5
   dAMFXgLxebygZpgk1LXqpnon1c7iK4nzYYCrW4HymW0xIPZf+c1uhEucN
   Kxry5LnujmKE8dMyidJsmekgPvMk7dSQyTDytTewaCbkJjFIxg2BSXM4r
   9CeJtP++ov9dK2foETR8RNCpnj7los6ll3v2J9Qa/xFdkbZ8kOQeQtRpB
   iUE1jRf/wcULtK4id7ou9qDtRSVRqpxnd6RxvIU29cle6UwNOcgVeFwnm
   XoJjwBhkS2bWZTzRyyttcjUOswZAW2M00I4wUBm8Nqk1P/8FAUVlmjbji
   g==;
X-CSE-ConnectionGUID: VPhqfcdbQ0S1hD+FGIxfdA==
X-CSE-MsgGUID: 906LIRPaQ8+gHTglpJWeZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="177444539"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="177444539"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:08 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C3D0D4807
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 15252BF49D
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:06 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE8E11A006C;
	Mon, 10 Feb 2025 17:02:05 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 55/66] python3-pymongo: upgrade 4.10.1 -> 4.11
Date: Mon, 10 Feb 2025 17:01:24 +0800
Message-Id: <1739178095-26432-55-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115381

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.mongodb.com/community/forums/t/pymongo-4-11-released/310976

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.10.1.bb => python3-pymongo_4.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.10.1.bb => python3-pymongo_4.11.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.11.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.11.bb
index 393c0d201f..5bd28af4ee 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.11.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "a9de02be53b6bb98efe0b9eda84ffa1ec027fcb23a2de62c4f941d9a2f2f3330"
+SRC_URI[sha256sum] = "21b9969e155c4b16a160fbe90c390a07ca7514479af6c3811b1d15ead26e10ba"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


