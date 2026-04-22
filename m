Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72807F55811
	for <webhook@archiver.kernel.org>; Wed, 22 Apr 2026 11:17:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.79909.1776855179691614458
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 03:53:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=sxJFqxSn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8572cb5ccd=xiangyu.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63M5mE66954862
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bLZlLQAat/uyT0eHtMBE
	S5lJxdpxCgzseGu0x+91Er8=; b=sxJFqxSnMkA5gHN0BfpSvuGw2MWHkIkfVm8I
	izYmRzY97ezIPYjivl3vAK8xDX27zV2CeXcroQwW1OI7cMkOG4ABHmqWfpjH3Iwu
	TaRbZNYwy1C3ZvVcfLzw//7msLQ2ZZYlEdx2J1gC98oWOYnkbvZmwAdRqZ6qhnjZ
	BX2qeGNeXHdEUSnlSyBcRCXwMH6cXivJsHfFdRK9mGw7bfHR/Mfsr6Ke/iF7HwD1
	D+NcSzJflvIBVIebuIh7va90AJdQqmq7nyGFUsKwuBhviaLPYbaVwFSIpxIDQW7M
	dyBWFLRPSYLHcA9oIiXbbBjqn+tE1tWlfPBsD9dpoZO7w5J+Wg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013004.outbound.protection.outlook.com [40.93.196.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dpenv8tbq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 10:52:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eDKbwkLHalpJIClKJAfR2Gr7L2sPZx692oQgnGPMjzc/835c5w9j5hv79TMwAoTRb4f1L1188PO76G6TkKKPV+ktjM+FiFCv1ctWzETM9X8ser2VHsE1kehDPslP1ZsBTpnZH1FhItGOSsZaEUn/dGGH96ZVI46rOuLIGKcpXHziqpjrCoO4oRZ2gID8hBBxwhcztGJ/H8lXG4RhKyAP/dSzOXzP1/xg57sWQlmAG3tbth2sJRm58w386beOUP/xpsh+Jqu3Mjl8hx/GtwhXbIjL7WCO9xUepcyNck+NXnDifRtVWuiI+EGFJz+QIoEzVVb6+2zdQBWMx17OLPyU1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bLZlLQAat/uyT0eHtMBES5lJxdpxCgzseGu0x+91Er8=;
 b=XiiolinLAfwdRSERNN5oh5/Ha6bb0oGhqoYtTUdXnmpiJgUpTXRW+l0JU6TmDRdb+ajesrTUpv3kWBsuFY/IAw/4/j0AAg1sXDxXZqI7k6FXNfBgVBNqzrOfCAthliafAIJ2VfRc+Aa+RY/YPgdJeTGs39mazAkm0dGmRm+Hmqix5XZCir5DcWD6g/wqXjrJTnlS/xOhmDAfacwPQvryTYxwE8ST4Ayb0oyMFRMTlkv3P3hzR6zt1KdxBpwL6jXFwTN2oplIKHPD4NkIcIph+SeG3TkxxQ/DsA38sIDvDCmAytD0G2GroRbkgaO+ZF+TISSpA3ldE+NwDtu4+AdrnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26) by SJ5PPFA058327E4.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::849) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.20; Wed, 22 Apr
 2026 10:52:56 +0000
Received: from DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6]) by DS4PPF641CF4859.namprd11.prod.outlook.com
 ([fe80::794e:2099:77b9:92f6%6]) with mapi id 15.20.9818.017; Wed, 22 Apr 2026
 10:52:56 +0000
From: Xiangyu Chen <xiangyu.chen@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] pahole: upgrade 1.25 -> 1.29
Date: Wed, 22 Apr 2026 18:52:44 +0800
Message-Id: <20260422105244.1814905-1-xiangyu.chen@windriver.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SE2P216CA0052.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:115::18) To DS4PPF641CF4859.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF641CF4859:EE_|SJ5PPFA058327E4:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c972d0c-98c7-44eb-30ac-08dea05d4fb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	tWOGyIBAzizWhxaPVKMjkbTxfiXd64AvKGpFphTdB64bKlq4ZRSzQw9B1tq73J3w78GcVBmVf0f/8tGfpT/GboWRcX3WErcTne0Lmg0C/d1STD56BkwnfQiUbbHDyGOHDhUGqu1muipWumpLnit6CayDuO8xZYca11VqJZH/32u/5haga8fP50fc2YzZmpP+CYsXb8jAjN6d9qPck9gjZj0P9yYOULDX9DfUIYV1NruWpKBBNeXXNLrk0ijSVhyX2AfBcw7ERo0dLJjphQPsPlmgVyOWvMr4Dgt44OfpfT4lR+6tIM1kksYijYR8dmPK3Fr1C56tlcV9gCEUmR8z8O9wwZtyBq2hc72LLERxGR3BCYYvahghloPI8tI1Xh24V6U12uoj9RQj+Cy4NY0LbeY2KVD74fFa8dDBZNdyo3O4ZcD0t961fmEr0sRdM84fSmOM7XrH08a7EzLlikZhLJEp/G9lrretsyGUVEX22gKQsOrTz9BsvnWnX+HimCM2UBO6HUHv4c17OuKGoaKtpmk5f/6PBvYnRhnhh1RL/KOW2QujwnunddMSRvBtNaD4U0D9AsegMdEFdtWJ2RQZuhXvK0aZWlAs6LUFLvXH6c84gLkBSTBU7XxD3n4UbwIMv1X5bds2NY7Bf7pXtnhowKUbMJwbD7FCeWNUW7CehPqLszkit9VaK22nOBVKer7p+fCG7vHFv8PtwDi/UuyS9NHi1WHRtpUj0wBqAsHSwLSbH375hhBMATq68c/y+fwW
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF641CF4859.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?LPvNy+L1xuTuKoynZV9Qf40exx8rkehFAYh+0U/04VmcmO4X0R4R9lQwRsSJ?=
 =?us-ascii?Q?WkZFj45vOoEyr7qtOIhi4OWlbCDcuv7YGm1CokYzlhZZLE/edF5peKEXd+eW?=
 =?us-ascii?Q?60BSXiTmVGccajF3ZyK3dOQC+X6R5m8OwzYLrkaRRJwTGifz9cXdJbR8xZM6?=
 =?us-ascii?Q?aRtpnRrp6ypFM3b1FgBLD45povdkMRSzzqHAKGongik1uvoLFKiaoM5ExYE5?=
 =?us-ascii?Q?tj+WsJoxkLhe5a8fGs9TQ54oKovbCmLsIC7w324rwCnxx9l7yxAlBT9uJa7k?=
 =?us-ascii?Q?erCIUbvIDZ3TrddjgLGa+PEKcWKCtK//rJh1ho80qfZAb+lmj8F/mCNAXPI9?=
 =?us-ascii?Q?6iZ9Qg+ffc9SzQU5WJYh/OQbhpEXUbn7rncLKiw1JP257IuVOijukpZ9WOiR?=
 =?us-ascii?Q?lRg0H3YgrVSxFpu71Qh5GsbZBv6fnCTdQqkEBkSntDArIr8lxLCgItzZATwR?=
 =?us-ascii?Q?lrYFwdFmVPMThAAhG3H+YfaRRV4rqsgxGaK5vLhzv3VSfHUnSRnt8R2CC32W?=
 =?us-ascii?Q?l78pYtd22B92kul5t2+LC+0a1wKJLUp2nP37JZGxdJLunsIvLWI+sO0ZEo9/?=
 =?us-ascii?Q?YOuqPni4uXh00mhd0KWiypVD+OjYcQC/a1nFEXYEYVXugX4mV8/ygxKl8Vy3?=
 =?us-ascii?Q?zr6JIHEkcSzg8e2FTGtOur1YFfVjPelt6rEMKnlGTCrxTq8x9KmHU/PBj4HX?=
 =?us-ascii?Q?GtcyopGN2fKTNFLDHXmNRc99FUH89POxrYPhqaZZaA87jux7U8ppDfEqPZeg?=
 =?us-ascii?Q?dAZ4poQgrA83BNWMXvG2S0J8s+PvlB9ImTpu1N75+y1/k2oJ0Mptom+jxRQk?=
 =?us-ascii?Q?OhaSfHLhK9jH7Pio+hkzWADQh50mGfVx2rrn2BXl8vMOQVbrMmqFUQeDbVuL?=
 =?us-ascii?Q?vSjLjY7fcmfuYjpQgMaXdJdEO3ll2XbniOQmCec0cgt/FkNs03oCb9X1VTn/?=
 =?us-ascii?Q?0uto4sFHEHKfjvkfFFp181KeoMtqpExNqYu9rOh1EnV9FYL+uzUOZqiCrgDb?=
 =?us-ascii?Q?AMdNIgygqS1KR3pnYdM1kkLa8PnKOlrocgf5Rz2NJZT578Qb1HCdvONQhHcl?=
 =?us-ascii?Q?GygN4jqI7K98HmFlMiXbSm4GFsY50AtUnaFH4e1QDPxkeFydfzVpvGaJSZXQ?=
 =?us-ascii?Q?9WhnGrThLd/dd4/O0wri2x2xENuqqoUsVHpzBwKnLClbdBYGclT3iFXMCRSn?=
 =?us-ascii?Q?xDGtLerIKAyEpK/YRwojH734E6CpCPKe6btPJwsnodiCg1TuLRZxv35k380n?=
 =?us-ascii?Q?gplLM48TRThr8VNxtkEnFkit+fibAWE5v1ht4Bdi10akvV/IU4X68fCqmZNk?=
 =?us-ascii?Q?TWnuz+L0pmKqR7uQ8DesGmDd53M1PRta28Tz2upkVnL0xa9Cv1N5JVC1uST2?=
 =?us-ascii?Q?u1D6JWW+RQ6AcnbeIXPUb+s0VacyLEFxdFIU5XNnzyaivjGdGele1e0JuWp2?=
 =?us-ascii?Q?O+zu8deefK3ByopBXb8HnBM+nM/UpYC5OGB2MazDYLjYJKoUHTiADRgQrsS4?=
 =?us-ascii?Q?vDQhi/J8ClY9RHNf2Wnovax8WvbVFFtfmyC7wOzE5rcEXdhVUnRkciRC3JN2?=
 =?us-ascii?Q?Xn2CIfuEVpH0QgIiF7YAun6qECywzfBOWcH4qIkdArOrUu6xg/QDdMBWbZXs?=
 =?us-ascii?Q?VfuPZoG4r39SJtjzCtd4OpmAdLyL2ol08KSReHF/Q9hBlmxDiRAl9DQ5olfx?=
 =?us-ascii?Q?5UBMGJXZRxwUA1CyyPoO2lzY0t8iNly5XQiLIH9H8NWZPEHmbhd503KCQPm9?=
 =?us-ascii?Q?qASwfwRakWPPYrjN3m1yAORp+c2OnRk=3D?=
X-Exchange-RoutingPolicyChecked: 
	XV+n+ULFp9Qk6S4C9bs1ObQ207Mb0hPMNK6hEHUtrE3PuQRNjwyoKyLaI8TS4balsn572MxUhgheabEMJT3j2+5wtUEpuBxOec1o/t/0nbsTVdMfREvuNMjJjcWawaDZhEJ01Qnpq9/ijmGjacI81b73jYV09ECBNLzKOJIYj/0zHjKZSy+uHB274nBDyISCt6/9TuJ3iu0kRiqez2hQYQMp7pOnXwx3TEXGnqSbcBLhR4afjWhNvjj4S4q0YrmQV86K7UAcdSd/Uhqw/UHmMAUhAYzGj9qfGBWoWd2LaZJ24iSqc/YQS711vXmwaNbS+X+cWhd4p9T5gH5jFsAv+Q==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c972d0c-98c7-44eb-30ac-08dea05d4fb3
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF641CF4859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 10:52:56.5192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eSI/pJC9buaqgZD/88P3IHTiy/VAzUC2ZvQHEh+E2AnmbqRs+Kzgz9oKjckhQBski5lwLEyoS6DkkWvnSvS4xWPu/0kBF5l47jOyKkleZdQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA058327E4
X-Proofpoint-ORIG-GUID: de6VCo0FnJWXenFEZOvdXa0VgqSk47z_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDEwNCBTYWx0ZWRfXzTFpZkbKKvVc
 k32InrbjkwUIHxZNgvLqa8fgRVM4egoC/OZyV48Rdtg741Ky6XFGpX+7Ac/Wb/uueQipMkj/HWh
 0fuQzBK7G0kYw/1qWVg2CYjRDME4aI0oNiMPGMoorm7KPtzOPPeAnHyrwr66NrHUW3RUFqUuT+g
 O8kE4+N7//9d3/IAooZpcY2qsBVfC/4aMuARsnqwOdwT891Ol/p74U819G8aANO6TtoCS1/+gVf
 /EtIKV09Ca4vdrSBK6R/ghpi6wf3xMBtnPNbiuXe1hrpHkUdrI0ZGjClM6HFa/zfzjbEQrbrDqf
 coFlYQBueSVJ+VTxdNvbbPT33KDJvUH+je4EoBXCP5ha36BXl7Ey6Y+umO3e8/Bh77J6SsDgYb9
 VkB+Yzeyd/biIMNMtGQOjjfFUPnCbOqThlRHzBo4awDqhQ0yez/qQ8Kv+oc90icP21NVxGpyeY0
 ePRfyPcd7DEPzhvyHwQ==
X-Authority-Analysis: v=2.4 cv=B9yJFutM c=1 sm=1 tr=0 ts=69e8a88a cx=c_pps
 a=pKtxidU6TXaQx3FGc3VI+g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=VwQbUJbxAAAA:8
 a=t7CeM3EgAAAA:8 a=yMhMjlubAAAA:8 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8
 a=phSrvZsk4bRkOxLkj6gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: de6VCo0FnJWXenFEZOvdXa0VgqSk47z_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 suspectscore=0 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220104
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Apr 2026 11:17:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126551

From: Xiangyu Chen <xiangyu.chen@eng.windriver.com>

pahole v1.25 in scarthgap non-deterministic BTF type ID ordering when using
its parallel mode (-j).
The kernel build system (scripts/pahole-flags.sh) automatically passes -j to
pahole for versions >= 1.22. This means two builds from identical source produce
different vmlinux binaries with different .BTF sections, even though the bitBake
task hash is the same.

It was fixed in pahole v1.29 (Jan 2025, commit 4c916259) which made reproducible
builds always-on by default.

Since Scarthgap is a stable release, the current v1.25 is retained to support
users who require the older version. Users can revert to it by setting
PREFERRED_VERSION_pahole = "1.25".

Additionally, the patches:
0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
are backported from Walnasacar to resolve specific issues in v1.29.

Signed-off-by: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
---
 ...python3-instead-of-just-usr-bin-pyth.patch | 34 ++++++++++++
 ...r-Fix-elf_functions-cleanup-on-error.patch | 55 +++++++++++++++++++
 .../recipes-devtools/pahole/pahole_1.29.bb    | 33 +++++++++++
 3 files changed, 122 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
 create mode 100644 meta-oe/recipes-devtools/pahole/pahole_1.29.bb

diff --git a/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
new file mode 100644
index 0000000000..7dc18d7aa2
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch
@@ -0,0 +1,34 @@
+From 436163ab845c263312cf3d4717a43727cf5f0747 Mon Sep 17 00:00:00 2001
+From: Matteo Croce <mcroce@microsoft.com>
+Date: Wed, 15 Sep 2021 17:54:01 +0200
+Subject: [PATCH] Use /usr/bin/env python3 instead of just /usr/bin/python3
+
+Upstream-Status: Inappropriate [OE specific]
+---
+ ostra/ostra-cg        | 2 +-
+ ostra/python/ostra.py | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/ostra/ostra-cg b/ostra/ostra-cg
+index 52c902e..8142e67 100755
+--- a/ostra/ostra-cg
++++ b/ostra/ostra-cg
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ # ostra-cg - generate callgraphs from encoded trace
+ #
+ # Arnaldo Carvalho de Melo <acme@redhat.com>
+diff --git a/ostra/python/ostra.py b/ostra/python/ostra.py
+index 86fe079..9bb5ad1 100755
+--- a/ostra/python/ostra.py
++++ b/ostra/python/ostra.py
+@@ -1,4 +1,4 @@
+-#!/usr/bin/python3
++#!/usr/bin/env python3
+ #
+ # Copyright (C) 2005, 2006, 2007 Arnaldo Carvalho de Melo
+ #
+-- 
+2.31.1
+
diff --git a/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
new file mode 100644
index 0000000000..fb779481d8
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/files/0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch
@@ -0,0 +1,55 @@
+From 6fa2b7de3e647e64c5d693aea7f3bacbfa964f53 Mon Sep 17 00:00:00 2001
+From: Ihor Solodari <ihor.solodrai@linux.dev>
+Date: Wed, 20 Aug 2025 09:00:03 +0100
+Subject: [PATCH] btf_encoder: Fix elf_functions cleanup on error
+
+When elf_functions__new() errors out and jumps to
+elf_functions__delete(), pahole segfaults on attempt to list_del() the
+elf_functions instance from a list, to which it was never added.
+
+Fix this by moving list_del() call out of elf_functions__delete().
+Remove from the list only on normal cleanup in
+elf_functions_list__clear().
+
+v1:
+https://lore.kernel.org/dwarves/979a1ac4-21d3-4384-8ce4-d10f41887088@linux.dev/
+
+Closes:
+https://lore.kernel.org/dwarves/24bcc853-533c-42ab-bc37-0c13e0baa217@windriver.com/
+Reported-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Ihor Solodrai <ihor.solodrai@linux.dev>
+Reviewed-by: Arnaldo Carvalho de Melo <acme@redhat.com>
+Link: https://lore.kernel.org/dwarves/acef4a0e-7d3b-4e05-b3ca-1007580f2754@linux.dev/
+Signed-off-by: Alan Maguire <alan.maguire@oracle.com>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/devel/pahole/pahole.git/commit/?h=next&id=fe6738f4b46b63dcdc5b15b252a014b3eaba16a4]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
+---
+ btf_encoder.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/btf_encoder.c b/btf_encoder.c
+index 511c1ea..2f8c6bb 100644
+--- a/btf_encoder.c
++++ b/btf_encoder.c
+@@ -162,7 +162,6 @@ static inline void elf_functions__delete(struct elf_functions *funcs)
+ 		free(funcs->entries[i].alias);
+ 	free(funcs->entries);
+ 	elf_symtab__delete(funcs->symtab);
+-	list_del(&funcs->node);
+ 	free(funcs);
+ }
+ 
+@@ -204,6 +203,7 @@ static inline void elf_functions_list__clear(struct list_head *elf_functions_lis
+ 
+ 	list_for_each_safe(pos, tmp, elf_functions_list) {
+ 		funcs = list_entry(pos, struct elf_functions, node);
++		list_del(&funcs->node);
+ 		elf_functions__delete(funcs);
+ 	}
+ }
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/pahole/pahole_1.29.bb b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
new file mode 100644
index 0000000000..b5110d05f5
--- /dev/null
+++ b/meta-oe/recipes-devtools/pahole/pahole_1.29.bb
@@ -0,0 +1,33 @@
+SUMMARY = "Shows and manipulates data structure layout"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "elfutils zlib libbpf"
+
+# Depends on MACHINE_ARCH libbpf
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+COMPATIBLE_HOST = "(x86_64|i.86|arm|aarch64|riscv64|powerpc|powerpc64|mips64).*-linux"
+
+SRCREV = "b9cc7963051b2099795129450f9b70c81950d02f"
+SRC_URI = "git://git.kernel.org/pub/scm/devel/pahole/pahole.git;branch=master \
+           file://0001-Use-usr-bin-env-python3-instead-of-just-usr-bin-pyth.patch \
+           file://0001-btf_encoder-Fix-elf_functions-cleanup-on-error.patch"
+
+S = "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG[python3] = ",,python3,python3-core"
+
+EXTRA_OECMAKE = "-D__LIB=${@os.path.relpath(d.getVar('libdir'), d.getVar('prefix') + '/')} -DCMAKE_BUILD_TYPE=Release -DLIBBPF_EMBEDDED=OFF"
+
+FILES:${PN} =  "${bindir}/pahole \
+		${libdir}/libdwarves.so* \
+		${libdir}/libdwarves_reorganize.so*"
+
+PACKAGES += "${PN}-extra"
+FILES:${PN}-extra = "${datadir} ${bindir} ${libdir}/libdwarves_emit.so*"
+RDEPENDS:${PN}-extra += "bash python3-core"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


