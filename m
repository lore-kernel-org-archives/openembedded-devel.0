Return-Path: <nikhil.r@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66774CF9C6F
	for <webhook@archiver.kernel.org>; Tue, 24 Sep 2024 13:34:04 +0000 (UTC)
Received: from MA0PR01CU009.outbound.protection.outlook.com (MA0PR01CU009.outbound.protection.outlook.com [52.101.227.94])
 by mx.groups.io with SMTP id smtpd.web10.14138.1727184837655290660
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Sep 2024 06:33:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=GzTI4+is;
 spf=pass (domain: kpit.com, ip: 52.101.227.94, mailfrom: nikhil.r@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cX+I8XRFvpHTX9PeUcy3P2B1CX5AMiDgEP+msvMor5LlfXMvmaOrvu0vU5zO6FHYQqBZmLz0ZpidHV4YOPT+Fxt98xOil0F3odA09yIPPCH6R/Gp+RzAZoMJCu4GYiilaYrLeB6jM8zcjICV8t5xWXwHEYQSN8HQyOVeefgWUKqmTC1u71zEZE2wilZkV/XC15EGkJsK8BuS7+KFaLPHeqnJe/qisckTBe8jsHMRO40E5OXPmca0FwFlDd+XzpEjkSrtT72DCr+JxIrchiuovczix4dZwX3RIuy/Y44Myj9E0AVQbsWmBhL3XyDuTuUx8hJZK8OOyVM/CGXFasU7vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=752z2uaYM/I8SIrVl0KJRhwN9LO7Zh880ns9VFFgPaM=;
 b=GWtlyaWMgeZKToBm6ZA/ZU0X2L+U8pXHNM4s3UaUb7hA5tB61UmOYAK/RgH9izbnz3/lVX0mgJ0eKCNR5nOtMEbNW8H4FP9dbDAn0AYQGM/NSLSJR2uHmmcpXvU4XiLaxk0yLRs+v28gbX7TN2NF2h6l1jtoOZC2FqiZ5y0aEzuP4IPteC6tSOb2IRP5zY8t6XlBb+Mqxb8oynFCEyihcuz64VxFD2AztY3tXpfD25vly1LLJYNamDkywVS+q+ijoxs8URda4wR06UUGfo8Fo2qeeL3TKdkhJ+kIuATbaSyQ9VJ7Z6rScAhJv/CwYC7pWHMh5TpujoKsXSDi5BLvVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 103.243.227.16) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=kpit.com; dmarc=fail (p=reject sp=none pct=100) action=oreject
 header.from=kpit.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=752z2uaYM/I8SIrVl0KJRhwN9LO7Zh880ns9VFFgPaM=;
 b=GzTI4+isaOJkplulff2LSdgEhX5CX6nJYgwUh14/2EYdxDnpF6jSfHQjImDB+c99ZTc9dbNDy+pmrFff4RrDD+vOMjpukd3cuBcVzFXMaUjr2FkkhDMh4oWui42SXwGMmGMX6Ng+SPbznAZn1M+QP3GPf5CIDDzF9L0cTTkacAg=
Received: from SI2PR01CA0020.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::6) by MA1PR01MB4420.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:12::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.13; Tue, 24 Sep
 2024 13:33:50 +0000
Received: from SG2PEPF000B66CB.apcprd03.prod.outlook.com
 (2603:1096:4:192:cafe::78) by SI2PR01CA0020.outlook.office365.com
 (2603:1096:4:192::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27 via Frontend
 Transport; Tue, 24 Sep 2024 13:33:50 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 103.243.227.16)
 smtp.mailfrom=kpit.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=kpit.com;
Received-SPF: Fail (protection.outlook.com: domain of kpit.com does not
 designate 103.243.227.16 as permitted sender)
 receiver=protection.outlook.com; client-ip=103.243.227.16;
 helo=mail.kpit.com;
Received: from mail.kpit.com (103.243.227.16) by
 SG2PEPF000B66CB.mail.protection.outlook.com (10.167.240.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 13:33:49 +0000
Received: from L-17494.kpit.com (10.30.140.23) by PH3EXCH01.kpit.com
 (10.52.16.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Sep
 2024 19:03:46 +0530
From: Nikhil R <nikhilr5@kpit.com>
To: <openembedded-devel@lists.openembedded.org>, <nikhilr5@kpit.com>
CC: Nikhil R <nikhil.r@kpit.com>
Subject: [oe][scarthgap][PATCH] nftables: Conditionally add ${PN}-python as RDEPENDS for ptest
Date: Tue, 24 Sep 2024 19:03:30 +0530
Message-ID: <20240924133330.120292-1-nikhilr5@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [10.30.140.23]
X-ClientProxiedBy: PH3ExchFE01.kpit.com (10.52.16.111) To PH3EXCH01.kpit.com
 (10.52.16.25)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PEPF000B66CB:EE_|MA1PR01MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: fb95741f-04ea-412a-eef7-08dcdc9d860a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SX+brOUTFRySXBZ6rOu/Va4svg35StZscv+bR9hQ6gSOeYjv0G83s/41XdrP?=
 =?us-ascii?Q?ipOsFgwVQ4EVYh1CcrpTFdflqcZ5/SttXGMUshdpa6wrChPLVVk8BaYxMHVE?=
 =?us-ascii?Q?qyIQPdB6Not+n1GpJdigUwH/hBcb0242cRW3nBYJ86eowoXmE0vfgOmajTeR?=
 =?us-ascii?Q?UTTXPdh8fE0EZ8pYEoQgkNgyH7NrV/FEi1fjQLJiXxoofncHxJgazFl0TmEa?=
 =?us-ascii?Q?i39lT2Iqjvrq6qdts4sSvGgc5vqhvARbd/ycuCnQ4bt5SYj63tfP4kLKfYPm?=
 =?us-ascii?Q?xd5Fi2spo3f1OM5tDNWETDy2c/0M/MJBrPzUTOG8yZTRhgzBFIHEcw4kE0ED?=
 =?us-ascii?Q?2wKVfDU5FJ8YAh6421D4M7IKVYPq4KbRcdYfcYCcOfpZfEQYyjdq9YBYotGe?=
 =?us-ascii?Q?mbKqC2RUCUQxmSY/KIC5AJjPXjR+U7y8QJGx6LpI2se0ITfoOrRKu5/ohXaC?=
 =?us-ascii?Q?JLSg3gWKjVTHraHSOJsvqNMf4EUEAAkORfPfSJPf44aVtYY8lldfj9dCykq8?=
 =?us-ascii?Q?3nO70bs9M9XpHOLKdRkP+p+0RJ7LnKk8PhNap+jNWwql5xirogMsuPu9+xP6?=
 =?us-ascii?Q?qBFioDI9M0w/U4UxOkssBHvZV4rawY6q43i8Ax35xpW/QLQmHV/NVdz5pyRn?=
 =?us-ascii?Q?ME+lYedpdcgjMt0LrZC/oBhWDAuT8RYTPsLmvc/s1PntuXpCn8flneWcMDJt?=
 =?us-ascii?Q?0uhGZ66R9vlQTUOKsWOtMlg51FBterOCKRHDaNCoXaeOFcuLuUwXLZ6N4nMa?=
 =?us-ascii?Q?uTrObJ9HFg046aEuoodsRWaRsS/Vo30TQue1ebzX0KWOdwSeDtEw7C93lhbq?=
 =?us-ascii?Q?BpDmYyNw3tg2KVrVIyEj/lMxWVqQQnjkLwAPTtOKU8WQksj7Mzj9Bs0yD6ee?=
 =?us-ascii?Q?eDi31CsiTXv7x1U48V4txQIy6pwSHcgSpsC2u5A8bPcKMKKKLrvbMlUFOVQG?=
 =?us-ascii?Q?yVOTXJdzalJUwPDqky06wZX40e1axDNtzF16/KmiWFhdWVQ8w8O/B4pL3NqB?=
 =?us-ascii?Q?f/SNUDcVeUHQPaRxF7uJMc1H5mzIpvz6tk1bGbBEAy4c7le5GZ7NRV2tYcQ5?=
 =?us-ascii?Q?xhnIFpHhi4lEzhDR+5CaCR2Gp9CDa6sJf1FLJCJVtydKGOELfLJfJkSzjf1D?=
 =?us-ascii?Q?7D2691f+tmWBNPodkCMuIpfEiEwiHXwy4F4rnNxansrR929VDSgT7VXeKq3I?=
 =?us-ascii?Q?htndqxl0GEU6UsMR3J3v1eufXA2GSSe6xQwvyIbkA4lZhJiKHE9FjtZaR1xs?=
 =?us-ascii?Q?+AWrKAG7MaTJyzYfnAMQkH3FTNcMrkVqkRriFqd+wTlsoxEw43wvxiLXHDQl?=
 =?us-ascii?Q?/3IB7ZC8xWqtWeG+bBKEWhLCXKNzXMaiuxBT1BKfcCkOq5GfwKSx8mHa4Iy6?=
 =?us-ascii?Q?M6gLIEJs6hlYZUGOxPxf0Z7uMNGs7jJzTD4Q7cGZu5BSlXx4cpg07YxQcEDy?=
 =?us-ascii?Q?4LzJFVZnoSmI+hdjYDj0x4q4/cEFTpk7?=
X-Forefront-Antispam-Report: 
	CIP:103.243.227.16;CTRY:IN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.kpit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1102;
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 13:33:49.5357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb95741f-04ea-412a-eef7-08dcdc9d860a
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3539451e-b46e-4a26-a242-ff61502855c7;Ip=[103.243.227.16];Helo=[mail.kpit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2PEPF000B66CB.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB4420
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Sep 2024 13:34:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112479

From: Nikhil R <nikhil.r@kpit.com>

This commit updates the RDEPENDS for the ptest package to include
${PN}-python only when the 'python' PACKAGECONFIG option is enabled.

This fix is required as ptest is enabled in the Distro features,
which was causing the following error:
ERROR: Nothing RPROVIDES 'nftables-python' (but /home/builder/src/base/node=
0/meta-openembedded/meta-networking/recipes-filter/nftables/nftables_1.0.9.=
bb RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nftables-python' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nftables-python']
ERROR: Required build target 'nftables' has no buildable providers.
Missing or unbuildable dependency chain was: ['nftables', 'nftables-python'=
]

Signed-off-by: Nikhil R <nikhil.r@kpit.com>
---
 meta-networking/recipes-filter/nftables/nftables_1.0.9.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb b/me=
ta-networking/recipes-filter/nftables/nftables_1.0.9.bb
index 17f00ffd4..569ab6f6a 100644
--- a/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_1.0.9.bb
@@ -64,7 +64,10 @@ do_install() {
     fi
 }

-RDEPENDS:${PN}-ptest +=3D " ${PN}-python bash coreutils make iproute2 iput=
ils-ping procps python3-core python3-ctypes python3-json python3-misc sed u=
til-linux"
+RDEPENDS:${PN}-ptest +=3D " \
+    bash coreutils make iproute2 iputils-ping procps python3-core python3-=
ctypes python3-json python3-misc sed util-linux \
+    ${@bb.utils.contains('PACKAGECONFIG', 'python', '${PN}-python', '', d)=
} \
+"

 RRECOMMENDS:${PN}-ptest +=3D "\
 kernel-module-nft-chain-nat     kernel-module-nft-queue \
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

