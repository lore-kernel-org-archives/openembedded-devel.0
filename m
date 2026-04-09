Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E1AF31E41
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 15:41:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.134663.1775747697286783523
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 08:14:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=PAD6mwXk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=85591b1f41=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CU8kl1003094
	for <openembedded-devel@lists.openembedded.org>; Thu, 9 Apr 2026 08:14:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=NEBGmgYSxBJx3D4sfiZi
	9xu7AqMpU2xGYgJ5OlGOrU4=; b=PAD6mwXkPbmo6pEPDqgmyQGmTY0IgLRfiECJ
	9lioSfmEpLr7j/tGOuPPyYDKj3xukW1fViDQzp3+wtTjFdvUOl9lgInu+O+Klt92
	o/oSFptbsmfmA4j9WRhGIz1CLfbUBp55F60BSxWixsQgXzLUzTkxKh5UW0MFxClX
	q7p5pENIMTMC3FhP2FeBt8lxlJLZ/yWq0uXQgKMuCPGdCbnjvJw6rb+fkMr4uW+F
	tcLDJdJJo/lPgRpVggDiSyNE2QYpvi0GkMNd8pd/lEIuOZkeC34a1cz5bVFZWvxP
	wbbZMaaAOifbsiYaMTcnAqoRpZ8+phS25y13Wydn/Cie2a6Xkg==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11010036.outbound.protection.outlook.com [52.101.85.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dcmrym898-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 08:14:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Aymhy0ykp2Sxrqx1+d/l9quAo0U4W6BSxEwouKsFFe2PzeMdXn+JiWFnppXqiWHI+FJw0PP2ivmd0WPlcz9YMTdTPKfAHP7gOQFYWnhq979Fymy0WEBC8xmKDIqZPM3XmYxRM4NFbX2h8STXhl/e5Dbwi82m+89h+QpeSYzm/XLKyCpnWt3fA+uueKOsKKCWbseG734ECX3sJGg9POYOMRB2Y/eKhAus7b7E0uJLwyh00/7vZVUoET40LO5CZCvla8zRZxHPUujz5KDNRCLT1PGeloeA352er2BKGuC2bTV+7+Km2zTA3gLv6ta1z2EH6643//gpvXV4bRG87Ifz1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEBGmgYSxBJx3D4sfiZi9xu7AqMpU2xGYgJ5OlGOrU4=;
 b=SUHyu4CtZiV+g7GkjyT4Hl8vlwmZ0lL3shVTGi1O8SnRj3664dO0fdGdNVHetc+xIUnx49GVaPGht93a+uP+cH7cn48ayBQ1FQJzvkgTybbfN7o4JMJH8JyFe2LbJ+mwj+JFx+iokKx2Nrb2lTk5NNY5M5kSfMPBSKSSoHBpJz6gq59JfQJTR3PVbP/1smOMZWK4ueRTGO3TbUYCdbbUC1qL5dxgN7hfs2j/1Z2de2kK2jTRkbrIeAkoHAgC547dnxFe2CBDbdamPou110RWHDbNfZdIt7CWVE8JIlF2np8BYEKzpWL18DKHsEl1vvgbeZd92bvUKP4lKj1UM2qSfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW3PR11MB4697.namprd11.prod.outlook.com (2603:10b6:303:2c::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.20; Thu, 9 Apr 2026 15:14:54 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9769.016; Thu, 9 Apr 2026
 15:14:53 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] netplan upgrade 1.1.2 -> 1.2.1
Date: Thu,  9 Apr 2026 23:14:36 +0800
Message-Id: <20260409151436.657902-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0123.apcprd02.prod.outlook.com
 (2603:1096:4:188::22) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW3PR11MB4697:EE_
X-MS-Office365-Filtering-Correlation-Id: 103877bc-1ece-41e4-dc41-08de964ac08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	BcBLd3cF96R9efTjR7OFo5DgdfzwFC8Vj8PnFoQxUbRs59PAXPh6KZ2LSoG/gIQfVeXvX0jRX/hDkEcNKUJkVr9ozTXqmdwozwAQh3C1/1+RRe2xayHHrwFh91hjdYefCvAhiwp9/UY/n31NgF/XhPkLRuLFmIXlDx/7+guf18gnk+HqUMn2JagxvIxFKpJGbbLd+9lPccce+2Ud2R+pA3df+1VoVKxr6hD87zhizP2uLC1H8jtb52Mp+ld+JiA92B6Gd/acJWQbbDlrvpyP1vdUre0frhqjpKwPzCn9aysInE1tOXi7jizIIkYs4ZRePe68SmmCxViDhtpxQ8+2Utje6LCQ0gb3BFaIEJCMVPYPxk4eoL0N9LTPMZAtiNnEJUaImBOXViQ+9XBZgB9eFAlZUlIofrKW8Q6YkstXhV9YgAScDXFQ797ZWO+iYty3C6AP5+qIO7bCfBp3+T8AS2eKf+1YmvMAHYiUftVR1+SWFnWE4ZZ2yEnxey8qkBwn1d/Rb4NNETACzylfBSQ0CuPYsga8Bfbxp3Mee0RCm82PKQMCZT2M31XLLCUQ0ugo9eMQs1FCX4gAfcgXHj7TO6gcXh3lnSk4Vha5En98lIU27vMas9ymCE/0yFHkA7fU5Awkxzj3iLCaPduqsqMLdoKEXjZI+ORFdgosoFJjtSMOqV0fmQ7i8yDULdF+Lk93W7wmUVtN9OaaGUC7MqlzgOH9GbklF7mitfNIcILm+ABl/7TRCfLbFPpc1D8y3ddZqeUGSEy+ibVNCGRnmnx43BtIHJ7UcOGlelkGqsb6py4ZHbx0OqTXXKYE9lYf4wBR
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qKtPguT8NOJPRehCKWsDEy+THjPy1LJHm9QoszZ7Go2GJ75v3/1X0YbJ4YPt?=
 =?us-ascii?Q?6zdJJI16h9smcpgTP+RG3ftjNK396XiytVQ6+9yCLhSRn1tRlxtJTlB8IxDT?=
 =?us-ascii?Q?Yrgl+6muHFmfhycnFuC9PRNWLBhdeY3f+EZFfb7JgVBpATwU06ZILev2lqPY?=
 =?us-ascii?Q?9pgJpXvbi9UhIqRM8wKSPb6L97qOiCWcclnZJ3+dm17wgWlcMRAnub0dFhlp?=
 =?us-ascii?Q?e8r8nBo5RtXAtDfdOVyd4T0udC49ftTtE72NEKg9Kk0DxxSOckrqiiZk21zN?=
 =?us-ascii?Q?vYlVI7Ijhs5ZxGF4gf/BaUNVauyNHnXTrPOxV/XssIHIf/HT7DenDDqlJwZf?=
 =?us-ascii?Q?d58iLidoDBVsylQ4+9hEaB0bmjlkbZ88Dq15pKzLFLumB4QXxKDR43Tj9jWA?=
 =?us-ascii?Q?T+YNlqpQzMipX+SF/6a82PzOx57h9DPZy+Ze4B9/feQTEOZaBnWhAcq9zEVq?=
 =?us-ascii?Q?axm4dVScXhf52+XYDlAExQ/3BgbJJ7RDZmaxY3CI3Si8iAywftenVbpHI3/B?=
 =?us-ascii?Q?3FQVXw72qh5lEg58aeVlYKjXgUiP43Yo1yQ3halXrM74jXjpcaJ7FrKiAEbq?=
 =?us-ascii?Q?7N/y8GNX2mwcR6pkbv0Jz3j6gEDTbob5HHCT89L3f3Q4Z/E2K49m0uGQm574?=
 =?us-ascii?Q?N6vvDsvH0vBz55nOTQLm4mp4FkgEuHmGELGvfZ9lLPMXaN9InOup7GxRg6Of?=
 =?us-ascii?Q?GgM3wVVc2Lo4uB4UhB0q7F3yMxcYv0+4gYEUFWd4Z1FGwtcafXRdV8HHopIu?=
 =?us-ascii?Q?IRaydDIqCgunSEK2CZvAVZJPJHJ9H+dI1pnzOM1KEbgR9vldtNx7FkmP/AkE?=
 =?us-ascii?Q?vf9fLT1tL0KtRLgdxWVwyY3i0d7Qv4Q6pxIp/hbd+rGwPDKk+biLNEvcxJwN?=
 =?us-ascii?Q?0wWNUU73Y5jpyeq0p+9DwD+xjH3AbZpKnRQ/+DUVqPiBS9QzXrz7L2XF3lx0?=
 =?us-ascii?Q?iS019kRCm3HpQann3G0V/n4SEt5bbdLVHnqGELD+G4rdxTPs3tqK9b7h60eo?=
 =?us-ascii?Q?mhwO9TKHpTtKAWrGYMIvvK9oBU8pzF2jLM/QcjIQw95yKZjXPRrJbem8SovG?=
 =?us-ascii?Q?uzR1nOYxL9T5Ic2j4Xe6KC0Tv/O3UFXYMt3dscoL8ddh3jaqYiNSwxknFb3K?=
 =?us-ascii?Q?ViDV/M6ffwS/BFAqdcKAYLsUbm/XB/fNLTWd//G9jjtxT59QxLcUWOzcBM1w?=
 =?us-ascii?Q?N1pCMAwR/m9Yq7/y8SzT0t73yhJwwmMuiAgqv7TjPS/ZxRKmYmECjBctT3F3?=
 =?us-ascii?Q?xVuHek85nArfgAgNOn3z7WwF1G6XiwcPNLx3Gc/VWNfUS8SSoxqI2f+/+RYp?=
 =?us-ascii?Q?s1FwVDoLQ4cOPkRAw7BvLdQstJ7iCXMlAl8Xk3QdSoYHNC8PwN6jM4igk0H1?=
 =?us-ascii?Q?YSOZkPMF3TDQi07/FY4OQYbL/IdrC4ctEDAgsQk9FXjSZ9iQZE46qfDe/CsS?=
 =?us-ascii?Q?TNd1fAVi3noGyHgnDxuHY40yyPGu+GmdWj3TiOzlOmnv/sO9/NaxIW8kDNVs?=
 =?us-ascii?Q?5wE5N9Jz4QzZG3Xt68WLt1rdqelJFE4dr/kkCl6QlU7rmLbWLVh+4h1MtPCp?=
 =?us-ascii?Q?qfmSDRHb0feDqYo48We4AFDDh+P5F741rJJvof3BTgomGhjSLawWnRcXlB1m?=
 =?us-ascii?Q?K4p06YRWm+DvbhfX6IaRjyWQ0+bCxUuvvaHoLnCn3L61yEJVyglseFeTtDbY?=
 =?us-ascii?Q?JRYjUk0fk6ftW7yIch7hQBTKXi3e3DHfbmS/zd0ryneSGrw7b/L05AuvLac6?=
 =?us-ascii?Q?2/XyH+AKWg=3D=3D?=
X-Exchange-RoutingPolicyChecked: 
	wE60LBliikaNonV5HrE9sR0ETKcp+xo/jjHPmcI7tGtgcjAlXwG3AljLnejGV6ICvHZn9uKTMc6dgC1r6j15Dy9OaoC0OWl5yb15F3068f8tor4C35yWmBDdx59pzQgyjkhpbDIeB93PBSh3tN2JtVDunA7vQrPHSSkfCsIjbiY9xiwExKTISDfzSXMLLIdmyyxKVoGZYEbwW+HqhPgpavWaEqh3qn9ATXceMJmcIG27u67szmCgHMDUPc84ZawIkIyFSMVDcaBaoYQk3XMLdhhUxvbY+EbLoJk4yeEjUoiF2nH8O2xiQYxURS1U36WG3OhX34OZVWs5nRkOCB5EBQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 103877bc-1ece-41e4-dc41-08de964ac08b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2026 15:14:53.7644
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i1BhSVNQ+x+J12Uh9fzj3IoQUFG0vLz2oBDKEfX6ICSx7gNIWpBwfXrCAIpFt5K8Yk92aqYpEwpugL6qgkU9Lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4697
X-Proofpoint-ORIG-GUID: lTmHCsAGbfJQQZCy6btRkzH3W--kuWtU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEzOSBTYWx0ZWRfX9seVwUDFbKtk
 +hgD869ZC1nsmuk5pjVyjOjCi0UsbnzHX7dKHBcQrtMJSUYqeNxjGS0Z0Xx1exTg1yoQ6wTrOzJ
 Ou8rxqt3i78mkPG9zTtBKr/rqZgBXNiOEso6/f8Mnjkcm0TCB2z5OUoAYeTEPH+O62RRylwPzkH
 HTazeDIB8F8V8+YoUctRP+UXAucFRDRFrJvAS7O3a5bm1g1/z7pioo3uuzZlKvUA1mNyxqP7fzZ
 77mPHCwp/guBrDajlcEIBRlS/ox1TEJhM+zhvP67ZqodzqsKZeguDWeFHbztoLAvykWUB7OMCun
 yOeiYzg6AoDLAhzoJkzBo8RToQ7UpttrtvNKh3FVMhVgult+7+4Cb/AcXKifLLj0xDZuwpwa7jS
 fqCiNFoO8QR+Nb8LEc3Z3PkUu2UpHLZJqqZiCc/GRBQDk5H3sKAC7rLAExYkQCyKzZlpZbALtQP
 SyCa20v8XGxserFajpA==
X-Proofpoint-GUID: lTmHCsAGbfJQQZCy6btRkzH3W--kuWtU
X-Authority-Analysis: v=2.4 cv=Wcg8rUhX c=1 sm=1 tr=0 ts=69d7c270 cx=c_pps
 a=Pnh5LeqhM4XIZ/aCP1A8uQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=jYI0E4KPAAAA:20
 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=n4DpONUZoW23Qn3coUUA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090139
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 15:41:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126201

ChangeLog:
https://github.com/canonical/netplan/releases/tag/1.2
https://github.com/canonical/netplan/releases/tag/1.2.1

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../netplan/0001-meson.build-do-not-use-Werror.patch      | 8 ++++----
 .../netplan/{netplan_1.1.2.bb => netplan_1.2.1.bb}        | 5 +++--
 2 files changed, 7 insertions(+), 6 deletions(-)
 rename meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/{netplan_1.1.2.bb => netplan_1.2.1.bb} (90%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
index 663a80ecde..8d5c3da7c0 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan/0001-meson.build-do-not-use-Werror.patch
@@ -1,4 +1,4 @@
-From 668ee79f39614ad758edd44c42b8b0eff57877cf Mon Sep 17 00:00:00 2001
+From 3790a098f4905cd330234fc4d18b4d4536b360bf Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 3 Oct 2021 21:52:16 +0200
 Subject: [PATCH] meson.build: do not use -Werror
@@ -12,7 +12,7 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 30f33fe2..0b214795 100644
+index 6f517b5a..2ecb7f5d 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -4,7 +4,7 @@ project('netplan', 'c',
@@ -22,8 +22,8 @@ index 30f33fe2..0b214795 100644
 -            'werror=true',
 +            'werror=false',
          ],
-         meson_version: '>= 0.61.0',
+         meson_version: '>= 1.3.0',
  )
 -- 
-2.25.1
+2.34.1
 
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
similarity index 90%
rename from meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
index ef1945b4fe..22159dbcab 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-connectivity/netplan/netplan_1.2.1.bb
@@ -14,13 +14,13 @@ inherit meson pkgconfig systemd python3targetconfig features_check
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
-SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=stable/1.1;protocol=https \
+SRC_URI = "git://github.com/CanonicalLtd/netplan.git;branch=main;protocol=https \
            file://0001-meson.build-do-not-use-Werror.patch \
           "
 
 SRC_URI:append:libc-musl = " file://0001-don-t-fail-if-GLOB_BRACE-is-not-defined.patch"
 
-SRCREV = "01045f683b9419beb90119497cd1b2be44e83b8e"
+SRCREV = "f758e3f6415aa68b7cf28991bc5b3e9631297d6d"
 
 
 DEPENDS = "glib-2.0 libyaml util-linux-libuuid \
@@ -43,6 +43,7 @@ PACKAGES += "${PN}-dbus libnetplan"
 
 FILES:libnetplan = "${libdir}/libnetplan.so.*"
 FILES:${PN} = "${sbindir} ${libexecdir}/netplan/generate \
+               ${libexecdir}/netplan/configure \
                ${datadir}/netplan ${datadir}/bash-completion \
                ${systemd_unitdir} ${PYTHON_SITEPACKAGES_DIR} \
                ${sysconfdir}/netplan \
-- 
2.34.1


