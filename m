Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0038CC47088
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.14489.1650771964949336763
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:46:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23O3k3Bl031644
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:46:04 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 23O3k3c2022669
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 Apr 2022 20:46:03 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sat, 23 Apr 2022 20:46:03 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sat, 23 Apr 2022 20:46:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sat, 23 Apr 2022 20:46:02 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-webserver][PATCH] apache2: correct patch name
Date: Sun, 24 Apr 2022 11:46:00 +0800
Message-ID: <20220424034600.760089-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96750

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
index e5063142c..fd9d096b1 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.53.bb
@@ -18,7 +18,7 @@ SRC_URI = "${APACHE_MIRROR}/httpd/httpd-${PV}.tar.bz2 \
           "
 
 SRC_URI_append_class-target = " \
-           file://0008-apache2-do-not-use-relative-path-for-gen_test_char.patch \
+           file://0010-apache2-do-not-use-relative-path-for-gen_test_char.patch \
            file://init \
            file://apache2-volatile.conf \
            file://apache2.service \
-- 
2.25.1


