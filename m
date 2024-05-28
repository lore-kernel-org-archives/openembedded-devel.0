Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB90FC27C44
	for <webhook@archiver.kernel.org>; Tue, 28 May 2024 01:49:38 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.12690.1716860976227249627
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 May 2024 18:49:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=IsUDdrsV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1716860976; x=1748396976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=epl9ivXGpnQwg7xJhxfWmUMdQBy0nev8YCBjFXHS1u8=;
  b=IsUDdrsVYwlRJroMUzcKU6omoCYz4KEy7iimOILioE4X0T1fc5LEP7Oz
   LiIBqFyE2RTKhOUu/iDy3SZy3A7yIL5QR02PLJc964EDck66X/ltFamNE
   amJDp04M2cNTdBw0GQ1ng0hwF3aYmr7fv/ozCABdnzrkVdoD5w0Ww+4/a
   taFBm5jwBTLdSYVP1w/tYuU0YXQfwcZQq5w70XyV8H7wbGKdJ9RfOf94d
   +ph4FqvYgq0QZ3MujGWAlUa8v8hUx9oFAH7pKHP1e4WZRlRoHy/XzYYdl
   CuYJOjCPHOHmSLijeaySFL7dGQBj3zPGa6CVwClNbiZBWV/0C8Lr5yEWL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="147886232"
X-IronPort-AV: E=Sophos;i="6.08,194,1712588400"; 
   d="scan'208";a="147886232"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2024 10:49:34 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 02DA4DE572
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:32 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B56FD561D
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:31 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B2EF32007FADB
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 10:49:30 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5EB8C1A000C;
	Tue, 28 May 2024 09:49:30 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/40] python3-dbus-fast: upgrade 2.21.2 -> 2.21.3
Date: Tue, 28 May 2024 09:47:56 +0800
Message-Id: <1716860901-863-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
References: <1716860901-863-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28414.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28414.004
X-TMASE-Result: 10-2.922200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/ySrLqyE6Ur/jMzbF1gbxlQZx+cvftRH+OqgF
	8LHYfOYGbN0+vPGJwYrxHXxxAO/d2TofzGcGae4LP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZLcexbXiCbKmWmdC+YL5qC/uVANwueTEFWd7nEbWVrK+8wsP
	/qZSG10sf9jZaOeX/7swpO90pqQYPyq4ynMRTXPxJda7cQzmF1Lv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 May 2024 01:49:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110549

From: Wang Mingyu <wangmy@fujitsu.com>

Fix bug:
 Clear exception flag on disconnect future if its also sent to handlers

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-dbus-fast_2.21.2.bb => python3-dbus-fast_2.21.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dbus-fast_2.21.2.bb => python3-dbus-fast_2.21.3.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb
rename to meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb
index aa1cf2b0b..a4087d647 100644
--- a/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.2.bb
+++ b/meta-python/recipes-devtools/python/python3-dbus-fast_2.21.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/bluetooth-devices/dbus-fast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=729e372b5ea0168438e4fd4a00a04947"
 
-SRC_URI[sha256sum] = "8645187b2e86c5141217adcb462d6dbecd37fb2ab8705f66b3773a66206ef83d"
+SRC_URI[sha256sum] = "8d0f0f61d007c1316ce79cde35ed52c0ce8ce229fd0f0bf8c9af2013ab4516a7"
 
 PYPI_PACKAGE = "dbus_fast"
 
-- 
2.34.1


