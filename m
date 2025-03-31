Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70526C3601E
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.47777.1743412320556201685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=jM63wH/p;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412322; x=1774948322;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Zf32YgP55AeUHRDCII9GC0fFfoy+WW6+eBIS7Bp4n78=;
  b=jM63wH/pWoJBe8p/U3ObG8QL6C1N8M39/XIVAUIBWhO3GyL+6GMNGmIu
   lXK1rf1e1l6YEzAzZuWkDXRc6gWCULIaCNGzXf+ebQGtu6+9wEpCdilnU
   UVaw6uj/AcmUzUk6VsSbf/6K/vd1IyzssJFVOTaF+N+Qux746eJGt/TUy
   yb+j3CjVt/F9fcGkK6YfJAz/yn/tHSQfZnjsltmJY9dotfIlyhdiT+Jox
   PODKC32ZdoHbLzjnPZb31oFId2gIUhtfTwHbD5spYvT2VWyNIzNQH14ky
   f4F+Dyqq68Y8rFXFYQVQ93ge2L4CNnqQixjG2Tzoggm8+EuRC1C+N3X2m
   A==;
X-CSE-ConnectionGUID: 7k5bkhfXRWaFK6px7wabFQ==
X-CSE-MsgGUID: rwZnEpJRQQibs1XmhF/ptQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950081"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950081"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:11:59 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6948DB40FE
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D5B5D9692
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:56 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B44111A00A1;
	Mon, 31 Mar 2025 17:11:55 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/26] opencl-clhpp: upgrade 2024.05.08 -> 2024.10.24
Date: Mon, 31 Mar 2025 17:11:24 +0800
Message-Id: <1743412308-21887-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116398

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{opencl-clhpp_2024.05.08.bb => opencl-clhpp_2024.10.24.bb} (91%)

diff --git a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
similarity index 91%
rename from meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
rename to meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
index 25e7fd633f..b815c22eec 100644
--- a/meta-oe/recipes-core/opencl/opencl-clhpp_2024.05.08.bb
+++ b/meta-oe/recipes-core/opencl/opencl-clhpp_2024.10.24.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 DEPENDS = "opencl-headers"
 
-SRCREV = "0bdbbfe5ecda42cff50c96cc5e33527f42fcbd45"
+SRCREV = "c7b4aded1cab9560b226041dd962f63375a9a384"
 
 SRC_URI = "git://github.com/KhronosGroup/OpenCL-CLHPP.git;protocol=https;branch=main"
 
-- 
2.43.0


