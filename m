Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5A51CD1298
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:32 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.38896.1711982125360974380
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uFd9xvz4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982126; x=1743518126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=P27slhAtFAmZILi2glxOIBnOHeuPUtuJj1PpUIF2OzE=;
  b=uFd9xvz4T3hUjgC+8qUZ+QnHzL4BUGreD3yMNdnXH7Wr4i9kTl+ppdRq
   aAkHDZf10lfNAnUa7nkM0PgECtOfMO5Gu0Q8eIIwVetmXUw7er3L7YIF4
   kwcw1HQuwbfdOji7dinrZcdmBT2T6+xqjnKf9IeHBWrsia0vc+QmktIox
   7MBAMdTNr39pVeBTUgEpVFfYE2EJM2NGlG7GyYVHWRswAkSEB3WqXbRZv
   aVbjAa8vCTNswH+PgtNkt9eP0joYXA7Fj2dgP2fkxAElau1k6ZNpyqdpI
   qhLt2GMXxqWrSlFW7Pk5+kQMWcYzCNkMfgZd8H0PZD6r7D60roHQja4WU
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="133626454"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="133626454"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:23 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C1DDD4800
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DCCBD6237
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CCAF820093263
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 83AEF1A000A;
	Mon,  1 Apr 2024 22:35:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 15/47] python3-eth-rlp: upgrade 2.0.0 -> 2.1.0
Date: Mon,  1 Apr 2024 22:34:32 +0800
Message-Id: <1711982104-16711-15-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--1.085600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr/1vXbkGjWeXuebKrFNJkRb6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74Cu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4VwE
	/ujS6P75XXKGMHU9GbXM2aI8ACgZxbIzILRgOZEnBeFZ9PHhc4klPo2METwVsyzfeQAC3JI5Lej
	Qgld/hna5SsG8AvOjuCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109715

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bump to hexbytes>=1.2.0 and add blocklint to linting

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-rlp_2.0.0.bb => python3-eth-rlp_2.1.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-rlp_2.0.0.bb => python3-eth-rlp_2.1.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
index 5e03625d1..4bdc0c887 100644
--- a/meta-python/recipes-devtools/python/python3-eth-rlp_2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-rlp_2.1.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3d7bdfe69b1ffbde073ca6e96f5c53f7"
 
-SRC_URI[sha256sum] = "70116ec32abd2569fc4ba5f2af80080d896b0dc53a86d582fe1ffa66ecfee308"
+SRC_URI[sha256sum] = "d5b408a8cd20ed496e8e66d0559560d29bc21cee482f893936a1f05d0dddc4a0"
 
 inherit pypi setuptools3
 
-- 
2.34.1


