Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C938FD29DEC
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 09:47:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55392.1768297653383873687
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 01:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=k3kamw/p;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5473072fb8=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D4aLbS2865038
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 01:47:32 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=XnxEyP3Le1qJM3tHUQaO
	onD0RqpjhnpDlLos1NUWvak=; b=k3kamw/pCB8QC2WZ9Vtf7/yq1v0yKZApFg+i
	ppNf+i6wjZrdzJbL6dZLcQhhA0qSKhMlafbWHjemRXHLofNO+KFUkf5jkKmhyA7+
	x9PSPAu4BSCCdqr7Tgz6h/GVxlLPdqhNcPovYa83GJoyD9XmpFF2pliDnXbU/ISG
	HIogKpb9q3te1UKEScKAkx7apb6QW4B6yYwfpKE/MaerRz2XDPUuoY41q9ZG5PRs
	UBsKckuc6DGjOfOVZ28ix2ZjFOy+3qv/ShZGNrccZt2Cn46iW1ThulCBRK3D/wE9
	/ZqTDOHjozG0KlD7uSXEljQiNc3whR35SF0ZwnRhJcwUtFiOkg==
Received: from sa9pr02cu001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bkq5ftkm1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 01:47:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SZ/GqPi2sdalERNOoLB2N0D57qr+ZtJCA39DVTXHEQOoYtl8TkRi7YJqCPNo5SRdQgSA7IdbkFeQt3tr0ds0m+WEzMBFMEtxVaTgPhj3jdS4JxUR4su/evZ5zlql/0ZU2ksi4Cnc23xh56ZR6e0ZR6IP84sfChMvrUIkOAeimuvKArcY9ppcgDqbq9XniDWzKYoGAzrqi0klqQiymcLr6L06TWWLwtBxCv0cewO8oeUGF4iOLqAs3xJR3aZUc2ZMMItx3qisAVcfRcVJYq5EdhrhZ5v6ZFwxSDcRQ4ls/mvKlJeVMYAqXrphOK0OLLRo0hx3gEJTBZo8HcrPvw6zVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XnxEyP3Le1qJM3tHUQaOonD0RqpjhnpDlLos1NUWvak=;
 b=UVZx5doB7+u1yQ12Da6wZqaAtai8kzPTSlw+XVtodyOCokupgwXNFYPGICFYyI6aaq/BAo4lEoIlzjOaeFplvbshqVytmuBtDppClDm/m7zacVGJDKgHuDDmRNBA0+0eUCtmnLOhh9WGe8nNH/5NBHii/Y54dVYcTCtFVj6eNR4rW565ziZ9HZiT4oEZlFBRfk/H0HIDtj6DAgcDKFXxYlZDeUPjOFtbpL+GQIlmrjrHeRHo5T0reNE0wDPtm/y2hz8vvIrfBVWgP5JBxBr+wEYKhI61DFr7LVD3QRq7zDMqDjcI6zRO6/AQWQe0LRGKX4i06ZsyGuP9uacBtEydow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by DM4PR11MB6336.namprd11.prod.outlook.com (2603:10b6:8:b9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.7; Tue, 13 Jan 2026 09:47:30 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::7b99:70e4:edb2:30c2%6]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 09:47:30 +0000
From: haixiao.yan.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][krikstone][PATCH 1/2] python3-django: Fix undefined _lazy_re_compile
Date: Tue, 13 Jan 2026 17:47:03 +0800
Message-Id: <20260113094704.1489156-1-haixiao.yan.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|DM4PR11MB6336:EE_
X-MS-Office365-Filtering-Correlation-Id: 96791481-fdd6-4cb1-2430-08de5288c4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?FAy51HGk1Jz4/PXkPy3wlZ+f0mjXwZnnuX1sVLZlRvmHal3rx2t29U78zzVg?=
 =?us-ascii?Q?gHD+gxP68GBhev+0QC73HB0V9ZOuqi6dOt1cyZUkSoWpnTlvGjHx1MFzgeH3?=
 =?us-ascii?Q?yFhp2W/dEf08nvkyFK5twJjZBfL8u5jvH+KR89GOSjGpQYFWVNjxrJbjEU/j?=
 =?us-ascii?Q?xZFwtynREPYiXNTlYXMR15TVBqacvD6GvrpXtfQaLfhLL3fvpaXt3k++iKuR?=
 =?us-ascii?Q?9NmxyzegqFSuMBWB/9FYS7+ItLybHpKPJjdgraCX3oMk3587JYBf3HY23x3A?=
 =?us-ascii?Q?Qb6DNn2ZPvr59OU/BFG3+Sh6FFpUk068m+rphRq9Swgq14mQuJmP3z1glKEJ?=
 =?us-ascii?Q?iBkAqrs/amkUcfwigzfORJf+pjSSn09a2MaH2E7gN+q1z8Afg7PlkhPm+aea?=
 =?us-ascii?Q?0fzwTjcqXONl85/GZRPZkcD9RuPFfq5QyeSoidaeLbpvGb1nS4/68jyD4pFx?=
 =?us-ascii?Q?N8Jon2i4mRR17idGLfJjP1z/41MbpDvCVCW0y4tuYDghlBIT9zZRYn2WENS0?=
 =?us-ascii?Q?xa1qxiQprkgFM9jtGi1UqYlPccwi5YiTYnOcN0VdsIoqcIvvJH4PjOihSoDr?=
 =?us-ascii?Q?0vieBVJsrcTpNfTrihrFdyfUQZ9HRnswYC7MlzMWgtp5MAoU5HTQyMIGYfW0?=
 =?us-ascii?Q?4kVmGS453RoUbjSWCeDGq7Y+ClG217HCF9fT9eL79Iwf3+tgG6f9v5pSXYq4?=
 =?us-ascii?Q?EXc/mtDisqF0JkpiyBXWMeMXEtCqP2GQZpKHUtzPMHQbeHyPASHd5UsC3kGg?=
 =?us-ascii?Q?e3jMI4njiAEzXBmBdLYa1xz5YsooBsTGSjy7RZLplZz6bP6JyH5vFqXwWrBR?=
 =?us-ascii?Q?6TmEhNggoY3rO1zwOD//eRWlqp4PF3S0yAfFomt6IWsE55ZDFCuwlglI7Co2?=
 =?us-ascii?Q?fUalqYJpWgDzlDiDnPGcgTBJEvSO+wfdwRiBy238k7/p97MzBfmIcWH8ydN0?=
 =?us-ascii?Q?Ba9Y+QrXWM6hyhICr7hkT+AXcjAercm6rol5ghQgP7kfH+cZGsyukzYordnB?=
 =?us-ascii?Q?sEXqqHzJA3Q9hTXT6hJ6p79fgpBj7JMxvho056GfqzJ7YUuAI6hq0hkN4pnm?=
 =?us-ascii?Q?uiSu7rnK5PAqX/SbnAIbMVSjQa4nVLE/ujjvjyDN6hG4bqJU3VLyuYNCWmP1?=
 =?us-ascii?Q?42P9OuL6kVAHXT5eUNE6GZRITsZ5Xt7Qx7t/4xqkI1C/sBc3TUPD3Oa9oOlN?=
 =?us-ascii?Q?86RWPRnqh7YYy3VAxVbWJ/BPzBQhEW1AnUI9esTXr5cleNlsvWBXzJbh2bT4?=
 =?us-ascii?Q?973q4laM8zpAgWtkiG/pidU2qHaFVPh2MtbmI4hv8jMLOQJHl1L9nHEMMkf7?=
 =?us-ascii?Q?MZjD/nm3+S+JBdf2/7pqWn/1/7BTg6DiVu7WFFGt2gP01t1hl7hkRL9Qx8nx?=
 =?us-ascii?Q?7CR9QU17xMKhNry0VOdcG/XuWfKcmQ9fQCeWFbBx5Xbjh1kCN7KBwOMgtCYV?=
 =?us-ascii?Q?ZZ7G7P+AsZKOZRNPzyN4CwJ+9rVhkDsue/FOU9pJJJu3byiyVxds6BFdxyFU?=
 =?us-ascii?Q?mHZNUhp6M/iIeoSxDkxFbBy7uax47xg6JM1a?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iRfSL91EKcicOMcKRhdL8yUYf9PdSCAzbS2qBNeHMwMreQ7YQYfCAXFqfXtX?=
 =?us-ascii?Q?OU5Vxhh8mor6edGFGPJkqrTx8wlWs+Z5bivn0rYCfZAPyyqX1DzHgf8yHz1v?=
 =?us-ascii?Q?QJn4GePXhaNq2U3xb+vpUb1+W+N/P7PAGBkjpHkKuaZmxdU/YUAxtZUeWLBG?=
 =?us-ascii?Q?K3a+Mbv5tKmGEMb2cwlSE+MyXr4OqDZ7FNKIECeXAKiO1/4EgNjtcqOFp4Ri?=
 =?us-ascii?Q?dSoHakT2MdpV6xgJTJkkd1B3PGEzYLQBPBnbrKuQngKWJG5LtzUXBP7cjwqM?=
 =?us-ascii?Q?e9YiPaoyPos/LyvPfWclRAD1CnZaLy0xtoYClzE5Le6FDvrYcKCYzNXgzCLS?=
 =?us-ascii?Q?BWROonDAcKDfxjZSB+YLisDavXK1gbnbzTBCcmZ24PSnhGBsJQ1MBlCylt9X?=
 =?us-ascii?Q?DcTvp5vayQUo/gS4hyAuNlOWYH0Lfz/OMC9GayUqzmqTS6t92+l4Tkzrj9ML?=
 =?us-ascii?Q?0QJfwRri1s30KGwE83ppqyjGlAgPXZUOXEXprWedN70oGYdTKFDYGeTe015e?=
 =?us-ascii?Q?ujDIZLc0U5wusRBOo4LLSvEhwpc9Xpf0KNo+hHZX2P4bJK3QzzQwdORzPVqR?=
 =?us-ascii?Q?0aGLRUOn4hd5A+zvReuThcSVP+QI6IdPKDk8nG1hZo+rQN908NSt6WA5jsXb?=
 =?us-ascii?Q?flJKDXcyAwTjYT/kWCugHcUucvY/hLW6JoOUUyLQ5ygUigaqNP74EAQ+udOT?=
 =?us-ascii?Q?X8ZfLY0PJrvg0hRTdQC/AWf9r/qzYlb2LXk2GB8NPnsDjPLVatHJA10A8pmC?=
 =?us-ascii?Q?Y62inoDbcgPZ4jBT2NneLre+U8yhnfKzOaSwCkJ/fby1i8ciop4ZLlcqn2Ga?=
 =?us-ascii?Q?+7janoYsPwdlWirmY/Uo/QTKY+FI0iSYKrzx7AfY3BHWSYvgsfXPzuNXVLcQ?=
 =?us-ascii?Q?g/feemiYHWDE8fOlJUfB2NZKP7NTywZcIlEBexNYKjvUrZq0DXQto0iBcx82?=
 =?us-ascii?Q?i0PO8W5IqtJHhGIKpDxEq4mdJWWtfMJ1OUM458toHRI5hYdJM7djowQ2QJRI?=
 =?us-ascii?Q?aCtDdVKVPP3etY8OZPPiJsUlDDAtlasvqstA13zUX+tNKB2QhPFu6y2PSC5p?=
 =?us-ascii?Q?E6+kkixgPaux900GKcZFnJy915Fxc4x2pq2hZDc2X5U/cIe0VsxMRu+ZGNvq?=
 =?us-ascii?Q?StTr9dTeANns8dHrV3VUP3bn5wjM/m+QuJWIi4m+95qat+bNgkWUOzZx8Cgn?=
 =?us-ascii?Q?21Q95bPAy8jo0DsbCwaTLm9O2tBquQOAhEME+ab5GLbXuFFM15odezZFZS60?=
 =?us-ascii?Q?IOivehm889oNLOWdar/0E2hUVXOKtjzeumizxKve8pFSEF+70XQmzTbs2gvp?=
 =?us-ascii?Q?G69iGw8jiiz2rEG8Rdn7px86dj97dGWD6R97fM84IvG8fJSF8RYvVqd4xS08?=
 =?us-ascii?Q?Zaj21zjbfP8WcZ4EKFCWiRn+uL4hrsSTFI6hrdQUdCQgykDZ+t8t14R9IXld?=
 =?us-ascii?Q?9l1DgP8yuItRgPctQDGYK0MaO4YnPYLtPytrttZLNkquiyLrYviKmrEX5H9e?=
 =?us-ascii?Q?70aPi1tTf3tZ4JAemK1Kd4emVWlhXkF5gMpBmDj+F1/BTPnRO6gLfZUdIrRp?=
 =?us-ascii?Q?58PaCJ2I8EVbXoGaQ6UX/q75hscHlpTy8U3D9dfqQ9Az2RBKDVsaNvxBm9mc?=
 =?us-ascii?Q?GpyVuGQcmpkLf1Ya29Sii3Z40eqa/J6Z30LJgO/udCr4DnyV7tLAf7FZ4mUU?=
 =?us-ascii?Q?mnQIF2DSGMGuNaiMf5laDbpq6NqeNdcF5863/mNPiRfYVGIsmVs+dki9/Zi9?=
 =?us-ascii?Q?p9ZcEWSHcERCbyNDdeJLvmN2wVO0qAA=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96791481-fdd6-4cb1-2430-08de5288c4ab
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 09:47:30.4063
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DCNikXrEcUS6xMhkL/+a4oXS5Fytnxo4lEzzlokgpkYvJ6LJX4l7yO6KJ75geRiS95pjNEBLMVgFPMQokiLb8ajdd0gADCkanSXp9UDAqHw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6336
X-Authority-Analysis: v=2.4 cv=d/z4CBjE c=1 sm=1 tr=0 ts=696614b4 cx=c_pps
 a=Q/wuv1ctlB2aVCAjPXHW/g==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=8uAe-gtA59Rue9El2esA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA4MSBTYWx0ZWRfX1NitvKivsQ5G
 ikWssoxMDe1qjtuR8rjVPNCSUkmWKy/j2ZoiEdRL5nrUnudp6XZVQCwawi2jLVfez32fgEL32BG
 Nx/EFeY5P5Ia3nv77x/6GEA3qq3Ru5toy/Bc+44/8k35Um7uBPwIHI0HHtQdC/xnwIt/4sLT+TL
 N34s8RNgZd3osUOizXXXvE/G/Wm6YyJnbENNLsl1I/H2BsFe4oGD/iLz8jNAKRkSk9kEkxCEgTN
 NQspzDo5tgvR9Df+GVck+sMqzLqfIPJUmMLICx8QyrDqHbN+NFDkucrPnN4mN4D31QQLjfnRmf1
 WcFHeui2cir15tcCUsoQPSLpIxsF4QaTlIVecDUT9jOejREcg9GMNDcRtg4jVnVGNOR0kkdX0Rp
 2rvogIM17bUzYDxzFcSqxsHAewzWBs80hTRxDUrHlte6Zic2tR6loMJi2qGxi4i1Zqr3v52SONj
 b/VFODAKN1+izhZYRkg==
X-Proofpoint-ORIG-GUID: 8B_mE1urBj8Sf19VcXoG41Wer9kGwWfs
X-Proofpoint-GUID: 8B_mE1urBj8Sf19VcXoG41Wer9kGwWfs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130081
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 09:47:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123405

From: Haixiao Yan <haixiao.yan.cn@windriver.com>

Fix the following error introduced by CVE-2024-27351.patch and
CVE-2025-32873.patch:

NameError: name '_lazy_re_compile' is not defined

Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 .../Fix-undefined-_lazy_re_compile.patch      | 49 +++++++++++++++++++
 .../python/python3-django_2.2.28.bb           |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch

diff --git a/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch b/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch
new file mode 100644
index 000000000000..63043b6712bf
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-django/Fix-undefined-_lazy_re_compile.patch
@@ -0,0 +1,49 @@
+From 4a2fabfecf1146706ef1310468936463988d428a Mon Sep 17 00:00:00 2001
+From: Haixiao Yan <haixiao.yan.cn@windriver.com>
+Date: Tue, 13 Jan 2026 14:14:02 +0800
+Subject: [PATCH] python3-django: Fix undefined _lazy_re_compile
+
+Fix the following error introduced by CVE-2024-27351.patch and
+CVE-2025-32873.patch:
+
+NameError: name '_lazy_re_compile' is not defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
+---
+ django/utils/html.py | 2 +-
+ django/utils/text.py | 4 ++--
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/django/utils/html.py b/django/utils/html.py
+index 858a517d92f8..6eb8bc3dbf38 100644
+--- a/django/utils/html.py
++++ b/django/utils/html.py
+@@ -38,7 +38,7 @@ _html_escapes = {
+ }
+ 
+ # HTML tag that opens but has no closing ">" after 1k+ chars.
+-long_open_tag_without_closing_re = _lazy_re_compile(r"<[a-zA-Z][^>]{1000,}")
++long_open_tag_without_closing_re = re.compile(r"<[a-zA-Z][^>]{1000,}")
+ 
+ 
+ @keep_lazy(str, SafeText)
+diff --git a/django/utils/text.py b/django/utils/text.py
+index c474d5681eeb..e104b60c4f6c 100644
+--- a/django/utils/text.py
++++ b/django/utils/text.py
+@@ -27,8 +27,8 @@ def capfirst(x):
+ # text with only open brackets "<<<...". The class below provides the services
+ # and correct answers for the use cases, but in these edge cases does it much
+ # faster.
+-re_notag = _lazy_re_compile(r"([^<>\s]+)", re.S)
+-re_prt = _lazy_re_compile(r"<|([^<>\s]+)", re.S)
++re_notag = re.compile(r"([^<>\s]+)", re.S)
++re_prt = re.compile(r"<|([^<>\s]+)", re.S)
+ 
+ 
+ class WordsRegex:
+-- 
+2.34.1
+
diff --git a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
index 24b86a3e262b..f2bb1de4f247 100644
--- a/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
+++ b/meta-python/recipes-devtools/python/python3-django_2.2.28.bb
@@ -32,6 +32,7 @@ SRC_URI += "file://CVE-2023-31047.patch \
             file://CVE-2024-39330.patch \
             file://CVE-2025-32873.patch \
             file://CVE-2025-64459.patch \
+            file://Fix-undefined-_lazy_re_compile.patch \
            "
 
 SRC_URI[sha256sum] = "0200b657afbf1bc08003845ddda053c7641b9b24951e52acd51f6abda33a7413"
-- 
2.34.1


