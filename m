Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4BD5C282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 15:29:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.55508.1742225354088524102
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Mar 2025 08:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5171f7bca2=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52H6YaZd030360
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:29:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2043.outbound.protection.outlook.com [104.47.66.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h92722-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:29:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=utHyimL97IwkaxFVOgwcz/csN8IqNALUCncv7qTZYkWq6Xl9gH5fxAvWrr5hR81uD31aP34iLpzuJTnWpNGmrwXPnCbWasj4kZol7Iv3k1r/NNjv1HFANG04+vcGIH1Hq7Hn+Me1y3fwEr0d8UxD/uP7gnO5qk9oKw+c4hBIQzyqwCBRueXo9tDbJrJMrzk5ZavI4dVbFF43xkcoPgG4qXAHTl8L/PKkmw4G6i6oywv6YNeWIQ7LwVwkJ0dIoRPfWgi59ANR/THFhipxJ87bcLuOYnczQkDiQvRskcozJpceKNfjtATY7AG0RsnOLAKic05/H67Qti9F0PzlCynnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgChMhIY88S3S1EcnNnsTu4lM8pZY7LUS2EkDHssSyQ=;
 b=y6uD71O2nXgerJ3TvhmkjuxqruyqqLDH9xJvpWCO7/ZPWN1YF+/jSvpBhvCCUu3MUKeML23U2eG8Lvhu8k/4D1ZFXH8H7WD92kG291nQ/MVTARfUKCBLP3B7N2nlCnAfnJrPQuyMivZLA/ZKldUZ15eiR1gHkAfXvEVCUsoPe8DySc5dMOda09c9hxqf/I7pytgGSYOdKqqLkqYKa2dpA+1nOt2uFQLJga/QAAK9zvhmNhiNEM6DlqmzVsJkhEZ20r49/U3SFVkI7hcg2TtUOfEQdWXWGk7AwPs+e5m1zqcLGDK56mC0eznUvJftZH0c8QokJThYA/1JYyu2NyPXGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH0PR11MB8215.namprd11.prod.outlook.com (2603:10b6:610:182::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 15:29:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 15:29:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH] civetweb: enable packageconfig cpp
Date: Mon, 17 Mar 2025 23:28:51 +0800
Message-Id: <20250317152851.1806625-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250317152851.1806625-1-yi.zhao@windriver.com>
References: <20250317152851.1806625-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0007.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:208::18) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH0PR11MB8215:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f316768-8a6a-4b42-7276-08dd656876a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+cdNgLfmCVpVjMDR9IckPqtM8Aqxqy3Kfz5q83eVsaCAOFFRSrB+Y4xqlVkZ?=
 =?us-ascii?Q?re4jIARbHc5/9Qs0UWcGER8Is/hIpkWl90e3ePKYlNGwh9C7O97aD8Vjlks+?=
 =?us-ascii?Q?OEXu6eSAJ7U0DSgbWdO7SvU7hX/y/wlwmSbb52I3vqJyIYdpvTNcEE4ECXlu?=
 =?us-ascii?Q?UeHI/KR6ajFhNPL7+NJ+DHnKh2bERsYTPK7qB1NIPO66W1lFyzXfx2NNilac?=
 =?us-ascii?Q?OyZrfW7pZEZ41Pg+V2HpQnrfgwVovmEs3v5QZ409H30duR0fGCNGaobUGPZy?=
 =?us-ascii?Q?iiB/5RrtJpS7HfLj823ggPoeKkSrM1HvQ2sqt8jJ6ne2Amq7UWvilpgg9SW/?=
 =?us-ascii?Q?4fL/jUdNTFRmJ1jtCfIzdytIavO4LUA+6rbWwFYfmId7XFqHRN46ZisyD7DK?=
 =?us-ascii?Q?VNtPayIuLiJS8W8sl4XVzJnJujhLh+LSN1z6kAPEugkLsCGvgQMF2QvO/8n7?=
 =?us-ascii?Q?I6t36aAd24eOPvw7qJt3YsbCzYlEl09C2FdvYibOK3zIVG/jxhvoyY2oiuKL?=
 =?us-ascii?Q?6ugaasIc8vbdotNoMGOFUz15sqnwXTSJes2PYu7ydRoRkYPNpklgzQ7maz3A?=
 =?us-ascii?Q?9muv8r8WzSuqf/pY636Yxv+GiTK5QZkjxhSkU1fIG7JcA8fFre/WyM0rDerz?=
 =?us-ascii?Q?infdTQZgn2Q53GLWifLQKXXTxe8toX0wKY/01pQ7Ewv6/YDy++1KIAEwLLmS?=
 =?us-ascii?Q?8hVTSKSpaJNFBtT5cnP+ojhYAMMstjbNp05+pQidm88Q2ThRnCnbRXMU4m4F?=
 =?us-ascii?Q?ZjFvA9axW8GqgdyxZLG1d6zC+IE8m6FOSwX+wmPCcEHABxrZkCSROZZ/ip5u?=
 =?us-ascii?Q?ougop3iVw0NijOTWW8EGzPxsv0ohKbbPdVE+HwBzgw05gweFvzBBO2GGQABN?=
 =?us-ascii?Q?EGcErWqBxsU8UAMt3dFCjBh5cTcLNWnNH5aj7rotHf1dLyVFgtr7Qfo787Jl?=
 =?us-ascii?Q?ici92/wlRWEu/jPbLkg5cxVa0ld8/afEthWCelGO4JLFpo2DneZmZR6TSRza?=
 =?us-ascii?Q?ehFQDyYSejw5bcC6S5pRyHZe8Fj8l5sYQOLqT2+6NDlxqatzkiYkwoEtJ2IG?=
 =?us-ascii?Q?3BApDgbocnik2FJIbIuUg3GsZBuVfKMAznMAGySgundAELVQP02sRLkUdnaI?=
 =?us-ascii?Q?yQIwHgve7U8+Itf/VJttUwJzdrDLdq+7XXwCF2vfOOy4zSFZCtr0a9dx3wYh?=
 =?us-ascii?Q?mpxPtC7xeuoW6pN6L4Sc+xs9rJ130uU8HMJifjv3dki2eyg28H5MkeOdilOY?=
 =?us-ascii?Q?G7/Ku7VZpzGYvSVF7Ts0i7d/8KueFwzgOHfVCTJDEXZlOLl/uRvnP6YNawLG?=
 =?us-ascii?Q?h/zvFflCoP80Zb12wHemXPo/3c7W61RMZlVaWOtiW2w2AWQxacHIxrUYKpEI?=
 =?us-ascii?Q?ueu/iijx8GF878ud6XsTfrgdMQppDEwFARsvSSWZFV4tN9CaJitqAdlsTTJi?=
 =?us-ascii?Q?nRhto7s25JXuqnENE5jJR2XnPyfTCJuh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zWzjlbDkbsI8L5+bxCGh9TrKcLX8udc5FpmZB4zOxLp7vd/Q9ZcUHpUrZz7H?=
 =?us-ascii?Q?E+hRXgzlzsom18r2QFUmtUiGV/zq7NyNPmUMZma+pw7lp+bud0ANsLLn7sbH?=
 =?us-ascii?Q?3mqvRrSIKweR2p88dbFtbiNpm9CaWHXRO6Elb6CMAMZUjHtGQzQVa6gsqR5r?=
 =?us-ascii?Q?5eR0fYPUjWApUwk0PzMvsw3IJPUzy++29EItSRbJUd3GCAztddWyF5+IiAhq?=
 =?us-ascii?Q?pW9c55yeQJJ8jg0bTutyiLOC2FbxH0rn3rRmdaP6T/lLzjpYpFf3h2ISvSKA?=
 =?us-ascii?Q?yCpBXgroSH1aKXCgsRoAGlXbugSVdxS5FAV4g4TpH8cdB1NSNGUBsvAq1MhP?=
 =?us-ascii?Q?rYQWPTwVK5GoqjNdHwQkaMN53fPGREa48LgRTLyj12IuQX78r3e88BZyh+cm?=
 =?us-ascii?Q?uvum5gNyChi9vZ4uaQzPfdOC07KkxU6Semibv5DXO5gxQjRXAoKyBZELPPEF?=
 =?us-ascii?Q?g7WwI/fkkgyuEXBJgPnhYZGJjQEWi1z0yuPobvLSpfz9BvOESqTyHb10IzOV?=
 =?us-ascii?Q?phHy2iue8GwxcXMz+NfreKCRBVdtadv7QZYJBQl9p4JoAxaKe0hsMaYhayff?=
 =?us-ascii?Q?zOEu79kU8SKUT7MxsBffXJCpcXtlsZpNGDMltNk/EQwTj9qPgE3/rUuc6dHl?=
 =?us-ascii?Q?RVbcSkP9fr2qU77G9TPrNNoqaXFJ5Cbc3UemazoLInhSKsakdZmobrnaGuNl?=
 =?us-ascii?Q?j82cr4CJjhb+okW1X5EhKADUdoMf8lDk91z0kocksOwmNPnSoC/kFdRsYZw5?=
 =?us-ascii?Q?3fo4clL3Fpe4VmeU+oMCxj8nkXQNwAof03xfvi6jj5x/d6/3eLovGc7xA+Kz?=
 =?us-ascii?Q?cA/TeimgXTwxllZmeormWm70nExtVwdT1aFPgFjhhO8JCGPkHcUXDNUGVgNe?=
 =?us-ascii?Q?7/kVi6dTJdtuKbt5l/XBCzbhjQ/nTme95YQUxKabGOxxoyXBrr/bHBBNaB5q?=
 =?us-ascii?Q?uGwEgchflLTlr5oROL2pH76ALCuyMfhv7Yd6Kvi9U9TgTXaeoX2DtkJBzO0g?=
 =?us-ascii?Q?zqhaca8VjeEBBH4fUkJFhRiCKlWLtVw/u+C311yl+xU9/zFsIomZHKtBI9yZ?=
 =?us-ascii?Q?MyaX6B7A8pxpnmoF13wo4HWCM5G7gHLETlWowcDps8TEdNX15MbkMq5msKk/?=
 =?us-ascii?Q?PLmmTsT9H5Hwex5/cEPUhUbD582f9sv8H5FNL7wlLYT8VCDKIeYsTJU3I84g?=
 =?us-ascii?Q?/zwce0j6TQJMkBr96FT4d394qvIAFskzs1RHSQCPkxQW+rDMkocl/AZbPpon?=
 =?us-ascii?Q?G1IA3613V2I2fPNCoD8070f4Q51UxkyR7HgU7Q3THm+EKKT4CfXRG3NIG4g1?=
 =?us-ascii?Q?dS+VWlfWrTPY2Zusd2LHhA/0VrafJHmDj/w/KSbgiGItKwiLl2EqB2krjnKX?=
 =?us-ascii?Q?fQdz+bijYr1srS49z6lGp/6/FaS/tLsHyanGqoZcBnJ9KzFUZTfaEIYu/z+8?=
 =?us-ascii?Q?k7nkytMMjnd76VChW1L2xULnlq4IuMPV2gpQFRrIr38ZmNzN7TVUZBLHR2nd?=
 =?us-ascii?Q?2Ik2zwBRDlqAIAgcNrW70taPuSw18UKpWYiYgjb8iIgw0xql6AlNh5vvDMR5?=
 =?us-ascii?Q?xig7rcyp6GZDtYMmGkqgNUrHG+hJ0tzi485cgXQD?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f316768-8a6a-4b42-7276-08dd656876a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 15:29:10.1174
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9o/1/hl484OgcGTIdXv47fgOC0sU6+NjJpsrH0t3v2UfZpyIJOJHv9gFlKkT8AkyCsQJ+4lScUHMnJJpZ77Wqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8215
X-Proofpoint-ORIG-GUID: zK5V07DtysUeb1qepAilbPdKIw-dlZvA
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67d83fc9 cx=c_pps a=TJva2t+EO/r6NhP7QVz7tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=t7CeM3EgAAAA:8 a=7vRF2QlFHoL_g1MCiPEA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: zK5V07DtysUeb1qepAilbPdKIw-dlZvA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_06,2025-03-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=659 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503170111
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Mar 2025 15:29:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116031

Enable packageconfig cpp required by minifi-cpp.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index d061e1a81d..4b08a44813 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -30,7 +30,7 @@ EXTRA_OECMAKE = " \
 # should come from external CMake project)
 OECMAKE_GENERATOR = "Unix Makefiles"
 
-PACKAGECONFIG ??= "caching ipv6 server ssl websockets"
+PACKAGECONFIG ??= "caching ipv6 server ssl websockets cpp"
 PACKAGECONFIG[caching] = "-DCIVETWEB_DISABLE_CACHING=OFF,-DCIVETWEB_DISABLE_CACHING=ON,"
 PACKAGECONFIG[cgi] = "-DCIVETWEB_DISABLE_CGI=OFF,-DCIVETWEB_DISABLE_CGI=ON,"
 PACKAGECONFIG[cpp] = "-DCIVETWEB_ENABLE_CXX=ON,-DCIVETWEB_ENABLE_CXX=OFF,"
-- 
2.25.1


