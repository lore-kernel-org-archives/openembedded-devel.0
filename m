Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D64C4332F
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:21:13 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.45731.1702599669454723022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:21:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="131432507"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="131432507"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:21:06 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0DA7DF09E
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:21:04 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1E5E6D8B0B
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:21:04 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 00A1687164;
	Fri, 15 Dec 2023 09:21:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-traitlets: upgrade 5.13.0 -> 5.14.0
Date: Fri, 15 Dec 2023 08:20:45 +0800
Message-Id: <1702599645-1707-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10--1.042100-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqwwAYdq1VTXo3FC
	0fMeQA5w4sOfGAg2QIwNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt77Fo
	gUQ0vV9iBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SLH12zK6Cmjl/e334LXA1E5DSCTWQt06DzfrcgZvmTqPWltewKMNCarSq6
	ZXueCjWzaZY7tjinzGcGLoe7kd05dI0QahzPRO4S7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107473

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Add option to load traitlets values from environment.
-Update types for mypy 1.7
-chore: update pre-commit hooks
-Clean up lint handling

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-traitlets_5.13.0.bb => python3-traitlets_5.14.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-traitlets_5.13.0.bb => python3-traitlets_5.14.0.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb b/meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb
rename to meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb
index c16c1ef0e..19ea0113a 100644
--- a/meta-python/recipes-devtools/python/python3-traitlets_5.13.0.bb
+++ b/meta-python/recipes-devtools/python/python3-traitlets_5.14.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://ipython.org"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=13bed0ee6f46a6f6dbf1f9f9572f250a"
 
-SRC_URI[sha256sum] = "9b232b9430c8f57288c1024b34a8f0251ddcc47268927367a0dd3eeaca40deb5"
+SRC_URI[sha256sum] = "fcdaa8ac49c04dfa0ed3ee3384ef6dfdb5d6f3741502be247279407679296772"
 
 inherit pypi python_hatchling
 
-- 
2.34.1


