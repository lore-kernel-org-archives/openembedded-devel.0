Return-Path: <christian.lindeberg@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C38D0C7115B
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 09:49:28 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.69])
 by mx.groups.io with SMTP id smtpd.web11.16008.1750672158370329078
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 02:49:18 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=j5dkoW8d;
 spf=pass (domain: axis.com, ip: 40.107.159.69, mailfrom: christian.lindeberg@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BkANYK4i0PsK+kcwe2VifppOMWpEzTLFGa1Nz53CRm4PDDXV9Be4Oa7cL6oImS9CUmhYV95nb5JowGFm5skhwKg+Z2cJ+AK5DaIkhanpYvPy1yqAX5G3OIwyLnCC9dNloxOWqsEfPBM6jRC1IppMVNKhZGXKtff7hNb5Oz7EqwOQ5Hio4hfhm+PZiJS1NZHqO/dWtqJBaVk6W/h4P8c22RAzDCswOSDaXI9wdHWFDQUFZEd7Fx6bzT6LrLmsZAZrlAkpCCDyFuza5TK7+3VR4aOBWAF8yoLC9Waq6C6MAJU10AamncjA8wx2vNfoyqu/BAwc+Pju/SuGxJfrDrPnOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FcrWExdCHvj20NZbPvByMi9A0yeeSVEsD8vIonswc6Y=;
 b=H2G0WX+1DkDHlsPADe5leKfC9mt8FBjjMqPnhl6vIF7Redxv1Ln2W6hu193m6rVzFsTwqMzWIdVF+5tASulpYOPdQtUrOp/sG1fxH8NJXf7mxRALKdlKKEUhz1DyJ6BUsz78iv/xZOn7tZEz6lqI6UwO8dYz/sxDw1zmh/kh7uP/WT5BO1uejGYj6x5dNOVIeubqUPgePW5HXzXFqHRMkxhfMd1q4V5J9EaDZLUDJh3TVIYItV1VB8zAtPsG3jdvuwTlVkHSw1ICom/jiGPpMnK/nDQ/pMI8b/gf/QhUn+2ooXW+RrVnjwYrgoNMDQOzCGOlIXE1yezgCSYxtRudCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FcrWExdCHvj20NZbPvByMi9A0yeeSVEsD8vIonswc6Y=;
 b=j5dkoW8d7AYfxEN6tJgS5/AqKlnsx+GLcZr40zGumnoViPYCZHq7ebpPGJ2B2J22EM5fpbqEZyd00tnfVFh3y0GgU8sEeBZ4lAhmVaXgagg3D0vLVuLHNXnomBFqUm3M+/SiVwB9nyJqpUzQQkgmp+XM93+ais9GgnM4YODhQYc=
Received: from DU7P251CA0023.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::16)
 by DB3PR0202MB9225.eurprd02.prod.outlook.com (2603:10a6:10:43f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 09:49:14 +0000
Received: from DB1PEPF000509FF.eurprd03.prod.outlook.com
 (2603:10a6:10:551:cafe::a4) by DU7P251CA0023.outlook.office365.com
 (2603:10a6:10:551::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.28 via Frontend Transport; Mon,
 23 Jun 2025 09:49:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FF.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 09:49:13 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:49:13 +0200
Received: from se-mail02w.axis.com (10.20.40.8) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44; Mon, 23 Jun
 2025 11:49:12 +0200
Received: from se-intmail01x.se.axis.com (10.4.0.28) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server id 15.1.2507.44 via Frontend
 Transport; Mon, 23 Jun 2025 11:49:12 +0200
Received: from pc50740-2234.se.axis.com (pc50740-2234.se.axis.com [10.94.131.4])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id EA84E333E
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 11:49:12 +0200 (CEST)
Received: by pc50740-2234.se.axis.com (Postfix, from userid 21184)
	id E69602597689; Mon, 23 Jun 2025 11:49:12 +0200 (CEST)
From: Christian Lindeberg <christli@axis.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [PATCH] influxdb: Do not skip it anymore
Date: Mon, 23 Jun 2025 11:49:12 +0200
Message-ID: <20250623094912.2277511-1-christli@axis.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FF:EE_|DB3PR0202MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bee16f7-70d1-4b19-b77f-08ddb23b3613
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?tBootOUs2A6viWJf7tbBWjfN7OS/PoX0nsIqfgGPMvPIOGzfQYQ/XWeB8Lsx?=
 =?us-ascii?Q?0TC3/78eBGu9tvtPx4qTNVBVs6BTPLPTwE6VMIGl9YExH7lPzpFDdb98dbVn?=
 =?us-ascii?Q?WyW9v89ugK7UwspKMQa11jyBGUL/4xStsRdqDyxMKibKbdcB1CexrVQEv7U6?=
 =?us-ascii?Q?rtSBAizBBuZK9gustnNkRc9LYE/xKF5wBfDgEG6ryvLaHGTD+uboqQXsm5xa?=
 =?us-ascii?Q?P0Ol2hQyou2ATWlrkAyE2kwIbEVbFe1PhYAl0lmMmgYxJw+e05JZaW/0Znqj?=
 =?us-ascii?Q?GnS+GZQ+q7WhxFOi4jhtZggWjPIEGSTUU3iZyFWNHfkm3p0mt9ESVmn+GVW/?=
 =?us-ascii?Q?jvP6GECTcqaRGQhJcLo3RdUkMbKNFsjkdrRCfPKFTMvlS0hOvyDEcbQDh2g1?=
 =?us-ascii?Q?84EVHOKS6cEG5+qnTlvyxb2+EGT3wmYmN/5Z8UT6HPzQct4YehjgClsNNK3U?=
 =?us-ascii?Q?RpLxgvVvVNKcn7hEDysUmdeBFSpc8hs2vp0KJRU30+GxGnn0LDAtrVqlsBBj?=
 =?us-ascii?Q?+s3yTwozZwKeazXrBCZIJdB0fDQ5waks8NW179DNSuvireK2lUNRlh3XE9fx?=
 =?us-ascii?Q?Rc+wS5QOzhziwXYukpaPDsMjtZFk2pMjhl63HGKuNepQ/rWLBHsoRLSR3EXc?=
 =?us-ascii?Q?uTYR3frJUzAh3161jJyzHCSUekefopQLhYIVv8YSMia3kxnkYgGJ9aEmkLRc?=
 =?us-ascii?Q?VTaybKh30ENqFqdej3CpOvJLISWu3nh2Q3bEnMVBgLGAIkXeqG5ZXi8LDMv8?=
 =?us-ascii?Q?eZFYYOrp6kzLRmbNoC/oHUTG8pgaWYMF+/S+0Op01GQhPwOzSXrwHh0Ftuuc?=
 =?us-ascii?Q?rw7FdJdJQMn9M4nXepfLREf1S8pJnFrlTt6kfXaeOq0JDIBjOkfIXX22ho72?=
 =?us-ascii?Q?NQs63YXpgk0JBzgiqd4HJAqqCnTYsjyMS34BqakVveki/aCaLKrNFu6P4FuJ?=
 =?us-ascii?Q?jHxsmrVv34smXZxR23NyLNA7VcIlMDC8NyFibWVuCBfEkzHTvYv9A3ajzvEA?=
 =?us-ascii?Q?PhC0zvWjBp3Bu922sNzDMvWc2pGUqm3dYxp/QZ6XKEDXoQOSBPqV81AQ6bIC?=
 =?us-ascii?Q?Qv40fXVT0mdUDMOZSsTeV4XJ2dxRS2LAsovevTHBkzYmTFIu1j7Lqze0m4MT?=
 =?us-ascii?Q?GQ+lQlOhGISMzxMRLpYOgPqmIDmFYZwjBfY8E/rO/frPitszS3L9JClWMvhN?=
 =?us-ascii?Q?fVZsNaU77aRMJ6ByEdOKkgfbpeZ9iRUvaL/n2IguoBPXECUHK9DhSe5lFaHb?=
 =?us-ascii?Q?8cYEXp09tEmrL4ThrVrrsXuk83U1QVXHWMtQDVQcZgbvljjjqDs0kE1dAHgl?=
 =?us-ascii?Q?t+hUqiCPQP6kbVslOx9D0gGNuWGJ6C+5IUDyHtF09qLvMZATaL/mPy6wmHqS?=
 =?us-ascii?Q?JiE0tJRDK+z1zYGf6BYpMUr89M/ozXlKrjIE3W79UAGA3CO3pAVznzXy4h+e?=
 =?us-ascii?Q?U2i9hAUMdtWnCAFqRz5CwBs4HhpI0+tcmhkKKQMcfQaIPDpZTg5NlPwDuGeu?=
 =?us-ascii?Q?hBoe9zPz02wx4LjJ8yyKp8Mlcn4L2O+45iD9?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:49:13.6017
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bee16f7-70d1-4b19-b77f-08ddb23b3613
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0202MB9225
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 09:49:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118073

From: Christian Lindeberg <christian.lindeberg@axis.com>

The network access during compile task has been resolved now.

Signed-off-by: Christian Lindeberg <christian.lindeberg@axis.com>
---
 meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 2055a0ff91..1d6c45c518 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -201,6 +201,7 @@ RDEPENDS:packagegroup-meta-oe-crypto =3D "\
 RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 =3D "botan"
=20
 RDEPENDS:packagegroup-meta-oe-dbs =3D "\
+    influxdb \
     leveldb \
     libdbi \
     lmdb \
--=20
2.39.5


