Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B622C25B5C
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:27 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.688.1689654378734000118
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="124701693"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="124701693"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:06 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 92873DDC66
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:03 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C675BD5C40
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:02 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4FE0120077821;
	Tue, 18 Jul 2023 13:26:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] libnftnl: upgrade 1.2.5 -> 1.2.6
Date: Tue, 18 Jul 2023 12:25:12 +0800
Message-Id: <1689654348-30702-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10--5.831800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrMVVFhl7NwvOOEENgsUAuYgjJ
	lierVE/njs+GIL5CCDAvggaN3aBNI+1a16oqp8B18t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2muh
	Jl2hdqYHjofbsNE/3cS1h1eUc+p68rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNSAqwXSxSoYzPeNlYzyVW/QzbXHUyrstUpf7ULj/EiRakWKp/6EhZOQ=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103921

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
tests: nft-rule-test: Add test cases to improve code coverage
tests: nft-table-test: fix typo	shixuantong
expr: meta: introduce broute meta expression

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnftnl/{libnftnl_1.2.5.bb => libnftnl_1.2.6.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/libnftnl/{libnftnl_1.2.5.bb => libnftnl_1.2.6.bb} (95%)

diff --git a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
similarity index 95%
rename from meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
rename to meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
index 380a33064b..841a7267b8 100644
--- a/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.5.bb
+++ b/meta-networking/recipes-filter/libnftnl/libnftnl_1.2.6.bb
@@ -7,7 +7,7 @@ SRC_URI = "git://git.netfilter.org/libnftnl;branch=master \
            file://0001-configure.ac-Add-serial-tests.patch \
            file://run-ptest \
            "
-SRCREV = "c62bef65fef638452b4ed1893c2451fc253ca7ca"
+SRCREV = "83dd4dc316b4189d16ead54cd30bfc89e5160cfd"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


