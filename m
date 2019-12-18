Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam12on2092.outbound.protection.outlook.com [40.107.237.92])
	by mail.openembedded.org (Postfix) with ESMTP id 3B97790DF6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:13:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=oBrYYFG2jIYrJyynUM5GLE8NiC/htbSWooYoAHEQ5+Uf/giMJIHxQv9x8dMRSfruxz3FtYXUcRf5gvbu0yM5n8iilIE+GUExOuTycKGqiBKn+2PZ5E4wyGNS2ny55lH03AMlJ42+t/HtTtz+RSvl6iPT9wGK/HHXtVRiKn7EDZP4vYCKdx0pZVKFEx1Ou6BH/yjF8SHzSM9b0LtotM+Zgt4ptvG+DKUHmz2KoNpcj9ocZQHNFuYk2PtVTUAcKTnupczurKF2fN/br7ZksPXecIf3jy8XQbjA+tTmFWqKeY4Y1UuoMgTmOVGrsReAXcUkE0qDjDwgXAoYg7Fv10Ms2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xC9vcgyXaEoU4EOqnv7gcaJezQrCFBFMhaRHEVQglq0=;
	b=KBaPooaHCu+wSjL1W7DFiU0AbgMiiaDt+6E3XAey0qaZpb1Rk2+0QvwP+fgUR0mZPPxDWHx7SPoaQtkd2Xv8YFDytxB5hzYjdlJHQRyV/Hs/dLfPyt05SrC8U6JE65+d34STvDN7jNAv7/3HtyyNpjzKxzM8+34dgZ8I3jH4wg7yhVAR1k/24t/cgT9A0jtvS1oq3aLwfxhG3kL4zeSLe6+qXuw1UnefinxpKEwINeW4jBrSaJ8omSqkQqaHYh3cnOT34c7WresI4U0cROa+n8WqPLcz4U24+ZoOhwCSRuKgHe00XGfA2def3IbEDJcph74EM6DXGtPuwsxoNgcM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xC9vcgyXaEoU4EOqnv7gcaJezQrCFBFMhaRHEVQglq0=;
	b=DoGXCwzL8OhYVpGsL51Lbwbe09L7gI07Q/uTmK10yxHhEC2hciRaCMtHXjVDK5lVXVlHDDigXn8L+WNuT8Y9OWMesThAaSdbRy9wWaW2wmjZIPDNz7NmnZVQYrlAPSPQX+JM3RZzVFkAgVbb7nJ3i5dEKBmqAnj6+LiX9xsRht4=
Received: from BY5PR04CA0017.namprd04.prod.outlook.com (2603:10b6:a03:1d0::27)
	by BYAPR04MB4807.namprd04.prod.outlook.com (2603:10b6:a03:14::13)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.17;
	Wed, 18 Dec 2019 20:13:45 +0000
Received: from BN7NAM10FT048.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::200) by BY5PR04CA0017.outlook.office365.com
	(2603:10b6:a03:1d0::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.19 via
	Frontend Transport; Wed, 18 Dec 2019 20:13:45 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT048.mail.protection.outlook.com (10.13.156.199) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14 via Frontend Transport; Wed, 18 Dec 2019 20:13:44 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
	olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Wed, 18 Dec 2019 14:13:43 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Wed, 18 Dec 2019 14:13:43 -0600
Received: from ola-ght37x2-bionic.localdomain (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Wed, 18 Dec 2019 14:13:43 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Dec 2019 14:13:37 -0600
Message-ID: <20191218201337.78070-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25112.002
X-TM-AS-Result: No-5.989300-8.000000-10
X-TMASE-MatchedRID: dVjGLDENAPFveCKWtaLcaDn/wcdfjLjC2gp+A6golza2ZO4LLn5VSoyA
	mEfFkV4+O5AUJ04FeT/j2iOyGc7mHsOQecnAhEpbL8+mpRda1YNZwyvkaeAX+pcFdomgH0lnFEU
	knJ/kEl7dB/CxWTRRu4Gh9SYKzkjuhG2qikEpQGV2u5O9qS2VnxWT6XCNvVyq3PTHBkqRjKtts7
	yTZsTVf/LMeEQE0ctt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.989300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25112.002
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(39860400002)(346002)(376002)(136003)(396003)(189003)(199004)(8676002)(7636002)(186003)(44832011)(2906002)(8936002)(36756003)(107886003)(316002)(5660300002)(26005)(26826003)(478600001)(4326008)(2616005)(70586007)(246002)(1076003)(70206006)(356004)(6666004)(6916009)(336012)(86362001)(76130400001)(426003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4807;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8997e34-b084-416e-4881-08d783f6c8ae
X-MS-TrafficTypeDiagnostic: BYAPR04MB4807:
X-Microsoft-Antispam-PRVS: <BYAPR04MB4807BED9456B3BB0E09067A2FF530@BYAPR04MB4807.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0255DF69B9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Nf1dWdU2EgeGeg4dZS79nPaA2xN5zCzJgfo7kvSpOhTWkgd8Ybu0b9zNJc0eSu22jG1q3q+ggnSi8jLD1022NnXY2KXLI8+s2HM/rfrrs+meXJCRGFjJAx1k9ZczF4z3Oxb13vujbdwM7QEoa5+xeKaLDbO1dDAor3DeDaYnWDlpqEbreB4uy58w47mMZWghLyOMpVkSlypUr2MvPQER8vnIch0CnZQ9gIpxcCLlJ8fQSfHp6uExzlMKoi4NIZARzed/rid22Gi38T8LJCpnYRBcepNNca4PKj/k1I/9bVLQSGrtFV8jg3Jp9UAuFqqk8YEqZVXtcGe/omN7iKfjTts7dfdwiin1m3PmddGUyz1fvrn1US7ZkELHFT6Wo8cUWDWK0o9clADC7/No7NQy1TNBYX3kRIrjIUL2pGQ5MoIRnUd5rgNfN/ooCwswPtlc
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 20:13:44.7052 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8997e34-b084-416e-4881-08d783f6c8ae
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4807
Subject: [meta-python][PATCH] python(3)-requests: add DEPENDS_class-native
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
X-List-Received-Date: Wed, 18 Dec 2019 20:13:48 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Change-Id: Ie8bd80d56da599b29430da65b303d69bba43fdda
---
 .../recipes-devtools/python/python-requests.inc        | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-requests.inc b/meta-python/recipes-devtools/python/python-requests.inc
index 5fe5dc21f..ea2983821 100644
--- a/meta-python/recipes-devtools/python/python-requests.inc
+++ b/meta-python/recipes-devtools/python/python-requests.inc
@@ -23,6 +23,16 @@ RDEPENDS_${PN} += " \
     ${PYTHON_PN}-idna \
 "
 
+DEPENDS_class-native += " \
+    ${PYTHON_PN}-ndg-httpsclient-native \
+    ${PYTHON_PN}-pyasn1-native \
+    ${PYTHON_PN}-pyopenssl-native \
+    ${PYTHON_PN}-pysocks-native \
+    ${PYTHON_PN}-urllib3-native \
+    ${PYTHON_PN}-chardet-native \
+    ${PYTHON_PN}-idna-native \
+"
+
 CVE_PRODUCT = "requests"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.24.1

I have a small handful of recipes that need similar treatment to ensure
the sysroot contains indirect dependencies. If there's a better
approach, please let me know -- my experience with OE and bitbake are
limited.

