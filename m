Return-Path: <nicolas.marguet@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A0BC001DF
	for <webhook@archiver.kernel.org>; Thu,  3 Aug 2023 20:51:43 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5232.1691095900470205293
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Aug 2023 13:51:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bja08TWP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7579d315ee=nicolas.marguet@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 373ArdcS030203
	for <openembedded-devel@lists.openembedded.org>; Thu, 3 Aug 2023 13:51:40 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=dhBb6XDHZbUzP53VM0
	3uim/2qpAKNB2FJXfl9QZ/GQU=; b=bja08TWPG8nly0oklco7Q1UVXXReZCMLet
	jH2ny870xDgeWrIg6m4twm5aXOR6LeU7YcZ7FbVowmPtmxzYouvg9MiImz8ASf5U
	emWqXzSwqXAQSwwH0JTnCkGtmB24NcG6mGHcNDkstcCwyPfrCt1xXY41SpM6GXad
	JZ81gHXxgiuFXiBSGABqa5VkhFxQnFexxo8aLk+dTedekUjthRhMbsrSm65WBnLn
	JwKPNCbLtLOqXAW3aj9yOdJi/8w7tmaPBceP/Ny/rmopQv0hs8PEgzDmuz0ycaSl
	lmu4mbHV6mdRFMgiV9jnaces/OUpoVllTH5sIreoBP29hyhUugPg==
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3s78pya1m2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 13:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F8UryzIivwKfjhES8QJLtvf2P4TeFfVkXcbkXngN5tOIHjAkSL6bBSkzWeViz2HrnbZM3vGTYiJrxNCTdGoVOydH6R4cmuT5sCX5NRb7lLlgCguxMHVVSbXqQVoEJbjo0kLTumZQu/Bj1YuSl6tT9zgp8Y9urE3/sBcSW08Tlb8IeP7ZYqrpHbk9eXqGAPQOrcffvZooQfyKjIwfviPm8i0QNq4Yq+epwXbTTS1rfvCPsRFVNCMWKCsL7OKBYuiLA0gS3YvvGes3zTOMQ8jw8ZImQtk5M2Fm2rt3cMn3aRSSxEPZLunWAf32rFr6M6pMy7sCM3B1uo0Eu8sGfxm58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dhBb6XDHZbUzP53VM03uim/2qpAKNB2FJXfl9QZ/GQU=;
 b=kjci4K/w9xG6lAtZzZJQyX0m6nV2nmFeIUo5j+KB/pVyhP3ebttJiI1T6pZ5f0fQip/NISN5Thtm56oM3e8+520vSsOicksHH0eLhzPOBfcH1vDIPA0eD5vmBm2hVlu7bwa79Cwjg1po2pldyTbG1ildxbxR+TsMjWZHdyag9EQqbQ0JgN+FQ1wtgM4wduP54jgMQXP4R7oz3tWSmEvVNSFrbHHI70eN8zXUn11qaUusWMMGKylNGWc6QIw1VZmWx/ZZkQPYvH2SxnFC+X/agsUN7NOP2ktg8f/is+p4A5jCvHfHbQ7KeYU8YFeKIt3Oyso8w9bZFU/EF3I3qr0AJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from MW4PR11MB6713.namprd11.prod.outlook.com (2603:10b6:303:1e8::7)
 by PH7PR11MB6650.namprd11.prod.outlook.com (2603:10b6:510:1a8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 20:51:35 +0000
Received: from MW4PR11MB6713.namprd11.prod.outlook.com
 ([fe80::c277:b879:22a5:8a4b]) by MW4PR11MB6713.namprd11.prod.outlook.com
 ([fe80::c277:b879:22a5:8a4b%6]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 20:51:35 +0000
From: nicolas.marguet@windriver.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH v2] Fix function inline errors in debug optimization
Date: Thu,  3 Aug 2023 13:51:23 -0700
Message-Id: <20230803205123.2734331-1-nicolas.marguet@windriver.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0010.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::23) To MW4PR11MB6713.namprd11.prod.outlook.com
 (2603:10b6:303:1e8::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6713:EE_|PH7PR11MB6650:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cad29c-8b15-4e24-73fc-08db94636cdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	d1EcpBIXdy6QY9PE6DbyXUkQD6/8GeyPO/xCluKaPkArkBk1fe7Nlh8oLbOVCYIyo9TOgd/+34bxUBIAaIIIoP3vkveLneAyS7krYAifMp9n05wJ8YYwvWvOMO7nXhGf+4NDKJYUD7ItrqGCL09S3td3ho+r36zj6YMRtizVvkWFMOz22dULK0407dPF0YZoudLORFus5jL4TTw5haTL+b3rkCdPW1Ib0hce04fZ/XFaeMVFI18Yb3f4e9UPhtJa6vgKPzIqVd2m986NUKC6N4qIdVIsylKJsv5NDYlV5SIKpKTFxO4N8rMuWEi9gi0LxY75AMCXxwnFt6d3f3ogrrtbwkoz7g8K+p3vtVc0pEkUR6v7YQliUR985qXHzJl/jqAZhUDvvBGLpkaEQ7U+/VcnwkseeLMJxndLot19lJ+R04FNGQfeu4FdL6hL86m5Yj7NAT9lpgxNCRrRKqAoyv6ACrUE7wE7P79jSZVpQDcchrabwbuWaZL6LRA/Lj4JYpnu0+ipGqAziJAC1dE3i+Bp0mvJPRq2qJXN3Lk7CHt5IWVqPv40MoSchAev+iyfSCs4b71TDKDZ5/ch5//ZM52Zhjj/Ri3naYfkonnbM0KIAcDDgx3OJKJZsl6sEGEX0lonLTdsw7fDpZbdaztOPA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR11MB6713.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39850400004)(366004)(136003)(346002)(376002)(396003)(451199021)(86362001)(2906002)(8936002)(8676002)(36756003)(6506007)(186003)(83380400001)(26005)(1076003)(2616005)(52116002)(6486002)(6512007)(6666004)(9686003)(966005)(38350700002)(41300700001)(478600001)(316002)(5660300002)(66556008)(38100700002)(6916009)(66476007)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NecoJrcK88l8HHWJEEwALtn88DVn0Ds45Gin9NkEbZBYhO1DXjTVzM1vgIoG?=
 =?us-ascii?Q?MqrILsMN40fXRz3yj7JG4HYIQz3F1g3vbc34dJhjJuGVd2Kearyn7pN9PWyI?=
 =?us-ascii?Q?NDHQxnovPOV0zP/yhnS2REeRyJM5/oH3hqygcEoVCqAPxf4KCAqpU2bIudSz?=
 =?us-ascii?Q?kQ/IHAd1ZmLV1mTGWmMdQPbvaSKdoiUm7Y3HRICUh/GWFzSyt1Fm7Rbrp2VS?=
 =?us-ascii?Q?dVsbjWo2sP4C0EEqfTEllpFeJaLOFJ31xH8M82fcQyr5A9fEVZWDdQy0yAIg?=
 =?us-ascii?Q?qp+UgpR211+THSJMfsn28UHw/CcUoBrR6aLZeDSn3QdvwD1ksfVNhrvciJWU?=
 =?us-ascii?Q?3YlDTpDusMEdSWntQYna+3V7QkdY2F4G3DZuf6Q6/VJ/xM/J7eYi6AjYuA43?=
 =?us-ascii?Q?EOgKwVR7XOTt+3PIhxgRSweRwqXb0/TUfwjCRQx2e7yDoDQ4fBzsAF1yNnxB?=
 =?us-ascii?Q?O6jOaN3+gZLPKrHKBW2/Uyi4nFsg2Kab/Zu7KxZsgaytnx6MpcZkyO6WGsRK?=
 =?us-ascii?Q?udqqYoSmAwHcP2/SxXjnmwZE9Awr8sMPmCONEk1qW7PcXkAdzWwyFsG3d+TK?=
 =?us-ascii?Q?+/MGmRqPp6kQPc4qVgvoiuROV6uA5bFH5Uaj9rAoZ5r1Wv8JehCDe3qWO8di?=
 =?us-ascii?Q?hrfD/bZ4IoAUk8gMsUPrvewLBbg4w54iNLJsdoYWZSEWFeI2prw6k2FGgzqK?=
 =?us-ascii?Q?e5XUhRZIGu97Z5pauPfgofbt6lrTvU9Q7b0ACduDzPrJrwU7swj0VnVPNGRw?=
 =?us-ascii?Q?BjAGPBUpNJ7Hmg6zgz5t2CE7gs0HZY8PcdkrcBPDxhfb/fC7/FKsQksS5qNJ?=
 =?us-ascii?Q?YuZ7WOBVfoZJb57k8sTk+FSCVmi1u0sid9cJNYtI7pi/lJiGm6YofsNbnlri?=
 =?us-ascii?Q?7hN57P3D9FjQ8JC4ubRsX0OBeLPtSTvFeABiSp6nUX4dXCYGuNulHb0+EPjm?=
 =?us-ascii?Q?cDr2cA86mTy7Aad0JUj0PwMMOMnU8e8nVI2pml1Y4DuN21f+9856SSHBcOQH?=
 =?us-ascii?Q?VIZ/qKOjJXhEK2mi3l4wCtGPstzqewxojJRkVIE22mf2IAbDce92Viudo55Q?=
 =?us-ascii?Q?Pn/oXSWj1t32gVKi3LtM2GaR6J5/U4rvy1dGd7mhJ6Z2egRMwVeiMZh0wwO2?=
 =?us-ascii?Q?cNFLIr2RCZaksXHH93c5A8ASktSCbm0lyqgByBI6ZsgsWA6+tSShaAAXyuLr?=
 =?us-ascii?Q?B6TWdtJhI8o/+2rHVVn95PNLk0YzlU5GaXoW0Z1Go4prIqkURHXDcu3Yzil5?=
 =?us-ascii?Q?OzJ8g5tYkwEv4xypTxIUCuOq7u4A4wj5wVGY3shZnfEFFCgA+XSamvEZy2Df?=
 =?us-ascii?Q?MBshAYC5BNjh9zEYtfUSnwbXNPdnJrjkuVAq+1rP8mLzdAQ85om13NcTLC2O?=
 =?us-ascii?Q?McvUhx5k1jomkUPgo9QojYQ+p53hWo9Osr/LtqolrIuT91ruh+v2PoGkxkB9?=
 =?us-ascii?Q?j9Y9fLQfCgeioZNIe0pFb1uB/01k2u4jUyIhly3BBKHS8e3BnqcdKNuAeiGa?=
 =?us-ascii?Q?9l1W+l+1fIhYjFUHnEQY8TqZXyxvecl9tIixVxS9sOIA+1UbigdjOJc93sh5?=
 =?us-ascii?Q?vouKjK+EOdw3QGJsZ1dbn04LFnWOdFwUr04czeIwcs8dktJnbZgvazr6au87?=
 =?us-ascii?Q?AA=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cad29c-8b15-4e24-73fc-08db94636cdc
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB6713.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 20:51:35.3361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Y1rD2t1KV6MtIMeStYq8TTLOZiBkhMNRps8afhm8ur2mIdtcJDhhE0vhKVCou2qX/717Fo9SwNkRzVnBNBO9ku+i4voR7ag9yEkfBxilyk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6650
X-Proofpoint-ORIG-GUID: 9awqMDij1eGmXbIOQ7qU7gDln1-Q49t0
X-Proofpoint-GUID: 9awqMDij1eGmXbIOQ7qU7gDln1-Q49t0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-03_22,2023-08-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 mlxlogscore=942 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2308030187
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Aug 2023 20:51:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104226

From: Nicolas Marguet <nicolas.marguet@windriver.com>

Compiler does not inline any functions when using debug optimization (-Og).
Hence, remove -Winline flag when compiling with debug optimization.

Backport upstream fix: https://github.com/rsyslog/librelp/pull/258
Remove previous local fix: https://github.com/rsyslog/librelp/issues/256

Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
---
 ...line-errors-in-debug-optimization-Og.patch | 34 +++++++++++++++++++
 .../rsyslog/librelp_1.11.0.bb                 |  5 +--
 2 files changed, 35 insertions(+), 4 deletions(-)
 create mode 100644 meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch

diff --git a/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch b/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
new file mode 100644
index 000000000..10e2b564c
--- /dev/null
+++ b/meta-oe/recipes-extended/rsyslog/files/0001-Fix-function-inline-errors-in-debug-optimization-Og.patch
@@ -0,0 +1,34 @@
+From 6d575d98565ce3119a14359eecb11ccdff92a303 Mon Sep 17 00:00:00 2001
+From: Yash Shinde <53660251+Yashinde145@users.noreply.github.com>
+Date: Thu, 29 Jun 2023 18:10:15 +0530
+Subject: [PATCH] Fix function inline errors in debug optimization (-Og)
+
+Compiler does not inline any functions when using debug optimization (-Og).
+Hence, remove -Winline flag when compiling with debug optimization.
+
+Signed-off-by: Nicolas Marguet <nicolas.marguet@windriver.com>
+---
+Upstream-Status: Backport [https://github.com/rsyslog/librelp/commit/6d575d9]
+
+ configure.ac | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 21c1fde..1204c4e 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -230,6 +230,12 @@ if test "$enable_debug" = "no"; then
+         AC_DEFINE(NDEBUG, 1, [Defined if debug mode is disabled.])
+ fi
+
++#Compiler does not inline any functions when not optimizing(-Og).
++#Hence, remove -Winline flag when DEBUG is enabled.
++#ifdef DEBUG
++WARN_CFLAGS="$(echo "$WARN_CFLAGS" | sed s/-Winline//g)"
++#endif
++
+ # valgrind
+ AC_ARG_ENABLE(valgrind,
+         [AS_HELP_STRING([--enable-valgrind],[Enable valgrind tests@<:@default=yes@:>@])],
+--
+2.39.0
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
index e7b79ad03..bac5abb05 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.11.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1fb9c10ed9fd6826757615455ca893a9"
 DEPENDS = "gmp nettle libidn zlib gnutls openssl"
 
 SRC_URI = "git://github.com/rsyslog/librelp.git;protocol=https;branch=stable \
+           file://0001-Fix-function-inline-errors-in-debug-optimization-Og.patch \
 "
 
 SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
@@ -14,7 +15,3 @@ SRCREV = "b421f56d9ee31a966058d23bd23c966221c91396"
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig
-
-DEBUG_OPTIMIZATION:append = " -Wno-error=inline"
-
-
-- 
2.39.0


