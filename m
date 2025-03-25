Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD70C35FFC
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 15:23:03 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web11.68483.1742916176763039486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 08:22:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Kxewx96X;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: a-christidis@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFMuwZ1838029
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 10:22:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742916176;
	bh=oZDJ7Fh3ts+LsWB0HcgCI3DyMT+OObTwygpVwNDFI+s=;
	h=From:To:Subject:Date;
	b=Kxewx96X48mXK/56DXiovf9hIgS8xODRg9AKHfap0d1f5HTvfUupIL2Tupk/bSiuO
	 xM9ygFnOZ6yVrLpNIPrjUIZSpTJStqGZfxQyiXFpmzF39+lO8avJXkkop3IrdwAFL+
	 s4JyJyF7XlTHTerAn9j5EBk2WmoR1VdbmuBXw/Y4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 52PFMuCJ079773
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 10:22:56 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 25
 Mar 2025 10:22:55 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Tue, 25 Mar
 2025 10:22:55 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 25 Mar 2025 10:22:55 -0500
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52PFMtRv016641
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 10:22:55 -0500
From: <a-christidis@ti.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-python][master][PATCH] python-pytesseract: Update runtime dependencies
Date: Tue, 25 Mar 2025 10:22:55 -0500
Message-ID: <20250325152255.1229610-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 15:23:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116279

From: Antonios Christidis <a-christidis@ti.com>

The pytesseract library is a wrapper for tesseract, so it should depend
on it on runtime. Also, the pytesseract python script calls for the
packaging module so also include it as a depencency.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../recipes-extended/python-pytesseract/pytesseract_0.3.13.bb   | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
index ff2814f8c2..0d8cfcb408 100644
--- a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
+++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
@@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"
 
+RDEPENDS:${PN}:append = " python3-packaging tesseract"
+
 PYPI_PACKAGE = "pytesseract"
 
 inherit pypi setuptools3 
-- 
2.34.1


