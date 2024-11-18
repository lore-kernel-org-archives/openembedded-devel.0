Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9B69D44001
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:26 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.36713.1731922211155078530
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=AdxfLfC/;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922216; x=1763458216;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BHRwUK6xVzlnwoCe+zc+MSfmU39ZCYt6f+aTexXJJtc=;
  b=AdxfLfC/HnLrwOncxAC626++VvTDa4qbkjfx8VhgkPtlZPVVdqlaTjIR
   U0QzyHH3bjrUEdBa/tNieeIN0+0BAhiAtoKMJwFE2Z5BfepQHasyFM5cz
   iV1P0PX+diFZ38+58f13Fv7znaEVkaYZxOnA/mjUfzYBbUn/v5ElNjOFH
   LXsNl/QZZCASBx3F5GXpSegWaRfqbwuCETVNBYUHgY/5yxV4MI9JwJOl4
   8oEh8I1Cjj+6t9xVDrU/w+N066kG/wWv3/oJhvl8ASY4WACxbQNsFq9as
   xTsCimotwU/YE939Kl6hjfOLPxrGRj8BS1J3lg5ArzBpgNkoglK0mf1o7
   w==;
X-CSE-ConnectionGUID: F40jPxThQ/qqG4mG9+//cg==
X-CSE-MsgGUID: ytVfdZFDRKOdNzrTKzECgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168782721"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168782721"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E9CF7DBB89
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 74DCBD52C9
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1629121FD58
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:13 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id BA2251A01E9;
	Mon, 18 Nov 2024 17:30:12 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/32] python3-httpcore: upgrade 1.0.6 -> 1.0.7
Date: Mon, 18 Nov 2024 17:29:43 +0800
Message-Id: <1731922195-5266-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.048600-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yUIIxwDaU5mrYrZiI7RbsROU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3zndiJkHFMhCnXcc+9Khfko8W
	MkQWv6iV3LAytsQR4e42j49Ftap9ExlblqLlYqXL2bHArNBAYClcsaisax8ojWlTDGSHpz38vMY
	wLz4RmvSVUnGyhUCuWVOxK6dJgAq5p00SpRxjK5pdpm3GbmC83rCyBmsZ+1Z3+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113885

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Support proxy= configuration on ConnectionPool().

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-httpcore_1.0.6.bb => python3-httpcore_1.0.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpcore_1.0.6.bb => python3-httpcore_1.0.7.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb b/meta-python/recipes-devtools/python/python3-httpcore_1.0.7.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb
rename to meta-python/recipes-devtools/python/python3-httpcore_1.0.7.bb
index 43c5629a2..d0ee834b2 100644
--- a/meta-python/recipes-devtools/python/python3-httpcore_1.0.6.bb
+++ b/meta-python/recipes-devtools/python/python3-httpcore_1.0.7.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=1c1f23b073da202e1f4f9e426490210c"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "73f6dbd6eb8c21bbf7ef8efad555481853f5f6acdeaff1edb0694289269ee17f"
+SRC_URI[sha256sum] = "8551cb62a169ec7162ac7be8d4817d561f60e08eaa485234898414bb5a8a0b4c"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.34.1


