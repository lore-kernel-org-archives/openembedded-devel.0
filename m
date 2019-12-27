Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2115.outbound.protection.outlook.com [40.107.92.115])
	by mail.openembedded.org (Postfix) with ESMTP id 91E7B7C7A9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=gkbHB/p8Ep9p4inNx3POvRbcSLfM9uA0zXZroyRGX6/BV8ULwnl7X2uGHgZja+xjDr9I2f4psZ+ifFqW+Knf0hvemMl8XUUl++WWOH8CtPQXV72aSFrHM3lBlsAf+KwYnMbqLAaxPcGz8BZ/H3OsDw4mHkgcV8lix7shjixA2Xy6JsShKdecFTR2w95Jw4BT2Y/0Mo1o2YiCMn/Ajws1//r0SoSsKNnpKP86a4mYrU1XmdS2T4XL8WriuL0yCZNGEMidcrvwx2+KcBMT2lBkdMu52MGhINYIwvpztpAvzuKuw3rr/BNHve/ubZTRDSslcDUlKfYSd4VbRK/Xe3WfHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CiumvO/ska2aLe5k7GlpPzUqwaCypV3holIMAxOhqBc=;
	b=ZCvLfQ/se47yGYcGpwLkRpkwmgle4J8UsAeoEVF/iJBBwpaBjQRWUH0yyBxcfUCqzf64oH0MpvvkXBma/4MoeSeTAVAvaO1tOr0iUupe38S0v829B0/5ySfbDnHOL1phObl6hyxms4oHO+8YkmUt/E3+hWN7ia3G7w0MFevtupFSGWcXRPf/KSepf9t9K/xyeX7Se+OkTbSGLA5vZ5fs55KPqqsDV2K6rBNZlzNjmyupdWvV3RPudi0pAm82tGfGxgozz54IRz0uvCn4cKCvUeNXdCYnKPCErDWU1Zxc9QhcVMFNJgcBP/Vu3oAo3uBvTcWHUbGdHME8Jg4LV1bJEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=CiumvO/ska2aLe5k7GlpPzUqwaCypV3holIMAxOhqBc=;
	b=PGrgHs0qDeN7YMPGGlPmPdQQiK6byo2qq7s3BNcn4SbqzK7Yl9pNmchrMdfVo2AYFLzVQG9yQiuooWDI4cVHiNxa1UxH43x4wNIaYnisBW5dgb9TLwojNNGc4xvyuIzz6l3kodA0iatQkNa5+FAPtY4pcYl3V3E9vkbZA5D2b9o=
Received: from DM5PR04CA0067.namprd04.prod.outlook.com (2603:10b6:3:ef::29) by
	BN7PR04MB4401.namprd04.prod.outlook.com (2603:10b6:406:f8::20) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.12; Fri, 27 Dec 2019 17:12:58 +0000
Received: from MW2NAM10FT054.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::203) by DM5PR04CA0067.outlook.office365.com
	(2603:10b6:3:ef::29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:12:58 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT054.mail.protection.outlook.com (10.13.155.191) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:12:57 +0000
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:12:55 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:12:56 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:12:55 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:12:40 -0600
Message-ID: <20191227171243.10525-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-1.327500-8.000000-10
X-TMASE-MatchedRID: mFwASBd3Fjrw51clvvl5rwi0LLplf+UvS1zwNuiBtISGaNAOyKjUaZ4C
	IKY/Hg3AaZGo0EeYG97Gr09tQ7Cw/1BIVsvVu9ABwrbXMGDYqV8NstCXmf87HItLQUiz6mor69+
	WEET7bhKT62W69Ko0pFFfAkjJZCLZUu22+WF1o+lYV3aUqOG3gLUrqk1UPUGonPObVoDo1aoP+d
	CNvA/H/TVRFqQOddCaSS1+lnt0hidPYUlpz51mHAzENG3sSoPI
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.327500-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(396003)(376002)(346002)(199004)(189003)(8936002)(426003)(107886003)(8676002)(1076003)(26826003)(4326008)(6916009)(336012)(44832011)(2616005)(5660300002)(478600001)(36756003)(7696005)(4744005)(186003)(26005)(70206006)(70586007)(316002)(7636002)(6666004)(356004)(246002)(2906002)(86362001)(76130400001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN7PR04MB4401;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7204a26f-57d0-4374-fc9f-08d78af00511
X-MS-TrafficTypeDiagnostic: BN7PR04MB4401:
X-Microsoft-Antispam-PRVS: <BN7PR04MB440130C11F02588A3BF667ECFF2A0@BN7PR04MB4401.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNUfBywvJpvyrEc8NN2KuzRwvqKF/mk61i9F4Euq8FsN5f/cJIPuYy8SrtByn6CA0Kqipwd7MVtc/VlTSoMV/bxhgckvo5X/qGV59CkvQ+bQtJ69u4YMyrKRkRnuWG/uxBrhF5tj67o7BpwFLqj0DW80kZV26+FGvFsOBLOXb1IUp+8xq8gPJ2tpCGI0g8p8pk6lsh4AqN1V9zxQ3AXW80Y/QbZc7KVdxnBt4YD+/MDAUrSH+POYBEnKbndVfFEV1in9L/erjw6ADgZOWbjtQmV7y/1wZVa3XunBlhXCbMzfnxksnluQRKq+pPO1DBHqGQnvpuIyP3uCDWWMxIr7wKq29aaqGw6Grz10Yn/d7yMNaUK/5bpZrQB6o41KvL5LZxd9kaEoJp4I41hQG6MFCzWNckCBd71evaqvQ2Dd4FPDLNUhOQWEFaYseXgn679A
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:12:57.6702 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7204a26f-57d0-4374-fc9f-08d78af00511
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR04MB4401
Subject: [meta-python][PATCH 1/4] python(3)-beautifulsoup4: fix RDEPENDS
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
X-List-Received-Date: Fri, 27 Dec 2019 17:13:01 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

The RDEPENDS for class-target also apply to class-native.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index acf52dd7d..a52c96487 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -8,8 +8,7 @@ SRC_URI[sha256sum] = "6135db2ba678168c07950f9a16c4031822c6f4aec75a65e0a97bc5ca09
 
 inherit pypi
 
-RDEPENDS_${PN}_class-target = "\
-    ${PYTHON_PN}-core \
+RDEPENDS_${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
 "
-- 
2.24.1


