Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65AF9C369D2
	for <webhook@archiver.kernel.org>; Wed, 16 Apr 2025 09:02:43 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.14612.1744794151930365580
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Apr 2025 02:02:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c5D9PjQS;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744794155; x=1776330155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qa0JhMawPlkl7qUCGwKZBJ3ZIGNfinW0AoTyvjc0Pdw=;
  b=c5D9PjQSE4Vq03r3U5AhE3z5xnE4vG3/37pjaPylUL4IDQF5jC5cCOYm
   OqAVSbZSZOUF4MjgL0mQTGtlMUTU55B04TvkkLmNgZ25WpUgbr6Okp8Ru
   gTIEfXyu38uDsI0pVcpG1s10KCOXxuMr28kNIj7bf2ckDyG382TZaiTNE
   tQCW0e1u9VWby35NFf1nKHNcpMAcvaOjA7k6wqq1SfUGw0GEY2BRmY8BK
   W69/6vjSQjih/UIrHrz/o/iXk0aRL+J5bFqhHbkXaSB833HFR1h6dePhX
   AYDzGAxF+TWSd0R9vxiyM46Z5RvHFbJYOAr6v5ByZSs+rfBEZdX0+AFB3
   Q==;
X-CSE-ConnectionGUID: uZO7WshwQWK1lu4H5SzObg==
X-CSE-MsgGUID: KAYed0CESVOgP0JPnEbfNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="196657226"
X-IronPort-AV: E=Sophos;i="6.15,215,1739804400"; 
   d="scan'208";a="196657226"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2025 18:02:33 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B0E6AE8525
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 72222CFF81
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 18:02:30 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 08D851A0078;
	Wed, 16 Apr 2025 17:02:29 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/31] python3-obd: upgrade 0.7.2 -> 0.7.3
Date: Wed, 16 Apr 2025 17:02:06 +0800
Message-Id: <1744794136-908-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
References: <1744794136-908-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Apr 2025 09:02:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116887

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-obd_0.7.2.bb => python3-obd_0.7.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-obd_0.7.2.bb => python3-obd_0.7.3.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
rename to meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
index cf3daae6ac..762cc36bb7 100644
--- a/meta-python/recipes-devtools/python/python3-obd_0.7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-obd_0.7.3.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "A python module for handling realtime sensor data from OBD-II veh
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://README.md;md5=176d0f9ad45c10895296260d426fa862"
 
-SRC_URI[sha256sum] = "20d38c9ded3daad1e8affab3ff367a70788d4f29ac77ab7aacddc6a6d2a43d61"
+SRC_URI[sha256sum] = "27b8f043376ca700edb98bf5216e2912295ecde0e735b260999f2d9ddf342522"
 
-inherit setuptools3 pypi
+inherit pypi python_setuptools_build_meta
 
 RDEPENDS:${PN} += "python3-pyserial python3-pint python3-setuptools python3-packaging"
-- 
2.43.0


