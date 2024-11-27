Return-Path: <a-christidis@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCC1D6D23F
	for <webhook@archiver.kernel.org>; Wed, 27 Nov 2024 21:31:23 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web11.82539.1732743079823752680
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Nov 2024 13:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=suCdTSL5;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: a-christidis@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ARLVIC5648633
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Nov 2024 15:31:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1732743078;
	bh=IyHFTptv+4ucV+B26T1LddaEvX8LVPkltLc9pOIzxos=;
	h=From:To:CC:Subject:Date;
	b=suCdTSL5Pxw7iRly2Ry+Ig6y4fInZd+oDoN9I5r3clmk3Rys7/gSdAX3tKDKoiUMu
	 h3bZ13fyY387mcWByL6PNDgt9kjKXnCXLxY8Fi6hTyk53oMwitdKQCwU74AjALaFjU
	 7utk6KLlurvIRqX2Gcr4LMQILYPUpfewyLVHODfs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ARLVI9D000982
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 Nov 2024 15:31:18 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 27
 Nov 2024 15:31:18 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 27 Nov 2024 15:31:18 -0600
Received: from antonios-ThinkStation-P3-Tower.dhcp.ti.com (antonios-thinkstation-p3-tower.dhcp.ti.com [128.247.81.112])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ARLVIGp109557;
	Wed, 27 Nov 2024 15:31:18 -0600
From: <a-christidis@ti.com>
To: <akuster808@gmail.com>
CC: <rs@ti.com>, <openembedded-devel@lists.openembedded.org>,
        Antonios
 Christidis <a-christidis@ti.com>
Subject: [meta-oe][PATCH] pytesseract: add recipe
Date: Wed, 27 Nov 2024 15:30:49 -0600
Message-ID: <20241127213049.3038391-1-a-christidis@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Nov 2024 21:31:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114097

From: Antonios Christidis <a-christidis@ti.com>

Recipe builds the python module pytessereact, version 0.3.13.

The module is a wrapper for Google's Tesseract-OCR engine.

Signed-off-by: Antonios Christidis <a-christidis@ti.com>
---
 .../python-pytesseract/pytesseract_0.3.13.bb       | 14 ++++++++++++++
 1 file changed, 14 insertions(+)
 create mode 100644 meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb

diff --git a/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
new file mode 100644
index 000000000..ff2814f8c
--- /dev/null
+++ b/meta-python/recipes-extended/python-pytesseract/pytesseract_0.3.13.bb
@@ -0,0 +1,14 @@
+SUMMARY = "Python-tesseract is an optical character recognition (OCR) tool for python. That is, it will recognize and "read" the text embedded in images."
+
+HOMEPAGE = "https://github.com/madmaze/pytesseract"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
+
+SRC_URI[md5sum] = "73f9645e59b437f064d05882b95832ce"
+
+PYPI_PACKAGE = "pytesseract"
+
+inherit pypi setuptools3 
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


