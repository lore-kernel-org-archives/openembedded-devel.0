Return-Path: <xiaozhan.li.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 676ABFAD3E7
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 01:33:18 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3315.1776907986251125469
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 22 Apr 2026 18:33:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AEbTLbZX;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8573f998c0=xiaozhan.li.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N1M6cY2962719
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=dQW/QIweh
	Y5WwOcGPwW/Kps7fXhpaJsC++prX4pqhoI=; b=AEbTLbZXNl25EvWHaokXr0evr
	O1ECqctDXTcPXoOdkvtvGOtJsKC3BPKSyPGd4zaaB7CSpSeAbmpF/+m8vjWBPg0q
	ldfQlzQRrsKHFQdirBBaS6mWLz3gOl2zzDS+CGyPs638TwgKsVFIqg5z4lLXV+99
	Vq34q/SlYalk8BaPEL2fZ5AllLp77AidkzYBbI2wbMWMkxrmga+f6A8simetmTeF
	bpa7Pzw4gc24E01yqmaiPu/aUuFLhfQxpXuZJj6mDqbvaLvbcA1vzVZPj/t4Paco
	P5vRxOQ43U1MVf6d5xcSSsIC5GD1rTPUUOxkZIGsLwKgyzYDeitv836fa1dmg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11011003.outbound.protection.outlook.com [52.101.57.3])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dq8u881hb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:04 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcnAKHSsMAOEuYpSrEslFWfbWq9eziis4HNmFjYpcoiPQXXDyiamwOzNbo3rtxHTmVkbOaw4W6ttW7tZJD9MAQ1RuBYqWskCYJcVnh1/Qlu0dyOyccwqtLbRie53zZ2rXKnb30FBUN4NKbGKpkH/tU4TtBVUQ8wwPkbUWOQH4G4cz2JgLK8JGG7e9ltnjrsFe/EU0+mWi+qbTU6k0per0tEg2wqOIacrpTseGD6LyTguONYiC7HDuQlI5djGJ/xDdZbBUW/JSJgUP2JDsD/63WNGxhCu+nPLEsyLPkk+FFyH+RLtQCzlbNtLSovB9ONwUEpzBI7NlL8VGiilPVm7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dQW/QIwehY5WwOcGPwW/Kps7fXhpaJsC++prX4pqhoI=;
 b=U5yUoX/GBVm7waFyqNHtkKRlONkkT1gmbqRHGzAInjwoPJ9xvzB+CuAKjiUKXyAYKIzAmFtOOv+y3wQv4OW6XOJFXguNPi3Vgs+e/m/NANDzluY7Zz7XDSgql65IBt5Ctq18/7sQR5U0FKraKQEuyJkBUdg/7M+qPAroNpUrvH2wgK06wX6coBrZs0rarb46r8+n01cKUui1pG3TfFikfXSu83pV2VosUej9GBPR9vK7zUxJaxP9AcCbN2j57UFnr7cGS/RtSL9k/KnJk/1VW3NOBjEv/Pf9uPfUaPez9VM6VF0jJMjBmyCL76xx2krenIbOh6Og+gO3VlV+pcdzoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8344.namprd11.prod.outlook.com (2603:10b6:610:17f::13)
 by CH2PR11MB8833.namprd11.prod.outlook.com (2603:10b6:610:282::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.21; Thu, 23 Apr
 2026 01:33:02 +0000
Received: from CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4]) by CH3PR11MB8344.namprd11.prod.outlook.com
 ([fe80::5596:e734:3fd5:4fc4%6]) with mapi id 15.20.9846.019; Thu, 23 Apr 2026
 01:33:02 +0000
From: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
To: openembedded-devel@lists.openembedded.org
Cc: xiaozhan.li.cn@windriver.com
Subject: [PATCH] jemalloc: fix always_inline build failure
Date: Thu, 23 Apr 2026 09:32:50 +0800
Message-ID: <20260423013251.1874006-1-Xiaozhan.Li.CN@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0011.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::16) To CH3PR11MB8344.namprd11.prod.outlook.com
 (2603:10b6:610:17f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8344:EE_|CH2PR11MB8833:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b204866-deec-4946-baf5-08dea0d84283
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	vp5V7nVhhbJIcpW1rFT0Zbz/J/op/zdQKU3cpWQ0UMKqAkvLZ2rDHgRRcAE7ZTU9c3aJxXydXuNSIi3PaW0UWAkVI2BTj9Nif39klCEytdTukzRj+zw9++toYBtEGLPL8Q/LETGigkYk+AD2bHx9JHa6C/F1PbHdPI4liITqN+WA2CBHFwd82qiG35vG9lY1AqWLhtDbxFJPKkRjA6FPdOoSB3Osp1/w9Fffgj9r6SnZHrv/eLuLnexlKwM+qNaSvEJJQRmerfwqT2Vv1LwBfVCbCzYyT+Evgwq9kQTUYnQFm/lJ02c9jgvfCdd51z0oYYodlTq5C5k39fvIPTSGrmK8mpDMACumi5OnMlpSkBLP5QG7NTfWiDoCUncwMaDZ42VkmVfk098x1UmeBQ1fjttVQhW3hGc7V3UwLqN42+tD6DIo9HCynaAeU4XzZo2WtpYdflG+/NJNpQxRhY3n8Y+uBs0wJxQXDyy4VIX2jPih6T9OmCa0L/ggota8HXbDSAeLkCtCe6P30nbDtXUEBZHaEouSO46YWXKiOBtuq97rNLZKJ7vsTmJJsSGWeBwG1OPPXZjE0nJEx/Lg11FAzkOw6JGsswnEx6SpCRLCUghhTYbYCfvGwpuBOeZLQNFAPSN4vByFR66CcJ2yB3MEkSVzBIARhAZyruhbRYG5G/m8FFZQGVErozUF586PSrLiO5Kt4wplDlFtbE2+DYchUx7BIAicL/ORg9TSo7eiDaKAoDExpFxg+PoVqclW+vJrmQN7L+X9Ohd4XGDi8eTRkZeT2A2gBdO90vbHaS+4PWM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8344.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?v3NgzbrPK1lKWifR4gVTguegZt6XhvVHogTFSZZtivz0EjInDCcrr6y8Qy0c?=
 =?us-ascii?Q?KeSvRdscYtWNnr859cjm2Nz1gjVJ4rcKb2RS16Wmlv4HL8juu8D2LEb8/OTx?=
 =?us-ascii?Q?bkCUyHTsfgXj4LW0e34RctLIDCu+aRUAGe8Uqu62xoyBiFOWu/8pHKh5Id3B?=
 =?us-ascii?Q?+FNYmAKKXOOHVHWtly5k3JsoGfKfK3IGycwu2RGKTP033npqEsIZRQ0hseGU?=
 =?us-ascii?Q?c2xwyAuZxzJpAMQxISF6+MQqTYYzkD/VbHRvp7kEnMSpKhIScagjDiKHy7Gw?=
 =?us-ascii?Q?IokBYiwSte+Zu9UAnmyswDMSyHa60fDFulxULYjDbt9U+/8PqIJRXV6dkoep?=
 =?us-ascii?Q?jBJ2lM7hBKgzT+9wR8QpWBrB8uG08WfamGXiuOgfIuFaK3BTvOA+En6eyrSI?=
 =?us-ascii?Q?qWL0oFlXnRN2rdHWB0dObNpt6sBpxZq7lbH0cCsbTzX57l9OJySZriraNpeG?=
 =?us-ascii?Q?BZkz7q1pX3nMQfYs1qdEpTcrhQ9XAVqmvN4Qn87YXsckYLPUMi5iDqkWzTFP?=
 =?us-ascii?Q?sx/qtVe+Z+GvCePZ6V2irp8z0lNsNfzWTJb/LAGaekz4Ujf1hzatSDkEutRr?=
 =?us-ascii?Q?lUJyYOraYetqDLC+MDYY5oAIh7cg4G9ejt7Wz2fJzNQA438NAqioFvDrdCde?=
 =?us-ascii?Q?oE8PdbLNb9nfygD7hDOuYHcRIcA9ZTShDvkJxrpS4bE740JHU9t3rtU1O6Kz?=
 =?us-ascii?Q?3wKZAyd+Tqu46GpMMkK8Bm1pQvd34gVd/bm8J5rJbRp6g+tw/1CjE9Bh90VE?=
 =?us-ascii?Q?gfoB+g1VdifIMnUUv1r3fjf4VnshFX9yn5kvxWz4V7jgONnyD5XLq7/M4gfq?=
 =?us-ascii?Q?xj3mOJqxt9oU/T9uKjZQFbdLMDCkugv79AQzRTaaYUEJ6hJbqSwzs/ZCILSV?=
 =?us-ascii?Q?o/tJfQ/p6q16hic5IDUSLqCfjS0SUKdsXpuD0KXRAw3vG3FMT+Vs/Hy0EQYH?=
 =?us-ascii?Q?JE3zftJBQzplBzNpAXkVxQn3Fny+dXWcbMt5m1vcEhqH6BB8aLHxfaurdviq?=
 =?us-ascii?Q?JyOVVz+osM3qr/ojZ90iqgSIRaqo2k10Xucn2gbcsvO4Dgxeb4gWBFdP082W?=
 =?us-ascii?Q?TcSzuOombxIkFv/bHJ1Tl5Byi2Wxn0jngTxLNiE/C60GLgqOvN9oTN/fLXp7?=
 =?us-ascii?Q?ijzK5plYWrt1tmshdN6kWbtZKAHXsOPYk0TQAge4ljy79ofthVhutRnXBiY0?=
 =?us-ascii?Q?BkuR+hA+4aj6D6bqtHsfh1c5XdOt2hic2ph54VcqshKO0MLoyf4OpYJcA6bJ?=
 =?us-ascii?Q?aL0iCgCssMI1GRwBtMoW6erFDlqNBJhqxqTs6+qwKhhOI7QVDcolv8qG/bQl?=
 =?us-ascii?Q?3cFgqwi1fSB3QapXKjSB2F+4CPDt2ReAQ5vBOFY/ckfIQKHkBa7HefMF3XYN?=
 =?us-ascii?Q?jvjGZ5UetWo0yZbOgWdmF0vt4/ThheqC0hqbCGwqhTp1kpnBOVNkx6q/1Cem?=
 =?us-ascii?Q?5UfmYiPsWRQh8/e5S5dHXo1sXl/vUBN6VR+jhbqBq01J+BkZgQHovR6LFw60?=
 =?us-ascii?Q?91kyNboEXy/1azw4WT3dqoy72lUmf2yZyMhyDN7BuLEnFb8aKPpWqQCWpjGz?=
 =?us-ascii?Q?jNXApTPuvMh6O/dQtMb3fF/FMOOsWcva7X/GPPaLB3gHCPdWvKosqyT0+TEa?=
 =?us-ascii?Q?SosM7/4T2ZKb/mO2SvpCfxXYyTK+a1+NuLUiu933F6L9NdRfac4kqDPBttGI?=
 =?us-ascii?Q?qvMV8WG8LLHAROT7nJ6ruNp0nZPJLhBfU+Zl5y0DMQVfUxKJNs5hYLpBzbtM?=
 =?us-ascii?Q?5iruMU4KOU3PpQjHHml2fV9+NWCdXA4=3D?=
X-Exchange-RoutingPolicyChecked: 
	F+/XpSK14aALSfw7HD047kJ6Sne5pMblrvU/jVDSN1LSIEYr2HLyFtESEDMDcaZD4a7m0e16DBTs4EutP98RT5w8dQ30vbfBqIfB3j0pSZOYrqNjF7yIzVDm8CdeK56CDVnOFNI7hA9xC5uj0RpUL6CqfYkRqNF6xd3V6LxVpgJBiK3VZsN9pM4dOXAQ/rWl3cAwg/sqTrxtswacb8nDYAz7kjJVqU/n9wR8DlxY2jXByuVj0PISZiBaaE5gl6wbcUkb4lMcRdPWw1mlp87hvy+k+kcSaPaK8T7MII5XGB9V7RIwxNH/l1AcGekuSOsiHnEslrsIXpukzEYBqY29QA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b204866-deec-4946-baf5-08dea0d84283
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8344.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2026 01:33:02.5734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OdGQUE2Ik2TXmD18+19+UYzQZMOzk/dcjoHSB3zxFlwHR1qRvBmp2cFgaBJyYP3bRR0Hyz+E2pXzr+dlzng+Z6gHNOxPbUA7Ye+LdP62POc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR11MB8833
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDAxMiBTYWx0ZWRfXz7z0GBYDb6w+
 T7by9tdYT7s9T+91ERHBvSowN+8jYmrFtJ0D/g2E0p0YI87f8ipiA3RSv09MpkKqOWdX6F0SC5t
 dMfb+kseRXAF+IktYsIzY8bk7ZdST2hziXLcOGJOVQE7u8eFgZJHNC3Q0YebG0Ss07j0NoVs2Fu
 WAa2uFjFXsrNpdChsVgQjE1wdSaVKRJrKcG/Q5YULASCcfbTbz6r28rOAiDEEy/a04Oa+hYQH7R
 61XjnMOQE+L1V4JT4biB+JB3xUtTyRv2QnnopWXnpHrVciVmBsP7A8/WkaiDCz7ngGgBL6tVHCz
 1bRiMPSx0w33RAhjNBil8FcOQnYvw6hVEK9OORO5zteoXen5DE8dcvq0yVQ/0zB0bVkauxHwpmr
 W5s+QKfDQwTs7MC2JWlixF0ZVisSZE01x0Ijfhp6YCT92wvXJaxQEgtq384KKTAngMpjtEhqd2i
 S//WOkYw0J8q+AIx7Qw==
X-Proofpoint-GUID: 2gaEgmVr_4gLlywX-pxPq8lc1AuALg9U
X-Authority-Analysis: v=2.4 cv=WLNPmHsR c=1 sm=1 tr=0 ts=69e976d0 cx=c_pps
 a=VrK8WKSpsKTEY/+VWLGgkA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=3IBg_wlri3G4v8povXcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 2gaEgmVr_4gLlywX-pxPq8lc1AuALg9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 adultscore=0 clxscore=1011 bulkscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230012
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 01:33:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126562

Enable debug build flag in jemalloc to avoid error as below:
inlining failed in call to 'always_inline' 'heap_ph_cmp':
function not considered for inlining

Signed-off-by: Xiaozhan Li <Xiaozhan.Li.CN@windriver.com>
---
 meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
index aa1f417604..edaaea26b6 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.3.0.bb
@@ -29,6 +29,8 @@ EXTRA_OECONF:append:libc-musl = " --with-jemalloc-prefix=je_"
 # For some reason VERSION file populated only in tarball distribution.
 # Adding jemalloc version since this recipe is using source code from git tag
 EXTRA_OECONF:append = " --with-version=${PV_LONG} --enable-xmalloc"
+# Enable jemalloc debug build flag if DEBUG_BUILD is enabled
+EXTRA_OECONF:append = " ${@oe.utils.vartrue('DEBUG_BUILD', '--enable-debug=yes', '', d)}"
 
 do_install:append() {
 	sed -i -e 's@${STAGING_DIR_HOST}@@g' \
-- 
2.43.0


