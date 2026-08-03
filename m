Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F0B2C55175
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 08:01:28 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38355.1785744079853042538
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 01:01:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=FAOhLGtj;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 52.101.83.79, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dFYby/bHMbDYRUSiVJShVQcvTG15rijC5YwlM2+4YoSEbxQ22aXrVMAIuHlQCXF1SqiOU4Kdz09XNe8zIuoVn0mw4wD51XMkCPywJH2gaZdEKobgiwxpF1YxSSXOxxZBa91KtKv8FVm9DemjF1tbImxoxJcwXUsWcSg0YwWye6Z97h2k8KmJHV4OINA+K6Qr2kdpLn5YnWa5Jfmk1Ajocey68ESaEagrB2zmlW3WUrwwBfxvCIrLMcPg1isyAfO/9pIpaD9+mWNM4Nrtj559P1UMrkRCVkm0yrQneOeeGKKMnLTTOUo20TtpcUGoiYgI+vfCWbzMyFIrnI14D0/rJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KKYBGJhtlgPGaLxGis4ImIUyY86VN9lrmFeQZYAydPw=;
 b=vBlih4g9OLBaoS7qQlF3cydvosIaoeK6LKle0l2nASghQJTLCnzPfn8Xa7a/tdDGZvLPbBdDUZm9H/3NWFvTCTFHS6dy529qxA8djYVReZpaKl4Q2UucfmdqcR6HXjmpmQL6QuMK46YCinQxDy5Zeu04y7z06yy7HtCP5VIUG54oT1b3kJyroYW9wiWTHKSBYNnd58wQrt+j/DFbBlpSj6NIeWxVJMjbZRHhGUEq8TnNok6kuyxJIgTy3BKLxt0/BWXr6OEvyWOuyM5FO+4g7FGmZ5BEtZWwRG1B8FpVwRQxoqtfArLYbUua+tYGZNpaWjGcG0JL96VAEeMsGJnKtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KKYBGJhtlgPGaLxGis4ImIUyY86VN9lrmFeQZYAydPw=;
 b=FAOhLGtjocc4WkpdrO2a5AVrAu7yWmsMMdq2uOyTZanFujo6U2K0bFCf+gq2k60Fcyi1xUEr8whgTTOymetoyq9qW7uLWintwgzTU41Gi0g1uWrI4D69h/o8+rZiZm/1jYKEZUtNfmZ5Gg7ng2dCHEUoAdt0+i0Eiej1BbevwagfKNqW1Hur/W3CjrSvC9Icnw2+ZUG1n6F/k58NKTNhahN4JieE219h0yVEmwGeEF1pxf2apkw6xfxqVYpl4JigQz0zLOiqLqrtOTXaHZ4Vy/XBBbJZDTn77uAP2Ys/oodYt5YnTvHA/uo5cVIv1X4uzheclGjPTg1wHmG+sdzFQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com (2603:10a6:20b:337::17)
 by DU4PR06MB10806.eurprd06.prod.outlook.com (2603:10a6:10:639::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Mon, 3 Aug
 2026 08:01:14 +0000
Received: from AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16]) by AS8PR06MB7557.eurprd06.prod.outlook.com
 ([fe80::44ca:1bbb:6b57:4c16%4]) with mapi id 15.21.0270.017; Mon, 3 Aug 2026
 08:01:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] meta-oe: Drop obsolete INC_PR declarations
Date: Mon,  3 Aug 2026 08:00:43 +0000
Message-ID: <20260803080043.320324-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.47.3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF00023996.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:400::188) To AS8PR06MB7557.eurprd06.prod.outlook.com
 (2603:10a6:20b:337::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR06MB7557:EE_|DU4PR06MB10806:EE_
X-MS-Office365-Filtering-Correlation-Id: 84caaf75-ff79-40c6-9052-08def13563f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|366016|1800799024|52116014|376014|18002099003|11063799006|10067099003|56012099006|6133799003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	JNbDVRhVw4OSShze9ejhuHSlS8FlZLXjFopwF54aYvDCqmMMmJoPZXpNOqsGF4hhg2VAXU0fLYNQhAGUPy61O/nCwegvTQEWpD28dmrYj+FzQqBWnuvwxYPmBFmjzXW6o2vBzO33rV58tUt7Fm+pjCFJOqB94tW+MEjIfWxEMAItZ/Yatc/9lfDM4RUAxQb/cJuHHx1MI1zaLcl7ntfaM/x7zZR/eaPplN5VwMCjB3PSxBZs2qGJoQCw5JUW0YXNBluBHEpv+Y7HFFlWZ1hBVG8JEfgR6c0jJKD9AMXnS8lJLzn7hvfkEHMh4K5lkF0XvLzpDP+tXBFCagUUVwyZy7wdFL5MtbD95qlYcnqlTAlBd8ptiUzwEkxBi1navIM+qegEjvDO+bJRF9pYYFjZCj8MoctmWMKkM/P1rZGCY24Wsyndieq+1K+rTxTs4UYYjFPuQhjmqr9xbMCIDdELinCUEpR3z+DjjpS615zVGEKJ+N7/moQZuv6kbZQxu5BtWM3TelDprJyO/uNOiU35O/WEjq+I0Vkr0kYpgGsytJ4wdJzPogrzXSLGq7ena/VSRdjws0xZkxOlgwhc7If7c6uq5FexWi0k8NDK8Z286tVsyTiXAjnsTXDROriwAKknSN878k2kURqGF2di+8euV+FfZM6jxd4/76Zq1OhSNTRjhDjiyj4/gAMeTWNJHlzIZynN3q10sV/fwYdVpoFObXmV5SSxmdjWNYAyl3jeiQ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR06MB7557.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(52116014)(376014)(18002099003)(11063799006)(10067099003)(56012099006)(6133799003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2XXO+B5BYa5y1h8mghwL8iVF/EJN1/gSOWCqB0PyTIFlJEModSDj4e+uUWwC?=
 =?us-ascii?Q?VvPCcWKud5wUUmbzPzEBk+ZXRGZPmdDpJW4YGv8qhhN8G9Y+11XwV2bTpZiD?=
 =?us-ascii?Q?EdYypukmrkNI+OGgSHUA8QKDfRSnb3CwEGL/zpsofJXbdReE5h1yOWJQadwk?=
 =?us-ascii?Q?UAHvmJpeQ9I0ukrglA7R2+g7S67qwqeX2sLf7NToqBuhV7YfDXP0nADs4FJY?=
 =?us-ascii?Q?rYJAy12Uy9QpvdG+nSGaHAFwVxQ7ZKU1UgW4ayc2AJhsoOc5xHEuCAdgAUxN?=
 =?us-ascii?Q?AmRdJEXDTZ0BxD1o5VGBcM0uAEvs9sXMjIyGn+BiqUqJW+ObQu4dqhdf5mFW?=
 =?us-ascii?Q?hJrb/hcBj4V/sSp9ktkyj/8lrlAiZpR5+xOaquSHdNc/ErVUpwXKxT/bSN67?=
 =?us-ascii?Q?Rrfca9dV6sKSPrYXMUTv8LHoFo+tQUmpVBY+Sv4jIVAUp7a+HQZhcvwiqheH?=
 =?us-ascii?Q?HrieGBxIHzCivpFK1BujkSTHFlydrO+OX4p7PWWTfo0mT0Pr6X6XUJGFXjvi?=
 =?us-ascii?Q?79jdzlcFAuxTmxg7HCx32by4xfIh6L5ex3douU4FHEMppbMrVd0wPSeh/eng?=
 =?us-ascii?Q?S7ps4HxKLtdecI05NTyLPJuW48WhsOEXjsrUNpFcIv5zF1EyD1T25kykp4Bt?=
 =?us-ascii?Q?pj9luUcW4i1e0sNmuh/bnJ2CDPhtXmVEjxGvPcxedNab6OD2Vmym99+/klQj?=
 =?us-ascii?Q?Ai+/hw2mWiDIPTL6jViK6LB92drD18SfEdB0SqEdDIYr116NjTx1dZxQsDM1?=
 =?us-ascii?Q?zXj9YI1bo2sQRBQkWIUg2f1Zr88/Q13Mk/HycnOC1EFDwTMv16PzHSUfyNVD?=
 =?us-ascii?Q?69GU1oEDdKMc8a7Y0c1PDcEa0MwEQhwgXGJ7Gtpj7HJOkEA2vxwz0/K2WPSa?=
 =?us-ascii?Q?MEXQNs3fS34W+OlQ1V2XOpSmiAcRFsMs/XhrB3Ge6nCBRxrE5ZatQojvYcK+?=
 =?us-ascii?Q?tl5owPoDZoW3itI/oRf5PE50Qy3TpfS6/i/GfmHIilFkZ+R3FFv+F1bzdnbn?=
 =?us-ascii?Q?ISiWZB43wYfBINAcVkviBoF8p6jNGBOdg1pOW0QqBLur1JpuX9bdViLA8AvV?=
 =?us-ascii?Q?qQayOPluHpROjihbruavzp6/aRXsvJdwNiCt/XnIWjMfQCXiOfaiOuMVNmr+?=
 =?us-ascii?Q?m6JzbPSHUKPKO5J9muagz2J952vAFXKhHprqlagGy/C22AM6PiSDtaFCpZ1i?=
 =?us-ascii?Q?x6bb5wOvj0KQGVeGPxchvooI+HGW0l2GKoirrn3vo8sHpq8GGCDela7JEtXI?=
 =?us-ascii?Q?Mk6yNSUDhtEhXpqHQGqgya4Osy8qvBrXc4ic0a/sn5YWzggH4wQIBHkdd9ub?=
 =?us-ascii?Q?oh511rsE16YHbizXBI+pj4+ltEDq7thOFlgfmme83Jzmb9yIUyxLcvHr1j2T?=
 =?us-ascii?Q?a3hcaofLzOADvKJAYiMiFzytNybIBGmQFTEKhb8UFpSNjYqs9NcByYNuD9+1?=
 =?us-ascii?Q?duA0sAkGZNjXcw/vyQrDafcIoEVxd1efbB296/ybpHwewMsxK6VviIxmOeMg?=
 =?us-ascii?Q?dYTpy3EVkJ9AgLLO0Kl/wjiyUiANHlb3BoOYW8ROtWABA6PBjW1PYAA1Ajno?=
 =?us-ascii?Q?EMOF33RYocaD+iwszAbzd7F20sGOxWibuughRanCcqzfIfMY4BQ+bGCAmrhv?=
 =?us-ascii?Q?LsGEP4PAlReY9G3MOj+U59ZKxapbqxlkhHfXyjaV0a+zlRq9kxNgh8fGuIqF?=
 =?us-ascii?Q?6mjDTQ5Ver0dFwjS6J5IRrrdE9emECAjRdN6ctB4nUru81H2Zr50BzWsgtqd?=
 =?us-ascii?Q?Owq0QOoRaA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84caaf75-ff79-40c6-9052-08def13563f0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR06MB7557.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:01:14.6923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K8IR3dYGj2qJpJdTgF8kPv+48HOPN/YC7E+auzwo+JtcwRus39IxUXBpKqGqvAWwinVOJu5te28lS++A4CA+GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR06MB10806
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 08:01:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128674

The variable was pruned from oe-core already in 2020 since
commit 3fdd772b419b ("recipes: Remove remaining INC_PR variables")

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-dbs/libdbi/libdbi.inc  | 2 --
 meta-oe/recipes-kernel/linux/linux.inc | 2 --
 2 files changed, 4 deletions(-)

diff --git a/meta-oe/recipes-dbs/libdbi/libdbi.inc b/meta-oe/recipes-dbs/li=
bdbi/libdbi.inc
index 0aba91b5db..a7e5e92bc7 100644
--- a/meta-oe/recipes-dbs/libdbi/libdbi.inc
+++ b/meta-oe/recipes-dbs/libdbi/libdbi.inc
@@ -8,8 +8,6 @@ LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd8045f3b8f929c1cb29a1e3fd737b49=
9"
 SECTION =3D "libs"
=20
-INC_PR =3D "r0"
-
 SRC_URI =3D "${SOURCEFORGE_MIRROR}/libdbi/libdbi-${PV}.tar.gz"
=20
 inherit autotools
diff --git a/meta-oe/recipes-kernel/linux/linux.inc b/meta-oe/recipes-kerne=
l/linux/linux.inc
index 79a916d46a..d63d68a35f 100644
--- a/meta-oe/recipes-kernel/linux/linux.inc
+++ b/meta-oe/recipes-kernel/linux/linux.inc
@@ -3,8 +3,6 @@ SECTION =3D "kernel"
 LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd7810fab7487fb0aad327b76f1be7cd=
7"
=20
-INC_PR =3D "r0"
-
 inherit kernel siteinfo
=20
 # Enable OABI compat for people stuck with obsolete userspace
--=20
2.47.3


