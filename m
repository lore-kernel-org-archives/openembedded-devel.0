Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F222C369A4
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 09:12:10 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.47783.1743412322271866337
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 31 Mar 2025 02:12:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=r2JKit6h;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1743412323; x=1774948323;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=NFZiw8HgSfnJbvXpGDk1bCC3V5C913ClaB3S77CCO0U=;
  b=r2JKit6hizZAE8p+G8hB8yoI+3un3M73fTeHQsbduIAn+z6oRO9EBbAr
   3WCcUbHKUuHy8mJ3qMq53DkJ6RG+oIEyX1ylLe8sSUg0xIc2feA5Z6bsN
   H9MVB6LQCvT14XtnpsIJ5pSB9zKIyrL7IlYGc5NclCmu+iPptFRxqnJ38
   HB9jOA2ylcN3gTnDVVgV3jO4HuYDgd5qQ4eysdrsRFiUlFK5thllYdwW8
   VLyUCVjGpxS9AAQ3NuC6R1QqSTuFdIoyrtBYbVknZqaf7nAidLTZmLtY7
   rBsfezESTWRNMBltT9YMjog4m5Aijl1NsHdmwThFxPEc/oO3+GND+nMXE
   A==;
X-CSE-ConnectionGUID: VzwVod81ShGxxSiX3ALYHQ==
X-CSE-MsgGUID: uw+luXVIR0W2VeGqmqkimQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="194950085"
X-IronPort-AV: E=Sophos;i="6.14,290,1736780400"; 
   d="scan'208";a="194950085"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2025 18:12:02 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4831D5011
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 849D2D5086
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 18:11:58 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 43F731A009B;
	Mon, 31 Mar 2025 17:11:58 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/26] python3-libusb1: upgrade 3.3.0 -> 3.3.1
Date: Mon, 31 Mar 2025 17:11:36 +0800
Message-Id: <1743412308-21887-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
References: <1743412308-21887-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 09:12:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116409

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-libusb1_3.3.0.bb => python3-libusb1_3.3.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-libusb1_3.3.0.bb => python3-libusb1_3.3.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb b/meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb
index 78480cfa81..1c2d60e6b8 100644
--- a/meta-python/recipes-devtools/python/python3-libusb1_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-libusb1_3.3.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c \
 "
 
-SRC_URI[sha256sum] = "b642aa518689f8e053f61955cba274e72bc8d0794c65d7990745aaae90dfc8a1"
+SRC_URI[sha256sum] = "3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad"
 
 RDEPENDS:${PN} = "libusb1"
 
-- 
2.43.0


