Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E4BC001DC
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:27 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.4900.1688699661863249939
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="123740760"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="123740760"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:20 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 33FB3DDC60
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:17 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 6C0D9D9A04
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 804BC881D9;
	Fri,  7 Jul 2023 12:14:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.69.0 -> 0.70.0
Date: Fri,  7 Jul 2023 11:13:47 +0800
Message-Id: <1688699627-2519-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-2.025500-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqydvIILGGRj1b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIJjmdWmKHGLD4Yy
	coNpBJWB6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO3x/F
	0UMEoTu/8cAaGrFf72YRfWejUQ1dJ0RtfhiTgvbs9eFmTNG0zfF/gCahMmQMk21j2E+cGBZxx9n
	S9eDxI5xjQTt80eyE2sqPUEFQ84w/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103706

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
Add support for sending to a specific addr and port with ServiceInfo.async_request and ServiceInfo.request

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.69.0.bb => python3-zeroconf_0.70.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.69.0.bb => python3-zeroconf_0.70.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
index ed849f6546..63be3fe12d 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.70.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "c6520f39f718e6bd16a87e0a7711ff65acfbb11bbc9fabb6283506833e0c3c0f"
+SRC_URI[sha256sum] = "f95ef3643612b1a874cc3b4216d9cb895a0337bf602901f760c3c6027a38d64a"
 
 inherit pypi setuptools3
 
-- 
2.34.1


