Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90BAC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:53:06 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.17785.1702543983903409595
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:53:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143315230"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143315230"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:53:01 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 47BE1D687F
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:52:59 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 93EC7D2B23
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:52:58 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5FE702FC6D4F;
	Thu, 14 Dec 2023 17:52:57 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-gmqtt: upgrade 0.6.12 -> 0.6.13
Date: Thu, 14 Dec 2023 16:52:46 +0800
Message-Id: <1702543966-27805-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10-1.621100-10.000000
X-TMASE-MatchedRID: 6e3s/u+cBDSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGEWNbZfbxvwGOwpfLMeBwRuuLG21Eb4T84Fum2PEjqt1o8W
	MkQWv6iV3LAytsQR4e1cppCzPq+1UxlblqLlYqXIrBu9riBEqKV0UbbhbWHSJo1pxYwcXpqeke+
	SQOnBI04Q0A/F2mr8nm8OcEuJF+x3ta2MB86qYlNshSOtkILdfPtLH8Ys2gaH+v9v52ZIoWjoAf
	389xF3XFSk9HhUZnw7OGIWnws4LoyHWPYzouJUy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:53:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107432

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-gmqtt_0.6.12.bb => python3-gmqtt_0.6.13.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-gmqtt_0.6.12.bb => python3-gmqtt_0.6.13.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
rename to meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
index c06e94e7a..101bfb9aa 100644
--- a/meta-python/recipes-devtools/python/python3-gmqtt_0.6.12.bb
+++ b/meta-python/recipes-devtools/python/python3-gmqtt_0.6.13.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/wialon/gmqtt"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=903f1792621a3b35ee546da75d139177"
 
-SRC_URI[sha256sum] = "7df03792343089ae62dc7cd6f8be356861c4fc68768cefa22f3d8de5e7e5be48"
+SRC_URI[sha256sum] = "b4623d3e32ba266e96c04b0871bb057d05414371c1d279550648b390e6ba7577"
 
 inherit pypi setuptools3
 
-- 
2.34.1


