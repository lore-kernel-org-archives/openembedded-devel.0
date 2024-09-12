Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E3ACEE642E
	for <webhook@archiver.kernel.org>; Thu, 12 Sep 2024 02:46:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.38510.1726109173719525995
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 11 Sep 2024 19:46:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=998582a7bf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C1fPwZ029960
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:13 -0700
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2042.outbound.protection.outlook.com [104.47.56.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41gj44da1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 11 Sep 2024 19:46:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xun0fPW2JpkHtO+MLGvDYe76Y/k0cwQmZGKY/f+9mCunJaWwgn0mYJgHVx5oHQJ5QKogWcFOAkDkz48ToALRRBIQuw0RqYPB1wzSITfBM2eN/gxsaiNZDabCuZmUIsXLoP0jIkPBAy3RovdmaCt0NaIHYewJRytdhVTfBftqjTAJrVD7tZYbVw27vPF6OOpd0JUxIIPLYa1346mqohwOrninkaDPK2ILuhHWp2IS/FQA9Mp0t8GOJHzLLgEKNkhTqGW6PhMHvn6uSIbQryE+iNCF/v/Be5V3ZuK2GhiKTWwU463De/ZC6U2HZZyktjUtG+Smp64vSwH3YmFNbZ4+WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rZQzW9Emr5JdG/vyhK0LA3a/732Ft5LpJFn+FTty8CE=;
 b=lSpeR/fwVoIaUxIxJOu1YRSvfmSiZB44eyJ1Ca0qD0/I5E984MRERLGOjFu0yzLnGlXOEnNSLzmYClZcXfUtTZTM/SX3V7TD3PmeqgBwbH8/D7VdEo4a9Wy67rLR3a2LdhdxYQy1ZrTmhzneSaqG7zpELBZgn41CRJqxrvQA4QxUt8kb9Hk8ULq1AAOGOVpGiksMp5CufU1fivVWZXS7Ud4bDWznx91+1bSrU6hdwtQ2eHFzphtdB+lXyJSzfOMZiEgjO5Tmwndsj9Q75vnciWjvNFAgXR1wwyYQpwZyIIExteNi8uIlFHO4+1eoR2s6pFXQGp32wRTvqdTK3ZMdKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB7303.namprd11.prod.outlook.com (2603:10b6:8:108::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7939.25; Thu, 12 Sep 2024 02:46:11 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 02:46:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 4/7] s-nail: upgrade 14.9.24 -> 14.9.25
Date: Thu, 12 Sep 2024 10:45:55 +0800
Message-Id: <20240912024558.3998529-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240912024558.3998529-1-yi.zhao@windriver.com>
References: <20240912024558.3998529-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB7303:EE_
X-MS-Office365-Filtering-Correlation-Id: bc1fe0f9-a582-4710-d3cf-08dcd2d50f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?i3lBKntn81Nhc9yXIr6MMYWLwcYmKF9AnMyMrJ4W398FC1CL796glyge6uVF?=
 =?us-ascii?Q?VcIHs0/UjztXaSxDf4J3D0itUlon9X9Xe52zb0N6/7KWQVWZsNpNPoHOsvfS?=
 =?us-ascii?Q?uPrJgpSztaOklLb2+HAf8A7Pjss+wQkPPcdsT1b5O5PHdOpOYfQMmnSZjuwB?=
 =?us-ascii?Q?ZwXFfS57mzVySNxFEuJckgt8IuPjgSknjid07AyVmYg1+5xpf9bREo1mVcpe?=
 =?us-ascii?Q?MdxS8eeEmdtMYFHSeQheahx3vLSur7FGQR4WNVKr8LawuE5PnaOWgb3Vzr8k?=
 =?us-ascii?Q?5m8hw6H0JMnfnbf6FT7PgL1AkesUVOKK0YGNmdJPiQR7xOwLmXIOsuwTh+wc?=
 =?us-ascii?Q?TnSNU6FoDhpLZZz6BjodGu/EFyd8Osb6YhuRefy/lxm0MZQdKtwAgD9vxFlK?=
 =?us-ascii?Q?/Mi+jEg8cfA0unNEmXKAx2JZmngpXS/h5bf4vC1VKCc+jMQt4I+3jtrFkagl?=
 =?us-ascii?Q?EQA9zFFjk4/3coY8bm8/3WF31T53lD8dVX2Dv2powTyo2d7+8Q0NnTLKh8dx?=
 =?us-ascii?Q?g1gHFh8KhV3Kd18kUnXAXnU/fdFcUrMd9nROzVRUbIAjNz9Pu3bqRbygoU6W?=
 =?us-ascii?Q?tAOv7/B6QL+3wqRSDioBLlCrJgajNxidNqt2gpb8EiY82gBc0mxlT/g95LL8?=
 =?us-ascii?Q?b0zjvZzOzR22mgIx2l5QAVLfaCsEUulF7KbOnKlgz0IuJU9HH3nyCbSOtF4u?=
 =?us-ascii?Q?WCoOW26tTwp7lkhn4Sy203kOKLi6pfiFwlNataqb6DoXXnX+FvzFuXenEijc?=
 =?us-ascii?Q?poT6FJikSxvenHuD/Lg7DsUvgq/1u94lX13fVOcVgSSUgjthp1JUknXR7CiE?=
 =?us-ascii?Q?HU73pAbkU4o0wErbwn84N3N4qz/s6IMDh/QmjA0NQsC2j3XnHVw7pGwWZXF6?=
 =?us-ascii?Q?iRuWEQnklIGGlWOduICN7v0DTk7mxekUBhxSBIl5KKZLeoazV28YNe9pX/Af?=
 =?us-ascii?Q?bfqfu4+FnOR+1WRNoSS/UxDq9jENovj/cGOeaJqGhKk7wkVvVvDlWo6IHoTL?=
 =?us-ascii?Q?5f5PbAIiDzoA9ufD5+R2J++WFGsg7REdHojs6RmPvFTyj/cvFFO8EWXLvwrj?=
 =?us-ascii?Q?YllSgOr+piY0GcavpC8ZJM/lShsrBB3r04baSUFDDC1No65GCoHebjPbzIHA?=
 =?us-ascii?Q?9bTICM6Ip8EDniU71nYiBDmpHc+kAWDJv/GCmJiobaRv+eDzUY8dqJBY2A5Y?=
 =?us-ascii?Q?mXn+aEkgVj/vWA2DhjmoKCCQ1RDrqvj4RJgSy3Mk2kMBqLnFEzOuJ6tGw2By?=
 =?us-ascii?Q?5lQ674qUwcooYDS0B9EwTaE7PMquhQ6+BixhLdF1lXVcomYlnrk06wlBi/JW?=
 =?us-ascii?Q?PAXv3DU5F63CNDEDsJkIeOANttCCnhb2wUPl5BHgXDkc3hM+11JYPt8oKo4m?=
 =?us-ascii?Q?ba0rI+s=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WKOjWpnP9x1SpGvP4mBrSV6I4Vpl0PZ9EdGT85snUiS0umExu4kzxkSGIUrI?=
 =?us-ascii?Q?aIMc3eL1ngewUKJhAyFjMDO3K3JYYQPuFvzOZMw0xZWTeYXV8RmrmMKV00Gm?=
 =?us-ascii?Q?TUtPw6Gknb58m7LI2piXBAA1LWC3W+l6VfbX4L646855v4j61pc3cvxnOLpl?=
 =?us-ascii?Q?Qo8Zst1TAh/jmwU4wAEsNNlGZGapDbHxV4qK79tfYywI2AOkMR1CHyvIu1nr?=
 =?us-ascii?Q?MLK7Fy4Xl8C9zsBVOUZ9pJRqveq+CwZrniS5DMyE7JpugkZoKuD1yt/SOo9J?=
 =?us-ascii?Q?pqYJtACaJWgIcrpj975NmeuZcHJYx2Fx96l6lsaXMksoUUnlq1sKUEDRTV9u?=
 =?us-ascii?Q?/ILxW5Yy5yvaBV8KPYmWxAMDBwxhHLb8EOPrPxrZb3VrEosk/Eiiz/MHTr/A?=
 =?us-ascii?Q?SmZ4p2rWgpCHbuwjcqIJC/lg2JZhDK8CkaxDIH1LLGFUTaoWXRWAdr58Vrvo?=
 =?us-ascii?Q?152v3E8HaBL9+vfVyZp0mps82R9Mp1abQMS1VDHIdbUPOkuJZ8wQPiTjPc3u?=
 =?us-ascii?Q?qQelY960s1RqqCfJ7KvkMyI8dX1KYj+WzA/1DMfYxu4VCXo1UATcGBTnptHH?=
 =?us-ascii?Q?X+C5pAPpS4BVAma+3Qhf3apLSZd9zMzLKGes0FXW81uBJwle8yg2+gjkKwFg?=
 =?us-ascii?Q?Vke/xL1e+F4qzruvsnJz7wqHvwVSDTesp0znDjEnTmTuD6PDCEwTCYXeiw3+?=
 =?us-ascii?Q?hN6BLC9q4dpCyk87lDD6kvMLCR1mA4xnc+c5LaGfGKuGBvLXr1rDnbQryTnR?=
 =?us-ascii?Q?l22iiolHBLDyoa44uCARKXb7E3FypjezZVgdASMPeMlqHhvaq8T7fM+72usR?=
 =?us-ascii?Q?f3iG2zlJDcyeYCPnAare/U9TWN1fWQiKp31HGDBHll10iLi4uBZ8tN80atNJ?=
 =?us-ascii?Q?OQ2Nsq021vyPc/6JNalbORkBTThX24KC51Qq2aS9/5QdHWDccm6t+5ISE6jM?=
 =?us-ascii?Q?I13g0ISkBKB91GmlqQlpNplIhXKD/yjjKEKMt/IC/Clmm+T9IAoaNHgM/eaH?=
 =?us-ascii?Q?Ti7jmeDJb0JNZO0lLjB7e4xDF+/Xq/vK1ofWs80Wvwb3IDmeNd3cuGzr5vd2?=
 =?us-ascii?Q?/PgTvMh6J1h0DpB0+BF1rkVlPwHDM2Ng5hQNVFCiMR7L0NQxxBFOXMt3uFUy?=
 =?us-ascii?Q?KQ+P7NGIqjIQYu/5ro9YZRjO/YSCpvyDKb8FsJdpl98y/j3bQYINjHmFjgSG?=
 =?us-ascii?Q?sjAkJ8Fvkaa68Jfn47pliFxQRmZdfsiY9KyR2stP8lKYH0fMwL4nvT1bL/nS?=
 =?us-ascii?Q?TMWQt/2xLnVZcJKr4QSVmcMYZiiPiDeW7JZy0Bz75YUkA29XP0VaaAxk0d4R?=
 =?us-ascii?Q?vyYP2huOaQc+dQ1MvSttI9RM1dhzjNE9LNpcmbAn9MyLG4CdDdhiRUOtM59M?=
 =?us-ascii?Q?7+evXDn1AaIGGtWEPQdU6Db0ZeEKF2EMV9vmB+ppE1I/lQsMFhvjtGp8GOGu?=
 =?us-ascii?Q?mwqpSzWz75RepYv2mXqfMc45oTEX/8sa7+iSATRfmvON6LRVg6G7avBcpnFf?=
 =?us-ascii?Q?KBWj6V+VRRCH5UbEP9dlzFcAYfH8c4D0Rwn3MfqInP+I2kh/gligYpg4bnx3?=
 =?us-ascii?Q?W77hf4HtTjnVqQT7S7y2SoGHOSfr/nASl45bXx+u?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc1fe0f9-a582-4710-d3cf-08dcd2d50f9f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 02:46:11.3353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uaO48nl7kpk57TiCi5P+wF7PdDW3hQM0+/goXQg1BHE9A4hQUuPF9nJCM/gvfLvYt5gGUwA6tWs37uQZzWijyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7303
X-Proofpoint-GUID: x2XD2e2wM2OO5SMebUDSdrgGw4XdszVE
X-Authority-Analysis: v=2.4 cv=DZxFqetW c=1 sm=1 tr=0 ts=66e255f5 cx=c_pps a=ruI+LRy+bJmAUyIDade2ZQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=xORKUZJLAAAA:8 a=t7CeM3EgAAAA:8 a=_fLbJCAKWwkhygxmKcsA:9
 a=v4Hbg6dcrAlSMfWU4D1A:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: x2XD2e2wM2OO5SMebUDSdrgGw4XdszVE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-11_02,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409120020
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Sep 2024 02:46:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112250

ChangeLog:
https://git.sdaoden.eu/browse/s-nail.git/tree/NEWS?h=v14.9.25

Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...INLINE-eh-no-give-up-share-detection.patch | 68 -------------------
 ...LINE-gcc-only-GNU-specifics-after-Og.patch | 45 ------------
 .../{s-nail_14.9.24.bb => s-nail_14.9.25.bb}  |  4 +-
 3 files changed, 1 insertion(+), 116 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
 delete mode 100644 meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
 rename meta-oe/recipes-extended/s-nail/{s-nail_14.9.24.bb => s-nail_14.9.25.bb} (83%)

diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
deleted file mode 100644
index 41f98281f..000000000
--- a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-eh-no-give-up-share-detection.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 9db4c0f6bc0dd11c77b54296fce6b8afe18f4325 Mon Sep 17 00:00:00 2001
-From: Steffen Nurpmeso <steffen@sdaoden.eu> 
-Date: Thu, 9 Jun 2022 18:26:38 +0800
-Subject: [PATCH] su_INLINE: eh no; give up, share detection with clang but for
- a thing
-
-Upstream-Status: Backport [https://git.sdaoden.eu/browse/s-nail.git/commit/?id=de2a44c393a39d80ddf12154aec94cace84b19c1]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- include/su/code.h | 34 +++++++++-------------------------
- 1 file changed, 9 insertions(+), 25 deletions(-)
-
-diff --git a/include/su/code.h b/include/su/code.h
-index 9683f4a..c7a2af3 100644
---- a/include/su/code.h
-+++ b/include/su/code.h
-@@ -308,29 +308,8 @@ do{\
- # ifdef DOXYGEN
- #  define su_INLINE inline
- #  define su_SINLINE inline
--# elif su_CC_GCC
--#  if !su_CC_VCHECK_GCC(3, 1)
--#   define su_INLINE extern __inline__
--#   define su_SINLINE static __inline__
--#  elif !defined __GNUC_GNU_INLINE__  /*4.1.3; !su_CC_VCHECK_GCC(4, 2)*/
--#   define su_INLINE extern __inline __attribute__((always_inline))
--#   define su_SINLINE static __inline __attribute__((always_inline))
--   /* gcc 8.3.0 bug: does not gracefully inline with -Os
--    * gcc 12.1.0 bug: ditto, -Og
--    * Thus: always gcc-specific! */
--#  elif 1 /*!defined __OPTIMIZE__ || \
--      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L*/
--#   define su_INLINE extern __inline __attribute__((gnu_inline))
--#   define su_SINLINE static __inline __attribute__((gnu_inline))
--#  elif !defined NDEBUG || !defined __OPTIMIZE__
--#   define su_INLINE static inline
--#   define su_SINLINE static inline
--#  else
--#   define su_INLINE inline
--#   define su_SINLINE static inline
--#  endif
--# elif su_CC_CLANG || su_CC_PCC
--#  if defined __STDC_VERSION__ && __STDC_VERSION__ +0 >= 199901L
-+# elif su_CC_CLANG || su_CC_GCC || su_CC_PCC
-+#  if defined __STDC_VERSION__ && __STDC_VERSION__ +0 >= 199901l
- #   if !defined NDEBUG || !defined __OPTIMIZE__
- #    define su_INLINE static inline
- #    define su_SINLINE static inline
-@@ -340,8 +319,13 @@ do{\
- #    define su_SINLINE static inline __attribute__((always_inline))
- #   endif
- #  else
--#   define su_INLINE static __inline
--#   define su_SINLINE static __inline
-+#   if su_CC_VCHECK_GCC(3, 1)
-+#    define su_INLINE static __inline __attribute__((always_inline))
-+#    define su_SINLINE static __inline __attribute__((always_inline))
-+#   else
-+#    define su_INLINE static __inline
-+#    define su_SINLINE static __inline
-+#   endif
- #  endif
- # else
- #  define su_INLINE static /* TODO __attribute__((unused)) alike? */
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch b/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
deleted file mode 100644
index 37ecb0c1f..000000000
--- a/meta-oe/recipes-extended/s-nail/files/0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From 5429b9e343c808951b1418d8626e544c9dcb28de Mon Sep 17 00:00:00 2001
-From: Steffen Nurpmeso <steffen@sdaoden.eu>
-Date: Thu, 9 Jun 2022 18:06:04 +0800
-Subject: [PATCH] su_INLINE: gcc: only GNU specifics after -Og
-
-Upstream-Status: Backport [https://git.sdaoden.eu/browse/s-nail.git/commit/?id=c5544b66c3b4b2e161166562349908a07e324b38]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- include/su/code.h | 17 +++++++++--------
- 1 file changed, 9 insertions(+), 8 deletions(-)
-
-diff --git a/include/su/code.h b/include/su/code.h
-index 4d552c1..9683f4a 100644
---- a/include/su/code.h
-+++ b/include/su/code.h
-@@ -309,16 +309,17 @@ do{\
- #  define su_INLINE inline
- #  define su_SINLINE inline
- # elif su_CC_GCC
--   /* After lots of trouble with OpenBSD/gcc 4.2.1 and SunOS/gcc 3.4.3 */
--#  if !su_CC_VCHECK_GCC(3, 2) /* Unsure: only used C++ at that time */
--#   define su_INLINE extern __inline
--#   define su_SINLINE static __inline
--#  elif !su_CC_VCHECK_GCC(4, 3)
-+#  if !su_CC_VCHECK_GCC(3, 1)
-+#   define su_INLINE extern __inline__
-+#   define su_SINLINE static __inline__
-+#  elif !defined __GNUC_GNU_INLINE__  /*4.1.3; !su_CC_VCHECK_GCC(4, 2)*/
- #   define su_INLINE extern __inline __attribute__((always_inline))
- #   define su_SINLINE static __inline __attribute__((always_inline))
--   /* xxx gcc 8.3.0 bug: does not truly inline with -Os */
--#  elif !su_CC_VCHECK_GCC(8, 3) || !defined __OPTIMIZE__ ||\
--      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L
-+   /* gcc 8.3.0 bug: does not gracefully inline with -Os
-+    * gcc 12.1.0 bug: ditto, -Og
-+    * Thus: always gcc-specific! */
-+#  elif 1 /*!defined __OPTIMIZE__ || \
-+      !defined __STDC_VERSION__ || __STDC_VERSION__ +0 < 199901L*/
- #   define su_INLINE extern __inline __attribute__((gnu_inline))
- #   define su_SINLINE static __inline __attribute__((gnu_inline))
- #  elif !defined NDEBUG || !defined __OPTIMIZE__
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb b/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
similarity index 83%
rename from meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
rename to meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
index bcdb1e478..93a852a6d 100644
--- a/meta-oe/recipes-extended/s-nail/s-nail_14.9.24.bb
+++ b/meta-oe/recipes-extended/s-nail/s-nail_14.9.25.bb
@@ -8,11 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=87266591c81260f10221f1f38872d023"
 SRC_URI = "https://ftp.sdaoden.eu/${BP}.tar.xz \
            file://make-errors.patch \
            file://0001-make.rc-set-VAL_MTA.patch \
-           file://0001-su_INLINE-gcc-only-GNU-specifics-after-Og.patch \
-           file://0001-su_INLINE-eh-no-give-up-share-detection.patch \
            file://0001-mk-make-config.sh-not-reveal-the-build-env.patch \
 "
-SRC_URI[sha256sum] = "2714d6b8fb2af3b363fc7c79b76d058753716345d1b6ebcd8870ecd0e4f7ef8c"
+SRC_URI[sha256sum] = "20ff055be9829b69d46ebc400dfe516a40d287d7ce810c74355d6bdc1a28d8a9"
 
 DEPENDS = "coreutils-native"
 
-- 
2.25.1


