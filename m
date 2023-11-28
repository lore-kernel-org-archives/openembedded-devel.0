Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E857AC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:41:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.28554.1701160909565929383
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:41:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="129236644"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="129236644"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:41:47 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 42841D9DAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:41:45 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8494ECFAAD
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:41:44 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AC0E2FC6F92;
	Tue, 28 Nov 2023 17:41:43 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymisp: upgrade 2.4.178 -> 2.4.179
Date: Tue, 28 Nov 2023 16:40:06 +0800
Message-Id: <1701160806-28448-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--3.450500-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWraunRXEyIhxkd
	Ji18bDYpkD7dBt4dE2mpXR7NA6GzIu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4qHvyg1ZsxTfNrsgG44+2EQHwHAtR9BitK4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcrGXGNsXchcJUIrY+265B6gywSY9q9sT1qh9h
	is2Tj2vg6RW30EAB8DvHLMfgYPNhdhGwuN7Rc1rovYG2SjJpg6MxGxnzVloHP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:41:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107087

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bump deps.
- [misp-objects] Bumped latest version.
- Eml and msg are in sync again.
- Update calls to getStringStream to the public method.
- Avoid confusing error when an auth key is limited to an IP.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.178.bb => python3-pymisp_2.4.179.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.178.bb => python3-pymisp_2.4.179.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb
index e969dbe5b..69c774221 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.178.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.179.bb
@@ -4,7 +4,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
 SRC_URI = "git://github.com/MISP/PyMISP.git;protocol=https;branch=main"
-SRCREV = "3a3096664109639322bff7285956ef7cc376a260"
+SRCREV = "cc6391233c01362a1b4b483c4ea8e67f306e3459"
 S = "${WORKDIR}/git"
 
 inherit python_poetry_core
-- 
2.34.1


