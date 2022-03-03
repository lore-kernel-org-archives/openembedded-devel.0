Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2E7C433FE
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:08:44 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.11126.1646316523270435419
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:08:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 223E8bBO001347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 3 Mar 2022 06:08:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 3 Mar 2022 06:08:37 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 3 Mar 2022 06:08:36 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 1/2] python3-pyparsing: add recipe
Date: Thu, 3 Mar 2022 22:08:32 +0800
Message-ID: <20220303140833.5374-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303140833.5374-1-kai.kang@windriver.com>
References: <20220303140833.5374-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 14:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95747

From: Kai Kang <kai.kang@windriver.com>

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python3-pyparsing/python3-pyparsing_3.0.7.bb      | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb

diff --git a/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb
new file mode 100644
index 000000000..30db080e8
--- /dev/null
+++ b/meta-python/recipes-extended/python3-pyparsing/python3-pyparsing_3.0.7.bb
@@ -0,0 +1,11 @@
+SUMMARY = "The pyparsing module is an alternative approach to creating and executing simple grammars."
+HOMEPAGE = "https://github.com/pyparsing/pyparsing/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
+
+SRC_URI[sha256sum] = "18ee9022775d270c55187733956460083db60b37d0d0fb357445f3094eed3eea"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "python3-pprint"
-- 
2.17.1


