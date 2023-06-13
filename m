Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2794DC88CB9
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:40:53 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.3821.1686620448027044036
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="108574448"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="108574448"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:48 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A50FADAE0E
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:46 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id F0C8EF807
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:45 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 775E520074724;
	Tue, 13 Jun 2023 10:40:45 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-typing: upgrade 3.3.0 -> 3.4.0
Date: Tue, 13 Jun 2023 09:40:03 +0800
Message-Id: <1686620422-29962-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-1.703100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yXg2y0j5vXZGSc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN87gU9YZmSw/4qCLIu0mtIBV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHdbhgH4l2/9pXhWuL8SRsQgqZ2dq9+iC+4wf7yhgMkWnMN+16ZOZ4HEUAR1iGL6A3Swkb
	8XDVK+9udyLF/v9emwBaF3TE4iz2fIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:40:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103232

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-eth-typing_3.3.0.bb => python3-eth-typing_3.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-eth-typing_3.3.0.bb => python3-eth-typing_3.4.0.bb} (53%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb b/meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb
similarity index 53%
rename from meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb
index ad339a22c..a1594fbf5 100644
--- a/meta-python/recipes-devtools/python/python3-eth-typing_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-typing_3.4.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "Common type annotations for ethereum python packages."
 HOMEPAGE = "https://github.com/ethereum/eth-typing"
 SECTION = "devel/python"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bf9691ead96f1163622689e47ce3f366"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "e9535e9d524d4c7a0cbd3d9832093cc5001a3e31869e72645674d24c6376d196"
+SRC_URI[sha256sum] = "7f49610469811ee97ac43eaf6baa294778ce74042d41e61ecf22e5ebe385590f"
 
 inherit pypi setuptools3
-- 
2.34.1


