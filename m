Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AA1C369C5
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.14424.1744794155551803557
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BtWlcTKi;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794157; x=1776330157;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=f7MICx/ZCvRdGlVqGHiit5aoWVlBr9aWt1WEUWRdUgo=;
  b=BtWlcTKiJvawVHU+bY3+t7Chhx1oIpVBazddS7/vFrnmyoCwTp4+y/sN
   HYalaM1iyxzRo9hbC2jdkqb9yNGJU7CH2FDXTN80ERHgIYO51dpMj5xO0
   /3O720BcxerFLgH1EF2N1QhA0K+HEJ9rrYf6uPWarcKWVkUb/HVZTIHhv
   GFSRY7rEaxMn7smvuqQa5EWdEmXwXP5ejT53H5UnGvnfX3zWiNLooyzJC
   K9GPstu58opU/myTbMcQUQ4Qja2CWt/rRqjoZZYUt7yhvBdImogzEZt7t
   giXQCQm0k7dj4BV1CxPbXhof5m7viyilZhrwa9rgn2CpOZG1uu8ksSl+7
   Q==;
X-CSE-ConnectionGUID: aUlcJzgDT7u2es5skRHF5w==
X-CSE-MsgGUID: a/FcSuQtRBKjbOGMbhy+kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="195806409"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="195806409"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 82C41DBB89
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B5F8BDB60
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C62B01A0078;
	Wed, 16 Apr 2025 17:02:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/31] python3-pymongo: upgrade 4.11.3 -> 4.12.0
Date: Wed, 16 Apr 2025 17:02:09 +0800
Message-Id: <1744794136-908-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116891

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.11.3.bb => python3-pymongo_4.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.11.3.bb => python3-pymongo_4.12.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb
index 61614b29b5..52f3d6cd10 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.11.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.12.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "https://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b6f24aec7c0cfcf0ea9f89e92b7d40ba18a1e18c134815758f111ecb0122e61c"
+SRC_URI[sha256sum] = "d9f74a5cf3fccdb72211e33e07a6c05ac09cd0d7c99d21db5c2473fcfdd03152"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


