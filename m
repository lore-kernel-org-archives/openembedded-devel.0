Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63F0FC6FA8F
	for <webhook@archiver.kernel.org>; Thu, 24 Aug 2023 08:21:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.6261.1692865296815358863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Aug 2023 01:21:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10811"; a="108742120"
X-IronPort-AV: E=Sophos;i="6.01,195,1684767600"; 
   d="scan'208";a="108742120"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 17:21:34 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A5F0DD29E9
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:21:32 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DF33BD8BB4
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 17:21:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id D65EC2FC5EBE;
	Thu, 24 Aug 2023 17:21:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.0.0.3 -> 68.1.0.0
Date: Thu, 24 Aug 2023 16:21:02 +0800
Message-Id: <1692865262-3072-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27832.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27832.006
X-TMASE-Result: 10-6.356300-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrMVx/3ZYby79RXsXSRyV+gnwP
	NZT6pGXGmC+wH+KoDcp0GLVq9e5VbFRrELTtsome2XSL5bIj73VAI9d/cPL6lpm3OIVSf4P5O5G
	gDUtVs9S8B2XPfPGvpg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXkZQXc2Em7eLhjJ
	yg2kElYHp5QGOMb8EgeTjw/FyRX6S/WXZS/HqJ2rq9UFRTJ0kKxEHRux+uk8irEHfaj14Zyf+K1
	r6Y/VHI5dn9eBCrmalWXOloKLlWheSOJ0P/AgdCOiPJharq49lOQF3SARF5QfCZpQfsgGoRsyN1
	lZCN2MYTtP1fvA7jHIDdLTr2xQ8VS4W/MRhJ1X4=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Aug 2023 08:21:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104583

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Removed code referencing bdist_wininst in install_scripts.
- Promote pyproject.toml’s [tool.setuptools] out of beta.
- Automatically add files listed in Extension.depends to sdists, as long as they
  are contained in the project directory
- Require Python 3.8 or later.
- Made imports in editable installs case-sensitive on case-insensitive filesystems
- Use default encoding to create .pth files with editable_wheel.
- Detects (and complain about) scripts and gui-scripts set via setup.py when
  pyproject.toml does not include them in dynamic.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.0.0.3.bb => python3-types-setuptools_68.1.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.0.0.3.bb => python3-types-setuptools_68.1.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb
index 5a810c795f..f5f23facaa 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.0.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "d57ae6076100b5704b3cc869fdefc671e1baf4c2cd6643f84265dfc0b955bf05"
+SRC_URI[sha256sum] = "2bc9b0c0818f77bdcec619970e452b320a423bb3ac074f5f8bc9300ac281c4ae"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


