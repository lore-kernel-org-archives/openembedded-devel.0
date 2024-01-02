Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C68FFC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:03:35 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.24240.1704179005535154768
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:03:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="145059938"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="145059938"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:03:23 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F292BD7AC6
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D9316CA27D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 40B5C2008630A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:03:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E2B2C1A0070;
	Tue,  2 Jan 2024 15:03:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] squid: upgrade 6.5 -> 6.6
Date: Tue,  2 Jan 2024 15:03:11 +0800
Message-Id: <1704178991-7862-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--2.324400-10.000000
X-TMASE-MatchedRID: eWs1WpfTtqCjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysJeMOJX8c9nIc7
	DaU6vSPuJIK9qSNJ6womEmZK7ucn9W6N1u5t418jAD5jSg1rFtAU/rbDiDYao9L3QT2Y5506aUX
	s6FguVy2iJGJGoluOFgXURz+hQhGV0DLYtdMjuDcReM8i8p3vgGv34qCfZeB4S6QizeDUeN5wSh
	wbAHj6gM6vT86kYWDVoIo807A/3tamWOD8X0TFhMb6dLbgzMd51QQ6Jx/fflZgDeovr2terganR
	UYx3SG4F9I3HgybRyEyh2C7EeKtCx8TzIzimOwPD16OIL8FA90vM/mydp5vVCq2rl3dzGQ1MDKO
	uO2NaOR5n64m/Q6KDjcs4FK2bqxh+EY8qKlGUM+n5U0ESrmManG9u9eBWf0wo6DnN0U53sJLqLP
	+vYOaC4Bvwg09zE2SqgQYbcz5U7JTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:03:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107994

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Bug 5328: Fix ESI build with libxml2 v2.12.0
- Bug 5319: QOS Netfilter MARK preservation is always disabled
- Bug 5318: peer_digest.cc:399: "fetch->pd && receivedData.data"
- Bug 5317: FATAL attempt to read data from memory
- Bug 5154: Do not open IPv6 sockets when IPv6 is disabled
- FTP: Ignore credentials with a NUL-prefixed username
- log_db_daemon: Fix DSN construction
- Limit the number of allowed X-Forwarded-For hops
- Do not update StoreEntry expiration after errorAppendEntry()
- improve handling of response sending errors

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-daemons/squid/{squid_6.5.bb => squid_6.6.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-daemons/squid/{squid_6.5.bb => squid_6.6.bb} (98%)

diff --git a/meta-networking/recipes-daemons/squid/squid_6.5.bb b/meta-networking/recipes-daemons/squid/squid_6.6.bb
similarity index 98%
rename from meta-networking/recipes-daemons/squid/squid_6.5.bb
rename to meta-networking/recipes-daemons/squid/squid_6.6.bb
index 8d5d1a384..e5053f092 100644
--- a/meta-networking/recipes-daemons/squid/squid_6.5.bb
+++ b/meta-networking/recipes-daemons/squid/squid_6.6.bb
@@ -25,7 +25,7 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${BPN}-${PV}.tar.bz2
 
 SRC_URI:remove:toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
 
-SRC_URI[sha256sum] = "99acd54ec9d68b2a9080d19fcc43eca1a245146cf162dbba689510d01e6d0f25"
+SRC_URI[sha256sum] = "bc73ce506050334f51441f9054ffba4eb7cfd365a5e98a6d178b8263b9222f40"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://errors/COPYRIGHT;md5=d324bc1f9447d1d1588d75b22a678dc4 \
-- 
2.34.1


