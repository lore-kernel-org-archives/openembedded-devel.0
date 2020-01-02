Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2135.outbound.protection.outlook.com
	[40.107.244.135])
	by mail.openembedded.org (Postfix) with ESMTP id 6E1D97FC05
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:38:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=HNzrXIs2tnK9FesvqYdk0zpw9Z97kSaT93zNUBT3dOUZ1yYI9bxOHfZQw6uMJy6mps9vWRCasFyN+F2nLj4SjW6gkR+x4rogtRdctZOcMcA5GHpaL16u/XkwRiNH9siQt8jO2NHIY1/N0rXUCCvpkM5IN8C/1ibYKxM03zGE71cdpHjHukr6jMsYZ3u4nOgwhmK2TUcptI4+JBlrjL/yaIoYqGkAWmE1rXTqDsoOxEKUE6Doz1kdWx9xf0UrsnLGy/z/7unxHzmHGsDji7Ge0wSgX5kHIJf9BLISwtqgZ5+seXmfN5WhkavOWObZAZ8AN05rA5B8PkwqYPq7RW1JSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RjsTmJrhXbwNCl5tRKQxaKOmkFYy+e6+oESUw2nPCNE=;
	b=AdCvg6L4izmQSxpfqB3deYkjYzolOxH4hgYEfjMIB0u78S1jhL1EeDGLRiJrzS78rLjD2CJNKR/lEUfDZ1XMj22cvUJJkIE8hn+tseEF3dYFPNXBIG5CMrOmAVSHaUJfopTDzUUMexp20SFXPw8Q4BEeMuc/eaqYHl4Jdhie5C1LBMr6IEtzED4EVEpN4H/OdpQAd+7vRiXW4hAEBBd52X+gcWweMCQdoMw5A0kP0UEqGtDdXtEZzkQSEPScTNkujSQKz2GaCsVtTAww/sivO5/yWtaHbX43x2YBsDtV/qGG5S+gZ/wd955QduDlMEtefGOgUEgP32H0l3W+NT73Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RjsTmJrhXbwNCl5tRKQxaKOmkFYy+e6+oESUw2nPCNE=;
	b=BAfbwhryL+annXzwVJIuB+lyIaW6AUliI49BVox9IptNxHzRHND/aLzO0xLXKyUM3723nXCIfW1RCw54jmcIYTZR7Fx7Ck3lgvoZwslq0Iv5/+WPAx/gEJ46I39vTgrEYhcztb2enMY7AUJV3QpHhj1KidOHIqcyv85UDbvBNlI=
Received: from CO2PR04CA0122.namprd04.prod.outlook.com (2603:10b6:104:7::24)
	by BY5PR04MB7028.namprd04.prod.outlook.com (2603:10b6:a03:229::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10;
	Thu, 2 Jan 2020 18:38:08 +0000
Received: from BN7NAM10FT057.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::200) by CO2PR04CA0122.outlook.office365.com
	(2603:10b6:104:7::24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12 via
	Frontend Transport; Thu, 2 Jan 2020 18:38:08 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT057.mail.protection.outlook.com (10.13.157.147) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.11 via Frontend Transport; Thu, 2 Jan 2020 18:38:07 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 2 Jan 2020 12:38:06 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 2 Jan 2020 12:38:06 -0600
Received: from localhost.localdomain (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Thu, 2 Jan 2020 12:38:06 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 12:37:42 -0600
Message-ID: <20200102183743.119160-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25144.001
X-TM-AS-Result: No-5.009000-8.000000-10
X-TMASE-MatchedRID: iHV5LEqhnrCyQNoUnxiQNAPZZctd3P4BP6Tki+9nU39XiLrvhpKLfPLX
	3qoNbEngezYFSWzv4Aj++vFBYLLFFaST2xDNHYNWayLuPjffRRF9rJkQt9I7y0yMkq5fGHu2bsT
	aWd4cSvQjSMS5ipXs2oAy6p60ZV62fJ5/bZ6npdg7AFczfjr/7HukET6pcp4A8Uow4PwyRmd8m6
	16dPQkXLctSs4LTuJfsDKaO6dMuIA=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.009000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25144.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(346002)(376002)(39860400002)(136003)(396003)(189003)(199004)(26005)(107886003)(26826003)(36756003)(316002)(5660300002)(70586007)(426003)(186003)(2616005)(336012)(70206006)(6666004)(356004)(1076003)(8676002)(8936002)(7636002)(246002)(86362001)(76130400001)(478600001)(6916009)(2906002)(4326008)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BY5PR04MB7028;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55ba15d4-eae4-4507-ff10-08d78fb2e975
X-MS-TrafficTypeDiagnostic: BY5PR04MB7028:
X-Microsoft-Antispam-PRVS: <BY5PR04MB7028207D6CE955A9442C869BFF200@BY5PR04MB7028.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-Forefront-PRVS: 0270ED2845
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KLIT0v4HDIWWty4EtCVl/o9nFFmghEaFo+bV2pU0x5XhHBh8xLHO1b4BnCEf+M6iYT2rA4M6B0hYVOVik0fW75V9sYgnFm+tVeUzi50FbxLfQbrUWAQWl52usxZ//EdQZ76Qxx6AWEh/T4DkfLVR3H+Kxfj9k5F2dapHVXxf85hIDudteMrsA07LuWyusdn7Fbnc286rlNxRkWeIz6x6mPWmrN1YcHUmxC/MeqYjvMSITkd5Ys/1CoRtFZv5TJdB9x9mFWgHfJE9ov9NkOX79tZpEFzWyvAQ/LYzyakosx8OXKj4YxAOB4DLhcnMDCP53Ar2+A2XKdqOgepxGwtl9hyNF0a5aEgiN+7JIwNX9pStnLzdPyOI0lU9WCEpVF2LXcKBwHzVpdWFeugr5FM432D/XQg94Djx2RsZctLz8zSZ2E0viQ6ywEsbq+0c1p64TU3VffvM5pA7z8lfZF2xk3O0QXM4O8mzqIzd2de1H5I=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2020 18:38:07.8888 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55ba15d4-eae4-4507-ff10-08d78fb2e975
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB7028
Subject: [meta-python][PATCH v2 1/2] python3-booleanpy: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 18:38:14 -0000
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
index 000000000..335d7d396
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-booleanpy.inc
@@ -0,0 +1,14 @@
+SUMMARY = "Define boolean algebras, create and parse boolean expressions and create custom boolean DSL"
+HOMEPAGE = "https://github.com/bastikr/boolean.py"
+
+LICENSE = "BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e319747a5eb94cddf646037c01ddba47"
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


