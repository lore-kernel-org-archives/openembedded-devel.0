Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9145ECAC598
	for <webhook@archiver.kernel.org>; Wed, 17 Sep 2025 05:48:50 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.15783.1758088129461095195
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 22:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=P/2iuw/W;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1355ed9a86=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58H49aMP3694537
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=mNnNpXV+bSCrav/VRTCR
	1686wSOctrwJXn3XeLBKPvc=; b=P/2iuw/WuDALtROMtvicP0WI9BD9GwQtFM7w
	CWCdFDKodFG2xwFMQfvtZB80S/gbtJcwCX4jj+91xbfTVBCuOzUY54m7BbST/04h
	fCJH8elKJB3LL7XSV4NTHQ2eEAHzqVxIDZfbOMvmGAZFi/d4g2fdwryEKIsp8xW1
	MzT35dp3VbDo+KyTdNkdVqHyV8yfaA71j14lkzuOlBWmbxDoZBj3r8lnOkL9gH4A
	V4+mjoDX4OtyXTi3P4IvKZ6b+qdj8J2Bv7m0X4BhBSZkf1B8LBNVNRcr8uo9YJL5
	vu4rXEdDWYONumw4ZVp+EsoZIzosHkRzP9kTv/cYVUF0dtD2AQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011004.outbound.protection.outlook.com [40.93.194.4])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 497fwsr93x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:48:47 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlAnIb3x3GWnJkTx52toVEkAE/XZAf8R7yiV/d97FpuCljue1eLEtyZ7mDkYfPEySBBzC0RfRLjAH29rpSTFx2eH3FyiN9tNzm39wGHPNLPTjoJvM7aY3xsW8SM1PrBJalaBgjoDA0Ho9k9k6tPqHmKdQC5d3GTbndnXUedKNFRJ9aLYT6pJ3rLwh8/9+kncDzCEJsMmG07ry+vXvOwu8MsnQW6erCNSOLvq+XYkdRDmzNE5Fq6KEXvIlMjEi8bJRFMvdb0a2Q6/Gm2RSjC7efZLeradA44E7NdCSAbKerSvB1QejWcJZH5RsP+PdtDNTFBAdT2Cf8C47Qn/ZCNyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNnNpXV+bSCrav/VRTCR1686wSOctrwJXn3XeLBKPvc=;
 b=YGh1K+Sf1hjo+rX+z05yxSC60l/5frQUf/3r58dzcj5Lr1tw9bPO/5mCpkiMIh5ABc8oSxkUzNA+WUHx9SC9Q9+P7RlzTyFmK2Xz1TEFQ7x/e2dAmYYwCrA2K+EpkcjHsTAUoEC0dhbjXBDTdx4dUT/dbCC9flEhsOxt9YsEUpAfQIm/Fo6CofjXA86OxOX9PKpc/Zq7pnNrZHa88MTNBnZ7GvtcWZ11xUXoN9SljIC1LuRS+MUpclipseL238Cr3JHxaGBJ0UxxiiFQ9P69VoihdiPmg6e44o9XspHJoxtqG8k8qZixiAXjjHKrH5CZJlYGcv1q72w3vIeZ99D0sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA3PR11MB7485.namprd11.prod.outlook.com (2603:10b6:806:31c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.13; Wed, 17 Sep
 2025 05:48:41 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9137.012; Wed, 17 Sep 2025
 05:48:41 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] iperf3: fix CVE-2025-54350
Date: Wed, 17 Sep 2025 13:48:31 +0800
Message-ID: <20250917054831.2884291-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0313.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::8) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA3PR11MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: 19192dff-93ac-4111-54fa-08ddf5addb46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oUI57EOy0hlK5UgQWhKCM2SuVFtMmHBhIZybGu4QMEls5+MPwoMNY8SXtMY+?=
 =?us-ascii?Q?0hlNk7oT7GW9mHGXHD1VE5vjax1eGVvtQp77oRKS2d6T7NzFgmrBQvcJRv2q?=
 =?us-ascii?Q?IXH61ctVkhxMV2tx08vujLWKViOsyhclQjycaTpCYnK/ymPlE4gZ4+xsqLqM?=
 =?us-ascii?Q?/Goq3MiqZQcQV5HHjRuD+KujBA+3FTZM8NwBX1K8BhdZd4W/M2uz+7MhTKxS?=
 =?us-ascii?Q?Q736NuomRalzXmnHY9zL9j9YsGFnfTfKTa91Bmn51Z/Y22dULgvvjrNuqn+F?=
 =?us-ascii?Q?ME1IIBeLtK8WIbcNNXTAHADk2VexT0c4L/YkTA1gFLM8cXAZVCKSql+w8ZOx?=
 =?us-ascii?Q?Cq4uxy6haCLh9b8JOufMNx15xF1u+/Ur/sapLDHEqBeflUTcxll9tdJAPFN7?=
 =?us-ascii?Q?5ijBroZI/1FRJ6z1514UzYxkurVFOEyhg6vNwe6tGbmt7b5SDPcMEGR/k+r+?=
 =?us-ascii?Q?IcqC+baWlTCgIvoAYmciosOh3Sccom1KgUpF7vb5y2hJfn5ItBwtmHQA9Xzz?=
 =?us-ascii?Q?8zdFPor/UFeaZYu5c1tLm2Z8DJpqLYLzqBMRD7zhghEoaEkWnlMhOoxGL1yX?=
 =?us-ascii?Q?hXNWbcqS4EYEyfPscfpHwESnds0SEVeaiPe8KkNo6fhlSyrYF1nA2ELuQoL8?=
 =?us-ascii?Q?2fcPeFrcACAiX6Q2+P9WizM0nsKwKhhtgpyjMHiUaqAvp+HuSwomyVTtjpZR?=
 =?us-ascii?Q?94bHFzOQFn5SqksDmw15ptGLvT8ZY9UHM5yTB5zXN0wDms367n6ER1pUTKlT?=
 =?us-ascii?Q?PdeapOvZo8VPcOjSKEj6XGYsgp6dwhustbzEtdLBWLGKdQUH11mcH0+YPora?=
 =?us-ascii?Q?UJBymg0kmWG+ckkLU5+/I3QdsoIPvmPYM8r7fp2kBx1T64K/RHz6MkUw/zZP?=
 =?us-ascii?Q?lGSsHSQEd+rBkEfwOkAXSQ6NHZ21hi0hVQrIqq/UyCMMKkDFXPJBiBZ08Y4e?=
 =?us-ascii?Q?pcO9eMioOHsymAEirw76JHMKHkU1gCGQAKtsskfa+Y6rKP5TBlacHqYd8++2?=
 =?us-ascii?Q?x5FGTlO6eTkOC0o6aW18J0mrLeOlAB5Nlmz8yFcEq2dCaiyB1/4bKirga70p?=
 =?us-ascii?Q?/YzBViXP+b2IB8uUdaT54xymaTh4/gTpGl6JY2/5G3pxqLAygnIL1PiNsE0B?=
 =?us-ascii?Q?ztKtQPk57Wi9VJdFQs1iKlzKGkxxpfDS8lEnEDqOOT1fMKoC7mdsVKASoSLo?=
 =?us-ascii?Q?ytaV/YwA060EXLqoWORwUSRjjC8GqXTpv/z0vKxvJF3l1kiJJIXrpDFwJvfR?=
 =?us-ascii?Q?N5GYUPdbE0skN3uycr1ZHym0ntl1OhxJ0qeF8XxnfGa0w5qnHVVN2KDpOTQC?=
 =?us-ascii?Q?itiGZWFEAPvwftGOC2SaesrehyAQ61ZmCg/P1Yb+7eZUBmwWGjld8QHNOiNf?=
 =?us-ascii?Q?eVe+/eUKbqD46nuCai7Zd+DrycJ6Q9607M/CTvw+jzNuaTSz4t+HU84HobBq?=
 =?us-ascii?Q?nfNYg/GJRg2ls6h4jvh4NxrdjG1mGzfaMcDH22/sdp+tdBPQufVtNUWwfrB/?=
 =?us-ascii?Q?Tbn0a43PHAknsrc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?G5Qezi2Mx4y6nJJcdnW7eWVFqoVsWRxg+HZVU0BOHgPbiCSF7JVe9pitUMIB?=
 =?us-ascii?Q?YjQteDHjbPeEJ0mRFirpYTGv7JbN6jwroyo7xclfJi9juli7eiG+vlugBC7p?=
 =?us-ascii?Q?p33yeXZuZRLLLxCzgksMlTtpbfHWLqsQMzgOjnfe2niuT3/F9gwHEer3nsRL?=
 =?us-ascii?Q?P1Hn62XigRqKvvXMb16UbOvGz+2Pl/pDxSDqQ2RWCdaasdIWJ+z0JY5yZJZN?=
 =?us-ascii?Q?zAgclVZTBQOgkQd30OzQzhyybAzcnPgLA+mqlhiF91Y1S1Zw6DK8NRj8CQbH?=
 =?us-ascii?Q?oQSWzyoQR+ReNEJPvE98exAzpWPT1V6Pmtf2ZhQVt9FDPxp90Dt9lV/VZcoI?=
 =?us-ascii?Q?h46pDKn6Jeb2SMJtITUQrgFspmQNGq08V6mxRF2PZy8mqgeBoNF2jt0eiP/E?=
 =?us-ascii?Q?uJcwRw5HETUHqitgRZnpbt9FKU88Qz5mwv6h0wBQHyfl7v4ZsihdRLhnhju+?=
 =?us-ascii?Q?BHlCz4BWv+/M7bnF0PxuZ9V+BYMoCn/1/SBxbRElFr7LceFuvjeTH2GZypmJ?=
 =?us-ascii?Q?KJuiqbtXAig19ZkH5HZ51EsswOxQfURPEr0327LecW7EkZm8D2ftSYR/tfNx?=
 =?us-ascii?Q?CKx/dHDildcyeZqrb1GFJ7+AFbTvqArNPYySDoghfSfLGieM0XeYydThr8s/?=
 =?us-ascii?Q?fuKwtvNFkXzjlU9e+ccvDtBvT6FCN0zbBc0fTQRhtf1vAgoDPQ1AJzvg9xtW?=
 =?us-ascii?Q?/DvNbtRyaNucSC2rAFUZJVCyqMtHCzrh5DwiJUIwbYcf1H1y8OW0W8L9Zmv6?=
 =?us-ascii?Q?cV1JyPPnFPjwEOOoVHqwkny6oDAlOux4vRKmYfDByBaGXSj87tJ33rhkJVEP?=
 =?us-ascii?Q?Ry1fD84O0KYWyP4nRcTRTlitjZ0TU9OfWQ5FzSjSO8EOza4KoI+xgJaHUfSc?=
 =?us-ascii?Q?1c07mYavo+L3JWYiRSbEutdyFNguRapuAHXS6aogPKKmGnPT0wfvQ/HXgqqq?=
 =?us-ascii?Q?SLvCvVO3yQAHi4p3zHUwhEV+EE4HLiPkjjDYuWIaWe0WQdCtk0bVuqzylQ4z?=
 =?us-ascii?Q?npQdH0g5G4AU8Ub+ZfRZcpHGck1V7PShpKn/B2zi7JxVJTH1ir5DyHYZr300?=
 =?us-ascii?Q?LQp1TDqKGuKYMtqoIkSpH7lmZCTNuN4YZ3BbstqkOSXlKnrqnXqkR0Ypx9+h?=
 =?us-ascii?Q?4ajxlFOWMkI7jj+mZmOBet4BEvpDmeFb7IofqpeFl+Wj50+LQd4zip8YRW05?=
 =?us-ascii?Q?aLSprsjk+AdtshVSL/8KsPpznz1MSsIJ9TsUSeimtnoI6oD7HjnW//zOVmpn?=
 =?us-ascii?Q?otLcu6B8uIblBhw/EHHX10mfxmw9um9WWSIwOD6XBsFYqZ0863olpUXz/wf+?=
 =?us-ascii?Q?LkYX0EoFz44UmkW9OfVW/FW/RQXdnxyd2yxZkGORe5YbyWt1EpN2eN0AXB78?=
 =?us-ascii?Q?9Cv9+nYa2rXZdkI/tikCd+QzlZW7ezMcBizOnX71Rm5ERIfRhSMun5rTzuPf?=
 =?us-ascii?Q?ss9FgcDZmkgGEyRk5ZWrNh/YKUY2jYMS15HW0y9sS+B/hVhfJcvCfHBOHPxm?=
 =?us-ascii?Q?CzaWU/LZu+GxNBt7fpIjyJoI7tSS6R3Pz21XnY97XZmvZjwnzga6J0tnrwi5?=
 =?us-ascii?Q?7XBDzhj0T+n7NSZPViK6RhjAwoFitoNGrVAuTIEc5GZNUh623hYJZ15ac0Da?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19192dff-93ac-4111-54fa-08ddf5addb46
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 05:48:41.5606
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BWtPbDeEbBKV8ThfkikdRhW4dCGYR5fpiPb0BjXAUccyigGCTnygML1kxrwfJ6ZKOeD+X29lBpC8Ymf6aUQL6Y2DjZDDo89R5vDlBwVSv7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7485
X-Proofpoint-GUID: DHEG7Osfw0ztZo5YPeGd2BErZCGlGhdg
X-Proofpoint-ORIG-GUID: DHEG7Osfw0ztZo5YPeGd2BErZCGlGhdg
X-Authority-Analysis: v=2.4 cv=C5zpyRP+ c=1 sm=1 tr=0 ts=68ca4bc0 cx=c_pps
 a=FYRcjPsbj8Vbl0y3HSZiwA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=vtXoPY2jAAAA:8 a=Q5UO42KA6o_1rUlm_SEA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE3MDA1NSBTYWx0ZWRfXzQX2lKesheGo
 2x8jlu9DOIkcxw4jEU8Rp2ENHM7KAeYaj3AZT+qhpVGfsFTEVwI0a8i2BqN340uhE2Iwuo1IXGq
 /WeW/2boS2QI007FJYWYndRlz7ILSVxwEBMxdMODelBsyR9m+R1qRIaL1f57zeSrOn2LKqa0Qjz
 hDmS+lYL8MOGMtkQgx1kuMKcDPUlO3kYzObwjiBIboe+XcELNb+6Whm8svZQUZPZen4bm1rHz79
 nfQMpByOhm/4zAq9bXtSCWFvgx8OlusFhCpYG2c3Vptdrdr4mtI66uLSiSZUhO7zjpvPS0Mt81x
 gVrrB9AzPJINXC0iqe2xgRdPENnjlU8/z3gf8E6x0juHz/h3O+qOEfXqLkGwB0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-16_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Sep 2025 05:48:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119478

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-54350:
In iperf before 3.19.1, iperf_auth.c has a Base64Decode assertion
failure and application exit upon a malformed authentication attempt.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-54350]

Upstream patches:
[https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../iperf3/iperf3/CVE-2025-54350.patch        | 39 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
new file mode 100644
index 0000000000..e6de0e810c
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54350.patch
@@ -0,0 +1,39 @@
+From 4cd6c8e85376a33bddd01fac143e27436d41f2b9 Mon Sep 17 00:00:00 2001
+From: "Bruce A. Mah" <bmah@es.net>
+Date: Tue, 24 Jun 2025 15:58:21 -0700
+Subject: [PATCH] Prevent crash due to assertion failures on malformed
+ authentication attempt.
+
+Reported by Han Lee (Apple Information Security)
+CVE-2025-54350
+
+CVE: CVE-2025-54350
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4eab661da0bbaac04493fa40164e928c6df7934a]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/iperf_auth.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 86b4eba..632f03d 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -28,7 +28,6 @@
+ #include "iperf_config.h"
+ 
+ #include <string.h>
+-#include <assert.h>
+ #include <time.h>
+ #include <sys/types.h>
+ /* FreeBSD needs _WITH_GETLINE to enable the getline() declaration */
+@@ -152,7 +151,6 @@ int Base64Decode(const char* b64message, unsigned char** buffer, size_t* length)
+ 
+     BIO_set_flags(bio, BIO_FLAGS_BASE64_NO_NL); //Do not use newlines to flush buffer
+     *length = BIO_read(bio, *buffer, strlen(b64message));
+-    assert(*length == decodeLen); //length should equal decodeLen, else something went horribly wrong
+     BIO_free_all(bio);
+ 
+     return (0); //success
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index e96d5f084b..7fb2c52d08 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
            file://CVE-2025-54349.patch \
+           file://CVE-2025-54350.patch \
           "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
-- 
2.50.0


