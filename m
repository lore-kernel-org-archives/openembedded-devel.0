Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9EEEC52D7B
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 14:18:51 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.99248.1723645124936962932
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 07:18:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8956f7646e=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47EBffr3022874
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 07:18:44 -0700
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2175.outbound.protection.outlook.com [104.47.73.175])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 410n7frj8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 07:18:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XzppEuK0G9Mj6FpzVrzv0MIOAs060/+9DSgzB3JqGG6Qpv2DzaIlDNSFNPs9ambX8NCr4RojpoRip5kdCXmevv5REpLbvczbArLJ/sVixVwK8a/GQ9sPG8JnHn1MDomekE9fvR7upwi6J8WTCrp2KtH/RRDiJth6O+yviUnQXiNvHNHAVUMtR/NiBQ3qM12pQW6cFP34RyNhrO5Li9y2YbqipPpZowybvIlzcvEWObZLfq2hnvY5QjQDAzFK9Sd2f/VEqEKcVXQPvyjyseaaz7zUSbc0bo/lSPKZuH2He4Tjp86Uwe7KyDIvRQkK6VSxe/OpiokoXhi1gwlqP9ZU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXo0Z7MIu0lrkYCRkhjJRXqEHfysuqR2sY7Xg6PaW9A=;
 b=wp9ghD+QGLL2I183/CO3vt+6Rwfw8Dfuz+E+5Hv4doNMwEsIPkSPbtEsBQS/N9QlNJgIVk9PGJnw/cGJWO7VPyN6Ggb22LFxCDq5ASbRx/a2a+UbK7mJOZCS9CJ6ES//DgsmjtmFu6cOYvuzIkBCVeVI8Q+IKHM9uWwu07008ZpWt5iOeSXBAgtvZlf2EisnG+H/3gCKP3h4U8ZPXCqxOtfJce+AyYIB/IVUX1c2ygteYRLPYFRk9/xlmbJogYTOEC3PgTo4Cge9sY8LTT4HOEGdvqfAhLSBhHfkgTZdAvOFl4LoQuYgQy4yazuwK9hWE/r8mJs9Xq9xSyGmMG8MaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SJ2PR11MB7598.namprd11.prod.outlook.com (2603:10b6:a03:4c6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Wed, 14 Aug
 2024 14:18:42 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.7875.016; Wed, 14 Aug 2024
 14:18:41 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] audit: upgrade 4.0.1 -> 4.0.2
Date: Wed, 14 Aug 2024 22:18:30 +0800
Message-Id: <20240814141830.3293927-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0013.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SJ2PR11MB7598:EE_
X-MS-Office365-Filtering-Correlation-Id: c0272c8b-c8d7-4fac-d027-08dcbc6bffb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kL3lb6SvwRjlb+tlDgp33SmLA1IIFl+5It61sGCR80RBIPVWCwKIf/3/DaqA?=
 =?us-ascii?Q?UPlR2FdWdqbj7F564x3wc5TFBYydIv6UgBoSgACQq5QHXfwa98Jf4OlljRgA?=
 =?us-ascii?Q?rd+QjiY1MOpWrbZ4FmTRbX0zlwT0x4XfuvP4sL+v3NNAp8xHIzz2+/23n1pM?=
 =?us-ascii?Q?OcaRwUK+QGYl4bOgh5hh/dEaNay1octwWY3L8dMtx2svQG3o+KAwtiE1a4DG?=
 =?us-ascii?Q?ZtNpj+yBLHbhlDsaOsRgfKRQ7/dfBelfoH/GMfsVDoACB9hClkq/4CpTGXCV?=
 =?us-ascii?Q?Z0Z8fz7y694qWltiXnYyMvav9Vr6jJonNNx82Tr+3WQjSd0r3beD5nPMPv6w?=
 =?us-ascii?Q?NDxB3CEj6PKiUl3YWrtD21VFGSdumbHKgdkvp9x6b4nWE9H3ki2V8VrkNDMl?=
 =?us-ascii?Q?ICEO0Oy4IjUqwjR73z8WnsB9DSfnJFzbop3lvWAHbLRHiAvwjsbQcRYxAVrv?=
 =?us-ascii?Q?ebPwAzi1m/2r8YkpJdltUYHOWpqEv/YqRbb5a+7xGrIT9FPrATBFpYUSfdrO?=
 =?us-ascii?Q?QxXR1ytFsTOWio/jPE/d1+M9mqiPeYmn9mN3YFDD3Iw118mgPnLxuP99u8w0?=
 =?us-ascii?Q?7RaTvp6DIfLrOT7u4g4l5eKa7wdrDCZIeGmvyu5596IDu9GAOAwEICS9odGp?=
 =?us-ascii?Q?S6ctU1kvYrBNvmygaolDhBftaHSwfOEu2skKjwY/4fto9VGyxeYg7slJxY2J?=
 =?us-ascii?Q?IGO+W8Js1IB5elGZEFv6rPnB1grdU2cpY8VeJ5ibR3H81oCrlPVfETYISF8I?=
 =?us-ascii?Q?gaowt/bMw+Xv5L/mO+H0H1gp537voMh9KbEBT/XRF6btJibD7AomVtiB2LXi?=
 =?us-ascii?Q?De9o1tkj8UPb222ENMRYnPeA+gU6IXdYo4FWnsbVzcYv6DFCsPPHzcF+jFWi?=
 =?us-ascii?Q?Ay7igFH3O71mOZpmi8PBTJe4AmY0RBFSD7ZrqPqUY7eNHyzus5fLs8UMIP8c?=
 =?us-ascii?Q?4uDhV9tlZ2ZumCgpDxApA++KjrfFOOaTJkisy6PtfYwnu3xfVadvakwey6fT?=
 =?us-ascii?Q?oF/2EV1D5/vV6cbgQzMVXeyDdnuO+MukEo3ByV7zmAzQGoJppuSoylfxMPSM?=
 =?us-ascii?Q?dpBtmw7ZeRS4YQMHtlaHpmno9fz53X8Jrjg9RTginsYPk25kCOLmra8HEC1q?=
 =?us-ascii?Q?fdV7a8TudZZvA6wNFzhiiN8vLnBBvi19K7NCPEAtaXcDXj52sD43hDfZMQ0U?=
 =?us-ascii?Q?fBiuGOGllWlqXXbsMlj4zoVdPG0MkwBeLzubFWq3w9s4vtRs5FRkH9mLvvTV?=
 =?us-ascii?Q?JWOrj3Y6S3o72HxlOnmSNhx+Otc/n+38wf2Fx2o7Yq2gWux+g2UjkNm1RTz3?=
 =?us-ascii?Q?abC/X0JeQkg9SMPrXtk2eRrgMiS+JGlihaBHXVR3Wsd8xpqsKq8yeiDb3kx1?=
 =?us-ascii?Q?auhDIqE8/LaBUEfhc9vJVndd4nwPM7E0NndDBuIdTW4LYL2x6A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TqNAqAH5KTs1nib4fSkec7fE16kdMhHqYzkqbMeHCQ5/arTeZuUQ7KC6ZAi+?=
 =?us-ascii?Q?brJ1HW+CJzhfr6ECTxjCAGu35JdyYq0oyRCQjbEf/poiPuT0YBbLQkEbVOLP?=
 =?us-ascii?Q?ILipwcLJHQw5WJ9T0KJ2eSmAaa0sJSxNl7Bm8dY1IhI31qNkrecVtk6H2WV1?=
 =?us-ascii?Q?R8HXnl0tU8dS9vUx2LUyiRbn9IR6MjzVBVL4P+hMB0Fbp32Qc0Rk4q7+t0bY?=
 =?us-ascii?Q?ktov4cMmh2lrqeC0StXB3Rg0i8cfF/8xD8whDtUVEZRPHIVzzfE+f/CHIJCs?=
 =?us-ascii?Q?VwCUbUSWVURvcOTjEbHlKaX1w6pBOsoZnKhM0l8kBAilawHrD/TYeFb8oTDL?=
 =?us-ascii?Q?n9f0+eqXrb6k1qxtTVkg34uaRPZAfGbApao5YN8yYOmAZNae6NwShta0KuO+?=
 =?us-ascii?Q?Jdc1pQnaljDvi43KyDIPE7cMtJ6kT4axl6ilbPubgz0m1ltXlDEvvCOohgFO?=
 =?us-ascii?Q?zJ0o9c9Qj7mgsd7mXd30gEuOIzzPvpZCfoMWpFSERKl20QJnafF7p3yhyBMv?=
 =?us-ascii?Q?iRrV+LmyY9+7tPQBoc8sSK33EM9sNS4fWdQYAya9CD8MMyn7P+DHa7fMf19T?=
 =?us-ascii?Q?JX3FateMMKxcJSvDclTcC+U0WtM20Icb7E/sQw9mooV8Q5s029XBKfw7Oi0a?=
 =?us-ascii?Q?+vfZpV3c60zSDhAo2ZIrIKuyTKXo4PxPv77HH6Xan7chGTHXJDaNqZmduhBl?=
 =?us-ascii?Q?Q2C6himWWh90q7mIIr8zmLSAZl7YTAiPBPQ7CtZoSt5McSZT6G6lNEXQFV0C?=
 =?us-ascii?Q?apc9okbhH7X5TuDy6qRGfYLELqBaafP15DET6wamHJbAxjyOZFSNKODhNP4J?=
 =?us-ascii?Q?7HkO+SlA8/C0ALYlmHGzN4R7nt0Fl+zWqAMzsEdYszhv0CZVIZSyqtPaiOiN?=
 =?us-ascii?Q?YsEz7syBE3kJQF2s6Bv20ZRt10P52m+dZQfOx/FOf6RRF8r7uF9PBMctHvA5?=
 =?us-ascii?Q?oMRdQZ2OJt8gszL+891UTbTnU6hDQX4cRpY2NZaKDo7E8Nv5smwjVAJM4TjO?=
 =?us-ascii?Q?mSe+CgIoDjGd0ohFBrwte0RhAU4SQHMGEo2y9vUKFaK3hMe9OIJ1tS9v0BWz?=
 =?us-ascii?Q?OA6dg47Giyec7rLP/3q8zf1Ko4R3sqGgnrF/i8viAtWjO9dWpS0fVTWFBFVF?=
 =?us-ascii?Q?e8jTy2pNz6zFH9au5UBgYkMyl8mDPjdR7haUd2U10NakEWpctXHhXGKsO391?=
 =?us-ascii?Q?W3kWN5fp2WvyczTGUiZkY21LizhQdGIifLt93htpdbQ/VzjSMWzfqE3e8/0e?=
 =?us-ascii?Q?tCOpxoBckEQFLIUEJdj9q1ecighme4sUY0QuS7vfVJtrxDq+TKMVjko6eQvz?=
 =?us-ascii?Q?VsK31ovjK/ATzIHpZ6vllgbmhQqRlHxvFtReDTun3lrVTMGtiJReC9yE6/xC?=
 =?us-ascii?Q?qX6YVql4Sk9j/VVZAdJcBzCex/rONgDQy3pIIdgUNfugJRL3C1paVYNV4e6L?=
 =?us-ascii?Q?ozqsMt6kWNi4EGwaGO6uPflbGj2v6jOW6UA3xXknc+itw72w51lhQE8rqa0w?=
 =?us-ascii?Q?sHonImAX/JDtQ/9LiuCccihSe+X8ggaV/+rxSkLkNswW6cxEzUX0/V7INDI2?=
 =?us-ascii?Q?miIPzjhD37+aHbgNqQM3G1elcBcKsBjWDiTYt2YX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0272c8b-c8d7-4fac-d027-08dcbc6bffb1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 14:18:41.8823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R/qwEt5+dFjFvBmTy6Rd7rb73EvvyOuKRm7mP/+feqKV9WSYhpiwXoZfhUOcqKf3AqmSpQbi3HG7V425jBe7Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7598
X-Proofpoint-GUID: _fbwYLirsHSEDgiKQN0NU4OU7t2k_wbz
X-Proofpoint-ORIG-GUID: _fbwYLirsHSEDgiKQN0NU4OU7t2k_wbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_10,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408140101
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 14:18:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111805

ChangeLog:
 - Fix musl C builds
 - Many code cleanups
 - Use atomic variables if available for signal related flags
 - Dont rotate audit logs when auditd is in debug mode
 - Fix a couple memory leaks on error paths
 - Correct output when displaying rules with exe/path/dir
 - Fix auparse lookup test to not use the system libaupaurse
 - Improve auparse metrics
 - Update auparse normalizer for recent syscalls
 - Make status report uniform

Drop 0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch as
the issue has been fixed upstream.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...ute_malloc__-with-__attribute__-__ma.patch | 49 -------------------
 .../audit/{audit_4.0.1.bb => audit_4.0.2.bb}  |  4 +-
 2 files changed, 1 insertion(+), 52 deletions(-)
 delete mode 100644 meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
 rename meta-oe/recipes-security/audit/{audit_4.0.1.bb => audit_4.0.2.bb} (96%)

diff --git a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch b/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
deleted file mode 100644
index b1f324f22..000000000
--- a/meta-oe/recipes-security/audit/audit/0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 88c9b2c5cebebf13f90890baebbadc60d9fe8d16 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 9 Aug 2022 23:57:03 -0700
-Subject: [PATCH] Replace __attribute_malloc__ with __attribute__((__malloc__))
-
-__attribute_malloc__ is not available on musl
-
-Fixes
-| ../../git/auparse/auparse.h:54:2: error: expected function body after function declarator
-|         __attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-|         ^
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- audisp/plugins/remote/queue.h | 2 +-
- auparse/auparse.h             | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/audisp/plugins/remote/queue.h b/audisp/plugins/remote/queue.h
-index 36b70d04..031507dc 100644
---- a/audisp/plugins/remote/queue.h
-+++ b/audisp/plugins/remote/queue.h
-@@ -53,7 +53,7 @@ void q_close(struct queue *q);
-  * On error, return NULL and set errno. */
- struct queue *q_open(int q_flags, const char *path, size_t num_entries,
- 		     size_t entry_size)
--	__attribute_malloc__ __attr_dealloc (q_close, 1) __wur;
-+	__attribute__((__malloc__)) __attr_dealloc (q_close, 1) __wur;
- 
- /* Add DATA to tail of Q. Return 0 on success, -1 on error and set errno. */
- int q_append(struct queue *q, const char *data);
-diff --git a/auparse/auparse.h b/auparse/auparse.h
-index c27f1ff9..87c52965 100644
---- a/auparse/auparse.h
-+++ b/auparse/auparse.h
-@@ -55,7 +55,7 @@ typedef void (*auparse_callback_ptr)(auparse_state_t *au,
- void auparse_destroy(auparse_state_t *au);
- void auparse_destroy_ext(auparse_state_t *au, auparse_destroy_what_t what);
- auparse_state_t *auparse_init(ausource_t source, const void *b)
--	__attribute_malloc__ __attr_dealloc (auparse_destroy, 1);
-+	__attribute__((__malloc__)) __attr_dealloc (auparse_destroy, 1);
- int auparse_new_buffer(auparse_state_t *au, const char *data, size_t data_len)
- 	__attr_access ((__read_only__, 2, 3));
- int auparse_feed(auparse_state_t *au, const char *data, size_t data_len)
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-security/audit/audit_4.0.1.bb b/meta-oe/recipes-security/audit/audit_4.0.2.bb
similarity index 96%
rename from meta-oe/recipes-security/audit/audit_4.0.1.bb
rename to meta-oe/recipes-security/audit/audit_4.0.2.bb
index c189cfea5..d6742c9eb 100644
--- a/meta-oe/recipes-security/audit/audit_4.0.1.bb
+++ b/meta-oe/recipes-security/audit/audit_4.0.2.bb
@@ -13,10 +13,8 @@ SRC_URI = "git://github.com/linux-audit/${BPN}-userspace.git;branch=master;proto
            file://audit-volatile.conf \
           "
 
-SRC_URI:append:libc-musl = " file://0001-Replace-__attribute_malloc__-with-__attribute__-__ma.patch"
-
 S = "${WORKDIR}/git"
-SRCREV = "22ccbd984e493524050ac445f796e9a7e90e1149"
+SRCREV = "4e6deae41d4646d28bb3ba9524a8a227a38ccd0b"
 
 inherit autotools python3targetconfig update-rc.d systemd
 
-- 
2.25.1


