Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBCE2C3ABA9
	for <webhook@archiver.kernel.org>; Tue, 22 Apr 2025 08:49:43 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.35428.1745311775512011294
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Apr 2025 01:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ET0B3PQw;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1745311775; x=1776847775;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=dSBrkuSmigXsrfAaFPDGyfGKrVHPtTh8KRez5tN2KaM=;
  b=ET0B3PQwRHTcNc+3mJRgJQtH8nGe82lFkjotx+huIT7g9T84c6g642yg
   aoMdbKwFJgiQ5qqd+XNHj1gcefS7T3tTlCUfx6ypwxjkA4paPJjAbWxVa
   wmQn852eEXVRh3tTlqoJAdG5rLDrXtSBQHQX9gEuDFkSQiE+6w3Aa+Gxr
   eEwCpy5JaaBIy1XxhOesnMMN+1qKwO6aNjQK5K3/YZqXXxRcjeURJyC8+
   6NZ+OO20euL6gV0BjzBF+tPglW+TjVObrOluk+HTzdg0li+dK3t0kFLH3
   5xf7fEKqvlj/cuxI1fkRxgwbWTdPV2mSWyXgKqTDaX4yaDuqs186MC4+d
   Q==;
X-CSE-ConnectionGUID: F1gzKX3dScCScXq6Qvr+qA==
X-CSE-MsgGUID: sU2esvB/SyCnjXcA+OkX9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="185691852"
X-IronPort-AV: E=Sophos;i="6.15,230,1739804400"; 
   d="scan'208";a="185691852"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 17:49:34 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2318BC2270
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8BEEBDC8F
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 17:49:32 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6F2D31A009B;
	Tue, 22 Apr 2025 16:49:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/30] python3-marshmallow: upgrade 3.26.1 -> 4.0.0
Date: Tue, 22 Apr 2025 16:49:11 +0800
Message-Id: <1745311761-1912-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
References: <1745311761-1912-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Apr 2025 08:49:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117031

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...thon3-marshmallow_3.26.1.bb => python3-marshmallow_4.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-marshmallow_3.26.1.bb => python3-marshmallow_4.0.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb
rename to meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb
index 4790695129..389a1b0ab6 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.26.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_4.0.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "\
                     file://LICENSE;md5=27586b20700d7544c06933afe56f7df4 \
                     file://docs/license.rst;md5=13da439ad060419fb7cf364523017cfb"
 
-SRC_URI[sha256sum] = "e6d8affb6cb61d39d26402096dc0aee12d5a26d490a121f118d2e81dc0719dc6"
+SRC_URI[sha256sum] = "3b6e80aac299a7935cfb97ed01d1854fb90b5079430969af92118ea1b12a8d55"
 
 inherit python_flit_core pypi ptest-python-pytest
 
-- 
2.43.0


