Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C4FEB8FA2
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:07:25 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.2573.1693966041604715055
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:07:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="109719054"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="109719054"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:07:19 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id EED8FE4289
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:07:16 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 44299D5EAB
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:07:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 53A812FC03EE;
	Wed,  6 Sep 2023 11:07:15 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] unbound: upgrade 1.17.1 -> 1.18.0
Date: Wed,  6 Sep 2023 10:07:03 +0800
Message-Id: <1693966023-15230-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-0.580400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJ6eYPYGCVgy3gcxJAgqZ0ZaDCzqDR7DPYXivwflisSrO63p3Evo7CYlIO
	VA+gJRdKxfbhqGxLk+4Ay6p60ZV62To3UJuRLIoTdB/CxWTRRu+rAZ8KTspSz8Gl60UghLlmwPB
	xU5cGSbX6vWLOwXrcWjtJnxFho3jO42QhwoW+NCgU/loGQN/atULT77xzAvPovNvx9QoC22R2pn
	DrICZkCiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:07:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104768

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../unbound/{unbound_1.17.1.bb => unbound_1.18.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/unbound/{unbound_1.17.1.bb => unbound_1.18.0.bb} (96%)

diff --git a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
similarity index 96%
rename from meta-networking/recipes-support/unbound/unbound_1.17.1.bb
rename to meta-networking/recipes-support/unbound/unbound_1.18.0.bb
index ff3d879ea9..8c650b83b6 100644
--- a/meta-networking/recipes-support/unbound/unbound_1.17.1.bb
+++ b/meta-networking/recipes-support/unbound/unbound_1.18.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5308494bc0590c0cb036afd781d78f06"
 SRC_URI = "git://github.com/NLnetLabs/unbound.git;protocol=https;branch=master \
 	file://0001-contrib-add-yocto-compatible-init-script.patch \
 "
-SRCREV = "90831af981221bbce1cd7b15055562336760e484"
+SRCREV = "3795e374107ac7a5a977c516e144a3cd9b0da998"
 
 inherit autotools pkgconfig systemd update-rc.d
 
-- 
2.34.1


