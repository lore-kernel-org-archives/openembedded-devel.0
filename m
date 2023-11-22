Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8488C61D92
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 06:39:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13845.1700635166349089215
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Nov 2023 22:39:26 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="140510444"
X-IronPort-AV: E=Sophos;i="6.04,218,1695654000"; 
   d="scan'208";a="140510444"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 15:39:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0388CE4954
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:39:22 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1C696D60EF
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 15:39:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1A3C987FE4;
	Wed, 22 Nov 2023 15:39:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.6.0 -> 13.7.0
Date: Wed, 22 Nov 2023 14:38:25 +0800
Message-Id: <1700635105-8294-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28012.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28012.005
X-TMASE-Result: 10-5.575700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrB8N4SAwGIo4c5SGKNk1CG5Ky
	Pf1j7t432OBZermV4IBqxIBA+EkMG+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQRBg
	61kSK4DiBkESMI05d4lzjFhM9hn+YbZ3DSPtWJmueAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNfk4OBrOKwEoelss3P9U2jhSjdFLcLbzsIxxHJYlrfHDUfCQqzMcJRcxVXoc4/r9xOPOC
	0zuGazgYIiHIlrXBrmORROHJeTY7GgGZNLBHGNe
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Nov 2023 06:39:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107004

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Adds missing parameters to Panel.fit
-Some text goes missing during wrapping when it contains double width characters
-Ensure font is correctly inherited in exported HTML
-Fixed typing for FloatPrompt.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.6.0.bb => python3-rich_13.7.0.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.6.0.bb => python3-rich_13.7.0.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
index b606b4f7a..5a1d5ddb8 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.6.0.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.7.0.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "5c14d22737e6d5084ef4771b62d5d4363165b403455a30a1c8ca39dc7b644bef"
+SRC_URI[sha256sum] = "5cb5123b5cf9ee70584244246816e9114227e0b98ad9176eede6ad54bf5403fa"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


