Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B20DFC5DF8A
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3282.1787132146453555524
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WI4b5W+E;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132150; x=1818668150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tNpmNTrbHN8wYZROYOojvkt7BcMmYVCt9M9JWdgikQ8=;
  b=WI4b5W+EC/MbFZTRaF2lAVPnDTwkABlat822FShwhi1Ao+w6WlfsHxOv
   ONmhAHNXBtHlKntgpbd/wfCBzCN9zUba8Magp8gK0d0YekDFrSZJOIHJ0
   MF+L4smT+xftx0CQwf3GIpMyHKf8gQ/I+q/7tD1mj5ljekoB4WfQfw7ke
   Knr8IRFiwwhncY/W83v8A+zYUgnmKXptCBeU9vAjLSCZpU1xMAOmNUvgi
   5Jn+rRB0+Sj7UT+SvY/cF9M1Hdf8IqVFEsXWVY1U5Mml286htl4rBB2/B
   KaW0xLFZOKAb7rsqsKvXM6Xu+mpi5ZOIkLr5bxiSxSYFR9gwi/LGDGlj9
   A==;
X-CSE-ConnectionGUID: lfR6RXufQeKXWBOZ4wPQBg==
X-CSE-MsgGUID: C3jqUV5CS6eEu8KtNsLFvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251862573"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251862573"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:48 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 725D91C000EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:44 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 24CF910003A0
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 1FB281801C20;
	Wed, 19 Aug 2026 09:35:41 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH 14/70] miniupnpd: upgrade 2.3.10 -> 2.3.11
Date: Wed, 19 Aug 2026 17:34:18 +0800
Message-ID: <20260819093514.1101-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129284

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- fix READNU32 by casting to uint32_t
- filter out non printable characters in description for lease file
- check for the return value of snprintf() : overflow or error
- nftables: Avoid building too long rule with nftnl_rule_nlmsg_build_payload() by triming description to 256 chars.
- HTTPS: Do not abort on SSL errors
- Fix heap overflow in PinholeVerification()
- Free resources on start error
- print usage on stdout or stderr depending on command line
- increase maximum description length when possible (netfilter/nftables)
- fix nfqueue code
- Re-enable port forwarding properly (broken in 2.3.10)
- Fix PCP option size parsing
- Allow using ip/mask when IPv6 is compiled but disabled
- use a 8kB buffer for Netlink as recommended
- fix URL parsing in upnpevents.c

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../miniupnpd/{miniupnpd_2.3.10.bb => miniupnpd_2.3.11.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.3.10.bb => miniupnpd_2.3.11.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
index 91f86659f7..42a654e327 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.10.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.3.11.bb
@@ -14,7 +14,7 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack openssl"
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${BP}.tar.gz;downloadfilename=${BP}.tar.gz \
            file://miniupnpd.service \
            "
-SRC_URI[sha256sum] = "f9c34ed3632fb60cd248dd5897bd98479a103a75688b056ca2f069e68ab32987"
+SRC_URI[sha256sum] = "91994b127da735b2c97f19992e34420648c0e8c4ace8a4bcb0596e7685c48678"
 
 UPSTREAM_CHECK_URI = "https://miniupnp.tuxfamily.org/files/"
 UPSTREAM_CHECK_REGEX = "${BPN}-(?P<pver>\d+(\.\d+)+)\.tar"
-- 
2.43.0


