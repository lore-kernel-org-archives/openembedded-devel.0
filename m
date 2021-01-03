Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.65])
 by mx.groups.io with SMTP id smtpd.web09.21845.1609652968893763624
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 02 Jan 2021 21:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=fTXdgmIv;
 spf=pass (domain: windriver.com, ip: 40.107.243.65, mailfrom: yi.zhao@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwcGH6s+b5jQ8iBOyySwMHU1LCQzCBofOjrTbtKZBSijiHzSm7BI54hymJM+QbYKMXQFIQBnzar488+VtczMOHHEDOGzRdXuvJv+RySuLwR26Kb7g3WYdLCNB5WVsqiX5J4witTM0rb+oxZQB2mQxhUkP4RKSfVy8sPL5bp395HCq3qi6zfKEeDZElcHWatPZBcoJTL2fgEwIYX1jsPynmO0l0GL9SFXipIks+q76JZByPMdVRCh2nFcycsHryS0QsCvSQk+DbjTEpgF79FaixClAqg6+jgSNkTdlDBO12mZFpCdgrFa2aApeprla9gbA6r9SpV/1QWK5d5xV6FkTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVpvrLOEdCXJjL8f2SdXc/CCjLXyZYvFeEj0EqLFmIM=;
 b=Le4cjCY8i2PPE2xF1V57EwsJRI9J6js4jJwgHjH/IW7MBXK+1N5e7/8F0KThYPR0sVavDAoD8ndRATovaKg32BFQCCEH8QU+CmYCKkLgx0xUPi+dk7L5F8tYGienbHWJ7VMRBol0sXWiyJEbTm1T90uVAp3AZgT7BM9aHRlAz+Lg1Hw55Kvlp21/5ysTvgZHKJJNuvMhJIJY6J32h+omXhWHOQ2xl23zVhmYfHxgDdzDUfUrF7cLiOWGLMV/V8UKoab4JyOBb8KwneSDasWBhqjx8mYxMIMrAtYmLtdIoXKVEwsOwF+q+TQTOlB+rF+XY0xccXiUwxcVF4LXGg+2qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oVpvrLOEdCXJjL8f2SdXc/CCjLXyZYvFeEj0EqLFmIM=;
 b=fTXdgmIvNWMWnyaipjDuSGCLXvcWCHye6ATdG6Ep9UszC36F3VN5wABSbj/AgPTyCRbN+TIlCl0s3OxZE72oTEQQxWnMqhZ1S8Xht4A4L7NVGe2KW9GshJOzpXeBijA2izLfjmSsRfdPyfH3cQyxlULaRgcViRPk77zy0+hNSoI=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from CO1PR11MB4867.namprd11.prod.outlook.com (2603:10b6:303:9a::13)
 by MWHPR11MB1742.namprd11.prod.outlook.com (2603:10b6:300:113::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.21; Sun, 3 Jan
 2021 05:49:27 +0000
Received: from CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5]) by CO1PR11MB4867.namprd11.prod.outlook.com
 ([fe80::21b9:29b6:fd3:bca5%7]) with mapi id 15.20.3721.024; Sun, 3 Jan 2021
 05:49:27 +0000
From: "Yi Zhao" <yi.zhao@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-filesystems][PATCH 2/2] f2fs-tools: upgrade 1.13.0 -> 1.14.0
Date: Sun,  3 Jan 2021 13:49:12 +0800
Message-ID: <20210103054913.274351-4-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210103054913.274351-1-yi.zhao@windriver.com>
References: <20210103054913.274351-1-yi.zhao@windriver.com>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2PR0401CA0001.apcprd04.prod.outlook.com
 (2603:1096:202:2::11) To CO1PR11MB4867.namprd11.prod.outlook.com
 (2603:10b6:303:9a::13)
Return-Path: yi.zhao@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-yzhao1-d1.wrs.com (60.247.85.82) by HK2PR0401CA0001.apcprd04.prod.outlook.com (2603:1096:202:2::11) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3721.20 via Frontend Transport; Sun, 3 Jan 2021 05:49:27 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72bb16c6-6c40-4d4d-4990-08d8afab555f
X-MS-TrafficTypeDiagnostic: MWHPR11MB1742:
X-Microsoft-Antispam-PRVS: 
	<MWHPR11MB1742C6867A71E47F1FEFE271F9D30@MWHPR11MB1742.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:541;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+sNHhsBiHNgGDo0Ao3FbzYOJm87oJYxmyzxcMjjmiDC+Uc36+GmsbVKI+P+elUB3RYlanhvo0XSJmNqZLX0GS3SFYZ9NDRpGd5Q/8qmca0mC2jrGkJu1IfRMh8NVfyKcAvAGcWmkaJX0LUg74RK97rdjgQrz4rehr6T4i8Ut7oZ9q9+/mJa86MENw7xCMUBSpyB90NEj6fSiF0zT4ODF1wIee0ORhb3Pgv8GEjqwvS1Klp8XQ3DpeXTDf0P4+9wJRymzVlSOb8pAYFJIezh/Rh3h+kC6WOI3wXC9hDQyJMbK/keo3QIEyyOc/pOmAxMlsmfWBm4gtQiA6PFXYkKuaubBSX8Z48rnnR2ZFEWTC6FtJXCR0a8kr4Zh3lYVh88DkmYRRHCJKFnaqQHhmMk4dTBogB1SHeG6rlklIsUfPF5dT0x6vH9zcgPWqsYqBXEPypk+B6RMOuB+tAXaaYQFlw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO1PR11MB4867.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(376002)(136003)(39830400003)(6506007)(316002)(86362001)(186003)(8676002)(6666004)(478600001)(36756003)(2616005)(956004)(6916009)(44832011)(6512007)(6486002)(16526019)(52116002)(66946007)(5660300002)(8936002)(26005)(83380400001)(2906002)(1076003)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?OpoNLfhUfG++RDPtH6P9Zo8k2ccbPiC5SVkYailu37FzMNrl8jWFwcPZy+Cl?=
 =?us-ascii?Q?EfFSJw53zm2NYOQScDOdqLgAdDTA++OdgFdR6LUp9f8/TYYrwO3VOsp6bexm?=
 =?us-ascii?Q?fgV8vdSU2QIke/6+cuVVkfLJIUkszTs+zQAkRPHt2j/sK/E3RUE8LWnbXpCU?=
 =?us-ascii?Q?u3blSgBiugHpe/jkAHjmiyQltz/frzE1icZOce06GPVvbbtBUjakyDrDfVhW?=
 =?us-ascii?Q?Glo3SLHcnd77FAWNrHpcg1LGT2mxn1k6jRBr4puIfsB+GvhmOtoso9KqN0rM?=
 =?us-ascii?Q?ckGjHSMLzCz7pm4NLnsptdhC4NZTWjVaRMEvzCArnBt+KPJYcpN+bd8dpBCM?=
 =?us-ascii?Q?mM6ek85J7IDTlDjG2yp4+acFu0mcpx43bCHlTfqV9RRKixWa2rUN1q6jKbjg?=
 =?us-ascii?Q?fDkPx/i+oaKukOgNTqYKZs/8TkEGc7o0hniVgV4CkvOzJOOKEz/6X9+L2SCH?=
 =?us-ascii?Q?bDpPS2337sNpZIqM90ZDhZnbB8/MUTwgzri0JjmSDJPgSCpjVCxKfUf9NxJV?=
 =?us-ascii?Q?zUA8HH1sdDCu7p7J9O3q9oHsNh+Fqxp7KvW3YPR3VO3YoZMlTbNz/jr5/fnw?=
 =?us-ascii?Q?51eIdAF2WeqZhJkPm4FqR17Ppw+8xCyLKg9lbojIYCduvVfD+L3LFzcbIP06?=
 =?us-ascii?Q?QIf9DMrckza7s61cJEXYPDu+bOKtCd/5sO9s4l5rewAZGjA+HLIriyKClflH?=
 =?us-ascii?Q?hqY9XBgLnNf0VK7qfbRGUWo0oXFyULpEV4A4mgUBtDW6kDFPtYvghNJH9+Zz?=
 =?us-ascii?Q?TpgSuE3cBShmoXpf2XPHbM/yXfN8Uv7DE2kBLq+zdkuwAiDYORUyfPcOv0/D?=
 =?us-ascii?Q?3IBtffg2tPwHPKSf3hKLhJkJsl1JvDGwXXzaMtE773J8OVlTgX7pVcp8Txse?=
 =?us-ascii?Q?GZnXJZSi6BpRa2qgCUEC6fLTFYKie3pL3m7Af9GmwgeTjvmJjlReG6OTlPpv?=
 =?us-ascii?Q?DknOsAgYhNePuBhmmagKkaKaw0pSj7wkQ659xd79wKhiTqNJwA53T0uf5Ipe?=
 =?us-ascii?Q?1tVn?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4867.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2021 05:49:27.8446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 72bb16c6-6c40-4d4d-4990-08d8afab555f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qg3+/WGCj7PM7zGXNCnd5TIQFf/wwW0geYBGBEf3BypLuQRpjoesmsSSuvC2c4sk+mBFN5364jHGML4ob3Ea9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1742
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

* Drop 0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch
since it has been merged upstream.

* Add UPSTREAM_CHECK_GITTAGREGEX to check the correct latest version.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...srcdir-prefix-to-denote-include-path.patch | 29 -------------------
 ...s-tools_1.13.0.bb =3D> f2fs-tools_1.14.0.bb} |  6 ++--
 2 files changed, 3 insertions(+), 32 deletions(-)
 delete mode 100644 meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/00=
01-f2fs-tools-Use-srcdir-prefix-to-denote-include-path.patch
 rename meta-filesystems/recipes-utils/f2fs-tools/{f2fs-tools_1.13.0.bb =3D=
> f2fs-tools_1.14.0.bb} (75%)

diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs=
-tools-Use-srcdir-prefix-to-denote-include-path.patch b/meta-filesystems/re=
cipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-Use-srcdir-prefix-to-deno=
te-include-path.patch
deleted file mode 100644
index 0a3261b4e..000000000
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools/0001-f2fs-tools-=
Use-srcdir-prefix-to-denote-include-path.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 0fb9d6bc25e903f7831a38468845ea143fb5afd5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 11 Aug 2018 18:49:03 -0700
-Subject: [PATCH] f2fs-tools: Use srcdir prefix to denote include path
-
-This helps builds when builddir !=3D srcdir
-
-Upstream-Status: Submitted [https://lkml.org/lkml/2018/8/12/1]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- tools/sg_write_buffer/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/tools/sg_write_buffer/Makefile.am b/tools/sg_write_buffer/Mak=
efile.am
-index 922c328..19c438d 100644
---- a/tools/sg_write_buffer/Makefile.am
-+++ b/tools/sg_write_buffer/Makefile.am
-@@ -1,7 +1,7 @@
- ## Makefile.am
-=20
- if LINUX
--AM_CPPFLAGS =3D -I./include
-+AM_CPPFLAGS =3D -I$(srcdir)/include
- AM_CFLAGS =3D -Wall
- sbin_PROGRAMS =3D sg_write_buffer
- sg_write_buffer_SOURCES =3D sg_write_buffer.c \
---=20
-2.18.0
-
diff --git a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb=
 b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
similarity index 75%
rename from meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
rename to meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
index 98bd478f3..d0b299f0b 100644
--- a/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.13.0.bb
+++ b/meta-filesystems/recipes-utils/f2fs-tools/f2fs-tools_1.14.0.bb
@@ -7,11 +7,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D362b4b2594cd36=
2b874a97718faa51d3"
 # to provide libuuid
 DEPENDS =3D "util-linux"
=20
-# v1.13.0
-SRCREV =3D "284f77f0075a16a2ad1f3b0fb89b7f64a1bc755d"
+SRCREV =3D "d41dcbdf46dc3841cd0a0507e6573e38cb6c55bb"
 SRC_URI =3D "git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-to=
ols.git \
-           file://0001-f2fs-tools-Use-srcdir-prefix-to-denote-include-path=
.patch \
            "
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d+(\.\d+)+)"
+
 S =3D "${WORKDIR}/git"
=20
 inherit pkgconfig autotools
--=20
2.25.1

