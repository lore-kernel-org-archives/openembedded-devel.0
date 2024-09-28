Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1530CF6497
	for <webhook@archiver.kernel.org>; Sat, 28 Sep 2024 09:34:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10469.1727516053805735966
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Sep 2024 02:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=900161c346=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48S9YBxN002547
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:13 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2169.outbound.protection.outlook.com [104.47.56.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41x8s889j8-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gmqRPcdIV+q+apEwXL8szEhrpC5xu2fHXQ8Eni6/86QA9jZU0symfQcJUozkCp9RBkn1S+eWpQIR74BXUm3Uir9QHYPIA0vAPohQjTDj+zk349W/982ozwRpnlkRChtEUfD/e3reZT/YKIQfCAlZGRYKatLYaXIDtQqRiVcLNsVnWIhZgDYHvIXipyAtfkeNp9hPpensD+tajNWgI7swtn2THMhwITBXKcEDi/+35glb0PxR/Oj0PWJXJ2SSrRxrCws90yrsovE7mzH16obJy8T+5hAUHpMeDIvPcAiqMZ56Aa2QkvWIj/c1WTw81hkhT3cFsuued4v5g77diufEww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0j5KBtaGZB79ti8JmOiV433bTwZYq9YSCAKv4PJCkyA=;
 b=vFtFi0KtwrkqYOq1iHdELy7A8uKLUmraJonHFPgLNnp6b+VXcvPCOjXiKTD1NR2srITayJihBw5nEqj7A/INdpTHBgyqlTLLbPNqwn2A5pSZDl3DPgNv0RLv+K+FJse0ff0FWgebJkwUpO/5YMi+mhsN2XQ7oPEL5TT0OjYyqxfh9jHXe6lhD2a41kiqm3V3DLpQcMjA2I5MIFk9+DsGYKC8OvcJDB7y1BkGQCjUIMDhNlxFBA2S+o1I1ZDr8UmUetsN1Dt4dF4NYWd1pkRMEOFsD5+F1peQ2bPvrvMNR72/sqOOBI6Ugox3jPelQAwmYvwOQoIhzLP9IK9/6UDL+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB5876.namprd11.prod.outlook.com (2603:10b6:806:22a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.31; Sat, 28 Sep
 2024 09:34:10 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7982.022; Sat, 28 Sep 2024
 09:34:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/6] catch2: upgrade 3.7.0 -> 3.7.1
Date: Sat, 28 Sep 2024 17:33:54 +0800
Message-Id: <20240928093356.3992191-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240928093356.3992191-1-yi.zhao@windriver.com>
References: <20240928093356.3992191-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYWPR01CA0003.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::8) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB5876:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fd3d9db-e8a7-4352-a22e-08dcdfa0b4b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?O5rGotRi5E5lyZr5lk0dazDMzZqpRGsCMiwtbghlVlWuLHyjQn8qBI/jA0ZV?=
 =?us-ascii?Q?XwLRSMBIqZlrRqo6ivf0R3SvOZlKuPY27ImzXfJqVN5kLwcmaSmiiZNSp77L?=
 =?us-ascii?Q?CprWIi28tIhK+hXr9S5+ZLkV+9dPTnp6+DiSTKkLFaXliv1WgGDJJqWycvQ7?=
 =?us-ascii?Q?+IRoYtyYso/eYuKu9Ktz0QA75sqqKd5/KGpEbuXW8ZmqlEjgxhQLgTZZjlQz?=
 =?us-ascii?Q?f0XcuSS2XjCAS6tpYbzf+eQrA9nDUxf2AfZTfK8vQg7MuZ3eR78vED8rDUJe?=
 =?us-ascii?Q?1zp6kmlzLFbttN+hAH8zzoMIxOXM/REvgUdhUvaqEENUkkzTQf1tCeYK87Cl?=
 =?us-ascii?Q?JRQiCouS1KiDTdzcLpMqaKpm+GLzQTVUYvomrcIELn+jbdie25ZE/7T4voQh?=
 =?us-ascii?Q?5PNQzi6KLJZmHyA8+r/eLz3VKteZTRq3/ezQcgQiSPf4rCgHD7vB3q87Z+D2?=
 =?us-ascii?Q?yeD18zhjgIGbM7xFQBi8UCiEOMSHp2uApqL6eOfGu7bS1R852eoW1TCktaW+?=
 =?us-ascii?Q?gGfbjxYwq58AAEh3hjmRvmYC6iXoe604w7K+35I0EcLxqMBXMtnN8lSQoAzz?=
 =?us-ascii?Q?9LP3Qfaa3zkvLosEwH7oWo+Ga8LT2VTwqmk7mBeSMvhHH497Q74MLvQs6Lw4?=
 =?us-ascii?Q?hkC4y0vL1ZKKzlZNBKgf04iNpGMRm707YVPXdvTXrKnlh2zFPho0kXzKpDfx?=
 =?us-ascii?Q?JiSXf5ghe0UK/H1liWl3F8qSXKZKThnkJD6pa8KqxjJJPrgCaKS0bDn5tsZ+?=
 =?us-ascii?Q?Z31q4cC0MkVOLFz52YQ9N0JMBtLqzQi4vw8jv17KJAsv4Xw3UiJvlUA8ByaC?=
 =?us-ascii?Q?tNwO05cQJVV75aACTGsLojKXjZa/NcfZzg6mvqOZKP49fd173UPdRdp7pmZb?=
 =?us-ascii?Q?jvKHFwK9eBg5/XwmuQI0pHgyYlUDcq1ZkhXLGjypLwQI7ODryIdVAE4yeP/a?=
 =?us-ascii?Q?fFcGOghf5hNdJ9NPmfeg4DDY39kZgywfv5E75yZ2o4NiDYrw8CPz4tbPDixS?=
 =?us-ascii?Q?kxnCc1AU4exjr3ZOjktonmtdH+MZjXf3BFfzqd1r2CjqjTh9bHTnRpihKbeO?=
 =?us-ascii?Q?g/gV/f+d8eqL8EBd3TAaLBtnMrmfgZwVM5iJjAtfonei2rsXU92IgwQl6Bzx?=
 =?us-ascii?Q?1kBR3YISggSQwWLYSqfMmw/ezA1BF6nk+obvssWzp607+ILJ/ESFbBLcrr0K?=
 =?us-ascii?Q?Kqb1Mf5ILLaTZ2Pa20szLquSTycrswrYPSLkl8c5eXRrTtgMnw02dU4Q6ysj?=
 =?us-ascii?Q?chRq+uJVcTzL2Cdmtm3pzZO3SEIdHCc9VVwzu+NNg5OVZIOw+mLq7EznDRLn?=
 =?us-ascii?Q?hvr3RtCrjqz/s3XR0Ldtm3VFaOPa/bWDvn2GI71YQEZ4jQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1ATzMo+laV8rFrWwgHhhWc3RSaCSFSWXglWj8Qc6RgszcLNKyv59PoEZTtZ3?=
 =?us-ascii?Q?igoLpbln872YLGGJwrgxLDsGR9Eit7WDK4IcVb/s+kxpIfTqSHhrHzKTmqXY?=
 =?us-ascii?Q?ddEa6KUEGDF2t1BJRnad/+dU+cChG7twHYM1qLercSU31a5yETuvJb78j3/x?=
 =?us-ascii?Q?v8X/Jo/YR/6sGZsa6mUsLl6rQ3gDUzFP3pvAPuKZbCbig5U8NoVCgQaJxT8j?=
 =?us-ascii?Q?YL01OFrG5GIGO0CWa93ntY/XEdUHFdf/KpaOAHpjmsPRQWdNM0MjNCGuYWXj?=
 =?us-ascii?Q?RleIMQWwvgzE81/Ub9uvqD4npfE0y0DNg6Xf4KFpPj27LmhRMx34lz12kJQr?=
 =?us-ascii?Q?ChxnVWU5oBOLaQL3YYu6CqoLRjYYXTCAqE7jtqn7q0ShSHNlKR81Zx2Nm3PB?=
 =?us-ascii?Q?7GrCZ5FUzQhos8IyvejbCnCx94sgfJk+gEz9ifU7YdXcb/ImEYUI30YczUWS?=
 =?us-ascii?Q?VPcYqYqcuoIK4o+ROwQ0pHaYr4vPH+0SYLGJgl2XDFnqbnMVctzwfnFE+pK1?=
 =?us-ascii?Q?loiS3X/QdJgxmCYT8NFJmcYTSd8GW6QjFQscls0yZumxtFMCBQNy+7pGWmUp?=
 =?us-ascii?Q?5tdF+b7dcmMuicDkf2/Ttjxms2k9PWCPtBOhFqHLl+oBB2z6MtuTbozDnppC?=
 =?us-ascii?Q?av0kmexCVRUyrITB5yZT8EAEEz9kbbskT7TR0q59ZPvXTOBzNseGSiZ9T11z?=
 =?us-ascii?Q?S8dQq16eZQhpj6k2tCvwrns3xdPqww7RbZ/bH0FGVIlYNlC6FZXEKUa2xju5?=
 =?us-ascii?Q?Ri9BkwYH+90m8h5NqwBQGlWBKEEvH0O7sprpfg8m73TqptDe0AxzPP1TuCD0?=
 =?us-ascii?Q?0fyaFpdP93Ju3gJiGD7WGhunUq8cwSuzWyy5oUxkwOXo85nM58SFqAcUj/hb?=
 =?us-ascii?Q?6m3bgw7q7MFgq0+G855O8FrcdPC0gD6tMgAIvP2A8VYb87tAe4nqFOt/LI+Y?=
 =?us-ascii?Q?8gdKTUymheQLBrhkd2tMamITwTCQ+iCqKcuQI/CAt1rgUEZerP50LoITNQbl?=
 =?us-ascii?Q?q1OfFh/ekJ1fw3SPpnuxP0Wo0emo2DE0LAsjACcY3TBjSIGX0sNpTMTRcsTd?=
 =?us-ascii?Q?zSqbRPMO1jSz22qyeFSs6BX0SrBumNgZa3mYUgwcYd+Oo/eIzlb/XV3Mqdcg?=
 =?us-ascii?Q?2amVjqDz8OV4WzEe0sNezy9MRE8FljdH2krk2MRqohD4R4EDgkw/pc+7J+HQ?=
 =?us-ascii?Q?JeLIuRA+7wt7GfelyspwLLt/BnnvDmO3CGxLrtNXaWq9KnJXaG7eucgcQoxu?=
 =?us-ascii?Q?L7nOxp8w8G56J9fjO5hfuSS95TffaomxWOSPXOCwGy2msvqBgmU/j6JsLYzc?=
 =?us-ascii?Q?6Q1Wqkl4ma5RRW+egEOJj7KA8ln8wRV8sKo7SXGZEnATh0PRshRieMhKo4jf?=
 =?us-ascii?Q?jmWWuZNg+lMIkmf2TH7yMMxincEbRUuZl7kHcv1hZ5/K4/kHAL58bxfmR20M?=
 =?us-ascii?Q?BAbk7D+d0grwbkcizMbJZ7lL8K+6w054cKyBe+F+XSfSnB1RqT4VRh87g3/4?=
 =?us-ascii?Q?/dslxvaMef5wyRJRijr82JhF4LEHjArUAYIQw5L2N4o9JRD4dTtNmP/9Mhap?=
 =?us-ascii?Q?0n4a9K0ycln3nH3/mpxOyc/is93Ro9PkkzyeRXvO?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd3d9db-e8a7-4352-a22e-08dcdfa0b4b0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2024 09:34:10.1493
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uhPdxYiN3jDi0fEiUWA7etsRJqrYit0ld4FrARFkx3sLGDr6xNw9mEHirxgSa1DVl4YDxpdCc+wIKbGAWK+MoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5876
X-Authority-Analysis: v=2.4 cv=VaulP0p9 c=1 sm=1 tr=0 ts=66f7cd94 cx=c_pps a=MPHjzrODTC1L994aNYq1fw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=BREEvwG6BwJnq8HvJoIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: CylpPuhXmKeOcxrUYS_EtT3XHIfrPaSm
X-Proofpoint-ORIG-GUID: CylpPuhXmKeOcxrUYS_EtT3XHIfrPaSm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-28_04,2024-09-27_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409280070
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Sep 2024 09:34:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112537

ChangeLog:
https://github.com/catchorg/Catch2/releases/tag/v3.7.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-test/catch2/{catch2_3.7.0.bb => catch2_3.7.1.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-oe/recipes-test/catch2/{catch2_3.7.0.bb => catch2_3.7.1.bb} (92%)

diff --git a/meta-oe/recipes-test/catch2/catch2_3.7.0.bb b/meta-oe/recipes-test/catch2/catch2_3.7.1.bb
similarity index 92%
rename from meta-oe/recipes-test/catch2/catch2_3.7.0.bb
rename to meta-oe/recipes-test/catch2/catch2_3.7.1.bb
index 2d571a9cf..35cdab5e8 100644
--- a/meta-oe/recipes-test/catch2/catch2_3.7.0.bb
+++ b/meta-oe/recipes-test/catch2/catch2_3.7.1.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
 SRC_URI = "git://github.com/catchorg/Catch2.git;branch=devel;protocol=https"
-SRCREV = "31588bb4f56b638dd5afc28d3ebff9b9dcefb88d"
+SRCREV = "fa43b77429ba76c462b1898d6cd2f2d7a9416b14"
 
 S = "${WORKDIR}/git"
 
@@ -16,6 +16,7 @@ do_install:append() {
     rm ${D}${datadir}/Catch2/gdbinit
     rmdir ${D}${datadir}/Catch2/
 }
+
 # Header-only library
 RDEPENDS:${PN}-dev = ""
 RRECOMMENDS:${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
-- 
2.25.1


