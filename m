Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0AAE7718F
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 09:31:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.19397.1735205498895690090
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Dec 2024 01:31:38 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090c61c71=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ9LV8t003828
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:38 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2044.outbound.protection.outlook.com [104.47.51.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub43qb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 01:31:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tDa/iRf6bNYR35qk5snusIa5aP4QRC9CO4nhvWxvA4cCw2ayQ0DLNxrogjqflmoRkjK/De8COuwqtnYkXCTpSqZ0xxYpPRiQLJ3HZL5gTEAoiEkf2d+sef24fadv1u28MilC9xUFvO1Tx2zJD4q/4Mw9R0sxlOHUwCAWogri48Cz7G2h0Bxerlir8Mv6PCSScTbzkR3NiCigwaVWUisAqZsgdEmwJc8EmLoeAcRAa0Kf/Q35U0c+CtsVeG4WyuzkorfvceQmGHVcT+AVv8ALeFM2fW9qxOUAYwp7Mo6bT65VofQz+fZN0Q1tiiyTPVi9dVPoC/0HWpavG41agFogCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oxat/CI+3dv9Enb1Mx7RddHCv2XYhE1zuUHeT615VL8=;
 b=ef+DlIxQISxyotAEJYwiO4iTuyk6uBIExHPspZeuJLxtXI+RCSAErCY56p6Q2doQBGP1e0+PKP3H6L6d3KIfrxs71hffXGHFchN5P43u4TywfgN+bCq8Z5VsmT74HEtgOKAnCStgjTupFkjdLXv9cuua+2MKqd6FiVn7ckFWOKihDZqXdsC8kkIO2UM5IvqKxP2/MgZXjU2l9tt+nBcnWz96DOUxB6PgjBooSV6EuNXVXhyNXkN3wXNknm9xQubL7yNwcWpuoKwQ8S49q6UsRSZz2z+v/pkrmyI8HlBBFp91QBJ6JcVExd7WtwjdeD/XqxXIRWb3O+VS2+rf+Nj4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4668.namprd11.prod.outlook.com (2603:10b6:303:54::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8293.16; Thu, 26 Dec 2024 09:31:31 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%7]) with mapi id 15.20.8293.000; Thu, 26 Dec 2024
 09:31:31 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/3] frr: upgrade 10.1.1 -> 10.2
Date: Thu, 26 Dec 2024 17:31:14 +0800
Message-Id: <20241226093116.874361-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0033.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::23) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4668:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ec8adf6-961a-4a50-c63d-08dd259014b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IPkKx6jNIJ2U0PaZ8AL/TmC9Kh3PHTSz7i7W29HBdFrJrArhMePhpX16KHtQ?=
 =?us-ascii?Q?NTa6YxQgb6LvGxFVMK+/nvmRzu3pLlu5p/Gn81bH2+F2olnMbGHBCrRER3gs?=
 =?us-ascii?Q?xina1IVkKjD/nw99G8D3wq2FpLITv9OHH0cxW3epi6y3LVoV3jJwNaOq8FNd?=
 =?us-ascii?Q?jS2vKJdlRkxLdYtMEefIoGKEGYTeXdtHSaht02n+2H1gI/0vyc4vkL0+I88N?=
 =?us-ascii?Q?2gJo3K1T67NYSlTcS2NMphp2pqqTKJ4CPHE1G4Mx6zd3QZJ+B5krBsQFNCEv?=
 =?us-ascii?Q?J5ehpwrWZEpk9LJaCJtK+OpTT8MvLeguHkCeyOw8EJ0yayeu1LmSZjGyHNdQ?=
 =?us-ascii?Q?NvXb80VJOYLB/C6u6Nz+QxmXYDSkxBcZQYiaCCRLEaOfzIYQeqJrREOHv3YG?=
 =?us-ascii?Q?0zfQ7k9O+PiM8wMN1K+JYFJDMYgwk0O/S31218aHbbHzvsKLZ8IjpQlcgg6U?=
 =?us-ascii?Q?U0Y4q2xAvBNoO+bKZak1olnARfHTYw+1aK6Vd+VoqFA3SRsq2ekkwW45SjUg?=
 =?us-ascii?Q?CfbXQeNnS8kVP/jEKNJtUDO+vt0bckA7iIe55c0swjl5uB8Wyc5edkB4sTCF?=
 =?us-ascii?Q?DMHRH0AgNc8DjUlEjLDDQfBs0MAVFhzmx0uNsYNgT0b091mRZDt8Uf2Yshv6?=
 =?us-ascii?Q?I4Qaz+zRwWP8C03aHy7BpSROdbQOarFcHNT3I0D3elfOAmdI41FvpJWTdorP?=
 =?us-ascii?Q?DBtRMLdghvQ3lDpi1B6F+xUvmJYeDs3Da2aNXnLC2m0To1+V0FmlBId1ezjf?=
 =?us-ascii?Q?p0F7Y+JV9rduuGA+tYapSSPfsEAliFbjoUo5+oWQ8EAX4Q0m7L3KndPlJJoe?=
 =?us-ascii?Q?a0iPZ2ZLB0PqIU99lC06y29w6jf59Xw11w7wxX6t6OIY5+ull4yDNczaQCNO?=
 =?us-ascii?Q?uEWCD0SuD/Wp92G2cXfLXkQmUoWFabnDHsdkQh1fiAn2Q7LQfJszttwutQYT?=
 =?us-ascii?Q?lSl7J32NJQOBBmxeei5mWHWccbbfi0HBdw4qVusOxxV9JlPZgc+cU+0rwDpz?=
 =?us-ascii?Q?MxpgPxcn5r/+WXWkpro9XfycrIsQ2D9P/OMgAxyChm8eXqaRYsZkovZDS/kc?=
 =?us-ascii?Q?KzkzN50di1rmQ+nDLDepBA4zssZwGD5IsKiIqPINnSxJRAZbDTrFCcW4Sim4?=
 =?us-ascii?Q?eceeOW7Xb+3OoSyt9mX26D9PlrW5K2vaYe6ksYJ5s9hoSOPR77G20yaKQAZ6?=
 =?us-ascii?Q?s/QvyTcjGgNpqOJykgPqZMF8YFT2AHDXTIQBveNWORmiR+VSOD2lzMNqAvpm?=
 =?us-ascii?Q?LKJm93N1B8IXCh7M/QSoWZDitWbAzgvFfv8KOfd+FP88FRElEQTR0DhsWXe/?=
 =?us-ascii?Q?NOOgkG2dtO4xvlLlNZv7nq+NjP2egc6fbLelnhdo6c6fYpgKt8iRZChal5fL?=
 =?us-ascii?Q?1oOWXqoJmEVoV2apmv9EwFZHiaPNGY+Z/Tl0YzOQw3aUl1v54pClG1pwpF6e?=
 =?us-ascii?Q?VKqwDO89b7SkX9qxfWq6ChSm6o/Fv7iZ?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?I3CA72vRWYOi104oig0FuM2UjA7pl9+u/nlELkoiRae6IU+0TiKqWK4zkx/1?=
 =?us-ascii?Q?LD0t5rPZHpyHcsdDXCUQp3ZtGCTXLtRfWSUeFKtKlvw9rSnUgLC/JyjEjlOr?=
 =?us-ascii?Q?3qmrqrbITmKh1CCrZMp4RtWu6M/9Blm6g+hUCFFAJVK13r8bbcejSEStrGjT?=
 =?us-ascii?Q?pgqpIZOVj1WK5roVWv3zBUL1hXxXLLiI3BRSWEQ0ai4Eva0kBza+0b2MIdV1?=
 =?us-ascii?Q?dWHpgYXmZyn4FVi9DftjkHdFttQ6kDJvAM2Aq2H8dCc6Ia9GD/aTUeRWsDFy?=
 =?us-ascii?Q?/SoNLZC8GBco38rpv1Fw/BdrpbgSjByliSuR+SdzCaWR/mq8IpbodCzqv3KH?=
 =?us-ascii?Q?vdCpa1l0JzL8qjLCWscrXwoLwc2+YepjAJItlLicMt1FaLl5XUSJ/Myghxqa?=
 =?us-ascii?Q?HU9SP3kn5huvkG5xpgHr4ADVjiftNbVWtjPAKXVOJIEFQfgxLh7KpZZsCRnz?=
 =?us-ascii?Q?amKnBMOPePR4/AkgABVn3/1vi7sYaiowpNY1rAdC/7R6JLbhRzbTmdcRgeSa?=
 =?us-ascii?Q?uwT57uEeOrY/LaFrIZ2ipKOlG8lT19y8sGi2pRO8E2cEHyLwWGTRFVZNQEL3?=
 =?us-ascii?Q?uA1Pyzm/CYBez5qlQ74g0xyj+7JWeD9IuZyUrX4AOKayJCli2YSQ4klckBwT?=
 =?us-ascii?Q?Vab2fviunNpVdVcTdhy0fjXXEkx1HZ7Ms0Gfmfl4I/TYNB1r8LCkdBkc/45z?=
 =?us-ascii?Q?uq6SXFBY1Q7CMfnJQ+Qj4EsVpipT5T0QWByPpguEHjRkM4GZeVJ7o/XDt50p?=
 =?us-ascii?Q?dPuStetoHg+y5puYf67uAw4NtrmLYVqX3pNqTXQN7HK5yfOn4eJt8SsKL1e3?=
 =?us-ascii?Q?Mq+ja9UKvr5mTu0RpX5yAJmLtIpbxGu3RgtOcyrVVNoxYxdP4s/RLXfL/zVT?=
 =?us-ascii?Q?IVRA8DEVshsxlfHebflyCv3eHuzlrylcAHReQrpONQfuygaIl7T6qzJ0Wk/L?=
 =?us-ascii?Q?4iM2XadivbTruEXtMF1zo3hpiXtrK4S+elkGaV9dlpLcQ5bovNYCOEw4/y70?=
 =?us-ascii?Q?XKU+oMFJnoP6F9w4S7CQUFWQu7hFa5Yj9f1eKyYxSoLciT0SzOqritc3WASJ?=
 =?us-ascii?Q?i7VSpmtz144BNRqDJ4FgS6Is2hUvkwooHBp5J6rmPEG+4dXxugnfoCT/JfMj?=
 =?us-ascii?Q?57pITf5xZo7NibaoRACxwM41wVfRWhcayoYqPgab6VgT83SkIRVM0y3tnK10?=
 =?us-ascii?Q?LocreEBuSGtpm+audn4/5NTm6BPwhU1T3/RZ4haHbtDgBpm5i+kIFtI+xa7P?=
 =?us-ascii?Q?y9pe86WvuH3oW592efHEot5vF0AcwhqPit6G0Gy30aEv5H3x1vFONefGXO/D?=
 =?us-ascii?Q?3ShwfTM3xEN8kps7dmvmR//rDjGfUd0azXV8qLJ4PoAIBM5G28azXBvOoaIr?=
 =?us-ascii?Q?kIGgd9sQs5P2PVY9hSkvSZJCZZRr+9asaR8/uUeTOpxP8Nr9ec0gAQB46nki?=
 =?us-ascii?Q?iu6dxt9NuRuDnKy9Pi9PcYU7Iz204VSCzTCcjA2pVGDofQdgQlEDIwASgyXf?=
 =?us-ascii?Q?bUz7eaMNhEYAHlMxT0UyTEYB3jJKJxqNNz2TyYE/sm8CFHA4netOElSkiaFy?=
 =?us-ascii?Q?9w4f3foJj6x6t7PkFHso0MHffCVDhFfytfODjgJ8?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ec8adf6-961a-4a50-c63d-08dd259014b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Dec 2024 09:31:31.2319
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlfX5xzkRbvfagJ/e/7xdyIxciNOkeMk9Rfh+1J+U/gYYPF6913Xz6g7Hs8ZRPcEnE/7ziQX8EhxasdcZsgWjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4668
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676d227a cx=c_pps a=E4Q64eWPmlOcdHW0GAz4hQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=XDd9Iwld6xZL9jmLPe4A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: IRGXE9FJuPBrDJidv0aLpr6jA_si5ePa
X-Proofpoint-ORIG-GUID: IRGXE9FJuPBrDJidv0aLpr6jA_si5ePa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-26_04,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260083
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Dec 2024 09:31:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114552

ChangeLog:
https://github.com/FRRouting/frr/releases/tag/frr-10.2

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-protocols/frr/{frr_10.1.1.bb => frr_10.2.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-protocols/frr/{frr_10.1.1.bb => frr_10.2.bb} (98%)

diff --git a/meta-networking/recipes-protocols/frr/frr_10.1.1.bb b/meta-networking/recipes-protocols/frr/frr_10.2.bb
similarity index 98%
rename from meta-networking/recipes-protocols/frr/frr_10.1.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.2.bb
index 237b52592b..06d604168e 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.1.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.2.bb
@@ -10,11 +10,11 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
                     file://doc/licenses/LGPL-2.1;md5=4fbd65380cdd255951079008b364516c"
 
 
-SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.1 \
+SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.2 \
            file://frr.pam \
            "
 
-SRCREV = "dbf8dac1cea2b1235746e2d966a8ded9cffd5dc3"
+SRCREV = "22746b8d59e6e6cb77ced61bc9e0cff2ead227b5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.25.1


