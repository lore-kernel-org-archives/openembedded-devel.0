Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
	(mail-eopbgr700096.outbound.protection.outlook.com [40.107.70.96])
	by mail.openembedded.org (Postfix) with ESMTP id 5498B7F9B9
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Oct 2019 16:16:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=NbhMe9nV6ealvUKvIBjjSR4uwkLpJ01QJzMttmsYTpS803/gadVyBOxEoExJM5GwT8IaUANsUG1eslG5wkFPiyhi4RsauAZAiPuOebmcr08fk3hJvybvBhr0xIk/JqMyMLvnTYYPXUQ+xfCR8hb0dRZVotMBe++pKr7OT1WBfICJUt1av7mGhHs/V1Ay0X1o7PSMhH0QHu8aZ+Db/TczHszkXo/H8qw4kWI2UemE4QqM22324TLTQEU1p0lJkvJLjLebOLf3UVGLOF36LKHGDxHZ+hzAORzFx7EfaxjshhcK/GN8Zu7NwONeKZWjRRbYB/YL0zJ18IvE3k030GqBWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BGPdYxHOLvEiAK06mUeaNYBXgLw7h2HES1ay56oZV/E=;
	b=mPj32JSfdV2A1zO2AqrN9pxVjVdAeyV2Mkr4v/1hI8SEJtq0Pv/HfZQ+78E7F1STikzW021qmX3CO58HU8SHauXYgIuvqNd/DiORKhf1OGHkZMC+5rPZigPSU1T9ZDh2MbMHE3mwn1TB7Isv6vRfEx2bJCtTdbXatblDeFQIv3DzNLeZ+BJK3gEhbts7tk0Gy2WaKNesiR3zckX+zsxekFE+RomQSv4iW/MZNlWN8MuPywQR1+/HpA4GF1vgzOPnMhij7E3n9Eh71vYHNhUHiYizTSOW16mhfOkFfxA8mpP1Vi5bMr8OeTrq3ge24FXt/Bf+KlCp4y0ozbBlE5em0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=BGPdYxHOLvEiAK06mUeaNYBXgLw7h2HES1ay56oZV/E=;
	b=Q8PTRhlC+7W5SAGSTE2dVX0u+n5FWZmcNWr1W5siuz9gviLi81d3nJgzJaeEH43yYgQkXCpUz7sMgsRx0UKTxLnxBAr9egd9v7OAFqwihBhquqrVTwjJd5q16X9zTFKTOQ+/YPpagCekq6lHaX+4aoLH4QVEVvMNCGsGI/En/dU=
Received: from CO2PR04CA0096.namprd04.prod.outlook.com (2603:10b6:104:6::22)
	by BYAPR04MB5446.namprd04.prod.outlook.com (2603:10b6:a03:d0::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2387.23;
	Thu, 31 Oct 2019 16:16:33 +0000
Received: from SN1NAM01FT061.eop-nam01.prod.protection.outlook.com
	(2a01:111:f400:7e40::200) by CO2PR04CA0096.outlook.office365.com
	(2603:10b6:104:6::22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2408.20 via
	Frontend Transport; Thu, 31 Oct 2019 16:16:33 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	SN1NAM01FT061.mail.protection.outlook.com (10.152.64.65) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
	15.20.2347.16 via Frontend Transport; Thu, 31 Oct 2019 16:16:33 +0000
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Thu, 31 Oct 2019 11:16:31 -0500
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Thu, 31 Oct 2019 11:16:31 -0500
Received: from ola-ght37x2-bionic.ad.garmin.com (10.5.84.15) by
	smtp.garmin.com (10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2
	via Frontend Transport; Thu, 31 Oct 2019 11:16:32 -0500
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 31 Oct 2019 11:16:16 -0500
Message-ID: <20191031161616.5855-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25014.000
X-TM-AS-Result: No-0.786600-8.000000-10
X-TMASE-MatchedRID: T9MrIRh3fAPNGaPYFjg9zs9R/UqWnLW42gp+A6golzYHZBaLwEXlKIpb
	wG9fIuIT2g/RtVv9ur2bKItl61J/yfJvocwUrWp7FBpuM64i9KELbigRnpKlKTpcQTtiHDgWyTa
	pA8zgL/3aqk/tpY/uXtk1wC0RraWJ6oprZ3EX76/FtHNTcH/wTMfaX9XCAXUgo6pvCt/5OfDVTz
	EbK05vgpGK9KRmm0zYRSFCLi6kLLCQy+lMrBKGwJeqBS9/VV9cyZDK+esyepKB1c9T3S5SbpRMZ
	UCEHkRt
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--0.786600-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25014.000
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(39860400002)(376002)(136003)(346002)(396003)(199004)(189003)(106002)(2351001)(36756003)(26005)(47776003)(4326008)(336012)(26826003)(476003)(5660300002)(48376002)(7696005)(51416003)(4744005)(50466002)(2616005)(6916009)(478600001)(76130400001)(426003)(126002)(2870700001)(186003)(107886003)(8676002)(1076003)(70206006)(246002)(70586007)(50226002)(7636002)(305945005)(2906002)(316002)(86362001)(54906003)(6666004)(44832011)(486006)(8936002)(356004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5446;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867781e0-f286-4202-7a04-08d75e1db24e
X-MS-TrafficTypeDiagnostic: BYAPR04MB5446:
X-Microsoft-Antispam-PRVS: <BYAPR04MB5446D780CA02992C655FF336FF630@BYAPR04MB5446.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:93;
X-Forefront-PRVS: 02070414A1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KzJPExctCbcW9dc5FnklZ2EjLYEhuI9Otw3iS0G/bgO0WazTl5ercidvhR3aJC2hekDTd7+c08zG2XVcG+yKeIFasvSC1YTGeiwj7hvXmROiU+HcIFQkLenO6zxBW7cOZS7E/Qus4idrb0GfSKtz7CpsTxgje+fK/4fYJ2VO+4lFtrdtnj6fbVxDYcfQsW4MPlY+O/vLgYF0PDouGEL9AIn9HY3twDEFXPzMlc8eCS96zCq3N6G3+51pSur4rZdfH3KfIYI8Er+2rw/rJVyPOYqs7a4e42jn3yE+EWuV+Z5pPCu4j4mmTcOA8We2Qbga5gWIpZhRiNCyevtJ1W/TIzHGjOArmmwVBIQhf/wuyTSDxRBcvRzN0RyAJKZzgv/R2sEGG1dKHzFDaON2vNijnc7UENmRjap/H8ZhWfAFmnLFABBAev43PNkLlwulUit8
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2019 16:16:33.3603 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 867781e0-f286-4202-7a04-08d75e1db24e
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5446
Subject: [meta-python][morty][PATCH] python-markupsafe: Extend to build native version too
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
X-List-Received-Date: Thu, 31 Oct 2019 16:16:35 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Khem Raj <raj.khem@gmail.com>

chromium-60+ will need it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

(cherry picked from commit b28aa7fac9631c228bee98cfd2a0edea3c163916)

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-markupsafe_0.23.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
index 396eff102..5c9884b9f 100644
--- a/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
+++ b/meta-python/recipes-devtools/python/python-markupsafe_0.23.bb
@@ -1,2 +1,4 @@
 inherit setuptools
 require python-markupsafe.inc
+
+BBCLASSEXTEND = "native"
-- 
2.23.0


