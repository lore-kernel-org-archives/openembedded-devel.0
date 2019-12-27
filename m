Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
	(mail-eopbgr750127.outbound.protection.outlook.com [40.107.75.127])
	by mail.openembedded.org (Postfix) with ESMTP id D12B67CE79
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Dec 2019 17:26:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Y3wHJIAF6kCdeCzYKKeqISdxKBURFsAPWwr74iZ8wENE1GTrwiE7oBsmb56HA4cfoua82M4qQ8mUCT3vw2mPK96UKu5vZ906BiM5mRSv/ULEQzdg9wRflCdkkSLDtxa8p7/auhhxhiM2wt/8HExG+EZ5wJsUlXCgFqeySazO71O8ooYTDV/FGTuNZ7WLZKd8nZ4cGl3uCwrOTfd3RZ46MJOgVV6otyvoxOjWjNlrziS/8ElExIuWkL/hOiOaYLVoLe8WL+y7stT/6LQK5iXD/yu+65rsvBuwvnlNmT/8Qyg93ZRtuwTmJreTEPz9MoT3t1yGus4Zm4DbeNu3s7rm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k8WN/LrD6MivK+sRSL2vArTIHU0fD5ADZ6zoJjl4OeY=;
	b=DrNzxG9Lxhla461qqmI+gf6sgsJJSg8mSQpAtkn82eZEwsFVy3pbOuz844ovyZ3Av49L/Xt5mgAZ3YBWRGlXJwha34I05YbUfDAhPOvpHfWJWVO4u04zY9lWXMRdU29D3RAyqU5hiYuLTZ/Q3VkTpDrO2NBmtfLG0xNeDXTXn41UsVdpBAyAk1xtfUp76+0MEBAE1jMMVSF0b2Arw2B4btVusSBaMaK2J9b1WQkE0jU6h5o0LuDKJivyDc7RbAyR4Ve1kd95jsvY0T5+89vESx2EL8TYdQxhJ6Hus3pg17pI2HMOQla9PYY0FUL6lnd1+x07JAL25szYY+DHx2PTsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=k8WN/LrD6MivK+sRSL2vArTIHU0fD5ADZ6zoJjl4OeY=;
	b=p2msDq85ofSB8xL3sMFxVbw2mK/577vOidaafFPLnfwIl7PG/FdJ0UcrnWDp2kDXkt1pycD/+0vTj6EpODSTfq42DJAjRo1Sf8edFUm1lq2ntWGdkHZqT06VKd9LkbLla9LHNunUdrk3L1jIU6uT/ksh+M6w8F1BzqdUMnZHbPU=
Received: from SN4PR0401CA0017.namprd04.prod.outlook.com
	(2603:10b6:803:21::27) by SN6PR04MB4480.namprd04.prod.outlook.com
	(2603:10b6:805:b2::25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12;
	Fri, 27 Dec 2019 17:26:46 +0000
Received: from MW2NAM10FT034.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::200) by SN4PR0401CA0017.outlook.office365.com
	(2603:10b6:803:21::27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11 via
	Frontend Transport; Fri, 27 Dec 2019 17:26:46 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT034.mail.protection.outlook.com (10.13.154.231) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 17:26:45 +0000
Received: from OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Fri, 27 Dec 2019 11:26:42 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB10.ad.garmin.com (10.5.144.12) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Fri, 27 Dec 2019 11:26:41 -0600
Received: from ola-brr76y2.garmin.com (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Fri, 27 Dec 2019 11:26:40 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 27 Dec 2019 11:23:40 -0600
Message-ID: <20191227172339.10885-4-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191227172339.10885-3-peter.kolbus@garmin.com>
References: <20191227172339.10885-3-peter.kolbus@garmin.com>
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25132.001
X-TM-AS-Result: No-2.729300-8.000000-10
X-TMASE-MatchedRID: iOIDnuBW4h5SQAJO4/Vvl7HcAAwD045wTBkzBfi0S2oLBZEuqIL9SkAc
	6DyoS2rIzmFEl8/fT3abKItl61J/yfJvocwUrWp7FBpuM64i9KELbigRnpKlKTpcQTtiHDgWdXf
	iwkNYqStW1OWo1Elfc0oGzgmPagu/afRMFbSp/1IGTVvaW+cJ+Yyvzzcqpc9rOqfTzZbXfQOkJJ
	Tbtt4TTq7zQ5cqhAEIRSFCLi6kLLCQy+lMrBKGwJeqBS9/VV9cyZDK+esyepJjhRK9S+H8Wg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--2.729300-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25132.001
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(376002)(346002)(136003)(39860400002)(396003)(189003)(199004)(26005)(70206006)(316002)(76130400001)(70586007)(186003)(36756003)(4744005)(1076003)(5660300002)(336012)(426003)(2616005)(356004)(44832011)(6916009)(26826003)(7696005)(107886003)(2906002)(478600001)(8676002)(7636002)(86362001)(8936002)(246002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB4480;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02b16c80-4c96-47ff-9394-08d78af1f2bf
X-MS-TrafficTypeDiagnostic: SN6PR04MB4480:
X-Microsoft-Antispam-PRVS: <SN6PR04MB4480A6A76839E5D325355B89FF2A0@SN6PR04MB4480.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2201;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UD6t4bAJsqGdNx3HAlEY37dk+KX/ASHEJUVx7t+HZRmYIljpbMiHiuxmgAivMxUCOBOVvU3DeOxwIg57RGl6kQzPosCf9zoIZz215GsAgffIcqJYY0qXQFTp/h1kxfnhDKWqD2LQNB0vSd3/An2408xtT9D6O4iWLwCHkPOrjIHXcoleqyB9Fi3mKusJ+BdkINUvnWXeGYZpEMYnbm74tipgJjD3bKRFo5RZhpOrCHHjhaNgsImx2Y0n2lg7HVDfG+0Uo51vF2T8Y6C5GV8yOPHOvYqWpNaiRlfgZituylQdU8j4vNDrcRLkE5PBx/OzMBziQs+jKBhQCC9bQyf3j/uGAow81s8WxFRtK8HRyWkh0cKJMNaJCMABU9/cI4G8DI8rZ9jvwLVpaaX3HE0AKYfY881Vr1dCQa0LRKMvUvTnLCFZJv+VHLrjSviuOTWP
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 17:26:45.9236 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02b16c80-4c96-47ff-9394-08d78af1f2bf
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB4480
Subject: [meta-python][PATCH 4/4] python(3)-beautifulsoup4: add soupsieve to RDEPENDS
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
X-List-Received-Date: Fri, 27 Dec 2019 17:26:50 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Since version 4.7.0, beautifulsoup4 uses soupsieve for CSS selectors.
Add to RDEPENDS to address this oversight.

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-beautifulsoup4.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
index a52c96487..8c9dbfc68 100644
--- a/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
+++ b/meta-python/recipes-devtools/python/python-beautifulsoup4.inc
@@ -11,6 +11,7 @@ inherit pypi
 RDEPENDS_${PN} = "\
     ${PYTHON_PN}-html5lib \
     ${PYTHON_PN}-lxml \
+    ${PYTHON_PN}-soupsieve \
 "
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.24.1


