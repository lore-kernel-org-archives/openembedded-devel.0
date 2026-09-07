Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 881B9C79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 10:21:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31868.1788776502790052133
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 03:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=WbykTeTz;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3710b275f7=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879dgI93526099
	for <openembedded-devel@lists.openembedded.org>; Mon, 7 Sep 2026 10:21:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=b/Yxl5bTh5ASQdEY8ABZ12EiT0AkXhfaw/U2XegZRng=; b=
	WbykTeTziTuvi6DvXOEowrtNbfbcfe1QiELa+RqQhMo5CC6Yq37JMJjLWSKXsmci
	y390ZWPO9cKaaJFQ5RllZvsNmtvA1Odml4eMch80zU8EeHOG+otQZjBzgmzgRxWY
	irPcGCBT2kYNJfAMl50YiyLrAC33CNVOosuLsmpRmVmJ+DrRQSANoH1w0QbuJuqq
	rfzDn4jC+H0OXQwz+hPyIv9XIJSmslHEF1696h4ZELLqP+ztywUl659Zah4cecWv
	YC9Ml6KwYf888WOMOgHxJNqYuNdsDXmwCl8F330rweeW6tgHeXJEqFtqdyzyvMXE
	0gmAIY8XfpjbqTpNcArdmQ==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022122.outbound.protection.outlook.com [40.107.209.122])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gga25t7xd-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c7YzQnJ7ht5Rgydyev4cwWyBQpMk5wVr6O4UbKCworklgW+GbwGGZoI7N7hhMAqF+NyNoBQC8U0m/IS9+s2OqXEh2UlousnNR6xnhQhn4/+Mvyo9eMSv/QAH44kPZurrzh9qBdnFJkMZ4nnJ9P1QmjD2Ko9/cbHly1chl0OTHKH1h0+xBM/KDT5uDbI2xEgpSi1Z2XaWkAaq8hx1vIAqS/Fqq0ePx/0wurJtjc1QxMQgNUI5njSVGScMRIQMkzZBVH3fBcprq72t8GIBU/BrmsZmIc8ckk6GFY5H4uD16meU3iJj1KIHh4qSU+g1C57IhLJNEtGT7scaO4hEWXSm7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/Yxl5bTh5ASQdEY8ABZ12EiT0AkXhfaw/U2XegZRng=;
 b=jeeNl7nC95rTMhWwaD3gQYyf39YlxrkMSFfgjkTLP1NizCwNRdJM+Dir63tBLGng2kFMshHezxsyVgZbxn8XMGASqMpTCxy3w3kYxVj1pNOPVrHAzSrzhNtPq0suFvUxAw1kRXd/7hmo3rlvQwHiKPRgsI7Hhki0zhQ/1ZI/nw+zNTO5Lk7Oc3cnY0kq85kanwbX0c+hWr7N4m/giGhYYZgISTnyrbLnAQ+PJ2jjHgZAqxtEj0Bnt0wcRIv2nBow+MsAAe4fi3K8b1Bs6klkjeij4uWfTpRx4Y5DP/0u2AmhdgICHlRcJ9HM9CANOjKw7k+uDyhbXsfn0fTrIJf65g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW6PR11MB8410.namprd11.prod.outlook.com (2603:10b6:303:249::17)
 by CH3PR11MB7179.namprd11.prod.outlook.com (2603:10b6:610:142::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.14; Mon, 7 Sep
 2026 10:21:39 +0000
Received: from MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578]) by MW6PR11MB8410.namprd11.prod.outlook.com
 ([fe80::cb25:91f6:670d:3578%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 10:21:39 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com
Subject: [meta-oe][wrynose][PATCH 1/4] thrift: fix CVE-2026-55969
Date: Mon,  7 Sep 2026 15:51:04 +0530
Message-Id: <20260907102107.4007371-2-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
References: <20260907102107.4007371-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0130.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::7) To SJ2PR11MB8402.namprd11.prod.outlook.com
 (2603:10b6:a03:545::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR11MB8410:EE_|CH3PR11MB7179:EE_
X-MS-Office365-Filtering-Correlation-Id: 861a1f24-9c41-4665-d61a-08df0cc9cd7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|23010399003|13003099007|38350700014|6133799003|3023799007|10067099003|56012099006|11063799006|20052099010|22082099003|18002099003|12006099003;
X-Microsoft-Antispam-Message-Info: 
	OzpO+99/AKIekVGwJXqDs9RWVSxsEc1oFdnYK/LB4w7AQAJ9CPOSDfee1mQx4KrY1WqeB+NJqG9c7J4L1/r/eRvm1/eHP6FI2PVeIKcplWJMt3JdCsRR+ny5MTm2qqaFaDhUqwOifI8ZObcMJjoPduQD9a4t7/8jCyKV64Wpwk6FT7KJp6eGy1Sj0UScjs2+hmODZO02i5E7E2TGugUCocjZ8FeABTuUs9xK8HN9AdZFtvaoIO19To7d52D85DpvYcwSdWNXA/AXVfE0+SxJ1pxa6nd2gO2WRFERZAl363KJCAcHpdMIBaABviefO0HljbQPpLPyyR+Jijz7geZkCY7KSR6Je780gBejWEbD0ePl2uLfpilijPYG+HtD4iuJunqWu3UF1FycG1ecAj6f9v21fABs/7RT3+PyaB5a1RKEROSmQagGzP+V+c+8ACOWil7zeQt5jIyKV2TT6WBDnBH02eBAqDPfjBMTXRllK83sXDNCWxqzeMD03GbTLNGkq4kODpsyDfMoTl+X+Jj92BDleLKRAg5Ew9zcVHltwQDOG77UeqIRE0mVbAi8Wcgn2/3POCu/fSi26LRfL7Xx2PFlk7TuCutojAorI3tDL64uhVKfxiiWXfJHtnXctuh4iRK+4aH6f3H4aNA24jEtdlZ09qcu3zxH/UTSj5mErpoonBds0iWQCWyEzM3Z7g3bHZZX2mNXcsPP6Nohed8woqGKnUZfkY/oU7v6BxrPeAM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW6PR11MB8410.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(23010399003)(13003099007)(38350700014)(6133799003)(3023799007)(10067099003)(56012099006)(11063799006)(20052099010)(22082099003)(18002099003)(12006099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V50XsyM1lhiXPiWMZ4gsuI9TsUOph4yj+iAaiLZUCjWgyRscjCcBn++cm3Ko?=
 =?us-ascii?Q?M2ljhw1zyAeu2J4LWVAIpC5cnwVhltBblJUfdZ13/YdTbLzxSVo6vvwsIxS+?=
 =?us-ascii?Q?NRhlcv3N0Q0SRhhmwX+8hAY0xWzlXbEjAZ3DObGbhRVJtgyogNBVNSLXXiEq?=
 =?us-ascii?Q?RKJxABMWNFNPIbPc+j8gi8iaqWLp8WRZsh728ryTjeYKbhI0ZCHxMYbAe5kS?=
 =?us-ascii?Q?iAMfjXudP/ZV2flJ5RH1W1tPFTwvFxsZvIu4uYb0btfYiwlz1d4LzDWFV/WI?=
 =?us-ascii?Q?g2vKp4P+xovKTlJwCawy0xonlR24XAE+1K3hi+Y+s5cFSa9mfxxGpfFmEL6R?=
 =?us-ascii?Q?ggb5QQXG0Yj9u7HfzJEgpYClBqY9u4Zhq/4l1TFshguzpugC2BJO/E0tJIGe?=
 =?us-ascii?Q?ihAqOMbu8lxS76FRMg/BfLrzsnzT9CCw6IgHavZHfqRqogHL52q7FnOl2xOG?=
 =?us-ascii?Q?IvysuWQHOqSDlOVC72sEqgxJ7JKgUyozO24rEVTVQ7ZT3qUnIQOkC3Q2cAcz?=
 =?us-ascii?Q?wWR0VTr9wGA35vorc2x42HoJaTG2UbELfyhjtsdM94c9WV0M/eErpyGPRgYo?=
 =?us-ascii?Q?ixv8QVd9MWh8PoctTLqKONtgSt4XOLzFHL84eIzRySZxEfgNTx0ZiR27YHiX?=
 =?us-ascii?Q?VDhBL2d5eS19qKwZRTNLS+sZAw/8J8OInGrtGCIEZ3u+bcEhtUEG7j7robip?=
 =?us-ascii?Q?qEtVCMd84rBX+KWMhUu9ivWIyljUHWJZSSJZ+7xhknsF/bmTvMz4lEdVpjoH?=
 =?us-ascii?Q?NkjceQs4pDvoDX9wJaG/SrrGYG6H9t+RhPbBpgaLlXWZzni7s8MIBLng8zF1?=
 =?us-ascii?Q?SGs8SuOOQ8lTccRAYGA3r8ZRLmzUQRu5XIXhpWZTUjKQLo3WPnCvUejE634Z?=
 =?us-ascii?Q?YefgTrSQpG6jtRMzXEYLWHjlgqRWao+pt5erdL0xIjjWejcG0jIInn/a20Cz?=
 =?us-ascii?Q?puIv4d7JPTbJc/LuTxNZVhqsS+FQtkVqR8hGn0C1o0NH9piMI7jt1ElYaFOX?=
 =?us-ascii?Q?J+8E9WFgc/+GwZETel0pvZez9yzW9ygmeSZXHclVWojdtjX5ifRnwyxxwSf4?=
 =?us-ascii?Q?Q2ChQcwA9cHea8MZszLQ2vMtX1ycutTYxBSPEAjpFQqabTaq5gRCGJaEkd1W?=
 =?us-ascii?Q?4xKjBg/2+1HqnTfYljZUJjIDM0jbx7J2EYvoxDLT/ikXnwZzhzLmhXgnxEx5?=
 =?us-ascii?Q?hH8c3qNafzHVFXG6fylWdYmfNYcUxRaD82rkFAkhP0f8FTjCCFIxIDPO4UjW?=
 =?us-ascii?Q?lIOZWmnyZkfvmQYN5RA18Ac37lnpxzwqFN6Vj482NcviOhTO0NcEIuFP8JHR?=
 =?us-ascii?Q?7v1DvAIssiCQeask18SqaVzDQkGfEGqF2fIEFNf/KoqJ14k9bP11z0DL49zA?=
 =?us-ascii?Q?hH8Zn4XmMP0PtVLeRvKXYPvZoJeMuxdAyTuCM7sIBOOVd9sj9SLIGoZZr9AS?=
 =?us-ascii?Q?B2PhBQIs29N3M+eFaaR8QDY9NjB67xCVKwAineGwCVi76Fj12M/vzSWyOd64?=
 =?us-ascii?Q?tqlG+2kPWFLy57NWZY3mi8aflusWSoehVLtqZNi4XcWRsO16m3cjaLw7LqmV?=
 =?us-ascii?Q?5eM2/0esppXWb/W8joy8/wFl35xmMSKikfvm3uVbmmNYslaTP1Nk+NyvANKM?=
 =?us-ascii?Q?9gr8SMxCYxLU/yrq6xs1WwpD8aVMzuKChU4Rt2cXtjq6fh0++T2WS9p0c1iv?=
 =?us-ascii?Q?wWmV5glOG6DIHOGURM3yD93FZ6td2tyHDViUD6F7KyADvtlwPeQbfgxjD5/8?=
 =?us-ascii?Q?0jBoRYjlDe29uxECzfWYm3AL0XacqmXUqdhNXI2jjepyEiORI5u+?=
X-Exchange-RoutingPolicyChecked: 
	e7lCgU93ZHuFQczMdRAJOKNwlP710ciBl5c2ND8+EH38SL2rRMQJiUKaa/O2yQ8aXF22QQpjd9Z5/DNKDWxwwtoRVk+ZGdo/XJLjeiOyoKAjliS2y0dbbaWwRsnkhKEEnAG5o9cJH1nj6I5AK0JLhmPpEYyf4F2Hn7EDpMMoAHjv3TnfWLcvZUgH9V7/EtplxWwQ111VsUk7ccuQC4ZXpYUmXcvMLiMMR+MYZA1qU8Z0wnFPSbFO0SnRdeMvIYd0wKVhKWbiale8ZcyaSp8tk/DpxBbV5vLi61e8H9+f3fexho9TZWuDDkNgpAE0oQQSRlAdw239Rb3rCqTy+HG2rA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861a1f24-9c41-4665-d61a-08df0cc9cd7e
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8402.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 10:21:39.4479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D2DO4sAwFfYHpqMLT8ywvByy9CNubbd2UBKRZH75v62Cu6PQB831X9dkuiD/rXF9DmrYK0cu9/oFHrqSQ3rHWCYgiGOpInSgU7VSKd8SbZniXOssDGcACi2PGzfwyVnS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7179
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a9e9035 cx=c_pps
 a=Ms9fQC66fVli3+vYcCKl2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=PYnjg3YJAAAA:8
 a=NEAV23lmAAAA:8 a=mV9VRH-2AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=0U6tx8ruAZu_xXCQbYQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6h_lffvfpy8vs-1djSDw56YcwpVgvyWq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfX4sELVnIP9a9X
 cl6prw8QPAclZf2xMxOubxqP7at6HU+YSp/7TYsohKWAEKtBD0HpyEvLJSsNc/3XgU18JBFUa+U
 Qc3NY/5Bk7ry00BKWQOmvjiY6VpHUXaDCCT+WilS8QgKEhZS81OKf8F/VZfodCcN1ABxefPWJ22
 7Cg0ySFLPyTSwOBu5mz1eGeusLYPUsDqhWt/7mF/3ms/mpgCuBkxJfbN98RBukFtaQxm5YtveTR
 vpGYjQjcKvGAS20iQxtGwZqOxE7Cotx61Z6BH/rMRruOJw+Nw3FJw30DN+qTWMB6IbYf3UpEL6b
 SsZ46nC4CpvnRWkXPTTkXWO8/rHvfFLoxCjnFcV92r9us57h8yRRuSBFmcoKQ+z72xRDd9+Nk7n
 C6JHjc7dZIKDlXwrZ9UC4+qJCo7mgceDybzfjdrUr3Wmj6GVtTvQywwRjE7U6NEjCqBHeYweSsM
 nwIjwccMUZmtzEsMJEA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMSBTYWx0ZWRfXz0GyS866OGkM
 Fnh8zKkqVJ3/E0oseyaZmzcLwR3VddMR/IlXe9S2CL+4LrT5Kp6ruCGn6uu8e97AcMaxpT5fSsh
 xBp/lQC9pgS1nMvMol2/Di8+QsO/X/ESiQAkElz85gwo/A8xN+40
X-Proofpoint-GUID: 6h_lffvfpy8vs-1djSDw56YcwpVgvyWq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 10:21:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129808

Integer Overflow or Wraparound vulnerability in Apache Thrift C++,
c_glib, Go, netstd, Delphi and Haxe bindings. This issue affects Apache
Thrift: before 0.24.0.

Backport patch to fix CVE-2026-55969.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-55969]

Upstream Patch:
[https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368beceaac2d0a]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../thrift/thrift/CVE-2026-55969.patch        | 292 ++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |   1 +
 2 files changed, 293 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
new file mode 100644
index 0000000000..a7fe218432
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-55969.patch
@@ -0,0 +1,292 @@
+From fa23b5c1c92f2df60c700935dd57295924bc2999 Mon Sep 17 00:00:00 2001
+From: dxbjavid <dxbjavid@gmail.com>
+Date: Tue, 9 Jun 2026 16:35:58 +0530
+Subject: [PATCH] Widen multiplication operands in container size prechecks to
+
+ prevent arithmetic overflow on LLP64 platforms Client: cpp,c_glib Patch:
+ Javid Khan
+
+CVE: CVE-2026-55969
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/983c813c9a1a2302d9a3ae23d7368beceaac2d0a]
+Signed-off-by: Abhishek Bachiphale <abhishek.bachiphale@windriver.com>
+
+This closes #3590
+---
+ .../c_glib/protocol/thrift_binary_protocol.c  | 10 ++--
+ .../c_glib/protocol/thrift_compact_protocol.c | 10 ++--
+ .../c_glib/transport/thrift_transport.c       |  2 +-
+ .../c_glib/transport/thrift_transport.h       |  2 +-
+ lib/cpp/src/thrift/protocol/TBinaryProtocol.h |  6 +--
+ .../src/thrift/protocol/TCompactProtocol.h    |  6 +--
+ lib/cpp/src/thrift/protocol/TJSONProtocol.h   |  6 +--
+ lib/cpp/src/thrift/protocol/TProtocol.h       |  6 +--
+ lib/cpp/src/thrift/transport/TTransport.h     |  3 +-
+ lib/cpp/test/ThrifttReadCheckTests.cpp        | 48 +++++++++++++++++++
+ 10 files changed, 74 insertions(+), 25 deletions(-)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+index 9e80e10..c3b00b0 100644
+--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_binary_protocol.c
+@@ -561,9 +561,9 @@ thrift_binary_protocol_read_map_begin (ThriftProtocol *protocol,
+     return -1;
+   }
+ 
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport), 
+-                                    sizei * thrift_binary_protocol_get_min_serialized_size(protocol, k, error) + 
+-                                    sizei * thrift_binary_protocol_get_min_serialized_size(protocol, v, error),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
++                                    (gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, k, error) +
++                                    (gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, v, error),
+                                     error))
+   {
+     return -1;
+@@ -618,8 +618,8 @@ thrift_binary_protocol_read_list_begin (ThriftProtocol *protocol,
+     return -1;
+   }
+ 
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport), 
+-                                    (sizei * thrift_binary_protocol_get_min_serialized_size(protocol, e, error)),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT(tp->transport),
++                                    ((gint64) sizei * thrift_binary_protocol_get_min_serialized_size(protocol, e, error)),
+                                     error))
+   {
+     return -1;
+diff --git a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
+index 0aa9a6f..f6ad36b 100644
+--- a/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
++++ b/lib/c_glib/src/thrift/c_glib/protocol/thrift_compact_protocol.c
+@@ -1108,9 +1108,9 @@ thrift_compact_protocol_read_map_begin (ThriftProtocol *protocol,
+     return -1;
+   }
+ 
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport), 
+-                                    msize * thrift_protocol_get_min_serialized_size (protocol, *key_type, error) + 
+-                                    msize * thrift_protocol_get_min_serialized_size (protocol, *value_type, error),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
++                                    (gint64) msize * thrift_protocol_get_min_serialized_size (protocol, *key_type, error) +
++                                    (gint64) msize * thrift_protocol_get_min_serialized_size (protocol, *value_type, error),
+                                     error))
+   {
+     return -1;
+@@ -1183,8 +1183,8 @@ thrift_compact_protocol_read_list_begin (ThriftProtocol *protocol,
+   *element_type = ret;
+   *size = (guint32) lsize;
+ 
+-  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport), 
+-                                    (lsize * thrift_protocol_get_min_serialized_size (protocol, *element_type, error)),
++  if(!ttc->checkReadBytesAvailable (THRIFT_TRANSPORT (tp->transport),
++                                    ((gint64) lsize * thrift_protocol_get_min_serialized_size (protocol, *element_type, error)),
+                                     error))
+   {
+     return -1;
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
+index 9d3f25e..7e18f71 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.c
+@@ -160,7 +160,7 @@ thrift_transport_updateKnownMessageSize(ThriftTransport *transport, glong size,
+ }
+ 
+ gboolean
+-thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, glong numBytes, GError **error)
++thrift_transport_checkReadBytesAvailable(ThriftTransport *transport, gint64 numBytes, GError **error)
+ {
+   gboolean boolean = TRUE;
+   ThriftTransport *tt = THRIFT_TRANSPORT (transport);
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
+index 83fb5da..01365ba 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_transport.h
+@@ -83,7 +83,7 @@ struct _ThriftTransportClass
+   gint32 (*read_all) (ThriftTransport *transport, gpointer buf,
+                       guint32 len, GError **error);
+   gboolean (*updateKnownMessageSize) (ThriftTransport *transport, glong size, GError **error);
+-  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, glong numBytes, GError **error);
++  gboolean (*checkReadBytesAvailable) (ThriftTransport *transport, gint64 numBytes, GError **error);
+   gboolean (*resetConsumedMessageSize) (ThriftTransport *transport, glong newSize, GError **error);
+   gboolean (*countConsumedMessageBytes) (ThriftTransport *transport, glong numBytes, GError **error);
+ };
+diff --git a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h b/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
+index cba6e69..1a7410c 100644
+--- a/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TBinaryProtocol.h
+@@ -174,18 +174,18 @@ public:
+ 
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
+   }
+ 
+ protected:
+diff --git a/lib/cpp/src/thrift/protocol/TCompactProtocol.h b/lib/cpp/src/thrift/protocol/TCompactProtocol.h
+index c7d81ee..97ca460 100644
+--- a/lib/cpp/src/thrift/protocol/TCompactProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TCompactProtocol.h
+@@ -146,18 +146,18 @@ public:
+ 
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
+   }
+ 
+   /**
+diff --git a/lib/cpp/src/thrift/protocol/TJSONProtocol.h b/lib/cpp/src/thrift/protocol/TJSONProtocol.h
+index 09eb6ea..265b339 100644
+--- a/lib/cpp/src/thrift/protocol/TJSONProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TJSONProtocol.h
+@@ -253,18 +253,18 @@ public:
+ 
+   void checkReadBytesAvailable(TSet& set) override
+   {
+-      trans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TList& list) override
+   {
+-      trans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
+   }
+ 
+   void checkReadBytesAvailable(TMap& map) override
+   {
+       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
+-      trans_->checkReadBytesAvailable(map.size_ * elmSize);
++      trans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
+   }
+ 
+   class LookaheadReader {
+diff --git a/lib/cpp/src/thrift/protocol/TProtocol.h b/lib/cpp/src/thrift/protocol/TProtocol.h
+index 37b0db7..4eedc5e 100644
+--- a/lib/cpp/src/thrift/protocol/TProtocol.h
++++ b/lib/cpp/src/thrift/protocol/TProtocol.h
+@@ -604,18 +604,18 @@ protected:
+ 
+   virtual void checkReadBytesAvailable(TSet& set)
+   {
+-      ptrans_->checkReadBytesAvailable(set.size_ * getMinSerializedSize(set.elemType_));
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(set.size_) * getMinSerializedSize(set.elemType_));
+   }
+ 
+   virtual void checkReadBytesAvailable(TList& list)
+   {
+-      ptrans_->checkReadBytesAvailable(list.size_ * getMinSerializedSize(list.elemType_));
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(list.size_) * getMinSerializedSize(list.elemType_));
+   }
+ 
+   virtual void checkReadBytesAvailable(TMap& map)
+   {
+       int elmSize = getMinSerializedSize(map.keyType_) + getMinSerializedSize(map.valueType_);
+-      ptrans_->checkReadBytesAvailable(map.size_ * elmSize);
++      ptrans_->checkReadBytesAvailable(static_cast<int64_t>(map.size_) * elmSize);
+   }
+ 
+   std::shared_ptr<TTransport> ptrans_;
+diff --git a/lib/cpp/src/thrift/transport/TTransport.h b/lib/cpp/src/thrift/transport/TTransport.h
+index 52b3a0a..1269593 100644
+--- a/lib/cpp/src/thrift/transport/TTransport.h
++++ b/lib/cpp/src/thrift/transport/TTransport.h
+@@ -23,6 +23,7 @@
+ #include <thrift/Thrift.h>
+ #include <thrift/TConfiguration.h>
+ #include <thrift/transport/TTransportException.h>
++#include <cstdint>
+ #include <memory>
+ #include <string>
+ 
+@@ -272,7 +273,7 @@ public:
+    *
+    * @param numBytes  numBytes bytes of data
+    */
+-  void checkReadBytesAvailable(long int numBytes)
++  void checkReadBytesAvailable(int64_t numBytes)
+   {
+     if (remainingMessageSize_ < numBytes)
+       throw TTransportException(TTransportException::END_OF_FILE, "MaxMessageSize reached");
+diff --git a/lib/cpp/test/ThrifttReadCheckTests.cpp b/lib/cpp/test/ThrifttReadCheckTests.cpp
+index 2a92160..1370d84 100644
+--- a/lib/cpp/test/ThrifttReadCheckTests.cpp
++++ b/lib/cpp/test/ThrifttReadCheckTests.cpp
+@@ -243,6 +243,54 @@ BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_read_check_pass) {
+   BOOST_CHECK_NO_THROW(protocol->readString(eleven));
+ }
+ 
++BOOST_AUTO_TEST_CASE(test_tthriftbinaryprotocol_container_size_overflow) {
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TBinaryProtocol> protocol(new TBinaryProtocol(transport));
++
++  uint32_t val = 0;
++  TType elemType = apache::thrift::protocol::T_STOP;
++  // 0x40000000 elements of min size 4 require 4 GiB; the product wraps to 0 in
++  // 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_I32, 0x40000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
++  protocol->readListEnd();
++}
++
++BOOST_AUTO_TEST_CASE(test_tthriftcompactprotocol_container_size_overflow) {
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TCompactProtocol> protocol(new TCompactProtocol(transport));
++
++  uint32_t val = 0;
++  TType elemType = apache::thrift::protocol::T_STOP;
++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product wraps
++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_UUID, 0x10000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
++  protocol->readListEnd();
++}
++
++BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_container_size_overflow) {
++  std::shared_ptr<TConfiguration> config (new TConfiguration(1024));
++  std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
++  std::shared_ptr<TJSONProtocol> protocol(new TJSONProtocol(transport));
++
++  uint32_t val = 0;
++  TType elemType = apache::thrift::protocol::T_STOP;
++  // 0x10000000 elements of min size 16 (UUID) require 4 GiB; the product wraps
++  // to 0 in 32-bit math and used to slip past the MaxMessageSize check.
++  TList list(T_UUID, 0x10000000);
++  protocol->writeListBegin(list.elemType_, list.size_);
++  protocol->writeListEnd();
++  BOOST_CHECK_THROW(protocol->readListBegin(elemType, val), TTransportException);
++  protocol->readListEnd();
++}
++
+ BOOST_AUTO_TEST_CASE(test_tthriftjsonprotocol_read_check_exception) {
+   std::shared_ptr<TConfiguration> config (new TConfiguration(MAX_MESSAGE_SIZE));
+   std::shared_ptr<TMemoryBuffer> transport(new TMemoryBuffer(config));
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
index 949ffc3e70..45eaea5c0e 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -18,6 +18,7 @@ SRC_URI = "https://downloads.apache.org/${BPN}/${PV}/${BP}.tar.gz \
            file://CVE-2026-48144.patch \
            file://CVE-2026-58389.patch \
            file://CVE-2026-58662.patch \
+           file://CVE-2026-55969.patch \
            "
 SRC_URI[sha256sum] = "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59dc64a00df8a1e5"
 
-- 
2.40.0


