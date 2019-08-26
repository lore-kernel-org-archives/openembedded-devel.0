Return-Path: <danc@opengear.com>
Received: from NAM03-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr800074.outbound.protection.outlook.com [40.107.80.74])
	by mail.openembedded.org (Postfix) with ESMTP id A2B327F658
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2019 04:07:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NnuNHrb+KO/3YGPGQW8An+udeoONsv9OdidD76BcrBUPYgtVCfSEDRRiotVQSJLpmHwrxXlk27DvIbv/GvJ2xohdX+CvE/bSX12DOJh/KUbP1QQpBoe7GUtTtec3v0nM1hm+QbeJJQjjqHY3LA8Z1H4xl2WqqER/Ga0qz3mAX5AyiV1sABfaSCNXmZAmYFLb5xXMZgvU3BBYvT9X890zOqAFNBhJmj7xYXKxSvbfEiMMVLno7RQarG8ELy5QtpIV+RoZW9VEAuGduZ2dC30cCBe4k7VDsoEi82LpZVSAWYKRgkFCIFNhEsIt4Mn3gbPfc/kNAz4jmuiCnj4ePyIoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kqzI64xSZ4atYPz9rwSh1EPB6nRhaULn0ANIDdd9+rQ=;
	b=IMQtjI/yTH5gU0I/hM5mwVwRWjTgDhOOOxUTmmLUbEAqa7b212y8YjIEvDgBwBV3OGRE1XdAikLObF/+2/xKMg5rYlPMKri09z+/4/x2v5GwfrjpLK4Y9VoR5QpBcXJbv/AsCibyFs4PnAtWF+LzI5I33dPlPOvfSEHZ9f/H+JuTaP+v4J+8FuM0Z/D8eEvhcbdSTqxhJ9ljo5pfy7NiFmlM/oHtoBkEJW4iPNDYe8quMD9Bw5YxglsL4M/1gHrVhk2NO2EUUU3ZYxbGjTRwTMEgPbLtBws/5BCm21Ap/QbLHZjqAmh1WX/Nzud/fgFmIkmLmlNdveSKpJCT0tk9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=permerror (sender ip
	is 60.241.24.90)
	smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=opengear.com;
	dmarc=fail (p=none sp=reject pct=100) action=none
	header.from=opengear.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=kqzI64xSZ4atYPz9rwSh1EPB6nRhaULn0ANIDdd9+rQ=;
	b=YOEgCl/hoGF01uw0fNbYGeovUKCZqmzJ4CSmdk+gnjkSyaFBma86iJEbQouleck650e2Sbl19RNklQ/0dQhSqGG3aX6Wj6ONZEBG0w8KUMpUy9auRce22viyVW0NyytshGgfUV434mnB7aPmQVAtCusaPaN6krm/PbrdVaIsRvI=
Received: from DM5PR15CA0036.namprd15.prod.outlook.com (2603:10b6:4:4b::22) by
	CY4PR15MB1941.namprd15.prod.outlook.com (2603:10b6:903:10f::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.21;
	Mon, 26 Aug 2019 04:06:59 +0000
Received: from SN1NAM04FT030.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::209) by DM5PR15CA0036.outlook.office365.com
	(2603:10b6:4:4b::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2199.14 via
	Frontend Transport; Mon, 26 Aug 2019 04:06:59 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT030.mail.protection.outlook.com (10.152.88.150) with
	Microsoft SMTP Server id 15.20.2199.13 via Frontend Transport;
	Mon, 26 Aug 2019 04:06:58 +0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id C4928DFC7E;
	Mon, 26 Aug 2019 14:06:56 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 9EA8440EA94D; Mon, 26 Aug 2019 14:06:56 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Aug 2019 14:06:47 +1000
Message-Id: <20190826040647.26922-1-dan.callaghan@opengear.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(4636009)(39830400003)(346002)(396003)(136003)(376002)(2980300002)(448002)(199004)(189003)(7636002)(48376002)(5660300002)(36906005)(336012)(8676002)(316002)(2616005)(476003)(486006)(44832011)(126002)(426003)(36756003)(356004)(2351001)(1076003)(103686004)(2361001)(4326008)(6266002)(6666004)(107886003)(478600001)(26826003)(70586007)(76130400001)(2906002)(2870700001)(70206006)(52956003)(50466002)(26005)(51416003)(6916009)(47776003)(42186006)(8936002)(246002)(50226002)(305945005)(186003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR15MB1941;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fb067b85-3f99-4fa4-be34-08d729dad791
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328);
	SRVR:CY4PR15MB1941; 
X-MS-TrafficTypeDiagnostic: CY4PR15MB1941:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CY4PR15MB19413028C3DE95AF39321C45B8A10@CY4PR15MB1941.namprd15.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-Forefront-PRVS: 01415BB535
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: qPOi0tP3fN8kpQs7/1a0DIrSNC+rkKm4Iefyz2ipoSTmsF9U7YdPDngV42LLDyVtRs9DFgD58E7yWKgY4QyhcQuXan9RxTn1Eq4InETSA9TM1YoeQBnRflzHfe0OgHrBn/TwDdotiGPgwt/8HyfplIoTS9BgCfcfRF1c2ir2UvOlaVc0cXlAYoAjkFIdLcUb15eqbXE1bzJgzkKQJQOGZ5i9b3HYAKrjSkctO65qDPn+ZEStcqQv6Yy26kpdxKw5FtRrodGh9PTf+ucE7jV6O6ZbffFU5qqppqEuzvYIqIw77oz0EuSNme46rCTXGKv5HV5/o1nbi4DvnonEFCTPoSIhQ4FPKiSPa/zjIvgfEhOOo9nmBt1DKPK/zr7mrd0r3Mj9rZN6Yznycw57npk7ZvwdCWtd5Zvp2NN4lWhMehg=
X-OriginatorOrg: opengear.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2019 04:06:58.8393 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb067b85-3f99-4fa4-be34-08d729dad791
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR15MB1941
Subject: [meta-python][PATCH v2] python3-pystemd: add new recipe
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
X-List-Received-Date: Mon, 26 Aug 2019 04:07:02 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This library provides wrappers around the systemd DBus API for
manipulating systemd services.

Signed-off-by: Dan Callaghan <dan.callaghan@opengear.com>
---
 .../python/python3-pystemd_0.6.0.bb                 | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
new file mode 100644
index 000000000..89d718de6
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pystemd_0.6.0.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python bindings for interacting with systemd over DBus"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[md5sum] = "c5472be419f53f53f5da089ca8c981c0"
+SRC_URI[sha256sum] = "b1fc072c87e3766711f64caf86fd633dca393e20c8a0a37a5058dd70a21d8a14"
+
+DEPENDS = "systemd"
+REQUIRED_DISTRO_FEATURES = "systemd"
+
+inherit pypi setuptools3 distro_features_check
+
+BBCLASSEXTEND = "native"
-- 
2.20.1


