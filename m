Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C65AACAC5B4
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=WDhJQGI2;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628691; x=1790164691;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gvu06v2lvBKnQGgvTQY4x0Sd1y6Aimvggje1AFS3bH0=;
  b=WDhJQGI2VVNbTglKByKkt0+qEWJNYN8MwweUE3wne7znXFFAd5jk0ZGl
   WOK8oq4lOVBPsd6TjcMrx7IukNhb68TIIet9WEtSTbtdpAQuLVp4Zj/pY
   S/Ysm0/o/OiUB5WGlZrym1K3ZYBexCctq20swPJ9QYTovX8fz65DXaF/e
   EFaPM+UzruvHXtBj0eYDxwaz08tf3bn9Red5+vjSAnw6u3GKjotAP+2K3
   RyvY7Mi5SqkR/OUm5cCwGx6HRJMcGP2j+/xEnOuPsTcINcl7rLDnGBcfd
   uHl77VDUphGq5B5yGzma3fu/iPOA2i8GtnePmHmsrnmiynNicSU+liles
   Q==;
X-CSE-ConnectionGUID: arG70yVATA6qE9rykKDZDA==
X-CSE-MsgGUID: fob4K+7TSmOpcdpqf3V1cw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821817"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821817"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:11 -0700
X-CSE-ConnectionGUID: 0JagsspgTkqNb6yL0J5UwQ==
X-CSE-MsgGUID: cqRc18d6QbmhWvZbXbDNag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875242"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:10 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 20/24] geoip: fix do_fetch error
Date: Tue, 23 Sep 2025 19:57:23 +0800
Message-ID: <371879bee73e7b69ebc704257094359be8d339b5.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119709

From: Wang Mingyu <wangmy@fujitsu.com>

Change the SRC_URI to the correct value due to the following error:
ERROR: geoip-1.6.12-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://sources.openembedded.org/GeoIP.dat.20181205.gz;apply=no;name=GeoIP-dat;')

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit aadc2ac9dc49dfb5a2066401f22e7b553b324313)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta-networking/recipes-support/geoip/geoip_1.6.12.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-networking/recipes-support/geoip/geoip_1.6.12.bb b/meta-networking/recipes-support/geoip/geoip_1.6.12.bb
index 429cd69d6d..12599f97de 100644
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

