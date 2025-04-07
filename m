Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA48C369B0
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.43038.1744017444610489553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fXhRA3df;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017448; x=1775553448;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3HMKYrGt/WgM7cGoneYXTaTyo/Tf+w1bg6FGt4OY9I4=;
  b=fXhRA3dfw+KNLFl+WvLhcSJ+SXyCfSDUQjxXLIc32ylng26HJB3A3r8M
   rOkckI7l71/V4RxigjhGeYHNv7nBM4fDl6NqCaUFwtFmy6SuSjBAdw1xc
   2p99fRzTGMNd9VBLtFF6J3TFiJpg3HmpfjFfrC134gz7WlzlRFFJGihZp
   TtFutE6MHzY3UzPpen/+Xwtg9fGwxYHuXS2yeI6Eyy5D+aBM2DPIIUt1w
   8R9QyuLon7req3V7xe7R9+ikPkxeVe13BoEBLJni7OBHKo6/zl7RyfSum
   7+kI7H5S9iCMi53RVwWxy0DIp08za68opM4UcPoP3/rtKx7YX7pyykfgw
   w==;
X-CSE-ConnectionGUID: 8XLWsrJuR96JiV/Ui441xg==
X-CSE-MsgGUID: Qjs//4UBRsiBaUhrCT/0sQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174543309"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174543309"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:27 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E568DE9AF8
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA041D4C3B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:25 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 397801A00A0;
	Mon,  7 Apr 2025 17:17:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/30] python3-inline-snapshot: upgrade 0.21.1 -> 0.22.0
Date: Mon,  7 Apr 2025 17:16:55 +0800
Message-Id: <1744017431-22217-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116638

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ine-snapshot_0.21.1.bb => python3-inline-snapshot_0.22.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-inline-snapshot_0.21.1.bb => python3-inline-snapshot_0.22.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb
rename to meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb
index eb22ec5a3f..e6b297f81b 100644
--- a/meta-python/recipes-devtools/python/python3-inline-snapshot_0.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-inline-snapshot_0.22.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7a35eb90dfdf03953dd2074d0fdba1d4"
 
 DEPENDS = "python3-hatchling-native"
-SRC_URI[sha256sum] = "00416168403740b439d5030f7a769373375a5ebe718cbbf25f909b9b89c505ca"
+SRC_URI[sha256sum] = "8e7285cbc445ed91da6b27788a267648a84377737e6be8d84f704ea648fc0fdf"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


