Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824B8C7EE39
	for <webhook@archiver.kernel.org>; Mon,  5 Jun 2023 07:53:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2111.1685951607497013933
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Jun 2023 00:53:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10731"; a="118957789"
X-IronPort-AV: E=Sophos;i="6.00,217,1681138800"; 
   d="scan'208";a="118957789"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 16:53:27 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 04972D3EAC
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:25 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 47713D9681
	for <openembedded-devel@lists.openembedded.org>; Mon,  5 Jun 2023 16:53:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 678742FC80F4;
	Mon,  5 Jun 2023 16:53:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH] libnet-dns-perl: upgrade 1.38 -> 1.39
Date: Mon,  5 Jun 2023 15:53:00 +0800
Message-Id: <1685951589-29920-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
References: <1685951589-29920-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27672.004
X-TMASE-Result: 10-1.340400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN71Wx2uUbPLdxgNVgGcBlWlGJGXffuLdv6QM
	EyZvn0jR/AGK4wInBMnk48PxckV+kHxPMjOKY7A9wK7mZ44aKbi8z+bJ2nm9UKrauXd3MZDWeY9
	TlJrwFGqH7WCZrFss/h697dyTmdiJ6iekK0H2PY008xRDQ0xWURg8URSJyjXPIafn6GGyKs4M3R
	JOMlFYpd7ORi3fmB2ro4DGSOCid9FPJnXL2yNYdkuo847l05tDEzMyAmsz+FHoWLWlXcsZv
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Jun 2023 07:53:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103114

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix rt.cpan.org #148340 udpsize uninitialized value

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnet/{libnet-dns-perl_1.38.bb => libnet-dns-perl_1.39.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libnet/{libnet-dns-perl_1.38.bb => libnet-dns-perl_1.39.bb} (95%)

diff --git a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.39.bb
similarity index 95%
rename from meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb
rename to meta-perl/recipes-perl/libnet/libnet-dns-perl_1.39.bb
index fcba788fbc..7e57be35cc 100644
--- a/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.38.bb
+++ b/meta-perl/recipes-perl/libnet/libnet-dns-perl_1.39.bb
@@ -9,7 +9,7 @@ DEPENDS += "perl"
 
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/N/NL/NLNETLABS/Net-DNS-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "d8a34341649882d6e2bdf95d046e74c83a150b5e5d818941c1e341f48fba88e0"
+SRC_URI[sha256sum] = "e99cdedf9f0d60dca16f613e488c5b7f123c2fb24b3346d580cfe7da40851ac6"
 
 UPSTREAM_CHECK_REGEX = "Net\-DNS\-(?P<pver>(\d+\.\d+))(?!_\d+).tar"
 
-- 
2.34.1


