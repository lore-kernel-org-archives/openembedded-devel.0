Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45044D29FA8
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.40032.1730874692200065459
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WIiM5SGf;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874692; x=1762410692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=vaknLtx0Ptj163/YowIaG0JBekTXMMBCDPIvkwZLdBo=;
  b=WIiM5SGfkw88c5+XMOBjg84RYKOAiemNLfSkX8A5jvPrttrREuio0lc7
   IEkICY3M0Takw0LYoApR8zN5rBae1eQ5JT3B6O0G+h5AiZ5nvZu3gLkn+
   3nGPrQ7Uh18VbMiCv6VDt3J/jK19zFUnCGgUCrg636DE4yPvBYzNbfBrW
   nGRvpn7Rym164xir5roVhdIQbrd4UdZU7gRESVcRD+u58bTe+TUHxanwu
   j80eGV9mbCa4sQ5XrkBncHxyk0B+bqCyt695pHgY1Q4a+Su+2EBHnjnd7
   ijesaiiCeNxdFRtlmpg0EREimWyiSy4UhiJ2Lkgw7ZnCdUk5khgrIw3E9
   A==;
X-CSE-ConnectionGUID: +KMQ9oE4R76crQJ6qZdZOQ==
X-CSE-MsgGUID: iWyF8RaZTMSumkBxep850w==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="181534039"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="181534039"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:30 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2026DD8016
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 65429B3522
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id EE8056BA6D
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:26 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9A34C1A000A;
	Wed,  6 Nov 2024 14:31:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/46] python3-sdbus: upgrade 0.12.0 -> 0.13.0
Date: Wed,  6 Nov 2024 14:30:50 +0800
Message-Id: <1730874660-2364-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.862700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74By4VFP6muDhpjmdWmKHGLD4Yy
	coNpBJWCa7IVNHJKd7gp/E2lfYBlcHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5toX
	DX9IPkDeyUQOXDfiyvzaOmWduw/e3E1sYadBw1f2sak8P5chJg6ppZHZoBf+WfQnnFb2sLx4qE7
	u/Nip2nxiupRLgcz96CvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113721

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python-sdbus/python-sdbus/releases/tag/0.13.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-sdbus_0.12.0.bb => python3-sdbus_0.13.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-sdbus_0.12.0.bb => python3-sdbus_0.13.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb b/meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb
rename to meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb
index 054e94115..0a84f2d8b 100644
--- a/meta-python/recipes-devtools/python/python3-sdbus_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-sdbus_0.13.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://python-sdbus.readthedocs.io/en/latest/"
 LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=e77986dc8e2ee22d44a7c863e96852ae"
 
-SRC_URI[sha256sum] = "c3692d75704438a78adc1439350bc32f30d6b38ad344cfc94773db89c6ce4a89"
+SRC_URI[sha256sum] = "801bd46608ee82614d42960c8ba8ae9300edb1bf5bbeb534bc8fd21f13d2c20e"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 DEPENDS += "systemd"
-- 
2.34.1


