Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
	(mail-mw2nam12on2131.outbound.protection.outlook.com
	[40.107.244.131])
	by mail.openembedded.org (Postfix) with ESMTP id 60BC37FC88
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  2 Jan 2020 18:38:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Os3NgOUsC8wQhlVWKiUrGYfRxxwCm+0rgouavbjt+JALl+ZXcubPi50YRMYWxfBE3NNQyfFtQnzaRwZ3K/0jNAGAMNiAR6j5olm2ad77Lmut6P/JXcZI5GzpQF5Xnelyx46Cn5ByvqfZIIAScCzJ2ttCX2fYUbG18yXkcHwMrbOxEJ6HaC+kDFpoZ9Qy7pVxX2VHrXMFZXh+xKdZC+iQLiSaiYM/nssRrnLo6nl9eiqRSRBHGUhL2jZ2cX04hbhXy2DXf4S3ayohBDO4O/OZU68V7dV6EtasdPf4CxI8FtD5yc9RZ+yCR0YjEVuF43D3TPcxmPKKKVp59ltGFL5brA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JnpY5Vh1SapT9FR8HchxG493ovzdXuba20+NpB1ilBQ=;
	b=WwLBJREZUawnwahCS2anL9CKZgPlAF9IAz5uycIS0CL4xNj3qKW4e8z1e81+QyTXM6Ibv95HPn8FJ+bDe14hZzP5VRlDPZveuOjK9R+ooNDvkiXzRpa6i07k6krVAmZGqTx96yoCM+L5A6jp7YmC7G3XYffgSB7J23nXZqcNaSdYwQIgDK0+1zi4ANUdMn4MB1yu5npKs2Ugg/Mfl73I8G7aVxHfBcFXf8tPWrPyltKruBc86aUBI5g8Cj4SOmFnzHK6LfjP+fWJWCEAcksH2GbY79vHmP+IlCNkhuAPR+D1TkU1sWS7LVNkvn1TAlyJXUjb2MVloRZ/lasmNVpn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JnpY5Vh1SapT9FR8HchxG493ovzdXuba20+NpB1ilBQ=;
	b=dua9Ox1PB3XHa6ZVGsKM26aOzuNioyiod459wzeDF929/da8mVGfhAEPgvwEoarL2j6I5D2mAh6d7JD7RyTX2ornGSanrw+wXgyoOwAbkU8B/ppfUS/FdIf6xIlrg8XeXUTCQJiddbM456f1Smo32OXCwegchoiKQCeqpDiYzVM=
Received: from BN6PR04CA0071.namprd04.prod.outlook.com (2603:10b6:404:8d::21)
	by BN3PR04MB2161.namprd04.prod.outlook.com (2a01:111:e400:c5f0::8)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.12;
	Thu, 2 Jan 2020 18:38:20 +0000
Received: from BN7NAM10FT027.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::206) by BN6PR04CA0071.outlook.office365.com
	(2603:10b6:404:8d::21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.10 via
	Frontend Transport; Thu, 2 Jan 2020 18:38:20 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT027.mail.protection.outlook.com (10.13.157.131) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2602.11 via Frontend Transport; Thu, 2 Jan 2020 18:38:19 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 2 Jan 2020 12:38:18 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 2 Jan 2020 12:38:15 -0600
Received: from localhost.localdomain (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Thu, 2 Jan 2020 12:38:15 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 2 Jan 2020 12:37:43 -0600
Message-ID: <20200102183743.119160-2-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200102183743.119160-1-peter.kolbus@garmin.com>
References: <20200102183743.119160-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25144.001
X-TM-AS-Result: No-9.095500-8.000000-10
X-TMASE-MatchedRID: KH0UlMEvP5MPv5/+N9RjElXXOFXDx25iZAGtCJE23Yi8ag7Kgesih4Cu
	qghmtWfX5RngtX2fL50Hq/7mBVbccoyEjCdqw8f7PwKTD1v8YV6i8D/o42y/Sm933pK2DkkPbIp
	Dlh4PtV1lUt35CvYsdEXxZ0IsVsHpGAdnzrnkM48URSScn+QSXt0H8LFZNFG7hqz53n/yPnoM7Y
	b8F9fYZUkGBX9wDa1oFBDrU9jIW2i4k6LRwOphaGcjFnImzvyS
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.095500-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25144.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(136003)(39860400002)(376002)(346002)(199004)(189003)(6666004)(6916009)(7636002)(356004)(36756003)(2906002)(44832011)(8936002)(70586007)(336012)(8676002)(70206006)(1076003)(186003)(76130400001)(26005)(107886003)(4326008)(5660300002)(426003)(246002)(2616005)(316002)(86362001)(26826003)(478600001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR04MB2161;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 959ca0b3-cb17-4232-0418-08d78fb2f0aa
X-MS-TrafficTypeDiagnostic: BN3PR04MB2161:
X-Microsoft-Antispam-PRVS: <BN3PR04MB2161A7CCA8795752439626BDFF200@BN3PR04MB2161.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0270ED2845
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /03/b/MJsEEM+sS1ynDMPfLjqlIO5Nx6ebTPlTqns2FNSI2jqo8EQ2Vddo1P6OzOhssKYV72Y93uA+SoxRgno31praAO01HeLp5tjHrc9SPAXXn/gdJTgSoIfnKrmglclR4DemKfnNEUpXZpmtqfkkFBfRaVIhqXXn9VKTXqsjugvEFGD4bFijVZXLkEziWmYu3HJ0N7KteC24cb/8N0ePY4ljLOJCiIrsHe+JJY+p+cyKFyMWSkqorhhQWXPs4cQomu5ECI+aMg7md/FpKA+YSS46rL7AXEFHezWH/UlNooEHijtA+yDc5SgltC+HLuypfYP3dRG26W+HrVZmtyUHVsvwItYarnfp5/gS3wJamPeRDdprxu0TG+SvQ5ym3YyDqQUA6Psb3bSrdVDIFuXq2KOrhNRgJwSc3jze2HZUYZxJF8SiKNXPvNE/WRMifAzmBhJzAECJXv3QttE4CqN/zPbu/y27hGkLOXTyHUx2k=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2020 18:38:19.9738 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959ca0b3-cb17-4232-0418-08d78fb2f0aa
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR04MB2161
Subject: [meta-python][PATCH v2 2/2] python3-license-expression: add recipe
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
X-List-Received-Date: Thu, 02 Jan 2020 18:38:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

python3-license-expression is a utility library to parse and work with
license expressions.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../python/python-license-expression.inc         | 16 ++++++++++++++++
 .../python/python3-license-expression_1.0.bb     |  2 ++
 2 files changed, 18 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python-license-expression.inc
 create mode 100644 meta-python/recipes-devtools/python/python3-license-expression_1.0.bb

diff --git a/meta-python/recipes-devtools/python/python-license-expression.inc b/meta-python/recipes-devtools/python/python-license-expression.inc
new file mode 100644
index 000000000..4c35e8dd7
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-license-expression.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
+HOMEPAGE = "https://github.com/nexB/license-expression"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=e23fadd6ceef8c618fc1c65191d846fa"
+
+SRC_URI[md5sum] = "81477f779099f55071c6a7b88a29bb01"
+SRC_URI[sha256sum] = "8aaa455c5b97c4f2174090178b19792b2a1c620e80591aafd4e0a99b713f9e8d"
+
+inherit pypi
+
+RDEPENDS_${PN} += "\
+    ${PYTHON_PN}-booleanpy \
+    "
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
new file mode 100644
index 000000000..10a702ca4
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-license-expression_1.0.bb
@@ -0,0 +1,2 @@
+inherit setuptools3
+require python-license-expression.inc
-- 
2.24.1


