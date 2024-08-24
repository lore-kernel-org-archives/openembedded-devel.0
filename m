Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8510CC52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 09:08:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.96])
 by mx.groups.io with SMTP id smtpd.web11.9681.1724490478835462939
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Aug 2024 02:07:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=ash7Z6HB;
 spf=pass (domain: navimatix.de, ip: 52.101.66.96, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVCXL/hHemEGuvLQbzCBvuCPYNARReRRIwjDWA7BLOx84VNNne03KB6RxgsL1vM8nhpPJChEVN71+XCXPJL7OdDv1T7UvQYlIYTSYFdh+6FIRt5Q3KCH+lSYEUHI8MFSTGF2AdXldjispAwtP5uGJCQkUMk+Wx2AeZBGHewX9+xODnj59/bRAnOxDF7bWXkHGbEiUYAE5MswEO2vuE5FnBecUvy99TuwnrcM9QrwcjWLMjzocRsqDTejzfuJXhj5BHsqK4m3nYdSnpGGYVrGpBw88HlDXNep3mcffUhpOp3RGdBgCYFmHrvv6KZh1JQthdn1Gfs4TRGUCH8SYfHiBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oRqFdsvfs1rD3/gXIf51MUyrv/xm7DGSMDqA+ZyO/8=;
 b=LN5N/CCy0rBGqO1k8iJhiWI8pAZ4aIQ1FDg65Tw5usVC2omVHuSJKGAQ/L66hDtqRdOqDm765le8l4ag+YbiRUbyTgYclolKdAVbUtkeOt4dtyP/YJ+S6Enf+uIGhdwrJYhBcaKdH8jxm6WL/W2lYtmY8MFg6lwIqe4j994uPkRRgOd35WZdgoipdgrS1XlSUrfJmqnTvyNNMZpHG/80TqAytYfmYLtpGu9sE7XukbyJeTcO2wxmGXz9VeYwSy/230lwVcvOze2Dq7dvGFvsskU1qA5Z9ATmZ292eM0PvcE1Ouz5StHseVQGQGeGUQbEaBa3+2IwK+zYJt4jHdu8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oRqFdsvfs1rD3/gXIf51MUyrv/xm7DGSMDqA+ZyO/8=;
 b=ash7Z6HB9Is33jzL9CIgN9cRdtdqcTe7BGKLIPs2VnKYMrM7DxA5NRONQlmMkA75X8r7G4VJWkQsxo25Vr+YDdXUmNSbsMpCF0RKDPnRDcuKLb74hNVZGva7SUvh/L9nkXquy0gQcybt0B0ViaWjkzEFeUn10hZPtdfCpjJhdsA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by VI2PR01MB11216.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:277::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Sat, 24 Aug
 2024 09:07:54 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%4]) with mapi id 15.20.7897.021; Sat, 24 Aug 2024
 09:07:54 +0000
Date: Sat, 24 Aug 2024 11:07:52 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] bluealsa: upgrade 4.0.0+git -> 4.3.0
Message-ID: <a6ov7dgu6ds23bnhw4dypkuas7llkkfzqisek24w3se7zgmx4v@khhmju2xaecf>
References: <88b75d895a22439a271d83df9e66c7dc2a1e75e6.1724391421.git.joerg.sommer@navimatix.de>
 <CAMKF1soF+xff2H3HZhAa=f9yUN-r7=MkdagH6vC8OEy6-WAm2g@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMKF1soF+xff2H3HZhAa=f9yUN-r7=MkdagH6vC8OEy6-WAm2g@mail.gmail.com>
X-ClientProxiedBy: BE1P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7b::13) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|VI2PR01MB11216:EE_
X-MS-Office365-Filtering-Correlation-Id: 97157462-502b-4c9d-61df-08dcc41c3d06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?G7U0o7MnAD+oBnBz+Y0BQnNb6gtQcejrPbIr5SipVOgKH9b+QMg8fGNsJwWi?=
 =?us-ascii?Q?nIhjVaQtRjYTMkheP5Ed9ncKIOyI0Gxxws6rjEtwTlorxIADIu/bvNieQ/DA?=
 =?us-ascii?Q?1xZ3aPC/wvCkkEaGrcJPbHsR/bYTHofluHnzUhIkV+V1uoH1Q1hOxbdBOwua?=
 =?us-ascii?Q?ThJ7GTCql1h8aJamD9gN5sdbjY0ZNVZTdjAylZzryQDh0fdKn3Piv9DYxDZk?=
 =?us-ascii?Q?JCA4SeRfLOpg8bhpU2MM2h3iDNGilleIjqDArMLFc5nv8WhW1+WQqZ98ToZn?=
 =?us-ascii?Q?EZnN8m0hiYvkrZV2jF/Q4mDnoX1oliiOIXBVwmzhJbc06R/g9aHVTri3/kgS?=
 =?us-ascii?Q?SCpVv2rqnAybfwd0WcRn10T2tLAvk3nKWtHoMd6qldMfq5b0SEDWr7AAJlg5?=
 =?us-ascii?Q?9dpuw+413P706YrSAgrluH8b0QOtcJOlav6CVgIqM/Ts8IFc3zqb+ehPCGb/?=
 =?us-ascii?Q?NJNtGpa0JHvV24jvYdOf0OYxosOd715u1euYuEYUeubG1bXkmtbe5+6W9Z1J?=
 =?us-ascii?Q?5K+9YwNdNbmgJIsyFEohXWw80PihGEUWO+rJ4Ua3lqYqyH61ec6kkihk5Pv0?=
 =?us-ascii?Q?iwgtiHjIyqb9Pvg9Ofqz5ScTWw0Kodfg6NvbguWsAUWnlBdkYjQu+E4fXs7D?=
 =?us-ascii?Q?bHap1zOZBEYUyuQtmwOBvgt0qfRVTOScJEne3uDSJSLAXn4kAWYe6cuuruvl?=
 =?us-ascii?Q?SeCTVer6ReikauSHYfGE//Lb40rrdL8/eXVh584K5h+NB9MXFxAjyyq5om3b?=
 =?us-ascii?Q?Om3twS2emNi4iiaaY6X8+zljctSMHQnYlixONzewfezUF2BavrT9s9KQSvLl?=
 =?us-ascii?Q?8l+O2505pBQ8nYvrG+vfFnIMtcw+yiESdjMBF6nHBKZn3BM+CxJtLsXuUiz4?=
 =?us-ascii?Q?cHKS12TL642TuwwIVufJXPMFBSguCl/CO4oQgTMdfudxLb5L17gSK4YtheE6?=
 =?us-ascii?Q?2spEyCf5kE/5VirpMfbkNI9PdAOlXkrAodldQweQ1pqpbZLotWsgdnQnTmAh?=
 =?us-ascii?Q?wL6B0gqC8poggnJ7+XkqFJ3JJIQN9rpEaolS3YKtZiCKukmQQ3hkKNSoZN7P?=
 =?us-ascii?Q?oDlgfv5XqwD4IF+2rMQjCnp58HHi37S4gkfjS0m6+bfZOXODzMHqmP1pgduq?=
 =?us-ascii?Q?6hOw0Vj67WJPBn4dZaoVjXeaW2J26hWeBHMke2b12gmb6nmkozeIy3nQas/N?=
 =?us-ascii?Q?DwuCmaYIGF3tuWfSWSmuj5X4erDFYgqv8a4RkyVVsBC9qvLsdeELY+i7Z2Og?=
 =?us-ascii?Q?4G9ctNS5vj5pbqm00Frlcka5osawEV3t3c9OA7cLTQFrjdcmxYpPmvrL8rm9?=
 =?us-ascii?Q?BVYGeRRsUBrzvUuqY83/U0iYVIhi6tJQbxf9ht2vTH3pKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Emba7VseSjiF/Kd94baLhlEPptEnL1sQN4T0Bgh5HiPAUCFfhT1cYj+EEf6w?=
 =?us-ascii?Q?7Y5d214G9dFpWe1CXGk1kvTK8STtk1Drab/tUx4OjNfbMPeZGbRi0pf6BA2B?=
 =?us-ascii?Q?wSEOWkIMYGkThzsRqeCfqRX0QAW/NvqeEAh92oOaRIKaC7BpTeB3i1AG8rlS?=
 =?us-ascii?Q?4Hf7HohzwY+5PeRl1fqQ4wvSfe6zPSqBxL2gWuwpg2Xh3ZVn74U4/dqYoote?=
 =?us-ascii?Q?y9nHd1ANVZQpf1ilzPcYYeyoc2VSheMbc2Wl4m7kpdbrRItWM3twLBQ+rBSo?=
 =?us-ascii?Q?lViC7tuwxCApC83sv0hCVBEDokVs5QTxi/OcX3ubCItPIaqo29rwu9F3+j6j?=
 =?us-ascii?Q?bTUffWt7D3KRLxhS8ZAIuJwyEfMcUYDydHADdaklMTHmob3E7r5xJayvzFEF?=
 =?us-ascii?Q?RAhMf1gzSAACummjdIVWN/sR1ztvh+dcJV2vXyxV5adcIOn6ZFs2O+mVnmAw?=
 =?us-ascii?Q?Nde186wPWYdRn9KSX4ei+ukU/QTXXDlyRN2qmEhjfIDECMYLmmB9kCTXABX+?=
 =?us-ascii?Q?CKuWcubd2KxyA0ZRUMPN1u3fmHfZwnhKgEceHbU/smGhAN9h87kpuV8fFYMF?=
 =?us-ascii?Q?2Qj7egfsOvr6odxcHz/5CR5gL/3Tel1Mssr02SJ9dllsMzMxWlkBZtt9Mg+R?=
 =?us-ascii?Q?fhqA4xACpLW61lCDzIOMEcJXJTchpCjtDihSMebZcl5vCm9i+8KKvptabsbx?=
 =?us-ascii?Q?hLmu+J34tG9fJqmlXKsjXluUI+TXrAwOLUnnR1CSMbG+xwXVzu52nqHUUn1B?=
 =?us-ascii?Q?w4R+djJjNRT94FfmBG6/+JNiDZCxCE6iX0UWd3WuEdISEAc14ypPLNsaMIPQ?=
 =?us-ascii?Q?FsYJfBm99xN+W6umRiyaU/AO4orkqW+SCcuJnV6/t7qkvV9ZcBHrKBRwVuZ7?=
 =?us-ascii?Q?q7UpBDCSB7RzzxL02rh6bz8u7qE7FOL6L7pKzypqUrTi/mNGx1vqJdQmclWV?=
 =?us-ascii?Q?eCDVgKaPBQhjxeccGDTZiiAchb8l1CdrNtmwG0pmy4AqYHy++VeZJ45ma7A6?=
 =?us-ascii?Q?gr6UM268hwbGWL1yArEhlZfDZxPZ/envvnTsZwM8htvkTjYRpAjRo6tTmQjN?=
 =?us-ascii?Q?kIZBbUREkY0xLqSG+vdUAxJYgXcQ6+ajgMwOWJcKT6ASqQkZv23wXW+UjC/o?=
 =?us-ascii?Q?rDyV8KLMlTKsv4Q64Om5b4nXvV2t/CI2Xj2oem/qgcCRTc/QJ4IeF09ULtzt?=
 =?us-ascii?Q?nmQmrffm//op4ZzUyOeLWjRFubiIRMzEdDSjGvA/BwLJSmGFZxcl2o3pwq0+?=
 =?us-ascii?Q?aA8wDAK1km0U5KmRtspqVfX3CTE+z9AGN583AYq17788Y7LHhHv7kYZyGJZv?=
 =?us-ascii?Q?VEgDm0Ij1mF0sLWHd6G97mzj6AOFZH5Pa39gFGig8ORWNPVp1jsjf+OlZyli?=
 =?us-ascii?Q?yKHGJuMN5B6zbkFklKJQM6iZzeW5D/YfKbnxwU9KBUutynujaVEMuA2tCrAg?=
 =?us-ascii?Q?oJA5QMtD8QqoFGk4oxLYBNIzCO1/0xdCfbjdQJ99CiuvXPUscOCAiHmHt0xZ?=
 =?us-ascii?Q?XqkQifKfHSx6qeoNA3ltl42bmH5DMbSi1xKmWyZP2f3tBBP7V7g3dIh1IiIr?=
 =?us-ascii?Q?atxFmQBA+oXcyHRsY0JhZcmr5mMhL1+lT7CE9ReZnhgn2EGmJM0OAqqRkbRS?=
 =?us-ascii?Q?OQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 97157462-502b-4c9d-61df-08dcc41c3d06
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2024 09:07:54.3227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WE2Yy5Sfw3TffRXllNPdgp3CkTP6dX2Fi/o/74efgaPjXDur3lg6c87UtJHlyP0L2H/uiFWoFgTisxL1flBz78EA1X96peAzaU20iQsuTow=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB11216
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 24 Aug 2024 09:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111918

Khem Raj schrieb am Fr 23. Aug, 22:38 (GMT):
> This resulted in
> ERROR: bluealsa-4.3.0-r0 do_package: QA Issue: bluealsa:
> Files/directories were installed but not shipped in any package:
>   /usr/share
>   /usr/share/dbus-1
>   /usr/share/dbus-1/system.d
>   /usr/share/dbus-1/system.d/bluealsa.conf
> Please set FILES such that these items are packaged. Alternatively if
> they are unneeded, avoid installing them
> 
> I have appended a patchlet to the original patch please check it in
> master-next and see if all is ok.

Yes, it looks fine. Thanks for it!

