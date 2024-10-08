Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A28CEF172
	for <webhook@archiver.kernel.org>; Tue,  8 Oct 2024 13:04:21 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.8659.1728392657837175552
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Oct 2024 06:04:17 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=001195aab3=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4984XUVO013758
	for <openembedded-devel@lists.openembedded.org>; Tue, 8 Oct 2024 06:04:17 -0700
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4234yktsww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 06:04:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yTYyRbuMMKanxpIPUPV5a0qUxMHpE/M0yxdpkDa7w8BOlwSePjwOm2jwSdqYqdg0cDfYHKEXHrXcxR8NYrUjk8znZ5jFa63AVEuZD4q1ghIlKeIH/wA9h1bBJGi3rxrUd0/8Px/4dBQOwnKAg/XfU2O7tdewXSxtvGavBc7cJHVyAlRZJmS2BYocED6TB5TmZ5mosbhh+J47s0q1pCJklbyy6Rb61/eqGCKYl8/i5R3SF0Jj66Fs+m2A6NuN6yirXv8g0dSh8RmBISKyleO6H4tLQn5YLgep86EFUrbmssy+m8UV14iebB5YfkDuAJ8YGnnfr6vstlgM7Yx9kpND8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=toPtCxg3FBfX5hKzYAty7nMWAb0wFzmdpkr5Jmo5AH0=;
 b=kHdMlSzdLD3qwe6/1FbZwsq0JtncArLyv6dFxe7Ia52uhJ2nRkHHtUgbj1jW+Ify+HnOnydwWR7PN+21RxjExBKutic1sp3Qk4UQ+KT/RCd+48p/sHRBTYsa9ZQ2wAP0JV1ct8zfe97DKmsk6h1T6TwM/nNodf1GyVu5tvZKcYqZcQvmmmubeD6/lOm5LxbHAlUvlMohzmS0cxqXa2lHSzZI3QlvKlkOPei+wi7MiCjcwgYxenuO0eg+uyaY1H7tVTSP5YdcAkw5Fv8vTqk0xM08bpIUwd2jMxCxXHn6ps/g+oLVanLDHYFamkVUi+byqoaFZCvnjzMWRSRQFxUm6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW3PR11MB4731.namprd11.prod.outlook.com (2603:10b6:303:2f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.23; Tue, 8 Oct
 2024 13:04:14 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%4]) with mapi id 15.20.8026.020; Tue, 8 Oct 2024
 13:04:14 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-python][PATCH 1/2] python3-pyyaml-include: Add fsspec as a runtime dependency
Date: Tue,  8 Oct 2024 21:04:02 +0800
Message-Id: <20241008130403.11585-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0282.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::9) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW3PR11MB4731:EE_
X-MS-Office365-Filtering-Correlation-Id: b5cff2f4-1779-4058-0ee6-08dce799b550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CuoC9XKu7GyYGpHRL/JPtc2OLXQsGaPc4mKcZ9lPHcx4Anmh357zTtbMu9yf?=
 =?us-ascii?Q?JqjekeCCZQpDoglEaP/95/pKXpoPfnV0YNhOrpdWl5r2+0Ka8sirktdgksd8?=
 =?us-ascii?Q?EE349ZRwGPLWmNUDiXCdDzDYUqRmrg5jzV8HprfgK1xRgO7NUvl9Cdbu8bFa?=
 =?us-ascii?Q?UeGq+47DtJMBmPetNoTYMUb2cg7YMyK3EC2mpUnRBtJ0+cFr74aXPsXpzD0C?=
 =?us-ascii?Q?842jOMtUaj4xdN3GfP+rksiLcS0nLUxdnZaKmcFm/ouKgW8Phi23zqxudSpT?=
 =?us-ascii?Q?T/yc+6ZpMVs1w+cRKNtb0lsF6SvdGAB1+dpb0148DUpIajjxyTKyhEmtrXtS?=
 =?us-ascii?Q?Tqtb0nrov8yst+HJsMtnuA8G6HxLKeMnuBNrW3FbFbdZpwoL3yuvH9LmWKrN?=
 =?us-ascii?Q?Z2lkTFY2uzdpg5NmWEU/KIg2M/fdqTJ9PZo/mHIwXYD41dRBtiKiov+cuVWS?=
 =?us-ascii?Q?u/rQPqcFKy9VkeWqIMss8yE8fzK190KMIaVXuJSeF6BqgvfaEHIXi8bn+BJJ?=
 =?us-ascii?Q?2yvsPzuwkj47eB1xTUOQ5dW4sIEXc6ima1/Imr9086U+cYLshTxXWrFgVj5z?=
 =?us-ascii?Q?RXnPwbITfeadlIAg2N/fKrzTiwKx6ejSacS/lujWnfCYE8MIj+bw3sLBGt8v?=
 =?us-ascii?Q?HTUMoUWlcF0eUgOQK2VIChBGIy84Q+ZwfCX3l5xQH7b5Kx1O0d9JXEtgK9r3?=
 =?us-ascii?Q?FdA7tlHngxZ4b3QcFsIPNmlKU00b8Hb3x5Z19Cu73OGeqNZKQak1wnWI/ctl?=
 =?us-ascii?Q?nrsbOZyQPOx7WzhX7JMxdxlS7BJaOxXyh2QTV7F2bLgbLF75c8D1xZ4F7TOg?=
 =?us-ascii?Q?MmfDeNSpC192lNpThU563kkjeXI0VHjclnVvjZtw43wpXfQ807W7CItJ2/Ep?=
 =?us-ascii?Q?uPGtqqfm1dOfyH6ArXK4xFJPlLQwL99rr06Yv4KFo2CYBCzHvotgGaORiB+r?=
 =?us-ascii?Q?z1LjfptaE1SlWeJurXObuA02/45lP+D6v64HmevsQbLftjQwQbnfcBmUObwh?=
 =?us-ascii?Q?sU8M3/scwZlzD/xsJYxt+Ftl5vI3YGkRIrTo/V5+2ff7XW60t0SexCfzz8El?=
 =?us-ascii?Q?6123v3UQnwIZGuj8wZWa7ViNm7E2o2Eicbj8EQhlO/g57LF6aTWPmqVHbwSr?=
 =?us-ascii?Q?tuYoVZ2iIWqq431jkHoPbuT5x+OJj9uuk8heXtUZQquTYFzmHtyHSuQITFv+?=
 =?us-ascii?Q?DKbbKtcX6NUuHN2Qfi+nh34tusB0YwgEj3kEq8McfXygV9kaAA14rW+FDRmf?=
 =?us-ascii?Q?gV5cPgkjpabgVv+wlqjkzw98FXE8XTdwuxUWHWGTHAHBJEEj6ZlZK9yyqaAX?=
 =?us-ascii?Q?+hpEouQ4ordgra/6Sa+0kBRG+BvQDbUnR/skXz+4Amrqzg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?bDPwL44DRwgIuoHjfOV0BBUEkMxHkUKKKCZTAfAjlotEbEoDQxr5xfr5uQUP?=
 =?us-ascii?Q?eezhjm5ofVZh+CQamwTDtnmQEii6DdR+NjlCtG2j6WqGh3qAqel4LrPHV36a?=
 =?us-ascii?Q?/7z5bU1Tz8aCth25aeKVC8lVo6ZO8gTCoaUlly02PZpEjUzNuUjqwYq+/H5J?=
 =?us-ascii?Q?mXFbvaT9v6ynS/DSo1AJy74jIXj2fRkHfI9OMLjyMGVP+yunoToN5RcLWX/h?=
 =?us-ascii?Q?YvMOU4GqEivfxVzZdGuLvqwJ4X1TnZc764kfjAButpBkGV0N8yRpepqOdm4l?=
 =?us-ascii?Q?UFGhyP6BIvcsXun35RSsAQx7ARjeYO4ABrZCPCm893wR3loeDyHxmn1L0ZcC?=
 =?us-ascii?Q?r2mChnhKtr+TLiWiNYYdT8LyWmZ+Q0VvMQofpBM58kJ0DzUhbLlXEeKMXsfj?=
 =?us-ascii?Q?kl5bAI8bBfPH7aHbYDDkn2Ep0TAaDZBsWL6uDIqpLcDBldRMBJTebNDQyXgw?=
 =?us-ascii?Q?seMHuekGpzg3zppNT+/q32ydBrohANMRl5i8NHcEmW+PYTA+DVpRp/ZwLLPz?=
 =?us-ascii?Q?uiBK/xth7DBgcWHNtqb/TQ+Fk4Z0RN/O3Upg5P5cmR/6rpzczHTdTPomVTJF?=
 =?us-ascii?Q?BU/QloCF8gslj+HC55NkFxPln/19IXD0CceR8XI7mQsWGVzzyoX7QvT/TX3Y?=
 =?us-ascii?Q?kE0wIxu1o1KP81SvTlO58PNcxRnjQnux4OSZDt46n7b8e0IjXLHWP3xpX1b3?=
 =?us-ascii?Q?z428Wg3V04mygIqTOZpgNTHelfHIQcm3jJJRPnzfhMVD5gBkgNiCZlznD0yH?=
 =?us-ascii?Q?dWUA8JTJ/AiZTNHVrM/zfnt/DuXAiQj25abEl9/YNt789JwXsU1tLG/61Kox?=
 =?us-ascii?Q?QHNNSWCJGNtpqDrJR/Yjap7fk3Y9SA5wGe3OS8eQw0muH1kaVx90R++BrjkW?=
 =?us-ascii?Q?Pf3h1pSggPzfuHQa14+YARCuVJbs8PPzH+GAVmGgcHuUAix+vZ3AuboU2VQ7?=
 =?us-ascii?Q?jVw97ugjSCPxh5cktzwYRabkKFKCltj8XIupPNTmBXPZdHuCCtpLcTj2cUw5?=
 =?us-ascii?Q?7itlAYO3uvuYKAB9BVR2oEQv/1FAgH6bkRAcm18Amb2A3XTW/9ZBDiZ/ecDn?=
 =?us-ascii?Q?f25pFrNOmfoBsgYulmOWU2LN66NlI+wtCa4Z3hDqSSe/5Fnb6kgfwjpgBx2V?=
 =?us-ascii?Q?IppkftVeTpJ59cV+xjFDEjK8DjuWe1dO4HFzAcfYx54HWceaG+vSeUUmJJkI?=
 =?us-ascii?Q?kj0uzczuR4Ykp9i3CyaEfJ3izoHToNAje87BLPQ+TvODduzh+MUuuAVSggod?=
 =?us-ascii?Q?51iws5/n6KaTnOR6XjgCsJI0xGtxTU80SgDQp1s17FFmFHD/7pfuuwabx3u/?=
 =?us-ascii?Q?sZN5blxQ37ffro+KSzOB9wzMe5ZH7lRhi0mfcAGVK9oRSThOeuo6w4zDSYWZ?=
 =?us-ascii?Q?WbV3WMtSUeBfX+4x03+963ev3iM6ZVlq8xx/47NkYjA5h9HYcmNXCMXhd7I5?=
 =?us-ascii?Q?94+t019d2Q7lP0DxiD4pnScu1YCVsYI8crv5EFBaYQiCEL5Aceg8CScA3jEC?=
 =?us-ascii?Q?4aVHZITgpz1Xt4RiwepwLqcuolGXsVSiT/diAr2Pj/nu7hmOA8DzwPL/8v83?=
 =?us-ascii?Q?hdB30tx4mOOSDp+LS6nxMH3zYWIkOt24/RE2kDr6tZ2AEyJnxkSJ4EeP2ABV?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5cff2f4-1779-4058-0ee6-08dce799b550
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2024 13:04:14.0916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9NCBzK9SN6fDWQDcalSYRDSW8tcntlsQl5XkNv/vUJDo+J7Uo0y9Z2E/b5N+ECjNdoMiofnoBGXuTL7HvTL0MZBnSwaVs9FqDc+lJ6STO1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4731
X-Authority-Analysis: v=2.4 cv=AKB5nO5v c=1 sm=1 tr=0 ts=67052dd1 cx=c_pps a=IYePPuTyj3qIg1BHBNk0GA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=XD5a_SSRpQ6rdFkqhwEA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ZxtoJ5zTSTSJHz5uze4LYR-9w6VVIUuG
X-Proofpoint-ORIG-GUID: ZxtoJ5zTSTSJHz5uze4LYR-9w6VVIUuG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_11,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 mlxlogscore=844 mlxscore=0 bulkscore=0 clxscore=1011 spamscore=0
 adultscore=0 priorityscore=1501 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2409260000
 definitions=main-2410080082
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Oct 2024 13:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112714

From: Peng Zhang <peng.zhang1.cn@windriver.com>

Starting from version 2.0, fsspec was introduced in pyyaml-include,
allowing the inclusion of files from various sources such as HTTP,
SFTP, and S3. As a result, pyyaml-include now depends on fsspec for
both local and remote file inclusion, making it a required runtime
dependency.

Signed-off-by: Peng Zhang <peng.zhang1.cn@windriver.com>
---
 .../recipes-devtools/python/python3-pyyaml-include_2.2.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
index f39b63ea5..a93a2391d 100644
--- a/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pyyaml-include_2.2.bb
@@ -21,6 +21,7 @@ do_install_ptest() {
 
 RDEPENDS:${PN} += " \
     python3-pyyaml \
+    python3-fsspec \
 "
 RDEPENDS:${PN}-ptest += " \
     python3-fsspec \
-- 
2.34.1


