Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8777CF64A7
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:38 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.49296.1727682213631484629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=aRJksw5y;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682214; x=1759218214;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mfdylytgUBGmRkPug5wr5008oFeMivRe9C5o1KaoozI=;
  b=aRJksw5yKZ5xYxKPlkPXgfR9FejaoHcCFBtdhhKcm7sBOqWU+Obs9NQh
   NHGjdEcX2/HR3p5sauOsWVTP/2NUbv/qIW3EZ+AzY2dP9mPMqBJksfVVh
   WicbtEmp1BBhQUA0Fu0KYJc/dS7XjpoKpFJaGJ4rbZOdH3yDZOCtAeD5d
   M5uXkfWjvSJscq3IsMGFgQZcD+qFmwXiX22Q0fWzqHyJ2M7YlzPFExuW4
   DcsO/7bhSwGQe38TYkj6+gVNiNKnvgx5ej2ZKXGWWdexZrTKmIyHkZ83j
   PMwNK6oxDJ8GvYUVxcmkHfObjwVPbpJgS2OgMhwhz/2eiUv4rVKq63p17
   w==;
X-CSE-ConnectionGUID: V6Y8UWEjT2ec2HHP4RwnvA==
X-CSE-MsgGUID: QjaauHHnSreeLzxVVevprg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="175232289"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="175232289"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:31 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3BC80CA1E6
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7138CBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 13BAA20076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B7D451A000A;
	Mon, 30 Sep 2024 15:43:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/40] fwupd: upgrade 1.9.24 -> 1.9.25
Date: Mon, 30 Sep 2024 15:42:29 +0800
Message-Id: <1727682185-12664-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--9.648600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbytYC5LPd7BvbV9D
	7zVKUKhY/I+yd0mcY0V4wy0KIXhzm3b7237U7CUnbILsEDxfW2mycrvYxo9Kp+jMOEZ5AL0SH0S
	Ts1Rx71MILxoCYZ47qepe9co8GDkGZWMJGq5h2T4ReM8i8p3vgFQQ0EgzIoPREd+K6O5Nt51/wV
	JvMu+9/lNGzbimam7q0irrqjW9g7pjAM4vu3dHIZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyH4gK
	q42LRYkx678oe2uSLCY4QzPJS0/cRcF1yN+6v+xGYoHwliempV+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112563

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
Bug fix:
---------
Fix checking new Synaptics MST firmware size
Make another ModemManager instance ID visible for firmware matching
Never set a zero-length device name when matching the vendor name
Recalculate the device supported flag when reparenting devices
Reduce idle power consumption of paired logitech-hidpp devices
Retry the open action to fix BC901 NVMe reload

Add support:
-----------
Algoltek devices supporting sector erase
Dell K2 dock
Intel USB4 hub 5787
More MediaTek scaler devices
Nordic HID devices supporting DFUv1

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-bsp/fwupd/{fwupd_1.9.24.bb => fwupd_1.9.25.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/fwupd/{fwupd_1.9.24.bb => fwupd_1.9.25.bb} (98%)

diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
similarity index 98%
rename from meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb
rename to meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
index 15cde9f10..a098bf8ee 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.24.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.25.bb
@@ -6,7 +6,7 @@ DEPENDS = "glib-2.0 libxmlb json-glib libjcat gcab vala-native python3-jinja2-na
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
            file://run-ptest"
-SRC_URI[sha256sum] = "12f560b35dbed981fde8cf774c6d1f2e658a157d3a63d6c439bf418dbcc44b4c"
+SRC_URI[sha256sum] = "a1d484778ae87c69b38f417659b33fe3d689373ce0831d1f95617b8aa76e8c37"
 
 UPSTREAM_CHECK_URI = "https://github.com/${BPN}/${BPN}/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


