Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5789CA5FB3
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:05:18 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9561.1790856316465585252
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:05:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DPbH7WDp;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=473490b304=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6918Ecev955562
	for <openembedded-devel@lists.openembedded.org>; Thu, 1 Oct 2026 05:05:16 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=wc2XhB5Ew64H3PcFmyZ0W/fUvH5wpN+3yIKG623+g0Q=; b=
	DPbH7WDpApFbE7qLyziLtXcsnV/C0dpjZFF8q9daJaHnp6puOGP6TOAbqOu5hplx
	5rLog775HMKeiq0FmYUG9czcldID19S/D8ymlDcKbzUxEmUVwUyZvCrgiB6SE8Ab
	BlI1z88mdwr0LPxDUEqVsIh8BDMGyYUHpk0hhNnE8cAzAr5QYRM0Y7dxxPXrhsg1
	b3lNpaHzulPfAwvMrLHEU01UKDVFMRAdeWTlP2znsn7DcA4uUy55xknb72XW59sa
	ILBeXR5cJbi7Znmq7O105LoM+42YN5uwgsxobyiy30RUg0bZszyqjlM78WWB74wi
	Wu5aP8s/7zC+Kfk732dYkQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11021080.outbound.protection.outlook.com [52.101.62.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4h1ku8gaqw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 05:05:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qa+ToLt7Qp8RQAXLS0PxRMlQfPBVtp4cDjvt47eqIx+GBG26i47DqkLBRaaisb51ch+38sdgoIpria7pNyqeljvbU7GS7o7NRlOUlkh0ctFvtLZxsbvTjTMvjc532lEsVELKzZjj1pVeQ0Y1owYGoEcGn6zlZEETrKI8u0CvPlzdUJGVg+jSec821Z8LwapBO/j4rcRKLexoQxpvvTQR/LcczNgaBud/3P4922Zw1cmNFRek+VvBCVwZy9AcgflStHOGmVROWWRcgk7PQCUoyQSW/oAPF8wq0sZ+eTHb3K7znYZig1LYgE0Zg93srSkTR1GdmZMa2UV64LMgOEzlAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wc2XhB5Ew64H3PcFmyZ0W/fUvH5wpN+3yIKG623+g0Q=;
 b=w3cQaPxL8sZrUle5hgKHGsInfhg/xwoq89JQZ32OuSG8UDUHf4SawBT9KKrO5G157u6jqxk3JHxJzXomTXFadwqSksIkznh5Ve0xcV8Qv/Y5uyhG4PVxj05rYyzynYJt6wIoic9RXux9NOiuY85urJcoE/v6YDQEufDRgx5spxociHjutWlm21wU//vpgK34rc7gS6C3T9zBIRHu8IS2BCa85RSIPQ4MvSmGl0KwR7GOJcSdxtFrDmQyKDpFfhJO/tEB1sxUNDQswhRR0AKCbi55jpJIGMNL6jgGJrR7t0bGsnt52Hs0Nd+Auf8hyboEGLJDY/0MHDt/cL5zU8xJoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.27; Thu, 1 Oct
 2026 12:04:51 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%4]) with mapi id 15.21.0472.015; Thu, 1 Oct 2026
 12:04:51 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: Shiva.Komati@windriver.com
Subject: [meta-networking][wrynose][PATCH 04/11] strongswan: fix CVE-2026-78127
Date: Thu,  1 Oct 2026 17:34:10 +0530
Message-Id: <20261001120417.1280843-5-Abhishek.Bachiphale@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: a6201c0f-276c-44bd-6e79-08df1fb4326e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|23010399003|260925022911599003|260925021911599003|260925021311599003|10067099003|11063799006|56012099006|3023799007|12006099003|6133799003|22082099003|18002099003|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	zhaVRanpyW7hbOs+lXCHrP047fm4JjayPUkD2POf6j243Y0CPCBw0RICjUkWxKud09aAiVgrc8HgksTqKvp+2STV/qR922cLlPw/+Cl+DNiytVX5k0GYlkPB/bXZN0myPXbfSKHTI/0y/fGx5RAr5rO2HJKicXPXL5sweggszqs8ePmA1jevXD3AdllD5KEsTxREd75jFjdXfRWddqlK5eZ4zL3hVZJxQHbW8GPx0YRzGIdsWpp6Xx+STvc8874YQno6LIKtTThva7qug+exhGGx9QE9ZVGjJYvRTLsB2g1gMWHF+1jnJJdgQIRfK8xVDe6act+SmWeLjnz2eC4H7ZcMUC/X/iH8S1PUoOGahNmagMeo3HUhY6IVjj0JbwusvENBFu2HkgqBBaF9pneCGTEzEpVICl0mu5f40oVQdYV1hMpsfQT7tzjMVwLkH9Bk163cCKEAb4HX+rZFkwMlSYH1v3d8iNwWv1TTlI8C/bfS23dnlS6rSC7V/c1LM5msD+I2UxB41MBfXvY+Qv4zqhlIbR/rxqTCqEKdm/hajh4Y8SXtJoqrlVx1QseFeRuw2iBcdFBJuYWViOOc6mVAXzGSB1etq6xz5Ex7lwdoL1TEgJ/HSLk0s3ol9ZV36G8fID88QDWDENXY8U7Qz1N9mhdAipZ73atUQ9lT8NNrIR4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(23010399003)(260925022911599003)(260925021911599003)(260925021311599003)(10067099003)(11063799006)(56012099006)(3023799007)(12006099003)(6133799003)(22082099003)(18002099003)(13003099007)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yJ2P1ecrsoJv3BfdS4rWukFARZ3zHlz1tcvHp3dA8PlAec0xk45AuBGSGB/H?=
 =?us-ascii?Q?iAQjJUBoF9c07d0QMMfoDclYsBC1c84vVDwJJcMiqLl/uQMziBUyR6SPwGgR?=
 =?us-ascii?Q?4yK8HscCv7wX5eQcKYdxTwfPsCENmhTZByUrGNaB/ufnewi4jOmRQwUiy2Cl?=
 =?us-ascii?Q?X/aORd25NXvF0l9XUBeTWyy9IV4Rc94rvrVskMEyn3baYBK1hBfQQ7OHXmWX?=
 =?us-ascii?Q?4/PHveGw5+2NiaRroxGlyz0QX6zOWlP/flDq913SPy1CWff3MpRk8IoCutMP?=
 =?us-ascii?Q?fNnX87pF6e6bf03hESCCuLyJTyMJxOUpMyAvH+qXSuX3YeJ9P8WQq4O6wa5D?=
 =?us-ascii?Q?VuKOljjPWOOSd9yKhtGSmMLJ0aolKmy4FpHF9Ks2IpRjOlTQkXwHUZqjEn6v?=
 =?us-ascii?Q?KC6m/hfsL+WDxNXe56Yvr1rMW3RIyKFv1SfB2NplMcG0FFktkridU7rExL6O?=
 =?us-ascii?Q?u+90GLBOYeIEwQJpoqG9KfZYOJ5MrMAHyDhO1bNfvid83g8qBsszbct7g7ls?=
 =?us-ascii?Q?lUdIWwDUouE2OAOnXCZo4DdhJh1t9NhI5oq9rlqvTnMDmn56iBO//yoV/kJQ?=
 =?us-ascii?Q?CRucd8Bf2/gX0nieVh5RUPTmgxm5b/eET0vlRG9VLmx7WsbKrGiKLsugBYbV?=
 =?us-ascii?Q?br1OoBE8OJZIH8OFJNQbynZdDw1OzWZbCxGhOP9oIkPN0zI+beaLlJo73Q6v?=
 =?us-ascii?Q?YjP9QT6N77sjtZDK/yBah5i3bzahcFb75LOjIoz5tACpqdwVxZLRWYwpRilb?=
 =?us-ascii?Q?UIVrhaBhR0uCFtCpG6oCfRUtEnhNJVdoLfeRHWTL609OXS3Apc/jDGMZsKz5?=
 =?us-ascii?Q?ULg1yD/2sDHwAqVhB6i9CWVFQ4B57imFF7Rmr70O2VUyUCpUPZzy4ro09oKV?=
 =?us-ascii?Q?tlbXj0p+G4Jj5+knrmwDDOQ9js/7U0KJ/LmHht24i47+8IC9iGv+wSJUfC5V?=
 =?us-ascii?Q?/X8+pHGew1pO/YDoSLMT2x6MlBUJvgdCFD3INQo4HJu9oskq4+M6bdstgPOo?=
 =?us-ascii?Q?BzZ0A3faw9g6VHSIL5He7EgK/CGw0wVAZLOP1x2XfK+NqhTco1S7lRvH1JZi?=
 =?us-ascii?Q?oWi7AVZ5Sl/BRGXWBm7BNiNENBptIwppJorei3E/ODxyr8duugvm2QIoDE7h?=
 =?us-ascii?Q?9ErIAvsF3hkR39TpzIFyIj4RTwf00PszF2EjRptxYSo/aU5PNwcsurrT3Qdi?=
 =?us-ascii?Q?CKKM8yvy0QqDOSkFibRCmc5NUrWzmj2y0xy8pWpwNpRMss8qV7x7R55cS4FM?=
 =?us-ascii?Q?nlmEVSIuz2M1fKmYTvVSZq3KFHLlD9d30Jx5feNEDl44wDyosaOZz0mi4vpY?=
 =?us-ascii?Q?8o9AgOLFvUQqcOHmmBaCR9/XSVYjae1GczPO+8CfKUzpi/SjUY2CkUp6fUOY?=
 =?us-ascii?Q?fGmvmycxF9QvH3deIl91uSDdmG0qYkN2zTnrnvHcNZJqwpGLGFm7uqsJZ2fJ?=
 =?us-ascii?Q?cVen3gk3kZhs2kwbgSVXYDZeoMT7fFHag/xwIXWp9uYngzO/rO/AQOkWwSp8?=
 =?us-ascii?Q?k18JUGQb4t+HD66dOw8aDamvNhjcG3Fvcos89+G+CjG71H5g5XF6tS2iE3z5?=
 =?us-ascii?Q?JQEW88mHzxdESh9YhPfw7IgQQkzK0gqDK1rePXWo6ciIBI4aYLpy44DK5jzX?=
 =?us-ascii?Q?mvFAyREbQ9+LjdcuXX+k8eCXffllMME9MIx6dr4YDrzKIDFMWn4XNI8eLknD?=
 =?us-ascii?Q?DRIwnvTcFVTmbNROSOcgMjGNM75GKyLYCa3PFRV7dVTjJbWSyl1Wa6QUjojm?=
 =?us-ascii?Q?DD8uU3R+K7+9Jnwvw6qjGAA2p+NUiKYBCJ+vWc6HAuzclzveTZiG?=
X-Exchange-RoutingPolicyChecked: 
	h43DzGDFC85TvR01p+aLGDlj4bn8jYkLn8iBNKeolTKLHA60Vu0fFSRpmwSFRTp1z0oatxDTyXsTilYmYCkORlepLy4Fgtt0DXuU6pNzFuqag+xi1g3C7A5xSn66HxbQfbLwuSWzThKrWPKQnEr2w6H4DV5XoEbpD+MfJhKrWrsYDVoQXhsXpYx/gVokwFRITtjHVoRKrfJX/j1l7X9AgHfpEK69Y7oeQToeZRsPq6IeHw8RpNJLa8LQ92tLn2DNc3lfzIPK7Vnl3nCh+Exg7XsWnJ9RqQxf2cqSAV6fPJHW6NDzQnzElmT2UtoAZxFloOsisPjNlIi0Ea2KCVp0Fw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6201c0f-276c-44bd-6e79-08df1fb4326e
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:04:51.3062
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CzJeZb9aCtW76cyHgnaMX2LMlI9urbiD/vCNLJXYkSeczzkH0d78mUrCf1VtDRai6oLNh4IfqmN5Tb1qn72pkKbiAhrluq7wvcDr84AHrzhpB5GgYXL34/f5iXi1dQ2I
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
X-Authority-Analysis: v=2.4 cv=c8Q+0h9l c=1 sm=1 tr=0 ts=6abe4c7b cx=c_pps
 a=rDyEm/81vvKQCy/iKDMZrQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=PYnjg3YJAAAA:8
 a=KiMCiSwjAAAA:8 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=2VWBBesWaoQ5tO3Fx5YA:9
 a=sPCYT0qwnquSfqsKqTDE:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfX8o07q/5ofWso
 MeRWMR5ZOBo8ezYQ0o+YvU9Exq9ZrTZ2UNo2RuVR9m5Cbj2mBIl4FGQfu4Q19Z4m0CTy/jZMW8s
 8JL8NPYoiQZwSletx63NAIwGJ3iD7QxcEuc91EM0wbK6A3lV/E8Y
X-Proofpoint-ORIG-GUID: 0AuAFuRQmsbRwTI0kB3TVPbKeMbjTOXC
X-Proofpoint-GUID: 0AuAFuRQmsbRwTI0kB3TVPbKeMbjTOXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0NyBTYWx0ZWRfXyi3bSDj9EjR/
 ASbwfNQMXdECGWUhmc8GBEG6WJ6mEeo2IdFiL+NKEX5+C6G7AKNZR3KlntQdL04XDUQvBvnldb2
 hPv4GFX5j7FpU+pb+4KcBFPmOT44xRKn60R8ld70hcCy3A+1DGQqi65AJ1DwaM5jqgh3Z/nMNSy
 fhrKmN+E1u+aMbv1+GaUOQW1t56nyub6rtSZ2tHkV7spnwNecWyJgOT5D9IBSZ97SoTL8rAeK+m
 reHZ5TkomfZuI2bTCSoO0UG+QFOtX41sEewh4BwGm3d37P7Y+df/FnkhJCQoZdtKqPDLLxGuUq8
 xddi5qIUxtAtU5AtnoPSJZQyWcyt1P0hfUG3G6O93qU7R6bosOLO0sbsULEtkPODKPkhPkhpcpJ
 bnC0iyyHE/kTPSUUx94eHEg14U3RXqVC4iSZOc1fzuWP7EkGtgf9yCFHhBwjYw1mECzWDHPTzMS
 W5Ev2pFoVSwmlLJenHw==
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
 <openembedded-devel@lists.openembedded.org>; Thu, 01 Oct 2026 12:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130582

strongSwan (since 4.1.2, through 6.0.7) allows a denial of
service via memory exhaustion in libcharon related to the
logging of IKE messages.

Reference:
[https://nvd.nist.gov/vuln/detail/cve-2026-78127]
[https://www.strongswan.org/blog/2026/09/07/strongswan-vulnerability-(cve-2026-78127).html]
[https://security-tracker.debian.org/tracker/CVE-2026-78127]

Upstream Patch:
[https://download.strongswan.org/security/CVE-2026-78127/]

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 .../strongswan/CVE-2026-78127.patch           | 117 ++++++++++++++++++
 .../strongswan/strongswan_6.0.6.bb            |   1 +
 2 files changed, 118 insertions(+)
 create mode 100644 meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch

diff --git a/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
new file mode 100644
index 0000000000..a667b57556
--- /dev/null
+++ b/meta-networking/recipes-support/strongswan/strongswan/CVE-2026-78127.patch
@@ -0,0 +1,117 @@
+From 1d758b2cd2f13af02319274c4e48cd7a2dc62e42 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Mon, 8 Jun 2026 09:19:42 +0200
+Subject: [PATCH] message: Avoid memory leak if string buffer for message is
+ too small
+
+This leaked 40 or 80 bytes per parsed message for the enumerators that
+were not destroyed.  While triggering an OOM condition will require quite
+a lot of messages and the DoS protection also helps avoiding that this
+is triggered quickly, it all depends on the memory constraints of the
+system and the time available to the attacker.  Also, if IKEv1 is allowed,
+it could get quicker as the lack of message IDs doesn't allow dismissing
+unexpected messages before parsing them.
+
+Fixes: 092958c89d52 ("fixed payload debug message")
+Fixes: 6a4a47511f75 ("Show contents of the CP payload in message_t stringification")
+Fixes: CVE-2026-78127
+CVE: CVE-2026-78127
+Upstream-Status: Backport [https://download.strongswan.org/security/CVE-2026-78127/]
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+
+---
+ src/libcharon/encoding/message.c | 23 ++++++++++++-----------
+ 1 file changed, 12 insertions(+), 11 deletions(-)
+
+diff --git a/src/libcharon/encoding/message.c b/src/libcharon/encoding/message.c
+index 8da9a1d71e47..a4bf9cb26b73 100644
+--- a/src/libcharon/encoding/message.c
++++ b/src/libcharon/encoding/message.c
+@@ -1398,7 +1398,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 						   payload->get_type(payload));
+ 		if (written >= len || written < 0)
+ 		{
+-			return buf;
++			goto err;
+ 		}
+ 		pos += written;
+ 		len -= written;
+@@ -1424,7 +1424,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			}
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1454,7 +1454,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 							   eap->get_code(eap), method);
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1495,7 +1495,8 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 								   attribute->get_type(attribute));
+ 				if (written >= len || written < 0)
+ 				{
+-					return buf;
++					attributes->destroy(attributes);
++					goto err;
+ 				}
+ 				pos += written;
+ 				len -= written;
+@@ -1507,7 +1508,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 				written = snprintf(pos, len, ")");
+ 				if (written >= len || written < 0)
+ 				{
+-					return buf;
++					goto err;
+ 				}
+ 				pos += written;
+ 				len -= written;
+@@ -1529,7 +1530,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			}
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1544,7 +1545,7 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 							   frag->get_total_fragments(frag));
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+@@ -1557,16 +1558,16 @@ static char* get_string(private_message_t *this, char *buf, int len)
+ 			written = snprintf(pos, len, "(%d)", unknown->get_type(unknown));
+ 			if (written >= len || written < 0)
+ 			{
+-				return buf;
++				goto err;
+ 			}
+ 			pos += written;
+ 			len -= written;
+ 		}
+ 	}
+-	enumerator->destroy(enumerator);
+-
+-	/* remove last space */
+ 	snprintf(pos, len, " ]");
++
++err:
++	enumerator->destroy(enumerator);
+ 	return buf;
+ }
+ #endif
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
index 43be8b287a..2ad92d3d97 100644
--- a/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
+++ b/meta-networking/recipes-support/strongswan/strongswan_6.0.6.bb
@@ -13,6 +13,7 @@ SRC_URI = "https://download.strongswan.org/strongswan-${PV}.tar.bz2 \
            file://CVE-2026-78123.patch \
            file://CVE-2026-78124.patch \
            file://CVE-2026-78126.patch \
+           file://CVE-2026-78127.patch \
           "
 
 SRC_URI[sha256sum] = "07df7cedae56a7f3bb07e66d21a1f9f87e961db70e99184e11d3819413e4f87c"
-- 
2.40.0


