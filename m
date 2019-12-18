Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
	(mail-bn7nam10on2101.outbound.protection.outlook.com [40.107.92.101])
	by mail.openembedded.org (Postfix) with ESMTP id 7A59790E61
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 20:12:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=g6/ZyRdVQfsB8weUDv6AZRNVJMmDuPFYXfjpRuvHqcTn4EUsW23P5miUZnDYqi3ldkDH2WTrviVzI5Ty4QlOEpVlzM6w/cBKtfBM3arD6jRAznQ3ZDn/ucoBS3nTCqBWfclF/BT+q6OndEIBqXRkhZpQY++9Z0OgjhAvAcZX819/K2hLW51jFBc87Taz7Xy9Epi503swIxSiwCllO72bU+SRM28TwX0IerYf+4Oiu7whVuDU7Dfh86ofJG6XfDrR5rH3Z2F8Ff6QcxIuK09ZDmGxbLOAFDZ8Ofw+4UCzrD6p4DTGFUa3SNSCbmKEPfTyGTg143QXswpZQE2UqEFMIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QTYK9iXEmFTW+vNg+G2zjOdRLmon8aeAnTkYiIP+OG8=;
	b=EeeYEdp43YJN0XaZRvlScsDejRGHUMckEiIZAFaqkTuEdxCdbsbjxUBcmy8Z4X3Vedk+YEBvkmPPWwy79jyxv7rIwDqzb/Jl/Gpw1xLpFklSjXh8kUEybuezNgD2z/k0n0EfpxDSw6yo4x5J0gsTgSTEUJZF8/hinmsyzu+81AG08oTZ7QKubGTRwcm+fRK6T55SFsdc80ZpyoNkyINdXAQDzIneQvIypR4s+00V85GcIT5M02pYaXf0z/e46SXpScIDe9GxGruEncHBZ75piMVVLpSz/x/JVsoEPXPE2/5RPyiPhpXrgBS/QoRs8CYNElUE3Xk3HLfUIuAOJ7WXAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=lists.openembedded.org
	smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none
	header.from=garmin.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=QTYK9iXEmFTW+vNg+G2zjOdRLmon8aeAnTkYiIP+OG8=;
	b=trnFYYEYqc1vvhlF5oA5JP7mJhX87zYgyJ7L6sxy5m+hGd2hCVsPEF/7T+vkU4mCTMGLaCo8hj2p8cNMgwjCgtoKdUVNuiZ05hVKr5WUaboMaeRVlvA4alLQdBCb8wb07svCwMR2blzgDBTo1DMiuSjFbNG0tIx7D2YaG+09Qr0=
Received: from MN2PR04CA0029.namprd04.prod.outlook.com (2603:10b6:208:d4::42)
	by DM6PR04MB4204.namprd04.prod.outlook.com (2603:10b6:5:96::33) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2516.12;
	Wed, 18 Dec 2019 20:12:49 +0000
Received: from MW2NAM10FT050.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::209) by MN2PR04CA0029.outlook.office365.com
	(2603:10b6:208:d4::42) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.15 via
	Frontend Transport; Wed, 18 Dec 2019 20:12:49 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; lists.openembedded.org; dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
	header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT050.mail.protection.outlook.com (10.13.155.13) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14 via Frontend Transport; Wed, 18 Dec 2019 20:12:48 +0000
Received: from OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) by
	olawpa-edge4.garmin.com (10.60.4.228) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Wed, 18 Dec 2019 14:12:44 -0600
Received: from OLAWPA-EXMB3.ad.garmin.com (10.5.144.15) by
	OLAWPA-EXMB5.ad.garmin.com (10.5.144.13) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Wed, 18 Dec 2019 14:12:44 -0600
Received: from ola-ght37x2-bionic.localdomain (10.5.84.15) by smtp.garmin.com
	(10.5.144.15) with Microsoft SMTP Server id 15.1.1779.2 via Frontend
	Transport; Wed, 18 Dec 2019 14:12:44 -0600
From: Peter Kolbus <peter.kolbus@garmin.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 18 Dec 2019 14:12:42 -0600
Message-ID: <20191218201243.77975-1-peter.kolbus@garmin.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25112.002
X-TM-AS-Result: No-3.360900-8.000000-10
X-TMASE-MatchedRID: 0s42WDiQZhSx1+dQDOvXhD8Ckw9b/GFeTJDl9FKHbrl49kYd3Ht4aDpI
	hhonTuyP+JQmf/5yz2VzP3LKSwZbGxmE/CaJvSSN4vM1YF6AJbZhyT3WNjppUtAtbEEX0MxBxEH
	Rux+uk8jQ9TRN0mhS19bAUPtXiMO3T9tNCG0pp1L8/5QJ1bIWkEDxGImWVARu0ClyP1snyaOwSr
	HKLkcVHknNFhrPawitwHvMi26ZK8YvQLVo9+SeQPhdbkKx5t5FQByVZYibFxpprHDlfzYAbSeCo
	NkC91GeLauEAayHSj4=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--3.360900-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25112.002
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(39860400002)(136003)(199004)(189003)(76130400001)(356004)(2616005)(70206006)(316002)(2906002)(8936002)(36756003)(186003)(336012)(26826003)(6916009)(44832011)(8676002)(86362001)(70586007)(4744005)(107886003)(426003)(4326008)(7636002)(1076003)(246002)(5660300002)(478600001)(26005);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM6PR04MB4204;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7ef3cd9-6949-48b2-95c1-08d783f6a776
X-MS-TrafficTypeDiagnostic: DM6PR04MB4204:
X-Microsoft-Antispam-PRVS: <DM6PR04MB4204FF6B89945BDE75BD0F8AFF530@DM6PR04MB4204.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-Forefront-PRVS: 0255DF69B9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0JT/aCRRM7K60efIItyqV+VBhYCW9Yu5DMaqKcG1fcVlQ7fYzwBvQl9UilRfI0iR76DdbJSX2SN7PGkcXtug0g7klrTeK+5E8YmovhZi8m5BRMtCfAmJxStFeThoWc2XbmgsEeMcQFX2rrEpL/rU29ORc9YGYeSj3JI55nhFDvYFIjNlOCsWnO1Bk9SXt7Pm6EFrXzYkBrZOHsrUVzbrG3YEbdfub+7iaCCrfIG+zByAhB97bbtrYqnNFn30hU2Y7ae0EPgf45sOTbTqo3Q+by5bjqf9AOYwvF6angrVT9Wg1DU5HaxPPx8OuHPD+ob8IqOoRJwBb7/M3563JG4Ys4hYXsJcoE0aD5vku2BjDU9TAjLgfLijIaqPpnlbIP/mKCMKwwyuis9fjsYBLHjAVkfDWW38XJfmA/ZAyVEe9Mxa6QBoVj0yvXQIqhj7m4Uj07m1iHyNNLS0+E0NE1fuXjOgj9N/DX6OX+lYzA7s0Ts=
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 20:12:48.9493 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7ef3cd9-6949-48b2-95c1-08d783f6a776
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR04MB4204
Subject: [meta-python][PATCH] python-ipaddress: remove unneeded pip dependency
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
X-List-Received-Date: Wed, 18 Dec 2019 20:12:51 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Peter Kolbus <peter.kolbus@garmin.com>
---
 meta-python/recipes-devtools/python/python-ipaddress.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-python/recipes-devtools/python/python-ipaddress.inc b/meta-python/recipes-devtools/python/python-ipaddress.inc
index a23020649..129cf225d 100644
--- a/meta-python/recipes-devtools/python/python-ipaddress.inc
+++ b/meta-python/recipes-devtools/python/python-ipaddress.inc
@@ -3,8 +3,6 @@ HOMEPAGE = "https://github.com/phihag/ipaddress"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7f538584cc3407bf76042def7168548a"
 
-DEPENDS += "${PYTHON_PN}-pip"
-
 SRC_URI[md5sum] = "aaee67a8026782af1831148beb0d9060"
 SRC_URI[sha256sum] = "b7f8e0369580bb4a24d5ba1d7cc29660a4a6987763faf1d8a8046830e020e7e2"
 
-- 
2.24.1


