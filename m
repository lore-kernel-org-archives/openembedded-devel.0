Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2850C02198
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 03:06:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.2964.1739241490338713553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 18:38:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4137256d06=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51B2YCRO027803
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 02:38:09 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2171.outbound.protection.outlook.com [104.47.58.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44qwvdg02s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 02:38:09 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1uy4z6JrP9zGhn10ayuJlYpmhvPaR2Jj+7c9SbJ6gkMMaqFkN7I2he+vrNh6ZdmRD51w8SIPcckHswz2VQ3n4fjZvvq/q1Qc/RlvgjLCTt6aeClLXLMQz3OplrgeUp8nSVJq7Zh0J2XfR02AUQUIm2dYB8XCTGbB7aSpYZkNyKjAKWg8aCwGgBFeTHxOtJoHT37o5NWMHi8saZq1t63687KAHvT6imJEf86Qu57/d06I516iK6k6UzTcXPYnUApnNcGR3p89cg07tyEFWI9zzTl12a6Arb4PxUwEbuGFKxJMraUpPkRMKhYXAJqJ95Nrjdr5DWqTfp3gwRPOQqq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UiSj66bMfrpbPNIu5BMYs+ynvKXrHypHLTO+h7Owb60=;
 b=qXXn9lhMApWP9lk257YYjIUWDaO6mXzuxl9cIq+uIYyl6ey6VIHs0WSdKpj9s75/E99psutCbnXLHZ0YOKqDWMatJRmfNgvV1b5BqfL/NO9RPgkak0n60QO40rb1wAT5+xTLsqas59R6hov/zy42Q0PubByHmLCjtaFqYhCOIIOPe0SCFMRELm/k+mrfqbrAOnAZFY+v0TU3acWkLyFwcWVP4Jj5RX07xnhAyiow8RNo2ETh355KNwbxFLJXIgfKvb5NnaCVcI7Ag/So1MYrtBNBm2zH+9di+teNWl5nsPAZcTYTuXGqCWnCfV9ux90fuVcTGYzucIKHkUvn2mBjaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by PH0PR11MB7522.namprd11.prod.outlook.com (2603:10b6:510:289::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.16; Tue, 11 Feb
 2025 02:38:05 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%5]) with mapi id 15.20.8422.015; Tue, 11 Feb 2025
 02:38:05 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-anaconda][kirkstone][PATCH 1/1] python3-simpleline: Update SRC_URI git default branch
Date: Tue, 11 Feb 2025 10:37:48 +0800
Message-Id: <20250211023748.4054737-1-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|PH0PR11MB7522:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a2a3fef-7593-41e5-b89f-08dd4a451c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JG7X+jpuWdQ/pCfriPWe/nGtial1YmnmNel2pxD1tm5UySCzSgg6Dy/ugl++?=
 =?us-ascii?Q?XhIcsEZ7YCkIvP3p4rGE0AuT2ExCuInPwgtQPOXBrg+aSdSEMV3T1bVH8Wzx?=
 =?us-ascii?Q?JQXR2nlpWvFbQtHFgXUJz+VQmXvX5uZeRmwhjFQUUGH2+UTiDhCMhUpY52Es?=
 =?us-ascii?Q?EoqVhnqotchOMgKoayVy6SIJa22VuA9rAzyAdnBD3VO6QPtnp47vRhjfZVOX?=
 =?us-ascii?Q?4Zk21nFgyouxCQ9TRNBliFKF95vjxU0+axqi7WJtuX/DOYZr8+F/s7f6Xzx+?=
 =?us-ascii?Q?n/atOX0qfEou7yrrgzlsAuB6EihZrl4StttlaCoQmo/r7pGEjpHL/Hd+0bsR?=
 =?us-ascii?Q?z03NThDohkwsMQVfaSKWhHnYd5SKNbw2tO/428oRxWPTm1zM7I97FESRGp5Z?=
 =?us-ascii?Q?r23VrRQ/f+oF6Pg7AEVY6cyxcj0JwsScQj/Kmlcha2/XFD2JytFZb/CmqBah?=
 =?us-ascii?Q?ACA0SqvAI509GIRdedvPvGzRY3f5jmJnUK325nPD2bWuTer/PicbctX+8rlb?=
 =?us-ascii?Q?E0YSTRouwRb+78gYjdQaEtjancgwOZ5LJ79mnJ1BYxC7M7JZC/BXNjoN8xou?=
 =?us-ascii?Q?AWrXUqkNKzX8IrjeLm6GcN9AJckGWIiYZssF57E9bT1F41nZKAicxTGMuDYH?=
 =?us-ascii?Q?uMytrIBNXnK4azCp3Jf1WailKgBbpCiJ9tYR43Gc7DMbuhUd1C1mSS26m+PK?=
 =?us-ascii?Q?EYUgGqJT+JxAcdBBOfv1uww3XJyb79oloz7bZD9hXz3y4OdC8MArEPaeoHNV?=
 =?us-ascii?Q?7MFxvJP+qXBc5qC3TBwWNRSSugaktbEiAdQfgk7PuImtGvH3ZbOHNeJMo6k8?=
 =?us-ascii?Q?s0FHf/dlqTM2ZnNj+qhN4VIKzCDlOmFD2OPyzmG5hNc0GtJEXyawcevVUvhY?=
 =?us-ascii?Q?TTuEwxNOlCsqNYcCqA1G4TqvAs6hS8K++3rZupTvgRaqZRoOUdMxhOZ4mEsW?=
 =?us-ascii?Q?7zVBSXj+q2aUWfcUrRcsjImNJ75Yxg4l1gSpHkdxi6Z1qmiDiJai14v6eNsp?=
 =?us-ascii?Q?Ro5Vd10iWA82vIlcG5LQ2+JtDgR9sF+TdFtmRRFXqSsi1dfjEDrGO6UXaXg7?=
 =?us-ascii?Q?e2noQu+kO8cwCbJLRU+iQytuhwMtYOR8wFixkhl15GMZk8FilMZbNUf51Sir?=
 =?us-ascii?Q?q6l2AGBIdUZZ1QtklaOuGOXkCUr9Bd8g8pBRm2XhobG1mRE/Iypg2FNvSkxk?=
 =?us-ascii?Q?/Gq1m97MBABFY3XHXhf9O46dGNf3HTmhie0Wo73KdCXLmkQmKXt/KEpTsR1c?=
 =?us-ascii?Q?Q3coM1GxyPhGML/g4D837IA1Ma94tSz+S9mYZWBBjPL3DJ7Xx/8RtY6IQ77y?=
 =?us-ascii?Q?Yo238+0inYupJMSiroU2wvkIeiVYIDFQx2XH7WW1GYdi6Ldg4uoRzEXXAvPW?=
 =?us-ascii?Q?vjGCSEvm27y9xmLbY2AH1IOAWbXnxLwYgHP+/DOOYVvCQlAT2pGKFNFkMAII?=
 =?us-ascii?Q?+f4raEIHhJfn568CW2bC+/KS4dk1G5+H?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a5glb9pCZNxDq/CKafpGBX+Wo553eoyTxb6tNSiywcsbl++lfaOvSC4X3rAI?=
 =?us-ascii?Q?Cir0xoNhkAD9Hd0rd7qk0c8pHzdO1guxvxO0NxI1Z7wdLKHmXq8ZLxrXE2P/?=
 =?us-ascii?Q?6xHh9E3R/Z0P2vz8gjbWTK60PRwqT3j2rE+BrwoC55NfeSmeXtPP9wWKPTr1?=
 =?us-ascii?Q?GoWmKMbHKAWtykRHUJiGDOy58+z3hwnrgrh5siSOMGNLbNczEfdKMDUgTCYW?=
 =?us-ascii?Q?wWLnsyL4tEstWezCz2iEt13aQ5KsU7OfbLaeJZIOIH2u9DDpf1c7qaTRWurD?=
 =?us-ascii?Q?wmSBj1B41W08Bu8adUkGwPznfw3aIdgZ1ugYeIfnU6chCQiyWAf9JtAH7LI9?=
 =?us-ascii?Q?NAqdzsQNNG+RZgFV/WvjMZiQ8OOgWKPCWJ7Vty74HsviCm4QgtKDCCPh+CDG?=
 =?us-ascii?Q?+HYMn4UKNosWcQpRo0akTSkxe8ddwGxTEeSque7H2E7X2bWrRSXDWBxaf743?=
 =?us-ascii?Q?E97S5rWCA7JoekipyrKu0Cd9t0n3/sRCMTD/eDeM9U4jD4DInUXky3gzLO1G?=
 =?us-ascii?Q?ZgFg+xShDdmovwbwrgvzV/JGSakCWHY+8gtZzLgOw0YeDmAM5WEls3fLg9Ni?=
 =?us-ascii?Q?pigNesluRluvfMI3DLA1KG0krqVlulQ/jXuHIMTvj2loAkjaNESgsNFbltgv?=
 =?us-ascii?Q?rIwTO6ErUh7EnOnKv1Aax0OYVK1eu1bPwNLLrvJp3WT85H422JC7s9PfbudQ?=
 =?us-ascii?Q?W/URBW0mmJmwU+aXsnfcEIyq7k/qE/UoYgk0491oXnQzUtFDwKatbLcl1Ipi?=
 =?us-ascii?Q?us8zDX6aV4I2E7IexAwl+osoEJpnr2uGSMHwSaDrmrghu41k9r7rVD+T3l4W?=
 =?us-ascii?Q?lviL8n94nRiGU7yDBflx1jhtdHWKVhLh0NH6VjhjPyUPe7v9uMnx1KZJViNU?=
 =?us-ascii?Q?ZKBTWaUZ89TGZVBLnNHwOhoENvKeI3AWlgJ650y/HakGPtkqPrlUIE/46kTd?=
 =?us-ascii?Q?rOn93Uqrjul6hrCrToeh0vvZhnwpHujpa3XLq5ZfQt+xzmMHiCzA6N8beIUc?=
 =?us-ascii?Q?x0anMmmKv4nmqaveY942XS136zE70S3J7maSGsNGIpJ1Cta76IZ87qD4Pzru?=
 =?us-ascii?Q?arBdxzBhmVyFznYjQKkXu913DJ9N+PmHUVSQDGlQgWzoeFGrZ5jve/QErlC0?=
 =?us-ascii?Q?f42lvemerBIA0yV5oTyRZHAXHISBfH+HgMIMS+/mSL2Zy1zozdsDgvDM6QwC?=
 =?us-ascii?Q?+e5llGFa4aYWOcEWVbhVBlIbqUlpdaEEeuIw1FjhzZmQybGg3ZLWa2pXLG48?=
 =?us-ascii?Q?XfczZTDUnRMo0RHD+Tyv2zJsuIiGTGUutV8BULcseOsuIx0TRqTZxQtAgliQ?=
 =?us-ascii?Q?4SN/0YdJz3FYTAmZXH4QV3bV0dGsgxyNnUebMTNBPLXT5yEHh5fgWcpywUjH?=
 =?us-ascii?Q?1OBAPIrdi9vqjEJbhZF8akI3LDLQu1lNGJia3XJLDsDb3UzoEqN2Gf87NWSw?=
 =?us-ascii?Q?3oVYQ7ANDl7ujVraOFh0wNWZUnqTpJ71bdW/DvOUvxvDzZZj503OBw4ddoAy?=
 =?us-ascii?Q?YsuWnfLjjsr6WhmDZsUyeUnWi2zUkcFkNBKmLJjjlHdFsV2jaY0MS7Ke/4an?=
 =?us-ascii?Q?GhorC8noV4Nl4B7fDjbJfN99xl94Uwe5jp5NpTxtnQhlJh/9hmOAMPxmiYjX?=
 =?us-ascii?Q?sA=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a2a3fef-7593-41e5-b89f-08dd4a451c8b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2025 02:38:05.2391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: daD2ZruaRyJ1SpXebeJUPKpWNzewqmao0/aXaPRHl3B2armpCrR+RftSN8vjbofzM3w2IIfSIBKtP0RDRs+4j9dngIwyMqvW3EtPW7Zbu+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7522
X-Proofpoint-GUID: JgYRXnrJ9nM_HcJTe20LvPEYfUpRd56p
X-Proofpoint-ORIG-GUID: JgYRXnrJ9nM_HcJTe20LvPEYfUpRd56p
X-Authority-Analysis: v=2.4 cv=K5bYHzWI c=1 sm=1 tr=0 ts=67aab811 cx=c_pps a=b6GhQBMDPEYsGtK7UrBDFg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=_utCFDc0kPIA:10 a=T2h4t0Lz3GQA:10 a=_Eqp4RXO4fwA:10
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=vnNxvRq7jGxPee0mIgUA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502110014
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 03:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115420

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Upstream has changed the default branch from master to main.

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 recipes-installer/python3-simpleline/python3-simpleline_1.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-installer/python3-simpleline/python3-simpleline_1.3.bb b/recipes-installer/python3-simpleline/python3-simpleline_1.3.bb
index 7b6cbe36b7b9..025f04071d15 100644
--- a/recipes-installer/python3-simpleline/python3-simpleline_1.3.bb
+++ b/recipes-installer/python3-simpleline/python3-simpleline_1.3.bb
@@ -6,7 +6,7 @@ SECTION = "devel"
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=5f4f48e95324081879552f19cd16c54a"
 
-SRC_URI = "git://github.com/rhinstaller/python-simpleline;protocol=https;branch=master"
+SRC_URI = "git://github.com/rhinstaller/python-simpleline;protocol=https;branch=main"
 SRCREV = "1c21ffdeda9eed27e5ad8ec16aee467f8daecd50"
 S = "${WORKDIR}/git"
 
-- 
2.25.1


