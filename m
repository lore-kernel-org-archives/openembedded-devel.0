Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8A1C197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 16:57:39 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.109])
 by mx.groups.io with SMTP id smtpd.web10.11849.1700153847175942992
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 08:57:30 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arrigroup.onmicrosoft.com header.s=selector1-arrigroup-onmicrosoft-com header.b=jnogKi/8;
 spf=pass (domain: arri.de, ip: 40.107.15.109, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oZQ424RBNBW9qOQQOVxBPKGUUl2g6a8qcBtD70mOa8H4uR+omc7EUG/Xg9dLGzOtDH6/kLDcjDaXED6NlrqOmbRvO5fWHdrQNfQy1avDFBtz+AHMY3gzTpfEAQuxtLFRu9SwEIVgBr+7Z9376clLZPJIzSlhZLGhCkaE4ZSoTLlLRLq/n7b4w9I/i0eg/rqIwhNJYXEUc4f4idLMHzMr3viS2iyrtWCwhVkEwEB7UAF6jSnrtnYHNiPij5w9kiTBLaw61h4bX0gBJzGZNA4RkMAfV+yoXhFNpzJW7K9dxmzNenTpo7hVYvIdsTX+SdnDN32e4OoazhoYfJZyIcS+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=QWcW7vOxUTa3IuQUzQmQXMDUttrIUIFIn9/5Pu5oTHq5IHoW07xZqByeaUTWmgv3aLQpcHc7HRke5cLK2sev+j23ODCwOqnfMPky3D1A5i1l8BG+qIfTlguMsH9WS75PpRjh0EfgcshBRhTK+V9F5nWRiAwJI3GBTfLMV4AbvlJIjfBrBY1ZgFUFbYbZ7Bk0SKxeHsVEM0ANmY8txk/hbSnX2e5exUh1D/OPldY56wWy1a9o2YIN8Zx1G/Lbbg9qngsWZzNusitR0wgcUBH7a1sX0p8FvWSKWYkAQca/SLrFtK8bDzkujICvr+BeHBJHuxaqfhAc82SyEOfZizjWWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 217.111.95.7) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g81zHPyARHJgwxCKbY2TiX+rjYX14UYr7+aewXjYMms=;
 b=jnogKi/8Ap8ootzd87eVkJZPo9//y/bzxkOgJT/effxEwOuTUJ/hXN4zIfMkd/X7/4L6GS0AdfEpWDOSF5r/P0zaCu8E+3mdQvKUQe9SY+166KDo3FhwUqDxpgHtkhzCzNbZd1BiJlXLRnJAwveWJul64s1p25J1xL2kga/kLY4=
Received: from DB8PR06CA0064.eurprd06.prod.outlook.com (2603:10a6:10:120::38)
 by AM8PR07MB7491.eurprd07.prod.outlook.com (2603:10a6:20b:24b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Thu, 16 Nov
 2023 16:57:23 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:120:cafe::8c) by DB8PR06CA0064.outlook.office365.com
 (2603:10a6:10:120::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.21 via Frontend
 Transport; Thu, 16 Nov 2023 16:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 217.111.95.7)
 smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: Fail (protection.outlook.com: domain of arri.de does not
 designate 217.111.95.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=217.111.95.7; helo=mta.arri.de;
Received: from mta.arri.de (217.111.95.7) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.20 via Frontend Transport; Thu, 16 Nov 2023 16:57:22 +0000
Received: from N95HX1G2.arri.de (192.168.54.27) by mta.arri.de (10.10.18.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 16 Nov
 2023 17:57:22 +0100
From: Christian Eggers <ceggers@arri.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Christian Eggers <ceggers@arri.de>
Subject: [meta-python][PATCH] python3-gcovr: switch to main branch
Date: Thu, 16 Nov 2023 17:57:15 +0100
Message-ID: <20231116165715.18848-1-ceggers@arri.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [192.168.54.27]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B90:EE_|AM8PR07MB7491:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cb76aa2-65aa-4345-4f0a-08dbe6c51a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+LeegfEHN7Uc4oiEdgfUz7BUh8yO8bDFslwSLODhbdZMQTsQOJk06lsmk2j6+yYB4ljBZgZeyT7mR31vTIXR9mtA+whBLb0Ocg49atRqovclFC8kOyJvewpNjPms+/QJmFVuSw0g+KkohULfraVEOB9LVRjDZgRGX1+kvcN/XtVlY5G0t5Fhm06pUsy/i1W40YUAsJ1ucbatf5G+ZxcOhIursy3jRKYEQHFnaC5tHWnOQLlpt9klZk5qyVXCoex/+DuPIatUxJLM1Es5dHorjFz1/0tEj+L1iwiy+oY4+rQ3hw8tSPlD2tdrz1i2rtcdQ9IE8AdE1BLlxGoBISqob4m2DOzQ8CulPd9xZRVmDtkmuPr5nJIeQ+RB+FhaF5P0S9+7TOPbLY4IP6EQMxaP9MPEuMdAKt7pq2OhoSRG6+B9RfiMH8i/ruu3PAxgZR33Fg+I8ZTg5aa7Mz9zZF6AVYmUQSMSuROT8SoqbjpTVPGj9giQH6DPEm+qxGDMmnij3z2lRu6Jak8YZPxEijTiChV1gNQXUuOd8X9BMTiwzArcSnbIQendOCDgK9N74IlQoXjdIqDDgHrVJSM4jBOmeH6wfsbsYYJfi29WamtbcwOkyP6JVAkFy4SRixObjbkp9FhYj3AgsXEKKLy0ivD7D/kbEXIwF9xUG71LrMDxbi45mFtL9S0Na7ZGi8t1sPPGmisUyrR0YDtL0n2BHoFHd19f+hH6+6LsPkw0LKKEURGhEVrEOMAJ333NQORptqLq8SV6NVgj0OQMqQUueF8sNLodlBkAU41wVy44OmPnve2V9kL6JQXTx7Jzu+/aqQTj
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(230922051799003)(186009)(1800799009)(451199024)(82310400011)(64100799003)(46966006)(40470700004)(36840700001)(83380400001)(41300700001)(40460700003)(47076005)(81166007)(356005)(336012)(426003)(82740400003)(107886003)(1076003)(36756003)(7696005)(2616005)(6666004)(26005)(16526019)(478600001)(6916009)(40480700001)(316002)(70206006)(70586007)(8936002)(8676002)(4326008)(4744005)(2906002)(86362001)(36860700001)(5660300002)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 16:57:22.9994
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cb76aa2-65aa-4345-4f0a-08dbe6c51a80
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR07MB7491
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:57:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106819

Branch "master" has been renamed to "main".

Signed-off-by: Christian Eggers <ceggers@arri.de>
---
 meta-python/recipes-devtools/python/python3-gcovr_6.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb b/met=
a-python/recipes-devtools/python/python3-gcovr_6.0.bb
index 21c36687e263..bfb0aaf5e79b 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_6.0.bb
@@ -4,7 +4,7 @@ SECTION =3D "devel/python"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D6542fc4ce5904ffb741ef56f8fe=
33452"
=20
-SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmaster;protocol=3Dh=
ttps"
+SRC_URI =3D "git://github.com/gcovr/gcovr.git;branch=3Dmain;protocol=3Dhtt=
ps"
 SRCREV =3D "1221ef62ff0de15bbeaf79e68e08a65d62c73ff4"
=20
 S =3D "${WORKDIR}/git"
--=20
2.35.3


