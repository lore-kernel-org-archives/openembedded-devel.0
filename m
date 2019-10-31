Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr770114.outbound.protection.outlook.com [40.107.77.114])
	by mail.openembedded.org (Postfix) with ESMTP id AF5B77FA3F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:36:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=bRZoY0zN0zCJcw0uVrnlBzyXAFCBWuND9xQ0G4VPYtmpMH77/LB7tpCkWikoAHwJm5u2N9Eq4c1H3tUN+SJSI5pyILbfZ6f8xDxhp2BwWXbMSuIOSwW5kyDLT3pg2L5lgQvpyTHCyNKCquill0yauML45eVrN29/Mj2CcoIAibOUnVk6gbjvz43lQ6aFedK9wifOm1UtYps+zwz/x2lA5/CNyTqcZpS3yFnWdaDctEevASWxkoW5/ArmcdiJhZryOYqmZAK+YXCDC3NKTJt+AiWwPPbfJRW6+HFyEkLSRA16m+SLj5aDoa/UJFZZn7Cy4sv+cS91Iz6tSyrZDwS52g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/Te+A7giWftjnOJpMFkeHQjtwN1A9lWXdM6Yu70EunQ=;
	b=DfvOCQyMKCB+cFLh9MyjaVlioSPwBhI7Hor6+KbMmiOIi3lXRDTX/0AlesDJrNCczdcPd5sLgUEn8FcNonQW2tn6MUpHjUSdN4KNMT339G0slqZgJMQtGwkkWPpjc2FyLuQuS/Pug/dXfq+BGE9dK3KCIx1KXOZpFym58GDP/bVOymWNIqyL71bsGFFmzBJ/aTfY316ICEKLVDIcT+faQ4Y3cIIUBn6j8kH2F0T9zRIecnYjDk6HEYSUGxUIaGKqGxtgDH4QheTdhuok85MF7e74vaJwD1R3fOVwSTFefptzPtKOJIiDSE6Bfb7XioVOJd+AM0Nse0JYiw8zCH6tWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=/Te+A7giWftjnOJpMFkeHQjtwN1A9lWXdM6Yu70EunQ=;
	b=Gzx44nsaRyrhZlW/eUXZXNGyNK1FesF/VcDA0RvrwDxpEYdsGtCG8v0eP5HUKYv6hq1XKxvz7TqBm45GTAa4NoZ8TXKG8zac9WqD/T7Jbc8B6RcRVu9y7RjGb/v1iFPBoguAszDOn/ALQnNuDAQ+zJT0i4XOPINIe7iJQC1lfzs=
Received: from SN6PR04CA0101.namprd04.prod.outlook.com (2603:10b6:805:f2::42)
	by DM6PR04MB4937.namprd04.prod.outlook.com (2603:10b6:5:15::14) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.22;
	Thu, 31 Oct 2019 16:36:02 +0000
Received: from BN3NAM01FT010.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e41::206) by SN6PR04CA0101.outlook.office365.com
	(2603:10b6:805:f2::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2408.20 via
	Frontend Transport; Thu, 31 Oct 2019 16:36:02 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	BN3NAM01FT010.mail.protection.outlook.com (10.152.66.245) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2387.28 via Frontend Transport; Thu, 31 Oct 2019 16:36:01 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	olawpa-edge1.garmin.com (10.60.4.227) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 31 Oct 2019 11:35:59 -0500
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:35:59 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.12) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:35:59 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:33:59 -0500
Message-ID: <20191031163358.6087-3-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031163358.6087-1-peter.kolbus@garmin.com>
References: <20191031163358.6087-1-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-0.993000-8.000000-10
X-TMASE-MatchedRID: Uj7tCJGADpxKzaNiN7Y92oY5QY8KaJtTpFneQuQ5zuJBL//DKiVczvSl
	q/vsgUCj1QEUsfUtk/ygxATYtZXsTbZDMuZIpa/+A9lly13c/gHaCn4DqCiXNrZk7gsuflVK+8T
	WQtoYdid9LQinZ4QefPcjNeVeWlqY+gtHj7OwNO0Q+z869mqTM19bqZ4J9RsnOGWmrLeRyKkd55
	4KOYp2DsRzTq6Ox6W8cGBnuSJR7eY8gNNPfV9D9wUM1Ffl54AypMm+3vXm7rJC64ThGKG5gJv/R
	pZfki/udbOeWh4Hcdo9DPAht+JHkAwP0tMr7k2fLRzsXBnGKF6eqD9WtJkSIw==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.993000-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(346002)(396003)(39860400002)(376002)(136003)(189003)(199004)(76130400001)(5660300002)(486006)(44832011)(2870700001)(36756003)(426003)(6916009)(11346002)(2616005)(476003)(446003)(126002)(316002)(336012)(107886003)(2906002)(1076003)(356004)(50466002)(48376002)(305945005)(50226002)(2351001)(86362001)(106002)(51416003)(70206006)(7636002)(4326008)(76176011)(478600001)(186003)(246002)(70586007)(26826003)(26005)(8676002)(54906003)(47776003)(8936002)(7696005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4937;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 207566d2-7714-4d12-7946-08d75e206a71
X-MS-TrafficTypeDiagnostic: DM6PR04MB4937:
X-Microsoft-Antispam-PRVS: <DM6PR04MB49376EF06E7E207FAD4306F5FF630@DM6PR04MB4937.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:152;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +t8QPEGDUAiAfdw5Jo6HYqGV4FfBvdpIecDkQg3aRd+4HsBMfiOlsXrjMzFsrI1LMvHONmEWQqsJZtGHNEOwtqzh+74IEFGq9EuPNhd9Sj+dLUQVTxM8vZkTRPxWkr7o0ttUeVt/NA+AbU2/jUwUHuU+lpl18JWue2OX1D9Wo4p5FprOi8QKRsN4B0aQxDeRxcH2C7qfs+bJmV/Sd0wfYlwQUXCQme+A7LGBxRsI9Zs1GF+MAO1nUlE4nG4kxKPfN3DD4A6HhwdDaW1boOqIgcCKTaB1gr653MaqUuAGPueP/rad0Eu4PIV9LYEer/L7qzQRuRO1ZUo98Ysnd/b780l8Yw6MLh24yhkNTg9jMGnNmNYtXxLU5o9DDpX6YVbAC2gxB05sRUXZiVhGUt62osz+jwkA0MofWE76DfYF0R71Z6FzM4HHQ90tsqTsBoNW
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:36:01.2773 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 207566d2-7714-4d12-7946-08d75e206a71
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4937
Cc: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Subject: [meta-python][morty][PATCH 2/2] python-setuptools-scm: add native to BBCLASSEXTEND
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
X-List-Received-Date: Thu, 31 Oct 2019 16:36:03 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Daniela Plascencia <daniela.plascencia@linux.intel.com>

Enables a native variant of python-setuptools-scm
by adding BBCLASSEXTEND to the recipe.

Signed-off-by: Daniela Plascencia <daniela.plascencia@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

(cherry picked from commit 3aac48c722fa836e04e95a495d758b8ee0d0cdda)

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 .../recipes-devtools/python/python-setuptools-scm_1.15.0.bb | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
index 45204c98c..afbc83ea9 100644
--- a/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
+++ b/meta-python/recipes-devtools/python/python-setuptools-scm_1.15.0.bb
@@ -6,8 +6,10 @@ SRC_URI[md5sum] = "b6916c78ed6253d6602444fad4279c5b"
 SRC_URI[sha256sum] = "daf12d05aa2155a46aa357453757ffdc47d87f839e62114f042bceac6a619e2f"
 
 PYPI_PACKAGE = "setuptools_scm"
-inherit pypi setuptools
 
-RDEPENDS_${PN} = "python-py python-setuptools python-argparse python-debugger python-json"
+RDEPENDS_${PN}_class-target = "python-py python-setuptools python-argparse python-debugger python-json"
+RDEPENDS_${PN}_class-native = "python-setuptools-native"
 
+BBCLASSEXTEND =+ "native"
 
+inherit pypi setuptools
-- 
2.23.0


