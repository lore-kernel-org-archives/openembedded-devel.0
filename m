Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9D8C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 20:09:17 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.80])
 by mx.groups.io with SMTP id smtpd.web11.56155.1723493354992905498
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Aug 2024 13:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=gB7HsSVX;
 spf=pass (domain: axis.com, ip: 40.107.105.80, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OigCfsXhiW600AfsRuM+XVvbGYBTDwJ8brt9O0/WwazyfTlHsP3lIwzgtUueweX8r7gXAIyg3AQ0KkTBM2Yo4fnCEOzNi7NC9pJh7ZloTb0uWDw4ue6SmJIXFrNuq6f/k9G2nvRfrtwGvRxwdX+MFVg7+Jy0tYrF97iP+6cyfwstHbzAW8/rt9FqHdVUWNhq1aBE8WvTw45/PmVwvPi6bxudyqE6HPzEXiLUK6BaHybcerTq/OTcWb13Ku7xgLNvl6ZoAxPytchl3W2jaZgunCdOOXmzf7AggaxK2v0mTJETz1NDkbVM3Lb08cUaOLuvGf8UdTerc/zoXg2TjLymLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b25gbVh6EODpg5FC88xHxVufAd7nZQcVmTXgDFQT0xk=;
 b=NlKXtt+t2C7HalJo94+HI17+hd3bHEcmSMdAmrAOVyMhRH/shpqi7OSHueA2dPaWO3sQ7hBF4GKWPdR8Qq5XyxQDo9Y+2bPtu7q7SVsfR2kKdeczi/Xri6S175aCl3fmOdNHU4hgk+fWkmKO7I/dzHYSCylpHhj+mkAdbvxvCH3TiFuAWYHHQ9pBUxEG5Zw3i9p5UrHxnA2pKxPAQQBfOb1fLAfHzQcjY75KRI8p2acWEG9vQ3TMGXty2MfPgNwzW8rDEbVWkLs/2Q0EF0yNUzkUxDRBUl9VVo6rl4El1efpew4HHnguyBSG16TkR2mHXIJ/KSt21LWjGt5SZwmQ6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b25gbVh6EODpg5FC88xHxVufAd7nZQcVmTXgDFQT0xk=;
 b=gB7HsSVXFMmpCOPmzbNEky9u0QaaW2QmHQhS1yF9NpjBkcQpaLz0rLfhuIJTx7FsbbefYyUDaijwent+wffBGKrC/L0Nb3uTYJ6M+rmezOO5XT/lqHZ6lTlAVtBJCGw7VO9RNiYVJkKSTTe7y0KNq3Sz35zit4BDgqjImQKb28I=
Received: from AS9PR04CA0149.eurprd04.prod.outlook.com (2603:10a6:20b:48a::22)
 by PR3PR02MB6218.eurprd02.prod.outlook.com (2603:10a6:102:72::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.20; Mon, 12 Aug
 2024 20:09:11 +0000
Received: from AM1PEPF000252DA.eurprd07.prod.outlook.com
 (2603:10a6:20b:48a:cafe::b8) by AS9PR04CA0149.outlook.office365.com
 (2603:10a6:20b:48a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.22 via Frontend
 Transport; Mon, 12 Aug 2024 20:09:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AM1PEPF000252DA.mail.protection.outlook.com (10.167.16.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 12 Aug 2024 20:09:11 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:09:08 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 12 Aug
 2024 22:09:08 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 12 Aug 2024 22:09:08 +0200
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 3BBFF31F
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 47CK98aO3077964
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 22:09:08 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 47CK98mu3077963
	for openembedded-devel@lists.openembedded.org; Mon, 12 Aug 2024 22:09:08 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [scarthgap][meta-oe][PATCH 2/3] hostapd: Only include the relevant parts from README in LIC_FILES_CHKSUM
Date: Mon, 12 Aug 2024 22:08:53 +0200
Message-ID: <20240812200854.3077901-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240812200854.3077901-1-pkj@axis.com>
References: <20240812200854.3077901-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM1PEPF000252DA:EE_|PR3PR02MB6218:EE_
X-MS-Office365-Filtering-Correlation-Id: df1da1df-86aa-4673-0e87-08dcbb0aa163
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IJeYK2+tFFxL2iKvul1b2kdOVB/e2F5tAumIZ+g+Ex/EtNDocZ9KR1iiETFF?=
 =?us-ascii?Q?x3CSRTWLG923povH7PGPn7w5PlC/Ylc5AlC0Xzj6rrd34RozfMc5Wbh+UtBW?=
 =?us-ascii?Q?fkw58zB5rEvy9QNX8y/oAb8inylAtekMTCfi4E63w1KmQAt6iIm+i7rP946e?=
 =?us-ascii?Q?FfdYYWiwpS7WbRaGDjrtXarZa7Jse8N1znjdYBuoom7BG8JfTdmZFmyLjJsK?=
 =?us-ascii?Q?cH3YwJ40FDw9eCihIp8uZTSB86dQEiF3l1Mmp3xdddCJy990O5wtdQx8om1s?=
 =?us-ascii?Q?o/B9mLe2vkRpiCHjVviauOBEw9FVBo86M2X4nqNEDormDQbROGp4oZV/0VL6?=
 =?us-ascii?Q?mnwDfxevOmOliMgjAfoTnbsF2a3VUv3qpP7PtnhBN3HE4158DuGzKxboHJwT?=
 =?us-ascii?Q?9Z33oMnQz9R+MG47wUbQAe770YXtY1KG6bAVpDzKCJRR5WlILWCnHAorrfe3?=
 =?us-ascii?Q?ArEmvQTihJbmpSnouC/xI4iS9Xn+ZhptO+MsnEYF9AKmU/tOraI/AJPZvPFP?=
 =?us-ascii?Q?cTK36bqNOtoj2DpCRuoiPKjwRY5DCDgjOuHc+/fLSOY3XtX1SEWAmRIO6g8Y?=
 =?us-ascii?Q?0JC/gCrG28LJlzxpq3eGp6wBImlddGWUwccZPcHATB9OrleW/3Jrtqss+etn?=
 =?us-ascii?Q?Gtw5r4XnoNYuaDlFyi3GBCCC61tkuz5Nc+Y2OAuoOqfeXomjwZ/n9WcWWDky?=
 =?us-ascii?Q?Wl6gcVWgU7UzUh1+aXTw7ch/VQuI5R2KpDscsldW4T3/AUOgyMD/t4UjUyGE?=
 =?us-ascii?Q?cowmvvn7QdYw2WXU78Ly6hL6kz239zaM5JOQGDuCNbArHkoI7PS5n3eu8lvD?=
 =?us-ascii?Q?I5O+J2eAg5XJS4B20xFCiEA6f6qEslHAnikN1VWDT5FwHmiyGH+cetu9+Lv4?=
 =?us-ascii?Q?1oWi+ScS0d9iGhWEPGofyTsruHQ3xyn8Ll1WoipdQZ1ukyPFtagICCCwjSxC?=
 =?us-ascii?Q?tdfIKUEMNOUFld5GV24aqg2l0LfiJuIepw+fcXwvfDWAd3KMbItF7ZaX6AfZ?=
 =?us-ascii?Q?CrgwcQzZeKnBAFUjb3Eg/RK5oXNKvAY8VvSttdncp31PEtrJDX4+WFOQOa0/?=
 =?us-ascii?Q?/nGsB3MTLvlG7RhqwQKWcJ0k0XI2JDBqHSq9muu6xe+f5ZUbVCo3iDTdjXBC?=
 =?us-ascii?Q?p++Ik5h2wgepNcLCxubJ6BCKvGrdc4COay2ibiAcuBaBfhtiIG0yn1KoOXxO?=
 =?us-ascii?Q?I3EN6ZhBhnl63vRN8PepTbbT0akPxwmUtcZltLJ+Eu7ndqnE6iYxdLaOigku?=
 =?us-ascii?Q?xS0OOVb6SADBoph6pqiC50t2G0aDK87yTzzwOQfyOqKxWVoBEtGx+O9+G9oj?=
 =?us-ascii?Q?gTY37cxZwaM+kwOw1MosEEbN3YvkndjdmLZfIGNclUgRSt+MVB461InXiNYS?=
 =?us-ascii?Q?3Y1TMXgIttqW7DjLzyS83532c+sJ?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2024 20:09:11.0989
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df1da1df-86aa-4673-0e87-08dcbb0aa163
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM1PEPF000252DA.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR02MB6218
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Aug 2024 20:09:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111779

Only include the lines from the README that cover the copyright and the
license text.

License-Update: Only include the relevant parts of the README
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.10.bb
index 3383f6cac..3c5f78f91 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.10.bb
@@ -2,7 +2,7 @@ SUMMARY =3D "User space daemon for extended IEEE 802.11 man=
agement"
 HOMEPAGE =3D "http://w1.fi/hostapd/"
 SECTION =3D "kernel/userland"
 LICENSE =3D "BSD-3-Clause"
-LIC_FILES_CHKSUM =3D "file://hostapd/README;md5=3Dc905478466c90f1cefc0df98=
7c40e172"
+LIC_FILES_CHKSUM =3D "file://hostapd/README;beginline=3D5;endline=3D47;md5=
=3Daa03b8bd6216d1a7ca01fd4b89863073"
=20
 DEPENDS =3D "libnl openssl"
=20

