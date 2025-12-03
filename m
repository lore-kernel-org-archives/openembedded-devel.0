Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D45AD12D6E
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 14:35:07 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.11])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16686.1764772505653577640
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Dec 2025 06:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=A0qkeU1v;
 spf=pass (domain: axis.com, ip: 52.101.69.11, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTPdXfpTxwKRGn+mEblo1SdkEGbFlsZmQOrox6wmWJmb/HnBh55aUjZkRNOdOXCrPQ4Vu2FiE8pQGjXCxIJOPBAJaX69ZPOM1s0OZLsCtNUwne3vtnJLHDsIAzub+YlJXfLpZKUZ0DZP2a4AN82MmaO/jfmSTnnyWNsInwDGKmGEGNPHYaZ+VXA4Ys/Koa3KUBzq39S87Ue+dPRL4tVYfvyRRqL8fL5hC1dqFKxSJhd0brbVFa0rfFGUgq2mtwRLCnWjwOECsqXQeoHve5NnnngUdi+0yg/U0grujcVpdxdqWpelWfLI6ka/kNZxJPrRkWw5WOc8A0foB7QXL2vWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXQA7qvbmIlgGy55FIdSceONdrqIB6DCCSlRS/cCW0E=;
 b=DZKC/JFoZUvC8f6iP8Qk8Jr2tLovjr34YSI7RSwAw6oYxYcNPyrAFkIQOt40TXW2vbcseEyyB9sSd1TJtYWsELIAJj6G0Sl1XiGgfebYdfbWak92CSxH/WMy5feIevhsh88Z2HLo8J7CBVH4S2dMLz8B+Yjbw3SyxuUc41sTUe2cyYqDGnHSgsfiyLRd+hNsgbCKr4c/Xs3wnJccaVecof9iXGBsp4ssaBrNPiDDUbXOLo8zNzMYYIqeGA6fPSM9EtaIu4vpdvhdEO2KDhR46Dbq7ugsS0PgWxJbYIMjcoVndEGHesQ4wvYzCVGBlHb1jlbhTjB33o+N3d3G9ZfWSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXQA7qvbmIlgGy55FIdSceONdrqIB6DCCSlRS/cCW0E=;
 b=A0qkeU1vQ+ASgb11xwW0bavLgAMSAcfWeW86y2MNAJlOX65rI1A7j+1TBhdzuaz5OsjcsJ9fXtxpNDyjYa/BgpzdS+x5mxlRJg7AM8NnDCUs0k6Uo3/ywartsHmAQ34KMV/Mpimjcm79KQVM7MDOcmX752ah0ei0Q+Q0b5lsl7g=
Received: from AM8P190CA0024.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::29)
 by DB4PR02MB9502.eurprd02.prod.outlook.com (2603:10a6:10:3f6::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Wed, 3 Dec
 2025 14:34:59 +0000
Received: from AMS0EPF000001A9.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::ec) by AM8P190CA0024.outlook.office365.com
 (2603:10a6:20b:219::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Wed,
 3 Dec 2025 14:34:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS0EPF000001A9.mail.protection.outlook.com (10.167.16.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Wed, 3 Dec 2025 14:34:59 +0000
Received: from se-mail01w.axis.com (10.20.40.7) by se-mail10w.axis.com
 (10.20.40.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.39; Wed, 3 Dec
 2025 15:34:59 +0100
Received: from se-mail02w.axis.com (10.20.40.8) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.61; Wed, 3 Dec
 2025 15:34:59 +0100
Received: from se-intmail02x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.61 via Frontend
 Transport; Wed, 3 Dec 2025 15:34:59 +0100
Received: from pc56063-2339.se.axis.com (pc56063-2339.se.axis.com [10.92.3.2])
	by se-intmail02x.se.axis.com (Postfix) with ESMTP id 1E612142E
	for <openembedded-devel@lists.openembedded.org>; Wed,  3 Dec 2025 15:34:59 +0100 (CET)
Received: by pc56063-2339.se.axis.com (Postfix, from userid 14323)
	id DEDD912040F; Wed,  3 Dec 2025 15:37:00 +0100 (CET)
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/1] Revert "proj: Fix do_package QA issue for unshipped bash-completion files"
Date: Wed, 3 Dec 2025 15:36:59 +0100
Message-ID: <20251203143659.736329-1-pkj@axis.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A9:EE_|DB4PR02MB9502:EE_
X-MS-Office365-Filtering-Correlation-Id: 92c73fce-3ed0-406d-5801-08de3279233e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LB5lIvqDpy6jR/m91nscEHqsDUQzNHo+Dm7AITAa1wTWQj5FfTWPPNX2hQZ/?=
 =?us-ascii?Q?PV6MDDvzeIv5PuT/MbPH9juraSr50Qfvp250ZSuAOs01c9DQXS32bcfK3rIJ?=
 =?us-ascii?Q?etpoktVkcYlPTstyN+yqEUqkhSJ2bVIhrPpZv/I7kU/Zz+IDpb0RfmvoEslw?=
 =?us-ascii?Q?N0haRqbJy8NyBB3hGcPqK7kUTngik6KatoTc2qUJNF4AxrseTwIPfPCSaqR8?=
 =?us-ascii?Q?gRs3RSWI/SXkMRzac3JgOPVMj4nSoUFNV+XjklMFzQ+pNAAjEiPZSN+ntcs+?=
 =?us-ascii?Q?Oqy5CwPmVw0Zld16dawHQ8YSTMXZyfWfU0cmafXVqQ7d3fo7z7gQ2stmpAuj?=
 =?us-ascii?Q?1MLgPh/fguwOWAmhfT65Qs7V9x0c8MTMTVSTFptDElzfs28Jp9r/4UWWBO+y?=
 =?us-ascii?Q?PurfhrT1djYNJ5GskhaDw+y+EQGz2P+EjCCBkr4ka4b0crDgVTr7ruGAmb+x?=
 =?us-ascii?Q?UNkE6KduhTN5p6W6wBS7bLkK25egAAQbT77RCN91u8jDoX7tB9ZDv8otYJyu?=
 =?us-ascii?Q?PwjKMT+0Sa5pRRKlR744QAdw/C4GOpKI/fN/9Q6vduFXs8IWDIy6GUOGBuPF?=
 =?us-ascii?Q?dwjspG5w+pXUj6iAQapFWMN0v9T9lbniGo3mSaHxXdUtx5CdwteGbYrHBQyH?=
 =?us-ascii?Q?qkYoSzvidSsMvbOlWWEKlGxDfmXIO637iohzy9MMY8UK/hcRULEaLyMIqb8P?=
 =?us-ascii?Q?A90ynnSvBAJ37rcnPpWOJutGRv37dURBOK/8WY6qPdcIbGJPn2BnjPnLjioO?=
 =?us-ascii?Q?x8RSf5mRxzZzmiPilUGN5xqBfcNPX+qmQnUKo5taJ0TfKOJyuhwZjZwjDcy7?=
 =?us-ascii?Q?GpUzSyroBPIoWoUESH6zIUjbStJJ009Qmpy0t+mLH5keF6FmhHmOdaYJgzk8?=
 =?us-ascii?Q?4gMLeNF2kHXjrdPG5gemtgEhGFHDn6CWRRq8DeoGMFmKDGweeRlTY+3964PZ?=
 =?us-ascii?Q?oCV7dN8pIAxuf4o/7Vy3Dw0bSsYne1Kgb/a7YlKYsN+pv+ijMy+5Jfnq6Zvw?=
 =?us-ascii?Q?VhTfxMKq+QUKoq12pFfzfFkqmGweNK90Hf1xr3Tw2+GF8R57n25gvfU3E/3G?=
 =?us-ascii?Q?yla5zT1oPF7oVlngujM0fn2uMLeVM/5X+Cg/OrzOKPRaCGCm9OcyWQPlyLf1?=
 =?us-ascii?Q?zA4MBoMJiIOX/TZfzWUb+bUg2DujZrPSFOR2vBtsATfhfSoqyLwgvuNM7tfc?=
 =?us-ascii?Q?XokP32cd0LNLTd5YjyN3rPAWON3mzHYs53FSM8zhY0F3mGg8CJ3DtY3dO4Q0?=
 =?us-ascii?Q?6FIM8iKjRnViPlTqNlztmwlOk1dOI1mOtroP2DKt525EbdEp+pjvm/symXjQ?=
 =?us-ascii?Q?QJd/p9fv1Q5w+rzU2x7qKYHFuQVb+hDHVm+n+Xvv/3oJk+Wyw/h06MvY7Bbg?=
 =?us-ascii?Q?PYrF3NtRrcbkfFtQuOP0+kQCyFmOqmwqrbltnJvCLsR3alcNL1QdFyZk6jSt?=
 =?us-ascii?Q?flRgo0R4UCeeFAS2xnx/QCaAlqxJepnQMyl3SwPet7wZC6VhCchWPkNyuXYI?=
 =?us-ascii?Q?qyWUGidI0ovPEg2gIt4mEt3D+bYv0pb44l/G244WtDQSjiUPb+Zfu35aH7wN?=
 =?us-ascii?Q?AXb8ituYuwcDYDfaV7o=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 14:34:59.6475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92c73fce-3ed0-406d-5801-08de3279233e
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A9.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR02MB9502
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Dec 2025 14:35:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122277

This reverts commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d.

Since this recipe inherits bash-completion, adding
${datadir}/bash-completion to FILES:${PN} should not be needed (in
addition to being the wrong thing to do as the files are expected to be
packaged in the ${PN}-bash-completion package). The reason the problem
addressed in commit 1175d5c8c13d73568d4ab55a3cf628456fcc1a7d turned up
is due to the recent change to the bash-completion bbclass, where it
started to use PACKAGE_BEFORE_PN. This clashed with the lib_package
bbclass, which used to set rather than add to PACKAGE_BEFORE_PN, and
since it is inherited after bash-completion, it overrid what
bash-completion does.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

I have sent a patch to openembedded-core to correct lib_package.bbclass,
and it obviously needs to be accepted before this is integrated.

 meta-oe/recipes-navigation/proj/proj_9.7.0.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb b/meta-oe/recipe=
s-navigation/proj/proj_9.7.0.bb
index eb9fe46f30..2a41f1ec52 100644
--- a/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
+++ b/meta-oe/recipes-navigation/proj/proj_9.7.0.bb
@@ -12,9 +12,7 @@ inherit bash-completion cmake lib_package pkgconfig
=20
 EXTRA_OECMAKE =3D "-DBUILD_TESTING=3DOFF"
=20
-FILES:${PN} +=3D " \
-	${datadir}/proj \
-	${datadir}/bash-completion"
+FILES:${PN} +=3D "${datadir}/proj"
=20
 BBCLASSEXTEND =3D "native"
=20

