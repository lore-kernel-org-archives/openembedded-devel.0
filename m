Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8210CCD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 03:06:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3748.1778641597035831565
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 20:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b9hOdrdr;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=95933ffc80=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D1cQDj011013
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:06:36 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=omIgAk2tK/HJo9iks8H9
	rdxTsKmvsAlPEGjD1vEH4WI=; b=b9hOdrdrxiCCRNE3MOqGxup6sWIcBQl1dBV9
	+TDLU9s7AJHe9DDFyw4QE1wqE7iuAADLe8FpovK6Mwbg9q4DmJRYAfDBi1J2co57
	LSrOaUY5zyrnP2WkKG8FPp0tqJ1o/xoWVmMbPIlBTXsaTm6jzoNaFdumx3p7kASq
	vJ6uQKIqrcGQ5Rp6Ft+D29Pq9PwfJ5xC/mrG3DIWt2v8475nNCD8wWtTm5vPK9BO
	LtPPP/8UzCuZ5MuGSfgN4uChWre2Coyj3TKOODTIDdkP5/viD8clrTKstZs93UMv
	1eRRI6qcfRlMiZAPPLLkn5dAhgX7uU+I+VNMqHuubyqxncWvcg==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012030.outbound.protection.outlook.com [40.107.200.30])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4e4ftb82un-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 20:06:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eab0r2KOYlh+L/R7mlJ6cKjS9J/d/01eTqG9dfFsQlOnL/99eRtBoV7S8nxHcrfRSz4CGYKq3JGQSowKpBasXnuIiJ9+sEAx6WHBYBetvErJCpFEfYgYXSBEjWDmMdfyVmzY1+Ykn8TklX0v7DqtqPcaKbDkHvf96lB+qUPiefO7B7pPbkbAcB+M9TVVwTUHKkc2aEO2YP27cGDVpM46xVSh6/LrxH4nC0L98X/hYIP+xf5W7+IRD6P2MpDJZn3Iaj7G0i7KzwVcEVG3arPFnQt5YdrXLrctvus1fY/lNY91BZQjNegwKHm06JhhyPuw9QJUestCIge8pPlmz7lkBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=omIgAk2tK/HJo9iks8H9rdxTsKmvsAlPEGjD1vEH4WI=;
 b=JB2a4mh33cz/SvJkaGWqiFNSK/NroZ7GeweiLhJU6xRuW9o1ZhlmY1YxkvDMmPqn2ee8YbOiEtMMFERlfBUJuJqt3R0r0JSBcGJYG88cIl7cYkYBwmD0nbDAdor6u6DUxXUCBNGlQeVwCeDle6V9zGVCHwwzuhi9FP7lbSAaepR9KLnlZGQaOu5ItJMr7M0w6BXIyj7UxcHE8y1PkNCdeY1n+m0BGmVBqMkhLkFFu87TXgLd1UnD9xlB+eZypoUZAez2To6kzF0ydBziaJVhxt1XhWuhWBNoxDbjAkh8pw+NXLMnREDO2Y9nwNCTehqiLtWaD1twvfuDL0IIdonGAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by SJ5PPFC0624F2CA.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::850) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 03:06:31 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::531e:6ef5:812b:48f6%5]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 03:06:31 +0000
From: Changqing Li <changqing.li@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [wrynose][master][PATCH] postfix: upgrade 3.10.8 -> 3.11.2
Date: Wed, 13 May 2026 11:06:15 +0800
Message-Id: <20260513030615.2374667-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|SJ5PPFC0624F2CA:EE_
X-MS-Office365-Filtering-Correlation-Id: e20e7f22-97a3-4cf9-d188-08deb09ca1e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014|11063799003|56012099003|3023799003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	898UjylTFs9wupUVGNwnoOx/w/wBnKkF+xJFmkyTbrH8IzXN88BZt/1mXUEIV8lrF66Gp1Biz4fDP4D8nrThdUZuGwsLQNWIGIsbGbrt6sn/DL0K36HDAETQy4niMXE9H2L8RyAuPE2C0+Z+s6Y1rGB2nkmmlnwGL+68yMq6pjWaVm3yMAfupgClQ4mui/06QaeM+SRSsB08tcUZbUVfKrBcSLTz+hX/ZdhjQXTtq3REWl8TCMZfQhgT9fpXXPS5DmZOnQ4oYK0d/VIb8A3zx/vw25pZURbmIRx1l289R7iUj4oqQH+mrG2IiWVJq4G7smWex2V+QzquB3HRgnO4+HndSTJAmVY4dy4sq5CliDZeJ03cbMwQjao2xW58S3Y7Avyc+MOFMmIMMW/VlJZq0qqJv95yoGu3s5liEetyMaSAhNZeEnhkp+e9UiSdy6MJ6Pt83Edc9g4rjHO4ooWEwFnl6nx9mUvaka4aRisZbBv8Hw0TekzVEdLA/+1Lh2Qf/jlupvHArvBirVHZSAtq+/sZTHO9NmnjkLQFXE8tNHxrErmKjMMfct3D4SNqAzP+xbopE5ap8jkn9J/AOB9LsLtZuquLJt5PAeDPYadsT2ghK4RLoCUcfK25LR5190Dzvm6OeGZnV4k1SBvH+NsDk2UXhypHsPMFRSmv/rWf/H1enA8srwPqBM4TvrIISuXfP1csYSXpdHIO6978lcbDqQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(11063799003)(56012099003)(3023799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8k5BYruR0JeK9/GoCwayjiVkoySP56+SEu0O4PkCWNMFINNUq2vlIpHTuAmh?=
 =?us-ascii?Q?2clQJJBl2IoZT0oTBkY9BPZimknVxV79N8hmyvm6E4ZF2mkUjDyLtVwI1uza?=
 =?us-ascii?Q?hrsRuX3g7M95zr0AdkuLQe8LjBuUNZfNLrYFEk8LAaVXtX8yj/S98Ob0BeMH?=
 =?us-ascii?Q?kZYIjifsFF3PxyBK4PcfeQd/hwos+LYRPteM83BgRcmcH1ztZ+mUoJpLZ9V8?=
 =?us-ascii?Q?PxdzApPFEzvvbuJmav6/RbfkgvFRxko+ifYudB+o2K1IOZoOVl9Skf6j3UBR?=
 =?us-ascii?Q?s4Iysp1elnRHotlobNiM3KeioEfNtFZxcCvsOA7E7vlGz0k2x5KYqTIdzQ4Z?=
 =?us-ascii?Q?lORnMLGX5qII1K2AgZJT/800JxEdU3KxpQLIqehuEfFFeCbnyOuxBhp8Tt+n?=
 =?us-ascii?Q?JZkXuHIdVdlA8hy5xJTN93n87lSAypl5mr2WeR4VyubGXNgFY27zm4LT6JcL?=
 =?us-ascii?Q?LC0w5N+vec9xgDVsEn7S6eYU02zMQe43YXPJVivshLCMCCjN9om4x4JhLxa+?=
 =?us-ascii?Q?R+lKKhvptFsusmkmuJvBPK5HLwIDHLTPo5sFXMU7CfGy/aUc3M42lX60T5Nf?=
 =?us-ascii?Q?YxxHvFlRuedeO9b5ZiUnHwti4/EXQJ2/jHpzQMuNIWho4H9YMQeYwEb9U1ei?=
 =?us-ascii?Q?zcUWsRq6+IKz/smD6Qe7JUMl71Ke9/Oc6iHjeMK039qBctGIrCmzffQ2WoKI?=
 =?us-ascii?Q?pNFzx+EhwzJVyxy2YobmeetuxNq9wjns6D+PCv3G3o0mqm/9BEho8XVX114e?=
 =?us-ascii?Q?IAn9J2UOBHqP32HIswDwBu+Y1FraxkghHfyiyCk8720I1k5JVLgsFf33hggt?=
 =?us-ascii?Q?6RPGkWSnYS2XZOgKopgVfy0fUwXdkhQvZZiVJXFON/mdhrDm+YhlGY3dV/60?=
 =?us-ascii?Q?R34Qp9I//SCmk7Sxl78n6qiFDhXrvTqXmUMif9baz38uj9omil4FtVOqpe1t?=
 =?us-ascii?Q?T3k/ECzhe4dzAImrPfrSMKzZOTPP8NYRagzM31kFMF/lUX5A8gx+piROezBP?=
 =?us-ascii?Q?Etc9x7gOXpe7NLIf0a3ViVgReBTSFltnCeob3zkreCoqnk4IUAyYEWdcxUcd?=
 =?us-ascii?Q?8Kh7VqYiLrxs77kw0Yz5smNXlnwAAo3eGf9UIbR8tWsIVwyK+UelMmzPzUBc?=
 =?us-ascii?Q?2SC0LTkBJmSgvwm/TKacHsX994EgBFKFNHyReWmnhjOqje9ySY0sl3REc5Q9?=
 =?us-ascii?Q?hUf1maOVIImjOWZRzvVyV/Gs6zHCeuSmNXSeSlrY/aDgvTRbrpqZ/ZdoYt2U?=
 =?us-ascii?Q?d001S5CleB+yN7zrHiTEHyQHNGn14iOvu6FzcXm7EGwSTZ73I/33wi5hD8P8?=
 =?us-ascii?Q?7u+1sESxzEtGIX+dIo1MGKEGfQrcjF5iOuLNBuaaxChrsbS7MWIhfhW0sPAQ?=
 =?us-ascii?Q?Xh2cLFaDeZxMYhtCXQ3kle0kWPbLkOlZtoyiIBKH50mCOEcY1yfe7mAWho7w?=
 =?us-ascii?Q?KomildObAEF6rbOc+ub7KyEEkcM7VA6mTEgJDUGdYKJ1nF/nMQS0LVOa1c1P?=
 =?us-ascii?Q?fmtc4gw6ElVcE6RHeIuqSfT1Z42P8tIRnP6ukX66OViPtJTWck5CYy+35R/E?=
 =?us-ascii?Q?3owfHinOrkCpsxGP8rgvkN41hcuXYijVfUkLz508ffJ8J/m9iWavrX4951qI?=
 =?us-ascii?Q?z8dGpnw9Dp6DsvSDlO3/+OFvAQeP804LAee0d+YNtPtWVX0t9OOpxQOQZFrg?=
 =?us-ascii?Q?ATJcoAPZyD3hcflDbHK+2vXO3QIrQ9eDf+tBN/H4SXaIurcOQITtOamhJOVd?=
 =?us-ascii?Q?ZffIeYJncP1m2jxrRK8XfJ4PBVIO3j4=3D?=
X-Exchange-RoutingPolicyChecked: 
	FT+JgLcVeqEJhUsqeGsP4RPfC8PkbMd1DawTXva+m+mpC+ppNjrz1BoTJRipIxN4o/pk5y0P1FTUtXYwjtqkDFg6Zui+BUenpW6WY0tLBG/4s0gbJj+N/pBVemfrPyMPySzRWPNaYSjNSbuvl/xQEKKFyWrzZce5e6AmPY2QtYcGvgoAwiygKV0BQRp5ddVvKSZ8GsCbZtS9bBA//XDLSAsUH/x/MyFFdnw/sw6M+2QS+4JUBNqeBdMnT66EGUaWO1l9gPVkRYqimf0Kbpl0bdV1yWnSyqzgTz7mCbUEREZIAwEvVoP0CD25xv0kJn7Bjrmb9FjjRxjCudZuKTqiNA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e20e7f22-97a3-4cf9-d188-08deb09ca1e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 03:06:31.3110
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KI0bjQHxkijXznSTcKgI5LG3pchVjBmtvXvNln+uom2M8KoYYAC73LyEIWTlnKUItUgFriF9akR+9BNWchWjLuD/nn/Oy00LD0TRJfM90g0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC0624F2CA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDAyOCBTYWx0ZWRfXxUnHVm5kafc6
 nHrSP6ypaOEc/hQhNoE49Bd/P/v+6dNg7Uy9dKY9BKPbyOFkpiCQQxhhvFcUXkwRg2yZze9DAGh
 vnivTbTi1l2efY3BAihmk+HGL/zha4vmReDxCd/qXnoN3jGKZCjiPsGIGAJ8HTPQSBID3etdhR5
 hY3I4N2VVjQvhDf3lafHOfgWSujQa4UfmTVNDivmrwVFxwx+OtVpB/KXVae0iMArDV/4J3xjR/5
 YbAWcsc1y1jnRp/6r7CPwaVa7ztl2qLSAjrjcjiCuKjb1LbTYBHRP49o88aw/x/22x6TUwmkav6
 aqnLiEhxKDHCKB5S2nRhXodBG+SchdgWcChcbGMNRvgg/o0RPgnXdAxRUtcAAlGFc4KVhcFrY5v
 9rThTxgDKjNPk00ag6h6dY69uSNOWo/vIoU1fya0IGOyHXlRyeWejkSMGhmf+yJPCH6ZxTCYz6q
 fESUuDcnLzl9ncBjp/w==
X-Proofpoint-GUID: fsDj9vvTxzDBmFGJZu47x-LqvARmC2u5
X-Authority-Analysis: v=2.4 cv=du/rzVg4 c=1 sm=1 tr=0 ts=6a03eabc cx=c_pps
 a=7AyV/nWbqbi5qqSn9KuTSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=VJYubktbAAAA:8
 a=gmDo1nssAAAA:8 a=Vt2AcnKqAAAA:8 a=e1GkridNAAAA:8 a=t7CeM3EgAAAA:8
 a=omOdbC7AAAAA:8 a=pGLkceISAAAA:8 a=f5588Gt2Gyp9Vg8PkUAA:9
 a=OqWDEjY5HwswFcA5adJo:22 a=DmCNEmdWNTAeIjfGWauO:22 a=v10HlyRyNeVhbzM4Lqgd:22
 a=6ft9yNkZjdd813gQxDxM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: fsDj9vvTxzDBmFGJZu47x-LqvARmC2u5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130028
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 03:06:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126882

* refresh patch to mute patch-fuzz
* Add patch 0001-sys_defs.h-workaround-for-musl-lib.patch to workaround
  for musl lib

Changes:
https://www.ftp.saix.net/MTA/postfix/official/postfix-3.11.2.HISTORY

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../postfix/files/0001-Fix-makedefs.patch     | 25 +++++------
 ...1-sys_defs.h-workaround-for-musl-lib.patch | 43 +++++++++++++++++++
 ...tconf-to-a-variable-for-cross-compil.patch |  9 ++--
 ...tive-compiler-to-build-makedefs.test.patch | 17 +++-----
 .../postfix/files/0004-Fix-icu-config.patch   |  9 ++--
 ...sl-and-lresolv-to-SYSLIBS-by-default.patch | 11 ++---
 .../{postfix_3.10.8.bb => postfix_3.11.2.bb}  |  3 +-
 7 files changed, 73 insertions(+), 44 deletions(-)
 create mode 100644 meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.10.8.bb => postfix_3.11.2.bb} (98%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
index 785fe87452..4e187849dc 100644
--- a/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0001-Fix-makedefs.patch
@@ -1,4 +1,4 @@
-From e4197bc1f431fd7e555a31e6f7f1e020b4ec8f4c Mon Sep 17 00:00:00 2001
+From 51e29c0a1d98948118e5135bb817a96811105d39 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 16:45:54 +0900
 Subject: [PATCH] Fix makedefs
@@ -19,10 +19,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  1 file changed, 11 insertions(+), 16 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index a740e41..28fb128 100644
+index d5103ce..9713327 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -230,9 +230,6 @@ echo "# pie=$pie"
+@@ -232,9 +232,6 @@ echo "# pie=$pie"
  
  # Defaults for most sane systems
  
@@ -32,7 +32,7 @@ index a740e41..28fb128 100644
  ARFL=rv
  
  # Ugly function to make our error message more visible among the
-@@ -563,12 +560,12 @@ case "$SYSTEM.$RELEASE" in
+@@ -608,12 +605,12 @@ case "$SYSTEM.$RELEASE" in
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -48,8 +48,8 @@ index a740e41..28fb128 100644
  		    else
  			# No, we're not going to try db1 db2 db3 etc.
  			# On a properly installed system, Postfix builds
-@@ -577,12 +574,12 @@ case "$SYSTEM.$RELEASE" in
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -623,12 +620,12 @@ case "$SYSTEM.$RELEASE" in
+ 			echo "Alternatively, build with CCARGS=\"-NO_DB ...\"" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -63,7 +63,7 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
-@@ -602,7 +599,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -648,7 +645,7 @@ case "$SYSTEM.$RELEASE" in
  		       if [ `expr "X$CCARGS" : "X.*-DNO_EPOLL"` -gt 0 ]
  		       then
  			   :
@@ -72,7 +72,7 @@ index a740e41..28fb128 100644
  		       then
  			   echo CCARGS="$CCARGS -DNO_EPOLL"
  		       else
-@@ -626,8 +623,6 @@ int     main(int argc, char **argv)
+@@ -672,8 +669,6 @@ int     main(int argc, char **argv)
  }
  EOF
  			   ${CC-gcc} -o makedefs.test makedefs.test.c || exit 1
@@ -81,7 +81,7 @@ index a740e41..28fb128 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -644,12 +639,12 @@ EOF
+@@ -690,12 +685,12 @@ EOF
  		case "$CCARGS" in
  		 *-DNO_DB*) ;;
  		 *-DHAS_DB*) ;;
@@ -97,8 +97,8 @@ index a740e41..28fb128 100644
  		    else
  			# On a properly installed system, Postfix builds
  			# by including <db.h> and by linking with -ldb
-@@ -657,12 +652,12 @@ EOF
- 			echo "Install the appropriate db*-devel package first." 1>&2
+@@ -705,12 +700,12 @@ EOF
+ 			echo "See: https://www.postfix.org/NON_BERKELEYDB_README.html#build-conf" 1>&2
  			exit 1
  		    fi
 -		    SYSLIBS="-ldb"
@@ -112,6 +112,3 @@ index a740e41..28fb128 100644
  		    do
  			test -e $lib/lib$name.a -o -e $lib/lib$name.so && {
  			    SYSLIBS="$SYSLIBS -l$name"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
new file mode 100644
index 0000000000..b7a8e05165
--- /dev/null
+++ b/meta-networking/recipes-daemons/postfix/files/0001-sys_defs.h-workaround-for-musl-lib.patch
@@ -0,0 +1,43 @@
+From ce15792203ae0c787e3602d6d38a892ea1ce31ce Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 12 May 2026 15:04:55 +0800
+Subject: [PATCH] sys_defs.h: workaround for musl lib
+
+Fix musl lib compile failure:
+vbuf_print.c:215:46: error: macro 'VBUF_SNPRINTF' passed 5 arguments, but takes just 4
+  215 |                     VSTRING_ADDNUM(fmt, width);
+      |                                              ^
+vbuf_print.c:132:9: note: macro 'VBUF_SNPRINTF' defined here
+  132 | #define VBUF_SNPRINTF(bp, sz, fmt, arg) do { \
+
+Previously checking condition will make #else branch is selected, and
+NO_SNPRINTF is defined, and when NO_SNPRINTF is defined, VBUF_SNPRINTF
+only take 4 arguments, and cause above failure. musl lib support
+snprintf and we only have glibc and musl libc, so workaround by when
+glibc is not defected, take it as musl lib, and select the #if branch.
+
+Upstream-Status: Pending [Reported to postfix-users@postfix.org]
+
+https://www.mail-archive.com/postfix-users@postfix.org/msg107898.html
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/util/sys_defs.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
+index 1890577..c3527c9 100644
+--- a/src/util/sys_defs.h
++++ b/src/util/sys_defs.h
+@@ -794,7 +794,7 @@ extern int initgroups(const char *, int);
+ #define NATIVE_NEWALIAS_PATH "/usr/bin/newaliases"
+ #define NATIVE_COMMAND_DIR "/usr/sbin"
+ #define NATIVE_DAEMON_DIR "/usr/libexec/postfix"
+-#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1)
++#if HAVE_GLIBC_API_VERSION_SUPPORT(2, 1) || !defined(__GLIBC__)
+ #define SOCKADDR_SIZE	socklen_t
+ #define SOCKOPT_SIZE	socklen_t
+ #else
+-- 
+2.34.1
+
diff --git a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
index d46efb95cb..a74c46fa92 100644
--- a/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0002-Change-fixed-postconf-to-a-variable-for-cross-compil.patch
@@ -1,4 +1,4 @@
-From 953719878466c55572294f42e85127bda5d34999 Mon Sep 17 00:00:00 2001
+From ce8deeaac8ca5d7329e1923790a1f35798953799 Mon Sep 17 00:00:00 2001
 From: Li xin <lixin.fnst@cn.fujitsu.com>
 Date: Fri, 19 Jun 2015 17:14:58 +0900
 Subject: [PATCH] Change fixed postconf to a variable for cross-compiling
@@ -12,10 +12,10 @@ Signed-off-by: Yao Zhao <yao.zhao@windriver.com>
  2 files changed, 11 insertions(+), 9 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a37f89f..17cb64b 100644
+index 8d7501a..d2a85e8 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -22,7 +22,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
+@@ -23,7 +23,7 @@ META	= meta/main.cf.proto meta/master.cf.proto meta/postfix-files \
  EXPAND	= sed -e "s;\$${LIB_PREFIX};$(LIB_PREFIX);" \
  	    -e "s;\$${LIB_SUFFIX};$(LIB_SUFFIX);"
  SHLIB_DIR_OVERRIDE = \
@@ -102,6 +102,3 @@ index 563ee27..00d4651 100644
      "daemon_directory = $daemon_directory" \
      "data_directory = $data_directory" \
      "command_directory = $command_directory" \
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
index 6f8e3e84da..201b4741de 100644
--- a/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch
@@ -1,4 +1,4 @@
-From a8ec63a71361ccd3f6d2959c4c87b7824282b291 Mon Sep 17 00:00:00 2001
+From fc51d9145210350577fdb29a9b0680df779ae347 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 26 Aug 2017 10:29:37 -0700
 Subject: [PATCH] makedefs: Use native compiler to build makedefs.test
@@ -13,10 +13,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 5 insertions(+), 5 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index 28fb128..313b401 100644
+index 9713327..e879832 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -622,7 +622,7 @@ int     main(int argc, char **argv)
+@@ -668,7 +668,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -25,7 +25,7 @@ index 28fb128..313b401 100644
  			   rm -f makedefs.test makedefs.test.[co]
  		       fi;;
  		esac
-@@ -865,7 +865,7 @@ int     main(int argc, char **argv)
+@@ -914,7 +914,7 @@ int     main(int argc, char **argv)
      exit(0);
  }
  EOF
@@ -34,7 +34,7 @@ index 28fb128..313b401 100644
  		   ./makedefs.test 2>/dev/null ||
  			CCARGS="$CCARGS -DNO_SIGSETJMP"
  		   rm -f makedefs.test makedefs.test.[co]
-@@ -903,7 +903,7 @@ int main(int argc, char **argv)
+@@ -952,7 +952,7 @@ int main(int argc, char **argv)
  				  &error) != 14);
  }
  EOF
@@ -43,7 +43,7 @@ index 28fb128..313b401 100644
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
  			CCARGS="$CCARGS $icu_cppflags"
-@@ -1024,7 +1024,7 @@ int     main(void)
+@@ -1088,7 +1088,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -52,7 +52,7 @@ index 28fb128..313b401 100644
      ./makedefs.test || exit 1
      rm -f makedefs.test makedefs.test.[co]
  }
-@@ -1180,7 +1180,7 @@ int     main(void)
+@@ -1245,7 +1245,7 @@ int     main(void)
      exit(ferror(stdout) ? 1 : 0);
  }
  EOF
@@ -61,6 +61,3 @@ index 28fb128..313b401 100644
  	parm_val=`./makedefs.test` || exit 1
  	rm -f makedefs.test makedefs.test.[co]
  	eval ${parm_name}=\""\$parm_val"\"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
index 0660ee098e..daf5c7089e 100644
--- a/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0004-Fix-icu-config.patch
@@ -1,4 +1,4 @@
-From 404150f53bb49af987d7338a808f47fdbd50ba7f Mon Sep 17 00:00:00 2001
+From b63facf538af99e7c79ebee8d41abd52e7d5ee5e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 16 Jan 2022 11:21:54 +0800
 Subject: [PATCH] Fix icu config
@@ -18,10 +18,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 deletion(-)
 
 diff --git a/makedefs b/makedefs
-index 313b401..e5db212 100644
+index e879832..f9c132e 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -906,7 +906,6 @@ EOF
+@@ -955,7 +955,6 @@ EOF
  		    ${BUILD_CC-gcc} -o makedefs.test makedefs.test.c $icu_cppflags \
  			$icu_ldflags >/dev/null 2>&1
  		    if ./makedefs.test 2>/dev/null ; then
@@ -29,6 +29,3 @@ index 313b401..e5db212 100644
  			SYSLIBS="$SYSLIBS $icu_ldflags"
  		    else
  			CCARGS="$CCARGS -DNO_EAI"
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
index 1571aa844d..c2e640d6ff 100644
--- a/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
+++ b/meta-networking/recipes-daemons/postfix/files/0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch
@@ -1,4 +1,4 @@
-From 25e7d1a9bc64f39666eb0e2b9b175773615e28d2 Mon Sep 17 00:00:00 2001
+From fb5b16db0282b5d80edb0ccc6f0f197a7f663610 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Fri, 12 Oct 2018 12:38:02 +0800
 Subject: [PATCH] makedefs: add -lnsl and -lresolv to SYSLIBS by default
@@ -14,10 +14,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 2 insertions(+), 20 deletions(-)
 
 diff --git a/makedefs b/makedefs
-index e5db212..b00049b 100644
+index f9c132e..5ebef5b 100644
 --- a/makedefs
 +++ b/makedefs
-@@ -577,16 +577,7 @@ case "$SYSTEM.$RELEASE" in
+@@ -623,16 +623,7 @@ case "$SYSTEM.$RELEASE" in
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -35,7 +35,7 @@ index e5db212..b00049b 100644
  		# Kernel 2.4 added IPv6
  		case "$RELEASE" in
  		2.[0-3].*) CCARGS="$CCARGS -DNO_IPV6";;
-@@ -655,16 +646,7 @@ EOF
+@@ -703,16 +694,7 @@ EOF
  		    SYSLIBS="$SYSLIBS -ldb"
  		    ;;
  		esac
@@ -53,6 +53,3 @@ index e5db212..b00049b 100644
  		SYSLIBS="$SYSLIBS -ldl"
  		: ${SHLIB_SUFFIX=.so}
  		: ${SHLIB_CFLAGS=-fPIC}
--- 
-2.25.1
-
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
similarity index 98%
rename from meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
index a66ecc0b5d..14fec1b276 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.10.8.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.11.2.bb
@@ -26,9 +26,10 @@ SRC_URI = "http://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
            file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
            file://0004-Fix-icu-config.patch \
            file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
+           file://0001-sys_defs.h-workaround-for-musl-lib.patch \
            "
 
-SRC_URI[sha256sum] = "31d4b3eb8093d823b5a151f571719ff7c0462571bc95e6440d87ca525bfb096c"
+SRC_URI[sha256sum] = "daed65b08c9288cdb386a914f3e52cdddd44935407b5ce5aee8bcc3aa4207778"
 
 UPSTREAM_CHECK_URI = "https://www.postfix.org/announcements.html"
 UPSTREAM_CHECK_REGEX = "postfix-(?P<pver>\d+(\.\d+)+)"
-- 
2.34.1


