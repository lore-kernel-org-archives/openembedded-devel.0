Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A6ED5A6FD
	for <webhook@archiver.kernel.org>; Tue, 26 Nov 2024 08:11:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.40898.1732608692104230630
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Nov 2024 00:11:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1060a1ab4c=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ52WdE005193
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:31 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 433618aya9-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:31 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xhj+peiiNjNbengimM+LCtifmGO+ZHPEzcbhg8RxNWVpO9gzpX5T8JB1WR44GdHizmeo1UB6yCNhdiJp8EJktgJ4D7nWDTnQ7nyBO1lbWZguOuJ+aLJyg4xQ8AK47qU/o7bg2JeqQz+GKrg4NgJbF79Mtny9pDPf50b8vCXhDbuRwFn9vWLuo1rXCARc9iGOe4SmVIxbjW69vVKWrtrbsiBc6FTmhceNzuXLT9ovq4b3M3HJWzGIe9VerOpPfxg8Q//7GuxETlURx3ymDaQqc6BfyriWoVCdCSB8TAvGbPgwQ0FEkiWppx7KVNhPLqu3osomtwt35S7zSzSo/E9xJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UwAUG7GXyPJtdlpRzP5A16FRlSVXY37jOGHTEjdbGWM=;
 b=hw22p73Ljfaqlj77hf8TTk79da3qnl8DK/IzlHf5Dp0KxeZ14tUz+TsxN22hk4W+gnGqdEZlXajrORXaqlYf6uo7hMxb+NLi03M66rT/a56atAxG6lynK0H7gzHORs5XSqgX+k+yr/JAY+bP+pJMTue1t3Lr0Iw8sLoTDEdL5PkM+185zrIDU4i0tWu0+kA1KLbbauhuHcLn5/VmEMATzEmld3H3KkP+xm7bZW2Oz0J8ArHxMDTOoYVxCOoITqDjwPWOEK562U0zvGJcNhzGcHaFs5nMoh/xiYoAd8Z9Y3uy89rarORdyc6X2opnguC3XrBgGSmJAiA/5gAX+8x8Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.13; Tue, 26 Nov
 2024 08:11:28 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%6]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 08:11:28 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][scarthgap][PATCH 2/5] frr: fix CVE-2024-31950
Date: Tue, 26 Nov 2024 16:11:13 +0800
Message-Id: <20241126081116.2535308-2-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
References: <20241126081116.2535308-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0066.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::10) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CYYPR11MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a4539b2-d313-4c0e-4afc-08dd0df1ed9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DeOVVOQawKRn7fRdEYwU6gHP+iHxhxBJf/distC9VdQd3hMTKdM8+Rs0w3SR?=
 =?us-ascii?Q?CgF2wjWYIy6KTTtV1qnZApT/q6+34dCsn2qNPfXpquYc3ciAusmSl0wH4O6S?=
 =?us-ascii?Q?xzBr4jrv3+aF05Rpgwijm44AMJG5fDc3r4c56+2QvLLmf7rFKHnpNcN98dic?=
 =?us-ascii?Q?AXiB4AX0NT2mJB/JzrCons1qu0rZAYo/c9o51kKigH170ZwBRZlbPtRJM5AC?=
 =?us-ascii?Q?nY+de1DcYTdYZ0krn8GImK5BxFXyuUBAXxzZTOqlUSRBc3s+ei3sKkeNpeRt?=
 =?us-ascii?Q?23WfaUcGqABlH61I0/XK3voZOlSMv3eZ76dqlpEwmujuh1Xc7ILmasJ4wZmj?=
 =?us-ascii?Q?zsV2vU6R+GHWnglKQUVFS59dqzfIZ38OE1FhDjCWsGc+CKqvc1BCCsBw1uo3?=
 =?us-ascii?Q?X+26uFeK+jN3IVoMn0H91BmqV/gh835Wej6p358r9Zhus94TPgqX8jUOD7hc?=
 =?us-ascii?Q?5mlGQjcT/4luIIeT+LgP+Rgq3JpeZztTPCEWizESGufbPg27BzMOWL8peirS?=
 =?us-ascii?Q?ow2n5+dYqfXJCJDDNleXVCBG87w7ovCNBrpsHxz2eYJVB3m2kZE0LZ1ErIDn?=
 =?us-ascii?Q?GDmz51XJzpHA6aMNEst/KwLa3IkwQZ1vom/CginWaFc/hFIHE6krJyGgbCG+?=
 =?us-ascii?Q?Ny3KlDn422EtX1nZVGaKnPPCA0HB0Smo3pDVZK7ZWnIbOUrPI4AzhjRWIes1?=
 =?us-ascii?Q?mGdrRHJBdDLZNuJr2SFb4ETvGdmkFeq+qAUhFd+i8RmMYIjIFfBMGNsm0qGc?=
 =?us-ascii?Q?ZKe5m97JO1p+1fYauQZkd/PJAqG64G/V/fJd4lOLrun1HqL/fFt0EVd10yhs?=
 =?us-ascii?Q?Xzg3qSMQ3trCndL01YO1sG889+O99HR6yXrDA1juZwBnrT10xbEfFgijcOA8?=
 =?us-ascii?Q?ZYnNlXQ6yXREVTxaVBs5Oxt13hDpvCc0YU5xUzpJ8mTMatOKCT2fcT46FgFT?=
 =?us-ascii?Q?Jidd7X642sEIcs3fK5Yw5p3WNGn4pl+HB81Rk/+P2eJsuiuX7A8TMbw94HGm?=
 =?us-ascii?Q?JzMFl74AkJkQcS4JhJbptphVit2o68r3j1ktNLSTlgZySEr6LB2rg/d3W9lT?=
 =?us-ascii?Q?nd61eHcTd9Lm9Ga3ojJZSsuVQ2iLaCfWXBHFtOsofwTRENeJ6+XBBfhsJ+7E?=
 =?us-ascii?Q?z6DORrRwyLSEzy5v4N5Eq0TjuRFs6eRiX9QJtWtnRjXP3axtR9QEAbb4ARYG?=
 =?us-ascii?Q?dnY9TsMSuYPnZgEEdVq5QwtCpo66rAHy9M8VyS79ovT65QpcSGsliSmm7sPr?=
 =?us-ascii?Q?d1OrElFNBx6g2134t0bQxLIhG3J0O+NLA5P/Qg75elbtpZEQwPMeHQSZDiq+?=
 =?us-ascii?Q?excoMKXOvmKlaWPP3jnmVOwaFDNBFK91wDw52oYg7nQUFVf5XFHowyu32owD?=
 =?us-ascii?Q?awtaQHQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ZXc+ym9fvCKt7Qa3Cd85Bx1LDYWJMf1DWyUej3JaEGyWjTgOYGiMP+4O608Z?=
 =?us-ascii?Q?OnWPaQ63GHj+zonGBBK2hvwCMuAyo7WdYGsJcMuKjajhy+UeXoHK7/eImx4G?=
 =?us-ascii?Q?fxYYFpq9x43+1keqSEIMwRGQpzhkOh3FpvNni+kt0zc8bhtYqOSst1cpTLsj?=
 =?us-ascii?Q?+insr0PIVyHPlJTigcBRwzAvz0GdZWL6LjxWsfc9ugzoP0qwMTStEvs0YtMD?=
 =?us-ascii?Q?LHEetziQ0pwEzhDPmsEoVi/P4l73K+mYsbF64qIulWui/Hd6JjmHdricbZNb?=
 =?us-ascii?Q?bPNQzl+6EUIN3VbxMcl+V/DRhMEQYaoOcZ1dAEJ4Y1tWOQR/zRVXTMCICKpj?=
 =?us-ascii?Q?ttNf9Ucb1dcsO7nsori1BLLlNsdsvIgwdiq4wmlbMQlYuWCjjTT7PZ3GNsFw?=
 =?us-ascii?Q?uUGuaxI/rpCE9T17JjX5X/70pgt97hntG1jz/l8DsEpZ86X3/eXau5lfo0QB?=
 =?us-ascii?Q?QkbM1G5nd6Nzcanf/drt0dle3R3uINc4u9hwzOu4tHq062s63ZPwXtULSbRW?=
 =?us-ascii?Q?B9jpw8aD9WRxP5oEMr/BjKZ7vNr5H2zX+ynCJTg7sfd01jYxUz54vrDe9lwx?=
 =?us-ascii?Q?Z+2a40MCyZuaQE3SUW0fg9olUCPicB+X71ueEfhUo6HR4Zh3Yh39DmOmr/7X?=
 =?us-ascii?Q?1w4I48ITrxkXl7JqSYpxi843d6EA/hHJ6xaIu0+EVYlPkzzQfRqjk7gIZ98p?=
 =?us-ascii?Q?MSvUmg1oTlrC6HrdVNcLUgtUDd9WoUUUpY9sDPd82t4NtODNVS09ltYn3ojO?=
 =?us-ascii?Q?bKiJQba2cxU08t52UZPVk31cKHcRS/e+0zLuhZK7V03V1rhfvxXM1MQ0cM8z?=
 =?us-ascii?Q?Ja+y+XMCpcMoIDEqjSuskubhwu6iPgHsC9mD0QMVW3C7DPLH5eYf9iGq3Bcg?=
 =?us-ascii?Q?cuNZC8XKCR271VIcOd9r5SLqfMMIqEZR4VQyJnP1TCoDaGPxTjARiqLPCFOZ?=
 =?us-ascii?Q?ngSQxSXov76Wy7pHbPxJhav0lSX5Rcuzswc4IKsRgyPXNAPDWGtqD2p7m682?=
 =?us-ascii?Q?0olYpRqgTFSAdoOcaF1jJlBcaXWLiH0cimnk6/M+JfK/Btle8qEpJMeH0jDN?=
 =?us-ascii?Q?FkxWX6GkvIbqqM+Rgs1xPsNBJBAvEVm8OFUPaChesdCprxRJba7iF0ILKABR?=
 =?us-ascii?Q?wHCmxPjZmD/CSYse/mQgxdYY4u/+dz3Gv8+WThaQXdj7lr7fNUjHBp8FIK7/?=
 =?us-ascii?Q?5314HVc6tgHVySEGC7AmfUx4GbMzqar8d6AN+hcd1NULOEKsvNh3mqhI09oq?=
 =?us-ascii?Q?5s5SPIKj/KRMHk6Ao6vUbuwVI3Hpov/y69EoxsgfcKQ3JRG2cZvDOWEntmFs?=
 =?us-ascii?Q?Uh3BLXUSwJVW4fbhj04NFmoW6++Py4cTju0RYriAb6HKHRSMeanFXZn7BfBO?=
 =?us-ascii?Q?zlMJmtF0v5tcc9QL7onEEbQBKWyWSkM8HNFVPCakUxcWEerF7dDUJyPrglc5?=
 =?us-ascii?Q?D91sOFcYT0o3gMCeJq8W3ShJsTd8Pby8oSFZw3Io59sncaTSaOe/tXzW2c+V?=
 =?us-ascii?Q?N1NXjkyDG7Ik9o6aAjoN25hNwM/R07Vwu6OjbQ6b4Z9++i8q1yGi0lQsozPi?=
 =?us-ascii?Q?qfAeeaxQOFdLAWzKSjjE+tUw9IlTuIjRW/7FeMYkGJxRC2CpEabmCwsPjK1J?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a4539b2-d313-4c0e-4afc-08dd0df1ed9b
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2024 08:11:28.3006
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJDmCTAcuuiSyHYWEQSrLyXN8Q3y/ZKNbBZeUNXvuWJW2g0+6EUBs/Ns1IBKKh8r4vjgNQ6dTZn8yscV9LwE2L+InhkGCPQJ+EGYWdFY/T8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8430
X-Proofpoint-ORIG-GUID: iuB5zo4_6QRu0MYOnzUWOnvuTfmlQqaA
X-Proofpoint-GUID: iuB5zo4_6QRu0MYOnzUWOnvuTfmlQqaA
X-Authority-Analysis: v=2.4 cv=O65rvw9W c=1 sm=1 tr=0 ts=674582b3 cx=c_pps a=AVVanhwSUc+LQPSikfBlbg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=z9tbli-vAAAA:8 a=vggBfdFIAAAA:8 a=9J0IUMs9zsKUqv_KTz8A:9 a=FdTzh2GWekK77mhwV6Dw:22 a=RmrFvp9qXTL7MAzcxlte:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-11-26_06,2024-11-25_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 bulkscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411260065
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Nov 2024 08:11:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114064

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2024-31950:
In FRRouting (FRR) through 9.1, there can be a buffer overflow and daemon crash in
ospf_te_parse_ri for OSPF LSA packets during an attempt to read Segment Routing subTLVs
(their size is not validated).

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2024-31950]

Upstream patches:
[https://github.com/FRRouting/frr/commit/f69d1313b19047d3d83fc2b36a518355b861dfc4]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../frr/frr/CVE-2024-31950.patch              | 68 +++++++++++++++++++
 .../recipes-protocols/frr/frr_9.1.bb          |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch

diff --git a/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
new file mode 100644
index 0000000000..c579ec283e
--- /dev/null
+++ b/meta-networking/recipes-protocols/frr/frr/CVE-2024-31950.patch
@@ -0,0 +1,68 @@
+From f69d1313b19047d3d83fc2b36a518355b861dfc4 Mon Sep 17 00:00:00 2001
+From: Olivier Dugeon <olivier.dugeon@orange.com>
+Date: Wed, 3 Apr 2024 16:28:23 +0200
+Subject: [PATCH] ospfd: Solved crash in RI parsing with OSPF TE
+
+Iggy Frankovic discovered another ospfd crash when performing fuzzing of OSPF
+LSA packets. The crash occurs in ospf_te_parse_ri() function when attemping to
+read Segment Routing subTLVs. The original code doesn't check if the size of
+the SR subTLVs have the correct length. In presence of erronous LSA, this will
+cause a buffer overflow and ospfd crash.
+
+This patch introduces new verification of the subTLVs size for Router
+Information TLV.
+
+Co-authored-by: Iggy Frankovic <iggyfran@amazon.com>
+Signed-off-by: Olivier Dugeon <olivier.dugeon@orange.com>
+
+CVE: CVE-2024-31950
+Upstream-Status: Backport [https://github.com/FRRouting/frr/commit/f69d1313b19047d3d83fc2b36a518355b861dfc4]
+
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ ospfd/ospf_te.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/ospfd/ospf_te.c b/ospfd/ospf_te.c
+index 359dc1f5d4b8..091669d8ed36 100644
+--- a/ospfd/ospf_te.c
++++ b/ospfd/ospf_te.c
+@@ -2456,6 +2456,9 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 
+ 		switch (ntohs(tlvh->type)) {
+ 		case RI_SR_TLV_SR_ALGORITHM:
++			if (TLV_BODY_SIZE(tlvh) < 1 ||
++			    TLV_BODY_SIZE(tlvh) > ALGORITHM_COUNT)
++				break;
+ 			algo = (struct ri_sr_tlv_sr_algorithm *)tlvh;
+ 
+ 			for (int i = 0; i < ntohs(algo->header.length); i++) {
+@@ -2480,6 +2483,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_SRGB_LABEL_RANGE:
++			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
++				break;
+ 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
+ 			size = GET_RANGE_SIZE(ntohl(range->size));
+ 			lower = GET_LABEL(ntohl(range->lower.value));
+@@ -2497,6 +2502,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_SRLB_LABEL_RANGE:
++			if (TLV_BODY_SIZE(tlvh) != RI_SR_TLV_LABEL_RANGE_SIZE)
++				break;
+ 			range = (struct ri_sr_tlv_sid_label_range *)tlvh;
+ 			size = GET_RANGE_SIZE(ntohl(range->size));
+ 			lower = GET_LABEL(ntohl(range->lower.value));
+@@ -2514,6 +2521,8 @@ static int ospf_te_parse_ri(struct ls_ted *ted, struct ospf_lsa *lsa)
+ 			break;
+ 
+ 		case RI_SR_TLV_NODE_MSD:
++			if (TLV_BODY_SIZE(tlvh) < RI_SR_TLV_NODE_MSD_SIZE)
++				break;
+ 			msd = (struct ri_sr_tlv_node_msd *)tlvh;
+ 			if ((CHECK_FLAG(node->flags, LS_NODE_MSD))
+ 			    && (node->msd == msd->value))
+--
+2.34.1
\ No newline at end of file
diff --git a/meta-networking/recipes-protocols/frr/frr_9.1.bb b/meta-networking/recipes-protocols/frr/frr_9.1.bb
index a172a4c6d3..305ef8f1b8 100644
--- a/meta-networking/recipes-protocols/frr/frr_9.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_9.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/9.1 \
            file://frr.pam \
            file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            file://CVE-2024-34088.patch \
+           file://CVE-2024-31950.patch \
            "
 
 SRCREV = "ca2d6f0f1e000951224a18973cc1827f7f5215b5"
-- 
2.34.1


