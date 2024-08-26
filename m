Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11FAAC54733
	for <webhook@archiver.kernel.org>; Mon, 26 Aug 2024 09:41:21 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.127])
 by mx.groups.io with SMTP id smtpd.web11.48817.1724665270076341150
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Aug 2024 02:41:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=n+AU4Sai;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.22.127, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c4SfQnkjh/9UYISTEmBrfvMn5qsJiEQpi6QBPtBkxGYmOmr3GGihIr3TgDs2dhnDi0++SOiyyiywiPN3VUYRhS6qg9wkOxYQIpAMVI1/7/lMbn5Q1JLh4lYHkcjCZJ/X/rnA3QffG9q1MP4Bt8g9x4H2o5UANPx35gjHKQ8H+G/9hp/4YIs9pIuHLZVYKp+j0c90IOPoL6IR8lyPRP8WRd8yXn0lkGjpaA0g1A8OVyEMIIsXGxwFhXn+U9Afk0IjFhuHkyV5m7647zfpIXODN638npGTyZ+Ck5rkTYmCVzvp4Fg3QGUAViHaEZ8VCYlxN5GTvzC7hPIjWa7eQoVAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rrKXP0opMjcHqSgzIBf2eaJuH2ZastSMJhqQefMp154=;
 b=R635o1vu4WGpj+pmkTcrZf864x0zoEMsR11R063fvfAWdtJStsHHL9o/qeZSDvS7Iu/xNF15mpP6ZaJ+hVMpnZCVUZTDg6VuGiBGbqnC9QwNm5XRRlJFFswcJQC1ikfR3HYAmionsImmZCcWxBAKjzzl1nDC59q/sh5Lg9bvT9JAEXcGxMoXY7UfaOVnkFviesSQPMeXz9Uu58OxpvgPIEVyDJjeMJunmDULvxliY2Aj7Ept6Q9VsWNhWVcUXRKbYRcL7p4eoYezST9CsucjqAN4ig/9Jppg9KPFPstbTAw5hsYHTG+wdE2NYoMHJmOeHiB/JB/ein6vFHzKFl4ZYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rrKXP0opMjcHqSgzIBf2eaJuH2ZastSMJhqQefMp154=;
 b=n+AU4SaikQOfKjW/XHCQC8SMiA47ixQBTV1qg+g88lMJ3Nx1JFQlvP9wNf7/swYvLei7ifWI+5Cwgk5wuVYjvthmGF9N30TdGjDShqOhSVjObfYqCjgjAETalnR1GD6gEaSy+Vwhc+f3Yh8YwoYVlKB1Hpzy4GhpY3FmEX1L2Wmdf5tVus0xAwkHa2RAQI4O5WypBCGGFPKy28QCzvW9pfBVv30bB/CEq+71IYceiOPAT/TxgqfxWMI4X05QSnZ5iMW9KjAbRQjOA0A9pXx3VDimvUZ8NbyakXihoIfWW+rGEqLr+0fZsrfrVOm1a3WutUFfEoetkZHobb1cE9BYmg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9577.eurprd06.prod.outlook.com (2603:10a6:102:44e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Mon, 26 Aug
 2024 09:41:07 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 09:41:07 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-python][PATCH 18/21] python3-haversine: Fix LIC_FILES_CHKSUM
Date: Mon, 26 Aug 2024 09:40:18 +0000
Message-ID: <20240826094021.2744296-18-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240826094021.2744296-1-niko.mauno@vaisala.com>
References: <20240826094021.2744296-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF00003668.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::384) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9577:EE_
X-MS-Office365-Filtering-Correlation-Id: 036ceb4c-027f-4c8c-bcd8-08dcc5b331b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?buCPk/eZEJhzuatICug+xZR2g23gk8GCfmUvrzhvw2SZJymeOmbXTUL8041r?=
 =?us-ascii?Q?YkCkOgHoEoj62b0taAD9S5A3VLkhw1holro9LfmXXB/FQ0ORf/bhDvCMzcaN?=
 =?us-ascii?Q?wcPJzvaIRQ6UlG3oXSav0/MRW4BsDWtz5PI8ZnDuYJOj5XxhJLGd6i607lRw?=
 =?us-ascii?Q?qm3CttDVuzyF3+SFjYz1Pvpr4GGBjR/ID8qCSmzSYsCn1DqFXW7Br8VrDTIK?=
 =?us-ascii?Q?adq3PeT1QT7mH6wZWVYdxejZAFLibgRCveWRzPHqednZk2T4cafdBPnBJzqR?=
 =?us-ascii?Q?/wY4QMu0NLumxRDB9BBZlOL5atLEfNQ95wcXYnvNZHySOe31aetLcrljC4XC?=
 =?us-ascii?Q?e5Qgvi/W/sKf8SwFVsG3teNYTC+uG86VP3+Un/8sbMrEQPk83iokdN/cH9lL?=
 =?us-ascii?Q?wYw4sJX/6/lqkZTV3bcNR5ihaTQkcx19SJJ6f0+HNmMLuuLaMscAVha+iyeF?=
 =?us-ascii?Q?VlwIYmzxfD6iBN8DiKL6tFWUNEXzALEC2pvMN46kTYMRjuwskgMSeB1VL/7C?=
 =?us-ascii?Q?c1ydx6rV/QwLWHGLU0yuQdsZ1AkFr/kgALXS7j5DBHNzTRIJZjF/EdVO556p?=
 =?us-ascii?Q?bMeIsbkEHZ0A2uXsOr+61mKKZe8pB4lsP5DbA9ThH3fD/7nAgvZYhluBZhF/?=
 =?us-ascii?Q?MzqF4hxz94O7nGWBRLfagG0klYk6/JTx+Pyx3NpZ0NOs5a7bVWRqdjlSEDYV?=
 =?us-ascii?Q?7hTL9V8uD0Kxfy4fFBfW+Cl+TetaMeqDUoXengeW8eGieZiukAQCj7NrpabU?=
 =?us-ascii?Q?/ohdIit6Xt0YE7wAzgCy9b+IfLgTDPAtnvktQG4x4FYqw+sQPYJNt0lKUPaj?=
 =?us-ascii?Q?++fPpcR5YU1irKLeMbJ7iZ6DRuqhJi77qnBfmMnk8cVDKnGdNWSZLIm1re5U?=
 =?us-ascii?Q?DTcTT7kepff5rY9qo4XoMc/zdyHfDbIVyEpvkWxpJDtk4mtHw8tZIVfdClte?=
 =?us-ascii?Q?IoPuZiOwKeTUENBZslgNTxE+qh1Dd9tkooPC5CyiERGGUIj/Vfv5TYeKBkIU?=
 =?us-ascii?Q?8T9i+3I7IUJdnXhp7q35ag8RfHQHyWKRW2O+KxLw8Ofv3C19tkerM3wpCaJd?=
 =?us-ascii?Q?HHseZ1K/EpLp3d+JwspGKw2vcOHHyvu1Y+UmWSdpbdvLZdm2oXEkrvloD0De?=
 =?us-ascii?Q?8dG7o+6TSLlFUynmSV8zEOgyxks9176TXPaIsnMOSu1vDyM78bJZ8sVORTUu?=
 =?us-ascii?Q?0tQo4CX6jsTzr5jk/PtRJda4Bjtm6918t9GTFeThL2k8LOM7ZxtD/iJegSAC?=
 =?us-ascii?Q?p6TWXThIjxmM5HP/F6zyG888fHfOqDOJqCFpcfe8TJ563HzZe4LUcXpmNZIA?=
 =?us-ascii?Q?7h5Rijls5xNHdye6/FXHy6mNSJIcAA6cMQlWm8HsBm0qe7Qs9u/NUILdAvTm?=
 =?us-ascii?Q?p4Wg90Cp4toJ9RMeIIlA+VuqImsQ8Wn5FoJF/ALZokNlCY+xbA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uDprZxM35ctI1vZutUooAIbYo1f5IpO4UgvYKbztQDE2kJzldUaGFrOHjo98?=
 =?us-ascii?Q?oTc+XUL4UnsVCVcj1pJhrVmyAuLvFnCEARgyq/bTkiaC+e0ODuXF27USrT3v?=
 =?us-ascii?Q?PJnd/DkhI/YwsYA6Sy0usICcOPQMfiE8l7+BmJVpYFJUHeIZCD8+UiUqLa8J?=
 =?us-ascii?Q?eBtGwnITnyEDF1XJncWJLwSY3lHJdmr1+05u4PfEHOl+aMnrqSjtjyhbD6mG?=
 =?us-ascii?Q?QJaB5wcarS9rsI/copJD3z9GLxaurAenURGjZWahrAaK9k7IFOIGAnSueQfx?=
 =?us-ascii?Q?17z5EMKBH1jrMIIPe2bbKI26vgpevICqXE0ieoN2VMT/x8qUkc8Hi3aalyRr?=
 =?us-ascii?Q?Vjb1YAq1hotWy+Am7doOf1xh3+lJs7Y5SOZ/1KS5jWGHYyWRDGw4hF2k3Xi/?=
 =?us-ascii?Q?xvglvqy2mp1gl3ed0NU4dSrNlGg2aFi5CcvwuHP6XddLr/VMyqb7c5Ffsq99?=
 =?us-ascii?Q?oufNNlYUs/YAONZH4WJaetGN5XFF37WFkA40c/vBD0lhNa+f7eOwGAx1GpjG?=
 =?us-ascii?Q?m9OKPdLx1udQm479Sfy0FptZ8kSGriwEGQqeAQGOcZGmCa/WsW8fQeuujOBe?=
 =?us-ascii?Q?01iSiWwvRetnoBtOPG2cvR2g0uEnicEnWgoIg/88Amj8TpgUrtNJ080Dj42l?=
 =?us-ascii?Q?Af25zkVOPfm47xZdWoExkEEy2lMKDHObuAj2yKp7w/40DjgPmxMKo+OLjET6?=
 =?us-ascii?Q?bMCX6eMHMZCzivnqZW5i7bC/pr9HhzmXmeK/vC1IKwW90iSlU2RYaq43aeXB?=
 =?us-ascii?Q?Ix+IRzK7/NRyvIHoW9c/5lYjdJqwWsP6kxckB0sdrH4+q2bgFrUMz/xow3LN?=
 =?us-ascii?Q?nxM0i2itynACjKc2WqCNiUomYnUs1j7+kMJs8pDQ3dKjTzdZL4S5DZ3ihEpc?=
 =?us-ascii?Q?NdglZ53Y+l/gFi8m3Iow82T44NiIvjB3YU3A22YsP/Upp5PR9bCcoOlxQtfz?=
 =?us-ascii?Q?QhZab3S21FfBX/9dEIDlhXONaTdpvStaTtu+KGHYYGfyT4gsux3hxrmTEGMz?=
 =?us-ascii?Q?kVlg388eWx3gdjVG4lqmZTxNef5mq1cGR499ZGz/RKa1id+/u+VapvNRVeF6?=
 =?us-ascii?Q?w/jZ17EVR4MKJ46S9MpH1S5YNpWO5Zy5dRTlyyHjTDQCgqUBh013vZAbo15t?=
 =?us-ascii?Q?ml4g45rcVFqXgrCiy6ubQzxJb5WRBmMBqUvelMDRe5wzDHSLoXRyzHptXCwf?=
 =?us-ascii?Q?ck8uMvo/bCs1/c9z5AlwzRgIFMelearsIQEqGXgmCAmq1u3v8H3mJ+HCn3g5?=
 =?us-ascii?Q?mHHxIXx5AZoHL73W8U8nbBHZ2YQxHEiz85S51X2HuGB/6aEM9xr0qtLZfYU6?=
 =?us-ascii?Q?Hb2ZixYQFOCXiutlRNs3HPAOQ+mn8axG3hS9rLC2Dv3nTXEEKkNWSL5v+fCw?=
 =?us-ascii?Q?Ol8tq18tlTgu/rzz4Sm4x3G5g4APq1B3RBWqUM355jtpbxi5kXf3EjoP0xet?=
 =?us-ascii?Q?4ztLFjt1F6YB+B6KWOQjmos0liEU5zaCX+ZKkmBgaIrGdSoSCgUxuPBqEFJk?=
 =?us-ascii?Q?7wtim2Xfhnn4VAbpHaufnr8rbh42Qlw4auXL9u6x5ARgWyowR66UVO4IUJTk?=
 =?us-ascii?Q?r1PMj4Rvafp+VEKPAHL0qtbMexjPLHpXr+16WMhT6sumOS4dEg92q9MxCHOd?=
 =?us-ascii?Q?yw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 036ceb4c-027f-4c8c-bcd8-08dcc5b331b9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 09:41:00.5421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqD9XGEmpCmZwyAf091LAZr6YcSgEPltFbOuKA2gvH5d7KoJ2gjrWqeo6JBGQGqx5jwreLRGOos3/PwtqcH21w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9577
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 26 Aug 2024 09:41:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111958

Change the reference to the MIT license containing LICENSE file in the
downloaded archive.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb=
 b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
index e45ae7986..5fd5ddd71 100644
--- a/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-haversine_2.8.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Calculate the distance between 2 points on Earth"
 LICENSE =3D "MIT"
-LIC_FILES_CHKSUM =3D "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0b=
cf8506ecda2f7b4f302"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D20a52d2c688975e989fcbee3e6c8d1a=
1"
=20
 SRC_URI[sha256sum] =3D "ab750caa0c8f2168bd7b00a429757a83a8393be1aa30f91c2b=
ecf6b523189e2a"
=20
--=20
2.39.2


