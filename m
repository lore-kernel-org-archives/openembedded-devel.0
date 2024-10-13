Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BA62CF2576
	for <webhook@archiver.kernel.org>; Sun, 13 Oct 2024 11:45:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.30093.1728819931465514376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 13 Oct 2024 04:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=00166a7a54=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DBSxDD024792
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 04:45:31 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 427rmm0n3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 04:45:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnE8WMZaSsV9nieXLH4EAhYB1/vb5rDiq5gHQWeb403WoksZwIxzFboE8/tycw2VDDnmTWCqwyp47Xw7+dMPUyDUQL65YLNyehiiMx9BK/WPq8JT3Fv/kIyru/EyUbJssCjkYh6PjBkWZraTtkOI3YHzj7xM9gz4Q4A38+f0u/GBXiliKR4R3qt3RIhkBopF7wu0aeXkgRa2de1JEp00gqmEphm4eLpo2c+55vLd9WsxTQsyJT76D3GhtyN0LVkb2zXvQnMlo9HGYcxl07Aoe+gij4rluiIrybXq+ruZGsa2hWV0el2oW5+NO8AYx4Qed7YIpPvg1Uk9pLx+7MKMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=feQqKPDwrlMu0xEzpB+NeG+3cAQnx72nBefrBr4xRKo=;
 b=C1VxSUO5BjJkG4BFlTDftURhU47AUAKMki6hqnK358fGMakjwSz785uIZ/ujjQKHdQp7VYMGPPp/umsdeH85C3rM/Pf9tqRSM8ue/MvvupSQ5VfyiopfGWIyaSGloxgmEuyp4OhCPSb1ugMasn2ZAUow+nx6B2codAcca63j0y0zjVgt3oj8n6vOjbWn2AAtT89xGtTi3doVgIslBAgyQSeh4Hx8Zex4PUeBy0KE8MxL7JLE10d1rPkROJAQ5/J8JGFXrRYTuSMtFZQXlSFdJvzyvJbLdKgPaMtsueXF3mhISPZFyrqi1W2BdA8cjhs3Aba1ZqPA/3c+OK1EWa2jtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 IA1PR11MB7810.namprd11.prod.outlook.com (2603:10b6:208:3f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sun, 13 Oct
 2024 11:45:28 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.8048.020; Sun, 13 Oct 2024
 11:45:28 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] lvm2: upgrade 2.03.26 -> 2.03.27
Date: Sun, 13 Oct 2024 19:44:56 +0800
Message-Id: <20241013114456.3410472-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0050.apcprd02.prod.outlook.com
 (2603:1096:4:196::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|IA1PR11MB7810:EE_
X-MS-Office365-Filtering-Correlation-Id: 278fa680-1d48-4020-ce1f-08dceb7c8895
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?mUG2LpkgxoBO184DHSIaLr/kja2So913rCxHqAdM1rUfxasn8Bfg/KVYdRxn?=
 =?us-ascii?Q?p7BqZcADarxL7+n9Cnw6U/4UI8dAoVsk7HSyZWTFo2eUAhNuX0ExQWsfNdhx?=
 =?us-ascii?Q?DRi+RWCPppWbkJ0FugNMIHM9pQ2BJsPKQQdDfFbDWjwl+9DnA52qT2V/phae?=
 =?us-ascii?Q?VaD4zUH6Quw6zT2hnuljKzSfdeg1XGQzAcuu2olF7+YPARNJFDDPoRD3xdQH?=
 =?us-ascii?Q?gBuPsyrMCrzCYXxGKWR9y2WzNdsVAXtju1m6W0ehyV/NvY4On0qntLk0cb8Q?=
 =?us-ascii?Q?xJGFwpXuZRAgiEI9QY5uCqvI9jfvuuqDUQdxSTdQFXeN9jXMDWba/4iNPGFi?=
 =?us-ascii?Q?yr3UuQ8dDlTrQ9hYbSe3qc9Us1DzZ01H8z6oM3p2Q6hGo+bMhHRSi3XnEGWT?=
 =?us-ascii?Q?51w8w/MPovAYvcwCOJ/U8uzlffGMoCxAsqU7BiYdkIABUFKfpSzKoqr1cbdN?=
 =?us-ascii?Q?Gt+eAxw/DbgDwxuaDjLZkX91VsaEXm6YcDsQ9CnB4zDkffGDOoNkYlDW2dxo?=
 =?us-ascii?Q?FdPwtNGTCz5zuJX7CKcfaWQE9qR58/UeLZN8FqmFI8I71qXNxAxQCFvE0kz/?=
 =?us-ascii?Q?W1I7Jd96xsp7vSAn9AYQ0r1qgM4QmfHkflgvRYuDzY7Ayb1i9i/Z8nCHGPFw?=
 =?us-ascii?Q?pKrUtysr4FX5ugfdSY3t19KKZHq0gCGUJZl7OcC4omc3x5SCaOLP/cZe5PyI?=
 =?us-ascii?Q?cdIqLyOR8Kfq9uUYp8LFnz/dBhBdITNUCVP2XqzbTOh5EptLbfn5mTbq0LWA?=
 =?us-ascii?Q?ialyab9utlbzXvOBa3hL0EwuHptvpdiRNhn9cNXSliK0+yaIWePQgZVix+wr?=
 =?us-ascii?Q?k2jBusZj+gP5PlcLNV3K+QLpG919JizfsmTAlbNHVE5TtAFjcwoSBCHNbWYI?=
 =?us-ascii?Q?jMyJ+15MvuT7rC0tnCG/uLi0WCQw7q+Oc7wz+V60hhwX9X3POrRYX+Xp+2hA?=
 =?us-ascii?Q?I9kNRicO2gkcglTXO/QpUkCuD19Pa2/eG3YrYpOTym5jEx4OWQ5dyeBl7Uvx?=
 =?us-ascii?Q?m2CPiCCOZQKC0cPcNiphSFwTeAI+fAdnArC9EfOxbUpiVPuj6dg424btx6MW?=
 =?us-ascii?Q?BbZUlJTA9eCsZ8svHI+vCxb77zzI78UgRsmP/Hbx7kuxBEFAUIJmki/APUF4?=
 =?us-ascii?Q?EMTt1yELYBm/t6xn7WHye8NRl5ws8nACl8rQPfPE8+uMSz43y8QZQ0r23fdF?=
 =?us-ascii?Q?7Or/Pu+FV3u0spnTNTIpq3cLfsierxGzT2r2yRgAVxaVzXmYkdDktXupELVd?=
 =?us-ascii?Q?hkeOQt4V5YG1+gfqSvWjcqpg6KIDZrdLnUytd8mb4ULFOCbBXiq75Ci/xecy?=
 =?us-ascii?Q?yxm3xM/pF1T4qgdbRXAmzIPsJUspDVY6IArM9N16zk8DQw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m7bYF/XTEA8NBWCPwVNsxYWLix6ubsQyRuaeFPsPnS7FbSCBAGiJltnwjX4A?=
 =?us-ascii?Q?L1aIFvk/JssstNL7yITwmCzB7xVDFEx6Hp0g2wLstQs6a6dQvokDiPs12H4/?=
 =?us-ascii?Q?xkIf4FXM2d9BGtnIBUm+TTNWtgDSRhsB8ACWMFYHIf7utgEFKKTVJfLL+7RP?=
 =?us-ascii?Q?ez9Jlma/3JlWqVcmA4xj177mLXS3oTaBGyPJq1JIhCdHk0thBbQl3YRNcoCu?=
 =?us-ascii?Q?ttYgyOhvWsoxYJeA82QQixLDBnF9f8Xbf/CmABhDCCfWncUpK27ev+FKanJT?=
 =?us-ascii?Q?2NccbXE2yF7Ep/BpR3Az1Ssa7BbcfSqrbqQ2vhSReOrBBKG0I6IoSRj8DNvH?=
 =?us-ascii?Q?hIjWTkf2iNkUy84EEFaBI6p9Fe9HRNBcHJAJqatH+H0aQAWOqPzURCJ0I+4G?=
 =?us-ascii?Q?IaVC3xxii4oziJbL/lMa8JQ0/wgI8drO850yNtmpPqP8wpBAz9flx8/IXbGB?=
 =?us-ascii?Q?oGzZ43bvazt38Loc5faF424bYNVDPzMBnxmn4xV+hdmLlOutEMhilaon7Fgz?=
 =?us-ascii?Q?ze2p8WBFgN9pCBQjxEOnGrKCdwIqJOPQ/44fyDnCF16dPxpXkSK5d2YMsY2q?=
 =?us-ascii?Q?Ebg2QLS1NpwLA6Cmj/ht+DEbE0xqO8xs319mWdN5/sYrnyPH3v4ZqlMY9oi5?=
 =?us-ascii?Q?6JVbbTcZgTH+qu1j2mrl62iYUeS68X1fDKZWeGHt/VuqQav2Qio0gMNzzAT0?=
 =?us-ascii?Q?Jd0+dDn/XTJV80KjIH3NmKJwAPQRrtbeSRZIrfybIX9KBQL+4FcbTw51kE9J?=
 =?us-ascii?Q?+jvl3RIico5+ChH8WpvBMgPl9jdpIJOCqgsQmqs/5tDRCgPtJufJg/1+kG6f?=
 =?us-ascii?Q?pfqxqtJcRvy1mV6lHsExZx/mdYAB/AOnFx/uTpmTR9B7nkGZjvkKRRPJLVR4?=
 =?us-ascii?Q?CWh6FRtSMK03rRSESY3Aw9IsHgDkmPv+0UBkvvPajubf/UVgT0Ln5cxZcxS0?=
 =?us-ascii?Q?vtssGJX4LBOWaWPH0KJh6nmuI3C7uC6TbOXkds/M3EUHMIy5I8OFwqmCNz+M?=
 =?us-ascii?Q?dlzU40//GysgxxFE9NH8y6AFF9AawFJtj6qDnK7KI3zOyrxCzOyw7VVXRsmD?=
 =?us-ascii?Q?5K253BI8KvxMyfqN2ZPhI/Z4vKZIjoPH+oBU82vzZM9VJV/xy1qmpqKFm+22?=
 =?us-ascii?Q?+OTyvkFMJxbIAgjroYAsYbCdEa6OPYd4BP7jqDb0vlCW9OG2e5t71u1Mdkj8?=
 =?us-ascii?Q?dYGy5yBThGQJP9uU3ggN5wjcu/gGg/botOpo529nzBJttGNuyNPy5ps2zd1W?=
 =?us-ascii?Q?69CssxpvLIJdEnApZif8HRIWVvGV/NO16jv/TvmkP2cdtd9ZZYCYu99uufS2?=
 =?us-ascii?Q?TrDjrG2xcno/HOvS+Vmv7shlAGaWpc1OhnpPHwhQxV4CD+sxI1An96huaPZa?=
 =?us-ascii?Q?vB46wqLYFIO8SU1y3/X8p0ex2Rj4UnHdGj+MtCkGyU62PabnnNkMz7XgOF+I?=
 =?us-ascii?Q?pnb2yOWlhfojrQB7hgZpfzUsqKfz3r3HBSalZ6qBjStp/X+b4kqj9wWtjtS1?=
 =?us-ascii?Q?7yyz6V2iBBuC8vecOO28BEGTR+bYGpKUAHng4k55bA329J0KDL+12CzGmvbw?=
 =?us-ascii?Q?RLLVdxtvv674NKP7W0fvWcoMo2ePr5hst/Ijv0gE?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 278fa680-1d48-4020-ce1f-08dceb7c8895
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2024 11:45:28.3031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezsNxqS37QoDHMLGvhnhvRRNQRi4BY4KdIqFIvfj1OoSq/L5BG9c6KxNCg5QMwTw+Mq+qzhWmXQSwAlPJG7bMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7810
X-Proofpoint-GUID: Te6orWzCh76p9hNk10tfQtqfrsrPATtc
X-Authority-Analysis: v=2.4 cv=UI+PHzfy c=1 sm=1 tr=0 ts=670bb2db cx=c_pps a=PK5aExQQjalka8oDlC/sVA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=p0WdMEafAAAA:8 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8
 a=vnz8jNrKOm2LIF13CY0A:9 a=CEsIH-8HjQcA:10 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-ORIG-GUID: Te6orWzCh76p9hNk10tfQtqfrsrPATtc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-13_11,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 mlxlogscore=799
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2410130088
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 13 Oct 2024 11:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112835

ChangeLog:
https://gitlab.com/lvmteam/lvm2/-/tags/v2_03_27

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta-oe/recipes-support/lvm2/lvm2.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.inc b/meta-oe/recipes-support/lvm2/lvm2.inc
index 059ab6999..b46ef2570 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.inc
+++ b/meta-oe/recipes-support/lvm2/lvm2.inc
@@ -18,9 +18,9 @@ SRC_URI = "git://sourceware.org/git/lvm2.git;branch=main \
            file://0001-include-libgen.h-for-basename.patch \
            "
 
-SRCREV = "6de3937ac517a3ecfd6d8d90f3f055dab631157e"
+SRCREV = "207990a8770208151b2f39b51526580a9dca24c4"
 S = "${WORKDIR}/git"
-PV = "2.03.26"
+PV = "2.03.27"
 
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\_\d+)+)"
 
-- 
2.25.1


