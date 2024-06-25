Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC41BC30658
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.166862.1719305843089878927
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MwnQ4t1o;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305843; x=1750841843;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T+PxtmFdx1YU/Uj5xsXgcDNaceUzmM9aTeDzNvK3/+U=;
  b=MwnQ4t1o4gKczPx1+6hrOL+4d8Ea9URL7JjN1Q3q/gh51wLdVK2a+wOm
   UZyU7BnQ0tGgkqK8Qwjrt+eatLvke9zdGczdUOsjN/E9ssAbaKa0UhSBg
   OMuECOIsQbZJNKctYoWVyxWsIXXg1KE0p6kkYw43B7wEgG0SoYeDQAIeR
   Cr0nQmJo5oZXMfkfgNOG71WRwfsKHZ8RFXDvkrfx14FlNNsoEm4Cn97t5
   RpPWxoTrtwHmRl0u31Kq+D7QXgRa316gNDdrhCs9vKu7zoRsxsuAk48vU
   KhA85LvyDpiK7S9/PHNkX2V0kMJCKZ3KtGMjutOSzANfk6veT+pBeYGHY
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164831347"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164831347"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 19582C9440
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5DA62D50B7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E00F54107B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:17 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D2E71A0002;
	Tue, 25 Jun 2024 16:57:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 32/57] python3-googleapis-common-protos: upgrade 1.63.0 -> 1.63.1
Date: Tue, 25 Jun 2024 16:56:05 +0800
Message-Id: <1719305790-11484-32-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--0.290600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrXKb6k/oWKMKU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa2n7C0ZgG5FLgdVRmAIzhtAo8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXKStOTCjQJ54WD4PUR1TrPkp1ir9k5/V32kmY
	sM5ZGfzs/2yFvYXi0kPASKGCfyiRiBSqxLmw/xdA3qGHNctrlFXAn7vIbNBXr+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111046

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Increase upper limit for protobuf 5.X versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tos_1.63.0.bb => python3-googleapis-common-protos_1.63.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-googleapis-common-protos_1.63.0.bb => python3-googleapis-common-protos_1.63.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb
rename to meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb
index aee233726..7d8af9899 100644
--- a/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.0.bb
+++ b/meta-python/recipes-devtools/python/python3-googleapis-common-protos_1.63.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Apache-2.0;md5=89aea4e17d99a7ca
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "17ad01b11d5f1d0171c06d3ba5c04c54474e883b66b949722b4938ee2694ef4e"
+SRC_URI[sha256sum] = "c6442f7a0a6b2a80369457d79e6672bb7dcbaab88e0848302497e3ec80780a6a"
 
 RDEPENDS:${PN} += "\
     python3-grpcio \
-- 
2.34.1


