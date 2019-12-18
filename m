Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750135.outbound.protection.outlook.com [40.107.75.135])
	by mail.openembedded.org (Postfix) with ESMTP id DF89890E25
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:12:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=EPrmiAsVMgnVEMz7Y7onxA1xLrREGJhQ95mpERGSEJU9vU6iGtpwnlBxWWBw6wVv9PH1/hAIogrXiDLm85lyNM/P+/gFjDPq1na33Y19Yz6xIYDiZSahTHrsBBzOLgP21Ga78uahIzV5mMneLjOLvTYxqvDDDWbquvIx179oHCIMl8+KDIcHOFf079JJvh8gRUYNvLouGcvmJxAN4rRf2Q+X+oX7AHGH7mhsGms3BWKvfrOfaaHpZuiL6NMX2LbPcLMKPj0RkLM1fiWeyNw7ycsA6HonvdAs+KAPHNqpLTZiYcYQI997fptuDRv3ip2BAZIgOgOHVnq5VBe0jSV8uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KZXw4mapkk15i2BbuHniornrpgzJkJ67zDMrgwIoc4Y=;
	b=CuLzl2catFfVPDOPJ461CbsIwyD82sZtIi8r0UI7/wGPGk+U7t2Jhqcrsdgu8CH5YM0A1JXvLK4UfU+/esYzzymaGoTnW0R5ozB1KmAoZvFrr1V+A6xEThrCJumnBbu9T6Iicf9IzVUdxhmVGNxi1mmSuc19jlBkrjZilV5KY0fQtaSFSv9/E3XYBfgQrDARvIkkb4kHgTBGPa8j8236f9GRVDOq7cgAb9ORTuu9BsBoU2GIp97cj0qAvzyBM3CTjfcy7m4+AQzIEFEpkzfRSRb4yAaTRMnns6dnONn4mp4YU1EqZipLQ/DN2rG4jStyeLT/PYKT2NRRODhnP2FRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=KZXw4mapkk15i2BbuHniornrpgzJkJ67zDMrgwIoc4Y=;
	b=uuTYum5dEK4Phztj2VHvrfA+3WCvOF6/06xZJ3T9dsTpVmBrvtZI2/cidYybfo58rx2GvA1CgOOp8FUjnx63D4gHZGlHJrLxTKAmBhOc8cn3EqKLDVKUrSJV2nkgsYllSf0XNbqf9G6nVJq5OC12Iwzmky3FUawtjuwSfAYd0kY=
Received: from MWHPR04CA0063.namprd04.prod.outlook.com (2603:10b6:300:6c::25)
	by DM5PR0401MB3573.namprd04.prod.outlook.com (2603:10b6:4:7f::30)
	with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15;
	Wed, 18 Dec 2019 20:12:36 +0000
Received: from DM6NAM10FT051.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e88::206) by MWHPR04CA0063.outlook.office365.com
	(2603:10b6:300:6c::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via
	Frontend Transport; Wed, 18 Dec 2019 20:12:35 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	DM6NAM10FT051.mail.protection.outlook.com (10.13.152.88) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14 via Frontend Transport; Wed, 18 Dec 2019 20:12:35 +0000
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	olawpa-edge5.garmin.com (10.60.4.229) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Wed, 18 Dec 2019 14:12:32 -0600
Received: from OLAWPA-EXMB1.ad.garmin.com (10.5.144.23) by
	OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Wed, 18 Dec 2019 14:12:32 -0600
Received: from ola-ght37x2-bionic.localdomain (10.5.84.15) by smtp.garmin.com
	(10.5.144.23) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Wed, 18 Dec 2019 14:12:32 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Dec 2019 14:12:28 -0600
Message-ID: <20191218201228.77879-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25112.002
X-TM-AS-Result: No-1.107500-8.000000-10
X-TMASE-MatchedRID: XnK96NomDjax1+dQDOvXhD8Ckw9b/GFeyXSK41ALzZmXBXaJoB9JZxRF
	JJyf5BJeEUyC08gAPqL6C0ePs7A07fcUt5lc1lLgjMejjvPkBr56cdKn6MMuLODYwEDSQ+CTgo1
	I30hsyJxV3tUWoNTA1gwyF1FFycOBM4kINpWByWVDE4dzW2U/6h+k0FUlezGH406WpJmWuuGeRm
	A1qqLNsvbP6/8eUaS4wJqpKDClhHh5hr6VLS5N0FZca9RSYo/b
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--1.107500-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25112.002
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(346002)(136003)(396003)(39860400002)(376002)(199004)(189003)(70206006)(70586007)(8936002)(246002)(186003)(6916009)(4326008)(478600001)(4744005)(2906002)(44832011)(336012)(1076003)(26005)(2616005)(76130400001)(36756003)(107886003)(426003)(5660300002)(356004)(6666004)(26826003)(86362001)(7636002)(316002)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR0401MB3573;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 684e990a-c3e8-4aca-9393-08d783f69f52
X-MS-TrafficTypeDiagnostic: DM5PR0401MB3573:
X-Microsoft-Antispam-PRVS: <DM5PR0401MB357341507D19753066D58B91FF530@DM5PR0401MB3573.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0255DF69B9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pH4GY09zI/lPRSUryin5QeOvbMvJyXp7s9vls05lAc7y0bQLzIogHScyLkipFRsJok7gJsfl4Zyl1yvbtx0JfdpeAHDJX6p8B5XhOJ/TBdU4SOnL4EqHB9JdgE2NLFk3zw8TjLEODYuqLB/zehElyl6E6BJdKUGBqCBHN7LLVnoh48S/tSLkQyEztNIpPIBsi8f7+miFn6GvEyAdmMqyX1zYQd2wHTxt1h9JwwqXlnDGlA2ZdcK9jzJu/PKhSINpmUAntixUGXbhuT6zV8+mc8DQqWATQ7dc43tGeFYmk+EJ0j0RSZ5eEmLVGbL9iBFyq7EoYgNRTIoguFjdUrLRrH7nqNdEHTzdIaZn2XRihQ3ZKm37YWPgieEarf6+HCEzQ9CFVDqy7+1WQHPbFE5mWBqDmkxnU903DlU0Bm/UOz3osox/qeZlsgybiVAtd2WW
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 20:12:35.3326 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 684e990a-c3e8-4aca-9393-08d783f69f52
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0401MB3573
Subject: [meta-python][PATCH] python(3)-ujson: extend to native(sdk)
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
X-List-Received-Date: Wed, 18 Dec 2019 20:12:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-ujson.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-python/recipes-devtools/python/python-ujson.inc b/meta-python/recipes-devtools/python/python-ujson.inc
index 8f05de856..018ddf418 100644
--- a/meta-python/recipes-devtools/python/python-ujson.inc
+++ b/meta-python/recipes-devtools/python/python-ujson.inc
@@ -13,3 +13,5 @@ RDEPENDS_${PN} += "\
     ${PYTHON_PN}-datetime \
     ${PYTHON_PN}-numbers \
     "
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.24.1


