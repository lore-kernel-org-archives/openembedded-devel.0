Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.59])
 by mx.groups.io with SMTP id smtpd.web12.1926.1586540811413982041
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Apr 2020 10:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@agilent.com header.s=selector2 header.b=e2CwCRJv;
 spf=pass (domain: agilent.com, ip: 40.107.223.59, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgdyODLZBL9jkCuyfMYFWGi0T219RbmDMANeMgH5NilIfahLAqxpm+kjz9MsrblvorpyhJxYPTSwREazYKsP2g/Ri8hZ6EHbwK4xE+yEUHpuBe1IfnRT9nY6W5mKWtjXJx61+CfAc1n6mhlRqLCj9vJux/OTF9rbkRpab4fAoW9V5Mz3YlZsWa++mTb1+8+QzNKBcMOGiNnSlKokFcsUXHBvqkSrbB9ZzChjKIkJOmDRRQAcW9rLXaeVpREG/4iqNzaUkvY1+GTEXWhq7GfaGFUnJzJTk8Er0ZTuAvFCDRKkHMnfx2R7bC54iCbbxFcozKZxuBeLfptm2elzVxdVmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjewQza/6kKzfLlVwaulRuvF9nvhKhg6wzCLiqa7BXg=;
 b=JQw8ssukj3SsjNbf4kJZVJZWDe4kXN2HH4WKrza3XST6prjGZrekC3/O5llprNTn1CaFAiPfRigGu6EsyR22LF0bsGtJg2ukX0fRAUyPdNOzV/IXJvCvxikN0qjk1UVtH28hfvzVK/HULQuL/xW1jWbupMgWUkDVujxLdPfG5zN1LLTTbz7XBpsLQck+YB4dgS+6GlS9eYAGuZq6HR35CZ3WlR1tIQ8z9tppPW20bGXnj7whVm7NPdkq2tWTAlZvv64V5vkiEpmYwpw0S5ZFKY1c+pEnkpc9xPpu+0JXmLFGUI6wnzu+z5Qfv7o3Rv2BNsVbKugozdHtK9L2mnHYvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.41) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=none pct=100) action=none
 header.from=agilent.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjewQza/6kKzfLlVwaulRuvF9nvhKhg6wzCLiqa7BXg=;
 b=e2CwCRJvgXVGgY6mpXaZAkuxfoHcxmNWQ3LAU6kgdalSoXhDuYbczPmvMyTKy0JZ88WQpFP1hWojEFOFl9bG9+yfnQaYcgdxW4q5et8jPGe/hcXTAgIoQLNFF+tawZgNTXj3X4lKU6T/aPy6Qz0CKYbIyHvr0vezUcdohkdOdt0=
Received: from DM3PR03CA0008.namprd03.prod.outlook.com (2603:10b6:0:50::18) by
 CY4PR12MB1542.namprd12.prod.outlook.com (2603:10b6:910:8::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2878.20; Fri, 10 Apr 2020 17:46:50 +0000
Received: from DM6NAM12FT027.eop-nam12.prod.protection.outlook.com
 (2603:10b6:0:50:cafe::37) by DM3PR03CA0008.outlook.office365.com
 (2603:10b6:0:50::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.15 via Frontend
 Transport; Fri, 10 Apr 2020 17:46:50 +0000
Authentication-Results: spf=pass (sender IP is 192.25.218.41)
 smtp.mailfrom=agilent.com; lists.openembedded.org; dkim=none (message not
 signed) header.d=none;lists.openembedded.org; dmarc=pass action=none
 header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.41 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.41; helo=edgeappmail.agilent.com;
Received: from edgeappmail.agilent.com (192.25.218.41) by
 DM6NAM12FT027.mail.protection.outlook.com (10.13.178.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2921.12 via Frontend Transport; Fri, 10 Apr 2020 17:46:49 +0000
Received: from lm18-laplante-laptop.localdomain (192.25.126.27) by
 edgeappmail.agilent.com (192.25.218.41) with Microsoft SMTP Server id
 15.1.1713.5; Fri, 10 Apr 2020 11:46:46 -0600
From: "Chris Laplante" <chris.laplante@agilent.com>
To: <openembedded-devel@lists.openembedded.org>
CC: <chris.laplante@agilent.com>
Subject: [oe][meta-oe][PATCH] bdwgc: no need to set ARM_INSTRUCTION_SET anymore
Date: Fri, 10 Apr 2020 13:46:24 -0400
Message-ID: <1586540784-120340-1-git-send-email-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Return-Path: chris.laplante@agilent.com
Received-SPF: None (wpcosapexchedg2.windmz.agilent.com:
 chris.laplante@agilent.com does not designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: 
	CIP:192.25.218.41;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:exch.smtp.agilent.com;CAT:NONE;SFTY:;SFS:(10009020)(136003)(376002)(346002)(396003)(39860400002)(29502001)(46966005)(356005)(316002)(36756003)(5660300002)(70206006)(36906005)(7636003)(86362001)(2906002)(26005)(6916009)(478600001)(956004)(8676002)(44832011)(47076004)(4326008)(336012)(82740400003)(186003)(107886003)(426003)(4744005)(8936002)(6666004)(246002)(2616005);DIR:OUT;SFP:1101;
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d91ce3ca-f9b4-44ab-e133-08d7dd77257a
X-MS-TrafficTypeDiagnostic: CY4PR12MB1542:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<CY4PR12MB1542EDAE7B9ED2D3DE5F79A68BDE0@CY4PR12MB1542.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-Forefront-PRVS: 0369E8196C
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZR4HTzlE+Gyo7/7qkvj1mUnDwuG4rHxFCiPZ+XQcjZumrvSHr3dE+XdyGYTTdSkADIiwDc8N/BksA/+R2Orzz8fFBXrYBE2SbsPMogX3j3ZB5Cl7SYz3Dw4zzwoBdLSuF176Ao3gzmGaz/4oZAJ591rzl4cctuTFQh2qKercGzU/CL5pSJocuf4DYruomWvPqvya4bassyV/G9DClL6wWactE/HLyyMJorEGzB3ROdsXYAGQUHK3Slt4TL5e6wICCrjJysIk90kUaBhWPlTiiCWC4hDMUh8SZ74XZkdlfW7nlGNzoYuu8r6l8+Ciodg2NcuQly3ntEas5gTn7nFqHaCXWgBpAVK2BFP1D86tGZuHTf4i8j+ELILflvYMCcwOukTpiHMkKkOBA6F5B5uhPIhYe6BugAOQuHSF8aFh6geBW9nE9i1s6ndoYNtlFlax4zdLoangBG9Zn9BwTa8jThRyM+tL19bcMBIhbEr/CKxrKoEvV23eOixyUzAwOdTXTObEwICm+p0xhXVksaZ1qYFQmJmUVDR4dAH9rTdK0egroKucM9ZCXcU19j2z96Bx5JoEGiJOpEcTLo9ihJmpDC858EXHhEny3SUzSEkxCtB0Dcjfy+KBM5vhPpZaldNW
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2020 17:46:49.4562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d91ce3ca-f9b4-44ab-e133-08d7dd77257a
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.41];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1542
Content-Type: text/plain

It was necessary in 2012 (https://patchwork.openembedded.org/patch/26155/),
but it appears to no longer be required.

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
index f4ea173..407de21 100644
--- a/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
+++ b/meta-oe/recipes-support/bdwgc/bdwgc_8.0.4.bb
@@ -28,8 +28,6 @@ SRC_URI = "git://github.com/ivmai/bdwgc.git;branch=release-8_0"

 S = "${WORKDIR}/git"

-ARM_INSTRUCTION_SET = "arm"
-
 inherit autotools pkgconfig

 EXTRA_OECONF += "--enable-cpluscplus"
--
2.7.4

