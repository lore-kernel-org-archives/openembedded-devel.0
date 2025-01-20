Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C80DEC02195
	for <webhook@archiver.kernel.org>; Mon, 20 Jan 2025 08:14:31 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.32645.1737360863254015612
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jan 2025 00:14:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hp9RHiyq;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1737360863; x=1768896863;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EDxqMoyjIxaViLqeZ4eUP5p8ZHKBhsbMXHpBe/L+uPw=;
  b=hp9RHiyqNhRwGbZhuutHzQY4xWqqmJn4U0FbeEg6P2mIkl6mmsXaxPfe
   Kc96KKFBjlHKa++zsI0GhZ6YSFj/gQ5P96oUrjEeb7g3FsA5gZ4+34WEK
   JgjN3/cdV7QzJMRnCxwd44F31yZXFA0m4rYgiHgjdEQy1/hIGreezwu09
   FTx9dI64mBvD+rSJ2oxstUaXtnuncZbPjrZpQUHzbEEtLNRh6dKAZxvgk
   aCB2kQeVEomxeGUDnpkmwDx7niMDx3BBEzNPwX/SWbycBGE9lEcd6f7On
   Azs8Dm6N596Bcrn6v7eS+rAx9pqlEbze16fl2PWKesEaw401Oq8P/Z5cl
   A==;
X-CSE-ConnectionGUID: 81a7sHW3QciruIz/xdJaIQ==
X-CSE-MsgGUID: qDMLUPlPTtOMcTSONJ9guQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="166002983"
X-IronPort-AV: E=Sophos;i="6.13,218,1732546800"; 
   d="scan'208";a="166002983"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 17:14:21 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6BF1DDCFD9
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 43A9FD88A1
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CC6CB6BAD4
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 17:14:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C5831A0074;
	Mon, 20 Jan 2025 16:14:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/32] python3-robotframework: upgrade 7.1.1 -> 7.2
Date: Mon, 20 Jan 2025 16:13:59 +0800
Message-Id: <1737360846-4824-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
References: <1737360846-4824-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28934.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28934.006
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: uzDfqB7OXkqjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZngIgpj8eDcBpkajQR5gb3lQwtQm7iV5jKra
	uXd3MZDXGnx/eDlooyeomqeMlaJnInL9DVkOPGDf9vgEKR5tHbeNdIFZXxZyKaEaYkLPt7lrcel
	3MOAOX0CFnZaW3hf729dxUhyztTRIN3Nev8Voz8VPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWL
	WlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jan 2025 08:14:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114985

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-robotframework_7.1.1.bb => python3-robotframework_7.2.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-robotframework_7.1.1.bb => python3-robotframework_7.2.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb b/meta-python/recipes-devtools/python/python3-robotframework_7.2.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb
rename to meta-python/recipes-devtools/python/python3-robotframework_7.2.bb
index 06a2a931a7..4f43c6816d 100644
--- a/meta-python/recipes-devtools/python/python3-robotframework_7.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-robotframework_7.2.bb
@@ -11,9 +11,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-PYPI_PACKAGE_EXT = "zip"
-
-SRC_URI[sha256sum] = "f85919c68c4d0837006e5f09dde1ef689f082eba2e7e64d5758753f9ee8bfea9"
+SRC_URI[sha256sum] = "9fc77d40283c26690bbc1563fb7fcadac789afe8695d332ced3fa4696df39eb9"
 
 RDEPENDS:${PN} += " \
     python3-shell \
-- 
2.43.0


