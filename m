Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAD91CF855C
	for <webhook@archiver.kernel.org>; Thu, 20 Nov 2025 08:35:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.30151.1763627750627404382
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Nov 2025 00:35:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=NxJIKnef;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=34199b9cbe=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK5v4ch3655871
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 00:35:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=4DAVqCdgoVcFqkiVz20X
	LjF5n1mDa31Yp4rdV196g04=; b=NxJIKnefcsOX5vj4UMmkRTS0o5uQdf/ZFH94
	WxclyzxcD0q5OdFaxgchHOd6ZQaU1O+LVDq8XLhaxuGJzd/xCpXpb0hN8hKJIlPb
	MigLJG1okEsxBror+O6YNJHn4zRKfiG4Mpm8PJwHBRJtXMnbZYqorpPts44C37Ki
	uuE+BvP5V7vxw3LVEQvknWZFTg0Bsy525RWyYKc8WX3orivMGpdLD8PATRWZsOeO
	4P91UtvaIWh4bwSdaScKQKP8zYobxBm4YVEx9bzfyl3e2bJrXSFx3o5OMwCt/B1Z
	GPPNBFKJg4M5DK9rWbfGbzeW8exNDVj5F5eImtQ6Y3U1gm/d+w==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010027.outbound.protection.outlook.com [52.101.56.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswjdyh9-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 00:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZLTz2AFBOGNXzYvFLcsAqNac+UCI4u69BY1YbxY6HgUFNtvT0bicjCS8DAgbRXmnrgiW0+AkaV0hL1P2i6oVVvfWhzZ5z4zeLuXFoSHiYHp1r6S6WcYb3MJlsY0VHYecaHyrsnQDM8QU92U/Wedz6d8lTjDsgMpOvtsk0hwxVHUDEtj28GOGBY5HomBPYkTWq0ynJJXWOCtOEkZCzSsyzdPL2DWcXpXbFlW7zp5ocBI8aX/H1C5na1LJ4OrxuH3F29BfKg46qjGRY+8jmrMHSk6MSL6AFrEuX9X3GHSvaeatJECoA9FFeu9wORkw3/FYb+y5m8RomyJl1DL4Kc5evw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4DAVqCdgoVcFqkiVz20XLjF5n1mDa31Yp4rdV196g04=;
 b=yMxgkJCK9+TYaDxEiUj1bsUPjUQJCUJf85V+fZ/uJSJ6vKE7cvO2MyPaduup1THTQXOtdEGnQG7tzabw8NKpt1gwrTq9izsirfBIyyWB8FK/1bWLKQoKu+iYKqYPBUh2uGQYicz89zkU/U06jOucmIEPnThmDYtS2URsgi2L9U+hth0UYDr+a3IOjKMH4a7afVEtWe1g1rAOmNMQLUf/TKjgUFlJt9D6F87mFocfu7mjcedHSCUdClFjcMywluXJWj/fbYlIBUGARR4QV68frZF8c2PE3LTIqdFfaAlWTL51ALdYjmwAhm0/OUQ1KahEWjdCC4q7NRMi3q4wFMT8Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA4PR11MB9418.namprd11.prod.outlook.com (2603:10b6:208:56f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Thu, 20 Nov
 2025 08:35:46 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 08:35:46 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] rasdaemon: fix post-processing options
Date: Thu, 20 Nov 2025 16:35:31 +0800
Message-Id: <20251120083531.1289337-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0089.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::10) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA4PR11MB9418:EE_
X-MS-Office365-Filtering-Correlation-Id: d6c2565e-d024-45ab-1de7-08de280fccf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|1800799024|366016|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i030mf0M7HQyoPfb1eW1/d/2Dy9aCT5yqMoRrdE2VOQecf6DkFc+H6md/1Fm?=
 =?us-ascii?Q?ApEax9/t9JGuqe2ROD+mdqe6p1L6FM9ZkfqpjaYwdrsFmu6os0SBz5MrX+Si?=
 =?us-ascii?Q?mDwho1zke50WCyCbfOLBpXUDBqP3tOpk0T1iw+DT76v1BpKEEW02MAQOI8JO?=
 =?us-ascii?Q?PSeL/xsop5u3vzAy/bvfgi9VFfHaLOB5KVtIoqXTBA54tAr2XQK7rwV/0hEW?=
 =?us-ascii?Q?lZBLURevRBajqv2nRFeYPlOQvNFcuWCKPsiTYOwqZ3AazEes1ydLohIxMuxp?=
 =?us-ascii?Q?AIzKuOCNXk13oSvkPlTURaCVY9VvJGfkiCk1bNPf7kP/b1Ngc2jVaoMjdpGF?=
 =?us-ascii?Q?pPzmnry4eVm1bLQ/YTnuftSe63Iz6A/CBR9A2t30TwuGIVhPDdblKjgNSu5G?=
 =?us-ascii?Q?AIgGsyCuRqk3E9d/1xiMc5K1IamaTRwR+zOLdB2V/MAW/hazAArm4VuM38Ww?=
 =?us-ascii?Q?qw06DndzNREAwOTB9xku6pQQtIj3JdLSz1k78nRWZXFekeGGoKREgwhc6z1I?=
 =?us-ascii?Q?kaKa66OubFOGhY3K1+wpyYbp8jRpiW3Os0vZ+Skh4DHXCzqUerHnrhIdLVJH?=
 =?us-ascii?Q?Wvz2nhGauZ6CFvJreVpbFTB7UMFBSFEF5N88U8BcV78HU20KOPiACF9eVwzf?=
 =?us-ascii?Q?CxgKWe79/SHHXU8jQyY8jo30srrfxZzdWIfwAMWsX+5OFoadmO3PbWPqcC6d?=
 =?us-ascii?Q?QIcSSHkO0+ofRrR1nraODrPlodN8+ixTaJUIuPr5XGKWaGDrpXGtfyrRt6Uk?=
 =?us-ascii?Q?Rq09GNUtJ+wP06Ns/g2XqYjVrit3qHoIMG3x+QssgW/meytx30KQQ2EUXICf?=
 =?us-ascii?Q?UShahfUxIO+v553KeWz6TTTTV64RA98kLsdsOMnFyRVwjO+XFMSsCyEutRPX?=
 =?us-ascii?Q?f7OA6ewLuHZ/YpjMIPGFCPoQV7jRKehraJ1VOE/Z4aig1ExFVV7c8+Z/uhfW?=
 =?us-ascii?Q?Ayt4yFkNzgD5rsTAE7ky6Cv1OReR4n5osOxhpY3Ul4bxfXulzoraIkN4KCus?=
 =?us-ascii?Q?RqCSParh56YKXrn3qi5qIxzTAQD0BfToaoWPeyV5kZu5R0/9ywoj8feriMOl?=
 =?us-ascii?Q?RvNxMk9mxkIPSUUnhxi8v7FeGNLHygV2upGdlyTAy6mkocDLH0rofQkZa7w6?=
 =?us-ascii?Q?rmd7cMzz88apunnrMYxboMAvdNnZsn4FWoF+ujfG4NDDQzMAvcNSpOZJPp20?=
 =?us-ascii?Q?S26jLNVclTMYj8jECaF+qHs2OzByZ46VYRHPOIrUMq39cSf3iU7Zh6wzX7sl?=
 =?us-ascii?Q?xQLoESL1KAaLDnKRjflRkY/GNGK583L6jvw4Aby1XaBkMx9mMlptqMit/6RO?=
 =?us-ascii?Q?QLFFRARrLzacclDwu1NbhkgdeutEdjROZes8nRKiKbUdOWRjpBIc6jfKJ1TK?=
 =?us-ascii?Q?B/TZKClUBSszy0Mc5D4uRpgUlN/XymhXM5CeJbXeKEShlud8jLVMinnK5slI?=
 =?us-ascii?Q?X8K9aq46EYhiPY32pjtbWgS7UhzwHCT+MJI3yoZawsXiQYWs5Rd3q3zyhoZl?=
 =?us-ascii?Q?1cOBayrCz8AdJVxLCbqsxoDASc5z3dk/R7Vw?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(1800799024)(366016)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ljsmQWnozsR85Wlz7n7Te+3GE93xHA1oVtgtKx0YqiibO/8jZT51B1A7Sqaq?=
 =?us-ascii?Q?GEUo+i+KAYH6fJOayyUAwvtJgFLdnN8I9VT0P+YQnhRLxaCQI+KT8TuAtQZU?=
 =?us-ascii?Q?mXzQELtkkjm+sZptOxuOTLWGqR0BOP80rGNR+TJhOrfMabFgSEeDA45QQGvM?=
 =?us-ascii?Q?TNlIVXrN5geU31i0qbqAE3ggPxfiDRjMaQPq/0sCxQ0CyowZ3snAOwL3HnNE?=
 =?us-ascii?Q?W4P9+Pkbi6DXcc7vpkWc2oe6xH9ooNA8OSXB2GcsBxqlvAFv37koPjzNDnG/?=
 =?us-ascii?Q?ORXl/myPyoN59xMSHjVMdg2jT8/u7J74HgMJEa/oWJWo0b49J8J2+UiVDXeB?=
 =?us-ascii?Q?M15gUy4PaF8bvbyatsA0aYExftZiQvvvSpSXPubNhTnRBuGGbzglxxGvvapp?=
 =?us-ascii?Q?YtvnISZ3Qt4k6FPNHKROa2LKVc1tUGp/hBwc5qBNaoGvlsusRb4YUaRn+DJM?=
 =?us-ascii?Q?jgMpkN595mXZl+PxXO7Q6i8zHqoxJgcxcO1MMpcMndiWxf0Avmi0jbMVa1wu?=
 =?us-ascii?Q?HQPBUQ812DjNRltw78oz04Mm0XCwgcKga8M/+gRrsQwwuNpCJGrbirlqxOjG?=
 =?us-ascii?Q?GPYvBwAwcS4mMoAu51+Xuz88sqCoa2HDn4Kgnn6iLgA/7XBoQIBo392FzKC2?=
 =?us-ascii?Q?NLd9UceXeNxGglLnTT/c9iqz3iLEZ1p6tiMGwGu7D9mHdBjlwdG/cYKn5CT2?=
 =?us-ascii?Q?889Eews+V2XW5gRrQlTJ/rt4aiFvX3yY0Vel8zJCSUFjLy31XYlIZb03caWY?=
 =?us-ascii?Q?MNzDmq9QazHnfct9L4zRApMwU9MoHrEdV7Y4NhhY3q0oaGAvpgJjzuLSfNF+?=
 =?us-ascii?Q?wJJ8k3p+5/cq66m4dcfziNNif83+NhmdCesU+aMUEEAznCJm2BQdNrNHJORQ?=
 =?us-ascii?Q?j/w7Al0AZUjilCAtP6koqdvTqX+nZc4h6CODqZceD7MsgHEm0rcRU/HYw1a0?=
 =?us-ascii?Q?TaQk/K6JcQMtr5gST+lj6Fr+JAggzf12fr4Zf0SMT4roQqeXJNW25FNCbtnJ?=
 =?us-ascii?Q?gQ7prTfgAi+m67wdiylPvZVujP+7KaA/+gDR0kBKQNtKVWvFduGs227uASYZ?=
 =?us-ascii?Q?I3EMzeZ5zk6/3TxvQKx4UGSPmWCPGz4quwZGN5hkRo+xk/ClocNEDrsxkPT7?=
 =?us-ascii?Q?a4VRrvlwP6Yrcp81Xhoq72kbzxAm13xSty4wgYTbbm8UiL+3NOsN++vxjZBV?=
 =?us-ascii?Q?74nOP7kMVJKC4sYYtsuSMHWp0CA1tOt6gsFLuuQRX36G4hTG7FBu0Okc4a5b?=
 =?us-ascii?Q?DAW/c1Ev8AxoLwR36V91QEgvX56WnFJDLbBdsv8Yo5A+XKeBZ059rBqIxWpP?=
 =?us-ascii?Q?lTOKWeC3qPiHSUAtvOEobOSMH99uUdXPck2OZM4L1vTq/WL2lK3Mx0eDyZRi?=
 =?us-ascii?Q?lrNBG5AaS2lOOv9ywrYILB34jxl2phY9+jqVK6qnn5Y3/BS3VR19qHzUfY26?=
 =?us-ascii?Q?kj3secusORinTKbAiX9D1KdoV68y36jC6QmEk6OOLknmEmwO8vvm4sn8TuT0?=
 =?us-ascii?Q?kRBPSOOU2Y054LkNOwowr4rBKM7IoPTCUr3wgwhAx4BkOGedRIEwfkv5PIRl?=
 =?us-ascii?Q?RDXqPloZRj94DtebpbggyXTFUO8lBfQ4i9iIXf0k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c2565e-d024-45ab-1de7-08de280fccf4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2025 08:35:46.3810
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/DH8B1q+/hSZxYdbtSq5lVKKOVp7k04+gL9Qe5czkbxxZnLfyBEtBHkbP5BQvLRpgMyzRxMKzjoYJHNjvzABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9418
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=691ed2e6 cx=c_pps
 a=zeiJWWlNkXVQCS8hXHnWBw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=VwQbUJbxAAAA:8 a=n2WQX4Ze0djs5dSfzmkA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Qdg_OE6pW5JPuML8WXDBN5Wh6lM8L5xv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA1MCBTYWx0ZWRfXxWFchLDjBGZg
 4vhONrYQFUi5+hPXl6DBWhDmPxKeb0ejZWxEB21D02uBouw3LxRbO1m0zQqpVVyfamrgCU97mqZ
 3eYA64iEMttVvz1whz96w+SRcdrSTKBfRzHK5OdVGr4d0yCFniFPTj+jnq6NL+C1A6S+wqflIwk
 GRgFj9i1f1xplNRwF3FdhhWzCsZeGAMM4A+KDV5K7vGxKXLE72Tx1BZLCi8Q7HudtfDZdPEjZEK
 8jzdJAst43tndcTy+K3bV0EEcS+OWccBrVfxZ9GJvBKC/7TGwAO5952ydh7C6lusHzdfrRqhZR+
 s2ED4H+UwSC0KABxDTJBfPMQsvRFMecGwu+lIG+fZFsdSzN6ypmpFgb0maVRqFcUvm96hgh8nsK
 z+9X9uwfg1fpAWI6ZuZ7JChjTGwG7A==
X-Proofpoint-ORIG-GUID: Qdg_OE6pW5JPuML8WXDBN5Wh6lM8L5xv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511200050
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Nov 2025 08:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121932

Some post-processing options require an argument, otherwise a segfault
will occur:

root@qemux86-64:~# rasdaemon  -p --status --ipid
Segmentation fault    (core dumped) rasdaemon -p --status --ipid

Backport a patch to fix this issue.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...asdaemon-fix-post-processing-options.patch | 83 +++++++++++++++++++
 .../rasdaemon/rasdaemon_0.8.3.bb              |  1 +
 2 files changed, 84 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch

diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch
new file mode 100644
index 0000000000..d999f288dc
--- /dev/null
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/files/0001-rasdaemon-fix-post-processing-options.patch
@@ -0,0 +1,83 @@
+From 64bc04705ea8606eed1b1e810904cc8296e99472 Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Sat, 2 Aug 2025 15:43:11 +0800
+Subject: [PATCH] rasdaemon: fix post-processing options
+
+Some post-processing options require an argument, otherwise a segfault
+will occur:
+
+root@qemux86-64:~# rasdaemon  -p --status --ipid
+Segmentation fault    (core dumped) rasdaemon -p --status --ipid
+
+According to the specification of argp, when an option requires an
+argument, we should use the 'arg' parameter, which points to the
+argument string for that option. Therefore we set char* arg for these
+options in struct argp_option and use it in parse_opt_offline function
+instead of state->argv[state->next].
+
+Fix #220
+
+Upstream-Status: Backport
+[https://github.com/mchehab/rasdaemon/commit/64bc04705ea8606eed1b1e810904cc8296e99472]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
+---
+ rasdaemon.c | 24 ++++++++++++------------
+ 1 file changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/rasdaemon.c b/rasdaemon.c
+index be5c390..9368b12 100644
+--- a/rasdaemon.c
++++ b/rasdaemon.c
+@@ -98,22 +98,22 @@ static error_t parse_opt_offline(int key, char *arg,
+ 		event.smca = true;
+ 		break;
+ 	case MODEL:
+-		event.model = strtoul(state->argv[state->next], NULL, 0);
++		event.model = strtoul(arg, NULL, 0);
+ 		break;
+ 	case FAMILY:
+-		event.family = strtoul(state->argv[state->next], NULL, 0);
++		event.family = strtoul(arg, NULL, 0);
+ 		break;
+ 	case BANK_NUM:
+-		event.bank = atoi(state->argv[state->next]);
++		event.bank = atoi(arg);
+ 		break;
+ 	case IPID_REG:
+-		event.ipid = strtoull(state->argv[state->next], NULL, 0);
++		event.ipid = strtoull(arg, NULL, 0);
+ 		break;
+ 	case STATUS_REG:
+-		event.status = strtoull(state->argv[state->next], NULL, 0);
++		event.status = strtoull(arg, NULL, 0);
+ 		break;
+ 	case SYNDROME_REG:
+-		event.synd = strtoull(state->argv[state->next], NULL, 0);
++		event.synd = strtoull(arg, NULL, 0);
+ 		break;
+ 	default:
+ 		return ARGP_ERR_UNKNOWN;
+@@ -146,12 +146,12 @@ int main(int argc, char *argv[])
+ #ifdef HAVE_MCE
+ 	const struct argp_option offline_options[] = {
+ 		{"smca", SMCA, 0, 0, "AMD SMCA Error Decoding"},
+-		{"model", MODEL, 0, 0, "CPU Model"},
+-		{"family", FAMILY, 0, 0, "CPU Family"},
+-		{"bank", BANK_NUM, 0, 0, "Bank Number"},
+-		{"ipid", IPID_REG, 0, 0, "IPID Register (for SMCA systems only)"},
+-		{"status", STATUS_REG, 0, 0, "Status Register"},
+-		{"synd", SYNDROME_REG, 0, 0, "Syndrome Register"},
++		{"model", MODEL, "MODEL", 0, "CPU Model"},
++		{"family", FAMILY, "FAMILY", 0, "CPU Family"},
++		{"bank", BANK_NUM, "BANK_NUM", 0, "Bank Number"},
++		{"ipid", IPID_REG, "IPID_REG", 0, "IPID Register (for SMCA systems only)"},
++		{"status", STATUS_REG, "STATUS_REG", 0, "Status Register"},
++		{"synd", SYNDROME_REG, "SYNDROME_REG", 0, "Syndrome Register"},
+ 		{0, 0, 0, 0, 0, 0},
+ 	};
+ 
+-- 
+2.43.0
+
diff --git a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
index 301861de38..2cc2a26acb 100644
--- a/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
+++ b/meta-oe/dynamic-layers/perl-layer/recipes-support/rasdaemon/rasdaemon_0.8.3.bb
@@ -4,6 +4,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d3070efe0afa3dc41608bd82c00bb0dc"
 
 SRC_URI = "git://github.com/mchehab/rasdaemon.git;branch=master;protocol=https \
+           file://0001-rasdaemon-fix-post-processing-options.patch \
            file://rasdaemon.service \
            file://init"
 
-- 
2.34.1


