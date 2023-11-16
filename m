Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99462C47071
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:31:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2859.1700123467514366164
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:31:08 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139340649"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139340649"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:31:05 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id CCBDCD9D8F
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:31:02 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 16EE0D6027
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:31:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id EBF102FC703D;
	Thu, 16 Nov 2023 17:31:00 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymetno: upgrade 0.11.0 -> 0.12.0
Date: Thu, 16 Nov 2023 16:30:03 +0800
Message-Id: <1700123403-22422-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-0.438600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrHgcbZv4UDykEBa6eAYuoVNAY
	WUo4HSIksbxqMdKjG2XPYHNZ/BmJa6To4yYf7gP2A9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRloMLOoNHsM9q4sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcoWpj8sxR3rVzJyKC7wMJePPZdjn62gQbJ6X8
	KxTA9elGt2/8uE05JuWibQIro5rsgBSE7ATCPjhQS6SXgQFOmAoap73tW3Z9v6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:31:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106798

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-don't overwrite day/night specific conditions
-Remove dependency on pytz
-Use ciso8601 for parsing time when already installed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymetno_0.11.0.bb => python3-pymetno_0.12.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymetno_0.11.0.bb => python3-pymetno_0.12.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
index d66c4c2ce..ae686871e 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d503272f52c35147ec960cb56a03bf4"
 
 SRC_URI = "git://github.com/Danielhiversen/pyMetno.git;protocol=https;branch=master"
-SRCREV = "d7a6161c7765bff19a276b29a6a689a59b03a63c"
+SRCREV = "50f427aad264a4793abb94a3c8cbf987fadcd4ae"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-- 
2.34.1


