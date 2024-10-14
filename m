Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2C1CFC535
	for <webhook@archiver.kernel.org>; Mon, 14 Oct 2024 08:56:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.50345.1728896174806757882
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Oct 2024 01:56:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fdvhRx7k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1728896175; x=1760432175;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uwjyHrIkLS7SMb4IyPsf0ZNosk+b9sc58x4CLBY/FJg=;
  b=fdvhRx7kmbbfKeBUIOyoK2OCCO/frKEUw6+lwtbw88jFgPV19sRNGJ5A
   Po5z8IOwfn+incJLQwuDnNFWQtbF+JHD2iIQHvgYmwHApRMCnfD3NEriI
   SUo00ioEglaIhiVFuoDkZKGlBfnxQtM9fKLJRHuzY6KUJAmrPX0ygJYO0
   mg9qDLLrEFW3jLXo7u139P1xtf1YyzkvZGCn973IO3KLSLAO7hiF6FY0P
   6NXsqF2BKrXCyEejur9/HUWvmPSwaicPnvmzmy0rnjJJXcjpWLoMYARu5
   oCaqqI0DtiKDCy5d/xjz8wcQbkMPOJ1e4yDOkSiHSyFJcva8hRc3FBjN9
   A==;
X-CSE-ConnectionGUID: AqoQslEYSkm0gb9k/ElJQQ==
X-CSE-MsgGUID: uuA1HjlOTnmBHtQTx/KEPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11224"; a="178861015"
X-IronPort-AV: E=Sophos;i="6.11,202,1725289200"; 
   d="scan'208";a="178861015"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 17:56:13 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8037CC68E1
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:10 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id CA2A3D5006
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 5586B6B4D4
	for <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 17:56:09 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 0491F1A000A;
	Mon, 14 Oct 2024 16:56:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/54] python3-pymongo: upgrade 4.9.1 -> 4.10.1
Date: Mon, 14 Oct 2024 16:54:56 +0800
Message-Id: <1728896115-2944-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
References: <1728896115-2944-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28730.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28730.006
X-TMASE-Result: 10-0.110900-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwihzBiNqog+8KSS
	Ubjq5NgxBj9xTPxMui3U0dvNBvLe++1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKJOKi1tdfLzxJg+xMERr0NZeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62S7cX6Jy5su23lDHEOZogmiAhCeEcyb18c2hVldfa3C2NIwuEIDKEHrc17X
	xU+BEQF66YOcZBuTrWHRKvZu3NRKdWwE0Y/HM7TS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Oct 2024 08:56:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112887

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fixed a bug where pymongo.results.UpdateResult.did_upsert would raise a TypeError.
- Fixed Binary BSON subtype (9) support on big-endian operating systems (such as zSeries).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.9.1.bb => python3-pymongo_4.10.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.9.1.bb => python3-pymongo_4.10.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb
index 5064032bc..393c0d201 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.10.1.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "b7f2d34390acf60e229c30037d1473fcf69f4536cd7f48f6f78c0c931c61c505"
+SRC_URI[sha256sum] = "a9de02be53b6bb98efe0b9eda84ffa1ec027fcb23a2de62c4f941d9a2f2f3330"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.34.1


