Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70860C88CBC
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.3857.1686620460634530100
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:41:01 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="99729200"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="99729200"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:41:00 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id C453DC6811
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:56 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 04EA1CF7C3
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:56 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7036420074724;
	Tue, 13 Jun 2023 10:40:55 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymodbus: upgrade 3.3.0 -> 3.3.1
Date: Tue, 13 Jun 2023 09:40:17 +0800
Message-Id: <1686620422-29962-28-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10--2.116600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrYEpG2D2kcRpcvdqWtCoykvEv
	N7VmAYvMewv/0hNqqEby3PaNahSFEq+CQswOit7PkCThXPqsqitUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcodXXiZmLdhxaTT3H7WeHzGadXNMR1YKBjppb
	aruiFFZvIHtkVw+WrNY881tL9QaGZb/AvinGNKtxN0mkOezKTGoqHYzGNSgPv6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103247

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
  transport fixes and 100% test coverage. (#1580)
  Delay self.loop until connect(). (#1579)
  Added mechanism to determine if server did not start cleanly (#1539)
  Proof transport reconnect works. (#1577)
  Fix non-shared block doc in config.rst. (#1573)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymodbus_3.3.0.bb => python3-pymodbus_3.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymodbus_3.3.0.bb => python3-pymodbus_3.3.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb
index 9b84c4f88..0d90c91d9 100644
--- a/meta-python/recipes-devtools/python/python3-pymodbus_3.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymodbus_3.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=430604f78bee72425da231d42eac9cee"
 DEPENDS += "python3-six-native"
 
-SRC_URI[sha256sum] = "0816a644d0ecc74b488ba9f46f8d6662c4a7272a493f184d2c81c6717fb62355"
+SRC_URI[sha256sum] = "82787121e293f31095c0e9721b3e561a01807a6ac20abcbfb187ce70d24fb40c"
 S = "${WORKDIR}/pymodbus-${PV}"
 
 inherit pypi setuptools3
-- 
2.34.1


