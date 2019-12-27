Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2135.outbound.protection.outlook.com [40.107.92.135])
	by mail.openembedded.org (Postfix) with ESMTP id 849517C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:11:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RkH4TtjeHgkbgKPCcLR8FbOSZCY77ghoyV+c0SxKwSsU/NVqaV/oC2uqRVxt6dEGNfEv1KGKFYrh3R+00os7wHeaiSviJmsh2K+2/JPy96BpyNXmc1/VHO0YrEkFfVkmsnnvhK8Pkx7nDtwBI8jlOMvH/YrxQSM507DNCSb0faFruuLHf4/b8E7oyRDYSDB6gZLXDgxU127PdRduPMlrWwXiqKfCUvyU/NFrN0idx4SLghgT2pbbBo2tEyroHmnQSy65N259xQ8R7QrTqOUZ5NEbGpKEUWjJI25TfzY1OHFPILwN1vNJZvhrZ3qd01szd3fbCSFR9dHgA5Ic3Zf6Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1+bZUVUwOn2/+1w33cvDeCj4SjvAb+mDX/p2OBoiQgQ=;
	b=HEk+a/pzgCGjL3WrpvHdq/FDuzrVmyqTRuZdp60u3brbInwl6P4g3RFz5cPI1oGkdQtUGu9W5g2XbwiTTG1RH5WoA3PfurJ+ZfRAttzBLzLWu6bP26nJEqz7q8q5tETNZoNdNJBiCJgDaxUWXR8OETh8Mx8d95KOo60z8MewxzC/d8a0u3Af+8YN2r2ZHMklFlvsQj+N8CYd/fazFwYwSurm31Q9w6L9xpvAdoj6ITdeCR2wmGy4jRbcn6CXVbk1BeAQO1PTXlX2VfXbL615HluvADMktVNmWfroQ17cl6BSCEXoYtRL+e15hJtj8DSqrc3KD7jWNBn/l0tVaMqk9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=1+bZUVUwOn2/+1w33cvDeCj4SjvAb+mDX/p2OBoiQgQ=;
	b=ekL6SJLsjQerU2G4DiEP6QS3+CYBKhS0GYJwRBx4j97BjVrwYhgSlHyXvK97/Hf3ATF65ozwHXL5GQQLFMQcBy1O7oeWZpbUGleekLcdRfHN++CdxW5OC37TeWYM4wTt3AsCfs5CQZ9u8sG39vvm20GHURnBiToWwGbQa9j1Pb8=
Received: from CY4PR04CA0029.namprd04.prod.outlook.com (2603:10b6:903:c6::15)
	by DM6PR04MB4652.namprd04.prod.outlook.com (2603:10b6:5:23::31) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12;
	Fri, 27 Dec 2019 17:11:34 +0000
Received: from BN7NAM10FT044.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e8a::202) by CY4PR04CA0029.outlook.office365.com
	(2603:10b6:903:c6::15) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:11:34 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN7NAM10FT044.mail.protection.outlook.com (10.13.157.40) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:11:33 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:11:31 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:11:31 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:11:31 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:11:20 -0600
Message-ID: <20191227171120.10253-2-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227171120.10253-1-peter.kolbus@garmin.com>
References: <20191227171120.10253-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-9.095500-8.000000-10
X-TMASE-MatchedRID: xq6LVIEdTcoPv5/+N9RjElXXOFXDx25iZAGtCJE23Yi8ag7Kgesih4Cu
	qghmtWfX5RngtX2fL50Hq/7mBVbccoyEjCdqw8f7PwKTD1v8YV6i8D/o42y/Sm933pK2DkkPbIp
	Dlh4PtV1lUt35CvYsdEXxZ0IsVsHpIqRxG3EBiTfi8zVgXoAltsIJ+4gwXrEtwrbXMGDYqV+ytv
	z1/F3QBa8YkUDRgx/wHVI0K4U2o/GHelMQ/DsR1ZA4zj8TIQ+7Vlxr1FJij9s=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--9.095500-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(346002)(376002)(396003)(136003)(39860400002)(189003)(199004)(70586007)(316002)(7636002)(186003)(26005)(70206006)(86362001)(2906002)(246002)(76130400001)(6666004)(356004)(1076003)(107886003)(8676002)(26826003)(6916009)(336012)(4326008)(8936002)(426003)(2616005)(5660300002)(7696005)(478600001)(36756003)(44832011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4652;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae813888-eccb-4b15-3b30-08d78aefd2f2
X-MS-TrafficTypeDiagnostic: DM6PR04MB4652:
X-Microsoft-Antispam-PRVS: <DM6PR04MB465286560BCFB600E4E8D2ECFF2A0@DM6PR04MB4652.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xnb0d2YPdhJ/UZUitlIJQA+V0o3MmxlhFcEZj47sbpodZyx411hHOO1lyu/HWBWegzD+GV+di3dme8Vl+JV2gSE7/dCR6Hpy9xJEK3Q3VAzohi/VY9FuxMn67S6QGgtHs2U1LdtVNFJWrVhN5202svx2gn7kc/tZ0RWDQSqWCISqO7lLmuwNiR4Al3/PdjvottXkluGR/Yci6tx9PN5rCefJuWK35mmjGP/MFJM326JM98gpBkGweTMwWcZ+piYfcZfk5cKTjMf2eC0n+JujWgee0OMHvwbQlcGbT/JUUv4+Ssynk0SUvwpPM3Ir65BrZ6WhAM62YawYezeqFQaOi0eEtMrh4isPdtEfoZ5bodWsKEKKii4bTgfWJeZZk0+XxFNa9oS6wi9ZlJHtm1L5sLWAVW/Lm19scOaBWeJFIfFbVigP1kDbkfJDbkHAejFvZtFMMhdo0eyOkF651t/c47sGUsRSmrw+hH5FvR3tqLQ=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:11:33.5990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae813888-eccb-4b15-3b30-08d78aefd2f2
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4652
Subject: [meta-python][PATCH 2/2] python3-license-expression: add recipe
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
X-List-Received-Date: Fri, 27 Dec 2019 17:11:37 -0000
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
index 000000000..5b18f2e96
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python-license-expression.inc
@@ -0,0 +1,16 @@
+SUMMARY = "Utility library to parse, compare, simplify and normalize license expressions"
+HOMEPAGE = "https://github.com/nexB/license-expression"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://apache-2.0.LICENSE;md5=7f538584cc3407bf76042def7168548a"
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


