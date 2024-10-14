Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07FD0CFC53C
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.50494.1728896173975221498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MtBcXoUP;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896174; x=1760432174;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gJO2DDbhBNeNGYfsiKKdyoZLuKPgkQ5P5NCNIHdQqsg=;
  b=MtBcXoUPfQmv9/G1yAqU/JcRzT2PB2REJYtTGcXi+qPywiV/Wnw2ESXa
   fNZturZNoo7ptggZrwgXjBoG20Q0nEKYuY2lWLZBp+LGQg+Rv1dgy+hy0
   Vu87bdOPLv53fq4nOePE+kfRZ6KDjExBcCElMgquz1vX8XA372gNSav1X
   yK/zfVH+D1flH3hYGPZEq/owgK+Q4tPouqGrkr1lsgPx8sp8LS/V04XC0
   3kYwLySTB916fkJjFuU/xVnzWu5V3pqgDDKt2FrKs6std3r+EQSgBXXQm
   DoEDFf8BEYckrCGSB7D1tDw13bV3jMtdfbvB9IMvUyxL54DOwgpXmy4gF
   Q==;
X-CSE-ConnectionGUID: JzR1YPgsROqkjS8gHHqyHA==
X-CSE-MsgGUID: Zy2qBsmmR7yUNeep108v1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="165031665"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="165031665"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:11 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D118CD6473
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1963ED7758
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A58236B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5214C1A000A;
	Mon, 14 Oct 2024 16:56:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/54] python3-pychromecast: upgrade 14.0.2 -> 14.0.4
Date: Mon, 14 Oct 2024 16:54:53 +0800
Message-Id: <1728896115-2944-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10--3.492900-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr3hng3KTHeTbTcUw8L9AtVr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3F8EoFuRGFR1iuq
	dhPGRUUq9f7c6KrFbWawnY0RVRjvrHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6FfP
	ePg7IYwdHBjtSQ8UzA6awJrsvFiKFsqtOl6RmgZ7ZyDpgzWICFTZDD0KeQm2wLn3i+iFGUprWbZ
	3wx4WVgMNvVWF3Ca5+CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112882

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Make it possible to log heartbeat ping pong
- Move HeartbeatController to a separate module
- Simplify socket timeout

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_14.0.2.bb => python3-pychromecast_14.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_14.0.2.bb => python3-pychromecast_14.0.4.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb
index 5a51d2e13..6f06f53a1 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_14.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_14.0.4.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
 SRC_URI += "file://0001-Allow-newer-version-of-wheel-and-setuptools.patch"
-SRC_URI[sha256sum] = "092c65f421991bca565338bc61a0c14861c47e0f5c0a65919a5e93f02dfd071a"
+SRC_URI[sha256sum] = "1fc05d63db152fe6f71efdee77d14228dc4c55e99d734de4757455800b1f3ba4"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


