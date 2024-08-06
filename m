Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92ED8C5473F
	for <webhook@archiver.kernel.org>; Tue,  6 Aug 2024 08:47:08 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2884.1722934017995171001
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Aug 2024 01:46:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C10n2YjL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1722934018; x=1754470018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=EqpNXZTTXaPD3OObn4XnOfkXECQNDL3XN+lf/jotYn0=;
  b=C10n2YjLhzW91jSB/hpiNuxPF3Y634jX28hKhgxY/JXhYP2J3eNYDgCn
   DtdEKvrIq4D63XvCMgzHjhbikEXpRHQ27NQIp0SAqzU9EYLRLZpnvuxXl
   R5dnNprucxTniY5jfFlnCM9AxRdz8uLq6HoME6gVYaIznirpHRt2a6YEc
   cDmSUdLMDr73QhzNx40NvRBiuZrbKwLqesxbvYA7xtjT/RH0vtdY3qlY4
   47+m74zwmGaiV4KF8Yx7cue+CjSVSJ09uQLbtXQLbATjuQOoFDJQP8z7T
   EpTfqvJ+pRlEZ72YMAmzszdKxJUSDAoq3WLLtZkXYUBtcitGFj7+uf72E
   g==;
X-CSE-ConnectionGUID: wiM9t5oNS/SmZN+9laY2NA==
X-CSE-MsgGUID: 1zvDrvcFTLWlhAzo/TCDWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="148811714"
X-IronPort-AV: E=Sophos;i="6.09,267,1716217200"; 
   d="scan'208";a="148811714"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:46:55 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id E4AF6D4240
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C3A9D501C
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:53 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id B9FF52007C3C5
	for <openembedded-devel@lists.openembedded.org>; Tue,  6 Aug 2024 17:46:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6952E1A0002;
	Tue,  6 Aug 2024 16:46:52 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/60] libiodbc: upgrade 3.52.15 -> 3.52.16
Date: Tue,  6 Aug 2024 16:45:48 +0800
Message-Id: <1722933994-32549-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
References: <1722933994-32549-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28578.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28578.006
X-TMASE-Result: 10--1.342500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/ySAWHOR37+ATVBDQSDMig9EH8UzOewTxw+79
	DJRUi35pTQ0JkPG287/mn3xyPJAJogwIsQZbtzZwKwi7MItzaY0QhNjZQYyI3HZonBD1OvODiMD
	6wB/IizJTiBqR6dxgDst+4gG6hwJMYwDOL7t3RyGeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62StGrDAFXIHyCRTPDHCNAltyXDeEZdwOv/pRmNg0bBVUepm3iscn4PclQTX
	KvdZsRUuZVAS3iToceQ5HaxRGgd2duhxYueC+bOS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 Aug 2024 08:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111532

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2023.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libiodbc/{libiodbc_3.52.15.bb => libiodbc_3.52.16.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/libiodbc/{libiodbc_3.52.15.bb => libiodbc_3.52.16.bb} (84%)

diff --git a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
similarity index 84%
rename from meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
rename to meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
index a4b973f3f..644c3ba07 100644
--- a/meta-oe/recipes-support/libiodbc/libiodbc_3.52.15.bb
+++ b/meta-oe/recipes-support/libiodbc/libiodbc_3.52.16.bb
@@ -9,11 +9,11 @@ HOMEPAGE = "http://www.iodbc.org/"
 
 LICENSE = "LGPL-2.0-only | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.LGPL;md5=8c0138a8701f0e1282f5c8b2c7d39114 \
-                    file://LICENSE.BSD;md5=ff3a66a194e500df485da930da7f2c62 \
+                    file://LICENSE.BSD;md5=5b36348a404e1d65b57df8d33fd6e414 \
                     "
 
 SRC_URI = "https://github.com/openlink/iODBC/releases/download/v${PV}/${BP}.tar.gz"
-SRC_URI[sha256sum] = "c74541e3327fc9a1c7ccf103645471c67bc014542d70f572476eb07c0b2dd43c"
+SRC_URI[sha256sum] = "3898b32d07961360f6f2cf36db36036b719a230e476469258a80f32243e845fa"
 
 UPSTREAM_CHECK_URI = "https://github.com/openlink/iODBC/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


