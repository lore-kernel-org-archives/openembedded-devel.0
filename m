Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A283C0218B
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:29:23 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.40071.1736843359300513619
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k5s2s2hc;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1736843360; x=1768379360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=M1Bzu3uLS4nR9W3hB3cmxEqGXzKJu91rhy1ywiZnOGM=;
  b=k5s2s2hcg5CZcqDiICvXTd6CdBdNk6xGV8SH2qqdpWFeOnjOVZ92iMgn
   18kf3f09VL7Umsa9f8Ao8Yj08NCNDCQlvKtTz2vsUs2gUm5l3mXGtGbZt
   eZMl0k7TeyM0lG+Vs0G9zRgn6ZmHB4DtlhrrzHae+kIdE4WLTNHUYPJh0
   BFfd/SiA8eecKVEH7XgnzL2PDNRQa38FsrifRMpKXOnRE0T2iNg4KfukT
   Og4erKBw16OwBiKptkHS8mRCPR96EEVC7KD0qkuA36THcmtE2+fVkzCjz
   laDGGPgrTpkhzDSGqnjgUvl1z+ZQVRv2l64Chob1K3bcE5Hc2ucboyAvY
   Q==;
X-CSE-ConnectionGUID: iceb4jydQ36xJjP08XidXA==
X-CSE-MsgGUID: MfacusDHRCGhT5/OicamAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="186435905"
X-IronPort-AV: E=Sophos;i="6.12,313,1728918000"; 
   d="scan'208";a="186435905"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 17:29:17 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 70A1AD6EA5
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 4689AD5093
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D45A96B5DB
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 17:29:14 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 80AD71A006C;
	Tue, 14 Jan 2025 16:29:14 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 29/30] wpan-tools: upgrade 0.9 -> 0.10
Date: Tue, 14 Jan 2025 16:28:48 +0800
Message-Id: <1736843329-4131-29-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
References: <1736843329-4131-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28922.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28922.006
X-TMASE-Result: 10--2.160900-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yb+a7Hw+x9qZcDzcoONn/M4R34ro7k23nU89
	3SeL1XuD4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2aY5ZGw7wyeH0sN
	VRp2fBwwXjQchKpIrqgYUFsN5WfiFrsq/7BhdGyCeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNaQDiwjPc96MqzqrBxY3lT9+EBN2cnWVrXZQo4aonszfsRHaCq403VYju/MoA5nQFQYft
	QyZMysconorkMt+rzwVyYDFsi/s2Pzs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 08:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114875

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Delete unnecessary blank lines

Changelog:
 https://github.com/linux-wpan/wpan-tools/releases/tag/wpan-tools-0.10

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../wpan-tools/{wpan-tools_0.9.bb => wpan-tools_0.10.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-support/wpan-tools/{wpan-tools_0.9.bb => wpan-tools_0.10.bb} (77%)

diff --git a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
similarity index 77%
rename from meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
rename to meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
index 6b83cbd522..a0f9fb8b50 100644
--- a/meta-networking/recipes-support/wpan-tools/wpan-tools_0.9.bb
+++ b/meta-networking/recipes-support/wpan-tools/wpan-tools_0.10.bb
@@ -4,12 +4,12 @@ DESCRIPTION = "This is a set of utils to manage the Linux WPAN stack via \
 netlink interface. This requires recent kernel with nl802154 interface."
 
 LICENSE = "ISC"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4cfd939b1d7e6aba9fcefb7f6e2fd45d"
+LIC_FILES_CHKSUM = "file://COPYING;md5=f008711099e40902ad091ed6396f33ea"
 
 DEPENDS = "libnl"
 
 SRC_URI = "git://github.com/linux-wpan/wpan-tools;branch=master;protocol=https"
-SRCREV = "a316ca2caa746d60817400e5bf646c2820f09273"
+SRCREV = "91b0f038aef2f62cb6a222d190b887fdfd6bc164"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


