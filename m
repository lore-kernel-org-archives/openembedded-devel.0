Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.72])
 by mx.groups.io with SMTP id smtpd.web10.5758.1592863747931396629
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jun 2020 15:09:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@xilinx.onmicrosoft.com header.s=selector2-xilinx-onmicrosoft-com header.b=eenrNpwG;
 spf=pass (domain: xilinx.com, ip: 40.107.237.72, mailfrom: ckalluri@xilinx.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nmWbJcnHJxqwaMmbC5VgMg7KPi5FuObUINHILBcJCzUi0k9dFhsuvk7fR8t4QM4jSlf0a1TXko+o8gT6Wbl+5p1Wy1FhaRyBj8dvDR5KbangLBAXIeWE0IwAn1gyNVYNsV+stci2ttYosRl06J/hWAnSsAzSu0YYTwf3wBD7HMHLNTwa2NVeD30tU+4b4//WNp/hefYXBsFLkINQ5gnIV3RaWuLUo9XsTYZGJ9NYKs0wuCn9P77ALcb8aUzOOrQGXljIHISlFWFAHMKSdnGZev+sUTUIQpWVKESOFAjMTlMVbNtjjoYlOi7SQ+yJ01vGTWaYD7YtN+kafuc2HEqjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8erw4kWfFZoHtrDlgAFU+uNWl/rxR9da9XV2v2NvbY=;
 b=cn5u/cwJIAY3ncx10D/c2RtlOgC/gqUtvQwSft6MinOA0FO1zZ4NhDO5jM5oguIgQIi6R34qY3kdyoGlD+OTnW/TVQpE6fd6Geo0a8CfN30sPrdoAR9JKKlmAZw49XnelQW/Lv4r22EP3GN6WzlcEQreJwolZVcP4/Tnt1HjBXXYFrSTDmhksw40qh1cjGS07PCwXrsB+s4/o2OWd9ZeiKoWReonrgWoDiiruODRJeYWzljx75RJyGgRD8As5Mmxdyf/sRILfqzO7EfQ2nzpDYKxYpXlXfe8VK7B+A5dXOQiKidha/+V9tRaPJ3rLv7qfOjiqgS7EMJAUTiqgTYfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=xilinx.com; dmarc=bestguesspass action=none
 header.from=xilinx.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D8erw4kWfFZoHtrDlgAFU+uNWl/rxR9da9XV2v2NvbY=;
 b=eenrNpwGQSgUJJQUSfMufGEtzjfhxNylTzHLYw+5Y6RSJOWRyKmMSiBXQHdTWkmA5h2gZbf7uzceL8uHjPvpNiEVR2vBlEz85hYKP3MccKzf0CJ2bKCjDgF8glEmXEfhwFPkH/nKy0KTXW/p9YX9YFvjxSujFbDOZ4R81SNO7BA=
Received: from CY4PR21CA0029.namprd21.prod.outlook.com (2603:10b6:903:12b::15)
 by DM6PR02MB7019.namprd02.prod.outlook.com (2603:10b6:5:22d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.22; Mon, 22 Jun
 2020 22:09:06 +0000
Received: from CY1NAM02FT050.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:12b:cafe::98) by CY4PR21CA0029.outlook.office365.com
 (2603:10b6:903:12b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.2 via Frontend
 Transport; Mon, 22 Jun 2020 22:09:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT050.mail.protection.outlook.com (10.152.75.65) with Microsoft SMTP
 Server id 15.20.3109.22 via Frontend Transport; Mon, 22 Jun 2020 22:09:05
 +0000
Return-Path: chandana.kalluri@xilinx.com
Received: from [149.199.38.66] (port=51384 helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUba-0000dH-1y
	for openembedded-devel@lists.openembedded.org; Mon, 22 Jun 2020 15:07:54 -0700
Received: from [127.0.0.1] (helo=localhost)
	by xsj-pvapsmtp01 with smtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUcj-0002lb-Me
	for openembedded-devel@lists.openembedded.org; Mon, 22 Jun 2020 15:09:05 -0700
Received: from xsj-pvapsmtp01 (smtp.xilinx.com [149.199.38.66])
	by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 05MM91nT024422;
	Mon, 22 Jun 2020 15:09:01 -0700
Received: from [172.19.2.12] (helo=xsjckalluri50.xilinx.com)
	by xsj-pvapsmtp01 with esmtp (Exim 4.63)
	(envelope-from <chandana.kalluri@xilinx.com>)
	id 1jnUcf-0002gE-0M; Mon, 22 Jun 2020 15:09:01 -0700
From: "Chandana kalluri" <ckalluri@xilinx.com>
To: openembedded-devel@lists.openembedded.org
Cc: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
Subject: [meta-browser][PATCH] chromium.inc: Use python3native.bbclass instead of pythonnative.bbclass
Date: Mon, 22 Jun 2020 15:09:00 -0700
Message-Id: <1592863740-4473-1-git-send-email-chandana.kalluri@xilinx.com>
X-Mailer: git-send-email 2.7.4
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: 
	CIP:149.199.60.83;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapsmtpgw01;PTR:unknown-60-83.xilinx.com;CAT:NONE;SFTY:;SFS:(136003)(396003)(39860400002)(376002)(346002)(46966005)(82740400003)(70206006)(81166007)(5660300002)(8936002)(8676002)(36756003)(2906002)(4326008)(47076004)(9786002)(70586007)(336012)(83380400001)(4744005)(2616005)(426003)(478600001)(82310400002)(186003)(66574015)(7696005)(26005)(356005)(107886003)(316002)(6916009)(32563001);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 27d6836c-4d35-433f-bbd6-08d816f8e13b
X-MS-TrafficTypeDiagnostic: DM6PR02MB7019:
X-Microsoft-Antispam-PRVS: 
	<DM6PR02MB70198AA4FBADF8B938B2E39EB0970@DM6PR02MB7019.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;
X-Forefront-PRVS: 0442E569BC
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fyzeKWKAdPixkAa+NiUQIENnfj0lbKfLxsUDVVEe8hukWxn9x8A6lLzTQyfOTRK8PGdpD2CKZZC0GEfdaYhV9W6IXTeXgmgWWg3BjscJOHLzhZZVokzV1sVnGfhIY02T2eA0T6KKzN0oYeeG+wbb1Nje02UQAI5aR91g5BvuVtHeUtl1VTTBOfEpauahl0ar/dW9+4CyW4OEAFZJg5CZDd7cARJnjqyoc0zNQNr84rwz7C0u2xMlDJLRPj2DgSo/PU/3/f+7dXBBIj0zE5e0GlZtO+BW8onxbZWNQcEfjLeymNAxnPL0FshSwUbB9pWO9SF5EeFcORVx5nfQem9Ha963IB/rBzZkVmxy/8ek3mmSY7pGdz/yQI0DCCbAktTCexgEFEWNHJ/XZcm1UzNIMOhBmZeyG05ndXx1KimlilQ=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2020 22:09:05.9384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d6836c-4d35-433f-bbd6-08d816f8e13b
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.60.83];Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7019
Content-Type: text/plain

From dunfell onwards, python2 recipes and classes are not supported. Inherit
python3native.bbclass for chromium instead of pythonnative.bbclass

Signed-off-by: Sai Hari Chandana Kalluri <chandana.kalluri@xilinx.com>
---
 recipes-browser/chromium/chromium.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-browser/chromium/chromium.inc b/recipes-browser/chromium/chromium.inc
index 14d762f..a483ec4 100644
--- a/recipes-browser/chromium/chromium.inc
+++ b/recipes-browser/chromium/chromium.inc
@@ -18,7 +18,7 @@ TOOLCHAIN = "clang"
 # to build the native recipes (e.g. GN) with clang too.
 TOOLCHAIN_class-native = "clang"
 
-inherit pythonnative setuptools
+inherit python3native setuptools
 
 # Chromium itself is licensed under the 3-clause BSD license. However, it
 # depends upon several other projects whose copyright files are listed in
-- 
2.7.4

