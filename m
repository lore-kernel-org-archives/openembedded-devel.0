Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B9B8C433F5
	for <webhook@archiver.kernel.org>; Tue, 31 May 2022 08:36:16 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.47069.1653986173805053460
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 01:36:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 24V8aCBU001080
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 01:36:13 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 24V8aB08016838
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 31 May 2022 01:36:12 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 31 May 2022 01:36:11 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 31 May 2022 01:36:10 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] redis: upgrade 7.0-rc3 -> 7.0.0
Date: Tue, 31 May 2022 16:36:09 +0800
Message-ID: <20220531083609.402327-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 31 May 2022 08:36:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97342

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../recipes-extended/redis/{redis_7.0-rc3.bb => redis_7.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/redis/{redis_7.0-rc3.bb => redis_7.0.0.bb} (96%)

diff --git a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb b/meta-oe/recipes-extended/redis/redis_7.0.0.bb
similarity index 96%
rename from meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
rename to meta-oe/recipes-extended/redis/redis_7.0.0.bb
index e977d67f6..3b49d2006 100644
--- a/meta-oe/recipes-extended/redis/redis_7.0-rc3.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.0.0.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://GNU_SOURCE.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "66b2ecc2e4b53c62940589434ea8af3a85546df131001680ed294028cd84ecdc"
+SRC_URI[sha256sum] = "284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.32.0


