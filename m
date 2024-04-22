Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15207C10F15
	for <webhook@archiver.kernel.org>; Mon, 22 Apr 2024 09:16:21 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.14074.1713777374807290367
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Apr 2024 02:16:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m3+pEyOo;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1713777374; x=1745313374;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=3fyV3vrhDgf/8FaJH8J+RT1kTi1qcwMMQBx6XDzMKwY=;
  b=m3+pEyOoCb+YNGIM2/T+UIn5Yy54mPqSV2spoJZt19lTw1QS69rAp9To
   Nt7ZoibriG5ct4Mee31xq3ftmFXj2mNY2zI85TzK7JLnL4cHKu5rXq+LI
   VssERwylIzc/67qGD9Vf+OHM2ETX2qLettBIxXRjxSKKD/fNWZ9x/TUQL
   ARjtf+I1lRHVwV+v3PiSIqQ3WD4yfYslhUZl1UQS3QK1Gy0nCvVHW9lwR
   QoyihDzz6s27IokblCB4lH7stn5sdWxNhrFjSoTwaAYhQmrtnRL5IbkJF
   cfT05Lso3hOUL5NXjNrMPj47aRnuFO1VJuHQRubZsmNwrQLEgD35bjGSp
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11051"; a="143912742"
X-IronPort-AV: E=Sophos;i="6.07,220,1708354800"; 
   d="scan'208";a="143912742"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2024 18:16:12 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 783B8D6861
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9F8E1590B
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5EF6B20093278
	for <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 18:16:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0999C1A000C;
	Mon, 22 Apr 2024 17:16:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 14/15] python3-yamlloader: upgrade 1.3.2 -> 1.4.1
Date: Mon, 22 Apr 2024 17:15:44 +0800
Message-Id: <1713777345-29264-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
References: <1713777345-29264-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28336.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28336.006
X-TMASE-Result: 10-0.869700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvuebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w46km
	UXijrtERMtQTJ9ei9CrbKl3VxtSs/UsInOcf2PHTmnqamZl/VevDlXX8x3ghnfOCiy6S5BRGBFZ
	8F45r/Tr5pvg0OyrCyCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 22 Apr 2024 09:16:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110096

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix name of ConstructorError
-enh: add python 3.12, cleanup

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-yamlloader_1.3.2.bb => python3-yamlloader_1.4.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-yamlloader_1.3.2.bb => python3-yamlloader_1.4.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb b/meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
rename to meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb
index 93c58c11c..55c48f889 100644
--- a/meta-python/recipes-devtools/python/python3-yamlloader_1.3.2.bb
+++ b/meta-python/recipes-devtools/python/python3-yamlloader_1.4.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/Phynix/yamlloader"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6831ef36faa29329bce2420c5356f97e"
 
-SRC_URI[sha256sum] = "7dbd98421d8090c521655f1b06ca030067f29df5253a8878126bce3a90f56817"
+SRC_URI[sha256sum] = "b6fe40ecf5af596d840e920670ed3475f9813492bf6e55b24f2ad450c212bab5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


