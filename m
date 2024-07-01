Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0988CC3DA41
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:23 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.13621.1719816259115150338
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P9kW215e;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816262; x=1751352262;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nGVKxJ9+ooIVk8WncnuioBWwlMY99JSzq9OXui3phYk=;
  b=P9kW215ehPhjk0reG+9921og281iao0RF7pfmPTDpUgsZ5GO2O7pE/Lr
   1idFf2HynFZIGSWNk+jKfaqmiCv3EfSNPJiGEaHGtTpPvFKa4+/gCf0Hh
   4OC3I0qfo3s0abhXjWbQP9e0lRP+K7lJP9LT7HCNbF1XWHWvKISJPfFaz
   mn/iAmTEJyo5y+x/ie6FYpG+LP0RnEOtevmJ0nvCwHEI1dsaaxllg+nGh
   EddY3CPatsoSl3MTWtCUdfgW08ejjHqEw8Zw5QkCqfvHUNXfPTRpuftz1
   mR+BSYoGX/c8namn/BNBJ7dFuu5dBcvM+ZMetGAS6JdqObx17MXL3Oxda
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="167338983"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="167338983"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:21 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1473CD9227
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 58EB4D7489
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id EFB9920071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A06F81A000C;
	Mon,  1 Jul 2024 14:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/25] python3-ipython: upgrade 8.25.0 -> 8.26.0
Date: Mon,  1 Jul 2024 14:43:54 +0800
Message-Id: <1719816242-11839-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-0.444400-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrNi8L88UV9IAf0wrpkdMLWr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXJYYCZCoEESjj/1oMljkS9VlmuW18oKdY19Cu
	A9XA6RmMgxQkJAJkI1X9X0jVMoC+etHGSgWA4i2ZNZbBUS+mePq7QMlyJ5WO3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111183

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- bugfix for call to structured_traceback
- fixed honoring custom repr for NamedTuple if assigned by partialmethod
- Convert matplotlib gui name in enable_gui

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-ipython_8.25.0.bb => python3-ipython_8.26.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ipython_8.25.0.bb => python3-ipython_8.26.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb b/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb
rename to meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
index 2e2d0e1c5..6cea3d988 100644
--- a/meta-python/recipes-devtools/python/python3-ipython_8.25.0.bb
+++ b/meta-python/recipes-devtools/python/python3-ipython_8.26.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING.rst;md5=59b20262b8663cdd094005bddf47af5f"
 
 PYPI_PACKAGE = "ipython"
 
-SRC_URI[sha256sum] = "c6ed726a140b6e725b911528f80439c534fac915246af3efc39440a6b0f9d716"
+SRC_URI[sha256sum] = "1cec0fbba8404af13facebe83d04436a7434c7400e59f47acf467c64abd0956c"
 
 RDEPENDS:${PN} = "\
     python3-setuptools \
-- 
2.34.1


