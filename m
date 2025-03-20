Return-Path: <Haixiao.Yan.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA427C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 05:40:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1092.1742449233301741352
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Mar 2025 22:40:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=51749bd76b=haixiao.yan.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5eUrd009323
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:32 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2171.outbound.protection.outlook.com [104.47.73.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d0h95g3x-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lG1DTm1dZ/Sv62aBnQHBTxWk4wfh78oU/YWQI8aUwm4U5LpSSwfJ/1MLAgrYCo3zxx7wxSWZckctD24wgqTbBuvbKWJ/PLv6H1n8wUWHHTWUjIPxInsyPCbHZ0DDFqTL2TElTD/7aCJIy1NnA1CQCTIWVZ7R13pnf71xoIRrY1tOxdpTGjnTcY+kEJZBw+PQuHUDpIbKwW9XADKiMyEh/yrnIww4tyfN+SSOzYMknZnIbIoVlPaH9eklDxVmn5EykiKdwA0RdttTUZqLHQD3bvZFqeGGhuhN68w/JHS+e6EkCPpm5d3Y+J52Anu54rU+YVeOLKEO88Kk0oTaWz/wFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jUAUXMGfRkRQY7PwIxiCddHZDaWrGYDLwodUTG5kAto=;
 b=YguFZc0MdkobWL2FSVcD8t7bKH4nbsY+sAWbHUYzipgChZ7JKs3Rdsjmv29F1GKpTRrFLDck+145CgltfN0NH0uF2jjoLd7VoXfnphh/6qmZ2kWkpfqFeAkubdVAxHwErlMSZ7Ww9vKiAl2Qczsf1hnLeqQuOa4N4Wr6h47ZgObAz20uKTPOZzAR9JY+YTbIvXUljdWbrqm7XVZ02d5ny5mOxSCcjUa8oME1EymLh8KcwhlwPypGjTBVUwYK4zMDezqs7c7GY4k9UlQqUuvc5OHajNFH9X2McP/ZPQMoASOBC8SQD54m7vh6BeqQU01Oa7CQIzDX8X5ygLIcdcLs+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=eng.windriver.com; dkim=pass header.d=eng.windriver.com; arc=none
Received: from CH0PR11MB8189.namprd11.prod.outlook.com (2603:10b6:610:18d::13)
 by SA3PR11MB7433.namprd11.prod.outlook.com (2603:10b6:806:31e::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.34; Thu, 20 Mar
 2025 05:40:29 +0000
Received: from CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4]) by CH0PR11MB8189.namprd11.prod.outlook.com
 ([fe80::4025:23a:33d9:30a4%4]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 05:40:29 +0000
From: haixiao.yan.cn@eng.windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-openembedded][kirkstone][PATCH 3/4] eject: fix do_fetch error
Date: Thu, 20 Mar 2025 13:40:08 +0800
Message-Id: <20250320054009.838158-3-haixiao.yan.cn@eng.windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
References: <20250320054009.838158-1-haixiao.yan.cn@eng.windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0191.apcprd04.prod.outlook.com
 (2603:1096:4:14::29) To CH0PR11MB8189.namprd11.prod.outlook.com
 (2603:10b6:610:18d::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB8189:EE_|SA3PR11MB7433:EE_
X-MS-Office365-Filtering-Correlation-Id: 16392562-e0af-42ab-0b41-08dd6771b909
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?OEBVfDz3CdnNjC5uoM6Px7ogqrGSCwark9HbPaNxIRUqoe45U2ADeu7EvVX7?=
 =?us-ascii?Q?VWWOmYeG5kdcZ3wmndZOc/0rNT759BeosOtfc4PS9g/Bd5r5hf/6B9MPqSWW?=
 =?us-ascii?Q?vmqNxCJokcPmO4FOdWM0ojFrgJqaWZZ227dsc3wtvfCF8G7oUQeLs5sONLiA?=
 =?us-ascii?Q?s/T9oZxuo7GoZCdjkyBX7P5ERWs6KzqQECgGFbFw3pn+jwmhpGWTAEuEPoGB?=
 =?us-ascii?Q?S8WtrxExZcywnxwC+epDPkqUlr9oDwZtvCSO2j96YzuFm/oMQltcnWuEans9?=
 =?us-ascii?Q?d0zXEExGGTp1S2JeKmPr5Xg6JVdqF9U2prjb8oErA9jChxb3vV9KUjWtzQvQ?=
 =?us-ascii?Q?FnR15dvGlxD6VJwPdj36hFzxZcHZ6r12VQ0bm5Nxka6hpBI4EckdkRyuYjDt?=
 =?us-ascii?Q?7aC2vYlE591hYQpSOBAgdpR/F9loz74LCe54F/rO6syGfUYS6eBH3pw97xHX?=
 =?us-ascii?Q?jiy9S6zUybsi4qdAcmPuPQAq4ISCpo4yV8+DkxyPis8fKZ1YzYBTjIQpOd1B?=
 =?us-ascii?Q?7tGc5aOrBrwx5u4oaHqqGyOsFfeW/1CbRCFE3bZNlk1I/qi8pgfKuPKGMR8r?=
 =?us-ascii?Q?6l7izmZdSixC9K9v3vY2C+2uzgCzEFrNlNEVmV0sFzzF1N/Th1OGBBtlUJOJ?=
 =?us-ascii?Q?LE4G/hfyeVsWHR7R4m7eh0UIA9yEM8ZHsfIJUnMzcWLM+yfXFksuPHkl0VEL?=
 =?us-ascii?Q?iPVyMIQUwFiBBQj5WPn10VJYOJxYMMq4nGbGIDlor73UQEtBnGWKdwE2OZoq?=
 =?us-ascii?Q?agiAGuJ+Xh3eeAIEbRMsNXLxvpcLC9cY8bYnU1t+0FPk7e32rDE18kZHbEwi?=
 =?us-ascii?Q?HaC4dqxBXUkXeWke06svSJPpJndziIbX8Zfpvq9KIxIjSl7e8TQjUQi/a9qZ?=
 =?us-ascii?Q?nZaw7Z+2W8IrR/sbvH7nLV2ucA1v2FOB8L0A+rtq6ncpan4h9upR2KJkwK6I?=
 =?us-ascii?Q?mEjTORl8w48om7ZUpyWtNYIKK+pd0Pe5oyUSDrF7c5kvprFRic+1iA+eknGV?=
 =?us-ascii?Q?2Zs+Jo3FliAVaDBC/jdgs82PoV4MySyI2UgCAOSA0DN/wOvXKtYJexyoNFru?=
 =?us-ascii?Q?Qi+C2mpBVYU6WBlfi/OX15Smznxd1Ci+56jHM4obGtJyW6FLfeKCAA1tqPRm?=
 =?us-ascii?Q?eXEEAkT4P86eHg+1HDbd7fJRD4WQUk2Y+BEzxJV1PEF+6Ieih3jDfGXo6cnm?=
 =?us-ascii?Q?B+bEGprJw7626AWY7bCCy+ofwLsBAe4BUqB105thihISVrpHvkG3HkEvczuL?=
 =?us-ascii?Q?lYagmyE+xvIScl8TRnksbf9uhZSEoPjGgLvtt+Iu9V5PLNlrt32EoNc++uBc?=
 =?us-ascii?Q?mXzJHTtU8lViLTXVBuSqdeaG3FYDQAYdkpMhogoCTd4EmJD8jYKw76x779QP?=
 =?us-ascii?Q?lf9No/2DkAbxyQuLrVyqBwH+rsP3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB8189.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?tve0b93RqaTwrCxVKEgikcffOY72+p6h4VImheV1XKbMDMOLx/zKW7oL8xri?=
 =?us-ascii?Q?lF6vt9e7xuY/AG4nGha547tGauK4mg0AS8tELlIq7Ey3+erIe739oEJjdFBk?=
 =?us-ascii?Q?TK0xAKmxeT5aiSo6qoW0J/aoW0hrisEi7LTiNVND96NQgAfHvocMji7o0drQ?=
 =?us-ascii?Q?8syY6HAUmgEEIdXgwH4U9IlN99Y0C1hKtAxKlToFmyscsj+pPvfLL3wgfJeO?=
 =?us-ascii?Q?LfgfzxBiViaUTo6Z4ego0LzSKjyR5HOpR5ipyVwh+aDSOQi39HaF8Pb1KnNC?=
 =?us-ascii?Q?cTsFm3962RvBELg9oChXe6TqTviy8DdAlkH4oEqn3tGEtjgd+jk8RgB7w3ai?=
 =?us-ascii?Q?TtzY8rD/UyNrseXYBC0qEu13+5BDLPSKig4JihLtwDX1gOj0YiaKWTaU3MfQ?=
 =?us-ascii?Q?R40ui6LAy/PmtK24GLpAAyb1pZ4BcPj7TxPrh+atu0KrwRyThmCUnSWxAhPm?=
 =?us-ascii?Q?/SCduDfhfZb1oSrUqWQEq3HJyG6sAVqft1EVAmILegoYuhjgtahzMonalWby?=
 =?us-ascii?Q?/eIz1p5Y9M9DImv/JUvsF2hLC2V5fDOA1FjQts+OLytQVe9V/u6e/MlliNQq?=
 =?us-ascii?Q?4SA2RuamA18JiM/tfYRpvF8edE1dl/fKlfLAEGGmiwiLC84uN4b71LiHA24W?=
 =?us-ascii?Q?lRGqZl5RcTMUxW73nWdynN2DYfRLt6L3yHWMto6lqoYa+RKuQoQ9zVNqHNFZ?=
 =?us-ascii?Q?/3sWdjeFm3bsX+rtjnGGmY5KOdz+fCyj2/QvZCmAERdBbCzpjBSrpAKxvrtN?=
 =?us-ascii?Q?BOLv1JOm10vNCxNjsGnN+0XrTMe75Uk3AiDtT1C4b5pwN+zqwn9SkS6obANg?=
 =?us-ascii?Q?xJLmxnmdNvMVFDGhWoZF0myfVAtUk+LQw/O94ewNtQI1cwFge+gkLABSylsA?=
 =?us-ascii?Q?hdEHcXhZesfZ1ZV9DabmWMRWP37G/yGJSFoxFIiSRoPsILf81K3s7y5Pgb7i?=
 =?us-ascii?Q?+p0fAtgyncmQeAcMo5Bd04cB7huicLzeMfQqzfxl6IGhJT1B4OWzVRcLlMV6?=
 =?us-ascii?Q?1UpZQAL0PjqR7vXEu2cH3PYWTUu1owL+Dc/9juWptdCji1HH3RGtS5JlqNoh?=
 =?us-ascii?Q?BXFs7C3rcdYOaUEKMXA2D0ImfJ1x5qKzya5qj07qN+hyv35TMR3g37vUuXTX?=
 =?us-ascii?Q?PSDD25n/Bo+0aAkqPxzHoK1KWMbJFzo2cNQeLkPZxVbPM1MzLZ9L6UQryQKY?=
 =?us-ascii?Q?wxNBwWM9GJPEcP1+gCvuEVl3HLusa1Qf8oaPaFJWuPCpNavQFAKUFpxzHdAb?=
 =?us-ascii?Q?sEPeFRqlhsckBm2hPI5gKZX/wT8UwEXUCDQw/9bOK28weexcwTg5tyXp9FCW?=
 =?us-ascii?Q?KanE/jRkgIcafq6uT5AmzU3yg9V+fJgshsvPL2dU6CxqTUbCCCgkGgiSlKSr?=
 =?us-ascii?Q?A0nuchLRmVrDm4do6Pmct1zg8TWvYPF23stsXY9Wf4f/zguPNbw2CxufcrJr?=
 =?us-ascii?Q?L0I0zmbhIdxeZlXO4Ynu3wgDXpxGc67nS+dEfG+BjmqQylmEI6yu0c8EzRFO?=
 =?us-ascii?Q?RbB9cwYBeCRenMzRSq9us8R7TwC+xqib0rmD1aXx9rMbLQYawZW4LQcOc7d4?=
 =?us-ascii?Q?ySBjpNFr7QMJWYArvJtg7Pqhf6jGLjvf1qMROYc8tZH3iz4CGQ5OxyNggFRG?=
 =?us-ascii?Q?+A=3D=3D?=
X-OriginatorOrg: eng.windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16392562-e0af-42ab-0b41-08dd6771b909
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB8189.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 05:40:29.3360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Cq59anI+E0aRklXRkPObY/GB7K37AUMdwdF9NxxTmm0u7k3ZBtgYHUI2S18SF5kcsvVFdvnYaeqdUsPKZwZ7qmeqhth3Bk2q1KcFVbx749g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7433
X-Proofpoint-ORIG-GUID: 2FXkE1k5tSySdLs2wTnXHNffhG0yE3gR
X-Authority-Analysis: v=2.4 cv=ROOzH5i+ c=1 sm=1 tr=0 ts=67dbaa50 cx=c_pps a=n5+7iF7l5R/EKaY7dbRUPA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=2MUAHTJp_KMA:10
 a=Vs1iUdzkB0EA:10 a=H5OGdu5hBBwA:10 a=Q4-j1AaZAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=lV92gj4lsP10hY3XYNkA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Omh45SbU8xzqK50xPoZQ:22
X-Proofpoint-GUID: 2FXkE1k5tSySdLs2wTnXHNffhG0yE3gR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=693 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503200033
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 05:40:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116118

From: Jiaying Song <jiaying.song.cn@windriver.com>

Change the SRC_URI to the correct value due to the following error:
WARNING: eject-2.1.5-r0.wr2401 do_fetch: Failed to fetch URL http://sources.openembedded.org/eject-2.1.5.tar.gz, attempting MIRRORS if available

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit da361d2d7cf4501ab7a88bc898be187243005c47)
Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
---
 meta-oe/recipes-support/eject/eject_2.1.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/eject/eject_2.1.5.bb b/meta-oe/recipes-support/eject/eject_2.1.5.bb
index 33b31a2b1e6c..9990f08a50dc 100644
--- a/meta-oe/recipes-support/eject/eject_2.1.5.bb
+++ b/meta-oe/recipes-support/eject/eject_2.1.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
 
 inherit autotools gettext update-alternatives
 
-SRC_URI = "http://sources.openembedded.org/${BP}.tar.gz \
+SRC_URI = "https://downloads.yoctoproject.org/mirror/sources/${BP}.tar.gz \
            file://eject-2.1.5-error-return.patch \
            file://eject-2.1.1-verbose.patch \
            file://eject-2.1.5-spaces.patch \
-- 
2.34.1


