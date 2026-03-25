Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECE3FEC11B
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 10:26:58 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19004.1774434401307931930
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Mar 2026 03:26:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Usd+483X;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=75449cfe7a=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P6W6vl2152221
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=HAqA+IveHTF3OMuoYgpU
	hUrGBqpHQWZOC1pyLTsDAng=; b=Usd+483XHJARmvu95fRJrpKYiR4s38zb75V4
	aZcukL6fz6J0d9rfjx9qz4YMCkIKiWFTjpwT+kB5tKOcf1abqcu1GqQ/BZwr4Mpo
	qyCesaRpeosqM0AhH/zj5VM37472N3LBW79Bp/tnKvm2o2yw6lzZQLqClQzZUWr6
	HVsTLNw2iF6kLGuVOTCF/eHGLUHgy8qY6EX943ud9jC0s8CrRFRlWUmoKtwdf3U7
	0+lyhMyr1QVTabLLyECnwW93KEDtSZxYIx8tnNoZkj67Sxq4D6OpIMEKsSe1qbLw
	25sy2CUGJ+ped2oSTcph3ltbbfwFDuA0WNgRhtnYMS5TJKMaBw==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012041.outbound.protection.outlook.com [52.101.48.41])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4d1ja6vt5f-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:40 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kQtZHWiGkEMqVNuCTQZTNfq7xaXkH8s/6/U5/gA1r3HPfn51ILzHsixRumKIwUMgHLiSS32Ie0u1wlTIn4TmNRIbCoNefGzRhGuLPcplHO14Foi5ljxiegYgVBztG5/Q+/zau8SkE3P7VaYRvuTXuitdZ3j+rNCRsVgiar+xpmAqqGO8hHkNEmXK8qTCjMxjmbccK3H84wDkPMzWbtRWf8qK5QXWCH923Z26/foPBP+/jW+Jq1+jb9bZiR/uCaj61zwldlJ1Kcb5ZFo6AOI4j00ofSARlfyBt5X2xyAzUr9x/qFOdFkpGchfXlfzAPtyPSmcB44BojjwvP49zOldsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAqA+IveHTF3OMuoYgpUhUrGBqpHQWZOC1pyLTsDAng=;
 b=YtzYU2h6p+goqJXefkpY5Jak0Pizd8wjSYGdtUI9gbuHqF4m+g8TYhzEZB9TiL782zohdzTmblcZHumNc5vOnMLK9VZOF0WOLu2Vj7yxFbZmmO+8EgiGFFqvqmd7IPGbJw9U7kXaMdM0C088ek3wDdQ+qSVfLLJvJbkg9svlwPOnS86XC/ev2HXYPFE1nF14Ub+qt3pL2WHSFhWSkiQ3E4SSzmFw9Og35KVA5QD62VJPAVk7i2cHLZmfupo5s+xvqBar+tJA1JHmXinCj0nmbYP9Q+RxLNpzhIgTm1iLW53qEvq7Rkf6iJA4Mh10TLhdp9/lsH9CTJe4DX65MXHqnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.21; Wed, 25 Mar
 2026 10:26:37 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::ea76:e083:b8bf:7484%5]) with mapi id 15.20.9745.007; Wed, 25 Mar 2026
 10:26:31 +0000
From: peng.zhang1.cn@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/3] metacity: upgrade 3.56.0 -> 3.58.1
Date: Wed, 25 Mar 2026 18:26:18 +0800
Message-Id: <20260325102620.1901081-1-peng.zhang1.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:405:370::13) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|MW4PR11MB7055:EE_
X-MS-Office365-Filtering-Correlation-Id: 57f577e1-495e-47a9-c228-08de8a58fb4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	Ngc7TjLshhduDrYlx6fsWerE4uPGbmc1QutLuUgy1Ajqf4dP2E3i5rbr7o3V80SSQ6Si5GWiUtSc73xfLwpioc/Ep4CBikEy/NKmSv6KoAWoboGgQCBi05xqi8uPat08jEVGC88sqXrcPo5shAjE+OXJeAj9Hp5VIjoRQGWs46mmQX9rHipqEY1Nnh5DiaWacEbAajUDqGyuRk9PH3L2SRs5bpAQDwjUJM8PSyJ3/Lj8me23GEe14sLU46BydDXjWagX8isXl4+nccHgooJYiQEwsipQW8B9QWEzqs3quceSxO4PUP+BR9k87SB9/RbHMEhI2/VVk6LoS2avchdJmsOaPdbyuGUZVL3K2bjeEtasdCOObzrfHFZMt3htuC2a71Wupb+Z8tbgWoBs+kQ9hDX2VVhNrTPGcsZnbpCIbBANQLv08/3ClaNPKL8cql9g3/mzXNcVSW5nwH7UK8YgNdfWG9SkVU7SuAKpM/Fou03cGTN6oornvCju/NRPL9JLE8k+tt0ZOaxYxIfKTP+u4NmbH2QQWCjl+Hr0GVzzOll8IZUXYAypyJxy+S+Z5P0IdF55BQdx3mtfQbJSWnRn7ft7hLa1BXZUOW61Wnm02UPxSYp0j+yEWDJ2uMNdasTzwBzM/3yi0e5djOXaB0ohukdH0CMADa8TBbDrKIMwEJWrHZ2sqPB5IRtelfaNRMoYjPL5wTQ7Idx5ZrEVonkssYlsTfNFWgkmIctxcjrN5YBI/7sAoHdkVuMnobpn90ngZX4rXtPYh59cOEa12e2324QvPpK9080r7HEAMxxRVs0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jf6Xn8Lbj8gLN3GILzbL1SiLMq9cHT/QyGBtx418QCif34KVZQVzHFY1rYZF?=
 =?us-ascii?Q?vQxM68I1OrD2+cB3pOHYkSd44za8wbSpPe0TEtIfL9w3lsPU+6uerHmA5Fmw?=
 =?us-ascii?Q?uVB7eyduMSTR7UYPp2kYi91+0gr+jr8LNsVgT98qESXXu4C5X9wgoOztvBuO?=
 =?us-ascii?Q?Myqp9jxtu2G45XWDEC9xC3LdG310yisx9e1JrcHztS5GaNplRfPRk2TbRigH?=
 =?us-ascii?Q?Cbl6E1d9R2l9IjoVU01utH8i2LWdqUpZ0LNIINJtIW1Ci93Jc8W4JEqw7mak?=
 =?us-ascii?Q?PlfycpcKj/PBTw31jD4dHzhnGd1LBPw7NQ5WLP7IuWVDu6QXgAifdhnWJdVw?=
 =?us-ascii?Q?mymu1tFFAhWIl2WNT3MK6BFiXDeAbmv90vocGje1Lcef/jktzQmVJEAItu/p?=
 =?us-ascii?Q?FbQA6G0HGnkJcOQyiEdEl3CF+iW/3NVeU5JZwAdJWDp/AjFNyDjBbsaT1tBM?=
 =?us-ascii?Q?GZnM2kSCHouvwY2R/kl7X9ZT6J/4Di3ddBCKx3Wa5ADqtSUeZF9aLi93EwcJ?=
 =?us-ascii?Q?5m7Xz7IyG4mgyC0u84IiqQ9NLJFsemI1S8eSfOUwHXbd5D5ROhIVXKwLZr3d?=
 =?us-ascii?Q?59BPcGeFFp0M8DDGPZ7NPWwsxnBoEnfcOeM6jlrlmpY9p7jb4hi+CI55hbZC?=
 =?us-ascii?Q?KOz8hfPFXbXUMUkxXzXVFDthz1L37FbO9I/2zlBtCtWKmuVIfRAWkLpM9VnU?=
 =?us-ascii?Q?wVPHi6qPo+/yMfokdC9veezWwMvVrSvGVS1kj3AYmi4XMxsDi1URWhdss4R1?=
 =?us-ascii?Q?rMSh5XEQVDlrqDEun+cqnGkBcKSwg1WnkNH60l6BKzGcw3mGCLd8rGZRMSUz?=
 =?us-ascii?Q?bQ+NzbnQP6MNatbOFJrknzoyUKSxupSBAlAM5CRR9GTjKPM8NmuudtHU+wf/?=
 =?us-ascii?Q?v/FLc43/QEjOVsJSBuNhpdExhocRUKB5GIXuqPd5K6qMjWWMUNL/PaP++Nr+?=
 =?us-ascii?Q?t6wzXXEccQKALw9vvydl4n7LUSIKErNhYCOAK+KS3rWmyyTgnKwKqvHtDFtd?=
 =?us-ascii?Q?PP0u5PICTNv9YpMnGXEEsrdp+aLQkAXNcmvEkDou1QEKdK2u1NYYN5ucNgKD?=
 =?us-ascii?Q?WTvdks+Pbt+oQU8Ktj67gW/sVPYhN8HdfxpdkzdXr8dYjSqgqi3R8+SnFA3H?=
 =?us-ascii?Q?GCQhXYAlUNzn+0HZW4iCui38hd6lVUSlcPsrGr5wFp17hU7WGSRjvopYgBfr?=
 =?us-ascii?Q?VBkqtmyb7xWsi0ZqEy/7hb6c5hBYQiG0S+feaHgWFyzgx0xdGUZ8fgf6giKn?=
 =?us-ascii?Q?kHO6kafMvwgpbd89F6skgLMZ2xTblXS2//2bWdb6jzJ6/oAEzxFDZNSKmIbT?=
 =?us-ascii?Q?Klux7UcOszAYw5jROrKPhjdGAAs9cIwPohXyio3hvuGseDEQr8TWPinMGQzQ?=
 =?us-ascii?Q?f4KLa1oWti/vah1ZxCVb0zJh7/LEC4VRD19FST8qTa+Nnv7P8SswJjW1a60X?=
 =?us-ascii?Q?DYXKCTpLqQhDitCqvt7FfuksUtipJejSQs3NReGN80B8fCu1LGgqfrVOM1jG?=
 =?us-ascii?Q?i9+dmRRJJY0xSr2KBQgWS0tJAbgV/rzAGQDeVSsNWO3fenMjhOgcEAQANOLR?=
 =?us-ascii?Q?nQsNWc9ThFTufaBwV5p+tKqztDFjD72UD1NpPp+lQoLNSdO9iGneUatllDLi?=
 =?us-ascii?Q?0aC/aic+rVc1WNSP9Rt+VzxRd4d3gq/9ZnrTmVRwzNlYL8+nNPPcQqsqeGx2?=
 =?us-ascii?Q?cR3MvTjw+UoH5XgGaJMrqaOoSO2lGnQW6zJfZ0CgczjRsZZTodsnXm36S1vj?=
 =?us-ascii?Q?J+H9//Yi8IIbDVMGGn9eDFgqzD01ryA=3D?=
X-Exchange-RoutingPolicyChecked: 
	qhgE230ipCOkGRM3aYu43GS9zKT9CNG3POyvqekmpvIlDe798oec6iIfdL1d6sFHoiGsi+pOxaPonVewepUEeoO4l0x3at7PCdrYfuVcVgDheUByamRp8GYQDayXInhkEDId2qeEkbcCrU75/lOaZGvckU/jIRTFvSrLMcZ8krL9vDzfZ/cA3ZdX9rZbm1HRb/BT1imZL3OlltMVgz+YHUOjHtgOl0sx7p4NUIUOLDfbOc+xINhhxALKqm7Q0JI+jiFwnSNZSVBhiPpOQU+Zxsxrvr/AJ13Gcm3yBAGHEZ1VhHBZtGEIHw6sgDG7uugox8tjyGVih2RqE4FzIlQmHg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f577e1-495e-47a9-c228-08de8a58fb4c
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 10:26:31.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rsXRIYHUGHyBS7ARle4Mz8F2h5UZ3eWytxdlKXT/HiGOwqoseoFLm3wzc4NetsPn393IBkLwCnZswUem3bUzr5LrsmxIKm8UjfDEbP7U4Jg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3NCBTYWx0ZWRfX8g3UqlXrVe5n
 oomNsCvq9dwQNzt1zPKX/vhPLrh6L9fKnFXy3JvCKhFK2yHC5cy+ZW1h58QWli2ohyxsZVos+bN
 DO8uK8CthGhxfAad/zV9gKMddcquNt/6mDMbtJCuY14rLjY+3PEetXqtboqfYC6fuzcPLNBHKAe
 7dNYlvN1R1CZB0dIW+KAZ8K7mOPH/fLpNzrLGodI3eLJjFbjXKH3dks6VVu1FRr2VcP8THHWCCx
 Y81q2R3yT5Wr5vu15PzKgNnC8m+FStORRGlD96c21+M0c/VcCgLNuJJYGigt/w6zncLSSSt9fip
 qRme+Zedg881+yWt+jcEGQ3dP3iXuZootwPF4lAFxKupL/A7b/MeMhcTd9D/2JFrv9MD77wqpnw
 LY3qOhyIwi756ahkFig7bF1/SBe7RHN96P1f31Bg51Zi5+HZF8bbfujmLGD6ubqetdJvmD0mkuT
 99tuKuTVDEADUXwKZaw==
X-Authority-Analysis: v=2.4 cv=Q5vfIo2a c=1 sm=1 tr=0 ts=69c3b860 cx=c_pps
 a=LPv6HZ59J3TLgKTE/qPS5w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=HQXgToz7zBQMW4iSMwQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: QgmDHvc7mMmFhdgrX1FQ_KCoVMba-7yx
X-Proofpoint-GUID: QgmDHvc7mMmFhdgrX1FQ_KCoVMba-7yx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250074
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Mar 2026 10:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125605

From: Zhang Peng <peng.zhang1.cn@windriver.com>

Version 3.58.1
==============
- Use pkg-config to get systemd user unit dir.
- Updated translations.

Version 3.58.0
==============
- Add keybindings to move window between monitors. (!40)
- Updated translations.

Version 3.57.1
==============
- Drop zentiy dependency.
- Add systemd service.
- Updated translations.

drop 0001-drop-zenity-detection.patch

Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
---
 .../metacity/0001-drop-zenity-detection.patch | 30 -------------------
 ...{metacity_3.56.0.bb => metacity_3.58.1.bb} |  4 +--
 2 files changed, 2 insertions(+), 32 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
 rename meta-gnome/recipes-gnome/metacity/{metacity_3.56.0.bb => metacity_3.58.1.bb} (87%)

diff --git a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch b/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
deleted file mode 100644
index cd46824c39..0000000000
--- a/meta-gnome/recipes-gnome/metacity/metacity/0001-drop-zenity-detection.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From d36e65f3e31c882f62d5cfeb7b0e1441d5fdc821 Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Sat, 14 Apr 2018 16:15:59 +0800
-Subject: [PATCH] drop zenity detection
-
-OE does not support zenity
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- configure.ac | 5 -----
- 1 file changed, 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index bbb4db8..2010d78 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -336,11 +336,6 @@ fi
- 
- AM_CONDITIONAL(HAVE_SM, test "$found_sm" = "yes") 
- 
--AC_PATH_PROG(ZENITY, zenity, no)
--if test x"$ZENITY" = xno; then
--  AC_MSG_ERROR([zenity not found in your path - needed for dialogs])
--fi
--
- AC_SEARCH_LIBS([dlsym], [dl], [], [
-   AC_MSG_ERROR([unable to find the dlsym() function])
- ])
diff --git a/meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb b/meta-gnome/recipes-gnome/metacity/metacity_3.58.1.bb
similarity index 87%
rename from meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb
rename to meta-gnome/recipes-gnome/metacity/metacity_3.58.1.bb
index b8b248ba3a..f364b52b98 100644
--- a/meta-gnome/recipes-gnome/metacity/metacity_3.56.0.bb
+++ b/meta-gnome/recipes-gnome/metacity/metacity_3.58.1.bb
@@ -24,8 +24,7 @@ REQUIRED_DISTRO_FEATURES = "x11"
 GNOMEBASEBUILDCLASS = "autotools"
 inherit gnomebase gsettings gettext upstream-version-is-even features_check
 
-SRC_URI[archive.sha256sum] = "7554997104b26ff0e79a02b37a2ba189bdf4e7ccd54226f0faf4b1a59006c901"
-SRC_URI += "file://0001-drop-zenity-detection.patch"
+SRC_URI[archive.sha256sum] = "e430c8a92409ef2f91a4dabd50a71e3d3bbcc474a3dec1caec3813b381d7d1b0"
 
 PACKAGECONFIG[xinerama] = "--enable-xinerama,--disable-xinerama,libxinerama"
 # enable as neccessary until new warnings are dealt with
@@ -35,6 +34,7 @@ FILES:${PN} += " \
     ${datadir}/themes \
     ${datadir}/gnome-control-center \
     ${datadir}/gnome\
+    ${systemd_user_unitdir} \
 "
 
 RDEPENDS:${PN} += "gsettings-desktop-schemas"
-- 
2.34.1


