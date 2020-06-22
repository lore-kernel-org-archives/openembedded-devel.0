Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.74])
 by mx.groups.io with SMTP id smtpd.web12.5896.1592863918361126751
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:11:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=PHgxfanf;
 spf=pass (domain: xilinx.com, ip: 40.107.244.74, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=icKWALUCKcgWwts8gmNhb/hwb7vqkHwZK00a+ZmxPvaP42ELmvcq8YTJncQnj3XG8uvvVcaYz2F9hAH+FQeXlPnDnsVk91ziax2jbpkyC6Og83RdptHQ34G/xJV2CoiuX/U+7cJmsltNFOwumpfayfO6FQWo0Kq1Hh13a8YcNag1nAgJ45PplEMJs5Ug6DHGi1smrR1OdJrtNFRRFm3Pov6j/ALhXrg5rDqNpSzQDxLCRp23ZbWNsxq/mNEqcRHhMwpsBkP1qwiuFiAsZHhV9WpfQwOO7kXEB1d9Kh5jKeLBK+0OHBgzu0bgk+0GYtAcgEWr5yiU1+LR6NZMUsgeOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOOluUtvmmthN9kjn38eovyManlBT+k0EGIOqI0MsU4=;
 b=Yk86BOp8vw5bsNfbxdmHTlgmM2AWeB3/qZz85NK6PNNf7qhNiJ+/zI1adG3ZoNgLQdhufFfhc/ciQKX1puk6KUSXTbrB1D31SsSvNtRF8JnWSI9Kal+SGGadHAB2eG7ajdksi1BSfiMzODA+1K78ygsX/fVlXwJ/dtRNTGoe1IqTkdQ4uhRD4qUoQUloNqs6ugqj4L9eih1pKu5AiaCT0d0eA8G04K1MN2uHPdI/rnFdkWH2o9Yg1PPV1TuekVxdV7e3DN+bhvYRTDKDlQzWnc4fpL8iDGDAu4xcyRlRg1LTdLmjYTjXFqDKWSZD1GaasDum1x3NGfb52CWxfVW+jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOOluUtvmmthN9kjn38eovyManlBT+k0EGIOqI0MsU4=;
 b=PHgxfanfPyZISIjgRWpCUIFolkDXJ7FzVUIo7qF4sLTKKAtWBX5rHmggGh2XSZtqs9f4Y1gG/fZHnT6gojBDOdZk8rULJ7fvRX/znG+liRyr4QT99gImanI0qsL4IX/mhEbIwEJuVNuivMxgKouJ4IfVeQfxReZV4ZL4Bh7cWus=
Received: from CY4PR06CA0032.namprd06.prod.outlook.com (2603:10b6:903:77::18)
 by DM6PR02MB4603.namprd02.prod.outlook.com (2603:10b6:5:21::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.23; Mon, 22 Jun
 2020 22:11:57 +0000
Received: from CY1NAM02FT012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:77:cafe::69) by CY4PR06CA0032.outlook.office365.com
 (2603:10b6:903:77::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22 via Frontend
 Transport; Mon, 22 Jun 2020 22:11:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT012.mail.protection.outlook.com (10.152.75.158) with Microsoft SMTP
 Server id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 22:11:56
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=33403 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUeL-0000g2-0n
	for openembedded-devel@lists.openembedded.org; Mon, 22 Jun 2020 15:10:45 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUfU-0004e0-Lz
	for openembedded-devel@lists.openembedded.org; Mon, 22 Jun 2020 15:11:56 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUfK-0004al-IO; Mon, 22 Jun 2020 15:11:46 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-browser][PATCH] chromium.inc: Use setuptools3 instead of setuptools bbclass
Date: Mon, 22 Jun 2020 15:11:45 -0700
Message-Id: <1592863905-5241-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(376002)(396003)(39860400002)(346002)(46966005)(5660300002)(47076004)(478600001)(4326008)(4744005)(70586007)(316002)(2616005)(70206006)(186003)(2906002)(83380400001)(336012)(26005)(426003)(81166007)(66574015)(7696005)(82310400002)(6916009)(82740400003)(8936002)(36756003)(9786002)(356005)(107886003)(8676002);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: f73a64ae-98b4-4bd2-593d-08d816f94725
X-MS-TrafficTypeDiagnostic: DM6PR02MB4603:
X-Microsoft-Antispam-PRVS: 
	<DM6PR02MB46034EF38B376C906531D4C8B0970@DM6PR02MB4603.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OX+ExxTbXZ+Vf+KHdFOY11MliwS9u35ggWT0CC7T9ILFkCl1NMFYPmHUSS1EwlNLp5/7ruCWY3/cC3uwuYqv6p6uSIENw2ivdxTuTN0e9j7m2N6Ya0nELVLEtbGg2Xq8wzSoLcKj4MYLeTrbQj2njgE3Fjmi1zKQ9+E4VjBsoxpGWjKY4lB3R2B4QL/51LTnE5Cmo6b7Yaim5eR0wcn5BWC0M/JhQ3nQHwl6YwdEJcdlC/031HE/A4zZS/pxNnnf/asmy/KiarcW7/MwhrxB7gHbFxMW9nPTAjm9YgqHncAuRZmTuT++Gs0ajTMEQ94yCSaiJd7esNduQOkS5lCwOmGcyGSkIK5meK4Uz76U2q6GqOoqnNIMdKkAI1CabLmQbx2YU65bd40rP3WosgksZA==
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 22:11:56.9192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f73a64ae-98b4-4bd2-593d-08d816f94725
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4603
Content-Type: text/plain

From dunfell onwards, python2 recipes and classes are not supported. Inherit
setuptools3.bbclass for chromium instead of setuptools.bbclass

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index a483ec4..49947be 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
 # to build the native recipes (e.g. GN) with clang too.
 TOOLCHAIN_class-native = "clang"
 
-inherit python3native setuptools
+inherit python3native setuptools3
 
 # Chromium itself is licensed under the 3-clause BSD license. However, it
 # depends upon several other projects whose copyright files are listed in
-- 
2.7.4

