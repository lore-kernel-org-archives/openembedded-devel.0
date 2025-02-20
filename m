Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1367C021AD
	for <webhook@archiver.kernel.org>; Thu, 20 Feb 2025 08:07:50 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.44834.1740038869648131610
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Feb 2025 00:07:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LbxHsWGN;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740038870; x=1771574870;
  h=from:to:cc:subject:date:message-id;
  bh=uM9pCt6sCyln1YmKyki9YmgCNKmkDP/irehabt2iCJc=;
  b=LbxHsWGNqk918h3F4i3h7fEvhNvj6UDxhKKd5yTHM+RHbWnqUOU5tqbZ
   BIEVH/PamwuTxy/qsCe6PDVt5p8NS2IQAN0IeaO3AJb86GTMemBAtesLo
   0PVmwNhM9G/KWMgjirt6yav7UM9kFqRcKvE8mi7MXJlB7gd10EjDTYqXL
   Sy9rv/M6yBdPIpsdWkXSTT0CIJIv2dKaxazt5VL5Oau3bYybuebUhZ5+J
   fXxWaZi2b9jqYf0XJS79j5IuTAUdLYSlWh1NIx38+QgKCTaCaZUKZdGIX
   0CheJJt4Zf8MX+Det26FcYcEhQL7yJSKqCAgYZ1vt+7iJdkR4It+nBrGJ
   Q==;
X-CSE-ConnectionGUID: tSsW1GC2T2SUKgjBCE20tA==
X-CSE-MsgGUID: FvG1YPCuTCOkT4VcA3vs2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="170122389"
X-IronPort-AV: E=Sophos;i="6.13,301,1732546800"; 
   d="scan'208";a="170122389"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 17:07:47 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 50438C2269
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 17:07:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 14AFDD52EE
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 17:07:45 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8A8B01A0003;
	Thu, 20 Feb 2025 16:07:44 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] geoip: fix do_fetch error
Date: Thu, 20 Feb 2025 16:07:39 +0800
Message-Id: <1740038859-6251-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Feb 2025 08:07:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115528

From: Wang Mingyu <wangmy@fujitsu.com>

Change the SRC_URI to the correct value due to the following error:
ERROR: geoip-1.6.12-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://sources.openembedded.org/GeoIP.dat.20181205.gz;apply=no;name=GeoIP-dat;')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index b247823cd4..a054ef0147 100644
--- a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
+++ b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
@@ -11,10 +11,10 @@ SECTION = "libdevel"
 GEOIP_DATABASE_VERSION = "20181205"
 
 SRC_URI = "git://github.com/maxmind/geoip-api-c.git;branch=main;protocol=https \
-           http://sources.openembedded.org/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
-           http://sources.openembedded.org/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
-           http://sources.openembedded.org/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
-           http://sources.openembedded.org/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCityv6-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoIP.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIP-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoIPv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoIPv6-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoLiteCity.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCity-dat; \
+           https://downloads.yoctoproject.org/mirror/sources/GeoLiteCityv6.dat.${GEOIP_DATABASE_VERSION}.gz;apply=no;name=GeoLiteCityv6-dat; \
            file://run-ptest \
 "
 SRCREV = "4b526e7331ca1d692b74a0509ddcc725622ed31a"
-- 
2.43.0


