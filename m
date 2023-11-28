Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52FDC4167B
	for <webhook@archiver.kernel.org>; Tue, 28 Nov 2023 08:38:44 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.28508.1701160720116700655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 28 Nov 2023 00:38:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="120586905"
X-IronPort-AV: E=Sophos;i="6.04,233,1695654000"; 
   d="scan'208";a="120586905"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 17:38:37 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6FBD4D3EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:38:35 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BDDECF931
	for <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 17:38:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.149])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95A482FC6F92;
	Tue, 28 Nov 2023 17:38:33 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pychromecast: upgrade 13.0.7 -> 13.0.8
Date: Tue, 28 Nov 2023 16:37:23 +0800
Message-Id: <1701160643-28354-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28024.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28024.006
X-TMASE-Result: 10--1.348300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrcV3n4J/0zUNuakxeLV+a9b6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5Cca
	uYjbfyubA8wYknTHTfOL1RL5DrA6W/pIYSudrs/uALDuFD4c9fUal1rcU2OD2pA5cswoWrTcyPp
	kj+39cuxqOH8hnmZXiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 28 Nov 2023 08:38:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107085

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Change BBC Sounds app_id

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...n3-pychromecast_13.0.7.bb => python3-pychromecast_13.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pychromecast_13.0.7.bb => python3-pychromecast_13.0.8.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb
rename to meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb
index c27d490f4..dff1876c3 100644
--- a/meta-python/recipes-devtools/python/python3-pychromecast_13.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pychromecast_13.0.8.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/balloob/pychromecast"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b1dbd4e85f47b389bdadee9c694669f5"
 
-SRC_URI[sha256sum] = "0de98e9e5be43269dd41efb16126ab0d5ba941ca4acae024329712851c0c0324"
+SRC_URI[sha256sum] = "e4b7523db137f8de05eedcc6154113b68532848629442b448c2334fac966a447"
 
 PYPI_PACKAGE = "PyChromecast"
 
-- 
2.34.1


