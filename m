Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FE56C25B67
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 23:45:55 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.136565.1698104754289444610
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 16:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="137063340"
X-IronPort-AV: E=Sophos;i="6.03,246,1694703600"; 
   d="scan'208";a="137063340"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 08:45:52 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F94CD9DA8
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:45:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9D508D3F02
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Oct 2023 08:45:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D4DC870BE1;
	Tue, 24 Oct 2023 08:45:47 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.112.0 -> 0.119.0
Date: Tue, 24 Oct 2023 07:43:07 +0800
Message-Id: <1698104587-32107-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27954.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27954.003
X-TMASE-Result: 10--1.201100-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrjlRp8uau9oY6FHRWx2FGsJYy
	JB//a4n44MzZGX65uBH+ZyPCiB0OuVK4l8RZlJB8fOaYwP8dcX7iUNNpI6ZR4HIdFM7yEaEVvqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgPioIsi7Sa0ggw1mV69cpTMGp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD7q9UFRTJ0kKxEHRux+uk8hxKpvEGAbTDoT3p
	2K2iYaXP7DmknY0A8hkGpm2AFc8URYJmMbkICVqYCEyzeZClTgNHQS07jpaMNn8PscWz4O4SFhM
	szm8+2JbckKof0vQiYK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 23:45:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105705

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Update cibuildwheel to build wheels on latest cython final release
-Reduce size of wheels by excluding generated .c files
-Small improvements to ServiceBrowser performance
-Small cleanups to incoming data handlers
-Reduce type checking overhead at run time
-Ensure ServiceInfo cache is cleared when adding to the registry
-Add missing python definition for addresses_by_version
-Speed up outgoing multicast queue
-Speed up responding to queries
-Improve performance of loading records from cache in ServiceInfo

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-zeroconf_0.112.0.bb => python3-zeroconf_0.119.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.112.0.bb => python3-zeroconf_0.119.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb
index 6ff4fffb08..a62c1b8d99 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.112.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.119.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "f2457ed290c70dbca686b411f2351c3ff9f367afaae668d75cf378e9a439b8aa"
+SRC_URI[sha256sum] = "dbe3548ac0a68ab88241f6ac03bc6b7c19c23160bd78ed4c94ae4d92196be230"
 
 inherit pypi setuptools3
 
-- 
2.34.1


