Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B0FBC83F1B
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 00:51:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37985.1752713502812861814
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jul 2025 17:51:42 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=92939e2101=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56H0X8IC3851044
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 17:51:42 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11on2045.outbound.protection.outlook.com [40.107.223.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47wds0thck-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 17:51:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qVDiL8nevrBtoYCcXT5biny0ev4jMMUwG36mP+58h9alejrDUeI+IcmL4MA9yQeGTQ5KjqaYzbqZth+uGlaONXxJmYyYJXWyOQCJqG6nMLfpEPVQU+dZkdyej3OBwrYc7iEujPrJoG4V5RwBud7ww7tufUeEdAAJ5s6alQ7BSKQWViaUgWpir5uF8pJe9eZtE+7wLGnJCiEFeTCRgk5tPDyWl0yL078VrPhYjYMQN38+3tGs1KPDtn1GKc78+WyOjVXpx0pPGCtymujhhCfhS0jMKp23w0Z8xvC9iOa0ArYMDpqpJmdbS0gyLl2cFyHQ55/adrBWK3TTgQ/kG9/C0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6xPgZ1IGrWupQS5heUPnN/1qeAYnXFWRcI+M4Rn93hk=;
 b=ff1OgGSSG9OQtj1ZznNMmU2j47EDB8GUpBtvCnNpr40G15Zbp3Dshy0jdfGCEbpDgTxELV8Q0KniYJLOldevEQtI1bR+pCa3+3+6W57n94AnAGR8BTGIUV096qrAEZp07n12sxnoMnNDQKlGDw+P8dF+VxNpLyyenAxsEGVeuwszmimTemY0o34VJdtt3XutAYcuJlfyCOledP+YEaLotDEv8IE/XYnqKzys3DnXcuG9cpkCBaBDBxN+fienBfqOMPM/uYEVho+7WOu8VUfgFrkEqnf9q81NHBBWafwsfrGmweFylvlDkyqc6D9sCAicj2te72JNh18nFJ1QYzzgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by SJ2PR11MB8298.namprd11.prod.outlook.com (2603:10b6:a03:545::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Thu, 17 Jul
 2025 00:51:37 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%3]) with mapi id 15.20.8922.037; Thu, 17 Jul 2025
 00:51:37 +0000
From: guocai.he.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][scarthgap][PATCH] softhsm: correct the SRC_URI
Date: Thu, 17 Jul 2025 08:50:43 +0800
Message-Id: <20250717005043.398585-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0011.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::8) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|SJ2PR11MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1280e0-8de9-4131-0dd1-08ddc4cc15b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?06Eq8Ur7joJsKn6lnPy2v5oL08NRr6gkEcxjkIUb3mZqELipfBk5hY81ByyP?=
 =?us-ascii?Q?SPBm6+A6bApcK1JR2II20zLEcCYeduee31BnvGSYmv4cSWVGJk/avBhJyJFj?=
 =?us-ascii?Q?EwEl/miKwgJY+WPquJ1qllohpNIt9GALOYu0dnjgOMYdRLoENNaKbtBhAqz3?=
 =?us-ascii?Q?cvnRtXl5Q8ShYTsN+zN84Ie7QiDAB7HEUi/PDxf+i7SD3B4gVZ++EBEc7ybR?=
 =?us-ascii?Q?m0UietFHLTx6uBPcUW0RfGyjK1JqKDaCQKyu3ZZKNtPrFqR9LYXUvCh323SO?=
 =?us-ascii?Q?vS6jH7v7RjgoXdr3HEQcxNFozCfIKBWsFW53doV/BiNMGYy7xGVzN/6k80Lz?=
 =?us-ascii?Q?/ID5Ltfx1N/BIlGDetJKMhvOEasZfejIjP+E52mZGrG30L0YALiCl6i7v5JL?=
 =?us-ascii?Q?QUHBo0pQz8DEeckJwc7XcUqBYZ5XqS+k3heh7/6K79niUhr16GAAvsTfdE7R?=
 =?us-ascii?Q?/4OHd6cjylx1AzLxrabps98rzmKTUXBlo65qO7d0kVDKdWgSCjidB9k332Da?=
 =?us-ascii?Q?7bO/z7DJ+UEWm25F/EqFEvCxQa2hB4NKkjY/GwGveByp0XSaDgUC6EWuFMZI?=
 =?us-ascii?Q?wmX6FSCB77qu/f78aj8Qpb0SpnAiJBdRHzI7kMV34r36SmpL9yKOxA0Z6Dd4?=
 =?us-ascii?Q?fzRxmznfBz7jjm77p3xx4bTn3MAH4IeAAbKsFboiA/64excL/9jFoUrstI79?=
 =?us-ascii?Q?C2Zeb0wTwaIRN33Yx+9RB6PTX0ynMT856wblEYuTxNTW2I7BP0sZOdaC+7gj?=
 =?us-ascii?Q?x1X4own1gxfZTqCsVB2cBCq6d7mcVZtLRxmumfuJWkxpJHiYcz4ukX1eGZRD?=
 =?us-ascii?Q?ixetzJ9C7hLN845jS2DDtrV21B90lI9f2TenFoccTOfFyGhYqSj2FURT64uk?=
 =?us-ascii?Q?XCq74vEtpw6AL1Mk9tCdfmGHrPcIv14Oo8zpfp91kySYOXgbBQ2ODO6Vmupd?=
 =?us-ascii?Q?xVGjrfv99Tw+yt6P36u4Ts+Wup5wPvpi0vXfv1lutOVGt++Iw68AGMG9tUoK?=
 =?us-ascii?Q?HUZgj6NUDqtVuBMGAS0G4uk2mnpndcfcuzPGpJGRVJc+IZmPCx13pDUg8XFW?=
 =?us-ascii?Q?ssEu/YwLiz5JHZrwxi8/YIy2nVzFod80JzMNuCfLG647RdI0zpF678rSKsC3?=
 =?us-ascii?Q?KTU5onF73ZFmHgRg2XSW2gzzb0SQ0sqhZlrN5lMNE5ar0m2xqsNefB0PKLy7?=
 =?us-ascii?Q?H8cuCPaVu4/c4wkLzRPknIrpTHlbObHxWUibKtlsHlKHPxMz60ekdM2fIfh8?=
 =?us-ascii?Q?hW4ZOYQLSjSk8siR46hZXjQB8+bRYuGaOT6Hof7hAyu7i0g+e6PJvCiidJm3?=
 =?us-ascii?Q?Col+ebTF8PIEchrVPwZVn0miM4OXJ92w7SaTrvl5XW0FjruhNBlZpcLDbsjr?=
 =?us-ascii?Q?t1ynXeA7RetdihA4o6ZpQ5pnydjyq18uGbB1MLKGiP0VeAWoqfJVtci9XOrC?=
 =?us-ascii?Q?2L9mWKQBK84=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0JjOnF0b2GIR5msivZoB+OSfPn51KI0I3xQEbjSWBl/CyXA9a1/YAdONaIdy?=
 =?us-ascii?Q?5O97MbjFliAMqOP/pA76PSYONLCNpkPyYCK3jKRZzLN2iyZKX7JOahJRxYcT?=
 =?us-ascii?Q?bihqnqJKJYsLbfxkRyVTC/rdDw68qSc4vyTDgcxuDAX0LWRr0L+nD0c1kP55?=
 =?us-ascii?Q?nb9Un3/e1Z+/CfomRYvowm1Vgyh1ZMF/ONq8MIvkHkdlQL3npHKoZfTkeTLp?=
 =?us-ascii?Q?9rAnuWzbo9dETIPveF1mzSh8FuR3D3M11AXCN4YubOrBA3uZEBN0g1vNU3Zm?=
 =?us-ascii?Q?nN51f9E+asw2r2V1r0rsxBwvz+StFsGdD4xK0+lt0ImXtQWcwTkPXCdVyqoP?=
 =?us-ascii?Q?VId8of0pogYLMV1DAzJF3Im6Ydgb3AiP1oPU0qUNOMp8lB9JLIhNfhXN5IoO?=
 =?us-ascii?Q?VQAvLiK0qNX8/oeAoTmrT+xpJhnWhby7R3EVDy261dER44nv09KAfe67lyzR?=
 =?us-ascii?Q?INZNOu5keZpWwIyelai/vmQr6C1MCr8MWAuwtbAGLuWp/iilheIpyg7UxKjv?=
 =?us-ascii?Q?gYIvAj0fW1qYbCVnTnjHbb+ZkCUJs/t8rjigkCdOfajQ2BszymqBc0Ry4uhB?=
 =?us-ascii?Q?5jzv/kCZyhb9LrgMAmuoLrzLNaS4gmTtUztJUqJaJmIxqkVSJ9tqXDMcWeo+?=
 =?us-ascii?Q?rNCLlMsBaBCpb2GpHSQ4cr9PNj5dyZQAMEe+2PPlBHKN/hSVku8JTW55KiQu?=
 =?us-ascii?Q?+wvqmODX1FQ+x+u2LYA7q/4yk6uUIxil8+BoVI/S0JTwnN/d477t0E38LDg3?=
 =?us-ascii?Q?z6xm0lBdeNC34d61WhkyL3Xi154QED3+J8OMpOVP+WE4aME8hy+AJVumL51L?=
 =?us-ascii?Q?Z/xjcvACZdF02sd/+/YvFe+UdatWapk3ISSNGlujz8xrRhb4tepPQLmkKfrF?=
 =?us-ascii?Q?8uwLKBgpV4POuUI7lebRgPCZlFzU3a5AvRPHw3BPwBN5BgcXDrUuGhDqfxaR?=
 =?us-ascii?Q?xj4KpfBIRV+sPYh8HexLXaVuehnWJbGiUgaixqiHs44IhiDXa0rQF/ULwZOw?=
 =?us-ascii?Q?b0jjh8U33GouoyvaKh+PR465Tzkie7F9w7le6SXwJQYftsfkn2rHf/uktjtV?=
 =?us-ascii?Q?AIAlyjI77p6xmM3Qaz+2ag5ZMuvob/WJCKvamAg8+ng27g9O5OdegOJzHkB2?=
 =?us-ascii?Q?1VibRA4gIQtAsbUVX58F0Nc3L9fZknDJkBFVRpLScdJwrfxYEwTIkIhMIclB?=
 =?us-ascii?Q?pPGISRNXJaNVJIrDGy6JQDfrq67+JY+3ligcOQTDbHzOEtX0zEn6DZMZ4q5C?=
 =?us-ascii?Q?B265T/Mc/FGpHT7cx5q/pNNXsusBek+SvQ0eeLU9etaJz7Ry7iXaeS0X16OC?=
 =?us-ascii?Q?0YcYIKC2+ri4nMMCHuWluxgDzj71K6kCudiu8V46HKMRAgCoRGGLxkKR5ZrO?=
 =?us-ascii?Q?x0ZQFuKV1k/4Z5H9OeFrDIlkjhWi9HyCKJP6PWgcDxqsPPMaiwhGiagwxWBT?=
 =?us-ascii?Q?B2yvuYwlTx4Abcs8JebzWq3TtFCgBHmGIqSoFekSZqoEvk61QFiT/aBPI4Ab?=
 =?us-ascii?Q?wmjUjrL7Ltxch3CNW4Hn5owlIocO4MMkNXQA+7zpn+LmIjnoXZw+6pQU2jW4?=
 =?us-ascii?Q?TBYEZqHQSCqbvppOxXnn6YcPXW6oHPVhR0mJfD5C3+DW2FjMpD3kXhcUbsgI?=
 =?us-ascii?Q?Hg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1280e0-8de9-4131-0dd1-08ddc4cc15b4
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2025 00:51:37.6056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DRKqjlYtCm/zqZdGoPYIF2l5UbD57x55So137ZZ3kW558jm4gbve/EgCrEjAtKVYMldGruuw+nGV2Mqs97byw7pKSVqYCPJo2BoVifRT6ms=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8298
X-Proofpoint-ORIG-GUID: _PbfOOh4PNcRqVhimruo6ntcQzfsNXF2
X-Authority-Analysis: v=2.4 cv=bLkWIO+Z c=1 sm=1 tr=0 ts=6878491e cx=c_pps
 a=JmGEiXLcATlwW+/cokwGuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=TUjdwidjAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=qDAKQ4oUvqWMKBxwk2cA:9
 a=XBCfRPmKWXHXM36ql9fg:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE1MDAxNSBTYWx0ZWRfX6bb8GuQbyR7E
 TxjTegNfjLPWSYV6Se/0oAhnfl7hMatqchi+4t8pZ3WR2A1lqt/cBTJLoQLuLgEUvDokdOh/hlD
 9yKEucCgDG91x1KG6IGujN/jJJBeBC3TNnk5XJvjukuNG9w50rQgCSvNmZvZQjRNW7MHRHG0k3D
 XaHA0RPPXvlW9QGFhSl5s80OhwynI1ZM6I7wfFnEgzzSZd+46l5ADUyD04y8C8ZmzWQxt4o/6OT
 W1qXZiRM/bb0eMK8ube0Big3pi1pU04twgY5iJO/O/ikZUcvr8TgcLT/VIgV6n7MgLsfoTA6DgQ
 z//ENQPpZ4OZg/P/1g7tCKizk2CakQePmC8mmTCIL9ciA05+Ri9o5fDQHZ5PNemA9BQge67eIFy
 r+BVr/ps
X-Proofpoint-GUID: _PbfOOh4PNcRqVhimruo6ntcQzfsNXF2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_05,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0 impostorscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2506270000 definitions=main-2507150015
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Jul 2025 00:51:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118603

From: Guocai He <guocai.he.cn@windriver.com>

The old SRC_URI is not available.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
https://dist.opendnssec.org/ unable to connect. the tarballs 
move to github.com
---
 meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
index 930bca96ff..12c6947a21 100644
--- a/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
+++ b/meta-oe/recipes-security/softhsm/softhsm_2.6.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=ef3f77a3507c3d91e75b9f2bdaee4210"
 
 DEPENDS = "sqlite3"
 
-SRC_URI = "https://dist.opendnssec.org/source/softhsm-2.6.1.tar.gz \
+SRC_URI = "https://github.com/opendnssec/opendnssec/releases/download/2.1.14/softhsm-2.6.1.tar.gz \
            file://0001-avoid-unnecessary-check-for-sqlite3-binary.patch \
 "
 SRC_URI[sha256sum] = "61249473054bcd1811519ef9a989a880a7bdcc36d317c9c25457fc614df475f2"
-- 
2.34.1


