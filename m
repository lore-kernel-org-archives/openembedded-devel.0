Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6A10C6FD1A
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 11:03:23 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30525.1678100597741945973
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Mar 2023 03:03:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=N8JJ7Dkk;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2429e4d58b=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326AeiL0016794
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Mar 2023 03:03:17 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version; s=PPS06212021;
 bh=+WygSy3Vi+6qNXWXVk7mFs27+w3m9+KuC1Nu+SLCAdg=;
 b=N8JJ7Dkkf7lvpAzdq3GrSC+X31g229Bp+iukNkR+r+HVwu/rqYpL3hncJiF3hCYaopRl
 KAL2ju9BfYrTviIpEApxupL4aSqyCLZyj+JrjdHqqWluaJEUzlLhXDpaE79bOvLEwKb5
 zlrf13tR4b/WdFXZEFw1FDokQlSFPxYSmhsg3xvc804uXUfvdQBn6IIBgNvcAX6Isda6
 1rT23i7mwF03TSSXzCgpmdOdscpNslP3c/gZH9zXwUZ3CiXaa67qlTQRWHcExcwRI+Al
 28d9duthAvVsANoEwHavy4Q+PPfd1jhzFlgC/Si+ggDAoZZK3qvcktdP3FSc+Em6ZDGc Vw== 
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2170.outbound.protection.outlook.com [104.47.55.170])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3p4258sp5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 03:03:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2ZfsUCKFuWTq6hGWSt/fQU+yvN1nfvNALKGxWMZXnePgKHDsyt0TeTgZqR4ghkRVJKR6JVgigvA/97m4SNkMQxzFEYVmrXD6PyFhcCCHwIToOseLxxMOuEm76BauAwsEH0t4gchTDLMax4hTp/PyrGUF4Ac+34/43jkGDZ+Ul4MXzI41DE1S7ROmTtFYe2k0v5MgZO528AfdeZVz+ktUS42Br37P3iZDafkEiVQv3/Yq/4NBNy4m3KrChC+sSKkjQofFt6IEtnZo8C6ZYQ+1ugtyC3dM3F23CWgG6RAXNKOLAa1wOFzWvn2R0dl6kNDWxue3/IUjB7Xanzt3OdbXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+WygSy3Vi+6qNXWXVk7mFs27+w3m9+KuC1Nu+SLCAdg=;
 b=EBNkU3skIKAxGGXlIhcryHPKusHo0tthv8DZj21mPLbI7eCnyKqmJwPmclvKtZ+5qLRK3dkDQd6PAjpj6Cdi60XdeGXHBFPjxyYhsClEGOulXjcV/RqxkILxasOGGbpzkzIPKeFxQjan1MPO41Q53/jcLqQJWO89g02ixqvYY14WuWRiynU7Dsjn+FvZLtmyfzwA0q38rk5G9YmY8LA/6fCbWl1XPTtyHbsgDUWG0V+BLpij6Si9hUc583B6IEdkrFD63iCkv9s4DgNvhQowf5KV1cA9uaePWwc2ivJE6BAAmRuinc+o2y2BqdMz/ybDXE/iDCJSZMKsWK2/fk6yIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by PH8PR11MB8257.namprd11.prod.outlook.com (2603:10b6:510:1c0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 11:03:14 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::3cb7:edf3:7304:982e%2]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 11:03:14 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/6] libnfnetlink: upgrade 1.0.1 -> 1.0.2
Date: Mon,  6 Mar 2023 19:02:57 +0800
Message-Id: <20230306110301.75991-3-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230306110301.75991-1-yi.zhao@windriver.com>
References: <20230306110301.75991-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:510:174::17) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4867:EE_|PH8PR11MB8257:EE_
X-MS-Office365-Filtering-Correlation-Id: 604aef61-7c6a-4a8e-bbb6-08db1e3261a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k30xweS9yqx7tb1DMfuQl6YIQV1K7HsY6ofaLc5MRwJCMTQiyELH4qWw7uaMEnJPtcSvuPzJIZD7P1NjBkOq98GbxnUdAsow/DNqaTsBPiNhPqZJLiHY9plDtwHupju5fJJG4COs4wHct50enk4+HY92A9j9G3CRr/H5JD2QCF3e0dMmZlf0jbMCpWwm+jJ1UyAj4vYnzLBHH+5+2vrVwx3aWsx/jwXjGDn/EbB4T5u2HAB3FRODU2DFLFJmkOwJPSegcAld1LxJLGvhEBDtTweQgV168tg85Ec+oFIXhBzMD2uPgOD9aRmbmR6OiW8ZCtvxMToL2A0We3vvLARn/7Kj6B9uV+WUmOFATa8/68TR5ApB6LBx1AzPkG0OouXLnWub0oGQGKwqMh+sH7JTz6dizn+T/hGKvW56rKVsJGwtbTdiiBlrSQZlAQ5dPH5lqcYtgwEf/rFUPjCOLhNGcTgQrjdhU3c+fIBpZk+/f4DFP/nsuCtPd72NCcojye8RngdXjXRToIFd8GXNAJbIyD+byNJ3amtUAM6d/45BQ47BTxbXc2mHAwUPgAEjgNPc85YcSIyN1su12/VvI9j2KIULC5aQDYKDAzPNGaFvbDp0NCpRuM7wPvnGN/8TB2tHHswnSM143X/zOyK8W+wrGLp7cYkTaGzElzww1RPqG3G5XZavWdfOJhqAjtzKghrHjHZUlmk5tdbtpRs+rQSzfB5AFI4/rY1Wz0oaE/t1U8RGqd1kB9lsUC1JSU7ApeA9UGyoAKZIjB2codQAmQbo661CGi+wDq7rcWSL/OIQCbI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(83380400001)(36756003)(478600001)(316002)(38350700002)(38100700002)(2616005)(6486002)(6506007)(6512007)(6666004)(1076003)(52116002)(186003)(26005)(41300700001)(5660300002)(44832011)(30864003)(66476007)(66556008)(66946007)(8936002)(19273905006)(8676002)(6916009)(86362001)(2906002)(21314003)(2004002)(563064011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pM3ILAozQhSB8Mt/adOVAWUYEa39RB4T3SxdRs7uOsbd/hGnevxlRSx5nDa/?=
 =?us-ascii?Q?iZ8B+IXnj2k0RRxd6EmT4+cXNY8RcDgFFGdbLKQ46igP0hvXuYYSMYueXRRu?=
 =?us-ascii?Q?1ARqsCVUrBLK2pDSVpY6omhlKeKe4MiNf1ayArWkPs/nhCsyaPFeiCbnG/Zu?=
 =?us-ascii?Q?JM83bNRAi0zRyUISulPeNJR3Kdetf4CtSHHa7yEXLAROq+ggB85t68/1Qwcp?=
 =?us-ascii?Q?TS8pvEeix2N4rB0HQJq2dRcf0n5MRkBgmo0pdLedsyouhxQPl8TmRTnynDuL?=
 =?us-ascii?Q?VKau0/DHsrOvMcdWliqe6j78PVLs3M0iQknWVVLwnz7ZOAI0NPNjLOHl0Zpt?=
 =?us-ascii?Q?LbgzGylASi0ygn7eN5ass/La+XD6gedvUZw+twIOo9fvce/1ecdclnX7u+wr?=
 =?us-ascii?Q?sOd3Q/DW9bK7qmlHRvQct8tc+LU9sSnbT+eJhs1+WZp1CLXHvLBAkffauu0K?=
 =?us-ascii?Q?/8SjAn/rRGMpYmabXIsH+LEsZONXQ3PnRmk40GNVm4wMgQ0Z8pqEY2d391kZ?=
 =?us-ascii?Q?syHe7HkaQ0pQ8z9YxJKu6oopbnlkVSCV99hxMJcQnTQQXV5TaXSTWP2YbRpF?=
 =?us-ascii?Q?AUgGbJbmZvdf5JU2VzhC3D6VUmGy8wngkKPxCq8PUS0xB/I7dgClo5LR4XjL?=
 =?us-ascii?Q?vXjobTh5G5JfiNKYGUOzGIzZfKhRna0+bFuDPA19OJpfbN3nE2k2LCc3/yzG?=
 =?us-ascii?Q?LP8yxIygEPtXo8pxsB0vQz/KbQpCV0IhFtKfjxB1bKylX+LiIPMOMGLD/CVJ?=
 =?us-ascii?Q?nq6BBfv4wyD56ULFdezL8YjKx6G3Gheko16aOnsPmDwRSBaMRYEaGtVs650A?=
 =?us-ascii?Q?N/kqyap3OqPzIyk7PAlu8PbvSL/RLdKSUEjzDC86TsGTofeXN/J1HTVLyrlE?=
 =?us-ascii?Q?sa0ZC3k4bDKy1nRDG4xrWa5dfFhpKxmLgCQDVHOQXLJfVr4UgaULznvytTWd?=
 =?us-ascii?Q?RwTSWys0k+oV3AJoQGBY9f3BhSVC6J7idzwXx99iGwsg3uhOhJ3yVq79Vxc9?=
 =?us-ascii?Q?4SvqrRf862KkAo5Xb8wJEwIg79zotrK2BsQbNT2/yT+7ce2k2xTgD6ggE8YO?=
 =?us-ascii?Q?Vmzlbzh+6MK4DTCvLbAzFveNY4IhJ1knzIBJPMAcC5X4r0VBmz/jQEIIQiY1?=
 =?us-ascii?Q?ACNUE/lC1SFmU5LXXY16qtgxMDYI51rpCGgymDYv/4j2LDCwXYpmmRRMNNUw?=
 =?us-ascii?Q?yQh4y4vec5GLN8QP82cv3xiQ9jjlNexFbni90ALsID/Fsc7za6s0TrVo9rt6?=
 =?us-ascii?Q?LHrpnYC03t8ZlbyuAy+Rhyd1oK/4sxg9b0CI+zd+HC3bPPTIDSF2etBjTj7f?=
 =?us-ascii?Q?e2SUSUoSinPvRP2l5dk1VU3Vmxd9nK5VcUrs5CbFtWHkpeftYV1BRJ+n9ifF?=
 =?us-ascii?Q?aNXMDomlIs7xsKqh9mhh6iMKr2MdgKJqSN7waj6FmiMbDt8rgRBxp6BDOvWO?=
 =?us-ascii?Q?z5fSjba26FReFRh6WYns8r08HuUfaEUBYNyo+G3vrG2qI3oJCnGf4e3pvG2S?=
 =?us-ascii?Q?dBHG7qnjQqFH6FuyLrU+rSni6DVlko0RNtDzc7PQvpE8IO+BEVETNOj8m9aM?=
 =?us-ascii?Q?Jmp5ILt0bMPN9VZrScc+gEELWyLgi9CVxUkr7wpPZ/BB+HTuwWpimlRvgj8E?=
 =?us-ascii?Q?3Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 604aef61-7c6a-4a8e-bbb6-08db1e3261a4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 11:03:14.3032
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bWUrMupKoKwpHSsTtWshvI9R15cX+qLjZC7NmsIp93CWE6daDITi4aNaVmyNjEIuNK3HohabXutaEyn87e5PVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8257
X-Proofpoint-GUID: Ev_ohGiCacFKu7jDnND-ockZ9pkj-DK1
X-Proofpoint-ORIG-GUID: Ev_ohGiCacFKu7jDnND-ockZ9pkj-DK1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_03,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2303060095
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Mar 2023 11:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101395

Drop backport patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...build-resolve-automake-1.12-warnings.patch |  28 --
 ...ode-license-header-in-sync-with-curr.patch |  49 ---
 ...0003-configure-uclinux-is-also-linux.patch |  27 --
 ...tialize-attribute-padding-to-resolve.patch |  39 --
 ...005-include-Sync-with-kernel-headers.patch | 110 -----
 ...0006-src-Use-stdint-types-everywhere.patch | 403 ------------------
 .../libnfnetlink/libnfnetlink_1.0.1.bb        |  25 --
 .../libnfnetlink/libnfnetlink_1.0.2.bb        |  20 +
 8 files changed, 20 insertions(+), 681 deletions(-)
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch
 delete mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
 create mode 100644 meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb

diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
deleted file mode 100644
index 00d95cd79..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0001-build-resolve-automake-1.12-warnings.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 2e5f2b81fb8cbe0d1cd33e58caa19ac308e1f847 Mon Sep 17 00:00:00 2001
-From: Jan Engelhardt <jengelh@inai.de>
-Date: Tue, 9 Oct 2012 15:59:48 +0200
-Subject: [PATCH 1/6] build: resolve automake-1.12 warnings
-
-am/ltlibrary.am: warning: 'libnfnetlink.la': linking libtool libraries
-using a non-POSIX archiver requires 'AM_PROG_AR' in 'configure.ac'
-
-Signed-off-by: Jan Engelhardt <jengelh@inai.de>
----
- configure.ac | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/configure.ac b/configure.ac
-index ed549df..0926a1c 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -7,6 +7,7 @@ AC_CANONICAL_HOST
- 
- AM_INIT_AUTOMAKE([-Wall foreign subdir-objects
- 	tar-pax no-dist-gzip dist-bzip2 1.6])
-+m4_ifdef([AM_PROG_AR], [AM_PROG_AR])
- 
- dnl kernel style compile messages
- m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
deleted file mode 100644
index c2fb5e05a..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0002-src-get-source-code-license-header-in-sync-with-curr.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 5e6b6e23a8b04475c5a9de7eddb4c18103932fe5 Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Wed, 7 Aug 2013 20:53:57 +0200
-Subject: [PATCH 2/6] src: get source code license header in sync with current
- licensing terms
-
-Since (3956761 license: upgrade to GPLv2+), we upgraded to GPLv2+,
-propagate that changes to src/iftable.c and src/rtnl.c
-
-Reported-by: Thomas Woerner <twoerner@redhat.com>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- src/iftable.c | 2 +-
- src/rtnl.c    | 4 ++--
- 2 files changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/iftable.c b/src/iftable.c
-index 0325335..5976ed8 100644
---- a/src/iftable.c
-+++ b/src/iftable.c
-@@ -3,7 +3,7 @@
-  * (C) 2004 by Astaro AG, written by Harald Welte <hwelte@astaro.com>
-  * (C) 2008 by Pablo Neira Ayuso <pablo@netfilter.org>
-  *
-- * This software is Free Software and licensed under GNU GPLv2. 
-+ * This software is Free Software and licensed under GNU GPLv2+.
-  */
- 
- /* IFINDEX handling */
-diff --git a/src/rtnl.c b/src/rtnl.c
-index 5ccb272..7b4ac7d 100644
---- a/src/rtnl.c
-+++ b/src/rtnl.c
-@@ -1,10 +1,10 @@
- /* rtnl - rtnetlink utility functions
-  *
-  * (C) 2004 by Astaro AG, written by Harald Welte <hwelte@astaro.com>
-- * 
-+ *
-  * Adapted to nfnetlink by Eric Leblond <eric@inl.fr>
-  *
-- * This software is free software and licensed under GNU GPLv2. 
-+ * This software is free software and licensed under GNU GPLv2+.
-  *
-  */
- 
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
deleted file mode 100644
index 6cb7ed6fa..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0003-configure-uclinux-is-also-linux.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From b259fe13826414c1bd5328a25c8d6d60e20e65f2 Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Tue, 10 Sep 2013 16:23:29 -0300
-Subject: [PATCH 3/6] configure: uclinux is also linux
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 0926a1c..b979772 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -18,7 +18,7 @@ AC_DISABLE_STATIC
- AM_PROG_LIBTOOL
- 
- case "$host" in 
--*-*-linux*) ;;
-+*-*-linux* | *-*-uclinux*) ;;
- *) AC_MSG_ERROR([Linux only, dude!]);;
- esac
- 
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
deleted file mode 100644
index cf3a84135..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From b142da8d2c9e2e2dfbe4e89e680dd124f6064ac8 Mon Sep 17 00:00:00 2001
-From: Pablo Neira Ayuso <pablo@netfilter.org>
-Date: Mon, 3 Feb 2014 12:09:29 +0100
-Subject: [PATCH 4/6] libnfnetlink: initialize attribute padding to resolve
- valgrind warnings
-
-==12195== Syscall param socketcall.sendto(msg) points to uninitialised byte(s)
-==12195==    at 0x51209C3: __sendto_nocancel (syscall-template.S:81)
-==12195==    by 0x53E4D12: nfnl_send (libnfnetlink.c:391)
-==12195==    by 0x53E6952: nfnl_query (libnfnetlink.c:1569)
-==12195==    by 0x4E344AF: __build_send_cfg_msg.isra.1 (libnetfilter_log.c:143)
-==12195==    by 0x4E34710: nflog_bind_group (libnetfilter_log.c:413)
-==12195==    by 0x400CB1: main (nfulnl_test.c:77)
-==12195==  Address 0x7fefff3e9 is on thread 1's stack
-
-This patch sets to zero the padding that is included to align the
-attribute payload.
-
-Reported-by: Ivan Homoliak <xhomol11@gmail.com>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- src/libnfnetlink.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/libnfnetlink.c b/src/libnfnetlink.c
-index 4b2bcd0..398b7d7 100644
---- a/src/libnfnetlink.c
-+++ b/src/libnfnetlink.c
-@@ -809,6 +809,7 @@ int nfnl_addattr_l(struct nlmsghdr *n, int maxlen, int type, const void *data,
- 	nfa->nfa_type = type;
- 	nfa->nfa_len = len;
- 	memcpy(NFA_DATA(nfa), data, alen);
-+	memset((uint8_t *)nfa + nfa->nfa_len, 0, NFA_ALIGN(alen) - alen);
- 	n->nlmsg_len = (NLMSG_ALIGN(n->nlmsg_len) + NFA_ALIGN(len));
- 	return 0;
- }
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
deleted file mode 100644
index 383f0e8b3..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0005-include-Sync-with-kernel-headers.patch
+++ /dev/null
@@ -1,110 +0,0 @@
-From b10c90a61a5fc46f2be5aeecb9c96e84178f7717 Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 14:49:07 +0200
-Subject: [PATCH 5/6] include: Sync with kernel headers
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- include/libnfnetlink/linux_nfnetlink.h        | 44 ++++-----------------------
- include/libnfnetlink/linux_nfnetlink_compat.h | 12 ++++----
- 2 files changed, 12 insertions(+), 44 deletions(-)
-
-diff --git a/include/libnfnetlink/linux_nfnetlink.h b/include/libnfnetlink/linux_nfnetlink.h
-index 76a8550..44a38d6 100644
---- a/include/libnfnetlink/linux_nfnetlink.h
-+++ b/include/libnfnetlink/linux_nfnetlink.h
-@@ -25,9 +25,9 @@ enum nfnetlink_groups {
- /* General form of address family dependent message.
-  */
- struct nfgenmsg {
--	u_int8_t  nfgen_family;		/* AF_xxx */
--	u_int8_t  version;		/* nfnetlink version */
--	u_int16_t    res_id;		/* resource id */
-+	__u8  nfgen_family;		/* AF_xxx */
-+	__u8  version;		/* nfnetlink version */
-+	__be16    res_id;		/* resource id */
- };
- 
- #define NFNETLINK_V0	0
-@@ -46,40 +46,8 @@ struct nfgenmsg {
- #define NFNL_SUBSYS_CTNETLINK_EXP	2
- #define NFNL_SUBSYS_QUEUE		3
- #define NFNL_SUBSYS_ULOG		4
--#define NFNL_SUBSYS_COUNT		5
-+#define NFNL_SUBSYS_OSF			5
-+#define NFNL_SUBSYS_IPSET		6
-+#define NFNL_SUBSYS_COUNT		7
- 
--#ifdef __KERNEL__
--
--#include <linux/netlink.h>
--#include <linux/capability.h>
--#include <net/netlink.h>
--
--struct nfnl_callback
--{
--	int (*call)(struct sock *nl, struct sk_buff *skb, 
--		struct nlmsghdr *nlh, struct nlattr *cda[]);
--	const struct nla_policy *policy;	/* netlink attribute policy */
--	const u_int16_t attr_count;		/* number of nlattr's */
--};
--
--struct nfnetlink_subsystem
--{
--	const char *name;
--	__u8 subsys_id;			/* nfnetlink subsystem ID */
--	__u8 cb_count;			/* number of callbacks */
--	const struct nfnl_callback *cb;	/* callback for individual types */
--};
--
--extern int nfnetlink_subsys_register(const struct nfnetlink_subsystem *n);
--extern int nfnetlink_subsys_unregister(const struct nfnetlink_subsystem *n);
--
--extern int nfnetlink_has_listeners(unsigned int group);
--extern int nfnetlink_send(struct sk_buff *skb, u32 pid, unsigned group, 
--			  int echo);
--extern int nfnetlink_unicast(struct sk_buff *skb, u_int32_t pid, int flags);
--
--#define MODULE_ALIAS_NFNL_SUBSYS(subsys) \
--	MODULE_ALIAS("nfnetlink-subsys-" __stringify(subsys))
--
--#endif	/* __KERNEL__ */
- #endif	/* _NFNETLINK_H */
-diff --git a/include/libnfnetlink/linux_nfnetlink_compat.h b/include/libnfnetlink/linux_nfnetlink_compat.h
-index e145176..74b9e55 100644
---- a/include/libnfnetlink/linux_nfnetlink_compat.h
-+++ b/include/libnfnetlink/linux_nfnetlink_compat.h
-@@ -1,6 +1,8 @@
- #ifndef _NFNETLINK_COMPAT_H
- #define _NFNETLINK_COMPAT_H
--#ifndef __KERNEL__
-+
-+#include <linux/types.h>
-+
- /* Old nfnetlink macros for userspace */
- 
- /* nfnetlink groups: Up to 32 maximum */
-@@ -18,10 +20,9 @@
-  * ! nfnetlink use the same attributes methods. - J. Schulist.
-  */
- 
--struct nfattr
--{
--	u_int16_t nfa_len;
--	u_int16_t nfa_type;	/* we use 15 bits for the type, and the highest
-+struct nfattr {
-+	__u16 nfa_len;
-+	__u16 nfa_type;	/* we use 15 bits for the type, and the highest
- 				 * bit to indicate whether the payload is nested */
- };
- 
-@@ -57,5 +58,4 @@ struct nfattr
-         + NLMSG_ALIGN(sizeof(struct nfgenmsg))))
- #define NFM_PAYLOAD(n)  NLMSG_PAYLOAD(n, sizeof(struct nfgenmsg))
- 
--#endif /* ! __KERNEL__ */
- #endif /* _NFNETLINK_COMPAT_H */
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch
deleted file mode 100644
index 72c9987d1..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink/0006-src-Use-stdint-types-everywhere.patch
+++ /dev/null
@@ -1,403 +0,0 @@
-From 5cb589e246c91331ee6b3926b15f5e6cfc8ad95e Mon Sep 17 00:00:00 2001
-From: Felix Janda <felix.janda@posteo.de>
-Date: Sat, 16 May 2015 14:59:57 +0200
-Subject: [PATCH 6/6] src: Use stdint types everywhere
-
-Signed-off-by: Felix Janda <felix.janda@posteo.de>
-Signed-off-by: Pablo Neira Ayuso <pablo@netfilter.org>
----
- include/libnfnetlink/libnfnetlink.h | 25 ++++++-------
- src/iftable.c                       |  8 ++---
- src/iftable.h                       |  4 +--
- src/libnfnetlink.c                  | 72 ++++++++++++++++++-------------------
- src/rtnl.c                          |  4 +--
- src/rtnl.h                          |  2 +-
- 6 files changed, 58 insertions(+), 57 deletions(-)
-
-diff --git a/include/libnfnetlink/libnfnetlink.h b/include/libnfnetlink/libnfnetlink.h
-index 1d8c49d..cd0be3d 100644
---- a/include/libnfnetlink/libnfnetlink.h
-+++ b/include/libnfnetlink/libnfnetlink.h
-@@ -15,6 +15,7 @@
- #define aligned_u64 unsigned long long __attribute__((aligned(8)))
- #endif
- 
-+#include <stdint.h>
- #include <sys/socket.h>	/* for sa_family_t */
- #include <linux/netlink.h>
- #include <libnfnetlink/linux_nfnetlink.h>
-@@ -55,7 +56,7 @@ struct nfnlhdr {
- struct nfnl_callback {
- 	int (*call)(struct nlmsghdr *nlh, struct nfattr *nfa[], void *data);
- 	void *data;
--	u_int16_t attr_count;
-+	uint16_t attr_count;
- };
- 
- struct nfnl_handle;
-@@ -69,7 +70,7 @@ extern struct nfnl_handle *nfnl_open(void);
- extern int nfnl_close(struct nfnl_handle *);
- 
- extern struct nfnl_subsys_handle *nfnl_subsys_open(struct nfnl_handle *, 
--						   u_int8_t, u_int8_t, 
-+						   uint8_t, uint8_t,
- 						   unsigned int);
- extern void nfnl_subsys_close(struct nfnl_subsys_handle *);
- 
-@@ -88,8 +89,8 @@ extern int nfnl_sendiov(const struct nfnl_handle *nfnlh,
- 			const struct iovec *iov, unsigned int num,
- 			unsigned int flags);
- extern void nfnl_fill_hdr(struct nfnl_subsys_handle *, struct nlmsghdr *,
--			  unsigned int, u_int8_t, u_int16_t, u_int16_t,
--			  u_int16_t);
-+			  unsigned int, uint8_t, uint16_t, uint16_t,
-+			  uint16_t);
- extern __attribute__((deprecated)) int
- nfnl_talk(struct nfnl_handle *, struct nlmsghdr *, pid_t,
-           unsigned, struct nlmsghdr *,
-@@ -103,8 +104,8 @@ nfnl_listen(struct nfnl_handle *,
- /* receiving */
- extern ssize_t nfnl_recv(const struct nfnl_handle *h, unsigned char *buf, size_t len);
- extern int nfnl_callback_register(struct nfnl_subsys_handle *,
--				  u_int8_t type, struct nfnl_callback *cb);
--extern int nfnl_callback_unregister(struct nfnl_subsys_handle *, u_int8_t type);
-+				  uint8_t type, struct nfnl_callback *cb);
-+extern int nfnl_callback_unregister(struct nfnl_subsys_handle *, uint8_t type);
- extern int nfnl_handle_packet(struct nfnl_handle *, char *buf, int len);
- 
- /* parsing */
-@@ -180,12 +181,12 @@ extern int nfnl_query(struct nfnl_handle *h, struct nlmsghdr *nlh);
- 
- /* nfnl attribute handling functions */
- extern int nfnl_addattr_l(struct nlmsghdr *, int, int, const void *, int);
--extern int nfnl_addattr8(struct nlmsghdr *, int, int, u_int8_t);
--extern int nfnl_addattr16(struct nlmsghdr *, int, int, u_int16_t);
--extern int nfnl_addattr32(struct nlmsghdr *, int, int, u_int32_t);
-+extern int nfnl_addattr8(struct nlmsghdr *, int, int, uint8_t);
-+extern int nfnl_addattr16(struct nlmsghdr *, int, int, uint16_t);
-+extern int nfnl_addattr32(struct nlmsghdr *, int, int, uint32_t);
- extern int nfnl_nfa_addattr_l(struct nfattr *, int, int, const void *, int);
--extern int nfnl_nfa_addattr16(struct nfattr *, int, int, u_int16_t);
--extern int nfnl_nfa_addattr32(struct nfattr *, int, int, u_int32_t);
-+extern int nfnl_nfa_addattr16(struct nfattr *, int, int, uint16_t);
-+extern int nfnl_nfa_addattr32(struct nfattr *, int, int, uint32_t);
- extern int nfnl_parse_attr(struct nfattr **, int, struct nfattr *, int);
- #define nfnl_parse_nested(tb, max, nfa) \
- 	nfnl_parse_attr((tb), (max), NFA_DATA((nfa)), NFA_PAYLOAD((nfa)))
-@@ -197,7 +198,7 @@ extern int nfnl_parse_attr(struct nfattr **, int, struct nfattr *, int);
- ({	(tail)->nfa_len = (void *) NLMSG_TAIL(nlh) - (void *) tail; })
- 
- extern void nfnl_build_nfa_iovec(struct iovec *iov, struct nfattr *nfa, 
--				 u_int16_t type, u_int32_t len,
-+				 uint16_t type, uint32_t len,
- 				 unsigned char *val);
- extern unsigned int nfnl_rcvbufsiz(const struct nfnl_handle *h, 
- 				   unsigned int size);
-diff --git a/src/iftable.c b/src/iftable.c
-index 5976ed8..157f97b 100644
---- a/src/iftable.c
-+++ b/src/iftable.c
-@@ -27,10 +27,10 @@
- struct ifindex_node {
- 	struct list_head head;
- 
--	u_int32_t	index;
--	u_int32_t	type;
--	u_int32_t	alen;
--	u_int32_t	flags;
-+	uint32_t	index;
-+	uint32_t	type;
-+	uint32_t	alen;
-+	uint32_t	flags;
- 	char		addr[8];
- 	char		name[16];
- };
-diff --git a/src/iftable.h b/src/iftable.h
-index 8df7f24..655df6b 100644
---- a/src/iftable.h
-+++ b/src/iftable.h
-@@ -1,8 +1,8 @@
- #ifndef _IFTABLE_H
- #define _IFTABLE_H
- 
--int iftable_delete(u_int32_t dst, u_int32_t mask, u_int32_t gw, u_int32_t oif);
--int iftable_insert(u_int32_t dst, u_int32_t mask, u_int32_t gw, u_int32_t oif);
-+int iftable_delete(uint32_t dst, uint32_t mask, uint32_t gw, uint32_t oif);
-+int iftable_insert(uint32_t dst, uint32_t mask, uint32_t gw, uint32_t oif);
- 
- int iftable_init(void);
- void iftable_fini(void);
-diff --git a/src/libnfnetlink.c b/src/libnfnetlink.c
-index 398b7d7..df57533 100644
---- a/src/libnfnetlink.c
-+++ b/src/libnfnetlink.c
-@@ -72,9 +72,9 @@
- 
- struct nfnl_subsys_handle {
- 	struct nfnl_handle 	*nfnlh;
--	u_int32_t		subscriptions;
--	u_int8_t		subsys_id;
--	u_int8_t		cb_count;
-+	uint32_t		subscriptions;
-+	uint8_t			subsys_id;
-+	uint8_t			cb_count;
- 	struct nfnl_callback 	*cb;	/* array of callbacks */
- };
- 
-@@ -86,11 +86,11 @@ struct nfnl_handle {
- 	int			fd;
- 	struct sockaddr_nl	local;
- 	struct sockaddr_nl	peer;
--	u_int32_t		subscriptions;
--	u_int32_t		seq;
--	u_int32_t		dump;
--	u_int32_t		rcv_buffer_size;	/* for nfnl_catch */
--	u_int32_t		flags;
-+	uint32_t		subscriptions;
-+	uint32_t		seq;
-+	uint32_t		dump;
-+	uint32_t		rcv_buffer_size;	/* for nfnl_catch */
-+	uint32_t		flags;
- 	struct nlmsghdr 	*last_nlhdr;
- 	struct nfnl_subsys_handle subsys[NFNL_MAX_SUBSYS+1];
- };
-@@ -145,7 +145,7 @@ unsigned int nfnl_portid(const struct nfnl_handle *h)
- static int recalc_rebind_subscriptions(struct nfnl_handle *nfnlh)
- {
- 	int i, err;
--	u_int32_t new_subscriptions = nfnlh->subscriptions;
-+	uint32_t new_subscriptions = nfnlh->subscriptions;
- 
- 	for (i = 0; i < NFNL_MAX_SUBSYS; i++)
- 		new_subscriptions |= nfnlh->subsys[i].subscriptions;
-@@ -273,8 +273,8 @@ void nfnl_set_rcv_buffer_size(struct nfnl_handle *h, unsigned int size)
-  * a valid address that points to a nfnl_subsys_handle structure is returned.
-  */
- struct nfnl_subsys_handle *
--nfnl_subsys_open(struct nfnl_handle *nfnlh, u_int8_t subsys_id,
--		 u_int8_t cb_count, u_int32_t subscriptions)
-+nfnl_subsys_open(struct nfnl_handle *nfnlh, uint8_t subsys_id,
-+		 uint8_t cb_count, uint32_t subscriptions)
- {
- 	struct nfnl_subsys_handle *ssh;
- 
-@@ -435,10 +435,10 @@ int nfnl_sendiov(const struct nfnl_handle *nfnlh, const struct iovec *iov,
-  */
- void nfnl_fill_hdr(struct nfnl_subsys_handle *ssh,
- 		    struct nlmsghdr *nlh, unsigned int len, 
--		    u_int8_t family,
--		    u_int16_t res_id,
--		    u_int16_t msg_type,
--		    u_int16_t msg_flags)
-+		    uint8_t family,
-+		    uint16_t res_id,
-+		    uint16_t msg_type,
-+		    uint16_t msg_flags)
- {
- 	assert(ssh);
- 	assert(nlh);
-@@ -815,7 +815,7 @@ int nfnl_addattr_l(struct nlmsghdr *n, int maxlen, int type, const void *data,
- }
- 
- /**
-- * nfnl_nfa_addattr_l - Add variable length attribute to struct nfattr 
-+ * nfnl_nfa_addattr_l - Add variable length attribute to struct nfattr
-  *
-  * @nfa: struct nfattr
-  * @maxlen: maximal length of nfattr buffer
-@@ -849,14 +849,14 @@ int nfnl_nfa_addattr_l(struct nfattr *nfa, int maxlen, int type,
- }
- 
- /**
-- * nfnl_addattr8 - Add u_int8_t attribute to nlmsghdr
-+ * nfnl_addattr8 - Add uint8_t attribute to nlmsghdr
-  *
-  * @n: netlink message header to which attribute is to be added
-  * @maxlen: maximum length of netlink message header
-  * @type: type of new attribute
-  * @data: content of new attribute
-  */
--int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
-+int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, uint8_t data)
- {
- 	assert(n);
- 	assert(maxlen > 0);
-@@ -866,7 +866,7 @@ int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
- }
- 
- /**
-- * nfnl_nfa_addattr16 - Add u_int16_t attribute to struct nfattr 
-+ * nfnl_nfa_addattr16 - Add uint16_t attribute to struct nfattr
-  *
-  * @nfa: struct nfattr
-  * @maxlen: maximal length of nfattr buffer
-@@ -875,7 +875,7 @@ int nfnl_addattr8(struct nlmsghdr *n, int maxlen, int type, u_int8_t data)
-  *
-  */
- int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type, 
--		       u_int16_t data)
-+		       uint16_t data)
- {
- 	assert(nfa);
- 	assert(maxlen > 0);
-@@ -885,7 +885,7 @@ int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type,
- }
- 
- /**
-- * nfnl_addattr16 - Add u_int16_t attribute to nlmsghdr
-+ * nfnl_addattr16 - Add uint16_t attribute to nlmsghdr
-  *
-  * @n: netlink message header to which attribute is to be added
-  * @maxlen: maximum length of netlink message header
-@@ -894,7 +894,7 @@ int nfnl_nfa_addattr16(struct nfattr *nfa, int maxlen, int type,
-  *
-  */
- int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
--		   u_int16_t data)
-+		   uint16_t data)
- {
- 	assert(n);
- 	assert(maxlen > 0);
-@@ -904,7 +904,7 @@ int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
- }
- 
- /**
-- * nfnl_nfa_addattr32 - Add u_int32_t attribute to struct nfattr 
-+ * nfnl_nfa_addattr32 - Add uint32_t attribute to struct nfattr
-  *
-  * @nfa: struct nfattr
-  * @maxlen: maximal length of nfattr buffer
-@@ -913,7 +913,7 @@ int nfnl_addattr16(struct nlmsghdr *n, int maxlen, int type,
-  *
-  */
- int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type, 
--		       u_int32_t data)
-+		       uint32_t data)
- {
- 	assert(nfa);
- 	assert(maxlen > 0);
-@@ -923,7 +923,7 @@ int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type,
- }
- 
- /**
-- * nfnl_addattr32 - Add u_int32_t attribute to nlmsghdr
-+ * nfnl_addattr32 - Add uint32_t attribute to nlmsghdr
-  *
-  * @n: netlink message header to which attribute is to be added
-  * @maxlen: maximum length of netlink message header
-@@ -932,7 +932,7 @@ int nfnl_nfa_addattr32(struct nfattr *nfa, int maxlen, int type,
-  *
-  */
- int nfnl_addattr32(struct nlmsghdr *n, int maxlen, int type,
--		   u_int32_t data)
-+		   uint32_t data)
- {
- 	assert(n);
- 	assert(maxlen > 0);
-@@ -980,7 +980,7 @@ int nfnl_parse_attr(struct nfattr *tb[], int max, struct nfattr *nfa, int len)
-  *
-  */ 
- void nfnl_build_nfa_iovec(struct iovec *iov, struct nfattr *nfa, 
--			  u_int16_t type, u_int32_t len, unsigned char *val)
-+			  uint16_t type, uint32_t len, unsigned char *val)
- {
- 	assert(iov);
- 	assert(nfa);
-@@ -1115,7 +1115,7 @@ struct nlmsghdr *nfnl_get_msg_next(struct nfnl_handle *h,
-  * appropiately.
-  */
- int nfnl_callback_register(struct nfnl_subsys_handle *ssh,
--			   u_int8_t type, struct nfnl_callback *cb)
-+			   uint8_t type, struct nfnl_callback *cb)
- {
- 	assert(ssh);
- 	assert(cb);
-@@ -1138,7 +1138,7 @@ int nfnl_callback_register(struct nfnl_subsys_handle *ssh,
-  * On sucess, 0 is returned. On error, -1 is returned and errno is
-  * set appropiately.
-  */
--int nfnl_callback_unregister(struct nfnl_subsys_handle *ssh, u_int8_t type)
-+int nfnl_callback_unregister(struct nfnl_subsys_handle *ssh, uint8_t type)
- {
- 	assert(ssh);
- 
-@@ -1161,8 +1161,8 @@ int nfnl_check_attributes(const struct nfnl_handle *h,
- 	assert(nfa);
- 
- 	int min_len;
--	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
--	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
-+	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
-+	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
- 	const struct nfnl_subsys_handle *ssh;
- 	struct nfnl_callback *cb;
- 
-@@ -1212,8 +1212,8 @@ static int __nfnl_handle_msg(struct nfnl_handle *h, struct nlmsghdr *nlh,
- 			     int len)
- {
- 	struct nfnl_subsys_handle *ssh;
--	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
--	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
-+	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
-+	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
- 	int err = 0;
- 
- 	if (subsys_id > NFNL_MAX_SUBSYS)
-@@ -1243,7 +1243,7 @@ int nfnl_handle_packet(struct nfnl_handle *h, char *buf, int len)
- {
- 
- 	while (len >= NLMSG_SPACE(0)) {
--		u_int32_t rlen;
-+		uint32_t rlen;
- 		struct nlmsghdr *nlh = (struct nlmsghdr *)buf;
- 
- 		if (nlh->nlmsg_len < sizeof(struct nlmsghdr)
-@@ -1285,8 +1285,8 @@ static int nfnl_is_error(struct nfnl_handle *h, struct nlmsghdr *nlh)
- static int nfnl_step(struct nfnl_handle *h, struct nlmsghdr *nlh)
- {
- 	struct nfnl_subsys_handle *ssh;
--	u_int8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
--	u_int8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
-+	uint8_t type = NFNL_MSG_TYPE(nlh->nlmsg_type);
-+	uint8_t subsys_id = NFNL_SUBSYS_ID(nlh->nlmsg_type);
- 
- 	/* Is this an error message? */
- 	if (nfnl_is_error(h, nlh)) {
-diff --git a/src/rtnl.c b/src/rtnl.c
-index 7b4ac7d..284eecd 100644
---- a/src/rtnl.c
-+++ b/src/rtnl.c
-@@ -30,7 +30,7 @@
- #define rtnl_log(x, ...)
- 
- static inline struct rtnl_handler *
--find_handler(struct rtnl_handle *rtnl_handle, u_int16_t type)
-+find_handler(struct rtnl_handle *rtnl_handle, uint16_t type)
- {
- 	struct rtnl_handler *h;
- 	for (h = rtnl_handle->handlers; h; h = h->next) {
-@@ -41,7 +41,7 @@ find_handler(struct rtnl_handle *rtnl_handle, u_int16_t type)
- }
- 
- static int call_handler(struct rtnl_handle *rtnl_handle,
--			u_int16_t type,
-+			uint16_t type,
- 			struct nlmsghdr *hdr)
- {
- 	struct rtnl_handler *h = find_handler(rtnl_handle, type);
-diff --git a/src/rtnl.h b/src/rtnl.h
-index 0c403dc..2cb22a8 100644
---- a/src/rtnl.h
-+++ b/src/rtnl.h
-@@ -7,7 +7,7 @@
- struct rtnl_handler {
- 	struct rtnl_handler *next;
- 
--	u_int16_t	nlmsg_type;
-+	uint16_t	nlmsg_type;
- 	int		(*handlefn)(struct nlmsghdr *h, void *arg);
- 	void		*arg;
- };
--- 
-2.12.1
-
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
deleted file mode 100644
index 64271c74d..000000000
--- a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.1.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-SUMMARY = "Low-level library for netfilter related kernel/userspace communication"
-DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
-kernel/userspace communication. It provides a generic messaging \
-infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
-nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
-management tools in userspace."
-HOMEPAGE = "http://www.netfilter.org/projects/libnfnetlink/index.html"
-SECTION = "libs"
-LICENSE = "GPL-2.0-or-later"
-
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
-
-SRC_URI = "http://www.netfilter.org/projects/libnfnetlink/files/libnfnetlink-${PV}.tar.bz2;name=tar \
-           file://0001-build-resolve-automake-1.12-warnings.patch \
-           file://0002-src-get-source-code-license-header-in-sync-with-curr.patch \
-           file://0003-configure-uclinux-is-also-linux.patch \
-           file://0004-libnfnetlink-initialize-attribute-padding-to-resolve.patch \
-           file://0005-include-Sync-with-kernel-headers.patch \
-           file://0006-src-Use-stdint-types-everywhere.patch \
-           "
-SRC_URI[tar.md5sum] = "98927583d2016a9fb1936fed992e2c5e"
-SRC_URI[tar.sha256sum] = "f270e19de9127642d2a11589ef2ec97ef90a649a74f56cf9a96306b04817b51a"
-
-inherit autotools pkgconfig
diff --git a/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
new file mode 100644
index 000000000..a43c345d5
--- /dev/null
+++ b/meta-networking/recipes-filter/libnfnetlink/libnfnetlink_1.0.2.bb
@@ -0,0 +1,20 @@
+SUMMARY = "Low-level library for netfilter related kernel/userspace communication"
+DESCRIPTION = "libnfnetlink is the low-level library for netfilter related \
+kernel/userspace communication. It provides a generic messaging \
+infrastructure for in-kernel netfilter subsystems (such as nfnetlink_log, \
+nfnetlink_queue, nfnetlink_conntrack) and their respective users and/or \
+management tools in userspace."
+HOMEPAGE = "https://www.netfilter.org/projects/libnfnetlink/index.html"
+SECTION = "libs"
+LICENSE = "GPL-2.0-or-later"
+
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
+
+SRC_URI = "https://www.netfilter.org/projects/libnfnetlink/files/${BPN}-${PV}.tar.bz2 \
+          "
+
+SRC_URI[md5sum] = "39d65185e2990562c64de05a08de8771"
+SRC_URI[sha256sum] = "b064c7c3d426efb4786e60a8e6859b82ee2f2c5e49ffeea640cfe4fe33cbc376"
+
+inherit autotools pkgconfig
-- 
2.25.1


