Return-Path: <kai.kang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A25E0C433F5
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 14:08:41 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web09.11125.1646316520752546800
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Mar 2022 06:08:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 223E8di7001353
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 3 Mar 2022 06:08:39 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 223E8diG019110
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 3 Mar 2022 06:08:39 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 3 Mar 2022 06:08:38 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 3 Mar 2022 06:08:38 -0800
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 3 Mar 2022 06:08:37 -0800
From: <kai.kang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH 2/2] python3-pydot: add recipe
Date: Thu, 3 Mar 2022 22:08:33 +0800
Message-ID: <20220303140833.5374-3-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220303140833.5374-1-kai.kang@windriver.com>
References: <20220303140833.5374-1-kai.kang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Mar 2022 14:08:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95745

From: Kai Kang <kai.kang@windriver.com>

Add recipe for python3-pydot which is an interface to Graphviz.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../python3-pydot/python3-pydot_1.4.2.bb              | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb

diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb
new file mode 100644
index 000000000..fde1029c7
--- /dev/null
+++ b/meta-python/recipes-extended/python3-pydot/python3-pydot_1.4.2.bb
@@ -0,0 +1,11 @@
+SUMMARY = "pydot is is an interface to Graphviz."
+HOMEPAGE = "https://github.com/pydot/pydot"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3f6fa041dfcc7ff7747cfceaa34a3180"
+
+SRC_URI[sha256sum] = "248081a39bcb56784deb018977e428605c1c758f10897a339fce1dd728ff007d"
+
+inherit pypi setuptools3
+
+RDEPENDS:${PN} = "graphviz python3-pyparsing"
-- 
2.17.1


