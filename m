Received: from NAM02-CY1-obe.outbound.protection.outlook.com (NAM02-CY1-obe.outbound.protection.outlook.com [40.107.76.40])
 by mx.groups.io with SMTP id smtpd.web12.28917.1612150393787385390
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Jan 2021 19:33:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=A0rUCuiK;
 spf=pass (domain: windriver.com, ip: 40.107.76.40, mailfrom: mingli.yu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBDwzwViRzjz4+oT+D0iIwSo44ITjeP0sKjhzWWD+bP6Y7plU/k4Q60f6QzNRKK8FopGQ1lFGERXInSkTrPop0/qCuv/zpG0YktfXmBVCw/cc+2xkG2wNIrT0/nH5hfh4mMbFqTdjvIFgB9Ayg5XtMjq6ZbSygTsd6PbCunNxIFKHITTQTJOmJp5JdiaSpUrTePLA8lR8ZP+8lJjWB1/DqSozlpvLOdvPM0Q9YCw2Fw+8jnPdaUkyvH/jt4hubOvBIFCG+7gCY+86f4iUT0N+ZgHmFWHfaW1xkvsSWNRg/dbeKLzwluZpDC9F/TczWa2o2JKivD+m5UcoYmy3p5Spg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej9Y3V4OqotxJcfKsL8SPXXJQM4STZBfqbQHtLb03cI=;
 b=X5Pa6gnQYfCDNdYSHE6fQNUpumIv1TZ7kAVFdRTECynF9A2+0EdFnE1YC7YZ5Heu7I2CrLZCzjRFTJiukj/NUDotSyL3dHKRP4GA6K8JGa5GBcO0zowcIrn172Qe8r4XQazukfGeuEE23d0YCN6p9ZCsiW8c60/vPtuHOWuzE+KnaZLiVz2XW8j662KBLTFPopQPF2ugWPQGu1O8+wNglvQV1Ryc6C5ax8liSMiTq72fzn2VVkdJiAHsFS8Uhcb8PcwTxmsoheCeuYGhpUce03eTAKhAi8BhQAYPzyj3UeBV6ezwyrdbkndUPWYMa6K5//P9IKd/nSNSVJbH0o2fhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ej9Y3V4OqotxJcfKsL8SPXXJQM4STZBfqbQHtLb03cI=;
 b=A0rUCuiKQYKil8zPFUXUQKP/tpWBn9hOFGV92Xrz3y5s4shSfL8Ar3jlrZ+a98cMnWsh7gktHWEGUG5EzbooFIXiwMwrjxcYKZCQe3F+GuO2QbA/oiineBr3wvMS1Y32yE3vzGFk8D3vtQVsoKrCZ56tbAopz0FhhieNn1PU0Ec=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB5009.namprd11.prod.outlook.com (2603:10b6:303:9e::11)
 by MWHPR1101MB2190.namprd11.prod.outlook.com (2603:10b6:301:5b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Mon, 1 Feb
 2021 03:33:12 +0000
Received: from CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64]) by CO1PR11MB5009.namprd11.prod.outlook.com
 ([fe80::45:697c:a699:df64%7]) with mapi id 15.20.3805.024; Mon, 1 Feb 2021
 03:33:12 +0000
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: improve reproducibility
Date: Mon,  1 Feb 2021 11:32:48 +0800
Message-Id: <20210201033248.16107-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: SL2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:100:41::20) To CO1PR11MB5009.namprd11.prod.outlook.com
 (2603:10b6:303:9e::11)
Return-Path: mingli.yu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpg-core2.corp.ad.wrs.com (60.247.85.82) by SL2PR01CA0008.apcprd01.prod.exchangelabs.com (2603:1096:100:41::20) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.16 via Frontend Transport; Mon, 1 Feb 2021 03:33:10 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ab604840-02fe-435c-5171-08d8c66219e4
X-MS-TrafficTypeDiagnostic: MWHPR1101MB2190:
X-Microsoft-Antispam-PRVS: 
	<MWHPR1101MB219019EC0759B6F853CD2BA9F1B69@MWHPR1101MB2190.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:800;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KeOe5WevpVHRpFG95dgWLtnvFbwqz+nKiHirE8at46fZPJ7e7E5ktSxKlT5tycmIKZr8qrNlxuOVWbXFbXuQpUN9pGF8h82+r5dLVXNeeLurUngBlyFrU+XUB7p5ZgHUYJyALHW33AjgWmXOYx944ohWaby5D7cEviKMSFZ8VevlYGpAIE89P5FND1dlnHk7fAElVc2VsGXtwWgwmV2c+3rULOQlQ2lUUfoH4fdEpJuPAwOhuDamp6Cuf74pqxvTSwpvZ2jW1VvyHHFqps7qlUHdAkQEkBO6h70P9EzxtrsZaqYToIDZV6dVBP4TiJaL5xBIulk0JNZqkB9bc5d/cuOimRj4gjhwm9Q4i1RkhQZK8eNnT7RnUhX/W2IHMNdog78i5sPS++6QXJpUi5K5xAApgTzWB9h5pF4V/1aTplEKv4e4LZc+9uOMkm962/xj4Rea9A2YlSOxRk5ynHlcvRbO4yVG0/3i7vlpAUFVR6i6HlsnNnwMu1f5UW3XmtSF9L9RRs4CYf1/X/e0DmXZvw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB5009.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(366004)(136003)(396003)(39840400004)(86362001)(6916009)(6486002)(8936002)(2616005)(2906002)(956004)(52116002)(6666004)(8676002)(6512007)(9686003)(16526019)(478600001)(4744005)(5660300002)(186003)(26005)(36756003)(66556008)(316002)(1076003)(66476007)(66946007)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?j7HCHfUHtvdwtpgsowzVZCTKdlW23XUW2E6Q5frE4yzoflM27aLhOiEZv2DI?=
 =?us-ascii?Q?+wnu48WVYQgtF2gjM4Wuhnck1Usqkgxpx48gXh9uD4I1EYxH/aM8BdIZb2MS?=
 =?us-ascii?Q?WuQfewm7DaiF6SxD5sEPPPPU1hU0oj7vQu5Eyp8wx+rKeytVWEUehQ3fyY9z?=
 =?us-ascii?Q?1+8tOQ+VUD45+b3Srr3zJ8IVSDKoEMZvjhdbMQ5hqITUrA0qY0PJppw8hKDH?=
 =?us-ascii?Q?5qbCOEnNeiXIj4PG+ol0sdPN6RFWFRmkS0QB0XczLuGBF68YVZIT7P6pacji?=
 =?us-ascii?Q?gjGFasiGd+WHCpxBj8lkQ2ArjKBslNE2X+jTu23GYnMRoSFRnvPIwiHak+8h?=
 =?us-ascii?Q?Jdm7legF+LSE4o0bFbL6N9CSTJSpeecfKiojPx8vaSZtboOZ0xxLj+zeR/CB?=
 =?us-ascii?Q?hvyBy3F55vpc9lIJEzQ+DKK2kN+bHaQqR2AFz9AlwFnR0l8M4xxYbpC1owuC?=
 =?us-ascii?Q?S67erSBO6RzUlXDtMHh2sSeZE37QnwJnbQzsrRYv79gSpQ+sk9yJXOxOsMms?=
 =?us-ascii?Q?/OkGt00Lnzic8zOBStwdF3wd+EH8GWXdii194N6lSNWwd5e2ztoQV+1RL7ad?=
 =?us-ascii?Q?6FtYiayXvzT3aL79b0PQ+qTZ9WjfKvRRetrbxVEWx9cg2NPeQaeFe0Ca1J8U?=
 =?us-ascii?Q?JAAMYusBeW5WyeGuy4oDznAHjuN9cLCWhiPmyZaFq3CLEo1rCD7XPnsz14q8?=
 =?us-ascii?Q?xceCc5T+SVEQZTKZSFuLJPZTbPj/XdAxmVixEYBxMFg39lENDocOmzg4Sl6r?=
 =?us-ascii?Q?X25sy6vAkOSafFPiSRW1k1nKzl30nZa6qYUVOXotdzq7dTLg2W0iDfgf4t3E?=
 =?us-ascii?Q?eWj9WgJiyMi5TiqxwY1Ex9tdgu6NUITC+EC5KGt+RK8d7pOPrOoBlYc4s2Qf?=
 =?us-ascii?Q?khJqcjz5PjK3Sckc0SKO9k4o1KSdtbUeDL9TeS4v5WFZRZUx8BeDKnBK6lka?=
 =?us-ascii?Q?U2KrPF9vXnNr6JO+6nUZUY38k08QQoPNyDp8MgcsIx+p6S/WxunLU4ilP1Tu?=
 =?us-ascii?Q?GmDwaLTsEW11taPwYK+antR9HKk9648EfXT7IUCnkafLVE95272Btusqf0oJ?=
 =?us-ascii?Q?xjRnaHiM?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab604840-02fe-435c-5171-08d8c66219e4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5009.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2021 03:33:11.9280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FzX5TtiruMzlAvl0nx+zznc6HF1lF50a5n0aMDFGEWe6X7VuYdmCcmsYJyKaEk/TFKnt3Doir28L9fLxO66rtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1101MB2190
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Remove the build path from the file js60-config.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb          | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
index 130ff13ec..614cdf6e3 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-extended/mozjs/mozjs_60.9.0.bb
@@ -125,6 +125,8 @@ MULTILIB_SCRIPTS += " ${PN}-dev:${bindir}/js60-config"
 
 do_install_append() {
        oe_multilib_header mozjs-60/js-config.h
+       sed -e 's@${STAGING_DIR_HOST}@@g' \
+           -i ${D}${bindir}/js60-config
 }
 
 PACKAGES =+ "lib${BPN}"
-- 
2.29.2

