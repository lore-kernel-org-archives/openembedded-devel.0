Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9DDC83005
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8608.1685518846368641550
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="106644068"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="106644068"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:47 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A269DAE0B
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:45 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 9DD3114195
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:44 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0ED2868957;
	Wed, 31 May 2023 16:40:44 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-paramiko: upgrade 3.1.0 -> 3.2.0
Date: Wed, 31 May 2023 15:40:15 +0800
Message-Id: <1685518820-20028-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10-2.993100-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr9pLnYtQ99xK3IpruVSJ50r6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w6vYp
	JBS3/1SlRybB/9Ta3ZRQ/q/L9h8ExMz1H71aakSoYR4x1MCi4NeTFzKj72O6BVrN7wXwiNs6Kvm
	El7OFzkSST3Co69hzGCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
https://www.paramiko.org/changelog.html

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-paramiko_3.1.0.bb => python3-paramiko_3.2.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-paramiko_3.1.0.bb => python3-paramiko_3.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
index 70cee849a..f2d8bfe44 100644
--- a/meta-python/recipes-devtools/python/python3-paramiko_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-paramiko_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/paramiko/paramiko/"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fd0120fc2e9f841c73ac707a30389af5"
 
-SRC_URI[sha256sum] = "6950faca6819acd3219d4ae694a23c7a87ee38d084f70c1724b0c0dbb8b75769"
+SRC_URI[sha256sum] = "93cdce625a8a1dc12204439d45033f3261bdb2c201648cfcdc06f9fd0f94ec29"
 
 PYPI_PACKAGE = "paramiko"
 
-- 
2.34.1


