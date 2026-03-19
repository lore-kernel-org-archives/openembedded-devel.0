Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 947D01075298
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7479.1773914164123875838
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ArDUjZPW;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5JhCq2348891
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=HJZ/FOg3bGl1P07ejQIMbLrnwJ7mzmcznmHC3bzDMHE=; b=ArDUjZPWsQEd
	w8BHXSaUjQicWIhOae0riMPu5mqHHPNN8xstuALrWsJhg5iVb2Bze7yXR5NWKEDN
	/SpsUYQLx8Exa7bLHDyzbHfr7qO6qSjZ3L4ZIWZOb/alQv3DMydH+byz10Rck87A
	h79MW+YNYLg0r9+kq9Ad3h2/uCEsV1OSPA25j1/bAwZu3fIM1E6BVX42RFLFVBDG
	t6J2bGK/Qmk6ogqV752wq+m7ADwD9eFa0rX6VT13hyY7zmU8qzX0Zsc7G/Lsykfn
	bEuR5QrSnsexBGE8Pz3gRtZ2v1Q8ECM5H+Nao7eqyNFGbu0qNXqjF5tNuN3HJpbg
	rgUalmf38g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011008.outbound.protection.outlook.com [52.101.52.8])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y163vx-3
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 02:56:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z/5xM9XvEtcLZu/rgu2d+oQfSx9Z9y5uSFsEuh6XtC2kFCGALNWd/9f2FABt6fFa3QBcW/W2AWbNV+swWQG9H7q6a5VSYDpKZ2vBWDFL8U9LVYmYhmwCVxWR3VK7M/UNCs61/drMXDyFxUn8dHTrNFrap2uLEiyUKkI0UfQBFzaXi5wtbYGctF0UjDQUYIaC3TwFj8VlcFS6GOZgwFcrkFcyIXH45i8824xx+Ps/iJlFCcmo1UIKwYJj88DCtlrnDInTCHsd+lJI4b+ktpZVb+ndJOOdbaRDtGbZTtscbVNHhoF+0SZk7GcJxzz+LHN4aRPnf6O2n8NyRg3DqQsySw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJZ/FOg3bGl1P07ejQIMbLrnwJ7mzmcznmHC3bzDMHE=;
 b=HD00id1f0rNwzSHofz3vQezZ9ZSkszE4P9G1ucdDwRNcuanIVMoEX5A2NlYXFUJfntm2cjNl3sjXKjVX3SxNLyX06ZbazNyl0XtrPnkd5C9DRCBnIYm4/ShD5VCjxwtoqTzXaLCQAlyR47fAeBEpx/RWQqkj7gkLjDBJW2ql1bE3Ujc1PSe0RKsLUS9tB2oBYS/xwnlf68Z85kiw3QosD1jhcC8YoA9Xkf00MZ49D1pkFiUgJkmj3wY/OaSFzJ8M6fGHLPEkZ9yDirGu7trBLpAoiJTe7iUzyZs9vWBJlv69v1/xOFOYVWqzYmT/cIKV27RL+bLGhWHgDxh/cP5I/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:01 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:01 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 3/9] xfce4-notifyd: upgrade 0.9.4 -> 0.9.7
Date: Thu, 19 Mar 2026 17:55:41 +0800
Message-ID: <20260319095547.3614749-3-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0123.apcprd03.prod.outlook.com
 (2603:1096:4:91::27) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB5821:EE_
X-MS-Office365-Filtering-Correlation-Id: 86e984ec-04dd-4650-30e7-08de859dba48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	fh0gm7hWY1IfadbMFSmwGgA5x++gn93x5V2NB7ukw0GlEDcOKJt7o3i011X/8YsHme4CP8PfPy7pysKN0jW8vZqoHDH0NOX0FRGa08FKakkIZwkhgYC3WqU6quL8+U4vR4t+UtHlVZFdiNMgfSbAHb5mxu1DGhBJDfmybZFVulzt4Kv38hG+pCH9av0c0OO+/wxv7tMB72BwpBLAHezzVi5bvV4VAMv4DeLw8F1MlgC3f5tecxhvVBlfiCCjv0K3HJz2hXPsiYjJJGyz6fJUzWy706SPn8/l83OOeA5mhBMCUuMRBv9Y8i8yI9wgSC2ke2pvF8AieQfRcRjYaxArARn+DmecdMYjA4P8U7egQOSKhRZgezeO8Mh2ltaKsRq/zv19ROY32DE1aMfOlX3p9BMr3R9Xu/wySyAE8gMY4wTs6iokzGgNnwN5xtcMFgzvp5jtNUaEdq2yGDceDu+Iivv+C0aC70HQOsbzgjZXhK/637exhTQxoQAiR7IEcwPd34ivLKIa2lc3BOTFk/RN468uYtSkMT24iV2Oa6lQGMmZ4vscJRuADMFyQKKBMKMWQdX1MGTsr+T2gUB3CzOEOWkth3ukIAe4toEL9rkvSVcVPzd2B1UcS1AR6RCCEtI5NyVIzpHCR910lArMJRvb6PVxU/eBYAbgaHMqAOy3ev1GsWHBauh0TOoGi76LzBH1v1C1N+OJDWf6t2bATABNjDe6LfDe7sl6ebW8UC/O2miIWgLEgLRUvbFA3Rqb0hW7+DxYfCesm5gemnTXyx7mnP6pYdhd4/Q8kS1CoPe814s=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7Y3JIte6ELGhQ0MIG39dIP8mqF9z/rYYyB/WYUPaVa8ozrw04tsWewpPdBSl?=
 =?us-ascii?Q?1m+KqwE9Y1Db8zekp76GpJrAgaLD+M9zL8joa0/hr2n0dh6suHpB7YoUE2ix?=
 =?us-ascii?Q?CT6tCm5Q2ECu6P/IP+aZmqo766jBL9knY1Fjy7SZ248njp05spDa+dziHp/A?=
 =?us-ascii?Q?3z5H9TodNVFzn8M/6QOKwKVKtnqiB0toLVnzSZGu2VBUTdR29OPAaRhr/AYz?=
 =?us-ascii?Q?5g/BKYdfV28cxbpfWGaRcqNdHpEkfxD/N6ixCcyugIR64Lob/z8MVf9FICda?=
 =?us-ascii?Q?X5MdVfO0Z0SCb0DecFxbzxtdUWRGGtxkObFhsuvIK8KJfr6SPJ1mcrOdejAx?=
 =?us-ascii?Q?y3aCpCwUBD0pB3BuT3nK9UmdagdMHPckqypkwM+ZnLP1FHtd1jz6FBruDSyb?=
 =?us-ascii?Q?7qUNdXiygdJSui1KvMVfH/2AWHaKzr8jWpu8ZPmRsGFkk/FCq+wbpOD5zhmL?=
 =?us-ascii?Q?5G5b+7cKxvFrOs+lFZSXV/QcVVfyH0pG7hnOFOLqL8wLebv/ufgTkk2KIta+?=
 =?us-ascii?Q?ADr98R01KZzyVdmpK48GwWH0M+V1ibdNolsYYp4DjZjjiU7MfMzs4ZVDbJhF?=
 =?us-ascii?Q?PmjQL4QaZ3rZrwfOVZS8g8rlqWBGcn+DSNiGcXSvK7udfmyI2vOHa+V+uUrX?=
 =?us-ascii?Q?KJA43FMRiAFc4bLADO7hGFFcUhrhCzXBSkzP1hye+vG0JG3o00yA/kxBlgWY?=
 =?us-ascii?Q?hcLPFKXIHNyQ0N5yB40n+y0d2faTnOLG/Eu+m9cWlfgJbACYWDt3h+HcCONU?=
 =?us-ascii?Q?smM+bheRxow5ktC+LpFAfE8MBfT0y5qfgiEjJgndNxrYvzGp2N0qVc1WPglD?=
 =?us-ascii?Q?1sLWCJtPCJOVIOqPUJNRQ2GvH3Phsdi1QZjDa61YRQdqh6M5dswOQWtIn7ng?=
 =?us-ascii?Q?6MP7WHtSiEoN8HvjHOm0euMYWEScPPX/7u8jkkJ7tsXkP12pQY6agCRg7wsh?=
 =?us-ascii?Q?PVPgNLKnCNYH2Dk46Yx+7f9UGOfLHvQETOBbaIBOrZORDzmcc2U9im4qGYOb?=
 =?us-ascii?Q?H0DKsBZ4rQyYu40OKwxf0bvWEMPGD17kimXkDXA1H88BGJk4ncgwKxICoJiB?=
 =?us-ascii?Q?86k9rTCTW3RyIQ6XEOC4C/pcCQ3DsI6qLx8f+2kq4Ra4qGj2m4J2YjDTV+Ob?=
 =?us-ascii?Q?TpeJ8IecxFIJL3T7Ezw8WbuS1B9SXtTdJEdJil1bZ934LOHNtWe82WNN24Oo?=
 =?us-ascii?Q?Mjx2dquRVT/RwjDm42bgH0OLIOtRLVOMwACbWoLdf5QmrRZpeuurMjE+BspS?=
 =?us-ascii?Q?Lm998+X6dNiM5gUgTyiI+4kuG4eG+bUNvIDtGDBAvFoNOE3I7XRrkRNWREp1?=
 =?us-ascii?Q?dmhIfH8pyHNYYLlE7UMZh1s7GcARqI+7esrns0Ati6TUdWvymmcrB5SHzKUG?=
 =?us-ascii?Q?4dk+lnQgzQ3wdG4Bo+j+I/Go5Z/jblvAlaLc4P4wyaR3iASD/lFKXFDsSv5A?=
 =?us-ascii?Q?Fb9sC2GOE8OsFULWV6krJdQkhcmQQAhYezeXzc8LsnFrsFKKtmfax0FJEkIT?=
 =?us-ascii?Q?gUXEx1Fu60+FArC4gm5FAoay71y1caMrXkd5fk/CbvIpp+92JUzJ2PPGHitI?=
 =?us-ascii?Q?29WievjjMRWKZl67qEZb8drrzwBTRx6ww4BCFGbL2WU4vuJMkYkCK7tSWqt/?=
 =?us-ascii?Q?VgANf9MHvqn7JBi6fX1NBonDY02MqMptYqFhMRQfuPXfIH9ZQ8/8qlk7n2An?=
 =?us-ascii?Q?VQmAwWVCvwP8OJsJ4+rsawmwRffXPXUyUrmuhVaxxJak4eWVRI1rq5qnyOKd?=
 =?us-ascii?Q?xtCA9Tojrjem5a4u3dLcxUwR5AEAZDo=3D?=
X-Exchange-RoutingPolicyChecked: 
	bghKohnyJlAK8D0wNYVkkWx7nf5an/DJXxXG32rXbXmGngMdtVd4zbT5F9XGMqFkZfEFJ9HCHrqjB0fGQ/JOxwZOCu+OXsw2Ke1X/C6I+0npkPa9c07PXY2CuRdOowRXZxTq5l94417JycykhZ8JPiWl8/dNfBE2SFqA7yY2tSOKZsLt9BZD7nP8tDYfB3qPcmMgJVgPuHWlTGn3WZsmPABOsgGlAYD4pqKRihsY1sMHazuUDJvlDXSta88Ci7Ez5IDLBIFaKF+9T8nqft2yWiDMaQNciP5lbS/JffpI+uEpjhsYZE5ki+PSP0xQ8YvhjgrZsWrfIr4LD9rERS5UDQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86e984ec-04dd-4650-30e7-08de859dba48
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:01.7353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIphDTY0gFgPqutNR0TlNnCACpFnMc4BjvnXlphOdOCfl/u98qWw1cwR4/ha74PNuR3lYc7yiQqfLXsinfmj/l4QTnKtlLormeaqhYWcmR0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bbc833 cx=c_pps
 a=56WOIFdoL1k8+DRIoLPNvg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=qWhVAZq_9pitXS1TpXgA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX/VidnIrTjIy2
 h9q+bwKjzPo8XSpo2wOG2UisTrwKUX/lktT3U8nqzPaR90hOo6NMaIJsOTaU342LipPBQrt1qst
 ptOQKKTFYtA91EYSdw9LZxxtFgpvI+MgaygU/caaCEnSHKbmAHQf75b5bLLa/1rOW9IFtlbEpwJ
 MWuh9bDHUWyTpqy14z34NFmGQ6MOQ/5h5YqithWgqPPngPZZPf+BtuYgaK+PtBHhOABdFoOZl+v
 Haa331OhVu9k1K4GKvyKOD3uYM05aXSNdXQTbwSnr2DTI6GhqwJHpcsetSGDjk1dF8tXAgKfzCP
 oJJzRr6AklOzg5o2UNTnbL9L2yxXHS1scSOyqN+0KLP8FG+zC0SO8Umr0e0RPPfsoUSCya8B2Ce
 4tp5k3ZJKzaGbLxlA/HgiPe8BJj/FBSCZHm9RDu8e85IDtlIqEZ1JsptXal4HrVpC54pea00bJf
 FbohO5S9imQxqcnXL5g==
X-Proofpoint-GUID: FJDArXQ0y3aYYvIizuOkigzurI8eF3vs
X-Proofpoint-ORIG-GUID: FJDArXQ0y3aYYvIizuOkigzurI8eF3vs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125385

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.7
https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.6
https://gitlab.xfce.org/apps/xfce4-notifyd/-/tags/xfce4-notifyd-0.9.5

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../{xfce4-notifyd_0.9.4.bb => xfce4-notifyd_0.9.7.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.9.4.bb => xfce4-notifyd_0.9.7.bb} (92%)

diff --git a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.7.bb
similarity index 92%
rename from meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb
rename to meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.7.bb
index 987735e763..60f09d9db7 100644
--- a/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-notifyd/xfce4-notifyd_0.9.7.bb
@@ -16,7 +16,7 @@ DEPENDS = " \
 inherit xfce-app
 inherit python3native
 
-SRC_URI[sha256sum] = "ae6c128c055c44bd07202f73ae69ad833c5e4754f3530696965136e4d9ea7818"
+SRC_URI[sha256sum] = "170d18fd5f40cce823ffc7ae3d7e21644007c3f45808ab4835f0401d21b3516a"
 
 # Avoid trouble with other desktops e.g KDE which also ships dbus service named
 # org.freedesktop.Notifications
-- 
2.50.0


