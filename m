Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39BB8CD98CF
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 10:41:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151473.1781606493402272180
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jun 2026 03:41:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EcTdnY7H;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0627746098=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9V7C3279923
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 03:41:33 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=nSXKgND7UUJoe1sC4VNA
	tIvT3n9jZnyLoomN5W/Vm/8=; b=EcTdnY7H6x58rEnhbbROQtA5jGIppnOPEUJk
	/tbjn2nbcNb/LBlqX+xlV2KPAgijwRtsbofxdYGqK5KdUqQZ5wTfCwAgew94w1mE
	C2jDAJL9h9Q+9MSk2B7b1+kOdLntF0On7UaBuA2U2cpNm1kF4Mws1s6iV7xrk2Sx
	BQQz6BSDqCzEYQ5JWD2StcDsp2nMxsKR/lN7fvY72IgNvAUoMvmJotaRoxqepaSh
	8CT0vuouzXMie86WDSOCIvtcgrg0ssM+bddSN+eUzSB5xixYaOjZC8kuX2bsxtOc
	MHR4dsZ+/cPl+HcN5iXUZT+Xn4oiOm44D9OG7u3b5v+GjeZsNA==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4es2g0cb13-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 03:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ORoa1CT2V1+GX0eFkjy9qDS1JYJVq+BaXFAaLzn0xmlSR9U4qzijhQ2GHBkdCE5Y7jtJHqs7YRtu0HnbQBK14eLlncKn3oF7AwuXDDws4aGglXSmovCGGvt4WBCsOAfCgz8Fonzmq+0mTJ1nFHLxRe/SP6YsBnoyRrrKLn65VRVUpNJelD8oQBwMAeg9lYUbr8YyP0nilrFJvSHwD4z3pbIGEp7gZHStfXBXAb1PlfLXU4S6qXzgExqZbjSZeIGm4eXYaowZ+EDhDIREWG3HsTNTPJfs0lyQCKEjeN4CXIPNfVLnrg1CCWwSmpXnzGMnEch+YFIYL/lhJsWCRSI3WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nSXKgND7UUJoe1sC4VNAtIvT3n9jZnyLoomN5W/Vm/8=;
 b=gf0OtNrLLukoYyhkysYQzcPbK7JBHvyinKnfi7YckoHlkJpeHFD9p4aKVkHTWh3SxghXRzDWCG5REkZFD3HjBqd9ci+xdiY2sNjh+fV3tt+NLqg/ES+T1uLH7B5lFEQ5DP2q0Nw2E54s1FNoaKrdWAH8f2rquQSLSo714OCFrkvb6rY/MWup0kwd3pxJAUXIbXhEad8znUXFUfLyeJt316ymq8+PPbe/06CXcvGEmNWRllA4Qgp+/WkSOS6z2BqwwDpjo7B8y+nNdMhBPvDXZgw66I5QuihJ7fKZmVXliqTIOABvQheLGiPIs3lnacSueOqd0cA9smC1mXqbngK6Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7200.namprd11.prod.outlook.com (2603:10b6:208:42f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 10:41:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%4]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 10:41:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] vsomeip: upgrade 3.5.11 -> 3.7.3
Date: Tue, 16 Jun 2026 18:41:11 +0800
Message-Id: <20260616104111.4073484-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:100:55::34) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7200:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4662bf-169b-4c77-3990-08decb93d200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|23010399003|376014|366016|1800799024|38350700014|56012099006|11063799006|6133799003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vGilCc1YaQ6OqHpTSJ80MaAnWj7mHVtMk/OoHTr3U7g0a3X7aa715p3Wcwok7Dzv5LxAvoQnpIpWRhOgublyswN1fEHk7fQtlx0IuYf2lQS4Fy420+CmgbwpCRaCH/11w9h6z6rc2gTeLO6f3CixM7uEIgVICxorINO3tZQZrlZABrUjHflrpO54TFci4tb5e2gb7bkKmzoHl0JxI8fGtCtIq8IzApLCN37UpJmgbjz3sk2AuTfOf6wOv2sOM/Wp5rA9zjjqBG1jDlAyTEvqSY7HQAcBPB3QMfGNlrI/UuSdzYQO/9kPWMzc4tMLdvFVc0okf71bpSN+F5SVsChjvG9tq7y6iqfvatNe1wEwECDqPm6NIUeuhUsLZT+VmepNn6bCse+T5diE3HcN2J8hWa3tj5yyMB+U7LiOh1kxe7jyxC8MO/SyichiadGivskNngtgNBmoEWnbrj4i6xLjOIDXNiydzqBh9CGrcSr9zdp7YLBmuakQIuto/b7ULCQLTNMGYJV0hPtI90aHxtyPaChbbOG/qc8EYyr8fjBNvT2J2V0pW3xK41knXxoENjobMZi8F+61fxgPSRcnIfRxfs40GNgbf8fIbAt8b33RHF9O0QZCXXoJrXCecmHXLiTENpMJCIzZSTwxkuau7+LHT/in7lcQOspfj+KxyFGX0nZPnDwaK5m2o/KsO9egSidE
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(23010399003)(376014)(366016)(1800799024)(38350700014)(56012099006)(11063799006)(6133799003)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rezM8BLG0ibA8fTW7/AH4VZFMKOyk1bivgf8z5pL0fpTU976LAwYQhyeQr1v?=
 =?us-ascii?Q?fuyYLGtbOl/JxLhUoLUrBiUhU2FVOMwspE0Exe/gBrU1ULv+r2SAt84S8nL/?=
 =?us-ascii?Q?5+r+LIAKLXQ/kiGVkj8+nk5RQXBXkiPSlDgLNrJGfiqrp12uXBKa2N+H6Bvi?=
 =?us-ascii?Q?IkHlMhSBKT7u1PHjL3hBTdr/fJG5agQFD6wc/FcXEjWh5sHnaIO1ojssuPrr?=
 =?us-ascii?Q?nliFfGLAOFByrjs4FuFsUM3i87fwO35vUXcwpnb2F88k76cOaBPe6C2pH21s?=
 =?us-ascii?Q?XMlzSeFdUXIeRIO5EMaWzsS1SXmP0U7UvaCkjlFkjVscdftb5gcJI6P7gPwh?=
 =?us-ascii?Q?5FDIBfbv7weSYLwcsluaRlEZYFUwXshZ4b9xGm+vNmJL0FX3PJvh81zj1EQd?=
 =?us-ascii?Q?JOJc8viJ7wDtapFmCI78Uy36TLXX7+MUDhg/KWsqaR93T1LsZXKoDl3ApxQg?=
 =?us-ascii?Q?nBDVmGzLEF9+02aZPdyj+KOKhIp1n4vS0WoNqiuqHLmAi8aum1NkQdH5b6XZ?=
 =?us-ascii?Q?ZfR6pgRo9wg97RXTAvalLnwGhmmz8feU6prHR44vVc6ATEnsyG5iC2fDJKVw?=
 =?us-ascii?Q?TtZZt47Rle/UBij+sutcNpZBeg46OfpsGtV19Ef7r93cWnQsocKPgT7Y/KbR?=
 =?us-ascii?Q?8IGjSJDqtBRKhR1FqtsVkepivSX4NlmqXlKWUbBwiMwh4FPVyPYOyiVTaFWD?=
 =?us-ascii?Q?8AET5hUanb+OmKYYWif/79+Y6qwOjLE/HvgDGxPuKLD72p7bYbkaaSVur+k2?=
 =?us-ascii?Q?RUClK8h+j06ChCGBw2AVDPmF0NZ3yIzb/Fnk1YBpi6k3BPunLTs+p+Z8cE2Q?=
 =?us-ascii?Q?giNUZo8vQ1DRCw9apFW6P+MuhN4nLwIQYfI+HAiqebUuaE0UBXZcoJe9vUQD?=
 =?us-ascii?Q?A/+xIwhKPAYND7vz8cSm9bb2Lc4c75IrgHnmto8/v7Lk4aSdjAziv2qNVIcH?=
 =?us-ascii?Q?f1+o6OiJM1tE7rC0R2kZOwwEfJ/WBzj2s+bP6CW15kjukFOfnKFKTWdm0L/c?=
 =?us-ascii?Q?NJTy1nxAq+c9sLjNycwe9Bqfe/eH/IXXYTileWf0VSpnXjmhMvGjYhVI6e7/?=
 =?us-ascii?Q?CEBajSWJfOo7q5eHL0zvdMHYlPF8vPnhbYtsbkxNrVzcbrtkMxYVhTPsFxwW?=
 =?us-ascii?Q?aycBeyYdQ+cI1f1RMn9ebeuR5zmTJeMCBwQsGvueFJeoK8UYWob6oi5CTkDh?=
 =?us-ascii?Q?PP9f7eYd0iuvR7PiN0X2dlgoljXxDdD2Rh2Hh+pprsqdg80QbtuDh7Q4CR5h?=
 =?us-ascii?Q?xs4LCUl622CCSFyEXM6O09CPTEo2dByIK3rPLHYAMRdkm6jRc9LYB1IgswZ0?=
 =?us-ascii?Q?VkTpEl6x6RuOTnW8n7i6gVZ9q0nCeo4kA/OeXKsSWudjPMDm6S493ntE2imm?=
 =?us-ascii?Q?vFQfhyWPH1Ps9TC4a7m/6BeVAx4daQ8iZcQnnJvtuMs1KKXOhCcncXEncCRq?=
 =?us-ascii?Q?hEugU3pzbgM8Jgo38XCD4MDyNYBHep0h28s0IVhK2C0RCJzyNfD5ZyhRQoW6?=
 =?us-ascii?Q?jdooNqBTkX+1lzf1WPtSR02oK0A8NLdjNjVo5vy9BlxbGd6dd3x/xDsYaEKN?=
 =?us-ascii?Q?ufx9/XeOm/OcG91kaK97JQnCTk32dXRghUVC7ciPuuuuZCRrttzrNnL43pr3?=
 =?us-ascii?Q?z+Gor2dY/97S69d8kxGp2Cm3pbOU9lZ9jiiwOV+06LLFDV1c64kRlvgSmeUs?=
 =?us-ascii?Q?ajETGDNlWcuX1xt9O79w8hOSodZQe+XmvsGGdCN46bhmN0cDlxPqSzmHzMts?=
 =?us-ascii?Q?VPOoQsxsdg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	Efz8GpIcjUEn7MNMF9ugsPPcG3NhwLFDnxx4KxrYiq4tgXGD9ZGMLWQnAbG/y1WlgH8ej+qmZr1IbQ+OdgL8KEU+XNVvVPbVFbZ3poR+wn6HTieG/SbYo8Hbp8VqKTGDG7dF3axhZAQJOBecLnYis5dbqu64oZ3C3EDun1dPcS1CD6s2TXymVu+W5PRQ2oj7kzGYCaCMpfNQE5h9g8u6CqQvc8Hi61FTmSvwPfCStpLfXnXWG+bQo/CvXCcyRSJCL4geuiSf+cSqdSA8fHsc6RH/RzKXB+4CiJE4HqKX5/4w3BMiiA+sKjiuAoAUSy1lOPbVGcuHu+kXVxt7qfd/5w==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4662bf-169b-4c77-3990-08decb93d200
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 10:41:28.0749
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3CsDRMNOJMqD4pTputt8vlPOCGDscLYZYf2cokYTcB6JVdU7vK4n1rWdeWWCevQE2e3MayWmLtM/axKBHy4ZQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7200
X-Authority-Analysis: v=2.4 cv=ZJ/nX37b c=1 sm=1 tr=0 ts=6a31285c cx=c_pps
 a=GxUr472PnxEa6H6od3s2nA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=XMC4lU5bAAAA:20
 a=NEAV23lmAAAA:8 a=pQs5aej7AAAA:8 a=t7CeM3EgAAAA:8 a=h7tqQsPW7ezBIPUsgFgA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDEwOCBTYWx0ZWRfX6RX+5vCJZ0d5
 KbMy+3ee9mjX37XLWzRrngMzN2nJLJAvZVg7JMu954M56jeztJQb2GBFKBKnR+mJ360McBe8APZ
 Z9/LsR6GaV/axolxGGODZgCNILhxGLpY6YtOlWIi2G1WcOjWk4xvhornS9cWyaktGUOc6eKOfzk
 B53NfYSZAKxbKgAVU80I9tMnmmKmT250uK4Y0uVoSpcrA58wjyOBtompghLFGsismVl983OL5cT
 E9ZjOJCT3P2sfImXlZYA5XW40fzc2YYta4FE41yvej0W/YQP6v9vJbQuO6qb1Ez2YYHlZ9Tbyk7
 DIsDhZpAKLlrm/S3bvreHMuI5g6Rrn31HjWVAamCAdG/ZWlflLGffe3RbYe5r1R3bsl0BgNDz3o
 lrOhJkv+xGff8GNW6hBmlINNJ4R54gXb1CZPTz3iDylt8X2/vSMqgR6gPc8JiFCO1FVShLT1Hrj
 Ba/Y4rGI5ZUX6TwqJcw==
X-Proofpoint-ORIG-GUID: tcvJaF5VR8Pm2FIebypXu0pO5z6J4-jw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDEwOCBTYWx0ZWRfX1o9VSlD+EIH0
 zeXVHpnSVLhl/XyFtnwRhEXOEdw+yp/u3zV/hwUrd0JBKe1Vi/PTau16+LU/lr+xcEeLNBWpkuN
 58IzWjleR0FjMj1DV2uBQu+8En/cvDQG0J6Vzqov3wT5xGl9uSHb
X-Proofpoint-GUID: tcvJaF5VR8Pm2FIebypXu0pO5z6J4-jw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160108
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jun 2026 10:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127619

ChangeLog:
https://github.com/COVESA/vsomeip/releases/tag/3.6.0
https://github.com/COVESA/vsomeip/releases/tag/3.6.1
https://github.com/COVESA/vsomeip/releases/tag/3.6.2
https://github.com/COVESA/vsomeip/releases/tag/3.7.0
https://github.com/COVESA/vsomeip/releases/tag/3.7.1
https://github.com/COVESA/vsomeip/releases/tag/3.7.2
https://github.com/COVESA/vsomeip/releases/tag/3.7.3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../0001-Fix-pkgconfig-dir-for-multilib.patch |  6 +--
 ...e-configuration-files-to-etc-vsomeip.patch |  8 +--
 ...3-Do-not-specify-PIE-flag-explicitly.patch | 12 ++---
 .../0004-Fix-build-with-boost-1.89.patch      | 42 ---------------
 ...4-Fix-scanning-64-bit-integer-types.patch} | 30 +++++------
 ...treat-warnings-as-errors-with-clang.patch} | 12 ++---
 ...ddress-from_string-with-make_address.patch | 38 --------------
 ...8-Replace-io_service-with-io_context.patch | 51 -------------------
 ...ts-CMakeLists.txt-update-cmake_minim.patch | 40 ---------------
 .../{vsomeip_3.5.11.bb => vsomeip_3.7.3.bb}   | 16 ++----
 10 files changed, 39 insertions(+), 216 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
 rename meta-networking/recipes-protocols/vsomeip/vsomeip/{0006-Fix-scanning-64-bit-integer-types.patch => 0004-Fix-scanning-64-bit-integer-types.patch} (89%)
 rename meta-networking/recipes-protocols/vsomeip/vsomeip/{0007-Do-not-treat-warnings-as-errors-with-clang.patch => 0005-Do-not-treat-warnings-as-errors-with-clang.patch} (73%)
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
 delete mode 100644 meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
 rename meta-networking/recipes-protocols/vsomeip/{vsomeip_3.5.11.bb => vsomeip_3.7.3.bb} (82%)

diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
index ffbe4e6744..52ec294579 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0001-Fix-pkgconfig-dir-for-multilib.patch
@@ -1,4 +1,4 @@
-From 0be97662524d86a24647f7c37b0a66b18da7b72c Mon Sep 17 00:00:00 2001
+From 3d1ddf162616978eeb9af8e2f64d4b3b63dba0f6 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 2 Mar 2022 14:51:13 +0800
 Subject: [PATCH] Fix pkgconfig dir for multilib
@@ -11,10 +11,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 8445ecc8..12c3b947 100644
+index aa4ad1cc..27e7b517 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -661,7 +661,7 @@ endif()
+@@ -670,7 +670,7 @@ endif()
  # create pkg-config file
  if(NOT WIN32)
          configure_file(${VSOMEIP_NAME}.pc.in ${PROJECT_BINARY_DIR}/${VSOMEIP_NAME}.pc @ONLY)
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
index 6dd854e94e..dde27b37f7 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0002-Install-example-configuration-files-to-etc-vsomeip.patch
@@ -1,4 +1,4 @@
-From c9d03f6b100d1be8bee75caf933e10fcbb599db3 Mon Sep 17 00:00:00 2001
+From 17f606e9ede2e3a1871c98dffff89e5285dd8c21 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 9 Mar 2022 11:48:44 +0800
 Subject: [PATCH] Install example configuration files to /etc/vsomeip
@@ -11,11 +11,11 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 12c3b947..b42f8688 100644
+index 27e7b517..67ecb365 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -578,7 +578,7 @@ install(FILES ${PROJECT_BINARY_DIR}/vsomeip.pc DESTINATION lib/pkgconfig)
- endif ()
+@@ -586,7 +586,7 @@ install (
+ )
  
  install (
 -  FILES ${EXAMPLE_CONFIG_FILES} DESTINATION etc/vsomeip COMPONENT config
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
index cada06e98e..066fc1c4c5 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0003-Do-not-specify-PIE-flag-explicitly.patch
@@ -1,4 +1,4 @@
-From 8054f459d47cde818ed9d1eb1e49efb4a8d4b3df Mon Sep 17 00:00:00 2001
+From 0b68560853035ff557e60902144be71bcbe0e3bc Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Mon, 17 Jul 2023 14:33:32 +0800
 Subject: [PATCH] Do not specify PIE flag explicitly
@@ -24,10 +24,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index b42f8688..c39184e9 100644
+index 67ecb365..bda9c69a 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+@@ -78,7 +78,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
@@ -36,12 +36,12 @@ index b42f8688..c39184e9 100644
  endif()
  
      set(NO_DEPRECATED "")
-@@ -82,7 +82,7 @@ endif()
+@@ -87,7 +87,7 @@ endif()
      if(NOT DEFINED _FORTIFY_SOURCE)
          set(_FORTIFY_SOURCE 2)
      endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -fPIE -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
  
      # force all use of std::mutex and std::recursive_mutex to use runtime init
      # instead of static initialization so mutexes can be hooked to enable PI as needed
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
deleted file mode 100644
index 45fffa733f..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-build-with-boost-1.89.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 2a5c3fbfd863a69eafce6a13b273f5c17cbf4062 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Mon, 3 Nov 2025 23:06:35 +0800
-Subject: [PATCH] Fix build with boost 1.89
-
-The Boost.System stub library has been removed in Boost 1.89.0[1], which
-causes a CMake error:
-
-CMake Error at Boost-1.89.0/BoostConfig.cmake:141 (find_package):
-  Could not find a package configuration file provided by "boost_system"
-  (requested version 1.89.0) with any of the following names:
-    boost_systemConfig.cmake
-    boost_system-config.cmake
-
-Drop 'system' from the COMPONENTS in find_package to fix this issue[2].
-
-[1] https://github.com/boostorg/system/commit/7a495bb46d7ccd808e4be2a6589260839b0fd3a3
-[2] https://github.com/boostorg/system/issues/132
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index c39184e9..ddc1eed8 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -189,7 +189,7 @@ add_definitions(-DVSOMEIP_INTERNAL_SUPPRESS_DEPRECATED)
- find_package(Threads REQUIRED)
- 
- # Boost
--find_package( Boost 1.66 COMPONENTS system thread filesystem REQUIRED )
-+find_package( Boost 1.66 COMPONENTS thread filesystem REQUIRED )
- if(${CMAKE_SYSTEM_NAME} MATCHES "QNX")
-     include_directories(${Boost_INCLUDE_DIR} )
- else()
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
similarity index 89%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
rename to meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
index f4653d0010..ff3510618a 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0006-Fix-scanning-64-bit-integer-types.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0004-Fix-scanning-64-bit-integer-types.patch
@@ -1,4 +1,4 @@
-From 67878aa198e17f13a6d1a0de72bf06a872aec472 Mon Sep 17 00:00:00 2001
+From 097d74721be56a1e6c1551cf53965d1055746b65 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Tue, 4 Nov 2025 12:50:51 +0800
 Subject: [PATCH] Fix scanning 64-bit integer types
@@ -27,29 +27,29 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  4 files changed, 13 insertions(+), 5 deletions(-)
 
 diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
-index 8a252c0b..9fb6c32c 100644
+index 8a2f1fdf..3e98143b 100644
 --- a/implementation/routing/src/routing_manager_impl.cpp
 +++ b/implementation/routing/src/routing_manager_impl.cpp
-@@ -10,6 +10,7 @@
- #include <fstream>
+@@ -9,6 +9,7 @@
+ #include <sstream>
  #include <forward_list>
  #include <thread>
 +#include <cinttypes>
  
  #if defined(__linux__) || defined(__QNX__)
  #include <unistd.h>
-@@ -3914,7 +3915,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
+@@ -3307,7 +3308,8 @@ void routing_manager_impl::memory_log_timer_cbk(boost::system::error_code const&
      std::uint64_t its_dirtypages(0);
  
      if (EOF
 -        == std::fscanf(its_file, "%lu %lu %lu %lu %lu %lu %lu", &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
 +        == std::fscanf(its_file, "%" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64 " %" SCNu64,
-+                    &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
-                     &its_dirtypages)) {
++                       &its_size, &its_rsssize, &its_sharedpages, &its_text, &its_lib, &its_data,
+                        &its_dirtypages)) {
          VSOMEIP_ERROR << "memory_log_timer_cbk: error reading: errno " << errno;
      }
 diff --git a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
-index aaf91174..dfe27e8c 100644
+index 7386b0bb..7fe7af5f 100644
 --- a/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
 +++ b/test/network_tests/cpu_load_tests/cpu_load_measurer.cpp
 @@ -12,6 +12,7 @@
@@ -80,7 +80,7 @@ index aaf91174..dfe27e8c 100644
          == EOF) {
          std::cerr << "Failed to read /proc/stat" << std::endl;
 diff --git a/test/network_tests/memory_tests/memory_test_client.cpp b/test/network_tests/memory_tests/memory_test_client.cpp
-index 102c8218..d922ad81 100644
+index 9d3aedfd..a502c8e9 100644
 --- a/test/network_tests/memory_tests/memory_test_client.cpp
 +++ b/test/network_tests/memory_tests/memory_test_client.cpp
 @@ -6,6 +6,7 @@
@@ -90,8 +90,8 @@ index 102c8218..d922ad81 100644
 +#include <cinttypes>
  
  #include <vsomeip/internal/logger.hpp>
- #include "memory_test_client.hpp"
-@@ -30,7 +31,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+ #include "common/test_main.hpp"
+@@ -31,7 +32,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
          std::uint64_t its_dirtypages(0);
  
          if (EOF
@@ -102,18 +102,18 @@ index 102c8218..d922ad81 100644
              VSOMEIP_ERROR << "check_memory: error reading: errno " << errno;
          }
 diff --git a/test/network_tests/memory_tests/memory_test_service.cpp b/test/network_tests/memory_tests/memory_test_service.cpp
-index a8547395..751c6f9e 100644
+index 549adbef..0b78a207 100644
 --- a/test/network_tests/memory_tests/memory_test_service.cpp
 +++ b/test/network_tests/memory_tests/memory_test_service.cpp
-@@ -5,6 +5,7 @@
- 
+@@ -6,6 +6,7 @@
  #include <vsomeip/internal/logger.hpp>
  #include <cstring>
+ #include "common/test_main.hpp"
 +#include <cinttypes>
  
  #include "memory_test_service.hpp"
  
-@@ -28,7 +29,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
+@@ -29,7 +30,8 @@ void check_memory(std::vector<std::uint64_t>& test_memory_, std::atomic<bool>& s
          std::uint64_t its_dirtypages(0);
  
          if (EOF
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
similarity index 73%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch
rename to meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
index 31e7efcf33..a9c00baa5e 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0007-Do-not-treat-warnings-as-errors-with-clang.patch
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Do-not-treat-warnings-as-errors-with-clang.patch
@@ -1,4 +1,4 @@
-From 74c6e762097ad8016d1410bd1beaef1398f02901 Mon Sep 17 00:00:00 2001
+From 6d5da6a08d04c314bd5065dcb178beb10dc609e2 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 5 Nov 2025 22:17:14 +0800
 Subject: [PATCH] Do not treat warnings as errors with clang
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index ddc1eed8..62b096e7 100644
+index bda9c69a..718ff23d 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -73,7 +73,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
+@@ -78,7 +78,7 @@ if (${CMAKE_SYSTEM_NAME} MATCHES "Linux")
  if (CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
      # This is only relevant for GCC and causes warnings on Clang
      set(EXPORTSYMBOLS "-Wl,-export-dynamic -Wl,--version-script=${CMAKE_CURRENT_SOURCE_DIR}/exportmap.gcc")
@@ -26,12 +26,12 @@ index ddc1eed8..62b096e7 100644
  endif()
  
      set(NO_DEPRECATED "")
-@@ -82,7 +82,7 @@ endif()
+@@ -87,7 +87,7 @@ endif()
      if(NOT DEFINED _FORTIFY_SOURCE)
          set(_FORTIFY_SOURCE 2)
      endif()
--    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
-+    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -O -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Wno-inconsistent-missing-override")
+-    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wconversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Werror -Wno-inconsistent-missing-override")
++    set(OS_CXX_FLAGS "${OS_CXX_FLAGS} -D_GLIBCXX_USE_NANOSLEEP -pthread -Wall -Wextra -Wformat -Wformat-security -Wno-conversion -fexceptions -fstrict-aliasing -fstack-protector-strong -fasynchronous-unwind-tables -fno-omit-frame-pointer -D_FORTIFY_SOURCE=${_FORTIFY_SOURCE} -Wformat -Wformat-security -Wpedantic -Wno-inconsistent-missing-override")
  
      # force all use of std::mutex and std::recursive_mutex to use runtime init
      # instead of static initialization so mutexes can be hooked to enable PI as needed
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
deleted file mode 100644
index 2c96c4945d..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0005-Replace-address-from_string-with-make_address.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1ca5cf52db05a44e5e469bc394c0a1b32fb943f6 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Tue, 4 Nov 2025 22:10:33 +0800
-Subject: [PATCH] Replace address::from_string with make_address
-
-boost::asio::ip::address::from_string is deprecated since boost 1.87[1].
-Replace it with make_address.
-
-Fix:
-implementation/routing/src/routing_manager_impl.cpp:1406:98: error: 'from_string' is not a member of 'boost::asio::ip::address_v4'
- 1406 |  _remote_address.is_v4() ?  _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
-      |                                                                                    ^~~~~~~~~~~
-
-[1] https://github.com/boostorg/asio/commit/c0d1cfce7767599c4cf00df36f8017a1073339ae
-
-Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/973]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- implementation/routing/src/routing_manager_impl.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/implementation/routing/src/routing_manager_impl.cpp b/implementation/routing/src/routing_manager_impl.cpp
-index a3dc5242..7b9619c9 100644
---- a/implementation/routing/src/routing_manager_impl.cpp
-+++ b/implementation/routing/src/routing_manager_impl.cpp
-@@ -1421,7 +1421,7 @@ void routing_manager_impl::on_message(const byte_t* _data, length_t _size, endpo
-     if (is_forwarded) {
-         trace::header its_header;
-         const boost::asio::ip::address_v4 its_remote_address =
--                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::address_v4::from_string("6.6.6.6");
-+                _remote_address.is_v4() ? _remote_address.to_v4() : boost::asio::ip::make_address_v4("6.6.6.6");
-         trace::protocol_e its_protocol = _receiver->is_local() ? trace::protocol_e::local
-                 : _receiver->is_reliable()                     ? trace::protocol_e::tcp
-                                                                : trace::protocol_e::udp;
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
deleted file mode 100644
index db0363ebc7..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0008-Replace-io_service-with-io_context.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From 4b2d82748eaf53a700002d05c6629fa6f5df3dcf Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 20 Nov 2025 17:27:39 +0800
-Subject: [PATCH] Replace io_service with io_context
-
-boost::asio::io_service has been removed in boost 1.87. Replace it with
-boost::asio::io_context.
-
-Fix:
-test/common/include/common/process_manager.hpp:10:10: fatal error:
-boost/asio/io_service.hpp: No such file or directory
-   10 | #include <boost/asio/io_service.hpp>
-      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-Upstream-Status: Pending
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- test/common/include/common/process_manager.hpp | 9 ++++++---
- 1 file changed, 6 insertions(+), 3 deletions(-)
-
-diff --git a/test/common/include/common/process_manager.hpp b/test/common/include/common/process_manager.hpp
-index e09d530e..23731785 100644
---- a/test/common/include/common/process_manager.hpp
-+++ b/test/common/include/common/process_manager.hpp
-@@ -6,8 +6,11 @@
- #pragma once
- 
- #include <boost/date_time/posix_time/posix_time.hpp>
--#include <boost/process.hpp>
--#include <boost/asio/io_service.hpp>
-+#define BOOST_PROCESS_VERSION 1
-+#include <boost/process/v1/child.hpp>
-+#include <boost/process/v1/env.hpp>
-+#include <boost/process/v1/detail/on_exit.hpp>
-+#include <boost/asio/io_context.hpp>
- 
- #include <iostream>
- 
-@@ -97,7 +100,7 @@ private:
-      */
-     void spawn() {
-         std::unique_lock<std::mutex> lock(process_mutex_);
--        boost::asio::io_service io;
-+        boost::asio::io_context io;
- 
-         // Handle env vars
-         boost::process::environment cp_env;
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch b/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
deleted file mode 100644
index ad68b5354a..0000000000
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip/0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 7dec71178aee905fac28712594f91969c6070b81 Mon Sep 17 00:00:00 2001
-From: Yi Zhao <yi.zhao@windriver.com>
-Date: Thu, 20 Nov 2025 17:26:27 +0800
-Subject: [PATCH] cached_event_tests/CMakeLists.txt: update
- cmake_minimum_required
-
-Update cmake_minimum_required to make it consistent with the others.
-
-Fix configuration error in higher versions of CMake:
-CMake Error at test/network_tests/cached_event_tests/CMakeLists.txt:6
-(cmake_minimum_required):
-  Compatibility with CMake < 3.5 has been removed from CMake.
-
-  Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
-  to tell CMake that the project requires at least <min> but has been updated
-  to work with policies introduced by <max> or earlier.
-
-Upstream-Status: Submitted [https://github.com/COVESA/vsomeip/pull/977]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- test/network_tests/cached_event_tests/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/test/network_tests/cached_event_tests/CMakeLists.txt b/test/network_tests/cached_event_tests/CMakeLists.txt
-index 4a68ae29..a2fbff86 100644
---- a/test/network_tests/cached_event_tests/CMakeLists.txt
-+++ b/test/network_tests/cached_event_tests/CMakeLists.txt
-@@ -3,7 +3,7 @@
- # License, v. 2.0. If a copy of the MPL was not distributed with this
- # file, You can obtain one at http://mozilla.org/MPL/2.0/.
- 
--cmake_minimum_required(VERSION 3.4)
-+cmake_minimum_required(VERSION 3.4...3.22)
- 
- # Configure necessary files into the build folder.
- set(configuration_files
--- 
-2.34.1
-
diff --git a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb
similarity index 82%
rename from meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb
rename to meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb
index 04e11d9b3c..dc110fd9ca 100644
--- a/meta-networking/recipes-protocols/vsomeip/vsomeip_3.5.11.bb
+++ b/meta-networking/recipes-protocols/vsomeip/vsomeip_3.7.3.bb
@@ -13,15 +13,11 @@ SRC_URI = "git://github.com/GENIVI/${BPN}.git;branch=master;protocol=https;name=
            file://0001-Fix-pkgconfig-dir-for-multilib.patch \
            file://0002-Install-example-configuration-files-to-etc-vsomeip.patch \
            file://0003-Do-not-specify-PIE-flag-explicitly.patch \
-           file://0004-Fix-build-with-boost-1.89.patch \
-           file://0005-Replace-address-from_string-with-make_address.patch \
-           file://0006-Fix-scanning-64-bit-integer-types.patch \
-           file://0007-Do-not-treat-warnings-as-errors-with-clang.patch \
-           file://0008-Replace-io_service-with-io_context.patch \
-           file://0009-cached_event_tests-CMakeLists.txt-update-cmake_minim.patch \
+           file://0004-Fix-scanning-64-bit-integer-types.patch \
+           file://0005-Do-not-treat-warnings-as-errors-with-clang.patch \
           "
 
-SRCREV = "f58ba578c8c04e02dcf08d3ebcb9a71ca1e203ea"
+SRCREV = "6171fdfe109a3af8fb64190136029aadd1fa0c6f"
 SRC_URI[gtest.sha256sum] = "65fab701d9829d38cb77c14acdc431d2108bfdbf8979e40eb8ae567edf10b27c"
 
 COMPATIBLE_HOST:mips = "null"
@@ -38,6 +34,8 @@ EXTRA_OECMAKE = "-DINSTALL_LIB_DIR:PATH=${baselib} \
                  -DGTEST_ROOT=${S}/googletest-${GTEST_VER} \
                 "
 
+EXTRA_OECMAKE:append:toolchain-clang = " -DCMAKE_CXX_COMPILER_CLANG_SCAN_DEPS=${STAGING_BINDIR_NATIVE}/clang-scan-deps"
+
 # For vsomeip-test
 EXTRA_OECMAKE += "-DTEST_IP_MASTER=10.0.3.1 \
                   -DTEST_IP_SLAVE=10.0.3.2 \
@@ -66,10 +64,6 @@ do_install:append() {
     cp -rf ${S}/test/common/examples_policies \
         ${D}/opt/${PN}-test/test/test/common/
 
-    install -d ${D}/opt/${PN}-test/test/common
-    install -m 0755 ${B}/test/common/libvsomeip_utilities.so \
-        ${D}/opt/${PN}-test/test/common/
-
     for d in unit_tests network_tests; do
         install -d ${D}/opt/${PN}-test/test/$d
         cp -rf ${B}/test/$d/*_tests ${D}/opt/${PN}-test/test/$d
-- 
2.34.1


