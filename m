Received: from EUR01-DB5-obe.outbound.protection.outlook.com (EUR01-DB5-obe.outbound.protection.outlook.com [40.107.15.54])
 by mx.groups.io with SMTP id smtpd.web10.2728.1627499979969191481
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Jul 2021 12:19:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=LeAuWs9B;
 spf=pass (domain: arm.com, ip: 40.107.15.54, mailfrom: anastasios.kavoukis@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxroSd96BymO3IIk8dXWF7hA2+oYJR0hnLelYKtwBsk=;
 b=LeAuWs9BzLOPm3WH3iyqqWrCZEtHF/0DtNpqg2rVsSPXvgqWLHhwKWovtemW3deu81G44yO10iOW+1EGTl4Z9omM1pRub3dGxvNsa+U6uccqWhNbJqYCMDHBqvB0nHmhcNNAfgww+WJGJilyxoYdvC6IDa8HPANvyoKpjTBIOpQ=
Received: from FR3P281CA0068.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4b::15)
 by AM6PR08MB4724.eurprd08.prod.outlook.com (2603:10a6:20b:cd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.26; Wed, 28 Jul
 2021 19:19:35 +0000
Received: from VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4b:cafe::87) by FR3P281CA0068.outlook.office365.com
 (2603:10a6:d10:4b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.7 via Frontend
 Transport; Wed, 28 Jul 2021 19:19:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.openembedded.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.openembedded.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT014.mail.protection.outlook.com (10.152.19.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:19:34 +0000
Received: ("Tessian outbound cee5995f7b16:v100"); Wed, 28 Jul 2021 19:19:33 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c01bc7fb8042a977
X-CR-MTA-TID: 64aa7808
Received: from fe7e8b0cc005.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id F57901B0-0836-42F4-B734-8EE2C1A44B28.1;
	Wed, 28 Jul 2021 19:19:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id fe7e8b0cc005.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 28 Jul 2021 19:19:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ccSjeaqaA17Ggg2JG6V3d7JZfaq0lR6JQhA7QZ5iVYQVqcGhyDRwPgD4USP02Q2tdcFzmwfdDGKyWr2PCKTVPKst5yeZ9CnARzJD8mj46SfWagxthU6mZSPkkDxO8YNMCn7eNdL2K8O3yuDn6AitssIHQVtOISRm6OB/nH5cR5mswikDCHNE1NPrmQiQAw7o8cPt0KjF34ia9yE6T9TXj/nCaGb7SazUzs0NPTI7/gJcHCDTFchuUUmHOX8Z2cqeduw+Z1lJVQ/X5X0EY34lXU22/V/r+KBkuIe8ssAkI2z8cWKa7axvoaa+gx8EKQSokXY9v2pORdcO+3GIP/dz3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxroSd96BymO3IIk8dXWF7hA2+oYJR0hnLelYKtwBsk=;
 b=RL/RXTn7Hpl9DSCjMPE49jSeJQP+u4Y9I3cn14xNhaab+GUsP04ItW/+0y4cv6TSrOQ1zWTGApx8WWSlW2DkBHUy6P3+jghmMMjLQwRpqufakE6mjh9BnkhLoLeIgBLlbQZOkD3s2mJjiReYnvy2jBkF/cqE2yjedRJ3qUjMVRrMmp+/Al4oLoYwMufZrKP3aS+KZcErga+O6uLmkdtXd84P1koNg6oL0KbbHwIWVMMC3P2znIgmzYBFVfDrEJLKmIX+kct0INvf4sMSzN5UimDfqS2d2g1mlHQ+Mwtz4irCXM+J9CNEGcTL8VcXuIle+Aw+0YvYn4+C37FFG2GT6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zxroSd96BymO3IIk8dXWF7hA2+oYJR0hnLelYKtwBsk=;
 b=LeAuWs9BzLOPm3WH3iyqqWrCZEtHF/0DtNpqg2rVsSPXvgqWLHhwKWovtemW3deu81G44yO10iOW+1EGTl4Z9omM1pRub3dGxvNsa+U6uccqWhNbJqYCMDHBqvB0nHmhcNNAfgww+WJGJilyxoYdvC6IDa8HPANvyoKpjTBIOpQ=
Authentication-Results-Original: lists.openembedded.org; dkim=none (message
 not signed) header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com (2603:10a6:5:1d::24) by
 DB7PR08MB4585.eurprd08.prod.outlook.com (2603:10a6:10:7b::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.28; Wed, 28 Jul 2021 19:19:26 +0000
Received: from DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9]) by DB7PR08MB3082.eurprd08.prod.outlook.com
 ([fe80::1974:4217:8e30:94a9%5]) with mapi id 15.20.4352.031; Wed, 28 Jul 2021
 19:19:26 +0000
From: "Anastasios Kavoukis" <anastasios.kavoukis@arm.com>
To: openembedded-devel@lists.openembedded.org
Cc: nd@arm.com,
	Anastasios Kavoukis <anastasios.kavoukis@arm.com>
Subject: [meta-oe][PATCH] pm-qa: fix paths for shell scripts
Date: Wed, 28 Jul 2021 20:19:16 +0100
Message-Id: <20210728191916.17335-1-anastasios.kavoukis@arm.com>
X-Mailer: git-send-email 2.17.1
X-ClientProxiedBy: LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:191::16) To DB7PR08MB3082.eurprd08.prod.outlook.com
 (2603:10a6:5:1d::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e124468.arm.com (217.140.106.13) by LO4P123CA0101.GBRP123.PROD.OUTLOOK.COM (2603:10a6:600:191::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend Transport; Wed, 28 Jul 2021 19:19:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86a0d309-061f-43d8-1c13-08d951fca243
X-MS-TrafficTypeDiagnostic: DB7PR08MB4585:|AM6PR08MB4724:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: 
	<AM6PR08MB4724D4B32EB22E52F4B9E47AFCEA9@AM6PR08MB4724.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:167;OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 DGTY9FICVwBOqFfV7CdS2XdNWCfnDDPXOkLLPLYvvsDKPNJo30jUHqL+Evge+lSrRqECePu4P1HWpxC7bHBUS5YnCtJpVSaFmRn64ZM5E38m7VkeaUZFTcCe2KymfykLF97vAB7mT5CfNQgeRS9+L5GbENCwDoTh9h2rqXOSahOr4NbhybyLvAC7Da5VHzgqc3j+yL/aHcX6SDeiD7Y5vAXYsrGcck1Y7nIZnLGXSWVsd6uO2iyTeG07UG2+q5Dp1B7SgQWByjwys8ggEvIqc4huP3BfM7PA51M1V4ykqeisJmrzwuiQZstAWayP/rQXHWS0r9eq+f4LuYrfCXpowGwTfYkV7ywDhLh2lH88+GZZx7HB3tDd6tHbyXTizlEjgRdI5xPrn4WgrTiAanI6GJoZWZtLMkx5R6wM02kK3UzzmYVvzJfL2tQ0TTRdXRaeQM3dXOmxH9G3de1ZW7WM4tgDmyeOeJYYYb9nxzqsXFhp/nDCMmyzza5WOCngMErljnYxbePfHyjuuxCVhgmYTJyHMz68MS5vgMOnmBVoIN9Ya6OsozFGwb2RUtFDLncwgzXl6QznhtW+kFqptOcrip9Yme00T0wJESUfY1+hMQQRfRng/RTL23GhhZgZb9CR+20NEUy0EtOMotinQT5gIpJ/IQnc4ySrYfurB9RHrCEjBm6MwU2cqqEeutVh7NFnrdAcmsST66H/cc5gg20vVQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR08MB3082.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(376002)(39850400004)(366004)(136003)(396003)(8676002)(66946007)(6486002)(6916009)(38350700002)(316002)(2906002)(83380400001)(5660300002)(38100700002)(26005)(44832011)(956004)(86362001)(6666004)(52116002)(1076003)(2616005)(66476007)(8936002)(66556008)(7696005)(36756003)(4326008)(186003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
 =?us-ascii?Q?4yPq4DdNU6BdyarENEGiNQWQcCpOi1WC6COGEv9EQE3/6B1Qh8JCnDG1sdqF?=
 =?us-ascii?Q?SW4Wlkt77pYKppOjYPzXBRPn9uXkIgoU3r8QY+f21LpPAYxrvrh51mZ9Bsm9?=
 =?us-ascii?Q?IKx6QatycU2EhDQydYV3KuaWRjK+xi1reb+4y2YTFKaehOIxPxuAVzEHH8ma?=
 =?us-ascii?Q?jSakXy9mMiDoxknDl7Hrg7qNZsdyQbn15WrakjmKVDk9CYNrSkUcVB9rhlrB?=
 =?us-ascii?Q?Zrab4EbdEcToZcAki4NEO1bRebcF9rg6T1p7vI4dypPaWtif7ZMUqhlpXiag?=
 =?us-ascii?Q?Yc9dVGbbaONRDt1mazv5sSuSMjKCB0T2aAJMlomv/Yc+clLLvVucfXDfRgtS?=
 =?us-ascii?Q?g9BO3LkQ1KZKslPppMXZRvd73RT9HNsvwj/SL6hxRo8WMTLR8C2gWKaRdV5s?=
 =?us-ascii?Q?HN7swNjFEZVLzMxo9zMNedtmZNpzePi9IDjKFKA6r0/63bNSm6K6oVp77zYj?=
 =?us-ascii?Q?EavUGPP6JuJ92b2F36kQEpy6pMDYod/i9lntziDwI/xWc7M0fs99duryIJJ1?=
 =?us-ascii?Q?VCRNBmj+79XWYVDn9O6kXyg1eqw2HnhG6IiQbG9+2DYbqIvqULy2XywXTZkH?=
 =?us-ascii?Q?h6oEw0GifVEKX60PfwAAu1lhbVCQgXhbb2f+qkAxq4H1tnnP+yPK0MF98MiJ?=
 =?us-ascii?Q?QezNRdg2LY0t0+BQuqLXxMnXeOVqgSzL1baELivf8O0/3f6NphNmgkBrNH5A?=
 =?us-ascii?Q?5cSYXfTQNRWIYyhYKy9gbTFV4WJl/MYwgohOm408hZSmhmuMuxFY01klmjJq?=
 =?us-ascii?Q?H3JCwAHzECWbKRLQ90Fn+uUQ0yHgix1a1Gpo8eTnmnWS7YIIMzm349xb3Yqk?=
 =?us-ascii?Q?JQ2psaMtmvz8EPM43JuJFsYFITy9ta62YQ0bll5CJkHc/WxZ1ixv8FNLwfm0?=
 =?us-ascii?Q?laFqe4kmSiY3REHdUwlW8QTTTIxPHSDv1Jt/m7/jcSaLWIYtOme1dqgEUpGY?=
 =?us-ascii?Q?wsPtERm37k760KJ6jFPPVQIKlHej3SGzArRRTmWpnlKNzpFgVc3kDfkxRnjr?=
 =?us-ascii?Q?hCUnBtgGFzNlsPWulsFSY7j7gBPPvBMs41BOOLCI00sh4JKOVTcrdwR+7eWM?=
 =?us-ascii?Q?YwRcLZP3swrASu0j+WEJCL91bTATOySbYwK9brEG/qwL562AJk+01UxsxEMN?=
 =?us-ascii?Q?4xrXjvILP+uSn/aZCE9yJr8yuLPmbfQKzvaD6svbGWu7he9Yxg8cMo1FiR4+?=
 =?us-ascii?Q?0LVUF9qkbhWuZiBibiB5PGB5w4tSV+IY5PKDEfS9yCk6QvG8cF9ZhCAPA6Cl?=
 =?us-ascii?Q?E8+EWxcpNB0+ZtXxKkIIi9KI0sy7cXXt5Oh9o/WgesP4BbgdvAeJZynlYVfj?=
 =?us-ascii?Q?qaU75k7dDZa6mPBIaoVF0nBt?=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4585
Original-Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=arm.com;
Return-Path: Anastasios.Kavoukis@arm.com
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	830b33ee-3911-4526-0a10-08d951fc9d0e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	jmeJ/gLjhKjs0kcm55BjNv5Hm9nBavOtoHMGosIWuJvE9RyukifhXYbVIcX2dpz8EMx9+sfl5pcMR2FlVrO5Li4ObmdSYb1l1aetnCAJ01UwSF5z0lXH8q8wqhDLSUY0L5wFRJefSjGdzNCDqchn1UWTzBW8cpW9dOM6bJnCN5QUpFyPF5igSMQXX488r2XI9aifmo/w+ah+1Qv1/NRJ9S41CFXhbAdaD/UDDOVS4Qkb6PjVABpUHGfDuncgHvUD2Ovh7UwMJyosDSFDBbCzPWyypwhDwoWkatvrLmIuC9EIu7ClufSQj3VWbo5dWDhQD8Fjt42ZJBoIiwn5fzUlgB65YY8nnTJAux9hGW1U8igjnfuhqzgz8I/sPdpBRlqrewQeK9ybjkY1CHAlC4QkNltXNkbUO5pumVYwfrL0i3YU4LnEVYg9GwRtlOd4Dk2vWkFnmBEyTrv8+iFn/V3brUaQN1CV7BgU+k+SNplFxGg449vfJTkH3AIaWPb5jlWfb5cFrnix3ae+3bheKWydxRGUl8ze0bueDok1Oe/boIVEb2sBEB/RjGJEp3vYdVXmzdnzy3d06IAskWvjg898DAt0tymj71gcqbbxuq+yh/LkmYjreBbvdbiGxti8pvbwRMBMSNppLuwqJ/+nfPXjoJdiirai1cr+2am1dviHTW5ZrgQXVpgDSpPFi7vEKrzk+yeY+p2zOd9CPdRHliIlUw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39850400004)(136003)(376002)(36840700001)(46966006)(36756003)(4326008)(1076003)(82310400003)(186003)(36860700001)(316002)(956004)(2906002)(2616005)(82740400003)(8936002)(70206006)(8676002)(478600001)(70586007)(6486002)(47076005)(6666004)(356005)(5660300002)(86362001)(81166007)(83380400001)(44832011)(336012)(6916009)(7696005)(26005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 19:19:34.4391
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0d309-061f-43d8-1c13-08d951fca243
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4724
Content-Type: text/plain

A commit in the repo of pm-qa:

"adf9df9 Fix path to library files and change shebang line"

Changed the text that sed was using to replace relative to
absolute paths.

As a result sed was not effectively finding the text
"source ../include" to replace it, as the sed should be now
searching for ". ../include".

Similarly for "../Switches"

Signed-off-by: Anastasios Kavoukis <anastasios.kavoukis@arm.com>
---
 meta-oe/recipes-test/pm-qa/pm-qa_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
index 7e9971ea4..bb641437c 100644
--- a/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
+++ b/meta-oe/recipes-test/pm-qa/pm-qa_git.bb
@@ -42,6 +42,7 @@ do_install () {
     do
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
+        sed -i -e 's#. ..\/Switches#${bindir}#g' ${script}
 
         script_basename=`basename ${script}`
         install -m 0755 $script ${D}${libdir}/${BPN}/${script_basename}
@@ -54,7 +55,7 @@ do_install () {
         # if the script includes any helper scripts from the $libdir
         # directory then change the source path to the absolute path
         # to reflect the install location of the helper scripts.
-        sed -i -e "s#source ../include#source ${libdir}/${BPN}#g" ${script}
+        sed -i -e "s#. ../include#. ${libdir}/${BPN}#g" ${script}
         # Remove hardcoded relative paths
         sed -i -e 's#..\/utils\/##' ${script}
 
-- 
2.17.1

