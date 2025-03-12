Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2C21C282EC
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 01:10:35 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web10.26847.1741741828494426728
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 18:10:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Z+H9HSI7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741741828; x=1773277828;
  h=from:to:cc:subject:date:message-id;
  bh=g4lb1nK9nt9QFXRcq7Wzw8r18nxKVL1mdHk84SAm4IM=;
  b=Z+H9HSI7RahnaiVoJS5H27x5V1XzIuKv5aBfixQc/4TvvsLXMnsIwMJL
   nPa7+5SAymfuSF6NxltKF11INmLpLuacDVEIlvSmTCfnjpJFa1uLfMJGn
   oA/eLTcg8a52i7S/jJaJyi+Mx+yGZN4dpMbvDiQoK7bak6du6FrAG9x2G
   Md+KXmD2Q4y2Ju9XqfSkgieAqFDqioxubvNXt5P+ImoqKdn6YG8ZyIgAD
   /GWepslYKOBmeMmuWN2DbbMGNpyHABffP59GLei8fNuzqpz0mQDlwnDXO
   E4Ncw3UyD/5dC+Mxt+gfoYhvm0ZFPb2n4f70WnQxmBFxJg6mL5HiTG7Gv
   Q==;
X-CSE-ConnectionGUID: esABmreGSo+SmpQo1IE+bg==
X-CSE-MsgGUID: xDBpb3hnR3q/bDHKkDSU9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="180737406"
X-IronPort-AV: E=Sophos;i="6.14,240,1736780400"; 
   d="scan'208";a="180737406"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:10:25 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 27FF6D4C3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 10:10:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E120BD8B8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 10:10:23 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 547911A009A;
	Wed, 12 Mar 2025 09:10:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] zabbix: upgrade 6.4.21 -> 7.0.9
Date: Wed, 12 Mar 2025 09:10:15 +0800
Message-Id: <1741741815-14447-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 01:10:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115906

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: replaced the software license with AGPL-3.0-only

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.4.21.bb => zabbix_7.0.9.bb}          | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.4.21.bb => zabbix_7.0.9.bb} (91%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
similarity index 91%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
index 4bfdecbf6d..a7c5478b64 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
@@ -17,17 +17,17 @@ organisations with a few servers and for large companies with a \
 multitude of servers."
 HOMEPAGE = "http://www.zabbix.com/"
 SECTION = "Applications/Internet"
-LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
+LICENSE = "AGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=eb1e647870add0502f8f010b19de32af"
 DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.4/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/7.0/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
-SRC_URI[sha256sum] = "527010dbd45cf204dcd3b38e82df696b908b74f38e8d1ab9bbbb1292e784f394"
+SRC_URI[sha256sum] = "8d7755576f30b5d6099ff5e3574549fc248229c017f9753828565174125069f6"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.43.0


