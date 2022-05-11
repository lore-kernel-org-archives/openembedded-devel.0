Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B178DC433F5
	for <webhook@archiver.kernel.org>; Wed, 11 May 2022 03:47:28 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web08.6966.1652240846128842301
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 20:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24B3lDnO004260
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 20:47:14 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24B3lCaO006347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 May 2022 20:47:13 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 10 May 2022 20:47:12 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 10 May 2022 20:47:11 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] zabbix: upgrade 5.2.6 -> 6.0.4
Date: Wed, 11 May 2022 11:47:10 +0800
Message-ID: <20220511034710.1185746-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 11 May 2022 03:47:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97031

From: Changqing Li <changqing.li@windriver.com>

This upgrade can fix following CVEs:
CVE-2022-24349
CVE-2022-24917
CVE-2022-24918
CVE-2022-24919

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../zabbix/{zabbix_5.2.6.bb => zabbix_6.0.4.bb}             | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-connectivity/zabbix/{zabbix_5.2.6.bb => zabbix_6.0.4.bb} (92%)

diff --git a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb b/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb
similarity index 92%
rename from meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
rename to meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb
index 66c80758c..583ebac0a 100644
--- a/meta-oe/recipes-connectivity/zabbix/zabbix_5.2.6.bb
+++ b/meta-oe/recipes-connectivity/zabbix/zabbix_6.0.4.bb
@@ -23,13 +23,13 @@ DEPENDS  = "libevent libpcre openldap virtual/libiconv zlib"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/5.2/${BPN}-${PV}.tar.gz \
+SRC_URI = "https://cdn.zabbix.com/zabbix/sources/stable/6.0/${BPN}-${PV}.tar.gz \
     file://0001-Fix-configure.ac.patch \
     file://zabbix-agent.service \
 "
 
-SRC_URI[md5sum] = "31dab3535a1fa212f5724902727f6d4d"
-SRC_URI[sha256sum] = "76cb704f2a04fbc87bb3eff44fa71339c355d467f7bbd8fb53f8927c760e1680"
+SRC_URI[md5sum] = "a4f60d529c18c1332354bddd402b561b"
+SRC_URI[sha256sum] = "5743b6cc2e29d9bd242aa88b2835f3ded0be177509000d84db74e1159c5afa75"
 
 inherit autotools-brokensep linux-kernel-base pkgconfig systemd useradd
 
-- 
2.25.1


