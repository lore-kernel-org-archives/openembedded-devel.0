Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57E85C3600E
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:19 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.61528.1742893334031795773
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KRciqV0S;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893334; x=1774429334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=cWaSFRpHs69wi21kkcqvmdM86kp+SeD4rqGObnuxcCE=;
  b=KRciqV0SI1aGQj48PSctvpDtAqQfHDTVKxUSMuf7ElgdYxDhtL+ES2IP
   L3GUn1QlnwNYe8EilJFovJcBMBH5woD9JrGlSF4N0+gcDtIL0l66cuM6P
   heRvYz1SPGAvMvoQhRR9ewz/UYazlv0dgRV5Iu4tdV7WiEc3TyVIybc8l
   ZZl/AmHAWs/7kKN8esrpFKHcPS07sxZmdNXL6lgQIa2crXBlmSw7J9UqZ
   UO3qxML6p+WU3FkN6gJShvhkhTZhcERGKmdCp2ntmhCg0Ngs3V/5r2UIT
   JhaRrHb1jgSLY3okMPg/cby6VtcR2lvqF/AXGAJi/g0NaNhzP2jBRa8q1
   g==;
X-CSE-ConnectionGUID: dMDtP3srRe+xwFakcXpyUQ==
X-CSE-MsgGUID: JGKj88DPR/y4PlNRmfUyrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="182159808"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="182159808"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:11 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9A3BDDC72D
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:09 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6033FBDCAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:09 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EF6C91A0078;
	Tue, 25 Mar 2025 17:02:08 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 10/45] libdaq: upgrade 3.0.18 -> 3.0.19
Date: Tue, 25 Mar 2025 17:01:17 +0800
Message-Id: <1742893312-3809-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116234

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../daq/{libdaq_3.0.18.bb => libdaq_3.0.19.bb}                  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/daq/{libdaq_3.0.18.bb => libdaq_3.0.19.bb} (92%)

diff --git a/meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
similarity index 92%
rename from meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb
rename to meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
index 3823098f83..a8436ea84d 100644
--- a/meta-networking/recipes-connectivity/daq/libdaq_3.0.18.bb
+++ b/meta-networking/recipes-connectivity/daq/libdaq_3.0.19.bb
@@ -12,7 +12,7 @@ inherit autotools pkgconfig
 SRC_URI = "git://github.com/snort3/libdaq.git;protocol=https;branch=master \
            file://0001-example-Use-lm-for-the-fst-module.patch"
 
-SRCREV = "fc6f7d729b5ab65081abd3811dcd79a91c463b37"
+SRCREV = "434f205cbd45de0961cc42e541b5bf54569e912a"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


