Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1417C369B5
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.43039.1744017447888691469
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b65VzsmJ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017448; x=1775553448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Ff7o/w2rOIi85yXitEuzsaSfPyrYwH44wbxPBMAaB+E=;
  b=b65VzsmJxK2cFP6FlxNh3w/rEqjVL/iBYXLPqCfcwBVQTRYJ4u499bS8
   gVTq6A4qKkgvhJ/jBDzWSy9isa/ZcFt69nJiOzJq00ss9IfcisKIeBc78
   TH39i6agoa4Be6yGDUFIANNVSlikXMrGtnhJtC0ff2b1YNNkGNr/VumZW
   /aauIOTIR5VgbrabPr+t/ndy6IlvHete3MmyRVmKCwDGnDuwmbvmjHs0k
   f+VUyS6jmmoYHr4X7znyj6x/nueiohnWspKw+x5KXWM49f6UG9kVZNqHI
   T9l0vKHhLYs67rmiLsEwQTNIXMq2c5d93FFuT9twxqZP+DJcB40B0h+I+
   A==;
X-CSE-ConnectionGUID: PUCgm1mhR2KVCGthrv3KMw==
X-CSE-MsgGUID: HyC7O3/tQpWJt8VYbkSo1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="195694338"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="195694338"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 13984D480A
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C976AD88D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 59C6E1A009A;
	Mon,  7 Apr 2025 17:17:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/30] python3-coverage: upgrade 7.7.1 -> 7.8.0
Date: Mon,  7 Apr 2025 17:16:52 +0800
Message-Id: <1744017431-22217-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116636

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.7.1.bb => python3-coverage_7.8.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.7.1.bb => python3-coverage_7.8.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb
index 78a0ebff2f..9c4330a361 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.8.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "199a1272e642266b90c9f40dec7fd3d307b51bf639fa0d15980dc0b3246c1393"
+SRC_URI[sha256sum] = "7a3d62b3b03b4b6fd41a085f3574874cf946cb4604d2b4d3e8dca8cd570ca501"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


