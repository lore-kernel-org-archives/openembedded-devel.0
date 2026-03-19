Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD561075297
	for <webhook@archiver.kernel.org>; Thu, 19 Mar 2026 09:56:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7569.1773914166034423701
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Mar 2026 02:56:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dn35Nf7I;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753824cbf9=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J5oGG03806198
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=gN0i/kGn59Cb8OxJc+YNbFg7SvGJfBAYpqDYIZEGSFo=; b=dn35Nf7IhmD0
	M/40mIIKbgnWO7rGrhMYEAfBsjMpRC0ZeZTVwInPzNt/QJ7AQyG/X5R5osHiBuag
	3dnkCvO/QRgPUfJzTMR9cUwxXIctM1rD2jnn1Ysd3HO/Zy3lwQAX1eXt9qEoJP08
	xyu+KF6RROg+omEQBCtafjzWfpBGj6BU8GmvXuT6gx9ROYlbRpW7Tai3fkoF8bH6
	/vtUv0Gk8bNYAnwJOGGgiCh1JP0XqlDVw9lNBq/P8G4LecLvtOqonD9smujb2PPC
	9O8ZtAWepy5BtxV/KjM4PQxZg8aA3s14jI4tGT0b95pOHOtWc5/92oKLKvUu7QwC
	WvZe4tEiZg==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011000.outbound.protection.outlook.com [52.101.52.0])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66c4bj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SzagaQCSpiF5qVPFMmLhHNizJoDe/k4XTxhSARmJ+Hvpe0n7yWq3Y3XyXJfUQNufG+RUryWkiX+ed82c+WyfmJ1dmvdBCG+CGlMgYn73ztyBCY6OvOUljjM6FCB5haMCKRclVrGPWGOzV10jpbLIH2DyGNQ7QbeQDBbiqKXlXmmMTVR2Yx/NHVDB4mOrjqhjTnqHo4xldI9xS2KNkEYWOt2Y5pXIYiJPB/Mu8puc1Fk9Tci6tzmSWUKklpeBFqTTkWC5uxFouKLp2jhRF5GdHN2y57fVQJR83oh29mKSTSUMkUZazIs4LXYaTiSbrPFM4/D9bKXJ4GmWsAPQePxLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gN0i/kGn59Cb8OxJc+YNbFg7SvGJfBAYpqDYIZEGSFo=;
 b=RtioZRIrxfZGpz831f3goiZvb255erIrnkBpbLTgUMbbJ0hEDX3If5IKDs2AnfEUFweXGDCErbyVKHn/C4k7IoRbiLMXSnr9ZQqVTeUuwpvI6DzQQ0rmlS02IBnYFqF3d5DsFtYylkVKpzSJq9Be8Fo6MjVPjDnVPcKVvgqltumsT9aXQKYmxnWp3a9m8GMmEqq2bUknnraO4Uzo13XaDv3xjm1Rh7Il2I3XtzXe6NzmH0VcMbIe2QhLrZc7+7z9gclX3vmSp8ios9ww4XvuyeDT90Y4lcpSg2N+YTv6yVXSNmElus2VBGIGA5YDFyYZ/2n/1TkpBh0vwtfp9p8F4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB5821.namprd11.prod.outlook.com (2603:10b6:303:184::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.16; Thu, 19 Mar
 2026 09:56:03 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Thu, 19 Mar 2026
 09:56:03 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH 4/9] xfce4-panel-profiles: upgrade 1.0.15 -> 1.1.1
Date: Thu, 19 Mar 2026 17:55:42 +0800
Message-ID: <20260319095547.3614749-4-peng.zhang1.cn@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: c2720980-8050-450c-cef0-08de859dbb31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|13003099007|38350700014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 
	EREBSjiJRuJ0pdHBR76C5XW4yKxM8o27VtayrStuzW2CcglKlCKqCqt7qlDjKND05Au+OFnBvetcm+17kZlNqVcbvwmPOMuNdT9jY8y5uJh/7ikZCSaRNPxZ1gxDijRfPnN+aWmVavYyHmAMh/TikDrJe4L6m58qVCqrBvSkAGBUSVFPddTlgYFR5H5VegpiMbkBH2UoIjx0cepxPryXel2KtYotd3kPpDxQvVCeBbPwSoPuOYJhwjI8x5k52XIkcNwAEI68UEYCGDv4Xjgn1WXzevEC985q+OI5+qz4iDLTHZY/QCJSgJvqck5aMHPHzabXrMWpa76C4HcEzHWocGeoy5XrE6L3KXMzVbT/z2o6eoLolATZ37o8yWZ3hy1FR/agxOUhpvOAsSnN3iL+/bu8C1l3q0hT1qFLMrBTS1irKOBqcTuJ3TYbF+AgtanxtwAA5ysL5aX9ufK3dBm0lKLiCpP+LKtU+1TCHZQkNFXs61akWchg6bAn+2NN0iCQC9G1Q4sEu+dYZgoGvPcY44jZ4z1MMw1Fu7q5apDvSL9SkNRYao8wgMDHW3KwJVyqAr878fvIxjBv4o0DbhfjEXGUsFIJHMUaKtzACnSud0gj69dZDQzIaMUn5Y6VNzpbuceAnMSW+Kv/Gr3li+WfbKZ6S+eltztx3yTLL7eFzjMxT/hd9q/cSJ2HD8o+Juke0VUZdhAl53TgwAK0PlrQhlZv7NKRMw7coi73rzJTXj9cuiCK1gWbMz3pg4qWs62Z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(13003099007)(38350700014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ifZ0Is73HvA/ReMRvkdTJggG8490kB/8nL7dJjwAsb2SGKIQEl9NsF+q2TvN?=
 =?us-ascii?Q?Ple896EBY4sIqIxc0yMuiakSTxb9af4HvY7qW8lxdL69WahoZgnKcsKiq/Ps?=
 =?us-ascii?Q?57kqmbAe6HV83L18xINVF6sLTXgbDe3qxmClP8YpZ/5CRX/dz3W9tlUw/bHi?=
 =?us-ascii?Q?C3SZo50dolU4Eic5duWfZPveI7vdahGD3FIiCckH5ZTgSISOgzVugcoD/04k?=
 =?us-ascii?Q?WtN7v4e2aANIKWTw7tr4c6NNoJDN+ITPsPeVkPTHoy2y9TEdXR0IpEEqdoMt?=
 =?us-ascii?Q?xFIsCksaKuON4t3j3g0JrTM1BCrn+A6YAYafE0xDOFCgFcUiFT7a8xRtfZXI?=
 =?us-ascii?Q?0epV4GnVUqJK5ScR1B9plHa2nuMPJaemkDhR6An7Hnt6SxjABZaHMzudVdI9?=
 =?us-ascii?Q?G7bYkXdMqfmEmIWNZ2M3PG07Emj+3/GAwf01woPRI8s3eLKAqDIWBh19bqq/?=
 =?us-ascii?Q?yA5bgCoHxZWArBpnzOaKHv1rRBe7aZNlYcl2zZG5ER9nnVdfMAe4SgZUFvWY?=
 =?us-ascii?Q?NwjiQR8kHpfxrkDaWa6MIjWfGSdWs2/3DfQ97Cb4N2mhRx6zTU2uGjvaBgXg?=
 =?us-ascii?Q?awBXxzEYfdMvas2fZdXtOY4r2krW5fdTzF1QJtxngi6krnr5bdOkgAz8g/qC?=
 =?us-ascii?Q?9v5Xz40FhwyoZkM98QAHjTZsYYRqjoBYNSM5Zx2Nso9P7ff4+adsnis3P3Wo?=
 =?us-ascii?Q?h+9gLdMLHWYJH8qBciveC6N9/v2v+juH2KungSbFBZDRjRdXQUJoRhTh727v?=
 =?us-ascii?Q?F2p4yJr4gvvkEVr+FOTQABZr3LRZ9czwT2boGx4urPbSUvihZYOhFNtUr7AT?=
 =?us-ascii?Q?c5g4kS9s3+iyMl+6FsAAnsGdjr8yr6alEuOxVZPx14n0LMX5iN3gH66941TB?=
 =?us-ascii?Q?293TYkUygOcfL7wGmywS2B2sMwd0aoaPfacpBS1oRVpY9uZb0Wm0G+gBiJWL?=
 =?us-ascii?Q?Tct1B6a6mHyEJgufZHlYtOx9iZTVsFCwYDQ5QDKh/Z/HGVT2e1bPPSpaH81i?=
 =?us-ascii?Q?p14pR/Pd6qliOmWzZ1zs2CWqOtYwISLWip9uFTYf4KBEOjMmAhViuHDpqyMI?=
 =?us-ascii?Q?3HDCmSMqUPe3BZj5IUckv32fhYBxcmiI0Pi/89WBmPUC4U2YlOM3cZCpE4k2?=
 =?us-ascii?Q?yq+uEhQv6j7EBypv1j5xQ1lcc+2ozcxzJft5ls8VbBR6NZxVbtWUF+65rxdb?=
 =?us-ascii?Q?r+JCn+tXnQqjYP3heuxY/BcH8QxHc6WEalSseK4HvvMQk7ENsjicoQKBUXXy?=
 =?us-ascii?Q?8Pj4HDLwcippFlpFse0u7lBNBPia8mnMBJqH8bZXZ6NoyAbwsX5P7xx7ypNJ?=
 =?us-ascii?Q?ab273xva7DG7xktc+Eawj7LQPT8N936ZW0ZJBEhjaDu22lzKZ4TDhtm/gMPg?=
 =?us-ascii?Q?tSPdv62I5cWdVTZOvg8eL69rB9TErE67QPFzNObnX6C01wJXczW4hxJJ7WFb?=
 =?us-ascii?Q?YHbj1sZihzweDsCpyqk/drfD/VmGReMEyV4TwbBXOnzL5Qq7CocUn3YL9c4d?=
 =?us-ascii?Q?aGRW/rs+G/iyrEf8aIgqNMozaoaT4RKnikA2m5VGledPOnAJPltvHARi/8Vs?=
 =?us-ascii?Q?E/pqTMjLUQMRcSNJYj0yeTSbb9LvRiTFIpRZcwuajYoyQbT0zoEt4Z7L6XdF?=
 =?us-ascii?Q?24gkGciM/NIFQvB2oP+76twoGndttpfHJujEX/AdJWT++WVpcu079Ef71V2k?=
 =?us-ascii?Q?iY90teMl6II1iEpbQCNBeVVW4rv3hbABFTUDsyYiQqnfsczL6ifJjxqVKZtV?=
 =?us-ascii?Q?DKbbBV6PnVT//jTohQa88WxxXpRUgBo=3D?=
X-Exchange-RoutingPolicyChecked: 
	DHuLN61tucKT9zyqD9Mux84LNQrS6gBK0GDaJwMM3fAHphPINZqZzypyxc1qa9ZYUmFXW/Kaw+lXncWBnF3C4EiXOldJL2Aa9J574+rbcH3GASzFTelp63mT/KcX7HFYOeju3soWb8X6E92Ocxajv0My8L2G6oGmTakxbuY9rqFnG/b5W5nxJuuxjdIgOnnKj5TZt0oDNdwg1PVq5ulki34iYRfFYtchiXHWAkQD8CvcbhBrGsE76mZdQOBZscFGOujGCeH5OVR0a/pcx0ggYaves8LaKptEMcbp16QMLc/2vPuY4iEuWmMSuhqa37mDDkls37LTSNOWssaYXlTIVg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2720980-8050-450c-cef0-08de859dbb31
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2026 09:56:03.2235
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/Oz9R/6OaEGNNGW4iyBLgRL3rZ6pIuTT29CERIo/RLadRljGOaGkQZ29apoSicaEtJysTJQrD4qjTwvDwvU64+8AfPQ3Nmkf1qtpHn+Y9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5821
X-Proofpoint-ORIG-GUID: OrsnL4DI5GYlSwekylOFLFucwjblCwiz
X-Proofpoint-GUID: OrsnL4DI5GYlSwekylOFLFucwjblCwiz
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69bbc834 cx=c_pps
 a=CTIJcRslT32CQvadRVAfuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=pC_xhCp7EoVOcwatoC4A:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA3OSBTYWx0ZWRfX1s4ATwytpovS
 LbpPsBWo6DnQKpqBgHdTaqSHewuvRKKTiGYg/SqqfVnBhqxOciS463MRti7W7fF68i8mu3+E0JV
 57VvSYgfY74fNPEAZbYWF3h9EY0gACaRZg4YVayzN9bXacsa/lIPygmgXEjZeWYdTYPqgFH6n2v
 iwcnBCsfw82lEU7AbMh80KXVZOdv4vFKVt5dtjocvckcQyhqN07EbnE2bx0jj7HFzkRVv7csgMD
 IOn6v5BUsw6EjdiZnG/Nidp/h3bsrMM6FUQ4mxRKPs3XLWJiKYdqk+aH7sBPeloqtJJIkSrhmRK
 nKTHVVfh8s0PWxJyaus9i1+LxPfLzIyIflN0IT2H/mh9ZxTiMNW7rWABKQONBP9kZwFgjSfNixE
 PtKXBDINRQTRe6GdyLQVV/3kqiWcFsHpMWeHqhEjUlPuAWrPERgJ0Kp5RV1q7PKqA7fcdCAy5T+
 7/WP1ALb9bwvnkWmhAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190079
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Mar 2026 09:56:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125386

From: Zhang Peng <peng.zhang1.cn@windriver.com>

1.1.1
======
- build: Allow skip checking runtime dependencies
- Parameterize version and copyright year in man page
- Bump version in configure

https://gitlab.xfce.org/apps/xfce4-panel-profiles/-/tags/xfce4-panel-profiles-1.1.1

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 ...nel-profiles_1.0.15.bb => xfce4-panel-profiles_1.1.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-xfce/recipes-apps/xfce4-panel-profiles/{xfce4-panel-profiles_1.0.15.bb => xfce4-panel-profiles_1.1.1.bb} (74%)

diff --git a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.1.1.bb
similarity index 74%
rename from meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb
rename to meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.1.1.bb
index 7eeaf80a67..24c96ea788 100644
--- a/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.0.15.bb
+++ b/meta-xfce/recipes-apps/xfce4-panel-profiles/xfce4-panel-profiles_1.1.1.bb
@@ -10,8 +10,8 @@ REQUIRED_DISTRO_FEATURES = "x11 gobject-introspection-data"
 
 DEPENDS += "intltool-native"
 
-SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.0/${BP}.tar.bz2"
-SRC_URI[sha256sum] = "56cce1a27e88a18a282d568cbc601547a5dd704f0449a75bc284f0171aebaf3b"
+SRC_URI = "http://archive.xfce.org/src/apps/${BPN}/1.1/${BP}.tar.xz"
+SRC_URI[sha256sum] = "0126373a03778bb4894afa151de28d36bfc563ddab96d3bd7c63962350d34ba2"
 
 do_configure() {
     # special configure - no autotools...
@@ -25,4 +25,4 @@ do_install() {
 
 FILES:${PN} += "${datadir}/metainfo"
 
-RDEPENDS:${PN} += "python3-pygobject python3-pexpect"
+RDEPENDS:${PN} += "python3-pygobject python3-pexpect python3-psutil"
-- 
2.50.0


