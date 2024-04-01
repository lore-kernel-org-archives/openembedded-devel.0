Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB9BCD129C
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:51:43 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.39482.1711983100184328318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=odtscZEF;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711983100; x=1743519100;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=erCnx9O7urssmLARl6xwgAFCVbXkbRyft1qeq1CEzp8=;
  b=odtscZEFxt3PzPdnRswi5rpwqjq1FuKBSDTwRmOPjnbkbfifIk0LsdSW
   i34eQPXoLdzhtOvgbB36ceAX4YTaskBg0d+JaGJprhp9d7zBXiSVU0C3C
   Qelw1qt/ra3Mv40HlqKUtr2U6CY/Cqhv3Nm7Blg2s6jZtfhoKUa5Wx4si
   fsErVKeFEtFPS8pSbZIizMPpnBOYSiAX83ras5hKH/J5vYbVc2Eea/sC7
   uxBzZUQr23ro08gdLv1vZeDAKzviU9+0AUazKIoVuAhwJLsN5TJjjBnPP
   FVzENof1bXpAa9vg0n2ovmxL9lcehGSuPtd0hX8XIE6Ic5/4dVIrdg5rk
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133563981"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133563981"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:51:38 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id F1FE1E8542
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 39A8FD5006
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B74D820093240
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:51:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D12E1A000A;
	Mon,  1 Apr 2024 22:51:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/47] python3-google-api-python-client: upgrade 2.122.0 -> 2.124.0
Date: Mon,  1 Apr 2024 22:50:53 +0800
Message-Id: <1711983079-16849-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
References: <1711983079-16849-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10-0.228100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbe6jRko7yX9J8uBHhoKqiLrktBpsuhW7taEaqKh8UUsxFVnpKuj81/SZ6kokbMDPMFDlY
	AmoTgxfk2+zpt1jo6WBQ5uaIOS/ZPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109738

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
https://github.com/googleapis/google-api-python-client/releases/tag/v2.124.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.122.0.bb => python3-google-api-python-client_2.124.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.122.0.bb => python3-google-api-python-client_2.124.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.122.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.122.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb
index 364da4a2d..99b07d3e8 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.122.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.124.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "77447bf2d6b6ea9e686fd66fc2f12ee7a63e3889b7427676429ebf09fcb5dcf9"
+SRC_URI[sha256sum] = "f6d3258420f7c76b0f5266b5e402e6f804e30351b018a10083f4a46c3ec33773"
 
 inherit pypi setuptools3
 
-- 
2.34.1


