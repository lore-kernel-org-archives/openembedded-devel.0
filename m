Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B83D29F9B
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:23 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40017.1730874669307463858
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=XWKogQxU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874676; x=1762410676;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=CGnPCskV3FWlCHilKtTpBz2ZiCc2cfiZmi4P954SBm0=;
  b=XWKogQxUpDzx9kkoRpbPGLRmOrHylgN4lqh3U+3yw/69EQ6VN/Pyt0W+
   F/AUC62aYquqwyn8xTPnmfJuA732LlVPE8Kk8Z/ROuj5LQGr/cIuci9nd
   RlJnD3OZ/isDWHz8raW3I/xXGwYqHb7if8FNaD5HsNpXsl2+7MyJJ5XGH
   05r0dRmu596s2o8vQUgRJR6YD4DOJtLAf0yypDFQiH66gYNA60Afgy5PR
   TVxs+XjDz1r0Ejvkq/YzZr8xcO58IPZOF0VkOPl3M983fc440+vCkuEgc
   dJL6P+n1hfy8CDjDttGSpK12rg75URP216YPaBGLsbUQsZXaTRjjGNKlU
   g==;
X-CSE-ConnectionGUID: DucdfVweTRi56W5JUefoUw==
X-CSE-MsgGUID: Ay6b+vuHSu612eRWrVmmHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167636003"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167636003"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 31F10D8016
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:13 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 71958D5B48
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F1AE6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B22971A000A;
	Wed,  6 Nov 2024 14:31:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/46] nvme-cli: upgrade 2.10.2 -> 2.11
Date: Wed,  6 Nov 2024 14:30:27 +0800
Message-Id: <1730874660-2364-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10--1.001700-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3LRPJs/q8vyUIY6
	e+Xi1ah+GOq73doEniIAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz7HBFb3WX3d2uOK
	1E2U2ZM/fxGJmvFGR0FVtrI/Sp4J9X4f7soBDVfXh5pb8BzHkAKl/OoAZC9j8DgZhEg4R8xTxPA
	OhA6AlIiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113696

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/linux-nvme/nvme-cli/releases/tag/v2.11

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../nvme-cli/{nvme-cli_2.10.2.bb => nvme-cli_2.11.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-bsp/nvme-cli/{nvme-cli_2.10.2.bb => nvme-cli_2.11.bb} (96%)

diff --git a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
similarity index 96%
rename from meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb
rename to meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
index 2005a198a..13b7c4227 100644
--- a/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.10.2.bb
+++ b/meta-oe/recipes-bsp/nvme-cli/nvme-cli_2.11.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8264535c0c4e9c6c335635c4026a8022 \
                     file://ccan/licenses/CC0;md5=c17af43b05840255a6fedc5eda9d56cc \
                     file://ccan/licenses/BSD-MIT;md5=838c366f69b72c5df05c96dff79b35f2"
 DEPENDS = "json-c libnvme"
-SRCREV = "eeaa08c9a0e9184f3889df0bff3d2a23db6d6294"
+SRCREV = "9f34fcb12e3ab098e9b30e0f31e92cefb497cc42"
 
 SRC_URI = "git://github.com/linux-nvme/nvme-cli.git;branch=master;protocol=https"
 
-- 
2.34.1


