Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.87])
 by mx.groups.io with SMTP id smtpd.web11.7112.1609935289351746038
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jan 2021 04:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=YJ6RZJBM;
 spf=pass (domain: windriver.com, ip: 40.107.236.87, mailfrom: liezhi.yang@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g5rdHsehMFmWTkqsn6dqpQZOwoZn8lHs+2FhfHG/1T+1gA47EjTvgllRM4uMbPdDwpSvVYeR5Fra6Cx54AKp53f7SSLQ/SoKzbAIvzMIEt3xKcHwwZeAksBasTB4bUgp23/5MjFtbh+TzDi4sozMv22VCEMAr5+hNGgDb0i4YFTfTHNAJtDJDGtSgeRwqr7IG4ZA4n529kqJ8aPaW9Prw9sHsuFgX+W1vHp40hnWAy3sVMr6Je/QygCil9F6oq21Dbc4XfT6zw/2cd+kaAY7xOrBibFm7ri4j0OSDX8pQeLw3x0dn0xvFldx4mLrAzGQ/dJaMhIReRqA5PxZMVzoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBbzhUcemm0FCNX3aR7U9ds1iC4U8q4QfiNCv3jzYM4=;
 b=PA88a3SGrfknIuwxdcP30fFqoaJMlU84PadBwj6b43Pglcz1ncQFX4dUMa1RPH0MT1KkFHMMSEzFN4zz2PVtLJmgbnxSr6G7nXBeGs/x2DSS3qUqkc1h3mzJeRoPTVHa+msNAjG/IWqvE0M5LHb11G8igHbOxbnMkbAc9hr33vPm7Z0GKE+3TTXIx9HqZtmiNaplomkYnygbAfYfiTKPM97XXZaPvzBncphdONNCJ7Rl+sP5HMf4BB3MKrcqK4CbQgskVj+jK22/c1ywF3AgiFN1smb06hKiXeYZ1Uuv4pvMj6vBwKMULzm3/SRgM3/e8jW1lqvvRUk7twK/xu4wbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DBbzhUcemm0FCNX3aR7U9ds1iC4U8q4QfiNCv3jzYM4=;
 b=YJ6RZJBMY3zv+9Wl8rkBd0QleHFj+QZyCK+zCiueiUpgKyse/cZIqKcVPGq0+FB0ybl4jx2K5dnYtTmOkQGsfo6sl/7HIST07IN7cb7zcSCjAjEnqTd5nyV2x4ciuyNrVUhPleFttSfQS5i5hEpFFRdsDZx6ibm8eM2OAXnIcjE=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from SN6PR11MB2909.namprd11.prod.outlook.com (52.135.126.77) by
 SN6PR11MB2990.namprd11.prod.outlook.com (52.135.124.213) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6; Wed, 6 Jan 2021 12:14:47 +0000
Received: from SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1]) by SN6PR11MB2909.namprd11.prod.outlook.com
 ([fe80::acc9:68df:558c:94e1%6]) with mapi id 15.20.3742.006; Wed, 6 Jan 2021
 12:14:47 +0000
From: "Robert Yang" <liezhi.yang@windriver.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Subject: [meta-oe][PATCH] nspr: Fix build with nativesdk-gcc from buildtools-extended-tarball
Date: Wed,  6 Jan 2021 04:14:40 -0800
Message-Id: <20210106121440.84402-1-liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [147.11.105.124]
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To SN6PR11MB2909.namprd11.prod.outlook.com
 (2603:10b6:805:d5::13)
Return-Path: liezhi.yang@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ala-lpggp3.wrs.com (147.11.105.124) by BY5PR20CA0031.namprd20.prod.outlook.com (2603:10b6:a03:1f4::44) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6 via Frontend Transport; Wed, 6 Jan 2021 12:14:46 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4edada21-763f-466d-1e3c-08d8b23ca8cc
X-MS-TrafficTypeDiagnostic: SN6PR11MB2990:
X-Microsoft-Antispam-PRVS: 
	<SN6PR11MB29900E7B1FCDBC865C9E2202FFD00@SN6PR11MB2990.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	uOcLzXH92fzihSbOu+R/IdcGOg2JgXLpegwik6vgt7HrVOOw6m91/iq4kGmi/zGIcFaJUw/i4lvfRR6Akn5189gKJ4F9UNvsjiDYX/IWC0n8CrfJT6rqOif8yzI2cIcWaJkCCqhOZy1c6PiAfuPiuL525lZJjitYFLNyRVSY8WKVtlNTjf2Mc9w8KPWkY4E+EgjAcjhLU54tsvrvxJ8yFZhHuhNhnrlOHujdA8cjsHCrmeMcuSeo8sThDaXPoOuisqTpkpRFmnoYp0HACUjH2r2ZlpqSs8Z4M5r/B4LZeaqU02ox7rJ5qUgwUQbzGuIuCfxFWh43aCCH5czp1/DVgF4T1hsqee0XY+pyanx63JHGdQUr7aOlcPrFsp/WkZB2Mle3kQeDj9q0k4CqEFyrLNRzdLdx5ed41nH4LSDyfiXzSjqGvAwP0cdw0TlGwFI89pLU7aDziH0mA6PDTuEzWA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB2909.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(366004)(136003)(346002)(83380400001)(6486002)(5660300002)(1076003)(36756003)(6512007)(966005)(52116002)(6506007)(316002)(186003)(2616005)(8676002)(16526019)(86362001)(956004)(26005)(6666004)(66476007)(66556008)(8936002)(66946007)(2906002)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?3MUbJZTuQG+FLuWKhaT01oz/Q/YgKTfkOGxYx0+zFGX3fZqWyjzzKn4FXwNQ?=
 =?us-ascii?Q?e5EdUGDK49n5cQuVYimPB6JO8hvhwB24ETUUoxzhlogHvm00re8GmwraLfLj?=
 =?us-ascii?Q?s1dVYF2CED6oKssF7q1Q4r+ADDpSkU4KkpnKsmr0y69/QJWT8D0rTAifJaP8?=
 =?us-ascii?Q?ZRfTcuMZJZ8tRuiTKW9V+xZIV5nxV8OTSAwRAEjnFAYeHlhF6dOZRDp5t7e6?=
 =?us-ascii?Q?h1Jkn+mOjPNIKegdU4KxfhgBjry+3TaJ2Fw9hr5E2HaGv1u8M7+rxvBo7DHF?=
 =?us-ascii?Q?utXjYeZVYZ3t4vVwGZDpYvk/TyaKrTBIiecR26ZnBHMbPdGSeBX0p5RsrLO1?=
 =?us-ascii?Q?kTOXO5eWQdWumPhoLG8O0Em9PqLwDTWURG732T+JAxwaIoVs/ZcsDBPi9BLw?=
 =?us-ascii?Q?fLKzkNEUsHAGBn06dslmUIx1h1x3bE0EybfH5fSh8Q+fTphLbSXpsMl/BQt1?=
 =?us-ascii?Q?Mey441oQv/yelHWRru2Ffr6izJy3cqVfasJ5FtGteRxvfdAwh47jAubB0lpY?=
 =?us-ascii?Q?sgEBhbWV29muUdPKYqgOZwiilZgbixhriYDCr1+XrR1rTL/lNu1XJtZ+gu2R?=
 =?us-ascii?Q?XobtGM8vrfgNj/fmGDm9BnZIra1oF+PNX3GfntB2Xxh2xREiaBGdE4ZJN/77?=
 =?us-ascii?Q?XF7gYwEglqNP8wu0yd4iqkRslc3CMttznvFNOobQqX4CuFRcenfoBIbDCnRo?=
 =?us-ascii?Q?uwSxfFXVWFDqgj71q/ByG3DsyA9mcx3tJcWX3ef8SqkM9FeyrkU8/tGR3PSc?=
 =?us-ascii?Q?m+OSkV9fEHePscwlrlg3hvhR5ROV5bupC9nigrA2yZm23bqytf7WBewxK190?=
 =?us-ascii?Q?c8RNZp69XwoK1Kdw3BVgEa7n0Pn8jZfx0weLY3oHo9oPiUT8rdq8067MiZtu?=
 =?us-ascii?Q?KiNFvTvrW125lTU91rJyQJkWqUjTYLqLytrZ788qyXGX/3z64+QhQUgAlD4N?=
 =?us-ascii?Q?FdRSP9CiS+RjIr+YKc4IpLFLvpjLnl2Qyshp4Fv+YtvWwmw6dCKoZ3NLS2YF?=
 =?us-ascii?Q?kgwX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB2909.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2021 12:14:47.1647
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edada21-763f-466d-1e3c-08d8b23ca8cc
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLQ7pKTQ3q82M0AiL5JbNPeGE5e7zR26aU5N+Qc9k8cSg63hqi7fKzXPiqaPNVXd6L0qb2xSfMNbWLmrLITX8NQ15j6cKP7B0ygjaahoW1w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2990
Content-Type: text/plain

Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
$ bitbake nspr-native

gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
/path/to/x86_64-wrlinuxsdk-linux/bin/ld:
/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'

Referred to:
https://github.com/linux-test-project/ltp/issues/255

There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
very had to figure it out. The quick workaround is using "-lpthread -lrt"

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ts-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch | 47 +++++++++++++++++++
 meta-oe/recipes-support/nspr/nspr_4.29.bb     |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch

diff --git a/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
new file mode 100644
index 000000000..c71871c34
--- /dev/null
+++ b/meta-oe/recipes-support/nspr/nspr/0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch
@@ -0,0 +1,47 @@
+From 4441e9c15684623adb3d5cbd6c2f27c1f3d212ac Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 29 Dec 2020 03:57:07 +0000
+Subject: [PATCH] nspr/pr/tests/Makefile.in: Add -lrt to EXTRA_LIBS
+
+Fixed when built with nativesdk-gcc from buildtools-extended-tarball:
+$ bitbake nspr-native
+
+gcc   abstract.o -Xlinker -L../../dist/lib -lplc4 -L../../dist/lib -lnspr4 -lpthread -o abstract
+/path/to/x86_64-wrlinuxsdk-linux/bin/ld: 
+/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getcpuclockid@GLIBC_PRIVATE'
+/path/to/x86_64-wrlinuxsdk-linux/bin/ld: 
+/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_nanosleep@GLIBC_PRIVATE'
+/path/to/x86_64-wrlinuxsdk-linux/bin/ld: 
+/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_settime@GLIBC_PRIVATE'
+/path/to/x86_64-wrlinuxsdk-linux/bin/ld: 
+/lib/x86_64-linux-gnu/librt.so.1: undefined reference to `__clock_getres@GLIBC_PRIVATE'
+
+Referred to:
+https://github.com/linux-test-project/ltp/issues/255
+
+There should be a bug hidden in nativesdk-gcc or other toolchains, but it's
+very had to figure it out. The quick workaround is using "-lpthread -lrt"
+
+Upstream-Status: Inappropriate [OE specific]
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ nspr/pr/tests/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/pr/tests/Makefile.in b/pr/tests/Makefile.in
+index 2ccb992..45270e9 100644
+--- a/pr/tests/Makefile.in
++++ b/pr/tests/Makefile.in
+@@ -274,7 +274,7 @@ endif # SunOS
+ ifeq (,$(filter-out Linux GNU GNU_%,$(OS_ARCH)))
+     LDOPTS += -Xlinker
+     ifeq ($(USE_PTHREADS),1)
+-        EXTRA_LIBS = -lpthread
++        EXTRA_LIBS = -lpthread -lrt
+     endif
+ endif
+ 
+-- 
+2.29.2
+
diff --git a/meta-oe/recipes-support/nspr/nspr_4.29.bb b/meta-oe/recipes-support/nspr/nspr_4.29.bb
index 6307c159e..fa05bc022 100644
--- a/meta-oe/recipes-support/nspr/nspr_4.29.bb
+++ b/meta-oe/recipes-support/nspr/nspr_4.29.bb
@@ -13,6 +13,7 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://0001-md-Fix-build-with-musl.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://nspr.pc.in \
+           file://0001-nspr-pr-tests-Makefile.in-Add-lrt-to-EXTRA_LIBS.patch \
 "
 
 CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE \
-- 
2.17.1

