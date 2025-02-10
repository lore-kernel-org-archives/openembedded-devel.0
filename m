Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66E5C021AA
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:01:56 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.46622.1739178112983859191
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:01:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q3Cc6FhZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178112; x=1770714112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=2eswLLP99ITBymkN6MJRQR6FaPEiyw5G9NNtARvicIs=;
  b=q3Cc6FhZ9Ha8uHVGyvJHm5Q0uJwHSHr+p5S7Gp+c7676zGvapg+hXc4t
   m6F5CCp/DZgrdHdk25FM5x7n84Ax38uIHvRUkvTYdGi/g43urTxIAR6xI
   A8C9iNy3TdqZxUWpXhdePdJukFotSOnVDgXSz/ezd2bqTGXtRb7gLM2XF
   rkjw4TkueueCi3IeLNYtiUu9SCkPOUQIIz7mdFKX9pPbZetKCYJP87PMC
   ixP9ueoShNuLOfIVAmb69SS1TctPyLujTEJPvk3cjG/8mKWzyzctXQflS
   XCRhqyX4ltQU5a023a9YrwFxxT2o/Y/sGpHPOWBj8rz5b/bCg2HJ0+sKr
   Q==;
X-CSE-ConnectionGUID: XbGmGhDzR6uFJrIaG4taSw==
X-CSE-MsgGUID: 5W9qpg6lRaSq/Jm1/Cn1Jw==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168346343"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168346343"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:01:50 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4A83AD480A
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15296D88B1
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:48 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id ACC971A0074;
	Mon, 10 Feb 2025 17:01:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 08/66] libdaq: upgrade 3.0.17 -> 3.0.18
Date: Mon, 10 Feb 2025 17:00:37 +0800
Message-Id: <1739178095-26432-8-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115336

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 api: added a new dioctl for snort latency data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.17.bb => libdaq_3.0.18.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.17.bb => libdaq_3.0.18.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb
index 5ca91ced40..3823098f83 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.17.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "4807f58587dee68f402f736b116c2b82a17459f0"
+SRCREV = "fc6f7d729b5ab65081abd3811dcd79a91c463b37"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


