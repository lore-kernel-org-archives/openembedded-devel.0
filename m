Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E12EAC27C75
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.10787.1715677833427102751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Ata6rP98;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677841; x=1747213841;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=46XvucsG14LoHyzxS5vqJYomKP20AyUWxJYXt1i3Occ=;
  b=Ata6rP988Zux3BRl/ZDqdHM7RQKW9y4wgtsaWlNEe7ANHUR69BDc/P5/
   5uIs1zwLC6D8PUJrWci9pw4P+vRKOvUQWueOZqREbaUWZC95rzUNKsJOz
   cIuxg5wEnabPGo3IN8Pf4Zfjkq/Oujdbg6TaYJB3C9nER/AYezjkdnek3
   n2zn69HM4CsGeB2rc1yZMCRiw9Uv1hHz5wtQSY45dXobl1q8SnvY+pLNR
   nvprtXzvixf1SU0Np565UtuzIMmdXMMbdPPCbLpJ7M8kAwh0v5W+j7cFR
   ipqu07J9YXSsJ1LtoxZ5FapUeJrOC1j6g/J/5ENXXF+2nTobtN9HtQue9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="137527414"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="137527414"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:39 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id ED0B2D6482
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20F96D6222
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:37 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AA3C670BFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:36 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 57EF21A000C;
	Tue, 14 May 2024 17:10:36 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/44] python3-pyudev: upgrade 0.24.1 -> 0.24.3
Date: Tue, 14 May 2024 17:10:06 +0800
Message-Id: <1715677817-2223-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: pFlEBMmIVU6jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0Z3QqJN4m15UF9LQinZ4QefCP/VFuTOXUTPvB
	STRncWKuOhzOa6g8KrZ5EOeRumzX6Z2XYOspsqLLZr6HoTl+CA4F6iYndPlLW6JmoT9nwnlFBWd
	e5j8kfRnys1cRhTddAiJ5HMh70JmsNgXdoZ07idx0m4Rm5hspVxSSu8i52URmXTt0OuyJi/IIuE
	VM/dBEMBtjAKW7+qHc=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110376

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pyudev_0.24.1.bb => python3-pyudev_0.24.3.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyudev_0.24.1.bb => python3-pyudev_0.24.3.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb b/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
rename to meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
index ed5175fcf..0911b63ed 100644
--- a/meta-python/recipes-devtools/python/python3-pyudev_0.24.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyudev_0.24.3.bb
@@ -3,7 +3,7 @@ SUMMARY = "A libudev binding"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
 
-SRC_URI[sha256sum] = "75e54d37218f5ac45b0da1f0fd9cc5e526a3cac3ef1cfad410cf7ab338b01471"
+SRC_URI[sha256sum] = "2e945427a21674893bb97632401db62139d91cea1ee96137cc7b07ad22198fc7"
 
 inherit pypi setuptools3
 
-- 
2.34.1


