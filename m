Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3843CC30653
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:15 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.167229.1719305832528357893
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=F4xtVBbw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305832; x=1750841832;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fecYacza2jdtgVx/8Ch3xwa8utEZco9a4uTEFQw6xok=;
  b=F4xtVBbw4ydk4wlkt+KMn4TqOi0M/DBl5yBU2oNsC0S8nbO0+2EWPFuY
   ZJwy6JbWOHGHl6wOhp8Fjm7W+j42Ul626QMMrozwrXGtjLUtTZI66YGMH
   MRxurpAkhw4Vtg6Ppo1iVMnsqNcQPDeVqp3Gso+vp96o1opX+4ljNmFU6
   V4nzqBgneKbEI7Sr4exNE5+IjoftpBrsx2M3ujZfnj9Bj7IKXU/lSzgkb
   yCRe/rV75wczIPAUcgpuiV86zkaM9QLrN/WJ6xAHdVPu/i4iZoMnLenk7
   3K1zIt1jsmC34nTJPiCSlft4KbwbCdWA07bWHfQeOSSCs1oTmNGOxGVso
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="143726174"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="143726174"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id A37B3D648A
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1202BF3D7
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 951DAE2A0B
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 42E0A1A000E;
	Tue, 25 Jun 2024 16:57:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 24/57] python3-bandit: upgrade 1.7.8 -> 1.7.9
Date: Tue, 25 Jun 2024 16:55:57 +0800
Message-Id: <1719305790-11484-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--17.550600-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mryiKgKtIyB4pYC5LPd7BvbTjT
	ZRXzvM6xbA5feVU8NEZtV04Bl6mC0kORPTmlwTsU3IFFT9wqfr17tnRTJA7lM+KYpwtG+wHVSEd
	jICvWLcRfrgqNHWErOg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXkZQXc2Em7eJieM
	8JXvayYr5p17kUduMGmD7EwRGvQ1l4HMSQIKmdGZ4CIKY/Hg3AGdQnQSTrKGPEQdG7H66TyOk/y
	0w7JiZo
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111036

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- [pre-commit.ci] pre-commit autoupdate
- New logo for Bandit based on raccoon
- Start testing on Python 3.13
- Updates banner logo so it renders well in dark mode
- Add a sponsor section to README
- Ensure sarif extra is included as part of doc build
- Guard against empty call argument list
- Support configfile in .bandit file

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-bandit_1.7.8.bb => python3-bandit_1.7.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bandit_1.7.8.bb => python3-bandit_1.7.9.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb b/meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb
rename to meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb
index 8b0968857..730bf116a 100644
--- a/meta-python/recipes-devtools/python/python3-bandit_1.7.8.bb
+++ b/meta-python/recipes-devtools/python/python3-bandit_1.7.9.bb
@@ -2,7 +2,7 @@ SUMMARY = "Security oriented static analyser for python code."
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=34400b68072d710fecd0a2940a0d1658"
 
-SRC_URI[sha256sum] = "36de50f720856ab24a24dbaa5fee2c66050ed97c1477e0a1159deab1775eab6b"
+SRC_URI[sha256sum] = "7c395a436743018f7be0a4cbb0a4ea9b902b6d87264ddecf8cfdc73b4f78ff61"
 
 DEPENDS = "python3-pbr-native python3-git python3-pbr python3-pyyaml python3-six python3-stevedore"
 
-- 
2.34.1


