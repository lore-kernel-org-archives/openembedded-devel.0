Return-Path: <Poornima.Lokesh@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B959BCA6012
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 10:01:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4331.1791540091815871412
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 09 Oct 2026 03:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kUZCei9h;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4742854fca=poornima.lokesh@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998HPeD4057166
	for <openembedded-devel@lists.openembedded.org>; Fri, 9 Oct 2026 10:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=n9B0NPFki6HjDd8xjo+L
	yA5wXK3LFGf2Nv4s6erXQl4=; b=kUZCei9hCM0Vg/khh61lKFOedEspR4ljnvdD
	U3h9WXahJNjf/1gms19I8ZR1sCf0+0W0Ez5/+T4CjkEHYvukbd2ZUjsEqy/7Q/aU
	fSYMz6tm0kkUAe5OZ2u6yFTVn/b57vKGUTDSy9wuGAJXIjw+ScC0OxTmZVg8dyt6
	9Z6gWsZROp0b9ulNb8QMi2KKfLbBB9ss506jnOUH2CSX3CqLVUGjFmrf2XcMoCtC
	vGKjAzpVfrN2gNJV1+PjCTkYCHu0G2mVkwTk/8WToQs/CuZ3Oh7Y9oiZ8ZabAJEF
	+FOVA1VLM6b/i0NrqKob9dx39pRky8WMXioV+r2aAQrhhFgMKw==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11020086.outbound.protection.outlook.com [52.101.46.86])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h5xep26bb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:01:30 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfDmP1rWrmsLK5NwtaViIRZwENlj8fDUoOgrMVGZ4qzAwtJ1zMBpQ7hCrzy4hGlJYUD6tVDQ0/CuWXWRFX4ev+wTSNchQgJpWXNb+mWjaFkXqb/F1+2/pFoFcGX/I2+2aWCpNGjk6FAd1sAawY365uQ+PeY5PcRRhseeqhST6CohIXCOXkk26ZpObXk/tnebZw02dDfOfc2zPjCe5Zhautf28L2UsUfzWHjxZae3cfEgEc1/hKZU3B7NdKIrErZVtGpkUvv6IDJJdMJ+yN+jxcByPwnkeRI8u0o6F8LCyyA8ThV6Fvgc49HFO+vqa8ysATL81Bo/tKc62cDsjXOX6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n9B0NPFki6HjDd8xjo+LyA5wXK3LFGf2Nv4s6erXQl4=;
 b=Q3aJ6tEeo+wCw/+u8R3OY8lBRM0c9l2yg/2PFhqsIdxTaw16C83hizIUU2A2sR26psxtVMrPOe1nxWeMDHjoJv8CG3HYaq7ktnSGX6e5q7b+aHP1jFEwnrr/5e5sH6fxMxQWws0GMEPn8ctlR0BCY81l37+YEvXDwdxcgz9BHIOVI+QQ8ht2Extb4q3ZSKGcEImW/8q8GLEuoJWSvWiJUhhrfOROMdaqsUO5y/EJ7JbBWwrpyzQ7GrTrkCPzZ8OgXCMor8g/ef4qThMRFlFYqvATUHP4CNQkrhiAKAKGzhzS46eMiV881VKWoWutnxenURTpPilZToAPzK7ayhji7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f4c) by DM6PR11MB4643.namprd11.prod.outlook.com
 (2603:10b6:5:2a6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 10:01:28 +0000
Received: from DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac]) by DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
 ([fe80::8a71:6d5:1f9e:f8ac%7]) with mapi id 15.21.0496.015; Fri, 9 Oct 2026
 10:01:28 +0000
From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH] rabbitmq-c: fix CVE-2026-61547
Date: Fri,  9 Oct 2026 15:31:04 +0530
Message-Id: <20261009100104.2059406-1-Poornima.Lokesh@windriver.com>
X-Mailer: git-send-email 2.35.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0027.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c7::14)
 To DM3PPFCA3BFC2BF.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4c)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPFCA3BFC2BF:EE_|DM6PR11MB4643:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b343729-0504-46b6-d2cf-08df25ec4903
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|23010399003|366016|376014|38350700014|11063799006|56012099006|260925022911599003|260925021311599003|260925021911599003|18002099003|10067099003|6133799003|32116099003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	VsT58+t4pf1EiQ65VU36v0IVkgHkYyikStkTiXAsGnea/YdW1TYNz7eZUWuDq2Kn89/9kL8dP/FQaAn2LxnbTsV3SRSt7E4zOGPrGqCpkX3DzEdVzxevFeS9duSCi8gHc4XTcEjy83fPRjIHICqWzvXjJxNbjJqEJdpE86vLwO+1R+klVI7AU/EC1dw4LHuCtn7n8lGo3OtaX63SWBfl06IKPBsZzQKrggD9gq8cpJWy4DGC72NOUlVM66zEVnpyAOUC9vgskE3cDrnce9tItvMsFahEBftsCqas8dxSyS+pSVEpgs2Uv/0SiU3j/2q35yWvuGTPra7YOpXTmycfjM8ApYrummLaQxaPOpa51XHkYPih28rAdIm53qPChte1sTHpqu9/JsbD2aKPiFM30pp8AlS0StBCCEeoqxC5qv2ZOlNawyfUzhHEgdiqclpl4hQ77TQzzQurpp0Nw+7DViIf/CDL5TW2RTmx9AHQ7RbF6hbARB+NzUvciwft7Q+mBPog6Xx/i1wIAzRA2acxirofNxTN6FzBIhZIXo05wD7OHSWa6zCsjvpS9gx2ClfNSA/sLNJa4/mWeSAkWMwnuWKRo5LbW4OY6y7Do6j+9RPkq87/jszsWlc4bXyBo+ty1EfsNXD+EM34Fq7FMiVV+e41V8Xizh1igzKLZdFI4qHmfGWN+W8nU0cCp5gzyWzofruP9gfE7ntW3Bqq1X9soLAqTG0zwVnPGPG4AjUdzVE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PPFCA3BFC2BF.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(23010399003)(366016)(376014)(38350700014)(11063799006)(56012099006)(260925022911599003)(260925021311599003)(260925021911599003)(18002099003)(10067099003)(6133799003)(32116099003)(3023799007)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2WLMDORpXLxw7AkLFIg9bej8buS3UwtMOyPNs30mHHFsiXvvJXA/kIfTYAdg?=
 =?us-ascii?Q?n2zv2DppwjkSnv4KNsvzimaXonnUxT3mN8/NPpOky1YydSCY3isD3pJhXUjV?=
 =?us-ascii?Q?ZRytEnBhnGM3hDlsGeWR1tfN/8ePRwtWX/2xOiqD3KC9iWt5efMjRHyrM0Jc?=
 =?us-ascii?Q?LwI1Z3e9glIJn1usNfmweYdJkN1juL9VGizza1RZtmuXctoLWfNCYOmsUc0g?=
 =?us-ascii?Q?ZgnQhlVCbtGV68g9smdApSB/0abumTWqtofIhyisAN9+UdtiVUlmhSMEhuwz?=
 =?us-ascii?Q?BlSY2EPXU1Lj8fG1Ar0Gn30oUHBEMKTj0FWo/ZoqlcvUM4dJHoTp70mff/Xx?=
 =?us-ascii?Q?MprXSF4n13U9qq1tQxOIUt7Ne257jcC3iKbxjMcQfIjGAjlNSyiBOOl7TnGR?=
 =?us-ascii?Q?DAk25xJWbCRj4ghxu2X7VhfoQvj7PFRLKlKp1STZ0av1mVfKdTb4IdjoUufe?=
 =?us-ascii?Q?mpJ37np5ch9VLcDRWsjZY9NvV6IrlOM7376rby62KH5A3IvkrAHqisXeXpRG?=
 =?us-ascii?Q?hR7UQ25qGai1wIC9yfsnv4xuToKiVyWf+tq6MqBEk8pyfL0IcsRCPMooragT?=
 =?us-ascii?Q?LHol6WTJmj59VX6OZy5oTkq6IdcjHKHBPnfZ3/bHQXmMAgd7qZ3zWvVLRWe4?=
 =?us-ascii?Q?SsT0D4vFB+aFYlyNi4Sdus+s2hFscTr9AtNLmeKmnfka4MIF2DeGePb98pcK?=
 =?us-ascii?Q?sjsTESWGqei0Vgs759Z+qHvBUk8lvaoZ/S9L3voVDiy58Gk/lSMrvJGpymg6?=
 =?us-ascii?Q?pvcdIkPEXvS2bDgFsHVO/gk3ovbzBy7oGeCpm0reU2yv0UvVeTZGLFnzfGoN?=
 =?us-ascii?Q?IdlCgiRFw+Y85atzqgZ2STx8G5S+2bAcxOBz24i55ujhNLY4xSYrYEZLjjEx?=
 =?us-ascii?Q?PXcO8SOTjqb+ii8dEQ3WvNYIH+pVtgrP4H38kjiZoLSw8ftVVxvSlXulHO+k?=
 =?us-ascii?Q?uxNui1EfByB9sU6TCj/xuSfTCiM59OZQ1L5r9b+dzYauAT4zxetzP656DqwV?=
 =?us-ascii?Q?CQEpxlpVehob6xRefwQCZYh3VDqyYafdHJ3PIBmvBeInRwdOVk5rOkzTxY5i?=
 =?us-ascii?Q?6mbvrEJTeolCUTjOo/TptbeiWaGBlx1C1d6ja+4pxX6w7JNJqXgCx/Ig1Ohg?=
 =?us-ascii?Q?KUsp7eR3ZU9sZ7lfHb3XS+MLXi/8bkETR9LXLJm8noAA20IK3QSn5HuQz9YL?=
 =?us-ascii?Q?dUOu6giiQ9s0/hKQj9FKGc0/+JTBuTq4zz6hxklvgmODp9BuRQiOhCaqtRil?=
 =?us-ascii?Q?KGQtIaxg8xFZOIsgG3Ey6yrt8daa1UMm96ixhuif8T323i5f4elN3zpr9gI0?=
 =?us-ascii?Q?bkg4MYFitYDc2eJOmEc1kfoFh1uQK5KW88SrcCRw2tyIRqwVbYC0kDn8bd3y?=
 =?us-ascii?Q?HrRfjn9uA2DEjHQRn9GdeQsGPrc5D0tBA3eBLro5cYYQotAUNKPG0xOUu/U4?=
 =?us-ascii?Q?J1CdgJ8CNSnKWCbmSz9yno8TrMZsN84f1O9b4Q2k2n7Z13aJb0o8gBxl9ykE?=
 =?us-ascii?Q?g34eeh2PxwtvbotKXziwPEIl1zaW3W1Bbr3cqYuv3qV0Qsa6eJJBk9AmIVzJ?=
 =?us-ascii?Q?ajnd+GMuGGyhiHU+RpfZajGYbGjcFX2m4B/6G7oA/q1VGHl+5CM+ZUIWu5k3?=
 =?us-ascii?Q?BEjRxVw2iuKrGMdpMS6tbCCKacJVYOXJdQt1fRST9TM5dSHvohaKqPrb/1oM?=
 =?us-ascii?Q?ivBSqU3akWMWbKpv+mQTZyb/7C5kMzAuszXHAwkNBFbG5hT6yiAIRrFTDp8p?=
 =?us-ascii?Q?poXsXQfw+ipNFwJgiydy5X08ir5P60w=3D?=
X-Exchange-RoutingPolicyChecked: 
	F/WXnu1xUrFB3NAm4S+v7qNn4hmuXkN/coXj1ODhqUCmYHDqCNazRw3iBPirBwnSioBEmYXVC1Zgj8yl7r3OskgQtkqTk6tIe11M+V9nnDesJN9pIDY8wv3Q2QxjfdFLlPd/XhVPMNOY9poqHdMoKsshLtUG7aVHiKH2Q3bVuaVlZ2qf+PhvmQPkIXsn2D/j3E5Koi/N7AFCbmEkySZz877spQW6aqhtjXgen44SDFn6QtyrYsRL9Kv9oXOOTj8hL0GAX98pzIuCPq5GqA1OAJXncqIUk3nFtcl0KBIZXmXv6AFCNie3J35zI3Lo7Fs2/6dyNNS7W74uTeoD7TGrHA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b343729-0504-46b6-d2cf-08df25ec4903
X-MS-Exchange-CrossTenant-AuthSource: DM3PPFCA3BFC2BF.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 10:01:27.9058
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9XkFntw2ki6mpvPcWqvY0BiuRr9AEjZQpovjtOVhVQY9xCAkPBoqmH7Jy7QyBF2I8Pk9YEDwbAfV8GMpS6/tQ+GK5bRI9XExFoPC+crwFjc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4643
X-Proofpoint-ORIG-GUID: xx0nvHTGUSTKjg7Fj8Qm53CYmI4LCsSA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX52rhJ0ZYuK5g
 YcDUwFL9+6rm/vUFV7GJmgSUzDKUvhj45CagUPvl6EqOgl6fd5vOanVe3+WtPIHV2GGA1lW7ShW
 +3Zc9EqT6G1uyGStooN3rA0bXo4mLQB38SClkHkHDnznOio/2OxJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfXwj/BpxRKJw5c
 2OUK8dEyabgczd6acmxM7TkYNVZSFVYepd7giaAKRT7/mL/VJxGC9PEJjUXri8GggrUZ7DjTtTG
 Ne9V6DO1t8/VtL4UiF4GCjHHWclg7aQVPj1ZeQX/cfbWGKuqL7rXC+co3nQMStRXFqUpkLzU1mT
 ntr10bnNa/a605BQEYVg1MvLA9eiNeIcG24YEHRLnc/qqeBCPAZ4BZUkw9DPHk5UptboaXvHkRZ
 ct6fJqPdd1hXcQUrRvjRmme1IU5GEd83omQK8SXJPkopUoYH7CcYgBnrHhbigQbKdBENLkC53Iw
 9cdMQGKE5O6/b7RdxlmlYezUZJXDxqhPPl+qXcKaWR52vUSg+CuRPo06qNCVg5XwSBiYagz+5w1
 09Ml+wK/DTvbjV92qBinWMDw/VBQ+fj+cCDWuRUn8UWxRW4W2PO7ow5RgRhC6ltHePmgBn0f5lb
 PsAe9VreaS6UUmOSreQ==
X-Proofpoint-GUID: xx0nvHTGUSTKjg7Fj8Qm53CYmI4LCsSA
X-Authority-Analysis: v=2.4 cv=G6uJgNk5 c=1 sm=1 tr=0 ts=6ac8bb7a cx=c_pps
 a=FJjcbeYznbroKK2DnCisOA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=xNf9USuDAAAA:8
 a=NEAV23lmAAAA:8 a=PYnjg3YJAAAA:8 a=t7CeM3EgAAAA:8 a=NaG2VblTIkPRWFbvqLcA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090039
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 09 Oct 2026 10:01:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130681

A heap buffer overflow exists in rabbitmq-c when the public
amqp_send_frame() API is used to serialize an oversized AMQP_FRAME_BODY.
The issue occurs because amqp_frame_to_bytes() copies
frame.payload.body_fragment.len bytes into the connection outbound
buffer without validating that the body fragment fits within the
allocated frame buffer. An application that passes an oversized body
frame to amqp_send_frame() can trigger a heap out-of-bounds write,
resulting in process crash and memory corruption.

Reference:
[https://security-tracker.debian.org/tracker/CVE-2026-61547]
[https://github.com/alanxz/rabbitmq-c/security/advisories/GHSA-hfjv-vcp3-39wh]

Backport the patch to fix CVE-2026-61547
[https://github.com/alanxz/rabbitmq-c/commit/02d278663f3a93db9fe4fb4e7e34dc96b83c107b]

Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
---
 .../rabbitmq-c/CVE-2026-61547.patch           | 128 ++++++++++++++++++
 .../rabbitmq-c/rabbitmq-c_0.15.0.bb           |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-61547.patch

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-61547.patch b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-61547.patch
new file mode 100644
index 0000000000..d1e479c308
--- /dev/null
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c/CVE-2026-61547.patch
@@ -0,0 +1,128 @@
+From 413658f73078b91dee9efb442add63cbf3cc8dea Mon Sep 17 00:00:00 2001
+From: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+Date: Thu, 8 Oct 2026 09:29:12 +0000
+Subject: [PATCH] rabbitmq-c: patch CVE-2026-61547
+
+Fix heap buffer overflow in amqp_frame_to_bytes for oversized body frames.
+
+amqp_send_frame() -> amqp_frame_to_bytes() copied
+frame.payload.body_fragment.len bytes into the outbound buffer without
+validating that the body fragment fit within the allocated frame buffer.
+An application passing an oversized AMQP_FRAME_BODY to the public
+amqp_send_frame() API could trigger a heap out-of-bounds write.
+
+Bound the body fragment to the usable payload size
+(buffer.len - HEADER_SIZE - FOOTER_SIZE), returning
+AMQP_STATUS_BAD_AMQP_DATA when it does not fit. Add a regression test.
+
+Details:
+https://nvd.nist.gov/vuln/detail/CVE-2026-61547
+
+CVE: CVE-2026-61547
+
+Upstream-Status: Backport [https://github.com/alanxz/rabbitmq-c/commit/02d278663f3a93db9fe4fb4e7e34dc96b83c107b]
+
+Signed-off-by: Poornima Lokesh <Poornima.Lokesh@windriver.com>
+---
+ librabbitmq/amqp_connection.c |  8 +++++
+ tests/CMakeLists.txt          |  3 ++
+ tests/test_send_frame.c       | 57 +++++++++++++++++++++++++++++++++++
+ 3 files changed, 68 insertions(+)
+ create mode 100644 tests/test_send_frame.c
+
+diff --git a/librabbitmq/amqp_connection.c b/librabbitmq/amqp_connection.c
+index 56ab8a8..8c1e9c0 100644
+--- a/librabbitmq/amqp_connection.c
++++ b/librabbitmq/amqp_connection.c
+@@ -441,6 +441,14 @@ static int amqp_frame_to_bytes(const amqp_frame_t *frame, amqp_bytes_t buffer,
+     case AMQP_FRAME_BODY: {
+       const amqp_bytes_t *body = &frame->payload.body_fragment;
+ 
++      /* Ensure the body fragment fits within the outbound buffer, leaving
++       * room for the frame header and footer. Without this check an
++       * oversized body fragment would overflow the heap-allocated buffer. */
++      if (buffer.len < HEADER_SIZE + FOOTER_SIZE ||
++          body->len > buffer.len - (HEADER_SIZE + FOOTER_SIZE)) {
++        return AMQP_STATUS_BAD_AMQP_DATA;
++      }
++
+       memcpy(amqp_offset(out_frame, HEADER_SIZE), body->bytes, body->len);
+ 
+       out_frame_len = body->len;
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 8c0aee0..194af0c 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -41,3 +41,6 @@ add_executable(test_merge_capabilities test_merge_capabilities.c)
+ target_link_libraries(test_merge_capabilities rabbitmq-static)
+ add_test(merge_capabilities test_merge_capabilities)
+ 
++add_executable(test_send_frame test_send_frame.c)
++target_link_libraries(test_send_frame rabbitmq-static)
++add_test(send_frame test_send_frame)
+diff --git a/tests/test_send_frame.c b/tests/test_send_frame.c
+new file mode 100644
+index 0000000..4d8e067
+--- /dev/null
++++ b/tests/test_send_frame.c
+@@ -0,0 +1,57 @@
++// Copyright 2007 - 2021, Alan Antonuk and the rabbitmq-c contributors.
++// SPDX-License-Identifier: mit
++
++#include "amqp_private.h"
++#include <rabbitmq-c/amqp.h>
++#include <rabbitmq-c/framing.h>
++
++#include <stdio.h>
++#include <stdlib.h>
++#include <string.h>
++
++/* Regression test for GHSA-hfjv-vcp3-39wh: passing an oversized
++ * AMQP_FRAME_BODY to amqp_send_frame() must not overflow the outbound
++ * buffer. It should be rejected with AMQP_STATUS_BAD_AMQP_DATA. */
++static void test_oversized_body_frame_rejected(void) {
++  amqp_connection_state_t state = amqp_new_connection();
++  amqp_frame_t frame;
++  size_t body_len;
++  char *body;
++  int res;
++
++  if (state == NULL) {
++    fprintf(stderr, "amqp_new_connection failed\n");
++    abort();
++  }
++
++  /* The default outbound buffer is AMQP_DEFAULT_FRAME_SIZE bytes; use a
++   * body fragment that is larger than that buffer can hold. */
++  body_len = state->outbound_buffer.len + 1024;
++  body = malloc(body_len);
++  if (body == NULL) {
++    fprintf(stderr, "malloc failed\n");
++    abort();
++  }
++  memset(body, 'A', body_len);
++
++  memset(&frame, 0, sizeof(frame));
++  frame.frame_type = AMQP_FRAME_BODY;
++  frame.channel = 1;
++  frame.payload.body_fragment.bytes = body;
++  frame.payload.body_fragment.len = body_len;
++
++  res = amqp_send_frame(state, &frame);
++  if (res != AMQP_STATUS_BAD_AMQP_DATA) {
++    fprintf(stderr, "expected AMQP_STATUS_BAD_AMQP_DATA (%d), got %d\n",
++            AMQP_STATUS_BAD_AMQP_DATA, res);
++    abort();
++  }
++
++  free(body);
++  amqp_destroy_connection(state);
++}
++
++int main(void) {
++  test_oversized_body_frame_rejected();
++  return 0;
++}
+-- 
+2.35.5
+
diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
index 4fd6302f2c..b8bc5b57e3 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
@@ -4,6 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
 SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
+	   file://CVE-2026-61547.patch \
 "
 SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
 
-- 
2.35.5


