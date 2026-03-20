Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2394A1088E6E
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 09:24:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8899.1773998691827211919
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Mar 2026 02:24:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JDXrtzi1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=753978af84=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K7oFpT2701846
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:24:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=2puilMLFqJSas7p60X4DY63vfRmgI8TY32tejgLWdrk=; b=JDXrtzi1yYG4
	t+NphK4wL3FfVy+U3xKaqKyxhCYga4VyXMPzPql7r18JPJKFqbutZwAyM/uyZOGH
	g91DuZ/u466AdOKE7NyK7j1bKAetwW3pSaXWkiueyqXR3JuQr9w1cRqp1y/jF5Yg
	CWXvLBX4nzQpjWTCCN/WShcPQpXCSJHeGp5bCYC1bDWjZDEbsTJnTRS/N9gvOXUm
	psNPGEP8TE6CCQBdt0zG5s765TNYqBbiT+sABfb6D5F0sgeFJFP3H+RDyxG83LCh
	suvAGXMWityMn8aOiGqdTZtmnrcJxom+o7UD5W0Xkln80pjWdKyW3POzxEp0B8f/
	bbu+S6Z7JA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010043.outbound.protection.outlook.com [52.101.61.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cxm66dqxg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:24:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TnY35HxTPcGSNLEqOpejTtPfHrxP3f8gSscUIFcpMi9PvlTbORnrZuDtjc1DM8Huf7dyKjUynGV6G1jK1FXvqUfCrwMMmJkWY3YkqVEIN4bOuMpDOtDsfeDewHd37F+seDIa/aU1NFkAp1UOgPiNVQVZ0drjcHu7Zr/Pyc3oUqhPm4WnXSXJ81MNoj2/zhf5Oy5LALzJLPQUDcYXfLSAEUQ1Jmc2k6tg4LTPAWCRCRW7+WQgAL3avesFJrcxyLcxrXpNhHKWx5pAd7Q4PwckVIphCr0p/llYSNR7eVdlK8lTgY+rVi/YKmz1CvbOgq4rqzupL7EXmSYsiVzrL8Wsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2puilMLFqJSas7p60X4DY63vfRmgI8TY32tejgLWdrk=;
 b=BP1Lcrnr2ggInCIwRfr7VzbUbeAN8cg3Vv0HpGFauGJRDO18tilo6zvqNryiYB8xLqzKdZJcZQsSikHRlPRz7rq2EWUoKrsaOwFh92uQHFozzdm7BQso3IUszTIIgC2D0lpGf6a6y5sUZ16GKHskdau1F3X6qkIiN6bhUExJ1HuD62IdqgET0AGMLEBEdo7W7tNGt2Lu2jIbV8+GBfiWXecpuCl1FGbkPmy8Ra+WNW6FB4C+H1g831GOGdU3GRViYQCDIx1XuebA0GcgM25dqXRi8tYVcsnLAFWLqw10JlBHfCV7FyY5B/JznmsWwjVxQ+ULLhjQqQulneZanKZHGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by SA0PR11MB4655.namprd11.prod.outlook.com (2603:10b6:806:9d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.10; Fri, 20 Mar
 2026 09:24:48 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Fri, 20 Mar 2026
 09:24:48 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-xfce][PATCH v2] xfce4-screensaver: upgrade 4.18.4 -> 4.20.2
Date: Fri, 20 Mar 2026 17:24:37 +0800
Message-ID: <20260320092437.3421-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
References: <20260319095547.3614749-1-peng.zhang1.cn@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|SA0PR11MB4655:EE_
X-MS-Office365-Filtering-Correlation-Id: e0be46dc-24c3-4491-3ee2-08de866287fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|376014|366016|56012099003|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	0bx7001YU4SUvm9RYrQddwWvHSo6pXACyuPKNekE0rwRZJdKj2yo1K1yGEKIEYIhj5XAo7d+7yc8gq9y2SjgkGyThKLcm/qA+tflSmUsVUS7OiEQYTI921boDqF4omS1UXS+GFA/N/h3s8lJQvRdfAPsO059dxJpc/tjxoU5Q5tzFuvNurszFTK54Os+U4kcSFP64zgR2VwO9weZ44LlGW/i+dcdc5Vrp7Z+OtVogL88GbXHA15CCD5ARyor2WebJGn6gHEDhZjX/wvhD50Y5xQxjRgnai47nOtfBoXbQz/MctyzL4ikjpTbsR4j8uavIqT6T7FSir4LHKBMqyvaNAJC7F+MocLAxrleZ7PiYAHNe3Nn3Qrv04nOtTuM+JeiGU/F+YpswQA+1SfQt7lSmIu9W+rnv5FcClsAm/vtLJ/y8qBZKsJrWDDMI5/GxR4po0QWYVBF+whKLoTEk3oqLV9FFp3VP79UzDo+6zQuuzIlq4m/0T4RuBI+IFzEyT+Lqu9084nOfd+i6AqfBrrSXQDMAUhO+LKhvxB42q8r9gxrMMt/A3q8g4DQTXlITc57whgGjfHboTYxWTelPvvpgigVTWsEsMKFyI70g0elu6r9pPg35ZX29Hx8dpp2Dkc/UzZKxOskAcGok+SPWkXn1w2szb/o8zESGYDfFhVdhTXnM1m7jMrdVeslxiLL1MD1xR70HvqxOYYc7IXDjcwA/w//BiITZ8Ku5XsLNEvkVHkEXWbMfx2WtOPbTXWSTMhZdBCL6aO0vu0a59eddZQ1s7yp/UR6lMxlgpAIVZdtTSc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(376014)(366016)(56012099003)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YJTGh3X6HzDamTU6PuJEXjvBijdIz+IEDWRD3UIxDmS7n6R6LxRcWCR0ezys?=
 =?us-ascii?Q?iBvvub1iUfXHfwKkQ9ymWn4Hwnc3qJ/RY+x08jqxg8XhdrGnMFFkR1RPc+0J?=
 =?us-ascii?Q?0UuCrru0VVmSsFUnQGWWmbaHoET6D+xjooVZWHgN31B7vPDDiTYc7///MRx8?=
 =?us-ascii?Q?oL2pf7t0ow68Dbwe0SCPVZimQ37b7djaF3tr1zE1Qy1mps6/SRcAyQK/EHbe?=
 =?us-ascii?Q?tJCe4CKs+OFnfWBu2RBzvAJftqo4zDlAe5xTmiPmP9EVDaiUKUVjwgTq3OWS?=
 =?us-ascii?Q?kqZ1SPFHEk6+N2ERbcLajOHs6oo28cogEmVrbEwd9DYeOhOcekoMqLff60mc?=
 =?us-ascii?Q?n4papL5uYN1x7wE+MrhpnbOiFa3RrMp+N5PQ2MsiOBWbUrtvp8EP644D/x8w?=
 =?us-ascii?Q?v73se0xoSgqDNf9NWPslhLeVuI1XrnXff9b6hg051pFPieEpf+7RI+KwnoJs?=
 =?us-ascii?Q?limCHBXOWjda3nCnvNLVxvN/Fh9cG8WgID1hDDBpbnDEhOM9iBNByUXvNdRP?=
 =?us-ascii?Q?zekxvlsgL0n4qHsGfEKexjV1dTQC0ZEtsK4ES2+gitNJDGaVE4kK9oUOy5xn?=
 =?us-ascii?Q?O36utI4XsP7BeXXxzS5BKeswL58ejVBJNXq8vhUpOgt+UHRNwAW9oEAVRNeO?=
 =?us-ascii?Q?l/o3A6CvBo6bb+a8M89c30LKEK0QTUOGu72GIpd3IXV0siFKSzMig0oyxz48?=
 =?us-ascii?Q?mvVYz26oEqs8fszRfNNNBPfeC+Llm9mF2ZOIrnr4TzYrAFk4owzAaEqpWxxm?=
 =?us-ascii?Q?aJYOLG/Q2zplVRvucR7XxQglnfdw5NMKAr180QpXaE2Ycu1R4SvlKw84ZPV3?=
 =?us-ascii?Q?4svZMUowHCNZEggjeh8RyU5QdfBoDNnQRYI/mKm5jr1EwI409wE1SpxbM+aJ?=
 =?us-ascii?Q?kf5ZzaqDW5ReOKXEmhxGxfk60KAGEMZwF7gIg8Wf/VM+TNpowrpWoTdM9hwa?=
 =?us-ascii?Q?d6bWlGsVBJ4zldTHuXv6QpuFKbwYdVyIEOdCCCCMb9PB8St7ik26xM26w8sF?=
 =?us-ascii?Q?+rCmzDK+Y1Jhr1aHMeUo8qZAFmKBsIRPlIOaYn6fnHSViPkwPMJXU6hDKQEr?=
 =?us-ascii?Q?2CStRuRwRP0gqik9qV9FlJ8pUouofcCTrlNQsz6dTEUizeEEBr0YgGwymBxr?=
 =?us-ascii?Q?YBYov6DNpcvHkt0LSw/X6GcSxoJRR/D3HlOn4xxHgqNJ7KAFWl98eVwiaIQD?=
 =?us-ascii?Q?yekEJa/TQvEry6R3YP2x9e5GNluPdlOU3cQvPutPP8eYNcNH8pnWbRdsV1Db?=
 =?us-ascii?Q?6QvAQIjYSbvlYOAjgg62+I2w+7kdeI8onZR9W4u48P3jcDjrQcmJhjOy+GEq?=
 =?us-ascii?Q?kvsHUcLZsglKP+1imm8duTsmc52B7Piwgv9tfJpVO2078rvAmnXWPmgKLpOt?=
 =?us-ascii?Q?UP5Vr7L0vMpbZbZeOAUP/y5CmUDwBbMqgiQZCRPp2RE/PK5PdyZ9VH+Dkrno?=
 =?us-ascii?Q?PGIhU7UL0v3x+UoMnoGKyRugu5O+2oZLPhDhN2fLfemPjXFAHBRukSnyCv7W?=
 =?us-ascii?Q?D/ARa8xi2Htzmgcqc64ailvD3j22zzH6btjj1hyZ4gLdC5yt/6OJ4J6ruFc9?=
 =?us-ascii?Q?FuMJdKpoYRiVUvrCB68cv0xMe9otZrJXhTzFSIw68W8SDC3hOjSh703O9Lsm?=
 =?us-ascii?Q?Ox+i66rZ0U1Q/aCxEurDpktRTk7U9U+hDpKHzZC1Wf/W/3VZ1cSmF/NmvPe/?=
 =?us-ascii?Q?HAfyM1+ZD0mVfjqjJDBn6y/aJh34x5gWkHZbcRe5TVmps3vPHMaDonZtVuF2?=
 =?us-ascii?Q?vXm5L87+hKNBqQJ8p8NL/hUO6S+FYqQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	bLe0sx5izpsKDK6Upu23IVvqMeKfl16PICUj2IwfVqMYNy6/kfatf/yDCfRvFAprotBbwTkFjOHjqo/oIYEAfsyTMDwNyoGsIVRlUcCSBkMY+9CtEiJISVVzGdnXEB4xayS5uqm+R4bbBLUzv/TvUUu4NvhqQQF2ZKceu67BXOUWbsL1vXX8FTLuVUW3aDumFo02Ph1BmDZE28c2rH5/kxW08e1QkICfqSqWEuIesY3aqetYMr3MgdY7lUC3Vc7GKGW3SQdYxnZ/+cfjlaxhqzu+peQIHmsu495UeQCXMQo9h5yI+GzxQis1isGtslriyCZeYvibe/q6sjv4WhJnIw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0be46dc-24c3-4491-3ee2-08de866287fe
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 09:24:48.1789
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J9KWofvdvRHazBrYCCbGuoMjdCcGHbWaWskZWklX3PHGUG74AXf9Q1WNbgQmw53n1ssXLYqXdrkEigxedh3jUPDsJqYrqhpK7SaRK3ju4Bw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4655
X-Proofpoint-ORIG-GUID: Du7HcjQyKL7QFAXdpSCJopHVAMFe68LC
X-Proofpoint-GUID: Du7HcjQyKL7QFAXdpSCJopHVAMFe68LC
X-Authority-Analysis: v=2.4 cv=fLk0HJae c=1 sm=1 tr=0 ts=69bd1262 cx=c_pps
 a=r4SLCykQvtwIPvheKTZvSw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=O24Aq5uEAAAA:8
 a=t7CeM3EgAAAA:8 a=xoE9N8iQHJ6kS-eyiRUA:9 a=SYBONWESK5muIIdMMRMZ:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA3MSBTYWx0ZWRfX8nBrn/mMmP32
 bt9UC5TmNhVeywNmpHEHM3tJJCtAbkAW4onKTuFXCT0OaGqLg+NlAm9paH3w1DcPQoMWnQpn9xt
 L2RQIT7MJlxCzCZbKQeEBsvbmuIbKClJXr4m7usfuF43iEBqJGMq4NNZMB5LVO5o2O+Lqblswjx
 4ycUI9/AuR6/0L/Jhf6T0QbUvOnULgC3amZFAvL5Mu26HTYelF/sjmYRPy4qx+NE39pMeCz7ryN
 D2Hwb9qjyAzXblSFU47UlPxLf9PEBBKsc8dnr78LfIlRk0cbcYDT/Ev/RLtH3xiwPm7AKpz3t0R
 aFjLZYCnw+5LDE7mUsJpFYg39zxiod1VBIWFGcqHr8EJE/hou1IWR3URndRwb3U01L8B0+i1jZ4
 stExIqk/mGJq5GXUHDhucRxHm6d7BY3XY73rfbFH5H088Lz00bH+IwXt1IinxtPI9VlSOyeyO+S
 u1Ms4qar7acu0xMu1SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-20_01,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603200071
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Mar 2026 09:24:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125428

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Changelog:
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.2
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.1
https://gitlab.xfce.org/apps/xfce4-screensaver/-/tags/xfce4-screensaver-4.20.0

Removed the patch which is no need, when changed to meson.

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
Changes in v2:
- remove useless patch file as suggested by reviewer

 .../xfce4-screensaver/fix-cross-compile.patch | 64 -------------------
 ..._4.18.4.bb => xfce4-screensaver_4.20.2.bb} |  5 +-
 2 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
 rename meta-xfce/recipes-apps/xfce4-screensaver/{xfce4-screensaver_4.18.4.bb => xfce4-screensaver_4.20.2.bb} (85%)

diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
deleted file mode 100644
index eabcaaae69..0000000000
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver/fix-cross-compile.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-It adds '-I$includedir' to CPPFLAGS and adds '-L$libdir' to LDFLAGS in
-configure.ac which causes 'configure-unsafe' QA error. Don't add them for cross
-compile to avoid the QA issues.
-
-Upstream-Status: Inappropriate [cross compile specific]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- configure.ac | 24 ++++++++++++------------
- 1 file changed, 12 insertions(+), 12 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index 6f149bb..3890677 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -237,9 +237,9 @@ dnl ---------------------------------------------------------------------------
- #
- AC_DEFUN([AC_CHECK_X_HEADER], [
-   ac_save_CPPFLAGS="$CPPFLAGS"
--  if test \! -z "$includedir" ; then
--    CPPFLAGS="$CPPFLAGS -I$includedir"
--  fi
-+#  if test \! -z "$includedir" ; then
-+#    CPPFLAGS="$CPPFLAGS -I$includedir"
-+#  fi
-   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
-   AC_CHECK_HEADER([$1],[$2],[$3],[$4])
-   CPPFLAGS="$ac_save_CPPFLAGS"])
-@@ -248,9 +248,9 @@ AC_DEFUN([AC_CHECK_X_HEADER], [
- #
- AC_DEFUN([AC_TRY_X_COMPILE], [
-   ac_save_CPPFLAGS="$CPPFLAGS"
--  if test \! -z "$includedir" ; then
--    CPPFLAGS="$CPPFLAGS -I$includedir"
--  fi
-+#  if test \! -z "$includedir" ; then
-+#    CPPFLAGS="$CPPFLAGS -I$includedir"
-+#  fi
-   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
-   AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[$1]], [[$2]])], [$3], [$4])
-   CPPFLAGS="$ac_save_CPPFLAGS"])
-@@ -264,15 +264,15 @@ AC_DEFUN([AC_CHECK_X_LIB], [
-   ac_save_LDFLAGS="$LDFLAGS"
- #  ac_save_LIBS="$LIBS"
- 
--  if test \! -z "$includedir" ; then
--    CPPFLAGS="$CPPFLAGS -I$includedir"
--  fi
-+#  if test \! -z "$includedir" ; then
-+#    CPPFLAGS="$CPPFLAGS -I$includedir"
-+#  fi
-   # note: $X_CFLAGS includes $x_includes
-   CPPFLAGS="$CPPFLAGS $X_CFLAGS"
- 
--  if test \! -z "$libdir" ; then
--    LDFLAGS="$LDFLAGS -L$libdir"
--  fi
-+#  if test \! -z "$libdir" ; then
-+#    LDFLAGS="$LDFLAGS -L$libdir"
-+#  fi
-   # note: $X_LIBS includes $x_libraries
-   LDFLAGS="$LDFLAGS $ALL_X_LIBS"
- 
diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
similarity index 85%
rename from meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
rename to meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
index 7322dedc29..2033eb082f 100644
--- a/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.18.4.bb
+++ b/meta-xfce/recipes-apps/xfce4-screensaver/xfce4-screensaver_4.20.2.bb
@@ -7,13 +7,14 @@ LICENSE = "GPL-2.0-or-later & LGPL-2.0-or-later "
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://COPYING.LGPL;md5=4fbd65380cdd255951079008b364516c \
                     "
+XFCE_COMPRESS_TYPE = "xz"
+XFCEBASEBUILDCLASS = "meson"
 
 DEPENDS = "dbus-glib garcon gtk+3 libxklavier libxscrnsaver virtual/libx11 xfconf libwnck3"
 
 inherit xfce-app
 
-SRC_URI:append = " file://fix-cross-compile.patch"
-SRC_URI[sha256sum] = "cf717d032d2d0555978c479299da992af6dc3363ae7e758af9515c7166eac170"
+SRC_URI[sha256sum] = "5032f60a31df5e50a80512e301b595be5ea6a6bd762cdd95cacc24cbd29a01d7"
 
 do_install:append() {
     install -D -m 0644 ${S}/data/xfce4-screensaver.common-auth ${D}${sysconfdir}/pam.d/xfce4-screensaver
-- 
2.50.0


