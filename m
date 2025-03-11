Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B46DC28B2E
	for <webhook@archiver.kernel.org>; Tue, 11 Mar 2025 08:55:49 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.4212.1741683339129975790
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Mar 2025 01:55:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=anelMczI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1741683339; x=1773219339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=gUlKWzeGqv/1QzhVJPHZeUI/Da+NOmMYFhcpzUX9gBk=;
  b=anelMczIuMJDTCJUXGRG7vUV5S7RyZy1RJwrnFPqhir0N3TUh7tOyjvU
   t+OLFF86zVToRIW7NNv4EuBceXNi2BecTLCnuuxTcgyHRbFwrcmvqVCF/
   naKDwwkZPZBw1FAyCpRLWXARSKrxWototkJZGr92oriTZKk0SZWswuCOD
   iT3R2d1jajVfcu8rXGXaxMMqrNV94E/aJ5EBCKopudH8abAw30nbtci8B
   P6OaNsyWUYXndu46fkeRkMhXfQMk4O1oBscBtc7ATRZwADY7tVw1kLPH1
   lE3lwuL4DEVPOh8hU2Y8prFhJ0sSWuSwwGr+Sm8zmAlvPGj30M575NKzq
   A==;
X-CSE-ConnectionGUID: Q/5EqvHzSXC50o/GRWZxkg==
X-CSE-MsgGUID: HocXJt4HS9e9QA84RxRZEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="172140750"
X-IronPort-AV: E=Sophos;i="6.14,238,1736780400"; 
   d="scan'208";a="172140750"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2025 17:55:37 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A7A2DC724
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:35 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2676D4BC0
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 17:55:34 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3E0531A00A0;
	Tue, 11 Mar 2025 16:55:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 36/36] zabbix: upgrade 6.4.21 -> 7.0.9
Date: Tue, 11 Mar 2025 16:55:10 +0800
Message-Id: <1741683310-8681-36-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
References: <1741683310-8681-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Mar 2025 08:55:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115887

From: Wang Mingyu <wangmy@fujitsu.com>

branch 6.4 is removed.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../zabbix/{zabbix_6.4.21.bb => zabbix_7.0.9.bb}            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_6.4.21.bb => zabbix_7.0.9.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
index 4bfdecbf6d..b9c4fcb3b2 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_6.4.21.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_7.0.9.bb
@@ -18,16 +18,16 @@ multitude of servers."
 HOMEPAGE = "http://www.zabbix.com/"
 SECTION = "Applications/Internet"
 LICENSE = "GPL-2.0-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=300e938ad303147fede2294ed78fe02e"
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


