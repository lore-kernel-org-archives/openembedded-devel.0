Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378A2C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 10:09:34 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.41537.1736849367931931026
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Jan 2025 02:09:27 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310900c87a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7aek7016412
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 02:09:27 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2042.outbound.protection.outlook.com [104.47.51.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443mt72nc8-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 02:09:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PJAUwVywwrqXUNGjITmEaRiVAP2v3hKPma3rNle9hrD0lkeu4iodgsqjRfeWuqgrY7YxhKbpkphb5rditYqNIyGfPpyz8a1XQxClF3CkugNZmd/OJKL2XqGhvKj1/Uhjtc5ePpB/8eLmAOyd8M3JsqdgenMvA3DNEOgpMl3qj5gtfVL5vWaOjJe8IxfDirV9lGAeHQ4H/tgmrXK0OsEPr7K1DN3ErrtUgAqaLj48PTt32wTEgN120A3pPs4iDseliu0rDR6AWN3gHj3eCy7EclgHMCVGkkwIRM43Q4bv5YNi/6HTNYfxoizmAbysXCag9394Bf2nEUIaRrLBKAr7Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OM6xPwkpKICN9Ea38yR9NQuRjeLHIr+n0oxWdflk0GA=;
 b=Tpkm3Y+2P0QroKOhsh5gMSiEikhkb8dvNl72cgxilvZryOCYo55BM7+soPbGkrgyupN2apJbDDKAFTnXs6JC8Iogv++SOePksutYuNYsdyuzDvdAtyfAlESkgheadB3amhYqjhgbgoQJGRMFms7SXWNhU+QxKu6vZfONovtEL3ZGu+zM1ZurGvhEr2zbiOrO4Ld7hGRHOOrKdhcfBUhSXWftOxhDGx0n9n8tpZjdaR6Y94yVqVKPXTVBNOCUK8JI8Ea12M/3EkbTVqHU0lfv3kAUawBB60BhAcvvzQTBeilEMNmDa1zJYxAJVnkMsERxfln6kG8+siSUQBO6RnQbcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SJ0PR11MB6573.namprd11.prod.outlook.com (2603:10b6:a03:44d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.17; Tue, 14 Jan
 2025 10:09:23 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%7]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 10:09:23 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 1/2] openjpeg: fix CVE-2024-56826
Date: Tue, 14 Jan 2025 18:09:09 +0800
Message-Id: <20250114100910.1538526-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0030.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::15) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SJ0PR11MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: e05768c7-0321-4acc-611d-08dd348384b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7lzkijQ7wITdmEi+ba/tuFP65xJh6wRNKfvfKGpj1eSNX72BDlB2qDIMXbHs?=
 =?us-ascii?Q?rXE+RQ0ZsyfkrMkdGP1qGDCMN3NyFBoA+iSGOpXjZGsHt9ldnXVL82MdkUa7?=
 =?us-ascii?Q?TT5RyS8ItPohtv1rbfgU4xgkaH6CZ4fWg1P/Ksggkbq9CNaXxyUBMWjVqZA2?=
 =?us-ascii?Q?Wl+qCFAlcitoYKGyFSTS7K9NDcax+XrVLT+56qaE9UzmMXTCN1eEow8O7FRc?=
 =?us-ascii?Q?Fn5EVK/X+bPZLY5auZVzqzsY3sN50zvnpyzwfMM15rxq5HGRfpyHoyT1z+79?=
 =?us-ascii?Q?hGxcu+K6p53/fnWWvE2oI7IOspm+BJpr4sFxjGVvUtrHI7o+y39iS+++mkce?=
 =?us-ascii?Q?Gqh+6raakoP8kdPa53T0+Bc6trxmoZJ0AzWqSqjrgi+DN9GHDviNw5682OYX?=
 =?us-ascii?Q?Yk5CDollNyb1Khdu0YahlxqGlJHpzT8/X+TGHoSM6KmxYs0IIge+53YQXLB7?=
 =?us-ascii?Q?birUelw2lIen1+sPTJYBLzz/BN+CUfQ0enAGddKAahaLHW0SptiMJRlgV+ks?=
 =?us-ascii?Q?dVbPeHR7/erdCo+o8FoYmpizGhOsuihXsQiXjzUE3tUMWyB1V7YUai9GKOl/?=
 =?us-ascii?Q?DhpxLBOc/Q2d47FGZGKh0XIqCAA5ZEzSiBjWe2b9NVvsk9KAsQXWaJfenUCw?=
 =?us-ascii?Q?cgyJzkSMmvFNdt0nLpSjxG+ezE2tLkwZdAJ7x5vJ/0rjZeAMbsQT2DiNoHQF?=
 =?us-ascii?Q?RhnfCoyrs0DiBjazlRDhxNsRatqyiet9Z05JRwaeS/2R3YtyWzl7guFUpP+w?=
 =?us-ascii?Q?+YpDDdUyLsskcK6aOIBxPbJjyQiZhpDUTjDJPznYykKubg5AvjEfJTLvSF3h?=
 =?us-ascii?Q?Voxeb3TKgmY8CcgjPQQ3VjPBv8ZcdGdTi0RlIWLNaycqQRTWc9pY3Y5hQku/?=
 =?us-ascii?Q?Vp+R+Dgd+Xk97mn/JoYWM9/8RQEADw9aaKXFIUHCWBkze1uAaP8ybFUmrdIp?=
 =?us-ascii?Q?WsAjTCbhPDyCYr7aAhwsoGxSCYu8jagbmIAznt4KEFXmH6XIRwhe3sQsgJnO?=
 =?us-ascii?Q?5djKjShJ0SAHvrtpj0r9DBogWDlwqjHZXnUTgEGuunFCPlPHDNGMFO6yDbQE?=
 =?us-ascii?Q?KjPBA//oLu7nSM7JNkbw7OUJ9JzOaIjRqhaeH0jT5Wh/Q3N/UVN/sFOijp+F?=
 =?us-ascii?Q?5D5rCOPGwjvns42b+aqasZIkOgdS+VHigObH29PZOnsf9+hm4f7+Zpnftdc9?=
 =?us-ascii?Q?6idgYm1bqEl0wEgOKq/vbDphgwHgG9xgD0Vr5oG7IfpAUZ0AXmZNMSS1Wjva?=
 =?us-ascii?Q?4gWImAp/i65KJyM4PeF74OMB4nIfjJDl9zvBXkZ82zmkfp6oWKabxL1WLu4Y?=
 =?us-ascii?Q?pPYmRSqhtA2lrk825UsR9ApPwiMg0RzGHkrprJxSrliXgbHhmte0T0VA5JFO?=
 =?us-ascii?Q?E6nRZ/Lw7UZ3jX8bC276jm84cFgnMiODsqDZM17hs8IzSJ1zqg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1MuGafSLGjM9roBObPdGvgFCc+53Q+vp/71+8/617+I1ha/mqGGx18bcaUES?=
 =?us-ascii?Q?wbBMJHplssXxjBqXl2thCPlzG/1b5tRx1xnB6NV17CQ4XJ+60oEZZNkyAj6W?=
 =?us-ascii?Q?2PnTTecCoPAI4nsl26+m+D7DejHHeTcU1Wp5yeOq54ITBrw9u0PXenQRGAP3?=
 =?us-ascii?Q?XG5zbDPDkQhU7voArWp+Tglt34j2WWTxtkI8TDtTHVYpf736OUKmVJMng7P8?=
 =?us-ascii?Q?g6ASCRlULNsmaJCmCspURpxTdSGUvx8ekVzrg8GoDt8ednBkamGr1+/lCNUs?=
 =?us-ascii?Q?OryclK1V2KKAcpSbp9qKUi+GHDlRZ+dVROeKSH+HGeS7UhEmKjLImIchrIAn?=
 =?us-ascii?Q?izg2Zl7hiWKufCI8us5jKfsRdZgzEIhU0nFLeAjPa91O4vFxjP+xpYB56yNr?=
 =?us-ascii?Q?kNXeUJRGybs9uXM8kYRDiOrdi0rq1IF0Jvgga8yA3sfVsMm8PWRvv1VijuaB?=
 =?us-ascii?Q?8+3thKtG5zLVYPXEdkWkbNoS4gH8ZehAGAVXmiaXDj70XVXSbqb/KToXuRDJ?=
 =?us-ascii?Q?018/yIeDRyhwqCqrXXQWamzgcWLITASVtsT+s+nNSWPCIQ18tiV9qIa61+yq?=
 =?us-ascii?Q?fYnv1r7O9kXOQIDFXziI7Ho8eAEde8CD1HcWb7Hs2Q1M1vMy4/oE4V3NEUqM?=
 =?us-ascii?Q?voYAnB+js7SyPyWjf/bgUxfY0+UIcFQxRRIMQ91MYiiF+LHCJRHreYEG7p0n?=
 =?us-ascii?Q?tAKIbw9X3UR1FP+ld49izUCzitKmGLJlzceAoRlCa7LRd9vAm7NPWYF2+LSd?=
 =?us-ascii?Q?PcEaAa3ObBv5WE2V6kOqFK0CvD/w3pvo7+dcE4ebVFF11Nd3WwGZvE6bu0MY?=
 =?us-ascii?Q?H4K5ZE1tCqNsbDHjUX3mk0i35hYEtPPIIlHJuc5j3+mjgf7r6vvu6eRcW8Pz?=
 =?us-ascii?Q?KnMHDwgowHIeErNm9ekR18VU1yfSsaK6RenSp/afba1hapb3GptKJxBJfhC3?=
 =?us-ascii?Q?/J8Ot2SA9iUsQbx5GRg/UwzQzUI3T+YjS80TmR84oz9ExCnGUxdL8p/41pPQ?=
 =?us-ascii?Q?j7ssjn04F+DupW2Al46hIqQeHeZ4omnFac9u71y2iAsJOE8glOv5bkMny0OM?=
 =?us-ascii?Q?H3/KtHooxnp943PIZ80wW5GXXADFC74oUOJsBkkRVuzGlmuy7g3xaKU7qDs9?=
 =?us-ascii?Q?k5+8bqSeuRHG90mqnppbt5aJ0qm2fpZC543d7+hHVnOm1hdDc3BLNaMBAZVW?=
 =?us-ascii?Q?DK32ZY2dRNZEropGA62RVFymH+iB03Fiok1um8oXW2tJUF251ifzna6Bj+KP?=
 =?us-ascii?Q?Vix8Qx2JmMUw73YR2lEBoBgop8Uyz64hHXw5klnNN2e6ZxNeFK3gxSX0KwLA?=
 =?us-ascii?Q?cqklTUm19ETSzsvInfXuoDNjyZgwKClaKirDl3A080SHxCGZ7OhE0lIsTcZV?=
 =?us-ascii?Q?BRNEqFq9xY2K4oM1AO/O65W5ixUwzQx3lVIs95AxV/eRmkTDWzbroRgtd+CG?=
 =?us-ascii?Q?qCIDZRWbhQ61qD0r0jMnvGD0ZNCh3UBgGme6pa2P8uaaZUVx9FiMH8GAd152?=
 =?us-ascii?Q?M9PRht/1HhwNlPwo2IJkayFn3pXpklJyFDrQFPNHGJ2Dr5tqf42XMY282xnR?=
 =?us-ascii?Q?aCB/NkUNeJwzZAr2AHUQr/LlaYhZURZ9gz7dIX0DjEpQ92ljR/9dCKB09134?=
 =?us-ascii?Q?sw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e05768c7-0321-4acc-611d-08dd348384b3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 10:09:23.0035
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4u0Q/nbY2wJQWSDROIavnDIpc1nVyQFzWjn+todikD+lnwNO0IsBI01Vj2Z/hFY7JYKakC0pyhY/I7VlJocAiwTzilrGnBxoElDRNrUJE14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6573
X-Proofpoint-ORIG-GUID: K2czN3vD3ZO2I6mEwGB4pMrLXwFywVpE
X-Authority-Analysis: v=2.4 cv=SeoNduRu c=1 sm=1 tr=0 ts=678637d7 cx=c_pps a=x8A/wAfU1CBlff9R7r/2ew==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VdSt8ZQiCzkA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=64SeUrbXAAAA:8 a=DWwV0Ru8rSxQCkMTajcA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=HLuTerElwpHB00cmObDT:22
X-Proofpoint-GUID: K2czN3vD3ZO2I6mEwGB4pMrLXwFywVpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_02,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 mlxlogscore=999 mlxscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2501140084
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Jan 2025 10:09:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114878

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-56826:
A flaw was found in the OpenJPEG project. A heap buffer overflow
condition may be triggered when certain options are specified while
using the opj_decompress utility. This can lead to an application crash
or other undefined behavior.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-56826]
[https://github.com/uclouvain/openjpeg/issues/1563]

Upstream patches:
[https://github.com/uclouvain/openjpeg/commit/98592ee6d6904f1b48e8207238779b89a63befa2]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...ix-out-of-bounds-read-accesses-when-.patch | 130 ++++++++++++++++++
 .../openjpeg/openjpeg_2.4.0.bb                |   1 +
 2 files changed, 131 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch
new file mode 100644
index 000000000..1943cf4cc
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch
@@ -0,0 +1,130 @@
+From 2bed72075bd17518907a6a57e3411669188e49bd Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Mon, 25 Nov 2024 23:11:24 +0100
+Subject: [PATCH] sycc422_to_rgb(): fix out-of-bounds read accesses when 2 *
+ width_component_1_or_2 + 1 == with_component_0
+
+Fixes #1563
+
+Also adjusts sycc420_to_rgb() for potential similar issue (amending
+commit 7bd884f8750892de4f50bf4642fcfbe7011c6bdf)
+
+CVE: CVE-2024-56826
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/98592ee6d6904f1b48e8207238779b89a63befa2]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/bin/common/color.c | 42 ++++++++++++++++++++++++++++++++----------
+ 1 file changed, 32 insertions(+), 10 deletions(-)
+
+diff --git a/src/bin/common/color.c b/src/bin/common/color.c
+index ae5d648d..e4924a15 100644
+--- a/src/bin/common/color.c
++++ b/src/bin/common/color.c
+@@ -158,7 +158,7 @@ static void sycc422_to_rgb(opj_image_t *img)
+ {
+     int *d0, *d1, *d2, *r, *g, *b;
+     const int *y, *cb, *cr;
+-    size_t maxw, maxh, max, offx, loopmaxw;
++    size_t maxw, maxh, max, offx, loopmaxw, comp12w;
+     int offset, upb;
+     size_t i;
+ 
+@@ -167,6 +167,7 @@ static void sycc422_to_rgb(opj_image_t *img)
+     upb = (1 << upb) - 1;
+ 
+     maxw = (size_t)img->comps[0].w;
++    comp12w = (size_t)img->comps[1].w;
+     maxh = (size_t)img->comps[0].h;
+     max = maxw * maxh;
+ 
+@@ -212,13 +213,19 @@ static void sycc422_to_rgb(opj_image_t *img)
+             ++cr;
+         }
+         if (j < loopmaxw) {
+-            sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            if (j / 2 == comp12w) {
++                sycc_to_rgb(offset, upb, *y, 0, 0, r, g, b);
++            } else {
++                sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            }
+             ++y;
+             ++r;
+             ++g;
+             ++b;
+-            ++cb;
+-            ++cr;
++            if (j / 2 < comp12w) {
++                ++cb;
++                ++cr;
++            }
+         }
+     }
+ 
+@@ -246,7 +253,7 @@ static void sycc420_to_rgb(opj_image_t *img)
+ {
+     int *d0, *d1, *d2, *r, *g, *b, *nr, *ng, *nb;
+     const int *y, *cb, *cr, *ny;
+-    size_t maxw, maxh, max, offx, loopmaxw, offy, loopmaxh;
++    size_t maxw, maxh, max, offx, loopmaxw, offy, loopmaxh, comp12w;
+     int offset, upb;
+     size_t i;
+ 
+@@ -255,6 +262,7 @@ static void sycc420_to_rgb(opj_image_t *img)
+     upb = (1 << upb) - 1;
+ 
+     maxw = (size_t)img->comps[0].w;
++    comp12w = (size_t)img->comps[1].w;
+     maxh = (size_t)img->comps[0].h;
+     max = maxw * maxh;
+ 
+@@ -336,19 +344,29 @@ static void sycc420_to_rgb(opj_image_t *img)
+             ++cr;
+         }
+         if (j < loopmaxw) {
+-            sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            if (j / 2 == comp12w) {
++                sycc_to_rgb(offset, upb, *y, 0, 0, r, g, b);
++            } else {
++                sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            }
+             ++y;
+             ++r;
+             ++g;
+             ++b;
+ 
+-            sycc_to_rgb(offset, upb, *ny, *cb, *cr, nr, ng, nb);
++            if (j / 2 == comp12w) {
++                sycc_to_rgb(offset, upb, *ny, 0, 0, nr, ng, nb);
++            } else {
++                sycc_to_rgb(offset, upb, *ny, *cb, *cr, nr, ng, nb);
++            }
+             ++ny;
+             ++nr;
+             ++ng;
+             ++nb;
+-            ++cb;
+-            ++cr;
++            if (j / 2 < comp12w) {
++                ++cb;
++                ++cr;
++            }
+         }
+         y += maxw;
+         r += maxw;
+@@ -384,7 +402,11 @@ static void sycc420_to_rgb(opj_image_t *img)
+             ++cr;
+         }
+         if (j < loopmaxw) {
+-            sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            if (j / 2 == comp12w) {
++                sycc_to_rgb(offset, upb, *y, 0, 0, r, g, b);
++            } else {
++                sycc_to_rgb(offset, upb, *y, *cb, *cr, r, g, b);
++            }
+         }
+     }
+ 
+-- 
+2.39.4
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
index a619c07aa..9c0fe0e30 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.4.0.bb
@@ -12,6 +12,7 @@ SRC_URI = " \
     file://CVE-2021-29338.patch \
     file://CVE-2022-1122.patch \
     file://CVE-2021-3575.patch \
+    file://0001-sycc422_to_rgb-fix-out-of-bounds-read-accesses-when-.patch \
 "
 SRCREV = "37ac30ceff6640bbab502388c5e0fa0bff23f505"
 S = "${WORKDIR}/git"
-- 
2.34.1


