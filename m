Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B69E7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:31:00 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.58745.1735543850500857371
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nMbEgq7g;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543850; x=1767079850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BZNPNJldoL8qDGo1ymCmNcoittTLDbVZq7gIeuE06kg=;
  b=nMbEgq7gVnFuANTZTNwvFQ4PQ1je//i7sdfRT8YaRRO4fYaSgMRRMphW
   uU8z5lCGcWSXJXuP70YstN8k1YluFlYfqvKHzeupJkzA2MiN9LwE/1Yof
   ah7Kq1NC6Ndwff/cPxN/a6jxfGBjahm+SlDhPhyXdYatDAMmOB9QlcoU2
   DeHrSuwJU3JDjukXDrqp2vlGcJjAZ4Te2HEadye5Ofge4BYzapaDOP1nM
   DHU+xqwe5WSan5aAgwhVMNupzncjFBl/U4PRgTmt3AHsK8b5lop+vbnt9
   49RaffGtnIAH1ByFFpSkpE/MuHwhUL9QKacWhUcUeRY1yp8R/ksPGUi9+
   Q==;
X-CSE-ConnectionGUID: 8K0qy2voSo6nXoqDZgvLCg==
X-CSE-MsgGUID: nhWfz5cZQAqgwR5SZxvf/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="164749013"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="164749013"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:48 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B740ADBB80
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8ACBCD5016
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2357C20074EB1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:46 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BE0FF1A0003;
	Mon, 30 Dec 2024 15:30:45 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/18] python3-trio: upgrade 0.27.0 -> 0.28.0
Date: Mon, 30 Dec 2024 15:30:36 +0800
Message-Id: <1735543836-2512-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDW4dWVHxf5ch2qRj5BisozxhJamH86RFysxFRWdNOLzXj3SlFM8oJGXC0BYU090dOcyrL
	y0F3d1VXshICT/GyxSJs4vnitfpR/yvrjvn2gBWVPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114597

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-trio_0.27.0.bb => python3-trio_0.28.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-trio_0.27.0.bb => python3-trio_0.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-trio_0.27.0.bb b/meta-python/recipes-devtools/python/python3-trio_0.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-trio_0.27.0.bb
rename to meta-python/recipes-devtools/python/python3-trio_0.28.0.bb
index 524e439d4e..04458b766c 100644
--- a/meta-python/recipes-devtools/python/python3-trio_0.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-trio_0.28.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=447ea202d14d2aee40d8a2c26c865da9 \
                     file://LICENSE.APACHE2;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://LICENSE.MIT;md5=5f229c828e5a6f0a2ce90c7d3c054721"
 
-SRC_URI[sha256sum] = "1dcc95ab1726b2da054afea8fd761af74bad79bd52381b84eae408e983c76831"
+SRC_URI[sha256sum] = "4e547896fe9e8a5658e54e4c7c5fa1db748cbbbaa7c965e7d40505b928c73c05"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


