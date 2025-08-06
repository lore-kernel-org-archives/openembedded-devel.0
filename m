Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFCB3C87FCB
	for <webhook@archiver.kernel.org>; Wed,  6 Aug 2025 08:14:10 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20037.1754468048282293607
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Aug 2025 01:14:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0313fa0978=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 5767e5Lp2394011
	for <openembedded-devel@lists.openembedded.org>; Wed, 6 Aug 2025 08:14:07 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48bpyf8nrk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 08:14:07 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEu5q8TeMab3PTVKs4lDaAzFveE2JLiQUJqC6fe2JpnHYSTjuMPB7zlwYkMtywiAbBGAf5b7NScwa6SLpzzTC6h3VokjZvHFB0p0cAGAiACWBVBcIJ7r/EdqjFD9n5eVQfJv4RjtVD1RgSNWGzQYlmo9VCIDkvQs9WjcC46XGUCAQA/93Nzt2G9nkrDp9FFISwHTjswHKn/5D5GbjJ4db51GC1+zWnsZxCifpo7GqQeLTmYkcyNY4ILUwJD80lZ7aDVIT5NBxS+6UZJfcoqgfbr33XRFinEnAe1pe/eVSWjjNchkfWVO4A8vy4H0OyL2XcB4MnI9pyAQNU+XFeG50g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fW1nGScJIO8fh9LeJSzFKgbPoLUzpAPMJjWUtwWsFhU=;
 b=oajVUYQDVkiOr+YIZG4J288OSBzMP5OBjuSp6grCYa5uE0AHRyv8MsRVU7vknVVmZkvN0kuZu1LsGm88l8DDMdFgpnwvuFvftVmt6hPJidGZxa1YEtQ/wEdBhZTuCMmCMt8nE5y/Uaf5p/xIzvxbs6BVNJ+PGt2JJJEqDhzvsTHdrp/68lljypEwb6D8lUBvOLbLmjF8ZRLJiFntDYfunWa7Cql1j35zL/1NBjmMwSNnDPH9RpCxACtCPo5Ye0NZFDlxC7srBgGiQk4PYK2LU950gLrUcnCfT3Vf8p+0dmXaL4xvM/1fkf0PlUKtc2MAojrF9KKgnOwJux9CZ+ACMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by DS7PR11MB7932.namprd11.prod.outlook.com (2603:10b6:8:e5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.15; Wed, 6 Aug 2025 08:14:05 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.013; Wed, 6 Aug 2025
 08:14:05 +0000
From: Qi.Chen@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][walnascar][PATCH 1/2] protobuf: upgrade from 5.29.4 to 5.29.5
Date: Wed,  6 Aug 2025 16:13:45 +0800
Message-Id: <20250806081346.2626482-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0040.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::9) To PH0PR11MB5611.namprd11.prod.outlook.com
 (2603:10b6:510:ed::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|DS7PR11MB7932:EE_
X-MS-Office365-Filtering-Correlation-Id: 411a96c0-b406-46b3-2c8a-08ddd4c13354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YdB0A5MzTWfPJQLAVPfNeANSN8JwMCKZedqm6B351Y6Mx46gDC7AIH/vcdSM?=
 =?us-ascii?Q?qfS3+buQvC6XAqLBFhaKKqRK+OBfIvJ5kieYnxm69kVdmwOKCHbsaFkujTv2?=
 =?us-ascii?Q?HqQz7laosGPbNsSHVZwSX7N29g7VilEi8ub0hTMVHMgjFT2YTMhXsS+8QqUc?=
 =?us-ascii?Q?71PDPmBINu9SJ+TrDYK17q52l68PxiW8I/aJeqm+eP4k5djgbfrGKHtvbvkX?=
 =?us-ascii?Q?S7JAkW2KaCA+San6Wcl175ZzkJeF0GGhY0De/AfV4ataczrwSM3F5QSxrU29?=
 =?us-ascii?Q?Bp8ynQZLHSgyeW9bejfyGZV9g3KmVD7zyQJZ3HYtli31WmILlfv5rGTuckYa?=
 =?us-ascii?Q?cr3QBuOY163o5QmmxGaKu/3Mtf6Yq72HM/ziH3ztyODlgMhbzcH8gV12iS44?=
 =?us-ascii?Q?oAWfeMogyhGf6J4EBHILTu5DfA2uJYj/VdSPCl1ak5tsrenCcyr/B8KZ7vUw?=
 =?us-ascii?Q?5j7Rf1Y+u3Gn2YtFE51Wbw9ujR1pqzHXhKW6p0eIqk3VC7j9hwwDzJeiERB8?=
 =?us-ascii?Q?mPKpz87E/v8AjldMKY65O67OSvktMcUvX+p5yK+ATuUJJXCvQpLrNgvViJbl?=
 =?us-ascii?Q?2m8dEHcd5gf6djCqQSOm3txZ9GLItfariJ+ACaMhfEkiTW/Jd7q7zvqLSqGY?=
 =?us-ascii?Q?NAJMfrPYhODJn6omr7x1hVXFCJqAV7+Yc1Tf9Z/cvf35hs/Uo6Yrn6GKUJYL?=
 =?us-ascii?Q?Jan0EBkH05oQ0GuXQWClBKM0c0xgIws+r2bDY+hozxw+XTEX6wHSThTX581+?=
 =?us-ascii?Q?zzRdSkhotEiiIlmcrHIJWp9+kPctHVTP5j4U5UBqy+LA0we6zOwQTA/2tE/u?=
 =?us-ascii?Q?9hXN4jKODeTXbI8SiQJV5iR81GtbpF2DrsHLsJwhNu4ku1QzEkHxj8yACWRM?=
 =?us-ascii?Q?kJ2yOYTyohbx9NxlI6SguHOvVZQdt+qISPmnoRQhaVgd7e05q5vcfwap7U7E?=
 =?us-ascii?Q?zBSHR1t77Hc5IZk6QvHSPUKcpj8deQgE/9AMwfHPFBMxVy9KOwyOc01hHwX+?=
 =?us-ascii?Q?MOwxAS07incJmtRzDKtMB/c3kvNjFVclyEDB3Um3MR2IJpXHzn2pF7rtRbSX?=
 =?us-ascii?Q?BimE80wT7ODWEpzu6QEMryrTORlnhrk0NjDLpSQAWUmzPDI5FPl5y1tiIaIX?=
 =?us-ascii?Q?v9b7NQMxhjNrbpVR12i/tgHUKxaBo4Smcz1+1nrOmPSoj2MWI9RokitnvzW6?=
 =?us-ascii?Q?04scpds0N4/zuuBCIFYZWnZZw/KeQvFDRmgzyn2DbtKShd2AuyZxEA5cZmtQ?=
 =?us-ascii?Q?6ozVIaSLLGV6R7F/Urx147vYhKr294K9+zkA1qDEuTIWjQx0JaPEk31A8IQT?=
 =?us-ascii?Q?11+oHxDwCn+kLhcp8u/+QedwLmYq3z3+X/caBtqsiEyiRLBBqdVm3Umic6x3?=
 =?us-ascii?Q?uN6GasEFnnqm9M/zwxplIaYkJ/cbSlrtHRTux/y3TikCtiq3xDIQ9ubL5hsI?=
 =?us-ascii?Q?DjAfH1RK8sxexe/DFzZ49P28um/A0H1ewBPJjCsS9Henv82bucZWoA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WBcN8ZewA8HRINVw3Mg5TImzzrh/ayhK7SROuBpD0Fo+rRgqvN+uaRZUWyw+?=
 =?us-ascii?Q?4i/hNu9BhEYQ6RX4mbKP38/KHdnxoAy740pPtNsRkZpxjggPiKxf5gNDAzv3?=
 =?us-ascii?Q?aDjPNo4Ab3KlRNU8+NlzrtZwWIKCDT6gGIqk5YRAzCRh1kA9xkcpWSyCW47e?=
 =?us-ascii?Q?oshnS4YRjdQSYD4xzIfebuVGBXfcGLVFuGHauR0uFAwc0QKVOZ/w3itE4PtM?=
 =?us-ascii?Q?R72analsXObJepU3bLZMfUvP3tdW5HwWnMI+qLyWPeb1HHp29ObyNsUth50c?=
 =?us-ascii?Q?sC6RT9mrIhkUh2kHsNHT1P0Yc04YixwDli7OpHcmOy0WOmgJQzpeDv3/iwGY?=
 =?us-ascii?Q?9pzCKGy0gyiyR1lVQuIIP2dLTxe72/37PVrLhzSSChwxNAEP+w1ViireHdGZ?=
 =?us-ascii?Q?AR+AEI1iVg86r5pCtCx6wzkt8AgdNITQB/7gFNyuDE9PaD6eWT1KyWKKS51W?=
 =?us-ascii?Q?OHAWMxt9iD8GyhqEqCswAku4Di/1Ay9UDxkFqUtcA4rTHlBkWp7w0qp/WGhk?=
 =?us-ascii?Q?gJ/YXrLbTqFzPwVFGQ6RRgDaKXNPMBUGLwdbC4V09NIKf5wzNbdssIkFmxBD?=
 =?us-ascii?Q?tqmx1Nz0h9VYow53shQrmBUyb+Rch0F84xI8dlIfQgSkIy9wRjA6c2WMiOiu?=
 =?us-ascii?Q?Cj3ECAsag5qrCRqlYWVzz1hCTM0sZ768jfgC1+4MWSylXtAdCfYaJ7b1pAUi?=
 =?us-ascii?Q?RgPHcj91K8y1bqfv/nvhgG7Let20YZQNc9kKRRrMaUM/61ahVkSVCUfPzT+K?=
 =?us-ascii?Q?0StlGTwO2sDpLjp5nfrCmqFw7AMqc1cfkJOHaJ00pYLQLWA9eMofPO4k2gEC?=
 =?us-ascii?Q?tVCbVOOVntZMIiwMhusGr/DowizMShrVup7FpAF9hfTTFJwf3odIT0TaOohO?=
 =?us-ascii?Q?w7/Dxajy/p1gYz0bMXJNhJ6XBuMO2LZOxZKSFOOsw8Dy/w3lZhzMkFkYb9lN?=
 =?us-ascii?Q?vCDNk3ic4wgd7zcjCdkAw3gW7RM+oKKqhU3VbA8DZw/AJB00KrTuTpjidPkL?=
 =?us-ascii?Q?UnlqPmGOwLNZnXUFpjdGogSn/KBgSqjb3HiC2+KbZblPuBOcYBnsgiCc1hMS?=
 =?us-ascii?Q?uqaDeiV7OiEnFKMpQK2O4glEMd5/YrX39r3K8EnF270p6H9Jb3E7qfPFG1S4?=
 =?us-ascii?Q?tezqZ1bx9GU8C8RUz6kwmgWZnlwmXj82RqQscTh5ZIF0X97Vc9FlkP0CPmOk?=
 =?us-ascii?Q?aluYEUAoin7M4qi2iZeqIdwSKG0D+QbqazoHeHB4G9cr2tAj3YXhWb0mYsiJ?=
 =?us-ascii?Q?fgjncGXTGyJyQJ7oHnxFfyMS3Q/NPplPhqD2f5rtLGYaPwjqRQsFAKZJVUsy?=
 =?us-ascii?Q?PcsM6UVfrORk7jTLyGEZpmksH6I6DWMQa5fxwgDc3oJAHyyD7pAvH9hOvqyQ?=
 =?us-ascii?Q?5Fcuh4Ci4B34parOAtcgrp8PVBN5iroLkoAb76Mr7l4BuIAkzcvZUtCwRK9i?=
 =?us-ascii?Q?w2eF8jnpbQfC8lXalV8VbQ/r2MYYCf4smaap8S640wdoQjGRt1l8mkDJGoaO?=
 =?us-ascii?Q?ZysWH3bU+kCUSLyCAj2iUbvA0DPn275FQ7nt0p1iJQ/dHQJqIZrlCr4EPmXL?=
 =?us-ascii?Q?uMQgAAwXhzAraLzMftmnwVpj94N0Mkm/mQNApLWD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 411a96c0-b406-46b3-2c8a-08ddd4c13354
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5611.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 08:14:05.2731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSom3jJANhGFieQdh2064nJdQGNV8FleOJEA3a9xVLkzuMPH8vc8wilJEkrinV/rHWPiM1bwUfcY3HastFVgSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7932
X-Proofpoint-GUID: sl2Fy0Px8yaP7ODOPq3Wj9PHw9atlDnf
X-Proofpoint-ORIG-GUID: sl2Fy0Px8yaP7ODOPq3Wj9PHw9atlDnf
X-Authority-Analysis: v=2.4 cv=ZpHtK87G c=1 sm=1 tr=0 ts=68930ecf cx=c_pps
 a=liEUPl06j6ly8OSD0KH+qw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=NEAV23lmAAAA:8 a=jjZwBTYg8Yegfxom1SMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDA0OSBTYWx0ZWRfX2rbMBvkNjYM/
 vJXfaBWu2+DupGdg2NI//1/NlLYFCcTO1jCoeyBShQij6OnULZpvst+z0l7k6Qurt/1rzwFdenX
 SQNw+mNiiIb7XD5ZyWzZCeXqiEFLyXQbYhILOUxRG5UWOFsz+pemY26F8RjddFhlxhvsYRmgrRo
 WjmlvuItYLCaUQrv9ekYMVLvSivX5FJTNZEgSpeArmN28xSMAbUb9PULbXZCGZBFzb2/IdLeQdd
 iYBYVXacqknF8KdWsBJbZJf32vBvtA6NWmcQlev4O/ByF3nLKl77v+Qq7o1nMCarWyWLbs5uoM/
 +uXrhgRaboPFi23ASF3dqb4RxANgK6pQPGG/Z5yO8RdZid9MerD3FoBRe2V4eo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Aug 2025 08:14:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118887

From: Chen Qi <Qi.Chen@windriver.com>

This is a small version bump. It includes to following two
commits to fix CVE-2025-4565.

  05ba1a810 Add recursion depth limits to pure python
  1ef3f01c4 Internal pure python fixes

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_5.29.4.bb => protobuf_5.29.5.bb} (99%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
similarity index 99%
rename from meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
index 30b805e6b1..88a979d0af 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_5.29.4.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_5.29.5.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = " \
 DEPENDS = "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "1be1c9d0ea6efa2a25bd7b76186844d1669be78a"
+SRCREV = "f5de0a0495faa63b4186fc767324f8b9a7bf4fc4"
 
 SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=29.x;protocol=https \
            file://run-ptest \
-- 
2.34.1


