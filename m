Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4232DCF9C6B
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 13:30:14 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.85])
 by mx.groups.io with SMTP id smtpd.web11.14018.1727184613235115621
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 06:30:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=kIZSYvwY;
 spf=pass (domain: kpit.com, ip: 52.101.227.85, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D/X0DM8Mx+8VoqTbPCMcHLBeh1Cz9Xip9ftU5EKTR1uvogA9uIpuYbfFP+RXi9zgZPXOJ/jG0if61VoP5HoOJvYo2IIZi5tZnSDPCbn3b73x5mb69EOAc1OsfH2j/QQVNx7aR8Q7vTIDLiU19xSE6PRiO0JZ17F4RIYw2jgZd/1RD1E5GLqgCct842xyBDAyDQN6GYKFOOYTMHqQo7MKGF1AjmUVeCdMmiPCifyh5IpjTvSu6cWeRCA5gCgYU1DQGS6E78CLUvd3p6yCoxld3R+GJJLL4QGkGh7fDDhcYdESJBzyTqhvqPpfPYO/rIbf1sXU1OQyLeZ1VxdDk8VFgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cE4QOMiKgF1gV0B2hTmcViafbfvuCiC80bVOYDCEQ0M=;
 b=mksirqrZIcLx4f6xvka34Y91qqL0ZGZJq/kJRBJb3G6/KoUQ36QM3CRqCxFavWqp+aH8feC18CTKF0R2e2IO7535k9zq+pcKcSTTaMyUtKlbwumD+O1QT3cBkHyBA/x9nSk4+oVEKVU4mE3m+AuEc680y3Xh/gQFPCbRxs9Kbh8QiC5I0Q6nf2E1I3ZXBoRtbUB4SyX54JhhnzjHEKwC0cgAFfPdPQC1RpgpuPyGJW3gNUfiv+87pzXlpORTl9J2mIGchSQC/cm0LdBhZVCVs4qQVrBXR04kW0x5f/1jCZBZxSk7nWyUHj2I2aHG7QWztM4iI1JIOJnA+p6xJzgJbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cE4QOMiKgF1gV0B2hTmcViafbfvuCiC80bVOYDCEQ0M=;
 b=kIZSYvwYwicvRY0koOgNivrGL6j5Z7beNDiMSupc0mds+MUkj1z47OYNAPKEo79cHEykhOPfdwJalvZ9hD/WUyKyLXWEWF1ZBVbDjekItD1Jt9D3U/U9ollqd2fZhVFOUWMbbW6p+w+RYZVFNpQsZ+LvqkfIkWYZ0pU6nQUzCRU=
Received: from SI1PR02CA0008.apcprd02.prod.outlook.com (2603:1096:4:1f7::14)
 by PN0PR01MB6211.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:70::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 13:30:01 +0000
Received: from HK2PEPF00006FB2.apcprd02.prod.outlook.com
 (2603:1096:4:1f7:cafe::54) by SI1PR02CA0008.outlook.office365.com
 (2603:1096:4:1f7::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 13:30:01 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 HK2PEPF00006FB2.mail.protection.outlook.com (10.167.8.8) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Tue, 24 Sep 2024 13:30:00 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Sep
 2024 18:59:57 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <nikhilr5@kpit.com>
CC: Michael Olbrich <m.olbrich@pengutronix.de>, Khem Raj <raj.khem@gmail.com>,
	Nikhil R <nikhil.r@kpit.com>
Subject: [oe][scarthgap][PATCH] nftables: avoid python dependencies when building without python
Date: Tue, 24 Sep 2024 18:59:37 +0530
Message-ID: <20240924132937.119853-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK2PEPF00006FB2:EE_|PN0PR01MB6211:EE_
X-MS-Office365-Filtering-Correlation-Id: e8223013-67d1-43bf-dc4f-08dcdc9cfd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SRBuGZgMYFxniwX9n7jeaw3xrYmZbJwoyZmJ15zwjFqoxKAGh/rsm9QL8kgt?=
 =?us-ascii?Q?tMqpjI7kiJe4Y/pAZN9rgtiLGMid1aRKg+A8bwdyeQfuNszt5DS8HSkSPzKS?=
 =?us-ascii?Q?FhkCTO+k4KTafJCyGyCzB6VL/tMuz7ZYNlxP85ceBLEIgdzKDH41sBown67J?=
 =?us-ascii?Q?lN8m8959LOu+O3m8uBmp/vRmOyNSnxizj/9WezfGYIsgeSpIRQxwb/ZD7Gnq?=
 =?us-ascii?Q?ixKB1atjOhIkPngxIaARQAPwYjwYVHlJmJFZhzmFFkYOvdbhtYxdHQtXvANF?=
 =?us-ascii?Q?v5AYGjarfxDNBMF2B68qtk6OzJlUtwj+rnfjXGqM7Cyo54oO+tW+qlVrq9TB?=
 =?us-ascii?Q?YoPWkfMNoIWkfmp/ZS+yhQjbc7QM30HoBr2OwoGkBcCHVw3Vz2saymLLFS5l?=
 =?us-ascii?Q?I9UYINRAwf3xOSg1C9Y91Xi+t9IEuw+dq9lmcE80QCsYry3UaoszsMahtGr6?=
 =?us-ascii?Q?1B44LAJV9XRwjl1sygXiYsh1u1gtet35D+DcUeTHpFHclfVOC/b/DlJdC2dP?=
 =?us-ascii?Q?F55AaAf5VhqGMZ5RZIVeb5q3IR4J2+23YygC+x6nJg3mPRCCA1F7eixiyi76?=
 =?us-ascii?Q?DJ5Fn4jgK+1camm0zzu+HeEzyDXKa3NlwKWWUDLo93q9Th1l/ggQAbe5AS3J?=
 =?us-ascii?Q?EFwEyjw6nCaBcXoZlMPwMvYTx92rcEgDTRt4OkMrMtFAYANJ+tJrHf+RFXhv?=
 =?us-ascii?Q?W9lNHN8dHpkB48ZfDd+M7Oj095/dV70zl0i/B0HnPMAgh9dNREhKnPutQnXZ?=
 =?us-ascii?Q?g1mMOG93BSRdNFMI3XmRgrddE2K++OosD7VmVlHch6Y8aDm7qWIb6f0kN7Md?=
 =?us-ascii?Q?ise79HrBXZ1KsM9IuHnZz+zuzciO5gK7pa5JKKg/VKr9lnepXIIylZsv0vrl?=
 =?us-ascii?Q?WjfIhphQO3IXtyYJhJwwex94n1Kckf3PnTsdY/kb+PkVqv/NznfumWaOdsvD?=
 =?us-ascii?Q?o6VPLjmqGDHJtc2hqa3rbaZXDh3RGEtIGSRM6B5+GFk3NJpFNNJwu9FCTLL4?=
 =?us-ascii?Q?QOSOo17TQ/GitymyZm80G+LfksW3RLEsfXVWG3LO/mqo0l7AOZvSz6jM1uuY?=
 =?us-ascii?Q?big3o2A6622r/vcOUDQ3cUTxlRUvn5/OE3uDaFHgEgzG4QeGg47YnSFC1CVy?=
 =?us-ascii?Q?PRWvJukv6ZHYY8p+vIXWOp6xjmCpWMDIvrCBjqep9lb4O/p6zOAnoqTMoBJd?=
 =?us-ascii?Q?ripHJsMQIVI2KPqsBsNF+kdBl51/lKAu+OyvWU4xRIfA1yFw81ZBk9FuvPES?=
 =?us-ascii?Q?I6meaUGbhyrXdEPDP58T/k7XtVU1n+Qu/J1tTSWXFkWliRVRmXBjSN18nLB8?=
 =?us-ascii?Q?sf8d2fc87eZr9RYKGdhEBW8sXRGKFPrTwOj+9XsyTn/7KJhQuOXZny5SP98y?=
 =?us-ascii?Q?nh1/KnhPgf0NeUSgfBoczpU6HtExQ1xN8t8YGn97a1UKsqELwzJHFLo6S46Y?=
 =?us-ascii?Q?MCQWcWi3fZMA1ceRxciPRJnbWIk7iZX0?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 13:30:00.5580
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8223013-67d1-43bf-dc4f-08dcdc9cfd96
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HK2PEPF00006FB2.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB6211
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 13:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112478

From: Michael Olbrich <m.olbrich@pengutronix.de>

Use inherit_defer instead of inhert. This way, setuptools3 is not
inherited when python is removed from PACKAGECONFIG in a .bbappend file.
This avoids dependencies added by setuptools3.

Don't add nftables-python to PACKAGES if python is disabled. It adds
extra runtime dependencies on python3-core and python3-json.

Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 5cf3766cf6395d4bfa5de20cf7427950ca498eaa)
Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/me=
ta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 771892274..17f00ffd4 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -35,9 +35,9 @@ EXTRA_OECONF =3D " \

 SETUPTOOLS_SETUP_PATH =3D "${S}/py"

-inherit ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3', '',=
 d)}
+inherit_defer ${@bb.utils.contains('PACKAGECONFIG', 'python', 'setuptools3=
', '', d)}

-PACKAGES =3D+ "${PN}-python"
+PACKAGES =3D+ "${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-pyth=
on', '', d)}"
 FILES:${PN}-python =3D "${PYTHON_SITEPACKAGES_DIR}"
 RDEPENDS:${PN}-python =3D "python3-core python3-json ${PN}"

--
2.25.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

