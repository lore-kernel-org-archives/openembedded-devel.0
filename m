Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5BBC7EE39
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.13877.1750662719322872624
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=E2/gGYqb;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662719; x=1782198719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=EehnKvjd7lflRm2GhdQx7zzFcu4xvwowBDU6GVIjphU=;
  b=E2/gGYqbBDUCNqGNQ5rUo5/grWTuW/dOVm9TAuUhmY7WR2XmC5ZDOpQx
   X7dC/zQGiYP204eoo95aOqKYhSDbl47fZeTdykoep3GVlm720HbpmVxYl
   g9nNTHyT5Jf7EK7+v1cEG9Li/EmYk03QvzscCm7pLXljHp6he283FKAPu
   WGFyUOYTgGkIOTByRr1+W80ZT+8plkWEiSBpQVsf2avECTXZuMTT+r6Rn
   Yh1rSlqB9iuB7dKxlZEnlZ4KH4T4VtlGr4osRaNZ9vS3oQpAlDGaekyy8
   Ou90Pius4EavLhKFygzglMv8vVE1ECBNWDDxbo/DovrJjH4zZFOvq7kBI
   g==;
X-CSE-ConnectionGUID: SKm7+fqUSH2X9W6+SanM/g==
X-CSE-MsgGUID: YcDS/8jPTDCiOxaWB+vGtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="204106980"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="204106980"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C53F3D6EDD
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 80C63D5041
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:54 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 061A01A0073;
	Mon, 23 Jun 2025 15:11:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/30] python3-pymongo: upgrade 4.13.0 -> 4.13.2
Date: Mon, 23 Jun 2025 15:11:30 +0800
Message-ID: <20250623071138.402-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118053

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed a bug where AsyncMongoClient would block the event loop while creating
  new connections,
- Fixed a bug that resulted in confusing error messages after hostname
  verification errors when using PyOpenSSL.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.13.0.bb => python3-pymongo_4.13.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.13.0.bb => python3-pymongo_4.13.2.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
index 28f12e7381..9630214dcb 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.13.2.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "92a06e3709e3c7e50820d352d3d4e60015406bcba69808937dac2a6d22226fde"
+SRC_URI[sha256sum] = "0f64c6469c2362962e6ce97258ae1391abba1566a953a492562d2924b44815c2"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


