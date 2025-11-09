Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 115B8CCFA1A
	for <webhook@archiver.kernel.org>; Sun,  9 Nov 2025 13:41:06 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24942.1762695660702425649
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 09 Nov 2025 05:41:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=EMrYJHlx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3408a6cb6d=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A9DZ3Tp1402375
	for <openembedded-devel@lists.openembedded.org>; Sun, 9 Nov 2025 13:40:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=UXSfZUKE0Wn41pgTzzkwcwPFVCQEqxWdNgsW9qB1Q08=; b=EMrYJHlxVYPm
	It0l0BQWHfwCxcPMJHZvHC1d1kQxJG8lnkSALHp+fJpWybF/jZESEPC6noq2aNIB
	wTmJAYIKa5/Ikz++GIOr77uUR1QEQxnvUGNtkTq0iRHwEmiF0HnE0rxZfGfp7/X5
	vP/o+3igBldphuF3lEU0jDTgPYAscfhiaLnghvJjSwrcIwncpC8FTwUS3KUZpClV
	UKgpcMMMU7PxeINHnP6J43ZwBlDtjQPW5ntqbOIPtP8p4zokkWW5g7YeqEXE4Iwk
	cTgkOpugufABFEHTUCy9mrrr2d5qAi8owzT4lHwwRyUVxRInmtMRZePHJ5yq5I1q
	WIaS2iO1Sg==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012036.outbound.protection.outlook.com [52.101.48.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a9u2x12h9-4
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:40:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N7hRlpR3RR3KR6Yo4XmWJGF+Nr9sokZQjhmpBiUrmlj6gB2RWWzKdDrtyJ+7eNPidtw5+TMVMsMWBQOKbMG80vr8U2mxqZTKaYBVuLvm6PXvbTNrGV0+YPNom4P+rfNadT6u/TL/o3TDlWgkVYNq3wzlshkmmWXvSD2xp6bOb8n/24Ysp5Grr/1COBnJTUNWZ9nrTIdXpFR8m7o0zSIw6ytfHhIgU7MTlIQ3wbQ77e/i3Va0xbLq2Ie9+J5/XX2lG8vs19Zo1l5y1nP30i9e6nzr/Aqkm3jU1n6AYull+hFRPQkKYKSzEX2OwI2C5KdP4HroFtviInfPG2c4SFULig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXSfZUKE0Wn41pgTzzkwcwPFVCQEqxWdNgsW9qB1Q08=;
 b=tA6sXjjfkj/13gPMoT7tMBbltQJ0wYLWg90yPSmpmef737C+oDsen2j7jdBncCOkV0kaaDdtzkeTXvGPDr2sYgTzC/uiPsHTgQSHZ5fWFzQiq155WfhwiDEsxOUV87nCowg2HDPjNRg5/bZvPEos4ypPTY/PBejiq8F5ypqrvp5lMl4RhYtSdILlmT6xjDu4Z0cugMluMw4Zon33zi7x9ImjIt2EbLXMeoMaq3TDXan4zaXx76gGU64o1qNCnyfC1e6PRN1AHQpdWF57q4kGCbqR0j0I5KwFj/ltgxGDQXt3LkQJ+JzhZusNTBWl6JoRCXQV+WztmlFJ/ojm1J6m/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 LV2PR11MB5999.namprd11.prod.outlook.com (2603:10b6:408:17d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.15; Sun, 9 Nov
 2025 13:40:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9298.015; Sun, 9 Nov 2025
 13:40:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 6/8] radvd: add UPSTREAM_CHECK_URI
Date: Sun,  9 Nov 2025 21:40:33 +0800
Message-Id: <20251109134035.2741548-6-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251109134035.2741548-1-yi.zhao@windriver.com>
References: <20251109134035.2741548-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0173.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::29) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|LV2PR11MB5999:EE_
X-MS-Office365-Filtering-Correlation-Id: cab705ab-ff6c-46ba-734b-08de1f959cfe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?r2YjnFsw0mkddRJdyT9B851el4Rad46S0l5yUT/jwa37q7j8uGUO59uo4pcH?=
 =?us-ascii?Q?k1nEWlpTD3q/CtT3kwb403qz+tkRfqb6/uhnDD557u+hpzvYt/5KJ6DwtQIy?=
 =?us-ascii?Q?51C3xBhUCvI2xw4sg0UL6CbeTIX2MX/bojUX+qSlwF7OPwKvcTJtrsYawaTz?=
 =?us-ascii?Q?01sAN1vdJ4eJq/qvJmPjIlaMFYSlnoTXIvyu7cCsZX9xFPvz+mp2e3PHP0Ax?=
 =?us-ascii?Q?7hdcgAhGsB6Wz9guvEJNBmpkz6pEMyLgLLDcy+LRfUWGtMjYse9fbVgTmyZM?=
 =?us-ascii?Q?x5cSHbfj+p5Ffn8HaLOhTmkYrLSSVioGUCjXkJNN5844PCTOW43Drlf/uw3Y?=
 =?us-ascii?Q?SrVghE6gUldV6lIf+vPqxSwvIZHBHHgCnVk8WWyUIa93AZfgpeanF6ckg7sb?=
 =?us-ascii?Q?O4XrJEGmwvj4zlmdRhhDIUIeBNaPif1nPZ8hIRnrWdRAUAmvM8J1ktK5EFYP?=
 =?us-ascii?Q?7OsIdmJZAYTowzWx2FGL7DFxk8+ypfFbc4yeOvNLXi177vzYp38Y9j9UQIWh?=
 =?us-ascii?Q?btbp11Nex4lfPzdmfuPF4IAQkMCtUMuT62h2FrNOBBp1wU0jjHzmmvF3bc6j?=
 =?us-ascii?Q?Hk8z5kTqicW++S2jZmBf1wG/G4G9y9Delm3QudBPtDVxsOxkXt+fGZipWrRu?=
 =?us-ascii?Q?KdwNIGA/0XrgYb4gGz18MpxFPuNMVpiEAvOHy+5gBTXjEQhs8wO37wQKUVD5?=
 =?us-ascii?Q?CKkgoW4SObkXZOpKC38QJaZXW8AHzjwlTqVm2JIou0Gh6HTRjs5mX4OhP2NS?=
 =?us-ascii?Q?5nBNNxi9yDmrCCDIeeF8C+qZ0RHG+1p2YM+wmwFqlCmmPKYLTJF1KIRpx8cU?=
 =?us-ascii?Q?Xd7d4nsSjDv8EsC7dJtzGq46M6Wzxg+6gN246yO7+VDXp7u/QMp8rRuYqNcS?=
 =?us-ascii?Q?QhHDZWuF+BGh5UclTf4EDSI3aHIgAC/8giVbH8rrb94KEfDGq82xixELKqnt?=
 =?us-ascii?Q?hZ+/ZVhwO/9kcD//ZjiiuFxryVM7MPD8++o+xlDf7Dobvi8lEAp8IJJS4MNY?=
 =?us-ascii?Q?fV8jqkrIAo0QXyM7Kxe5NmRWT7zfvnEhIkohQPBOsWTVgaQmGVeyniTq9+eI?=
 =?us-ascii?Q?X9ky24y8B2kgAUncnq6T+ee/WloZfwQFrcEyqn98TW2lV0pIcr172CzNtRIT?=
 =?us-ascii?Q?wpv+/FkwfEQMZsP5RnYfkk4E6LqePUh1wAQ9QNvQte1LfCLLIbnD85aW7mEv?=
 =?us-ascii?Q?aEp/NUELw/9z9Azy32mnGfcY+87vwRAQZ0j9ZslBZoTchQB8LCtChpLmFgi+?=
 =?us-ascii?Q?0vzBsVw7jbkQ7sGZhkKAb4FeAMN5OiYMkdTuo89L+eQk3mQiBXz+bL31hBPo?=
 =?us-ascii?Q?fP+KZ760QI8gZfZ3oBTBBP14x486yjQubxL/kIQtsFI3fjkyHExXGoX03VMV?=
 =?us-ascii?Q?5labG1Cwo2RqLXFXyCohTmf8HGwDboV05CCp/0KuhhAT7d9sGJODnBNYMe+R?=
 =?us-ascii?Q?rK+UVgw6EO6i7+X0v6rB349k+uRC0t8eF/rrFzotT/oQHq2BoEHl2w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Tdag5mGfqtRqtXHVN2FBO2P1D8Upt+Ql3K0xR+LvmPNjEtlb4kBNxyrsGJ3j?=
 =?us-ascii?Q?NHK9SbjYr1nWInyqo839tfH6lS3VNThRfTNrzMuIpYHQIFMl7KRq9U73Noub?=
 =?us-ascii?Q?8bHUGJhvZtseiDmUEekGXyFcBKM3dB1wyBIVZfQaZmi775BhhNiKIIITjiFn?=
 =?us-ascii?Q?5eHDTGaAZ0v1W7P3hz3SU40K3WuG+9V2j4lwvXr2Yw4AgwZL4ie4250cSu+f?=
 =?us-ascii?Q?vwbhusTGOYg48dahey6Cn5BNQGpQh+InpNK3O93H1/CqoZq6yq2EFtHqsh0/?=
 =?us-ascii?Q?5BrAQnGf2JUJNeL9n7rlHhtOT45dj6s33sVdjrp3qVYgUNpvSeJ9YCHSaCtu?=
 =?us-ascii?Q?3qGzU50EqQtGlmY8Q4K1h+HmcQVvcqAefNEcU1K50+m+RtJi3YYqukzIROHx?=
 =?us-ascii?Q?xyPWnjqhIPHfIzwxjKKKW7lXuaxMLWnPuGWJ+RYddI/XHc9oYBu/2TM7msdM?=
 =?us-ascii?Q?usiuofycb3fD5sXdWOiwJXt+OcJC5iieLyuTMirWiu1KJBVWSsmYuP5oKmr6?=
 =?us-ascii?Q?VtDgjM77VCPSbMH8uwI6zjc35b5IFqHhfbfzdO9JGm8T/4UQz7YMVHauuAPn?=
 =?us-ascii?Q?8RC0eZX0NXB18Lo/oz+aEL6FjeRREcZntUywikhSHOkTXSqMMTDZxGQZv2Ub?=
 =?us-ascii?Q?TC6x/Ke5EjTmtDvnnkpT6bK1mBdxSvILdpZZdQ7aPxHIs+dJT9dqMEgVHhr8?=
 =?us-ascii?Q?wOs8+Fd72BEaUFcSLel6AnWdviucNhd4c1lbceFTrp2MNDnxZhjuxzhRDFyy?=
 =?us-ascii?Q?qbLYSDmUbRz0GWzIyUjYWZN0CJofK9CQdiQCjzXDMCDzMVh5fF9LlQ/hBHux?=
 =?us-ascii?Q?XiMku6bSpum59ZREhJMpKEtLA1vZmvOWDSvTPyfeJjs111TWXrQJ8MkCaZX8?=
 =?us-ascii?Q?zEhgXgUNhh6gI6O8aXdcLEv/VSMm58W+AAHq6JOjYXHaoMPG1E9yS7AyF3PR?=
 =?us-ascii?Q?C8YfH5RLYZAUDpwTUBVOrhw3LqCTBTRlq4Zcy8+Wm/hKV5lvuO+xbxzpCIW7?=
 =?us-ascii?Q?vta3SHDQHHCjskKLHdd93HTHyv4ltvh5xjojYHCrCMOfEDzYi4u6AhpcwymQ?=
 =?us-ascii?Q?ScyjM3PieUGeAUBmnCcBX8EDk6G/gkUEdhFAnVHPwvW1Iezhi/MLb2/d/e+U?=
 =?us-ascii?Q?xIORoZDHaMhE300qZpn/AGlSFLNEA/Jd1N4l6G7zPTWYYjToKf4WMMTCMoJg?=
 =?us-ascii?Q?645BQoP+rzBvm/jhnRp5XJLihjYYMNwNJo2XL14+guA6jaNw7EwVV9L7PLcV?=
 =?us-ascii?Q?QzwRryQQtgrKuSvVcjrzChvHAUtTorFB+s1zIgpvl3X1IFKJIFsTBWIprsQv?=
 =?us-ascii?Q?Te9lD5nbYkF4KJAKkOKPw2gcriU+uGT8I+Ls/Oiues5IYjAPE133trVU3JZE?=
 =?us-ascii?Q?ddgmXJj2zPaBXVaL/xqx9ay8yI/wUAYbccf6bKTcnTT6icsTiqC7JkbLhZgj?=
 =?us-ascii?Q?vd4YBRgH82CGtpd9snjZPuiiHdxeFIjWTDBLyJx2Tdlw03lV+n6Orhed7nCI?=
 =?us-ascii?Q?JRsruSdI3BvjoOjYuS92nDYvSFBtVwSdPFu/Shi7ZArVjoNwzCR6yMJezvOx?=
 =?us-ascii?Q?Igi3py8WU24GL3S2ntUWPI/3buPYFKAzOS+gKgcV?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cab705ab-ff6c-46ba-734b-08de1f959cfe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2025 13:40:58.0702
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 24TGNKBqd6WotGhpcTl1xKEjYc3J1VoIuoyTG9NFWU/LDMxGJ2SAGrqPmh25Elz9CTqQDMpw+yxUsjZRff7nsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB5999
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA5MDEyMSBTYWx0ZWRfX0sNkgPBc8lQU
 8OMxUOzCEngO7eEHV+JUj/eSrp3tzc838afWDCPJwccISct/Dqj4MBWakq+rwTJKyaWPsV4x5Wn
 z75qA1sknYTzxLNEPxJTgtI2wVLFNf7tEZgiq2rh/KtugJZIfCdjfFGDP7TKEMnuTWRFNhovoQn
 JqOVKHpIiT9lmZHvUFLDSg61k7Lc5DCZ/kcRYA9Iu23LzhcHKFe9VKv1HJ4B9esPUGXnOGMn58E
 4V94KSYEszIdMbeGhSsXTZQ8BParl3vX9nuKvU79QjIVFxcLEiYzusQ54q8R0mKowYmnzbG5pww
 yFQkc5BKcA2jV8AUpcoXiU4Xr+IaqUHGMwiL+txpI0aDilDQkGPORPnUNKvBCCmg6KhFit7S5C4
 ZZJPq24wURwFLZoMmbTaUYUL9df11w==
X-Proofpoint-GUID: 6cnUm1ba5cn_adWdzaxLMK77hps35DT4
X-Authority-Analysis: v=2.4 cv=Uvpu9uwB c=1 sm=1 tr=0 ts=691099eb cx=c_pps
 a=FLJGh2IUmjoo+n/grE3sag==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=k8RB6--xAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=fz4_u_jD2P710J4qHIgA:9
 a=Bk4fAJMWwHb4EYOhdZbW:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 6cnUm1ba5cn_adWdzaxLMK77hps35DT4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-09_06,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511090121
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 09 Nov 2025 13:41:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121412

Add UPSTREAM_CHECK_URI and UPSTREAM_CHECK_REGEX to check the correct
latest stable verison.

Before the patch:
$ devtool latest-version radvd
INFO: Current version: 2.20
INFO: Latest version:

After the patch:
$ devtool latest-version radvd
INFO: Current version: 2.20
INFO: Latest version: 2.20

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-daemons/radvd/radvd_2.20.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb b/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
index e2d606823b..d02433c5ec 100644
--- a/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
+++ b/meta-networking/recipes-daemons/radvd/radvd_2.20.bb
@@ -23,6 +23,9 @@ SRC_URI = "http://v6web.litech.org/radvd/dist/radvd-${PV}.tar.gz \
            "
 SRC_URI[sha256sum] = "af37c5a81d59f3bdc00d83056606ffa1810d4550beed6caa4f81181246494220"
 
+UPSTREAM_CHECK_URI = "https://github.com/radvd-project/radvd/releases"
+UPSTREAM_CHECK_REGEX = "releases/tag/v(?P<pver>\d+(\.\d+)+)"
+
 inherit autotools useradd pkgconfig systemd
 
 SYSTEMD_SERVICE:${PN} = "radvd.service"
-- 
2.34.1


