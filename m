Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37977D29FA4
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.40139.1730874690487656887
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=gx8U/hu2;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874691; x=1762410691;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UHmYfQAcYDTcDubASSZvallH1UEvC/bCGRTIEe6Moac=;
  b=gx8U/hu2m/JhPjzxire6qDx1HfTAutz7ul0I40aQPjE3LtG01pnN2wRJ
   ITZ7UV9V8aLoSpXkS9UT+Zd2Z0rE9iGCTOw8Axvm1O2ZJOA0jEpbzG8Ww
   4oVkdNOkV9k8LPtNLK0hggTUKfQGka6NdnIccqoqnzdYYAKpDBGUEzdEo
   Ga5WZW7nBS/j/eTEqcyM4lo/BUuJ0EW26ZTFUHzp0Mw++s3LGv6m8t2qM
   DKvR7iJoR22R8SJI3kO2iV4bgtQuiYJ2glxPrS8NQTJ5SGw7K1Qw2Ty65
   3LDmKXG930Kxc5RYhEXlr1K734jn2POR4vWTyMcf42kv8vDC1yV243Jok
   g==;
X-CSE-ConnectionGUID: AF/LdX1aT+G20Oe9WCVqgA==
X-CSE-MsgGUID: DnQGwho2S1WiutA+Pk/4Vg==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="158171286"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="158171286"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:30 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C4949D8011
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 06B1ED7480
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 99ABA20071A01
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 47AD41A000A;
	Wed,  6 Nov 2024 14:31:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 37/46] python3-smbus2: upgrade 0.4.3 -> 0.5.0
Date: Wed,  6 Nov 2024 14:30:51 +0800
Message-Id: <1730874660-2364-37-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--0.349900-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yTiEPRj9j9rvlHLUcNM85do+lTR7tEvqz76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3AdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXIkJr1dh1IM6IsApcaiXTWg3TZdBY0eo7Mp4q
	D+03e51lwn7Ar/dOLxS7gUJWC50SUEoeq4eWKydIlh1R5C4WFbpBKMlAISPvH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113719

From: Wang Mingyu <wangmy@fujitsu.com>

Chanelog:
=========
- Slight change of SMBus object life-cycle to better handle "open -> close -> open" scenarios.
- Documentation builds again
- Typing corrections.
- Python 3.12, 3.13 added.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-smbus2_0.4.3.bb => python3-smbus2_0.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-smbus2_0.4.3.bb => python3-smbus2_0.5.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb b/meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
rename to meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb
index 779562d04..dc73f915e 100644
--- a/meta-python/recipes-devtools/python/python3-smbus2_0.4.3.bb
+++ b/meta-python/recipes-devtools/python/python3-smbus2_0.5.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=2a3eca2de44816126b3c6f33811a9fba"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "36f2288a8e1a363cb7a7b2244ec98d880eb5a728a2494ac9c71e9de7bf6a803a"
+SRC_URI[sha256sum] = "4a5946fd82277870c2878befdb1a29bb28d15cda14ea4d8d2d54cf3d4bdcb035"
 
 CLEANBROKEN = "1"
 
-- 
2.34.1


