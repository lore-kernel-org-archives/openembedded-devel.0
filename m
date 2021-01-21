Received: from NAM12-BN8-obe.outbound.protection.outlook.com (NAM12-BN8-obe.outbound.protection.outlook.com [40.107.237.53])
 by mx.groups.io with SMTP id smtpd.web10.3218.1611207509630541758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Jan 2021 21:38:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=Bhwrpr6b;
 spf=pass (domain: windriver.com, ip: 40.107.237.53, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C9Snlzhyrt/VqBgrW7VzE8dVDP6RxsAQ2Qaurvg6Cs1bR34royRKtiT/41b7WGhDq/iGU4mLse6gdHEr+2ErlJbEYI7nt91dUGzEESWMUvRuJcl1Vy9K9L/S1EmD4v/nXlMiZt2yaaNg45FLuVmseOVCgdrY/kH6ReE9HX0qcQAyvDmkQR5ROs4bzO2hL4CS2wtZSNiWXiXRT99GJASdpCfZMkqnde7bJNV2Y4J2BlwV7kRNVITwOlxVUpZdEaEaV3I7VBAoxLS9cVay3ZIK68NO6kSK1TUdSzvpOAlNWE+GUhRCn6O8ODy8V/ac893rOIrGRTO+RK2AKLSrQewLhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZvisdk30PIIr+frATWwTX4vZtsyGYEk4b3e2277zG4=;
 b=lOsyVFU4ZtZaTDk32fzOxTZMymsNv0NdoQSzC0n3rwrxboK5o+Q1DnGsSW7WICTUbNYqXVqKlWMtSF6xqGEZvi3FZi34yxNVMwke2zwBUhBjt/3p/ufFxQgMFdEXUjweHfR1lvBu45DJbMfJ4PnpTtaJF9hzMeS2ArCvACpGUpzWR08Y40T6d3I5CzW8ySA6pLV7gR7+g+Dh9lqoE9iYUlPjQRHEEoEbHc4EqVrhYYSXm/9LCKtCRr8R/bhf06VhMV+pDk5fxT4xu5SaPRgsjSoioitftxfAojubZsO3S+g8U2T+JJW0vrFM6JyLqxfj4ODlPr+GSbd/eTDOtz2Isw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZvisdk30PIIr+frATWwTX4vZtsyGYEk4b3e2277zG4=;
 b=Bhwrpr6br9+sZ60R6Ut7coRM4G9WvlJ5Cl4PLTwrmUr+9fjVbkv226WMbWh07QpAGgrlZm13U6n+HCBPyZ4A+fPFfiXSPlZaS9aKjNczmWJUb2almavpNk6IyJJoFAxQZHuEmOUD6Kd+w300ftMR7uKG9/RSXw3o5Y+XDrdCipg=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by CO1PR11MB4883.namprd11.prod.outlook.com (2603:10b6:303:9b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.11; Thu, 21 Jan
 2021 05:38:28 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3784.012; Thu, 21 Jan 2021
 05:38:28 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] nss: upgrade 3.60 -> 3.60.1
Date: Thu, 21 Jan 2021 13:38:04 +0800
Message-Id: <20210121053804.32512-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR03CA0118.apcprd03.prod.outlook.com
 (2603:1096:203:b0::34) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by HK0PR03CA0118.apcprd03.prod.outlook.com (2603:1096:203:b0::34) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12 via Frontend Transport; Thu, 21 Jan 2021 05:38:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b4bea843-a1cd-4056-1e12-08d8bdcec768
X-MS-TrafficTypeDiagnostic: CO1PR11MB4883:
X-Microsoft-Antispam-PRVS: 
	<CO1PR11MB48839D64766D6ECDAD14E7C1F9A10@CO1PR11MB4883.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/w50zT4toSH7tQAcGe5plyjA1H7NpXHBPeEN1V4EugsNQ7YUmhx1rBR7PqzMR5ZRcw+VXWj9DcgGeK/2S/72DyPhRM1YSbRf7dfKP5AZu8ZF0N6f7vrDuClRWKa/UXgY12rKmwrGSnz//8IRAiz6sisHdnL2SG0Od8gYJDX2ZUB9B/aSOMKIgX/PrscMOZFk31m6UIRaja21oZslJ4o0254k2VAcvspI141Cq1imnfg5pCfEc9y5SkV5uhIjpI3ALRvSlz5nfkPKAJEXGi5M42XaGLwhQySij6UUKMsObr7OKqycZRFVVn5RNyCcaHKCPl1N3Uaoyx3FtQz6BhsZoM5uEiOAqiRwvNH6pKFyioCiPsPb6IZg0mJJ4nLpHpbg2JtEh7YYvy/R6/pkRBx2l5RHjvNwtKEEgKfWoNE0lxIHEyg4TqaBnklT6ZoMKuLkF5aU61Td6DmeBIvCksERmQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39850400004)(396003)(5660300002)(6512007)(316002)(2906002)(6916009)(6486002)(66946007)(478600001)(36756003)(8936002)(44832011)(83380400001)(956004)(52116002)(186003)(26005)(16526019)(66556008)(8676002)(86362001)(2616005)(1076003)(6666004)(66476007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?KJa+GIFD80btHMZUijPnPwAnugvTQZTpl+EOgULWBxc4bNzkzC+D16ZabmoM?=
 =?us-ascii?Q?0RmEGnw0AqNSTTa04uWI7zc0SR2Lb7YSF2ZNDrbPqdWh6X30KNWXnVc1Vcjh?=
 =?us-ascii?Q?qS99J36mk93jf3CRLCcZsGvkWTKtNydznHaQYiTLJJTTTR9CiKDYu09qO+qB?=
 =?us-ascii?Q?vp2mlZuMffDgu74T88ObK/hTsTzik6oDW6WHBNm540KTMttDZkWIld5Ep3Vx?=
 =?us-ascii?Q?ON0CxOznyW9AGBPXNEFPW55QRH2lcVJmHrKp7uHpH6WtTo3LCDC+1ODaBfCe?=
 =?us-ascii?Q?6v5O6zm26GmQKZiAflHiq2l/yey1ZnwDmfkw5an5oPGc1uxwfV8/9PTVsxbp?=
 =?us-ascii?Q?lgqNFXCgDUez2nWjrqCIP4rKXfNh4xJ+f2idHXqk147veGi7FFsTos53vwkl?=
 =?us-ascii?Q?sMNt8LVB9dXPNgJ/3HfBShxtfsPUngG9/nVrboqSiAMxQ3spl74rdwBfIatB?=
 =?us-ascii?Q?m80jSKZuSPrEdEy/0cXnicwYlo7VyLQW1bBnl1aVrDXN06CdW6CITMok+/ve?=
 =?us-ascii?Q?Rou6mJAO23Yf3qet49nOCIT2Qxk3AsLRcw6CimhXIQPO+psGGhUmG1FPBLnO?=
 =?us-ascii?Q?HWZHIQO0r696CoTUYqeGRmEKofr30tj+EHEXR8VdPGxnJaWvWVwLTgUzwePc?=
 =?us-ascii?Q?5Y8UcWBRPb4P/zDh8IJKfMP2TK49HuVWh49JMauOqRIDlXZwQWhSkA6/oVer?=
 =?us-ascii?Q?RL8MjS8Nm1E08+dl2i1UAyCochhl/xu5fK9nKorMa+bN/6CvUSA/7nkxbywi?=
 =?us-ascii?Q?eSTIX1PAar7idQIPjph60A2YCcKw0R2lxSlRYnJHXdKiBdDbtZUyV/iwog1S?=
 =?us-ascii?Q?47Iql0hKJ2lkBtzpdYgTPZdpSdDiw6nbW8CUh8FRZWcF78DGuiXfKOjIU2SY?=
 =?us-ascii?Q?f1X+rRkwXpr95hEmY3yp8xhw/KKAxpiU0+AEciDKnWAXDT9/cjPJ1N8oTT3A?=
 =?us-ascii?Q?cEc2flbZSOKo6sAV4m5RQGOSGDIITSdi3Azbl32gnj/nCTp45L2Wyv9iRrl0?=
 =?us-ascii?Q?+ZLJ?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4bea843-a1cd-4056-1e12-08d8bdcec768
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2021 05:38:28.3230
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OOF1keXH6MxfJznY0d6G4CsC4bjgRYBw/N6Vl4VFje6hnX0IwtkDYDPBZ5KOw6HUObbd12ccSIKIy+UUPyiXZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4883
Content-Type: text/plain

Bugs fixed in NSS 3.60.1:
Bug 1682863 - Fix remaining hang issues with slow third-party PKCS #11
              tokens.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/nss/{nss_3.60.bb => nss_3.60.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nss/{nss_3.60.bb => nss_3.60.1.bb} (99%)

diff --git a/meta-oe/recipes-support/nss/nss_3.60.bb b/meta-oe/recipes-support/nss/nss_3.60.1.bb
similarity index 99%
rename from meta-oe/recipes-support/nss/nss_3.60.bb
rename to meta-oe/recipes-support/nss/nss_3.60.1.bb
index 112f67629..dc147efea 100644
--- a/meta-oe/recipes-support/nss/nss_3.60.bb
+++ b/meta-oe/recipes-support/nss/nss_3.60.1.bb
@@ -32,7 +32,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://nss-fix-nsinstall-build.patch \
            file://0001-freebl-add-a-configure-option-to-disable-ARM-HW-cryp.patch \
            "
-SRC_URI[sha256sum] = "84abd5575ab874c53ae511bd461e5d0868d1a1b384ee40753154cdd1d590fe3d"
+SRC_URI[sha256sum] = "2051c20b61112df24bad533ac37f6c66c1bc0d6ea70bb9d9cad102d20324279d"
 
 UPSTREAM_CHECK_URI = "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_Releases"
 UPSTREAM_CHECK_REGEX = "NSS_(?P<pver>.+)_release_notes"
-- 
2.17.1

