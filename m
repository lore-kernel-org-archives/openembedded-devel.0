Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A5EC4707B
	for <webhook@archiver.kernel.org>; Mon,  1 Jan 2024 07:50:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1264.1704095414982734204
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Dec 2023 23:50:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Gz/x4EGU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=17302f783c=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4017naQb013571
	for <openembedded-devel@lists.openembedded.org>; Mon, 1 Jan 2024 07:50:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:content-type:mime-version; s=
	PPS06212021; bh=wxPIh8LfyEl+06csooKqm/zuXhodLDTJ+KVxuSSvTYQ=; b=
	Gz/x4EGU8I239uf1oROEBGIrcCo/e/wh9dAkxXkjc7YG6Rte+V+mbaAwZTIJLtec
	OmtfWsSyfSoiNwMfCw4S+7PMz7WDFKLfRJdcugPhfT8qESpK8rD1QnBu5PM49gox
	cHoWSmimuv6kZ9Nq6yB773Pk4I9JZEcUC7Bt+nYlA0nm+q+Yind0Uw45qMTCgQJN
	at3XOMkzpuUH5zOf1l3lL2KYR274QeZouRVQFvtDFvnqbooJNqFg5Z6HLFaofmWH
	jQ87laqxwDadUKtmZnxxamxX1k5bIBSCthsQUyjmLo1dycEgzzA1LX6fBI3a8CH2
	ziDO5KKyRN/m5NtcGrPnpg==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3vaa661pjx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:14 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MC8haFnX4RvjwpKNWul+7coezvglLVXMj4zV8Aw5q8gEtfQO1zOrJyZas1XmL96IaqDs+8nxiCdZKQNWk+Eau+nJCOsoHNrWhfaB4HU1AP9T1z1VggZgF1VcGd7F8Yvk6GuMR/ct3f0I3xUfFwpmrWvbw5pAxPyDCwv8g41h65vb/oGCf0VIg9qxgGNkjM0lpwmfkIK6wTRWvizZQmF3K8ji39+AXnSBBVHd9obw/p/YKaNyk1DAwGpziuCHk1ZwDrnwCjKCDtks5EhOQAB7vBLurRdI1z13nzqZpOjzC7ToJPRBXAEHpIef4nz88AFVGJ2I3cmI4qppSRUfLL4U3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wxPIh8LfyEl+06csooKqm/zuXhodLDTJ+KVxuSSvTYQ=;
 b=fzSb9tbXNcg2CrzPY6yQCjt3fcw2ZBtvuALvcESSL4v4wlBEljxk2xuUEHNFznG0MJPul8IxKx2SnvvlDEwmpCcJLldeYfPXyoMoxk952J6kGVFHGzqL0m9Ac4UvVAXSP2q8VrQS/rwFpFxbXR4wrG26k7XFboET5E6ftaFOars/mC77knmtzpq74Em0iT6BKa+B/wC8OJTsECZ3JHbBDIH9TDEyar2JBKSaHr+MJWxHAoWXfjnwuFPsHykFFKffgJTU4J59/qLf1PKeJBjM9KpJXQojLvWOF15u2W5aelctgxo6bZoYqlx/Fc1FDIm6a+6J8PL079a0wFMhCNhbWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by IA0PR11MB7814.namprd11.prod.outlook.com (2603:10b6:208:408::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7135.24; Mon, 1 Jan
 2024 07:50:10 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::c56:aece:e7ef:6cb3%3]) with mapi id 15.20.7135.023; Mon, 1 Jan 2024
 07:50:10 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-networking][PATCH 2/5] libtalloc: upgrade 2.4.0 -> 2.4.1
Date: Mon,  1 Jan 2024 15:49:55 +0800
Message-Id: <20240101074958.2782143-2-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240101074958.2782143-1-yi.zhao@windriver.com>
References: <20240101074958.2782143-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0368.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::19) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|IA0PR11MB7814:EE_
X-MS-Office365-Filtering-Correlation-Id: f506a8b6-0150-4f23-e629-08dc0a9e476f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rUsbFBssCv9W9GLbO3IlUtXPjg31Mx/qtTWh0rKODdWPI7xIcNTcea5YIXiv09CgnLM/9KytijLM3iWafT8Y0NqpkBtMsSW0AaBkb765KOp7GpG0bp3F3i9ptjTowOL6SpfXDcl84+t1tKSPE6wLJMSdFmWjAvV2J3czCyKMZ4y/QPOgo0MY89PQrHhM+72HMjMdnO9/RMlsE6RqXD8Xcv7UOK9M3yQeMOMMfXWCj20bTTZPGB6Z5JXfJ4YxEpTHHaruZgni9TrcnmnHpSuqZ4qwBBhqjKKbnWAoJyFElgwjYpk/flxKLZyAE//suU0RihlBsW++qkZ4jWyGDZNYcnA/WPgsazg+O28sI6f44F1tuIDBIMHZbh/m78usfJlUE9Da9X0sGmzNeCxqKjKoNy0ZRvy2nQbrY8DycF97gRl+fxu1WJLd8j2xMYM7Gg6rdN1NC2N+LXegRD0v+VesIo/GNy2OsG4hbDfWvpLf0wRF+Ci77jyA9YHXiN1CaOJnUk7Wo1gAgCvQJ+e2h2u5aWB+GXXwgI785xMfHL0o15h12hZlDvbqdi5GgKbpTWHy5lhhOsRs07oNa/58/OVpetrz9SBQj4gK2qlgMUoyRy8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(396003)(136003)(39840400004)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(1076003)(26005)(83380400001)(2616005)(6666004)(6506007)(6512007)(53546011)(30864003)(5660300002)(44832011)(41300700001)(2906002)(478600001)(6486002)(316002)(8676002)(8936002)(66946007)(6916009)(66476007)(66556008)(86362001)(36756003)(38100700002)(38350700005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?U0tdtKofT2dtHv5jVnM26HSiI93zmwEPD/41elMiv4gEFYTKCPsfjJXs5jVD?=
 =?us-ascii?Q?JXmZ04Cs/1D5zb2Nyv22yfon/dpBqDyqbCwOoi5DpEJimIxX2a8Dic3oZNWI?=
 =?us-ascii?Q?A+AqStqwErWETCiKD2p7q1H6zt5XNj8L86L7f+CqA46JOPqXYpOgC7O8FIUN?=
 =?us-ascii?Q?EJFSLbE8ClC7LTwgRPm3cgl4KUChfQogoDPOyjUbPbG4zudzQxgw3A/z6OKq?=
 =?us-ascii?Q?SOd3y50zkZbLuW2VtxnIN/k1O4okAPA5VGUEid+sBp6WVueVgDat0Z5HJunT?=
 =?us-ascii?Q?Eyp7MoNT0/e+A80Mh3epK40RrUAP++ELmEOfRIRpNdHlgpIIcwUnWqlx0CeX?=
 =?us-ascii?Q?GB2Rf+PwinrFuNVKVUY3EUKd71h8hxvv1XzPMEa1u1+KoHsNBsgFsytHcUIt?=
 =?us-ascii?Q?APByZGJF4DMLyG4DaDHMbQCwZ3k1nrgzqSnIV8tDTiXOQYwbp78U+LjZeeyU?=
 =?us-ascii?Q?lvWEui3IcvWXR4UI2OxGdRHJW+5AlVGebp3Y2hId9HRMXySIu0zOznlcr7Hk?=
 =?us-ascii?Q?tbhov+8x8MD7sGgMz3ZoHyPaFNfWFXh4MScYsBjqunFmEI7XUE+trGeUk77Z?=
 =?us-ascii?Q?xm+TeucxxydTJ1O36KTWmULNrnZobZKv4yUmhFWQx8SEqE89NzgANfXtncKQ?=
 =?us-ascii?Q?aFR+/Xau7NbvJKbF1IvcwCeOvyzM2cJ4Yjd5SqXkJF1GAQZJVj8abt8j2rVY?=
 =?us-ascii?Q?uYIQY6MisRR6XNH3xJdWqA5Hq52/+NJE5u0tP/Lhy4GQKsKpLuosbm+JxDXN?=
 =?us-ascii?Q?epoPjtiHhuISupoTfRgp7471uL9Tqa87n348vVNQnKq78ef1ax+5YTc5+m6s?=
 =?us-ascii?Q?rFlL0FLmXu9ysIJYPEEq28NCNEIkfUwvHGeAjXMVemrNhCUDtmJ0+39zSStD?=
 =?us-ascii?Q?7j5Goh9i1yb7zlKTHTH/7FFv976QSyPKSWo5zEII+Zk5bCJjCio+f18U7bDq?=
 =?us-ascii?Q?aw/HkfYSJpQiTIorkuwCPgkTeyfo85nQEbsjYAhRbNC0g2zE1eww0MHp3E/t?=
 =?us-ascii?Q?cUNDr8lZKOtSjDO26xliBw4hA+xkSzxKR+ACFIctVa1l0w1rA70mzYY37C8h?=
 =?us-ascii?Q?WYCjYte8GJCWLe1RhuqYDlKztppbdiX/OYNizomAilyjWZ/JzQsHdnLF5uRF?=
 =?us-ascii?Q?+IgqiQlTP7g4rCvxyk7/xHs0+7+bdY4f+8YC6SFxd/EmfAjiaOo9y0YJ2PNZ?=
 =?us-ascii?Q?hIUlvyLLiGtV56C7hHAYHrQg8SMBRofc6EBvoXuIQqt8qkRmgJZ5hXIYI6xr?=
 =?us-ascii?Q?xTWULLr1xZ83pB2sNLqOouFgECTH0cW2PX2Pr7x25L35++xpROGSkeq7woME?=
 =?us-ascii?Q?ex/AOgsb/q/WX1trsTP9ydIAFso9pO2Bzv50mEmE0Fq+/zz1Ws8AX59OS6ZM?=
 =?us-ascii?Q?uCf2JBEuxknr5lrAMaZm4Tr7qM3PujVcmDqBE8qMhoXIe46xv46Z7EJHOe4F?=
 =?us-ascii?Q?rRKIwvNgGhqaHRwHadNi7+jPNnZJLC4cahRm9C4E4hIEZL/JMYn/6EbWjrOX?=
 =?us-ascii?Q?qgoq5lAo69SQbpPIu6ut+AnGzbjoC6YAhbTCHXFgzYX3BJOSoWQy4frE7kqe?=
 =?us-ascii?Q?w054MGGu7E2at/b6KavKUjr9q0Iedgjxno+iXMst?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f506a8b6-0150-4f23-e629-08dc0a9e476f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jan 2024 07:50:10.2144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TjVnN6QsEtYSADhVIemiQs1zTJFFGfsccKkzr/1xV3F3CEPlQNiAHMU05PRJhwS4xc4J/Kw8LExnBT1ckcv6Gg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7814
X-Proofpoint-GUID: ZrkP3ZD_0DrJhAVEPviSzBxh-RqBt8ST
X-Proofpoint-ORIG-GUID: ZrkP3ZD_0DrJhAVEPviSzBxh-RqBt8ST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_25,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401010063
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jan 2024 07:50:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107979

* Remove PACKAGECONFIG[libaio] as libaio is no longer required by
  libtalloc.
* Add ptest.
* Refresh patches.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...c-Add-configure-options-for-packages.patch | 52 +++++++++----------
 ...-pyext_PATTERN-for-cross-compilation.patch |  6 +--
 .../libtalloc/avoid-attr-unless-wanted.patch  | 11 ++--
 .../libtalloc/libtalloc/run-ptest             | 17 ++++++
 ...{libtalloc_2.4.0.bb => libtalloc_2.4.1.bb} | 15 ++++--
 5 files changed, 60 insertions(+), 41 deletions(-)
 create mode 100644 meta-networking/recipes-support/libtalloc/libtalloc/run-ptest
 rename meta-networking/recipes-support/libtalloc/{libtalloc_2.4.0.bb => libtalloc_2.4.1.bb} (82%)

diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
index 026a34899..45d847c85 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0001-talloc-Add-configure-options-for-packages.patch
@@ -1,4 +1,4 @@
-From 888bfe48236b4ce382dc3aa49791cadb70a1fbe4 Mon Sep 17 00:00:00 2001
+From 18e3d62f5c8f957acc45695cb99c24510d23b457 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 14:14:08 +0900
 Subject: [PATCH] talloc: Add configure options for packages
@@ -6,7 +6,6 @@ Subject: [PATCH] talloc: Add configure options for packages
 Add configure options for the following packages:
  - acl
  - attr
- - libaio
  - libbsd
  - libcap
  - valgrind
@@ -21,16 +20,20 @@ Signed-off-by: Joe Slater <joe.slater@windriver.com>
 
 Modified tp apply to version 2.2.0
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+
+Rebase to 2.4.1
+Remove libaio option
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
 ---
- lib/replace/wscript | 89 +++++++++++++++++++++++++++++++++++----------
+ lib/replace/wscript | 78 +++++++++++++++++++++++++++++++++------------
  wscript             |  7 +++-
- 2 files changed, 75 insertions(+), 21 deletions(-)
+ 2 files changed, 64 insertions(+), 21 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 827d74f..0348715 100644
+index 199e636..3593eaf 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -25,6 +25,41 @@ def options(opt):
+@@ -25,6 +25,34 @@ def options(opt):
      opt.PRIVATE_EXTENSION_DEFAULT('')
      opt.RECURSE('buildtools/wafsamba')
  
@@ -48,13 +51,6 @@ index 827d74f..0348715 100644
 +                   help=("Disable use of attr"),
 +                   action="store_false", dest='enable_attr', default=False)
 +
-+    opt.add_option('--with-libaio',
-+                   help=("Enable use of libaio"),
-+                   action="store_true", dest='enable_libaio')
-+    opt.add_option('--without-libaio',
-+                   help=("Disable use of libaio"),
-+                   action="store_false", dest='enable_libaio', default=False)
-+
 +    opt.add_option('--with-libbsd',
 +                   help=("Enable use of libbsd"),
 +                   action="store_true", dest='enable_libbsd')
@@ -72,49 +68,51 @@ index 827d74f..0348715 100644
  @Utils.run_once
  def configure(conf):
      conf.RECURSE('buildtools/wafsamba')
-@@ -35,12 +70,25 @@ def configure(conf):
+@@ -38,18 +66,27 @@ def configure(conf):
      conf.DEFINE('HAVE_LIBREPLACE', 1)
      conf.DEFINE('LIBREPLACE_NETWORK_CHECKS', 1)
  
 -    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h acl/libacl.h compat.h')
 -    conf.CHECK_HEADERS('acl/libacl.h attr/xattr.h compat.h ctype.h dustat.h')
 +    conf.CHECK_HEADERS('linux/types.h crypt.h locale.h compat.h')
-+    conf.CHECK_HEADERS('attr/xattr.h compat.h ctype.h dustat.h')
++    conf.CHECK_HEADERS('compat.h ctype.h dustat.h')
      conf.CHECK_HEADERS('fcntl.h fnmatch.h glob.h history.h krb5.h langinfo.h')
      conf.CHECK_HEADERS('locale.h ndir.h pwd.h')
 -    conf.CHECK_HEADERS('shadow.h sys/acl.h')
 -    conf.CHECK_HEADERS('sys/attributes.h attr/attributes.h sys/capability.h sys/dir.h sys/epoll.h')
 +    conf.CHECK_HEADERS('shadow.h')
 +    conf.CHECK_HEADERS('sys/attributes.h sys/dir.h sys/epoll.h')
-+
+     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
+     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
+     conf.CHECK_HEADERS('sys/resource.h sys/security.h sys/shm.h sys/statfs.h sys/statvfs.h sys/termio.h')
+     conf.CHECK_HEADERS('sys/vfs.h sys/xattr.h termio.h termios.h sys/file.h')
+     conf.CHECK_HEADERS('sys/ucontext.h sys/wait.h sys/stat.h')
+ 
 +    if Options.options.enable_acl:
 +        conf.CHECK_HEADERS('acl/libacl.h sys/acl.h')
 +
 +    if Options.options.enable_attr:
 +        conf.CHECK_HEADERS('attr/attributes.h attr/xattr.h')
 +
-+    if Options.options.enable_libaio:
-+        conf.CHECK_HEADERS('libaio.h')
-+
 +    if Options.options.enable_libcap:
 +        conf.CHECK_HEADERS('sys/capability.h')
 +
-     conf.CHECK_HEADERS('port.h')
-     conf.CHECK_HEADERS('sys/fcntl.h sys/filio.h sys/filsys.h sys/fs/s5param.h')
-     conf.CHECK_HEADERS('sys/id.h sys/ioctl.h sys/ipc.h sys/mman.h sys/mode.h sys/ndir.h sys/priv.h')
-@@ -110,8 +158,9 @@ def configure(conf):
+     if not conf.CHECK_DECLS('malloc', headers='stdlib.h'):
+         conf.CHECK_HEADERS('malloc.h')
+ 
+@@ -113,8 +150,9 @@ def configure(conf):
      conf.CHECK_HEADERS('sys/fileio.h sys/filesys.h sys/dustat.h sys/sysmacros.h')
      conf.CHECK_HEADERS('xfs/libxfs.h netgroup.h')
  
 -    conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
--    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
+-    conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
 +    if Options.options.enable_valgrind:
 +        conf.CHECK_HEADERS('valgrind.h valgrind/valgrind.h')
-+        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h')
++        conf.CHECK_HEADERS('valgrind/memcheck.h valgrind/helgrind.h valgrind/callgrind.h')
      conf.CHECK_HEADERS('nss_common.h nsswitch.h ns_api.h')
      conf.CHECK_HEADERS('sys/extattr.h sys/ea.h sys/proplist.h sys/cdefs.h')
      conf.CHECK_HEADERS('utmp.h utmpx.h lastlog.h')
-@@ -431,20 +480,20 @@ def configure(conf):
+@@ -443,20 +481,20 @@ def configure(conf):
  
      strlcpy_in_bsd = False
  
@@ -150,7 +148,7 @@ index 827d74f..0348715 100644
      conf.CHECK_CODE('''
                  struct ucred cred;
 diff --git a/wscript b/wscript
-index 3089663..fdf9510 100644
+index 075f1ec..6b4f273 100644
 --- a/wscript
 +++ b/wscript
 @@ -31,7 +31,12 @@ def options(opt):
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
index 058ac34f8..59461412a 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/0002-Fix-pyext_PATTERN-for-cross-compilation.patch
@@ -1,4 +1,4 @@
-From 6580e8191c219909d50c991662310e668973722d Mon Sep 17 00:00:00 2001
+From 843d1dc810efc61275b1121d6b35649d00570851 Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 24 Nov 2021 13:33:35 +0800
 Subject: [PATCH] Fix pyext_PATTERN for cross compilation
@@ -40,10 +40,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/third_party/waf/waflib/Tools/python.py b/third_party/waf/waflib/Tools/python.py
-index a23bd01..af202e0 100644
+index b2dd1a9..2bd3545 100644
 --- a/third_party/waf/waflib/Tools/python.py
 +++ b/third_party/waf/waflib/Tools/python.py
-@@ -328,7 +328,7 @@ def check_python_headers(conf, features='pyembed pyext'):
+@@ -339,7 +339,7 @@ def check_python_headers(conf, features='pyembed pyext'):
  	x = 'MACOSX_DEPLOYMENT_TARGET'
  	if dct[x]:
  		env[x] = conf.environ[x] = str(dct[x])
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
index fe8d10d6f..93c8a1e84 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/avoid-attr-unless-wanted.patch
@@ -1,19 +1,18 @@
-From e18370c204056de799064d8ac72a656eb3745f95 Mon Sep 17 00:00:00 2001
+From 9130d340c37861a59e812e334e2b13577e705a6c Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@cn.fujitsu.com>
 Date: Fri, 25 Dec 2020 15:10:58 +0900
 Subject: [PATCH] avoid attr unless wanted
 
+Upstream-Status: Inappropriate [embedded specific]
 ---
-Upstream-Status: Pending
-
  lib/replace/wscript | 4 +---
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/lib/replace/wscript b/lib/replace/wscript
-index 0348715..a8554d9 100644
+index 3593eaf..504a1cb 100644
 --- a/lib/replace/wscript
 +++ b/lib/replace/wscript
-@@ -967,8 +967,6 @@ def build(bld):
+@@ -968,8 +968,6 @@ def build(bld):
      if not bld.CONFIG_SET('HAVE_INET_ATON'):     REPLACE_SOURCE += ' inet_aton.c'
      if not bld.CONFIG_SET('HAVE_INET_NTOP'):     REPLACE_SOURCE += ' inet_ntop.c'
      if not bld.CONFIG_SET('HAVE_INET_PTON'):     REPLACE_SOURCE += ' inet_pton.c'
@@ -22,7 +21,7 @@ index 0348715..a8554d9 100644
  
      if not bld.CONFIG_SET('HAVE_CLOSEFROM'):
          REPLACE_SOURCE += ' closefrom.c'
-@@ -983,7 +981,7 @@ def build(bld):
+@@ -984,7 +982,7 @@ def build(bld):
                        # hide_symbols=bld.BUILTIN_LIBRARY('replace'),
                        private_library=True,
                        provide_builtin_linking=True,
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc/run-ptest b/meta-networking/recipes-support/libtalloc/libtalloc/run-ptest
new file mode 100644
index 000000000..84e538150
--- /dev/null
+++ b/meta-networking/recipes-support/libtalloc/libtalloc/run-ptest
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+ptestdir=$(dirname "$(readlink -f "$0")")
+cd "$ptestdir"/tests || exit
+
+tests="replace_testsuite talloc_testsuite"
+
+for f in $tests
+do
+    if test -x ./"$f"; then
+        if ./"$f" > ./"$f".out 2> ./"$f".err; then
+            echo "PASS: $f"
+        else
+            echo "FAIL: $f"
+        fi
+    fi
+done
diff --git a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
similarity index 82%
rename from meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb
rename to meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
index f8fef9f82..bf7fbc864 100644
--- a/meta-networking/recipes-support/libtalloc/libtalloc_2.4.0.bb
+++ b/meta-networking/recipes-support/libtalloc/libtalloc_2.4.1.bb
@@ -11,10 +11,11 @@ export PYTHONHASHSEED="1"
 SRC_URI = "https://www.samba.org/ftp/talloc/talloc-${PV}.tar.gz \
            file://0001-talloc-Add-configure-options-for-packages.patch \
            file://0002-Fix-pyext_PATTERN-for-cross-compilation.patch \
+           file://run-ptest \
 "
-SRC_URI[sha256sum] = "6df36862c42466ef88f360444513870ef46934f9016c84383cc4008a7d0c46ba"
+SRC_URI[sha256sum] = "410a547f08557007be0e88194f218868358edc0ab98c98ba8c167930db3d33f9"
 
-inherit waf-samba
+inherit waf-samba pkgconfig ptest
 
 PACKAGECONFIG ??= "\
     ${@bb.utils.filter('DISTRO_FEATURES', 'acl', d)} \
@@ -22,7 +23,6 @@ PACKAGECONFIG ??= "\
 "
 PACKAGECONFIG[acl] = "--with-acl,--without-acl,acl"
 PACKAGECONFIG[attr] = "--with-attr,--without-attr,attr"
-PACKAGECONFIG[libaio] = "--with-libaio,--without-libaio,libaio"
 PACKAGECONFIG[libbsd] = "--with-libbsd,--without-libbsd,libbsd"
 PACKAGECONFIG[libcap] = "--with-libcap,--without-libcap,libcap"
 PACKAGECONFIG[valgrind] = "--with-valgrind,--without-valgrind,valgrind"
@@ -31,8 +31,8 @@ SRC_URI += "${@bb.utils.contains('PACKAGECONFIG', 'attr', '', 'file://avoid-attr
 
 S = "${WORKDIR}/talloc-${PV}"
 
-#cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
-#to cross Popen
+# Cross_compile cannot use preforked process, since fork process earlier than point subproces.popen
+# to cross Popen
 export WAF_NO_PREFORK="yes"
 
 EXTRA_OECONF += "--disable-rpath \
@@ -43,6 +43,11 @@ EXTRA_OECONF += "--disable-rpath \
                  --with-libiconv=${STAGING_DIR_HOST}${prefix}\
                 "
 
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests
+    install -m 0755 ${B}/bin/*_testsuite ${D}${PTEST_PATH}/tests/
+}
+
 PACKAGES += "pytalloc pytalloc-dev"
 
 RPROVIDES:${PN}-dbg += "pytalloc-dbg"
-- 
2.25.1


