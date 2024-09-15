Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1767DC3ABB7
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 23:55:56 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.125481.1726444555724453082
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Sep 2024 16:55:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9988d41e42=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48FNA7iO013823
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:55:55 -0700
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2173.outbound.protection.outlook.com [104.47.58.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 41n5s4h7pg-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 16:55:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QbEvxQGdylUnEZ3WUdOsWKzxXhfnMgx73U0UozeyKFvBSUkMwFR5M/SR9IRSGvc5Q2CTEvWWUzHGwngO2kSmgSYMi6TnRKATvGT9dZF7rbGaSxEHvBtmCWEzjI6Gqeyp04DLULHGZ3mwLBMdMZtaNEx6m2tufhm9zCcj3zKSaIRJz30DuZyj8WGJ9J9Wf9iEYzhGKd7tb9LMaek3Zl65OW5qjrCtoQfoC6RTfqWOSz1cT+fhGQCYzq8oM8SQ0jIZNnJ02tL4fU3odSrCrRgbB0MfemFVk8uXixFmy3wuz0URMhwwQxLxcLiUbi17d97pNoqT95yBF8u76wGog88owQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cGqUzaLk3wIZsFfGhYX6k3rAdfApN9Gy2v5L6PzCe08=;
 b=Uset69D11frFC8np2b2SXmWowf9mNStF60b7bXcNv2RMHcgZ0hA4HQM+xFl5ffM7gqJqYq1B2wg1O7kANlEbFiLsN1RDYMAA3EYQ2g94XWNOrsSU6F5gOlm/F/Zd3brnaddCvSMgVqdnm8LcGzHs7QW7ZDOrrOmZWNB/5BYxfy3n8ydSsoDxffTiCtldOu419TSUVySd3Ju4agt9XqFCxCcD6SmpjqPlybE0CLAooWWisohXAMp+OTTLuDWkuMZgypwdx1RDGjghT7hd4BYfcHiBjO44or6mLJE2bIgouqjjZ2eRdLxanjh/xski12uORGZa+hooE7F0bwMUvR0JmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 PH8PR11MB6561.namprd11.prod.outlook.com (2603:10b6:510:1c0::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.23; Sun, 15 Sep
 2024 23:55:50 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%5]) with mapi id 15.20.7962.022; Sun, 15 Sep 2024
 23:55:50 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 1/2] frr: upgrade 10.1 -> 10.1.1
Date: Mon, 16 Sep 2024 07:55:35 +0800
Message-Id: <20240915235536.3598141-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|PH8PR11MB6561:EE_
X-MS-Office365-Filtering-Correlation-Id: e426ff08-61ad-4fe5-98f7-08dcd5e1ece2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UWvhfGztN4SDCOWPpTnZ/qLNiMay7JJJWqWXmFcPqiaThFkXxNQfEGRe3nQw?=
 =?us-ascii?Q?JAatRcn0DYeibz1N5q/YVtpSodswMVxKql4RoZHU90TtC84icIi/vq2GwCHd?=
 =?us-ascii?Q?vZ0Z2NOl/oS3Sqag3jf/6NiZvJa3kFCAND2iF2OkSCMLkIG6fhXg3l58dFln?=
 =?us-ascii?Q?33X77FRtZCdiN1ihOqFslrrr2s+bReDwgdLfeNh4TwMx7HRr8rYW9tGWZnPc?=
 =?us-ascii?Q?YAEyxjaaJNEN1sfGttCt8oqwZbInNVyedoY1Y1wEx8VNjrTMHddtc0uG636H?=
 =?us-ascii?Q?PAkEtiZ3iee0SPpWdGa+e8f43pefMYbGHgJkD94nywIhI1oGCshrexxObvAu?=
 =?us-ascii?Q?LjPzKnk7LGhem0P37KXgFDFWv+Ic9yV2N+zUhlWamWK50vkH29oDyuKIcQop?=
 =?us-ascii?Q?8nEqQKo5i+mmCiFc6qsFo+whzOSKTo2ruC8xMfoD0CDzfFYV8BWRrfFxyYpJ?=
 =?us-ascii?Q?28epASqk6ofSNHwrl2R3y/Y6lIZrEvaU0zlXp0Atf6VYdGZPxd0ou/4F47QY?=
 =?us-ascii?Q?PuQ04UtgOtTAeOXjKaIkPXMyiUsp6yxfckAuLsqYB3buH5hMg8e+3Vo1sBjS?=
 =?us-ascii?Q?oI1kUg2yoguTnlfPbjWsTTtyOE5RBPv/y6qY0k9yWkL906gyJMHnpJ7Jo0ze?=
 =?us-ascii?Q?RJy54xCIjFJ+LqjduCvA2ljpuoW3Icq1cZjB4ijUBYVIZle/3yNmOE6O2PO1?=
 =?us-ascii?Q?WrG5Uvn7jC3PY3hYy0NxTYNSyHJ2pL44h32J3bU/dJonLAuMheyBbSuAlZsU?=
 =?us-ascii?Q?YeR2jPqBiH6Y1sl6R7Ktf7h65q/8K512W6ZRaU9SOthTXAizEaa2ZhOMr9h7?=
 =?us-ascii?Q?pogmld0DxuPECNs/QBUAY3eKIhQiw2QHoM0R6jmsYuDclZssz7EuJXpANU8m?=
 =?us-ascii?Q?26Ujd/7f82ybRNggb3fwar5Ibbgklo8Xj1REuVgitKN85FPieMxuAGJPHAgj?=
 =?us-ascii?Q?4WTkhjalY2XoCxcNSF6onSdLyHGorsYk3hATKGDttF8neXQ/NkhTFkhkUlKe?=
 =?us-ascii?Q?1fgwSkQOmRNx6gKTclcO151WoQmll7rGsY7HyyAA6CHpBC5AcMczn1/vbw+o?=
 =?us-ascii?Q?caWRK4ZhV7XZYqP1mLwd0o7+BJnR2TcNQIFiJQOJw3tzRZRac93okAqwzNhR?=
 =?us-ascii?Q?MtoBpHm6dazUBBlh+q9WXMwo8aOxZwWKpYd4sc9Fat8xxdfWarWnfFLf5g//?=
 =?us-ascii?Q?FFNAs722GoZZ6J69pPpXdthIDP+JS9dcPH+HOcZUfLJs8GIjfy8zLeqcbiTK?=
 =?us-ascii?Q?1JUkH4bDcYj7fM4n1ktOwCgPCl8lLcnkb5JIZIslgbLUCbXqwvEnODJwaMzZ?=
 =?us-ascii?Q?pSdNo4wG1oj1pf+o8wesVFFBQbtKGmh/XWgqwKAfTxilzFlujFw+zII7o1Dl?=
 =?us-ascii?Q?iDkcLlo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?GCBbdj7uCt3/nOWd5L1uGFFUOicDf7qnkbkRtgRDtSmly2Ka6yDFNLMQf7Bx?=
 =?us-ascii?Q?5/MJtQRHqm29KNeXy5Qlg+51AB/IBV5LymFDLilvrVIgXwygIAA0Pd+Qcu7b?=
 =?us-ascii?Q?OmxFgHDDx77JL22A0BGnBTVeuRls3j0fc2vicrNPPvLyj7ZFut0wZogCnyaP?=
 =?us-ascii?Q?37a0WT+fh/IaPDLVoDerQLoztR4ir2P8bjyKL/32vjFlR37gHXwZxxP+ovVO?=
 =?us-ascii?Q?bX5ETFwZrA6O3gyG0drkDS8VyWK7ZXgndzgKzUNHbJGOIAAn8u89upPJqu5I?=
 =?us-ascii?Q?r7gf8SrDwm4F8Is3ZphZYqz+ZKKya05ljN3c5K7ooZtXc+8rua9n+muy0WMJ?=
 =?us-ascii?Q?bYTQ8mEhKNR5k4ttDJWQcPkSzEUvlouyFF8QZBu7YljdvJtGT827gdF0y3Do?=
 =?us-ascii?Q?Evb5FDeTxWJ9L9RI6Mt1kBo6amO+Diy6jgIlzB6sZuCSs55cFXeFduFS/3xU?=
 =?us-ascii?Q?05Ac9Zf1pqDAvzZdz972+bHsalfLxoAz93HV6Wji/FKIC3dlAgNsjfZWgzrS?=
 =?us-ascii?Q?NdvpMKqsde5u7CvqspXkBKQFOljtoIhp9lviOeZWIFr5i9DEY0YgsFUJD5N+?=
 =?us-ascii?Q?r9+LoHL5l62IWSJ/b6rWJJgSBOyW5h53auIiC2FmYPjfjka9/z9GMXtnp7/1?=
 =?us-ascii?Q?IyVEr0OB7uEf586aqlk3l3FwJEWpkLNPlfHtHC/J5oPNOZPUuVTLvJ4kaZBj?=
 =?us-ascii?Q?BNLJ1Y/fSlCTWSvwlKIAytlY5ymhWZgsFTsh+UfsJXGfyoipTdkLgMrxdgdl?=
 =?us-ascii?Q?c6JIyz+ud7Fs/ucl9R+p68/9Q+E6C+q5ywa/X22gBiM+o1oKNDQjTk+gANat?=
 =?us-ascii?Q?6M4I6eCcgJjVELij1XCJcpCvVZg3wgVbYfGGkkmaaePDSehTneOwYdsF9KoV?=
 =?us-ascii?Q?DJBOaJ44nMfDYYPa+FuYGIyfrBTCiQGCDhkp3JSGqXrpPkfA5gDzxuZ+r02q?=
 =?us-ascii?Q?H+tGdXdzIZgH/qk3J9zQVLZy8FQzx+GF2O6k3jCMWRwbqYZO7kHSutIAGf2G?=
 =?us-ascii?Q?gTgkoMeNwGkrxjj7w4J/garp6ibkQ+RUEabSIoOwyYB6jFST7Uh0SjSSve3q?=
 =?us-ascii?Q?QCtFAMDMorYNgx2ByoV5YXOzPUHMJiSlwLqTFiWNNwtt/vFKekM/k6iDYVMv?=
 =?us-ascii?Q?0j9AXxRw0gRSsoB37PUJRRQpuaW9Mx+Ih4+XmOgydgvCykS3NiGHnh/AHYuH?=
 =?us-ascii?Q?yNcMw/CR36vgo45YgXHAIEAdcLRmkSiQ0gbgQbqWKN8/oyYpFqsGrSy29mE1?=
 =?us-ascii?Q?/ZR3OqMxNdlIKaW7bKhOvZtel+htdAg/gVHiw3+YWtIZVkOxIl4Z/yk1O7/k?=
 =?us-ascii?Q?23FamRsaMUDarNBC5cEXTJTc6qMidYcrqDQtMoopuy+Bn1fkgZ1K4ZBWgdh2?=
 =?us-ascii?Q?YBl9KFIgXJGzlx1M9Rv+FpoKB/3t4CixPVVez8qXJ6YQ5ggygLStnQzbOWfQ?=
 =?us-ascii?Q?/znP7f60HKam2x5VD4MQGv1Y3DQWcrzKq48fjNjAUEK4fx53fdyvLZaumWlh?=
 =?us-ascii?Q?IytnuLd1dGdWFN6EdvUL3HN6cMSXvH/YcRSCGCE4pWsSCM089DPVCrQSMkxQ?=
 =?us-ascii?Q?QZo0RQjhW3JA61h/GDEoGlWdSta+1/QvtGI9ho/C?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e426ff08-61ad-4fe5-98f7-08dcd5e1ece2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2024 23:55:50.0478
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mi2p7m/obzkmpaP5H3KOjg18TScR1uKSf2tIb7BV7tyyppTSNvP8sh+z1wK6bCh/8uWIkA1EF36LKy3OZcBSBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6561
X-Proofpoint-ORIG-GUID: uQa4FZjx_XyrZ2FCIoFRDC26TOJj_mPw
X-Proofpoint-GUID: uQa4FZjx_XyrZ2FCIoFRDC26TOJj_mPw
X-Authority-Analysis: v=2.4 cv=C8+7yhP+ c=1 sm=1 tr=0 ts=66e7740b cx=c_pps a=19K1aDEwnJ0RahI1emVHDw==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=EaEq8P2WXUwA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=5KEJ3k9QAAAA:8 a=asGZE0mf-auXs454UXMA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=olg2BfGzmf2haRflzj8J:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-15_15,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 adultscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2408220000 definitions=main-2409150182
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Sep 2024 23:55:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112320

ChangeLog:
https://github.com/FRRouting/frr/commit/dbf8dac1cea2b1235746e2d966a8ded9cffd5dc3

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...basename-API-for-non-glibc-library-e.patch | 34 -------------------
 .../frr/{frr_10.1.bb => frr_10.1.1.bb}        |  3 +-
 2 files changed, 1 insertion(+), 36 deletions(-)
 delete mode 100644 meta-networking/recipes-protocols/frr/frr/0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch
 rename meta-networking/recipes-protocols/frr/{frr_10.1.bb => frr_10.1.1.bb} (97%)

diff --git a/meta-networking/recipes-protocols/frr/frr/0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch b/meta-networking/recipes-protocols/frr/frr/0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch
deleted file mode 100644
index 8c83d5c8e..000000000
--- a/meta-networking/recipes-protocols/frr/frr/0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 49aeccbec4bf620bb594999bbd4a9de669a3984c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 15 Mar 2024 14:34:06 -0700
-Subject: [PATCH] zebra: Mimic GNU basename() API for non-glibc library e.g.
- musl musl only provides POSIX version of basename and it has also removed
- providing it via string.h header [1] which now results in compile errors with
- newer compilers e.g. clang-18
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
-
-Upstream-Status: Submitted [https://github.com/FRRouting/frr/pull/15561/]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- zebra/zebra_netns_notify.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/zebra/zebra_netns_notify.c b/zebra/zebra_netns_notify.c
-index 1bb1292e34..d55df2f62d 100644
---- a/zebra/zebra_netns_notify.c
-+++ b/zebra/zebra_netns_notify.c
-@@ -41,6 +41,10 @@
- #define ZEBRA_NS_POLLING_INTERVAL_MSEC     1000
- #define ZEBRA_NS_POLLING_MAX_RETRIES  200
- 
-+#if !defined(__GLIBC__)
-+#define basename(src) (strrchr(src,'/') ? strrchr(src,'/')+1 : src)
-+#endif
-+
- DEFINE_MTYPE_STATIC(ZEBRA, NETNS_MISC, "ZebraNetNSInfo");
- static struct event *zebra_netns_notify_current;
- 
--- 
-2.44.0
-
diff --git a/meta-networking/recipes-protocols/frr/frr_10.1.bb b/meta-networking/recipes-protocols/frr/frr_10.1.1.bb
similarity index 97%
rename from meta-networking/recipes-protocols/frr/frr_10.1.bb
rename to meta-networking/recipes-protocols/frr/frr_10.1.1.bb
index 4ffae1607..237b52592 100644
--- a/meta-networking/recipes-protocols/frr/frr_10.1.bb
+++ b/meta-networking/recipes-protocols/frr/frr_10.1.1.bb
@@ -12,10 +12,9 @@ LIC_FILES_CHKSUM = "file://doc/licenses/GPL-2.0;md5=b234ee4d69f5fce4486a80fdaf4a
 
 SRC_URI = "git://github.com/FRRouting/frr.git;protocol=https;branch=stable/10.1 \
            file://frr.pam \
-           file://0001-zebra-Mimic-GNU-basename-API-for-non-glibc-library-e.patch \
            "
 
-SRCREV = "14c29f83a0dfbc4023cdfff34ed38cf43dca409c"
+SRCREV = "dbf8dac1cea2b1235746e2d966a8ded9cffd5dc3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "frr-(?P<pver>\d+(\.\d+)+)$"
 
-- 
2.25.1


