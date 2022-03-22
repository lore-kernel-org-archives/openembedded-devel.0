Return-Path: <yi.zhao@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58357C433FE
	for <webhook@archiver.kernel.org>; Tue, 22 Mar 2022 04:47:39 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com
 [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web08.6122.1647924458902637735
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=HsVLAzvi;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}:
 invalid domain name (domain: windriver.com, ip: 205.220.166.238,
 mailfrom: prvs=00800cfd2b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id
 22M4Uhx1015198
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=gEOBxYZrIhWaJoFuXTcW2FGWbNSph0S2kYgFxRmr1TU=;
 b=HsVLAzviCQ8VA27YudlxbIY2myMQubzP9b5yfSSes1jZPmRI/p2FV0fMNn1tcDnSNhe3
 uICXz33danA8aSl/f1GeDIdyV214ZId3XijH6/QXZbbGzYge4p37ZHbIXRSX3cc59W+a
 oAwuO5mk84dw8pKE09BvrYcXZl+chi12RgFX+M8+n++fJIGS3ml8qnvNr030e273QTqI
 oH7+qxwYb80OVwiCBDloS5C4nLQVQa1ghlecJvVyrp5YCUG5Wj0ra9R8EaCB0/3f/+DH
 DOpBh+6xROfmZqaO1r8/ReOIobSK2XzZynFMavO+cIScFyeew45w1HPkFk4yTSPYRKua uA==
Received: from nam02-bn1-obe.outbound.protection.outlook.com
 (mail-bn1nam07lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3ewaf3t1qw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 21 Mar 2022 21:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nCepmLU08SZ4UO7g3YYZ+cIL10tRvsF8A1ItrgbmDf9/mxiAVSj9+oUXhCEdiOj4Okaoii8TXPZMCHDlRGRbg1t+dhsndGQq81DV5uiv/5F2xSkD8a3ZnWcbjGd/JLr26UYnY63FvXWSK6b0fr/uerz/y78JC6SF1shDCknuIwn1A2p4cmsUM+aMu//og4ggHBdYBQ40+MEKaZsYfC5dT3Xas5v+uihTpNHL0lI29Jf7hOTocF6cAt4AnjN8QywqeDEoWYeUuVVdeZlCoF5NeQHmGfMrKJMZ2GzLbAi3MhegwPCCar9VBoizXuGQAexJoIeS4+jY6OAvJiLIMpXEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gEOBxYZrIhWaJoFuXTcW2FGWbNSph0S2kYgFxRmr1TU=;
 b=FtrigwwK2VzeQpX+mPGLmtIMzu1Gj09/OJ+J79oQJywRpVbmJNEy0Vs2haMptDpmBy2e1baSmL4VzSBhGAOEHquTxtD7Vpr1Qv41F3JgoKVXrPKWI9hw0U//dzfUSXN+yRgr2uanKYVHHz3PIeeAw2lb2iMHgMSWWBkdARHjNQGUbOwzqV8Y1KbwRCM6LZ5HeOu2iiDvpFytAXN2xJlz2EHc0JVkARg2SpoxzmEkdnV4V79IIo45pNWDNB+0vgBvmYFj/OTOsyW/x4DRbnUdOCw0wr8cVGegzH9iFatWtAHv2ef7NFkjvxwGVnbhGiRRNFh3B0VXOle9z8lra5/SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by SA2PR11MB5098.namprd11.prod.outlook.com (2603:10b6:806:11c::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.19; Tue, 22 Mar
 2022 04:47:33 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::8ec:d095:e49b:d875%7]) with mapi id 15.20.5081.023; Tue, 22 Mar 2022
 04:47:33 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/4] postfix: upgrade 3.6.4 -> 3.6.5
Date: Tue, 22 Mar 2022 12:46:14 +0800
Message-Id: <20220322044616.867009-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322044616.867009-1-yi.zhao@windriver.com>
References: <20220322044616.867009-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b7f77f77-6225-4a36-fee9-08da0bbf141d
X-MS-TrafficTypeDiagnostic: SA2PR11MB5098:EE_
X-Microsoft-Antispam-PRVS: 
	<SA2PR11MB5098C92C475DC2AC745FA541F9179@SA2PR11MB5098.namprd11.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2a2vIfh3UCuADOirsBUdNiVcQenHMC5yI6WxuFqEzshMfo/0VdACSoMpvrWzeWkSvY2lp5SMpuaI6/hgrfOuhHjZxDIHwtw1kpx1g/w1SzrffCIXvzGlKfRFoHHX4nzIAj0qdfvZ/tCo54RNpVwH5GRYpHK5iEn+YsEVioVqmZ7pZqmNrf6irExEu/f+fSM5M3tWxjBoynDTENTBfMKanXzetchq7uwfOLm9R3XMJU6Mo2bg2Hdigj4Mdw2uTWvupcTcXNyZqzVX1yTfUFfx0NKGj+XaCrQ4xektuu4WuAF22Q/R8uC9J/HW40rKgJcYFfjuu5MX2peWZC5fyIZZXgTShg2RGKVgnjj8m5T0n1DMaVCzb2wNx65Bhh8OkrsTZAK/vMGhWgIjFuANCuiOc0mSSyxmCfb7WVpIOODs875W2SIkiBwljN48p9qXDu64/wV+K+ho4pgoR9Qx/04Ki48cwvWDsTYV7yEjPubzW45/KPxJAB0qXOC9hoaaBgZxKUgo2EaQnAIFlMtAWqhILN0i0cE+88R+UYW3RMVLxcsV4VJqrWWvZhTM3/NoxGfKb23+Ibx7PxQLoJYxilNK13WwDERbxCfGgCgC5bikw+ASpolcIb6N0AD+Ph7oFASGnwblvKiT0Od6ExmyLgqdDCGFecV9UhlKNr+VPJTmJEDx3SnIIiCPKAE5SBLtH1ugl/xsqSABx21egHto0YSTUajukA7yzGA+rlkBl3awKwMVS1jVxZSquHPCNlsB2/ZCh43f8ceY6DnCN/bh+vXl6gVYWxWF+LjVcLjuDulkvuNmQja5Daxkhs5x28nKR60e
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(2616005)(8936002)(5660300002)(1076003)(26005)(186003)(6512007)(52116002)(2906002)(6506007)(44832011)(6666004)(38100700002)(83380400001)(966005)(86362001)(66946007)(66476007)(66556008)(36756003)(8676002)(316002)(6486002)(508600001)(6916009)(38350700002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ein7dg8SF8g50Umzz7rsT3ioGrynWQ81ba/NS8tOV+M+Gc6WzmUspOmNPrHk?=
 =?us-ascii?Q?rqnHdoeZp0FaBfZqQSzVFRSfSodwYroPBZk5lWZHunyC4J3bpo/+vPndP3cy?=
 =?us-ascii?Q?3lDP+g3MLc+I7VVgI/OJUDvz8kurtgOk3SQG04y/jGADFyC9YxC5x+Wf0b1x?=
 =?us-ascii?Q?KC00EN64V1L9sa0toRtOQnYlE6rQm64hrdEl7JcMFWVAW/K5TLOhozhmwYKt?=
 =?us-ascii?Q?JUqZIr5ZXeWQ+E3Dp5rdDTlFfYvLI4jMCnIkZUVCVkcKRoXss9dix2SNrOWz?=
 =?us-ascii?Q?3GZhzkWPPRtxcLkBEHy7ox+pWbjADtshR102TzTac644r4xYOXGb4sv4wN+X?=
 =?us-ascii?Q?uP4Y3M1AVw/vZ7GPgm0KXHK+MEd1IT++NybwrQlZe8vsfjjDqolTsTdzxDLs?=
 =?us-ascii?Q?UIxAQ03nEaotF76vioF05B+IU4KBCDWChjok0LMlw7JhYEdXwwNTlEgMPpQ6?=
 =?us-ascii?Q?9CJNXhSvt3Z4qa3GwLTI6UQ3UQ216YCH9Fv00XQ3hYhGjRDuKNuNi1uohiBz?=
 =?us-ascii?Q?SH0WrAaxUrklhovvtvD8fwRHVDiQ/OdSmL4Xt4XVDHeEVm69En8lAp2lmAlY?=
 =?us-ascii?Q?6ANj+eu2tpo/EeRxgacOBi6sFeT2K48DOBHbIqKj+f956R5HyKXM0rG/QVMS?=
 =?us-ascii?Q?60FsdPnRusNgWgX5iIKRz3Jg31U7sKOwYBlfreq9P6wt+/YTSmVUZUt06E86?=
 =?us-ascii?Q?AlQFlERd5Mi1aEfqxZWBZSkbn9/DECOB/1YrlYFa2LJbNR+wIcgrGEiUAfxd?=
 =?us-ascii?Q?rL+McL7lxfOwis6tiuHmen9gyvOOWFT1QK2jDsh5k/cLrFYb4Cz7/QqwToOD?=
 =?us-ascii?Q?JCpi9V7cgtTpISTqyPdvHJKGABYA792GBSBNCDqd50tiwuibuA23KagWFfVQ?=
 =?us-ascii?Q?a/9f+hjK5zAYsNZ7ZVHV5KbIYN5WIG8p59pzzmRUZ1BQBrfksIzlnaMXAb6I?=
 =?us-ascii?Q?pr44iQSygs62y4rdidJnLfIltHVktH+7XHjsPJCToug2b7mxcaDEGBfcPt7H?=
 =?us-ascii?Q?3wTU8bgIBAB4+6HKv7jwGJZAFb6umReIq6lbJ2k+KWdy6XeulDYUJB6iO1lh?=
 =?us-ascii?Q?hMfbuVZqKgxZMH91nq+GdCYo8d0iPGkvqaK9eCzw6FZnzU23iEfhR3tdKO+o?=
 =?us-ascii?Q?EuO3GWHA8P0OX3dg0E5J+bvgzt4Ytd5aAZjAg7VJkm7nvwcovIjBgv3kIcA8?=
 =?us-ascii?Q?mjl7iNqAu+661huWyVcMI/Qzu+FijUbRLQwr1VlblCE5i6Pe6x1xq6tX5Wbj?=
 =?us-ascii?Q?y8CRILsapqYJFkfBRJi/6LL/jh6jDAAjySzRZgf8G680I3Nb/ebpiGZ50LbH?=
 =?us-ascii?Q?EEKYHp3y5CQ40Lt/jowLkYid3aKhNlENPN17UWOpJmCfOlATWQFLt5dkOnav?=
 =?us-ascii?Q?ExYTJOEY/dMoj39B10HR7WfE+Ule3HIm86Nv6pSxwAuGlAOit8wth2V9eE5r?=
 =?us-ascii?Q?VW4reftuUlVCdjHEx0by12URkQhf+n4B?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b7f77f77-6225-4a36-fee9-08da0bbf141d
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2022 04:47:33.3027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 qdqbyQtz4o58Brc3OEWeon0Hm8+dCXHZNZ19biX251Aec7eU1pRLEoox7HP0R69oHVF3wdahYLMhbmgNYnFUUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5098
X-Proofpoint-ORIG-GUID: 4mWujKwikQxjsqSlp_-N_BvFR2Zd1lUs
X-Proofpoint-GUID: 4mWujKwikQxjsqSlp_-N_BvFR2Zd1lUs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_10,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203220026
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Mar 2022 04:47:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96128

ChangeLog:
https://www.postfix.org/announcements/postfix-3.6.5.html

* Drop 0006-correct-signature-of-closefrom-API.patch as the issue has
been fixed upstream.

* Update main.cf to eliminate startup warning:
postfix: Postfix is running with backwards-compatible default settings
postfix: See http://www.postfix.org/COMPATIBILITY_README.html for details
postfix: To disable backwards compatibility use "postconf compatibility_level=3.6" and "postfix reload"

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...6-correct-signature-of-closefrom-API.patch | 104 ------------------
 .../recipes-daemons/postfix/files/main.cf     |   2 +-
 .../{postfix_3.6.4.bb => postfix_3.6.5.bb}    |   3 +-
 3 files changed, 2 insertions(+), 107 deletions(-)
 delete mode 100644 meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
 rename meta-networking/recipes-daemons/postfix/{postfix_3.6.4.bb => postfix_3.6.5.bb} (82%)

diff --git a/meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch b/meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
deleted file mode 100644
index 95ca03b22..000000000
--- a/meta-networking/recipes-daemons/postfix/files/0006-correct-signature-of-closefrom-API.patch
+++ /dev/null
@@ -1,104 +0,0 @@
-From 56bec31c4117fddee3a141bcca6c585aa8ddbbe2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 14 Jul 2021 18:08:30 -0700
-Subject: [PATCH] correct signature of closefrom() API
-
-glibc 2.34 introduced this function and finds this error which has been
-all along.
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/sys_compat.c |  6 +++---
- src/util/sys_defs.h   | 12 ++++++------
- 2 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/src/util/sys_compat.c b/src/util/sys_compat.c
-index 8bf8e58..c87f043 100644
---- a/src/util/sys_compat.c
-+++ b/src/util/sys_compat.c
-@@ -286,7 +286,7 @@ int     dup2_pass_on_exec(int oldd, int newd)
- 
- /* closefrom() - closes all file descriptors from the given one up */
- 
--int     closefrom(int lowfd)
-+void     closefrom(int lowfd)
- {
-     int     fd_limit = open_limit(0);
-     int     fd;
-@@ -298,14 +298,14 @@ int     closefrom(int lowfd)
-      */
-     if (lowfd < 0) {
- 	errno = EBADF;
--	return (-1);
-+	return;
-     }
-     if (fd_limit > 500)
- 	fd_limit = 500;
-     for (fd = lowfd; fd < fd_limit; fd++)
- 	(void) close(fd);
- 
--    return (0);
-+    return;
- }
- 
- #endif
-diff --git a/src/util/sys_defs.h b/src/util/sys_defs.h
-index 2e1c953..515de6c 100644
---- a/src/util/sys_defs.h
-+++ b/src/util/sys_defs.h
-@@ -1509,7 +1509,7 @@ extern int setsid(void);
- #endif
- 
- #ifndef HAS_CLOSEFROM
--extern int closefrom(int);
-+extern void closefrom(int);
- 
- #endif
- 
-@@ -1563,7 +1563,7 @@ typedef int pid_t;
- 
-  /*
-   * Clang-style attribute tests.
--  * 
-+  *
-   * XXX Without the unconditional test below, gcc 4.6 will barf on ``elif
-   * defined(__clang__) && __has_attribute(__whatever__)'' with error message
-   * ``missing binary operator before token "("''.
-@@ -1577,7 +1577,7 @@ typedef int pid_t;
-   * warn for missing initializations and other trouble. However, OPENSTEP4
-   * gcc 2.7.x cannot handle this so we define this only if NORETURN isn't
-   * already defined above.
--  * 
-+  *
-   * Data point: gcc 2.7.2 has __attribute__ (Wietse Venema) but gcc 2.6.3 does
-   * not (Clive Jones). So we'll set the threshold at 2.7.
-   */
-@@ -1653,12 +1653,12 @@ typedef int pid_t;
-   * write to output parameters (for example, stat- or scanf-like functions)
-   * or from functions that have other useful side effects (for example,
-   * fseek- or rename-like functions).
--  * 
-+  *
-   * DO NOT use this for functions that write to a stream; it is entirely
-   * legitimate to detect write errors with fflush() or fclose() only. On the
-   * other hand most (but not all) functions that read from a stream must
-   * never ignore result values.
--  * 
-+  *
-   * XXX Prepending "(void)" won't shut up GCC. Clang behaves as expected.
-   */
- #if ((__GNUC__ == 3 && __GNUC_MINOR__ >= 4) || __GNUC__ > 3)
-@@ -1739,7 +1739,7 @@ typedef const char *CONST_CHAR_STAR;
-   * Safety. On some systems, ctype.h misbehaves with non-ASCII or negative
-   * characters. More importantly, Postfix uses the ISXXX() macros to ensure
-   * protocol compliance, so we have to rule out non-ASCII characters.
--  * 
-+  *
-   * XXX The (unsigned char) casts in isalnum() etc arguments are unnecessary
-   * because the ISASCII() guard already ensures that the values are
-   * non-negative; the casts are done anyway to shut up chatty compilers.
--- 
-2.17.1
-
diff --git a/meta-networking/recipes-daemons/postfix/files/main.cf b/meta-networking/recipes-daemons/postfix/files/main.cf
index e75c6fc0d..22c57485d 100644
--- a/meta-networking/recipes-daemons/postfix/files/main.cf
+++ b/meta-networking/recipes-daemons/postfix/files/main.cf
@@ -1,4 +1,4 @@
-compatibility_level = 2
+compatibility_level = 3.6
 smtputf8_enable = no
 
 # Configure your domain and accounts
diff --git a/meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb b/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
similarity index 82%
rename from meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb
rename to meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
index 54c8eab5c..343a8b2df 100644
--- a/meta-networking/recipes-daemons/postfix/postfix_3.6.4.bb
+++ b/meta-networking/recipes-daemons/postfix/postfix_3.6.5.bb
@@ -12,7 +12,6 @@ SRC_URI += "ftp://ftp.porcupine.org/mirrors/postfix-release/official/postfix-${P
             file://0003-makedefs-Use-native-compiler-to-build-makedefs.test.patch \
             file://0004-Fix-icu-config.patch \
             file://0005-makedefs-add-lnsl-and-lresolv-to-SYSLIBS-by-default.patch \
-            file://0006-correct-signature-of-closefrom-API.patch \
            "
-SRC_URI[sha256sum] = "8de0619dcf2fa7c215a80cf84b82ab71631d4d4722cba0949725ce3e18031d4e"
+SRC_URI[sha256sum] = "300fa8811cea20d01d25c619d359bffab82656e704daa719e0c9afc4ecff4808"
 UPSTREAM_CHECK_REGEX = "postfix\-(?P<pver>3\.6(\.\d+)+).tar.gz"
-- 
2.25.1


