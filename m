Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51D36CA100C
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 07:49:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.7011.1756885793767686461
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Sep 2025 00:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Qd+OcTek;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=13418f7a7e=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5835Ah963495252
	for <openembedded-devel@lists.openembedded.org>; Wed, 3 Sep 2025 00:49:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=hOnrL99GYp6ye3ylQuvP
	9h6svkXEuGkHNyNoG21TQV0=; b=Qd+OcTekbY/cAng0vjmSCk7WK9tqqdRw652r
	bFxRH1SuLvm4FsJD5Q9fs89FHlyFnOu/D+IBJj6rtVuP7YDcYPG2lbzHE13iZ73N
	oEB75oJPqXva0qJyyBJ6pTJBXKZea/kAi1Mvo430vjsLe4BoIn3+Y5kQ/sgS0kyK
	GtMZv6M9i8u8Uz2s0zZv1EO2vfG6ZMryQlHZTUTlMNZls+FYNdt5DgHZHvjV1Br0
	pKncaqsFD6AGlw6erKmB4KZdFGLHw1GNzyfAXVAVOUbWwyQH/Gkg/1nlW5k9FoNT
	f2YwIOIdqk3dDdtIClmVJsIQxa6gMtx7iQRVCNaqmSljq5mSEQ==
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2040.outbound.protection.outlook.com [40.107.92.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48v0tfkgve-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 00:49:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XHG/wCSLjs1z2DZjeQmA7RC2M8wB39K148t+xgJ3YWcooRcYfWgD+4bqhAmJcbb8/ClZBKvyWh+iGyP3UP1h21QjDKx9ZUej5BBKuz5n2v0EZ18CR1fKDd4OSDZWxZKtVg81mP5d4JoP1zQ4XYH0+MauXYsllBt2A2jYAa+opz9TCVACRjeAblCWHCncJqAVqslBSfBwJ/Hgokt0lx4BZNQlokQRJkAMo0EM4NCNPBQ1hFBsryu6QENm0x5z7/Z0fvbYNmjwm3HCF3w65gaNbfvvZsogpv9q9Y/sys8prOP2i2X2B7ia83N3ow3tt+MrkwQQbehGVwlvocK3gyu/kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOnrL99GYp6ye3ylQuvP9h6svkXEuGkHNyNoG21TQV0=;
 b=NYZV9MVFKc7mJ6V0bF31nuid5QQ1RPIPyP+GslsR6mux5XbIJrMK0jDDWuCQRY+ak6GALpji1Q9mAzLFEUCAj3knqtVaNVmAdXiwHF74m+p3CKmaLCkD8iQoeRzZnNKzw4pzNRZuZ9xrhTmgCzWezhgiYsYFteFeRHiu19f4KVuMf14p/GlRA0FZJHQXr9pBUiYj56iusZy0yFrj3kpnVTIu8sSB1WPgdwSe/LRk1lgsasBSVpaYz9nl+T8yrvA888jLO18AnjB+bGEGfLs/WfASSKW7mxm6KF45eIaMw54kdoA7OSrRjo41KSO4cG6JqURdT46W6AvwZ1iRFyiyEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by PH7PR11MB6546.namprd11.prod.outlook.com (2603:10b6:510:212::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 07:49:50 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.9094.016; Wed, 3 Sep 2025
 07:49:50 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] iperf3: fix CVE-2025-54349
Date: Wed,  3 Sep 2025 15:49:36 +0800
Message-ID: <20250903074936.1126718-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::30)
 To CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|PH7PR11MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 83436c13-b251-41b2-c8c4-08ddeabe75ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Tysp6sfxN+TuurLKyAIvQl9LJfV0buTCofcDhw1R3HHeDfmRdhfIFzuinex2?=
 =?us-ascii?Q?cn31+qOJ1SwjftdG6z1a3hInR5jkvgdFubhcixWi4Z4npKqaCXwa1k+N2Y6o?=
 =?us-ascii?Q?cN4aJyvtg4QhOfcOu4ORUSqY+pwizUEdCr6hlULRhDuT5y9g1oO+cffBsr8j?=
 =?us-ascii?Q?/ZOU57hjIpE5Z6O4AWBjfGLFuMK3uA6xf5XWeSqIM2oGf7AnR5zXDrXEq/ny?=
 =?us-ascii?Q?iZ8Tx1z/qD/tD6DXppHN2xrueHAFaiSznkb286Q0ODhSB/OA4xgn+WiiPrsO?=
 =?us-ascii?Q?nZYfNJZZ6p5f4dlWf7dMe6vCG/30H59VCRX1pq0CRm/ED6M7LlYxoul14KVy?=
 =?us-ascii?Q?AeSXhtAnWXF9v4DxcMLKkvk0ni6x/lwtVvemvPduORDWjhuex1n2FTgEOC9v?=
 =?us-ascii?Q?DEjA5BBcG7KgRevKhqF7iS1lzkCqR71XCD5RD4izreuR5Z0d7/l0t7clIlAL?=
 =?us-ascii?Q?w2Zlo8C/OYMlizOmdueLRgxVsc5jfnDxRr2WXMp7N/JoQdheRk6sz1IQr8g0?=
 =?us-ascii?Q?hhkQXS78MVuHNqWnqlAwX8qbVHoX5zBZKuXlCRCI2ReFNdsqOiCevoXcVmy8?=
 =?us-ascii?Q?PG+c25vkqxXr3KwwocRmPJNuV78S2xOK9pg+kjId6vYW9auNxtVnt84BpeLl?=
 =?us-ascii?Q?a5/MV0juDeOy+jFsDXbGn4pA2irtTLhoTH4GnEyJSxS6irAFLzyMeaffGLwS?=
 =?us-ascii?Q?PZXXlvI2j0bhCAjCAbpSdC+JUx+0zb3XnulR/mBkRBmFqPuMKEBkzQJnc4oJ?=
 =?us-ascii?Q?BOsyqQPaqT6nv2tFecGl8SJR5yPIotMYvQVazgmuorburuEOPKP54vHQLPmc?=
 =?us-ascii?Q?a3O1iNqeULWbmjZvsKPAI8AV1WYIJKhnZik4C/dnLIepxjPtmewq88JA7aBc?=
 =?us-ascii?Q?LKK9kLbMDmG4W5oPdgE3jzpqU7QXHV1zICYTdsuAMrw22TcKHMyle0m5fE5O?=
 =?us-ascii?Q?V4C5pScpPC80b3+QWa7cwbsQVAC7PeIbFc7hSOj9o9Oa5I/Yj0El4DEriGJ3?=
 =?us-ascii?Q?HIBjfeyKAl3FKkKPMXrhKa9BnIEPPy+bhPf85UTMYKO6x7aBc1wL/0+e6HXE?=
 =?us-ascii?Q?OHb+UTYbJoWZgUkTCBw+8+1z5lTU2gsVlvjMw+TgVvGhMn5vGH/1aF5VifUV?=
 =?us-ascii?Q?XnntgBg44Qu66KzpaAiWgrnBRB7/Wt4FBOl+XXOK9FSPAsvtP9ayNlok8WSW?=
 =?us-ascii?Q?5sjv9QFAyfc2DKJGVe0k8mSt1SM3mmbXJ/GU7AhLEjd0NTKjPRUcjHaVm54p?=
 =?us-ascii?Q?kkMefoxDgzylHUQzKuVtBULWA6sZZ8DrBsMC7b6c60DJwvmTWgkWSFwviK2f?=
 =?us-ascii?Q?6dTn8Ej2lOExSZrkkl7hwHKit304UYEaRoMq5QZPhSPW5HqzNaPu7/sJuhYI?=
 =?us-ascii?Q?316VU8Rc3CJ3CWHFFGKFdNiVQiC1zG4t0vRWJOlvhh70T7CmG5EOjmBoxsZo?=
 =?us-ascii?Q?0D5F3yYAs6/CnOuzV9dr37tmWpJwXm36?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oB8d5Ptl7tccplzo4fFBG2jkBHp0sPTid8Ubt8ewqbZc4jk0a/LBrk22m/fC?=
 =?us-ascii?Q?VRQQF662Hm6nc4Bbu1S19IF3yZ8tL0DMhfnfOCBvFY0S5/nsqVIc31XiYBk0?=
 =?us-ascii?Q?McOtLgjKJAMABM0i9K1J23dublB5QFqFKIB9QGLkx489DjSNlqldmj9GWqtN?=
 =?us-ascii?Q?3u+NrtoqbzxCS5MvpqhxbuDudS6zB4ainLDdp+E8zZ4lbzVzIeLkPLeiZHr7?=
 =?us-ascii?Q?OTgOa3PupOQzPGrM1wwQqGs9u6Ma8ZShZfQ/J+ILaKpESC2awYSROMcHgGFp?=
 =?us-ascii?Q?nj4EMAa/+Iw5fGwWkWwxjvJIbG5Va/cuSBEdTjjSg9RzR5VnwaaHM9UQiAB/?=
 =?us-ascii?Q?9KHbvItPYksHlvq2J8yYKA5mlvdgDnvt4+YSaTIj6odk56kXFnL5Nna0F8iV?=
 =?us-ascii?Q?2jVE1zeBRDBZzKXuSccm2ojCfLS9TxPGQnastk1FgiK8tOGItwB4JK1C7Pkj?=
 =?us-ascii?Q?OMiXR16uL2K4Hmm4CLnQ0NLCBRmFYiybvchoqMIuSA2Uyz6vdNUcEo1e/1/B?=
 =?us-ascii?Q?VSaWXxPV7ITXfFupcsRlF4gCmIQWbICWna4V+G9gc3C9j7qRlFTlz3aQ8TWE?=
 =?us-ascii?Q?2vXNcuyDvpyC2FYaQ1OdLS2jKYT73RYPsPQaiJ3KtqaWYjZVXasDV07eE1iq?=
 =?us-ascii?Q?pl8qVJ+dLd6VqcOGaPs5ahusTC2fAMyrsf95CPboN5fXVHvETLNbDk/AGqLA?=
 =?us-ascii?Q?95AS4LIY82S/J9hdk4mWRmQs9hFo+oPHFyggBnE+m7y7oWdZbMKlO5GGQHfd?=
 =?us-ascii?Q?a8da3baj9Le/ClKL5ta9iSkVP5NlK+St/DO+MmC134uJlnjb5Ke5hxPtwgQa?=
 =?us-ascii?Q?q5hYPAnM3TDMby5TizfgmESGqmLvbx/lLJ7GYddkeDzEUeLa2WfPvV55XEXH?=
 =?us-ascii?Q?zvbFkxVsTWjIS/rYs0Wq0qx7pPINv7wY78GB8C7lXm+q0fLmN9GEYRetoI/h?=
 =?us-ascii?Q?DSZA8JMNN6vG176vJccSqBZ9vkJgOd5ScTRvsSlOC19RjE6PKmjpWaB7VCVa?=
 =?us-ascii?Q?LIkVlcbg71Iut9Apn46GHnI+0+AWYgLk7QeVYjMrEzQcxYIGhuo+fVa/BXpb?=
 =?us-ascii?Q?xQWNrk8d/iMDpEjgW7TrcOUzP3nbCmJPETe4+g9ZKyH77ba3drJzb2MoCjH5?=
 =?us-ascii?Q?n7+HgjnBEJbN65OchbeVMoTsDkwp/zzgGjOhxHJblwJ01I5zHkSYN1w8ol8l?=
 =?us-ascii?Q?+9tuHlIoO7OTBaW9myOYALOBRgr9jLcd6VPZ9G8wFxkxm08/WCWPIoqlx2He?=
 =?us-ascii?Q?ofqJWckr5yAQpPpRiIaNHHDFJlwjy3zqb4fEo/pWHqdUmvozq5lwhwacXw0K?=
 =?us-ascii?Q?n9Y7YowKVXwU7mI9WT1sW5JbWMyuEAdBlPRadQGVBvdv4RDYoUsehurtNUBX?=
 =?us-ascii?Q?zNzMKV2YBhKEcsI+0Xz0qUMY4GxrX0BgRTKb50RGzvwaziIbRCFnTdHrGsMO?=
 =?us-ascii?Q?3GXIYw8Clz/IjLurxm4KjNMZqgbgeRnj4fYocP954ox2TXRWLJ88bT0Uu0nN?=
 =?us-ascii?Q?kWBg1FGJog376VKjdULtY5F9/atb6FCbnRrZZS5URjmLQJeGYNJtq4lBF8TB?=
 =?us-ascii?Q?2gPlH/vsKjLiFqE8QxvXGfhvIoKPSZjpIp4kHYUesUiR/1VH7+eB4maejjmT?=
 =?us-ascii?Q?Lw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83436c13-b251-41b2-c8c4-08ddeabe75ff
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 07:49:50.3170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s34v/VbEaXdg9l/AGGaaJCb+Rj3GCW9F2uppuy74FEmjqG6tE1C9GxoDZGmNWnfGoimVD9dVmUTkrxtgXI++TZouVuqwYuLkD7OJWs1BEhk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6546
X-Proofpoint-GUID: 9ySa0vGN-w7lcy_89laDV4ZVPC1xboST
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAzMDA3NyBTYWx0ZWRfX3SlNXJBWbNQH
 KFeTsUWvKugv6HWqXGxOZjHGm8D7VqULAQq1xAuXz+KhAXDKuxKpFdhrXXmPPucCPBlBZ8ia633
 jA5A7RL+iR8ZhU2RHPqcH6mS7nZ71By4/oSBjn4tV/ed/zjY/7YqS8HhiJFk1gyHz3OhUfRnY10
 KtHPejdIn8xXqRLGK9Z5TX0+m41H7eqOqgywdiWJs+7oTxGuqFpxSjqL8R6+INfgRAG2ojpOheQ
 ozn/rZa981V0o/+ru2h6gV3oXVPl3Y+BJbYKMjxkCMDN1BOHdFAN5z3a8RnPRxzhfuDujYqu9fv
 CqE2pwSjIgJWebfTyFVwkFolvdeur4ZiFPAWeC1DE69hZd96ytX4YPmp/yhF3k=
X-Authority-Analysis: v=2.4 cv=XJ0wSRhE c=1 sm=1 tr=0 ts=68b7f321 cx=c_pps
 a=uxpPEJxh2mAsh5WBefDKvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=vtXoPY2jAAAA:8 a=_-mupgYUti_8oTm5pNUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=s4FxMMpuSwg4a78zj2vJ:22
X-Proofpoint-ORIG-GUID: 9ySa0vGN-w7lcy_89laDV4ZVPC1xboST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Sep 2025 07:49:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119197

From: Zhang Peng <peng.zhang1.cn@windriver.com>

CVE-2025-54349:
In iperf before 3.19.1, iperf_auth.c has an off-by-one error and resultant
heap-based buffer overflow.

Reference:
[https://nvd.nist.gov/vuln/detail/CVE-2025-54349]

Upstream patches:
[https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf]

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../iperf3/iperf3/CVE-2025-54349.patch        | 97 +++++++++++++++++++
 .../recipes-benchmark/iperf3/iperf3_3.18.bb   |  1 +
 2 files changed, 98 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch

diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
new file mode 100644
index 0000000000..d21d635afe
--- /dev/null
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3/CVE-2025-54349.patch
@@ -0,0 +1,97 @@
+From 0ea4200f04ab2a823a718f48b8f853328858fcc9 Mon Sep 17 00:00:00 2001
+From: Sarah Larsen <swlarsen@es.net>
+Date: Wed, 25 Jun 2025 15:11:03 +0000
+Subject: [PATCH] Fix off-by-one heap overflow in auth.
+
+Reported by Han Lee (Apple Information Security)
+CVE-2025-54349
+
+CVE: CVE-2025-54349
+Upstream-Status: Backport [https://github.com/esnet/iperf/commit/4e5313bab0b9b3fe03513ab54f722c8a3e4b7bdf]
+Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
+---
+ src/iperf_auth.c | 18 +++++++++++++-----
+ 1 file changed, 13 insertions(+), 5 deletions(-)
+
+diff --git a/src/iperf_auth.c b/src/iperf_auth.c
+index 72e85fc..86b4eba 100644
+--- a/src/iperf_auth.c
++++ b/src/iperf_auth.c
+@@ -288,6 +288,7 @@ int encrypt_rsa_message(const char *plaintext, EVP_PKEY *public_key, unsigned ch
+ }
+ 
+ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedtext_len, EVP_PKEY *private_key, unsigned char **plaintext, int use_pkcs1_padding) {
++    int ret =0;
+ #if OPENSSL_VERSION_MAJOR >= 3
+     EVP_PKEY_CTX *ctx;
+ #else
+@@ -310,7 +311,8 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     keysize = RSA_size(rsa);
+ #endif
+     rsa_buffer  = OPENSSL_malloc(keysize * 2);
+-    *plaintext = (unsigned char*)OPENSSL_malloc(keysize);
++    // Note: +1 for NULL
++    *plaintext = (unsigned char*)OPENSSL_malloc(keysize + 1);
+ 
+     BIO *bioBuff   = BIO_new_mem_buf((void*)encryptedtext, encryptedtext_len);
+     rsa_buffer_len = BIO_read(bioBuff, rsa_buffer, keysize * 2);
+@@ -320,13 +322,15 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+         padding = RSA_PKCS1_PADDING;
+     }
+ #if OPENSSL_VERSION_MAJOR >= 3
++
+     plaintext_len = keysize;
+     EVP_PKEY_decrypt_init(ctx);
+-    int ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
++
++    ret = EVP_PKEY_CTX_set_rsa_padding(ctx, padding);
+     if (ret < 0){
+         goto errreturn;
+     }
+-    EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
++    ret = EVP_PKEY_decrypt(ctx, *plaintext, &plaintext_len, rsa_buffer, rsa_buffer_len);
+     EVP_PKEY_CTX_free(ctx);
+ #else
+     plaintext_len = RSA_private_decrypt(rsa_buffer_len, rsa_buffer, *plaintext, rsa, padding);
+@@ -337,7 +341,7 @@ int decrypt_rsa_message(const unsigned char *encryptedtext, const int encryptedt
+     BIO_free(bioBuff);
+ 
+     /* Treat a decryption error as an empty string. */
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         plaintext_len = 0;
+     }
+ 
+@@ -386,24 +390,28 @@ int decode_auth_setting(int enable_debug, const char *authtoken, EVP_PKEY *priva
+     int plaintext_len;
+     plaintext_len = decrypt_rsa_message(encrypted_b64, encrypted_len_b64, private_key, &plaintext, use_pkcs1_padding);
+     free(encrypted_b64);
+-    if (plaintext_len < 0) {
++    if (plaintext_len <= 0) {
+         return -1;
+     }
++
+     plaintext[plaintext_len] = '\0';
+ 
+     char *s_username, *s_password;
+     s_username = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_username == NULL) {
++        OPENSSL_free(plaintext);
+ 	return -1;
+     }
+     s_password = (char *) calloc(plaintext_len, sizeof(char));
+     if (s_password == NULL) {
++        OPENSSL_free(plaintext);
+ 	free(s_username);
+ 	return -1;
+     }
+ 
+     int rc = sscanf((char *) plaintext, auth_text_format, s_username, s_password, &utc_seconds);
+     if (rc != 3) {
++        OPENSSL_free(plaintext);
+ 	free(s_password);
+ 	free(s_username);
+ 	return -1;
+-- 
+2.50.0
+
diff --git a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
index d3bfc93fe1..e96d5f084b 100644
--- a/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
+++ b/meta-oe/recipes-benchmark/iperf3/iperf3_3.18.bb
@@ -15,6 +15,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=f9873a72f714e240530e759e103ac7b2"
 SRC_URI = "git://github.com/esnet/iperf.git;branch=master;protocol=https \
            file://0002-Remove-pg-from-profile_CFLAGS.patch \
            file://0001-configure.ac-check-for-CPP-prog.patch \
+           file://CVE-2025-54349.patch \
           "
 
 SRCREV = "2a2984488d6de8f7a2d1f5938e03ca7be57e227c"
-- 
2.50.0


