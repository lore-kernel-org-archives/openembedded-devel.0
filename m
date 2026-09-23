Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4D05C982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 05:10:37 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.524.1790140184509493795
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 22:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bhGU8Vt3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=372678bdcb=himaniramesh.barde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3xPWN1078040
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:02:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=P9Oakpk+B
	DTr7KymuO0SdL81soQ9ldJPlgb5hp4Wlkg=; b=bhGU8Vt3Rvvkcee70t/S3J89U
	ODxo/uwu1UuXVEY6bggY5SRswrSrHIQY+wiGDQJAQAG9EkN/3qYt5KNPkbaD++98
	so6ibqRPJ3s/pj4xDlihJYmj8o4mwrzTVM1teE9ZljpfbbnRlMVuvjDpLdEYnABp
	e4pBVWobHe8p89XbCRfvDR2bg1ghZ57sN4Vp1HB6CWu6BIUjZPbw6uShmUnCb2jx
	UC2cKjNTQD7TejksLcDMiPup8EJgDSiWPU4uyR5KUteGf3+3br5HhUxGJQcfaGRF
	DtU/H9B0guzrUJGs9RxyoebBD0MeezMX5WSibERMlxaQU+GKDnzI4MSyKyTlQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11023141.outbound.protection.outlook.com [40.93.201.141])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gsnp1dps7-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 22:02:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cZL7tW6IPhAhAVfY5jB8cZHOq43wb84Iz+ecg9PbaxcUX7FYpgqNbVk00K8OtUkvKS642Dtl6oQDTGmBPRTRFlMGSN1w4ktVnzVfWkd4j19iglPo8RPmHaDum2n6fvuLMXG3rvdYDNu/Fn07KHRs9+aqWadODKkbtDIp5V7FpcAfh5Lp3/GHcx76mMk4M4qqJCDQ6JuLZGS2z7wtWIZ/NlHdGm7gyuCeNmM43kL4te0VEjGUEO8hEA5wFecKjTEymNpJpjLzoO8wmxyEX9UnSU+zQysilofXCj2U2yKgS6kiObBX99d9HvZWmfBrbUNzZTyG66HvttQCAqKu2MY9bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P9Oakpk+BDTr7KymuO0SdL81soQ9ldJPlgb5hp4Wlkg=;
 b=dWrZi/p6h6Jzzzlj3KSFWZ7zwMHurlMH7ns+3DVSTJpwpJ7SWNrOifrS2M0VE8+I4AcL7o/nqAJ2GrydZq+ZsQ/YbiDdPy0qK2Pjk0PTlWBZDqJ+waj+o5YuD1os3n+BHf2V9jEK4rfW+Xu60DIyoHsvFKxGSTECipz/LrAwqsiWOKK/2jTRTxX6BjvZuFUtN+Hfgy9ck80WT8ifeYIlbdigkfkSGlADlsIXxT+rxY59RMHuOnmFUz08EEnF3E6zNaRsfdS/tFwMJtWqYpc4Qv+1Xx6ylFBsqlesfi0muV2b0RelJQ5n0SMXTk1LUyxSkP9j05mUmb6sBsCuXfvnJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) by
 PH7PR11MB6978.namprd11.prod.outlook.com (2603:10b6:510:206::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 05:00:18 +0000
Received: from DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340]) by DM3PR11MB8758.namprd11.prod.outlook.com
 ([fe80::a457:7d37:d8f:7340%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 05:00:17 +0000
From: Himani Ramesh Barde <HimaniRamesh.Barde@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: changqing.li@windriver.com, Randy.MacLeod@windriver.com,
        Richard Danter <richard.danter@windriver.com>
Subject: [PATCH] Fix building on Linux with 7.x kernel versions
Date: Wed, 23 Sep 2026 10:29:07 +0530
Message-ID: <20260923045909.1561330-1-HimaniRamesh.Barde@windriver.com>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:279::7) To CH3PR11MB8774.namprd11.prod.outlook.com
 (2603:10b6:610:1cd::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR11MB8758:EE_|PH7PR11MB6978:EE_
X-MS-Office365-Filtering-Correlation-Id: f9c7010c-29b2-4977-bbfd-08df192f88d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|23010399003|366016|38350700014|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	UyAcvJOnU1j6JMMwpvE0SD8RPaKnc18xo9Y+X7NEZJb2HhtTsvR6q9dF1WzIWtrgaMpwB7Mohg1e3VM/HkjTndxWn6aXTSkMhkt3OaP8ypo/PKhBdblnp33Gk1GnRSalsiLQygMf/aOopBjp4EwDkFK2LOPrVbEifFqE8TDDbO/kkgLyl+6Ch077mWuNAv+AqWezIVmA+IlDirPG5bACiPPladf5LYSfFVF6s0HoFKGMTCv4uubl0+d/jrWiUFOHMNKCNP1R4+8NnbrrMLPZsOACLUy3a1y5BFckOObvepFR4GvYSxpkbYeOSfhxK0bXMOlPve9Mellu2YStBR3sPlzW5uYGMJhZh9rg70kQZl3tyWKAizSAmAkvIkO6ivhs0VprBQG1AUFhGYx96RkNaKw6FCV2N4U711xmRhEWDQyOxTDCB6RLe3nQraB1eL+59sgJsLTwHYqhnidxbZ5lRzHXUy7tceehmHJEPbk8Vrthb5GMxmIql4RGHl8i2voOBDoVeMJdSe0ZXzp8JjmDK5SFh9Hp1KIHlyFHcw9XG0CNDzn8ehbDKEUvbrbFbFaazW4dhgfBnUd5Mky5llHRJlgfIfbA/ygtaDs0oUIUL1/QX1tbibYZC+WOQdEyXM4YCn0wT6PnW5WW+JQeyZYTqvuCiJF2XTu93S88MbW9Aa6JqKxz8i8jYjRuuBTAkOOSuAA8bIxEpmgKPE3Q4PD4tbVeY2QH5X+AblbaaQegyBE=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR11MB8758.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EIDnLmf0+NHlR9aTg+gzt0+F7yIGLXAaYg2SjsYBlY9DjqunjVjp2ysPe2DK?=
 =?us-ascii?Q?1eUaSdJEuFuz8sDf32XOyayykCC3zJOMjvJQgG/RlUCdXSwTpyhdfp1yFFZC?=
 =?us-ascii?Q?3aZY12FWEA/WvoMcyGWLUcpBX1WUaJO7Y8eZ1Na3IE1Bf4/yrGyKjwsZHH/6?=
 =?us-ascii?Q?fL9y2U2ne13dD0WwzCtELppLy1vPgMqeUjOUmmY68Bcz6zvfahU2VBP4ENRh?=
 =?us-ascii?Q?185D2S6UdpyxiSydFZ4or6v6TiLVxsOFDo4pvmau5/sthYVh6L1Ee6aldW1r?=
 =?us-ascii?Q?jqyLLrnKNiTc3NwFDlX2NtH72GSqJ/umFwcguFzg3Qew5/fHar2JEGnZCua3?=
 =?us-ascii?Q?8EhB6Y6oBGENIeSJAcEE/7nL7zkyCe3q55MHaRf5xA3AjNeH+N0fn7/e10eh?=
 =?us-ascii?Q?d2Q7pMBBU8bz/AAZ9YmXVnfSRXc9IPCcKli/otMemNlK81Tvb7bkM3dDOeBQ?=
 =?us-ascii?Q?YbuVuYrfg2rhezD2228eCzaqlv4ug3BlqEWmlQmfa1W8p2IRCCw4GPnpDaKL?=
 =?us-ascii?Q?qSPSSeUhPQ9gP2SZthJryUfIR5zKcruWXEsd9wIqklAzvH0QVxDf+cwgyynk?=
 =?us-ascii?Q?myT2Dc6kbWo4qshpq6+auT6n8zAE6+gNn48iMZDmtH7mevjpk8vpp3r0rkQp?=
 =?us-ascii?Q?jJstIkL1emo7pc8cLVrkwpbMZuhxJfqSSu9w2uJ+sfzCr4M9CNCvBK91wMTf?=
 =?us-ascii?Q?AANvQNL0s20+YSIxci3K7mM1nArcwed+qTzNFrSJaI3M3EPQvoMbkKe8fKv2?=
 =?us-ascii?Q?8DiUIlNEs72CQOUxyAD0TqMa2jq+CHtH3Jl+snT95RL/yuq39nkHbY/TUYAL?=
 =?us-ascii?Q?a+ctDo1sYx70yiTrJazXdYZxAROesU/BRsmWfBeZAZC+U5F30pWfWUjq9Rut?=
 =?us-ascii?Q?VHRiRfGHxjAnfWmopwARp7pJGg3APC3atYRWU9r4sv26zXj6M/nSpcMQALaN?=
 =?us-ascii?Q?dBtmEfmNjUpjxO1Bol1dXeKHIweeGyJi/K8drhvbyKbEFhR+jq7RzzmDQJaN?=
 =?us-ascii?Q?YdcSxFYXdSkC9qPM83ohWlu2+WB7Mo/scjFFzicXHV22s1bphu7HOPGckdKc?=
 =?us-ascii?Q?CZdlRFegcho5sUQD4T2vfXPChNQr18eQTBF1E8UxvgPiZkaYobq155xLdt0w?=
 =?us-ascii?Q?2dyQyAX5Wg/q7vdANqnB5e6/fkdGoTGaVN0eBva2k8yober7WVHh1UDNJp9Q?=
 =?us-ascii?Q?F+tpE2GSsXrXM6uYKo+/MnhzPuRZrzMQ/h5hl8BFzFRPeFSR4EfgI1sGrHhN?=
 =?us-ascii?Q?30fJkbQMrrI1MhgW7PhKQJU6bwi+u1djbghxe+qjbuFvZqoATAd/h0BRYvY/?=
 =?us-ascii?Q?4Tsoo7l52ITyW9AOH6lY+1xScBwh6xVCW6mw4YOppAW1osm7kwBqqijYbwfc?=
 =?us-ascii?Q?QmnnTip7qS1zaLZIuloc6GcEKsAKKAWbojvSuSSujahyOE5QhN+FvTZRVTFf?=
 =?us-ascii?Q?Hv9bPh+0MTo8r0iNZxWoXP4X4m66hS8Lf9Xc4Q+rtaUYsktWeyORzpHgZjY6?=
 =?us-ascii?Q?mqoDeD9zJ+pA2K49Z+hga2b/8gAG95AZDvmS9Pgj8psaOAeXSSnJjITHjUDV?=
 =?us-ascii?Q?zymReqPs4sEOD70X8jDN1Nz2XDfqnFAtlpLGdq6N5qQF80xm+bdklJCByHD/?=
 =?us-ascii?Q?AbEumHR2d+7c7fdFP59q6r5QOdyP8B6MpHj95YNThhpEFnLzeun15/f6WPC3?=
 =?us-ascii?Q?rS48bKd7dnpm/qWUN45LKP0isIGWLoXbOMSgPeaA/99kGHsO/Baz7lsT/tWf?=
 =?us-ascii?Q?NmQ0Wp1/4uD1rkb3n3v27BMGJNIH1kdHznmOxA8iCzWLTCiQ4V7j?=
X-Exchange-RoutingPolicyChecked: 
	YccNVabD0ylZ/O91cx1YwrJkezM3jzZe9Cm5+uQfoC0XcrPEyQTmaRab6Gflz/4uruzNae0lBGlz7TrDhc8SrIY3sc8RtnrzfCoT1La7bBkxH92+uKZiB7R92B31ifKp7aLiw+hA6eqXQmG1wbxNyWQ/fUb2oWSgeileyGQFfWES7bQznkpQCGoiAa4uOPhHPZBJRs9UxBIb30IWFTfQuzTjDkxQoEZfiMtOnt2fTjZ0j0DMUfuwjvk9k6P7JLj+kLpU4xR8wZKYxZ5xKm4jeR4MAu95zHsi0Gxwq2+LSodyGs1KmgdBeGnH/tsE6blU/ICAiC0GbdllA0aNa1vREg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9c7010c-29b2-4977-bbfd-08df192f88d9
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8774.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 05:00:17.4309
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ye1CeRY3pjTCGj/3JwawVK/WpZO6lEUeLhHxr0ECq5909TSWkBL7RYuQxC704gQ2xGglrzoCGZgQbBSMxEJ0Po5YzelEFzUR7NH1ruHgjRnrheQL3syo9nu9K7KYoyGV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6978
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX/4N2hzVSEfF3
 At8zZ0NjMG4SAOBq9KmZRe4GoHfw+3WRpPv/iPZJwwObHE/ZltIZnOuJZx4/JxiwQ7/KtmX/RNr
 LIfolZE7aymJWJZn0dhxtuT4K8OJISm/SBuGmWXznyjSc98f1VN367Fq7+lxSP92gfUZIHduiBL
 J075Cv/hIdqpKBlkAqFFrbkspITOHNZDvVqGvwmiAHZByC2YATREeYRxxWgGnZp/OB5oOVd5M+M
 DamOAdRh1sP6GFsznTryIZqpjycsrK2TEKPqZKgPwt3h7Lo7GQ8qkQ4Q98uB8rtR/gRTaMaD6Yk
 AgIgrbPDsbtGNCwnr0eFT3285y+aJunE3jMhkxKXPI9YFYgBhMFRUbgbUQPEKX/ECQL7ml+zfor
 pFwOMLrOIth6wY4Zg3LAZIZgKy/Y8Sj/PvBwLXjrsJ+iuW+iO6N7gPct1ozT8Xr67TuE8ffP0t2
 Fx3QnDMsgRiBILMS75A==
X-Proofpoint-GUID: 5v7Zj7LDxAH4HM-MMCMmTwCTrXwpEtWF
X-Authority-Analysis: v=2.4 cv=V4foQuni c=1 sm=1 tr=0 ts=6ab35d4c cx=c_pps
 a=CCbTjXOBCEiPRml7Y9u42A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=c4KAPD3zgTVIYzGVyQMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 5v7Zj7LDxAH4HM-MMCMmTwCTrXwpEtWF
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxOSBTYWx0ZWRfX1gl54AE1G3F3
 2oqHgumeKx6AJXkoMaQY+UHqCRGx9mYGHkbaEn9Rg28wxABK5l4NnEE2Ry/Jl29knTa7AvfSx5g
 pyrSJ5xHuXkdwEP2W46Z+0GXucij0/r3mnTjuBNRKst6eqZlNR0c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230019
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Sep 2026 05:10:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130183

From: Richard Danter <richard.danter@windriver.com>

Some distros have moved to a v7.x kernel so we need to correctly
handle building on these hosts.

Upstream-Status: Backport [The latest stable version 3.11 already fixed]

Signed-off-by: Richard Danter <richard.danter@windriver.com>
---
 makedefs            | 2 +-
 src/util/sys_defs.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/makedefs b/makedefs
index b00049b..a1af0ec 100644
--- a/makedefs
+++ b/makedefs
@@ -625,7 +625,7 @@ EOF
 		: ${SHLIB_ENV="LD_LIBRARY_PATH=`pwd`/lib"}
 		: ${PLUGIN_LD="${CC-gcc} -shared"}
 		;;
-    Linux.[3456].*)
+    Linux.[34567].*)
 		SYSTYPE=LINUX$RELEASE_MAJOR
 		case "$CCARGS" in
 		 *-DNO_DB*) ;;
diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
index 70aab23..c5472eb 100644
--- a/src/util/sys_defs.h
+++ b/src/util/sys_defs.h
@@ -763,7 +763,7 @@ extern int initgroups(const char *, int);
   * LINUX.
   */
 #if defined(LINUX2) || defined(LINUX3) || defined(LINUX4) || defined(LINUX5) \
-	|| defined(LINUX6)
+	|| defined(LINUX6) || defined(LINUX7)
 #define SUPPORTED
 #define UINT32_TYPE	unsigned int
 #define UINT16_TYPE	unsigned short
-- 
2.43.0


