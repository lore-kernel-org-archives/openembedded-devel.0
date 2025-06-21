Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B181C7115C
	for <webhook@archiver.kernel.org>; Sat, 21 Jun 2025 08:36:02 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.3844.1750494960178803977
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Jun 2025 01:36:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=82679d94d1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L8Zqq4028682
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:35:59 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2056.outbound.protection.outlook.com [40.107.237.56])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dhy2g70a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:35:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rkni8e0sPyTRe7rl9ZKWXi6LkpPTLlnkeYat5vRQWiCzFU+IlzC8UA7kZBz3v2SMaln2GX6BRxDC7LycwjhZln34sq9b21NqNYy5zD6GcPBasGDfJKEI5KVPGHK0b1Z2J7HEaXcrBnVGMMDanwmJMLstuNnCHZ0Ww14UFHhsMEnk49LcrULhpQEnFwoxQTyBa8HvPo6SqgScaPwjW3ENlGOo4zwfTDu0WRfr6lm2bcVOWojSmA5ocyUpUxCN2pAwuN/dqxS74SusfXPljJN0xB5OJv9TL59gGPXa+QRNlw8x2y5bnXHT0v4MgvUw2A6iWhfL87S1Il9hWRw3RLH4DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h1L3KwH+VPls9EdpyUcukksUSAdqbYF4GTMoBr4AKaE=;
 b=iG+6Whs3BoyUeXq9EVXoHVjVW5h0u5b0oli487ukIcAsJhSgKKQ3ZZIbu1T5DPEToo9H3IdDMD2ePDXZJcmeG+OCRAc2lWKYmRXzwmqSwPCNEKVmq48Mmdfx4MTKjoEWdQpWy3RmYn7llMn3owW3/fobTi8KAPeIpfyB8TWRk9pw9rhd2SGXChw33pEao82ncQwngNz72H5fCXb7JCldg5FW+IIyoWqgvT6G6/Fy+gqjPXwR/T4EmbEnZVMKRRYqtfGhuVLW5j+RvwqwmX7Spspy2T43s6PyYLwAYxP5bnww478L9ts8jH1EXyIwuY5MOBOYynQTfwnlZCkYPIL/Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SA1PR11MB6757.namprd11.prod.outlook.com (2603:10b6:806:25c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.22; Sat, 21 Jun
 2025 08:35:56 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8857.025; Sat, 21 Jun 2025
 08:35:56 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 1/2] yaffs2-utils: update SRC_URI
Date: Sat, 21 Jun 2025 16:35:36 +0800
Message-Id: <20250621083537.35947-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0169.jpnprd01.prod.outlook.com
 (2603:1096:400:2b2::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SA1PR11MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: 6066eb05-6a3c-4f57-1140-08ddb09ea422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Xz7qy+7nSKJ0bTWA7FR8LbYf1DkX90zBp9aT2t+VZ0th6Ny1cfscpHLnJim2?=
 =?us-ascii?Q?K2CZz9bEzOhP1PDvIdSWEhBSx5bqP4InpTdTHOnhV/FIGqp+tpkSOqRTuGkB?=
 =?us-ascii?Q?ixqlgwVeviBbMkMz79r+ODkNLWcXZ/DbJ1vKHyUjd59zO+Wpo9A9791VynR8?=
 =?us-ascii?Q?plcpyHF9WiR8uzxMbTUPMuEWLXKZOBHe8bC4LQXJOldO39PFO/BnaH276ISQ?=
 =?us-ascii?Q?JFL4Fq0739epMyxRnO5K6VE0v8i2D2BkHDBz6sEg0QN/nqnSgV/ptKrfFhGA?=
 =?us-ascii?Q?8xHOG9n0lvcf7U8kb1YPD3CJa/Vvc8zuoWUu2spHg1w0IQtBLeo8m7jQIZaw?=
 =?us-ascii?Q?VizVApqSiMQYAPSBx0Fz1wTSQjidB1S16vFEvG/aHAANwQlRPOgwErhyzVuL?=
 =?us-ascii?Q?aqozYkcLAy3Lg1f4AlhJAON8g1SeqsNUWEddsaAUM1CSY4wl90IRjrsox2ts?=
 =?us-ascii?Q?6IfrDE2DTm2i129xYwNRQExj7G06Nom9j5fwrPrxY7yLJs1qVVu1KZr84pDQ?=
 =?us-ascii?Q?oGKoJZ/kZz0PBaZQxxnqqFkkpzYmglBMENa6r3tkra01mENdqz6fPLw0+6Or?=
 =?us-ascii?Q?10TvYy/XSe5FspZabtfijUZQl67v1jxVyzqerYONsdfJxXl4pLSIwEobeed1?=
 =?us-ascii?Q?q+2XEz6am2zbvboB1IGPz5HMYahR1c1gV+zKe8ty9UArY9vB7p6yCKHETCBO?=
 =?us-ascii?Q?eYhKfQY7MokJl+ytjlOweo4qsjYj856h9V8godU6xKTDDF177KTEGWqgESBW?=
 =?us-ascii?Q?1MyYJluxEc//s9OESo9UYxVIgIRPXaLXTudpSeFbuvvTYGTSBAg/zMtY0mE9?=
 =?us-ascii?Q?B/AbD/ggIU1szG344A8E5IJxEBzj7ZD6a/wlItFaXc37fzqk7C8zUFwkiDs/?=
 =?us-ascii?Q?1weM51fx2QEEwE3cQtPvz6UG529OIxcDXXBQJzWtLO+AE3krxVUk1TLhx0P/?=
 =?us-ascii?Q?XSObwUMjbaJgX1X2zPh1bpLswGzpeJfOHDBb2kY5hNsuZMnMG7WI9O16+fWn?=
 =?us-ascii?Q?s/SD9FCE5gL9nVezZ4YnfbbkiajwQVkvyW+aHFjajNBpuQ3uY2aeZDvNryCf?=
 =?us-ascii?Q?k+juWy1b9e0Og7MvkVYeP7jO1wfg9xpqzv/uhXsjbshS9rs5snA1rjrJw8Ct?=
 =?us-ascii?Q?ocbZ0kQ/hUcQbn0bFsoTAIJ15zU85qthMHewnmXAjTWgwCBO1bpswRB053Aj?=
 =?us-ascii?Q?qq5uJN+Jg3e3MxHLeM/7a8VUUYSctmlOMkGRs6NhGwmPS3UJKZI9kvMPTcUK?=
 =?us-ascii?Q?AKg5v1RbCQQhtRqD1Zj3F1abRipvxTGJ1VQtPELDVL+Mki9cuk2ZmmZCzzXB?=
 =?us-ascii?Q?45aUhkIp3S2zB2j40QOfmVM8LS/kK1NvTgqhqqyHamBjRqE14QHwAcv1t9SF?=
 =?us-ascii?Q?gEYI6jCfDBQcFzqRPoutiMLxJ67yz+bGfk9dmbKYC/+2SjDGgW8+lmGcYXYE?=
 =?us-ascii?Q?UAchWeTsQaw=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uvh4L6SfkjJU897RJMcvhURM+jy46WTfZM5iReAatcBrx7oMyRL8qPR4BkZA?=
 =?us-ascii?Q?YzhzsJBL47Dn+7MOumkeQmEiTGYgaXEbgXmE+pDPXcKpJbSSnIpH/8G4v5rF?=
 =?us-ascii?Q?yv8E6VmEMLCPbuKZrsyAWP8C6LlD7JmpGvXPELZhkE26t2BKxUdP3yjdL36Y?=
 =?us-ascii?Q?4wk6eLwNL1TfPbVzqdg7gyLeo9HHvrkTgE5+Z9+468K2Kv0ANbuQvzrRwtiE?=
 =?us-ascii?Q?9PIdD6wsDXFeqCE65M21Noqh437QYgDY1KdzacYj0Jhe4OBQlT9Cu9xBCJy9?=
 =?us-ascii?Q?7sPtotSkN1o3EK4jNlDddth41R/X2M7zSEJJ09ww6aDDjZFHZzmGGxBU/g7R?=
 =?us-ascii?Q?4sqZ/Y+Xu6r4eSZRpvM9xd0pcRYEqWMfhwUuHxDEN17QrN+DjKpgVIBH3F3h?=
 =?us-ascii?Q?x6VPtyyB86pv8hktQBc5Q8RjGBcvQVrzfVrgMDQBpmufEMmD+eifev9BL3XC?=
 =?us-ascii?Q?U81uCGagKzgItHlXnFRiBCOLr4gRgyFCl9Ds9XTmJ6ffgxGjCjSiOP0VMU9U?=
 =?us-ascii?Q?IboORyI5pPHcgCSzNA/WaiA5JtKiH1vLm/deO5JhGzI5wBGIlbyhZ3/p/Ck1?=
 =?us-ascii?Q?VAytJqsDaF3lV/1MFPDl5k7klIyE9rb29GwhlliqSlzwm2pRXp0nODnjskW/?=
 =?us-ascii?Q?Um6bgtITuehM/HNXsg7QqnymjbtqFBAXFuew/5e3Fq+9RVO7w7wUXantc/vu?=
 =?us-ascii?Q?BZFS3ibGNJUvfcBF8iFEqy9ZvovPx2Vst0IGD3GqTmXUVd0EgCib4PrU1QuI?=
 =?us-ascii?Q?mJEAzyYfE9UM6qtvYFG74OwCj+81HVXRb1nWmiq+UNmakmjrDReIzlVW9LqH?=
 =?us-ascii?Q?FgpdF7LAK0/BbxQLsR+quUQY0eEQkN39Wu8WmTTTL0/rX3kd7ZcAqV6QGDqI?=
 =?us-ascii?Q?QhmejcHph2YHSEz+yO2RNlboQjAnUWnp3Jbt35KvdMothXXwrtZT69/kQUlJ?=
 =?us-ascii?Q?6P3tyVkygzdU7KCWflkYdjz44LUVnMKRyNgS0yMbzoymIHdiA8ku+WX2qume?=
 =?us-ascii?Q?fSRmr+i7zf5Ohf5+Z5+Ppy/Xp6yWeEZNAxpsdTntTGaiAIBGosvftAaCGTVI?=
 =?us-ascii?Q?mAb74yRaFLsXHveisDSRG/xTQWkcEe2neZfx6nFNGw7UeAGodGUjFfyggkRm?=
 =?us-ascii?Q?g4ztUpGskzR4xJRmCTbdR6waWezTzCwkGImGThKjsp1QCRarbWahscGia02L?=
 =?us-ascii?Q?IRmmB/38lS8JozqLnHR1dsxZXe/pV4giNnVnXsQrDNE94wMuyfFOKP1lbPCO?=
 =?us-ascii?Q?yedpHzvepWCGAijQbfFonx17dUugiiKtZQI+541QddpG0Z5ssGFJJ8YpRkWo?=
 =?us-ascii?Q?PJ3sZRL+7B0V7ZT/7BTVQ/OyUJqM8vtJ2UUdTRgCUbFVtQOT4DJkQFKt8u+U?=
 =?us-ascii?Q?ZDflqQJrBLImNMK85yHAjenQbxuuLQBLvSyO0vWwPM6m4YMN6xdzRC8Dc+2I?=
 =?us-ascii?Q?wU0PnKyAMg4HwtVWK9t0nOGqWNtThiiwhzYG+zgQ9bJb4my+H5c4wvzM4Nmi?=
 =?us-ascii?Q?B6uInsxeuB95gQUTWjsYjFJkLeif80cSoXvZS6DP5tQp0tKUNScEzGbOENKr?=
 =?us-ascii?Q?d1QgeSl1DvoWmMWqQDl7jACupw+PZVEP+MyBEiYL?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6066eb05-6a3c-4f57-1140-08ddb09ea422
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2025 08:35:56.4321
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z077fpHG0VJf11gsN8F3jI1RutVdpnfeDUIrOxNAIrEJunB+MmgyB49Y/++Z2JZ3rUEg9eaujz5cB6nxvzZkSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6757
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA0OSBTYWx0ZWRfX5HD+7wQkJWyK WPYCp/tbpp3oHbHqsRBFZVfCg3XTQFURP7CLAoIkxpP9D/2OXXLPPCiklSYRfvVHn7vgG6qKMnL nL99TFpQ0s85CGFfrn8YiPvhYI+hX6k1hs052oEpT5SSxdyWRXmNJRwm+WRKLUaDDRuaH4UvF7I
 H49gQ3J27eVfwyrITtr4A3ebovkt9OklrI+FRW/3Qh1IlmHTxrn9g1FvfNaZAdlBT/esGSk6ulh 9QuIgiidAlKDvD3J81CEc9FR86VXUo54OoPWTRoCnWBJgzVNj8xmGdoKPko4mJer5nWxzqc/+iZ USnNDGGD66i9hbKNky9NE6I1/sTInkA0rQBDmEMjV+tSl4PmVmaSQ+nT3+qURQdIz59W7h0wOeJ
 M19qGIn+j+wYtR3GJaDoZqMXcSthHa1L9I3XeBGi6y79K2CeYxLpIRDQA5/VrbRpydu3u179
X-Authority-Analysis: v=2.4 cv=Qblmvtbv c=1 sm=1 tr=0 ts=68566eee cx=c_pps a=JdlQBdRp28aqpLEMyktm7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=tepRJbHSAAAA:8 a=NEAV23lmAAAA:8 a=STYFO222WHuhyi6t6acA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=xVMtpeRVmoib_QGw4vz7:22
X-Proofpoint-ORIG-GUID: H2E6tTy2C25KHMUqWZkUWulSgABEwubD
X-Proofpoint-GUID: H2E6tTy2C25KHMUqWZkUWulSgABEwubD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506210049
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 21 Jun 2025 08:36:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117989

The source repo has been moved to github.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../recipes-filesystems/yaffs2/yaffs2-utils_git.bb             | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
index ca5e3302b3..fbb10add68 100644
--- a/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
+++ b/meta-filesystems/recipes-filesystems/yaffs2/yaffs2-utils_git.bb
@@ -14,8 +14,7 @@ PV = "20221209"
 
 DEPENDS = "mtd-utils"
 
-# Source is the HEAD of master branch at the time of writing this recipe
-SRC_URI = "git://www.aleph1.co.uk/yaffs2;protocol=git;branch=master \
+SRC_URI = "git://github.com/Aleph-One-Ltd/yaffs2;protocol=https;branch=master \
            file://makefile-add-ldflags.patch \
            file://0001-define-loff_t-if-not-already-defined.patch \
            file://0001-yaffs_guts.h-define-YTIME_T-if-not-already-defined.patch \
-- 
2.34.1


