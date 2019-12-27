Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2127.outbound.protection.outlook.com
	[40.107.244.127])
	by mail.openembedded.org (Postfix) with ESMTP id 207BB6C3AA
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:11:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=MK7mutZBeXlc/QmUxcj8EL6qITLdZqIwafuAQE9p+d6ahpjBLsfjA4vKH1r1+KcWDWGlQw2lAmaeObLB4ZhJEyMzMYyHZFPAQGtY6tQZCUP5NWqMxf0tsUfK7baEuapncB+4nq9mgi1ZmUKJ7Fdr6gSKRBl9OdLIi1rT3i1HnUFhOxW77ESRF6fV9EUcwE4lth0vjsWnj6iViP2oQ1BmfHZnP/+cGCpbukLFaD1FJp7SpoRgV6JxVN1eQ/sHDk1bgU+aw8Mobt5hbr5oB92iBdmWM1m+ZyjCoMG9lvhfM9Ea1fmNmvke+nHa8k75ltIIyMnAMyfm7UoJ962WskaPyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lR5Ng1JvZnWiDLeEUEU7srFPbvzQHyYw051QanW1bRk=;
	b=oJwyJT5JtaDFQe4LZjjuD9gUlqeFZ6Et3q6xLxVcf+sGxrsvT0lmMt6tT+7tbWuh5SRhIxXrRV+pS9+XGiMD3w/G6peujMBKPAggMrQ5izRX7PGutuWKqgsZocAd9qSXC6VilhKqFynsppL5IsI9HcxM5Aam9M6OnX04z/a8G0uMij9sMtjntGzuZ4ndLE2AsYOIwWJK5YXXLFMhXhNWDDvdUutb5BGDiLtPhwopE93zQaCP8nUsnxbF1kmh+RabdnxOfEkjADAfej8ZDirtp9A6CvPZZd+PWwTlyZcTTlVbHXafmxXQUhFSEf7xBAMSIswZhudWv9wxLwW/r9STQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=lR5Ng1JvZnWiDLeEUEU7srFPbvzQHyYw051QanW1bRk=;
	b=cpSphgkuEaC8h5HCPo/dNVimH+CYpd12sKuzO2BRBU3BA9FJYr14D5S950bJNzv7HSQxmJUtAV90Q7GfkxTC+ykdPY/3w2j1nVcvT3ZIQJBzaYg5E0DrPGiBR0nhQD7i9X0a4f6I+b3XhYjS76UPCjrTaL8OvLopeU+zBozAuUg=
Received: from DM5PR04CA0057.namprd04.prod.outlook.com (2603:10b6:3:ef::19) by
	BY5PR04MB6818.namprd04.prod.outlook.com (2603:10b6:a03:224::12) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11;
	Fri, 27 Dec 2019 17:11:25 +0000
Received: from MW2NAM10FT046.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::209) by DM5PR04CA0057.outlook.office365.com
	(2603:10b6:3:ef::19) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:11:25 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT046.mail.protection.outlook.com (10.13.154.205) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:11:24 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
	olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:11:23 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:11:22 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:11:22 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:11:19 -0600
Message-ID: <20191227171120.10253-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-5.009000-8.000000-10
X-TMASE-MatchedRID: KhOjK47XmXqyQNoUnxiQNAPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWayLuPjffRRF9rJkQt9I7y0yMkq5fGHu2bsT
	aWd4cSvTaD9G1W/26vZsoi2XrUn/Jn6KdMrRsL14qtq5d3cxkNZd/mwLf2BVUM2BKDDdfQI/VKb
	ap4aiEV6ELkH8L8Tbw+xJkJAJLM1zrpcchznD6Bw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.009000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(346002)(136003)(396003)(199004)(189003)(1076003)(2906002)(8936002)(426003)(2616005)(8676002)(316002)(186003)(336012)(6916009)(26005)(5660300002)(246002)(44832011)(4326008)(6666004)(356004)(76130400001)(7696005)(86362001)(70206006)(70586007)(36756003)(7636002)(26826003)(478600001)(107886003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR04MB6818;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5be5ebf2-7dd6-45a6-3f54-08d78aefcdc3
X-MS-TrafficTypeDiagnostic: BY5PR04MB6818:
X-Microsoft-Antispam-PRVS: <BY5PR04MB68182A7383D3158504240C2FFF2A0@BY5PR04MB6818.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qgak2GEWNxr5vjzkExsZRXlstfOGNTaucSH4z4zRvRBmtRV4H0Ipgt3J5/vfdkJ04uC06MTDxSb2VZJHdTfQYkuMxhHUBRcRNgluGJY7/q9F5UGKmEhixFBh9n12lO4YIXqHZ/2ryCxBxPYvjopIFGWdcE9XnLG5dHh9gGJyVpiLu3rEYFhBopzLygy02RMcMn+bvCPEkyHl7xS+klXtQmfNFVMISniMy9/lllItgWUvZibHFV3SkqhXR2cm17JhCwOtatF0DF5rrFqLpDtppcB/7RSTYkcA9T2SvtYMvFt5UJ8ux9mQ7Qiit7eCMNTZ8IAtgqmwnlq4+RhuRyC8Qxh/XDuW9V6ssOKSP346FSMgARHJ0tG5+u6TGw21m/ylXR/BQUW4n+G2h3eX2aquq08QwTotVJ2NKeYLEXejWUcREFSVK6e6Qvb9BQ1vlhNaBFcssgcD3Bt/D058fVUuuTetmH3GntS9z0HAbnsPw2c=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:11:24.8775 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be5ebf2-7dd6-45a6-3f54-08d78aefcdc3
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6818
Subject: [meta-python][PATCH 1/2] python3-booleanpy: add recipe
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Dec 2019 17:11:26 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

boolean.py is a library to define and parse boolean algebras. It is
used by python3-license-expression.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../recipes-devtools/python/python-booleanpy.inc   | 14 ++++++++++++++
 .../python/python3-booleanpy_3.7.bb                |  2 ++
 2 files changed, 16 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-booleanpy.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb

diff --git a/meta-python/recipes-devtools/python/python-booleanpy.inc b/meta-python/recipes-devtools/python/python-booleanpy.inc
new file mode 100644
index 000000000..4484af29b
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-booleanpy.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Define boolean algebras, create and parse boolean expressions and create custom boolean DSL"
+HOMEPAGE = "https://github.com/bastikr/boolean.py"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=7f538584cc3407bf76042def7168548a"
+
+SRC_URI[md5sum] = "1189d115a38f84f5df743014926a9159"
+SRC_URI[sha256sum] = "bd19b412435611ecc712603d0fd7d0e280e24698e7a6e3d5f610473870c5dd1e"
+
+PYPI_PACKAGE = "boolean.py"
+
+inherit pypi
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
new file mode 100644
index 000000000..5f8602d18
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-booleanpy_3.7.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-booleanpy.inc
-- 
2.24.1


