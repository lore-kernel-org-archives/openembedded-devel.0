Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02DACC77B7C
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:11:57 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.13707.1750662711352179060
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=M3raPXDf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662711; x=1782198711;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OV0Sy5Ji5Pk1B3FfLoY4gBlgZzNcbUpBbfpkxOyLCo4=;
  b=M3raPXDf6FWPuK+w2mMXPY+aUpkWRRfuZqe22WyD5Dj6Mpx1EZejyJfx
   5GMNBueKHr5+O7KYvoo5Rm8FFynydT6NLT7u/yEBaGEHrq4vj6UfZS9QX
   7C8536rht5ypm5Ektm0843FLp6QUhovI8308GGblPqyvb6ez8EPiD8NUs
   io/7bku5xbf+8+riEvYbl4sfCalZoXNEAfdpQZpdJsQQgoln7H7+I+ipB
   kQmyInZTp4xNh4+qzocAXAzDwBqXFlyVCTVJLk+zn5j/ruCo9IgC2NDOb
   t5MY3dKh4O5RuccLeE/wnodxbr8kPEUbezggR5LwEyKi9kiBF/xnhS5Vg
   g==;
X-CSE-ConnectionGUID: m0ogWAjnSNa8cRzfpOgiXQ==
X-CSE-MsgGUID: V3ZBA4m5Rw+Sdce4Hd2AUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="202852331"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="202852331"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:49 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E970EC9987
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:46 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9F2DAD5E22
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:46 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1C54F1A0073;
	Mon, 23 Jun 2025 15:11:46 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/30] clpeak: upgrade 1.1.4 -> 1.1.5
Date: Mon, 23 Jun 2025 15:11:09 +0800
Message-ID: <20250623071138.402-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:11:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118030

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use _aligned_malloc in Windows/MSVC builds
- Add option to force number of iteration per kernel

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-core/opencl/{clpeak_1.1.4.bb => clpeak_1.1.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/opencl/{clpeak_1.1.4.bb => clpeak_1.1.5.bb} (87%)

diff --git a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
similarity index 87%
rename from meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
rename to meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
index 59f807b7ae..a765f1530f 100644
--- a/meta-oe/recipes-core/opencl/clpeak_1.1.4.bb
+++ b/meta-oe/recipes-core/opencl/clpeak_1.1.5.bb
@@ -6,7 +6,7 @@ SRC_URI = "git://github.com/krrishnarraj/clpeak.git;protocol=https;branch=master
 LICENSE  = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRCREV = "527695de8393a3144863a0a07f9b92f1c734d1c4"
+SRCREV = "b2e647ffb8f42aa22ce4b0194d6ef6d16d5002b0"
 
 
 inherit cmake
-- 
2.43.0


