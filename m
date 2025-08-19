Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0C0CA0EEB
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 20:29:15 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.3831.1755635345870312432
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Aug 2025 13:29:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LvWm/P0q;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: rs@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 57JKT4Cv089282;
	Tue, 19 Aug 2025 15:29:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1755635344;
	bh=tSHUGNfo1W/+O6EX5HCV7GRwtWCYn6iX+4FKwK++pc0=;
	h=From:To:CC:Subject:Date;
	b=LvWm/P0qOvTf33voUbc2z8GqdJDNJpcYzb1refTS+Oe0IPbvZFUDhYlytICExLrOv
	 9qJ1G5P0HmfTxL16tILC1B3vbxT88LGyLTM50JwjwPL7MEK+NirIME3q5pCHixKlBg
	 m+DqNZKDcZToP9m0rXscDLsPHKO9mcNYQMae1Lvk=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 57JKT4vl1525807
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 19 Aug 2025 15:29:04 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 19
 Aug 2025 15:29:04 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 19 Aug 2025 15:29:04 -0500
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 57JKT4bb3573658;
	Tue, 19 Aug 2025 15:29:04 -0500
From: <rs@ti.com>
To: <raj.khem@gmail.com>
CC: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] glm: add nativesdk to BBCLASSEXTEND
Date: Tue, 19 Aug 2025 15:28:49 -0500
Message-ID: <20250819202849.390883-1-rs@ti.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Aug 2025 20:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119006

From: Randolph Sapp <rs@ti.com>

This is a header only package. It may be useful to the native machine
but it is definitely useful for the nativesdk machine.

Signed-off-by: Randolph Sapp <rs@ti.com>
---
 meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
index dd520b245e..a7d27f7fcc 100644
--- a/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
+++ b/meta-oe/recipes-graphics/glm/glm_0.9.9.8.bb
@@ -38,4 +38,4 @@ do_install() {
 
 RDEPENDS:${PN}-dev = ""
 
-BBCLASSEXTEND = "native"
+BBCLASSEXTEND = "native nativesdk"
-- 
2.50.1


