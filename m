Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC78CA5FCC
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9567.1790856321629847615
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JN80Ub52;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecf4955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:21 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=2Xe71Zxk+0aZPgtvwmSI1jaEMCqnzM09l4/CoC16ac4=; b=
	JN80Ub52k3qly/aW94BDQ8R6EKfUYSIVp/iGpzegizasfPzI7l8b3mBKPhnq2vHt
	b1O1jOI6cPlt3uef4eHWSCK0rS/9L37F4XZGFhCSbi92Gi0hG02aR544a4yj5GPB
	UWHoESQrO9bieS4SHTbateiXdkq6VOmIybTkPuMHO6NmITNeILHyywAoocBDp2Gt
	Kx19PYd+HL0gLAces6EF3xpY4GDOBd40qDt3Cdy6WhNyCButJ/nn8sEdXqSJqBd8
	lMns/wY5hXEgLH50mP5sNXlaOpfbTjho9gKDA9U4YOOeY0d4xBya1LxQWeXlIQPd
	hn8VN1gHTMJbCjgVtDn9hA==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-6
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnEG7JXIf88qQBBiyX5yn1SeCJ6Mepdjk3OOpY9unVKrxGHHltZUPf3X4Ly6YaJRXmkFfArO2ruEFnT8MVO4prcFXvBUhLMUZ/ccf+tvlU1com9wNStFKHkyRGBGQuqgGeH7yN3IkaqsillI7Klo/YHrG3KyyjrAmjZcVIcp6/rS/Ot2yTsDFJ4EU0GrtEpf+3k55tbAPafVk6h4yiaMmz4Y7IRN1lBxVRJWaIJfzcjSrf8GZOCd+/rsun4ZJJzwZqW73EuaKf0Z9DSqGg9nF020m15bBf+WcN7BNV9ih0DGql46H3JwkQ8cmMZhUwhfrbvwRd07ASMYhj1Ppdx5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Xe71Zxk+0aZPgtvwmSI1jaEMCqnzM09l4/CoC16ac4=;
 b=cVeOiGVEy6uaJoiV3el5Mjp+owvJwrUfkfgbE5pCMfm3TKrO1iaB8GhDzrnb0sejcwNy8YgmMhna0rxrGP74FRYm8TE5DBezZOA3yxWgUWXVbdjnplIEhUDAekwIp00B6/eJ730VMgDxTxdYa1YX81eyL0eu5fxjLfgiB1ghdl4AQfrLVUfb6RxECEvpNlsbEOPx7NJEeKjNehddj6i305Fd0tv5/kWadc4ZrLzX2ryb1QfBIerb1B8UTJobqM9sGJ9NaN0w7JKgBnewmdqauFH0i4THAzDUMy6QgbHfsMeBS3tDEvJnwxBdiJBbySPGXG8V8/EG4/Xx69CQVwVfUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:05:05 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:05:05 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 11/11] strongswan: fix CVE-2026-78135
Date: Thu,  1 Oct 2026 17:34:17 +0530
Message-Id: <20261001120417.1280843-12-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
References: <20261001120417.1280843-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0020.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::13) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f2e9d1-c797-405d-66f1-08df1fb439e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|12006099003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	6IsjXIYQ2swJ27BzqS60exvMokYO33L9vnx690JGGraw5l+TInLwQyMKfxGwkohzL4OnCSw9Hh5dcIwu0xP2xKZvbBNoHE1w25jw8LRuqp21DtxeAkhO2GyJRiGANTw5cuXlI1C9gVeswYB7NsPom3LPhw+USaBiPeLhjYU2SwVABwB5kF+0sOCipJ1nDxcqU/cUWjiVV5TYKKTZP6+Zm8UvpvqvF/82KYbCBv7Nr7W4ACW5BE4sLsPvP0hfeFXvUCQ74mkDo6agHf1RIo3fn2Uk/EVnmSMUXWD20Ha7IfUu9m5a1SQPf0towFPjgRwCWN43aPM2oGHVbEsdUbEISX/CMxBOPc+YbCmgap2+whr8x/XwhdDxnr/4j4z+PNrKTrzzc14WyQAh/HyeKL+hEFwitXK/wv7FE+lEentt2I52UGLQXCBf8VMwTyn88cN46/5yA6/1YoJe+O7RFmgn3owWS5J1fn6iuzfLo0u1r8Y5lFPEbTCklXmfZKc8RneO0CAOa8zMoD2fhQ9XcA+0sElKnkzEYBbLd7ptSPGmCtDhV6Xp/jx/xmBbmhSsIqmX8Mu5Lnl48o5J0H9nk1ViGu5rDnFkOPBmeFeQ/vdVcFpmwLcOFagWSGFx+oEHqYpKv/3g3L+2xt3tFiUkkZ+qmNNbLBkATeVg9XBoIc1Suj0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Mhq0ZUZaC+MUGtDjIDIicGenpbeNSv9JlVxiVnXUUkAA7OAtIUkUGmMrd6SW?=
 =?us-ascii?Q?hmTT+YBLg4JhA2lEfbUWQ4o84F57uTEp3ABMJYR9Ac9Ki9gbj7r3//fEUAR8?=
 =?us-ascii?Q?hs7c9yiWfIIBDuWsc/JPx4FN5MCw+Bv5oyqoJu6gLYubQsNrI3O92Sss/wzA?=
 =?us-ascii?Q?ei6FIRawPAwx2jngROMR4aSPAVqTXmbB1rKSIBAmTpvHOIuSuWJcvrf0ZPKT?=
 =?us-ascii?Q?uSJ46vy8uL977iSyBsXl9QSo/gWPjBimsxRHRIyL/UmBEqIdiPrloeGRIpXH?=
 =?us-ascii?Q?REMp1lY/74eJjvvN49Hc9YI5AETKVZ3m5LjpjmdNJGkhg8acSc4gik0XwHaX?=
 =?us-ascii?Q?BJNkvaNCRJey/q8S+GPOSTv7aRl/B+VveKzBjn9jrzUVuJ5VSJV3BwFP9ssq?=
 =?us-ascii?Q?PkOSlBmevRhJM1THYTTdehjyLcrY/EJ0w34mZuse8+JFgY7kQiNZfzrU1DT4?=
 =?us-ascii?Q?o+DlQW8f/PXVmHMUG5LfJPBKr/rxmMoLQLRxJwwoGhQONx93hNPH0C/spt3h?=
 =?us-ascii?Q?Zzs0dO32xFK6+JwybrtFxtrglYXzE3IS1a4Gic5ibkX9qQGEhFHchEUp7ZrW?=
 =?us-ascii?Q?k/lN4GaALr69+gIv8IE7e3jw0SXioodcM+qbYJxcGLnXhpRPSpSBMXlbRA/c?=
 =?us-ascii?Q?vFw0O4lH/J6sWbh1+jXILcLCti2xdFvE8yRESJ2uF92VokSukylVP+/Y9AKv?=
 =?us-ascii?Q?dZgFPRyu+k/W2ADXWAndnAg4B7JfjVGVk7we3ZVmn7Qa7MmU1sfwP+zVrFfh?=
 =?us-ascii?Q?ZLUHzVJlc5IJJ/rSPtLzvTgfN1xiFh3IOtX0wpPIZ+laEYGpRUVidWmgPXPh?=
 =?us-ascii?Q?BURhHvE80t0K6ye518WFUz125ZnN4X2fgOMuQ3t5uPeETM+Wm0QxtvkXZUZC?=
 =?us-ascii?Q?UWxunbcQMkDU1OL4eq7sPTXraugmvLNOzsQxsoekSWPxbdTw0uaVRxmcYI7v?=
 =?us-ascii?Q?Mtj5R5/aRiNHyxO0CKK+1PdgoSQCYtK5Fi2+r9VAR22LdTsC6SzQ5nwvaVSQ?=
 =?us-ascii?Q?UndVBEBPTYAyYQC5EONpuV9HyCWGYW5xm0/TJ4XnZj3PXfvSo0nE7QWQmyfc?=
 =?us-ascii?Q?kZaRx14R4uiEvgzxQ08+poVZuUydeCOE/JYTmEkKlEGIeQfTAXJAuAj4nYoA?=
 =?us-ascii?Q?MXPcKpFbFFxF7oL34UHtvSX8B0pm7WLv4E1i9WRgNW+zDBwq25lt6BSF8rDW?=
 =?us-ascii?Q?tgFUFGPTuQbdO7XGuIXJJyjV+4aRTNnJUDfiZg3vUAos28QjDmYoLpcEvrp6?=
 =?us-ascii?Q?W0U9YNESIk/Qe8CeA67FrkblJojkqERxmQ1V+RklAc+ElvRiuXeOG7FhN3nJ?=
 =?us-ascii?Q?QzjF1qOUXf0PioklkBcp5mfdmYXynAt7dtRL0C3+5HwO2doQ2ayfTPRlqs4L?=
 =?us-ascii?Q?mTlSXfuRz7RTgSetzuOjS8tUcka8X2DIlaOjlTnTv0K1GpjmEXOqR/vzwJIz?=
 =?us-ascii?Q?KAo3ckjyFFweqL04xhfW/R/tXxeijc+DIhxrxj50idkVTZOfSO39IsyG5OKH?=
 =?us-ascii?Q?YaJQ8bBGLHkIyy64PQl4vIQQp5vLrW62d1DDU0FTqIZOHj7zF4zz6rV2kUXg?=
 =?us-ascii?Q?G+dzo+4uYDNtaudjdXc37mdWWt/rLuTJjbL0RYk2XkHuVhvNwR05rVYUokW9?=
 =?us-ascii?Q?CCckUErTHJ+ZB1JgfvBHjetgrZiuSgPIZsNLytjOkM2+OlQa4ZMOONOmpjEa?=
 =?us-ascii?Q?3DVdrOy3TwSdeAZQPdGMyjGhID9ZrwYlb2LB27q/9aVDY7oBDJy8VSK6+tF9?=
 =?us-ascii?Q?SbzWdiA5JzTtsn+5j8p2EjyIpMqPsrzpxZxfsVfCy0bocD3Sl1XP?=
X-Exchange-RoutingPolicyChecked: 
	wfKxWDXF9KWN6jS/GymOWe+XhNmc+B1yBTE4n4lJujEKDVvdt4xMjAGCxMUFeXqhnn7AtECf3rSYteO/mLlPE7ZOtOxKCWx/fIHdWaMWCnfLgrBQEC9bgn2a9Ehy3cvRloM6sKujNYxIo6Hx6mXl9JInhmRHv2MPt4L/yMq7jknQel6fz5yEIdoS1bR/Xg4N3ReRuVsSh3lynkEYNSTPtzfJ/iZcfKh33f7OT3c5zvjqT8Q1e4pVBfzACeBok5nCdCWf0T7yiFXjlWHk6n2l8hMEMD6DyoBSzBHwXSiZS6cTWOcF8Qq6ndYEYcxvoJb3fKgz7B8tDSbNuzHsxFUugg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f2e9d1-c797-405d-66f1-08df1fb439e7
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:05:03.8217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8nlx3p0JY2M2bnmZwcCXleUCmqTxm7AHFcPFyWSKsaYROhrmRTlG0GfNw6uZMdn1IiHuO8JQRz5U7zDRLiXxvjpybezyd+PKZPG4dHAbTplig58DBLHs3KfJym0GFBFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c81 cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=eWDlIGMm-JcpWxJbPyYA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXx7Qh0LpEXyxA
 PYLrX+hBUP5uD71IUshgSUUj/J4v1B6THZbFNZts+h/sFyL8pf3vg93SDPDlh7ZhBiF55EurjIT
 b0gckXyLth34wXp447+NddYQLzFewhEat+WDBonalE39mQ3q7kuw
X-Proofpoint-ORIG-GUID: 5xYOoI1TMPXkoNlRKoRPvWjKX3M8SOJp
X-Proofpoint-GUID: 5xYOoI1TMPXkoNlRKoRPvWjKX3M8SOJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX7S/2SAc7WoTJ
 nazK+M+V5sbpPorjoz1W58qtNZ1UeFWd0o8T/Uy2ihtOOvtxvJXr8dwfyMrBHdTsFk2G4E8m0cd
 NjB/codVM3DLb6+i/BVOlOm5ZFfdD2n/uivHhQvn7Tp8Po0DDF5HbvAAysDOAs+RLX8WckEtXT0
 uJbjK+fX5RfdxT752NHZ248o+g8tyI67bvPDN6gmL1hJTNlfDDxiJxQk+zdWdI8y+eUcfh5fagh
 4Uwua++2PFxOZNWy3KrICftTRSWQ7FumQY1+ZgDRDvbhtR2ItMLzFKtNLZ6nC6KqSQhkZ/9n6v4
 4uubkzp20sK1x4EOwB6j93LNPGWprJsykwRvku28IgkLXUJrGdqQEK+bPUkPB3M6H+e5Lb08sMX
 Z0m5k+lcURebKhFqH4k3LVWkZ9uAvWHLYcUExn0F0TTi3/YmPikJoq/fUcLR46HWaFXbU69/DHP
 4ltMAyaHVgONADFRlMQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010047
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130587

libcharon in strongSwan 5.9.7 through 6.0.7 mishandles the
IKEv2 state machine so that CREATE_CHILD_SA requests on
unestablished IKE SAs are accepted, resulting in an
authentication bypass.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78135]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78135).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78135]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78135/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78135.patch           | 74 +++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |  1 +
 2 files changed, 75 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
new file mode 100644
index 0000000000..69f90303c2
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78135.patch
@@ -0,0 +1,74 @@
+From a34fb034926ccfebe556eb66aae5572a3b0b7e14 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 27 Jul 2026 08:53:50 +0200
+Subject: [PATCH] ikev2: Properly reject CREATE_CHILD_SA requests on
+ unestablished IKE_SAs
+
+The previous check was not actually enforced as long as there were still
+tasks in the passive queue (it was originally added to fix an issue on
+initiators, so the passive queue was expected to be empty).  This allowed
+an unauthenticated attacker to potentially establish a usable Child SA
+if certain preconditions were met.
+
+First, it required that the initiator is authenticated with EAP so the
+authentication and the creation of the first Child SA is deferred.
+Second, the responder must either not configure an IP address pool or
+an explicit remote TS, otherwise, traffic selector negotiation fails.
+
+Note that the half-open IKE SA and the installed IPsec SA will be removed
+after the default timeout of 30 seconds.
+
+Fixes: 8503077175cd ("ikev2: Reject CREATE_CHILD_SA exchange on unestablished IKE_SAs")
+Fixes: c60c7694d2d8 ("merged tasking branch into trunk")
+Fixes: CVE-2026-78135
+CVE: CVE-2026-78135
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78135/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libcharon/sa/ikev2/task_manager_v2.c | 21 +++++++++++----------
+ 1 file changed, 11 insertions(+), 10 deletions(-)
+
+diff --git a/src/libcharon/sa/ikev2/task_manager_v2.c b/src/libcharon/sa/ikev2/task_manager_v2.c
+index 5a19ce85b331..f9e9ab933a69 100644
+--- a/src/libcharon/sa/ikev2/task_manager_v2.c
++++ b/src/libcharon/sa/ikev2/task_manager_v2.c
+@@ -1134,9 +1134,18 @@ static status_t process_request(private_task_manager_t *this,
+ 	delete_payload_t *delete;
+ 	ike_sa_state_t state;
+ 
++	state = this->ike_sa->get_state(this->ike_sa);
++	if (message->get_exchange_type(message) == CREATE_CHILD_SA &&
++		(state == IKE_CREATED || state == IKE_CONNECTING))
++	{
++		DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
++			 "unestablished IKE_SA, rejected");
++		return FAILED;
++	}
++
++	/* create tasks depending on request type, if not already some queued */
+ 	if (array_count(this->passive_tasks) == 0)
+-	{	/* create tasks depending on request type, if not already some queued */
+-		state = this->ike_sa->get_state(this->ike_sa);
++	{
+ 		switch (message->get_exchange_type(message))
+ 		{
+ 			case IKE_SA_INIT:
+@@ -1177,14 +1186,6 @@ static status_t process_request(private_task_manager_t *this,
+ 			{	/* FIXME: we should prevent this on mediation connections */
+ 				bool notify_found = FALSE, ts_found = FALSE;
+ 
+-				if (state == IKE_CREATED ||
+-					state == IKE_CONNECTING)
+-				{
+-					DBG1(DBG_IKE, "received CREATE_CHILD_SA request for "
+-						 "unestablished IKE_SA, rejected");
+-					return FAILED;
+-				}
+-
+ 				enumerator = message->create_payload_enumerator(message);
+ 				while (enumerator->enumerate(enumerator, &payload))
+ 				{
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index aa680d609f..c84b2320ec 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -20,6 +20,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78132.patch \
            file://CVE-2026-78133.patch \
            file://CVE-2026-78134.patch \
+           file://CVE-2026-78135.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


