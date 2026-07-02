Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08EB8C43327
	for <webhook@archiver.kernel.org>; Thu,  2 Jul 2026 17:40:40 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.64])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73979.1783010101254601020
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2026 09:35:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=Kr0/U4DX;
 spf=pass (domain: est.tech, ip: 52.101.69.64, mailfrom: yunseong.kim@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBiU7Cl4Gq9TzZXEDX/G3/hHGuOiWv7pmsv8ZxsniMZ9x/uq2hii+fC/o+kOGiSHhiUGLaNFbV0pu09P8Fe8e+nGM1TIs5hWeYYOSdG1tqZNIqyC3gpdtBpHBbtgpG2nIdupp+wI51QmmaUycDNVWB7wDKwvlV0fFWBqylCtDnszBDFcdrVzUHwb8TcQebjZVSyEWgJYzbv2DegdJQi2yErA8pkQGc2PxR2/p1UW3JKWjSlkUqhF39UlItrfUw2Y9vEik8ZDp0hx74HEmQ0b9ki8ccjorR7oaE1gdXxpCuM8MuM3ypggnfxMznQTO4aBAnQYTK262pFaDvQ3UYIEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u7KSk80J2iDgUAm21HdHP8ux4NgPM3oi6CoEPGJrQFc=;
 b=SJd1XknwpegMEJ0P8/e9ajFrUXYhagy4Nt0gkVHrwFLYCHTlEUyji+p4RlKD8bQ1dwXT5wTfU4oPr24+oj2LZLUCAU/HXXRn45y/z0OT2q/HJY67UrFr5r/EmOp91LhoRCnczjl1PFocoM50oi9sQ2s8B08YOuhhyr6VY2TaRB2vluzfQ0GzVpvV0srbZVsY3nUi8udK/QIuY7Qv9vKdsnf6vAPfWROx9jeVtwUdLoqe0qSPKU0DrtcAp7CzB+//mqUJwTkF0zde/Taz99QlG8x9daw7McbXleqQBdmNtA+cfIVVrCW0lgApSBS9G1wxij8TZ5BndZQvpt8FXkWpfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u7KSk80J2iDgUAm21HdHP8ux4NgPM3oi6CoEPGJrQFc=;
 b=Kr0/U4DXtj4Hs3eys5h4kbB3ElPOESY1ea1huZVD6z5AKCvYmZ91E9XRagNtOABEJ/j9lhaxZvDzuMMJpbXry3CqUEXL39/j64uTlkBY4afZTkQkSkRiY/jh3ItCOG4DwgjyPfTYVT15GgQv8hdUXP0DK8nIrmPNb87tpeywau5aeGNMcLvEla3N7OEpDFQWxYsJCG0jK1V+8ESlrHkDpOoUQP07x81Jj9LOYHjhM65UDjYdQbilhAthqK/BHcLP6ryaum3xc4q4lWKZjPJFUDBwmIrOc/lmKmOs2XpzmE0DomxvAiPdCIk6q3EEyzkywykrFzFgTpRI4neppO4X+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:39b::19)
 by VI6PPF0D0688D15.EURP189.PROD.OUTLOOK.COM (2603:10a6:808:1::187) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 16:19:58 +0000
Received: from AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4]) by AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 ([fe80::69fc:c4d4:200b:e4b4%4]) with mapi id 15.21.0181.009; Thu, 2 Jul 2026
 16:19:57 +0000
From: Yunseong Kim <yunseong.kim@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: yi.zhao@windriver.com,
	wangmy@fujitsu.com,
	Martin.Jansa@gmail.com,
	Yunseong Kim <yunseong.kim@est.tech>
Subject: [meta-oe][scarthgap][PATCH] libyang: upgrade 2.1.148 -> 3.13.6
Date: Thu,  2 Jul 2026 18:15:24 +0200
Message-ID: <20260702161521.84024-4-yunseong.kim@est.tech>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: DUZP191CA0071.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:4fa::11) To AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:39b::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1752:EE_|VI6PPF0D0688D15:EE_
X-MS-Office365-Filtering-Correlation-Id: a530e874-d495-4bc9-89c1-08ded855c24d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|11063799006|3023799007|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	EKjYZ0B8jxKhYyLKpb5Os5pScgg443j86M6BqSF2HEJaoYZFO6u9GIC+t2CryEX9MEvRR2YZdft9Sz1TcUYH++JIeIJZ7co7pkZ5+2kyoaYCin9T5WdAbxDVUrLs+DHYlU/CgJ5jbt1ypHVX68P8H0VZz9YT06IbXsABaqlKjcVZAAI8xdZ/cq8y7hiObSpAj3rjS0xWnvrEd1YOUJdPbsiHS3BAyzbPQwpLFxleJsPod7ustbenwjK2aCl7Fg9Z6uhU9JCxBzt6ctN03gXYbSfM5YVaN0p1k3RSZXpFTXcfFyDrB0OA1l93aFVgZre43viImyHwGaRA122Ef0Wsfbx+fRaD7/uoYz3/+Wuw3ECI3BZITdqlluywPd6hFem4/2UZzil2v/1D0RHhKyI5bpnipSdF4Wc7bzyiMwLYvZGiLCccb2ZxrVQboyvMbogMJtIEO21jXjl1TnZVWNP+iSDNHJ1mjMUxCfVXHabwTQYYFw9Uq2NvFC5tvoIJKzuZ2tGxiaQy7k9WNM+R+F/wKtiAURPfin4B6eP9Yo4CVHGYb/nqpSFD/bLah9xvdcOc9RvFqXVk697iW/zEdp0MVyrqFFsJDVnCk6UBSNsCPT6Tr84d4CjP5ztK9g8+16RI1jGuS5Gx/VBtGS9KE7zgJ3AMRzXNBD6lXOw3LJ85I6U=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1752.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(11063799006)(3023799007)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?joZZeiV2/8eaDh8LwRRDmJVu80FwU17wd30Olvh1Dd5pWZwoXGi4hYlXeN32?=
 =?us-ascii?Q?BsA/xbTPUntGDIUslb8mlhbzlSIyf1e24BWcQdiZSJud3ljo00jv3lAxLcMp?=
 =?us-ascii?Q?wj/txhbYDf3LmWHLNzTfZMFcsjHlcNR1ea5Imd3AQlUoF8KtJ9u0LfOxF4uB?=
 =?us-ascii?Q?hDxz7di6p7rAQ/n4WHt6cxCDN6vmstIus2dtPaK2V8QwofXFaDbNgHNQGSjI?=
 =?us-ascii?Q?vkMiZ8YewrMQC2PNLGi4pVQm20GWuUD8bjgERG9ltgC1Q32cvq/719qGSPg6?=
 =?us-ascii?Q?4sBFyKzjj55+mo1HNwsDFI9TA3cfKcFW6EkSTi70QXKak64vrJFY/N7diyBc?=
 =?us-ascii?Q?HugxpG3YJk0TKjLGYpcNS3kWNP17m8ZZE8i7BjD1Jd6znht5uJOrm9ChdTlt?=
 =?us-ascii?Q?sZFi8v6UNA2uqaEA3hk2Y+zMGYCGQ3I/GxWU+FV82FW49FohM2p1ce08ySnR?=
 =?us-ascii?Q?vV+IdFNAoFhZrrdquXSMlsdQ9loKHYhLbph57zPTchLLFqdKplk4dxOxKHWV?=
 =?us-ascii?Q?EnbMakOuJZNnfoH9HV1+UybgYFe4RwcDstRd/X2Gg7RGBgCu2my0XuB0vm+1?=
 =?us-ascii?Q?5lyF5vg67emAhQNHCrWVyJ5B5rJBsFaVj39JUmpZ9sbe6pCgAUxndMg8Mkdb?=
 =?us-ascii?Q?JGwGrs35FMlULPCH5cU4uVwQLkjjNevYcQ4ceC9DHmju33Li0KyQgIRdcXUs?=
 =?us-ascii?Q?YYNhCdFmLDjLyPnKW2uaYkTmHC9ZiyD6YtC3oVmENp/1N1ZvhDackM7lXPTP?=
 =?us-ascii?Q?bUpR7QfYfdqN/R6R8FiVjRvzdLBgy0r+xxDYqggBTr5Av0WvC1rAlDRvxFjs?=
 =?us-ascii?Q?ygQgFWsNw10bgD5tlZSFzT69nFOnIFNxJMWL5S5TYYJm8ZDeshPkR2k//PIF?=
 =?us-ascii?Q?n8tarAqv01ywW0RlCKggSFNK+Q9jiE4qOmT0p2rh+HuGtr78pOj0M1kIjBPG?=
 =?us-ascii?Q?OmJbH43pOGsf84STIXfLGqrqtqRsBSm/uZVwuhmk4tfqBcKtnxwPuZzofT6Q?=
 =?us-ascii?Q?RDTqefcfazGW8DSuuB/RKGtlEsCoPDfaqOEUilh8MIXKhgL3dDC0iFJPIG1W?=
 =?us-ascii?Q?Sk05tPICYZM1C7sG7t4tf8NDB36v1W9JsjVSWMPHFZpMgkBKRi6yonU5P+Oo?=
 =?us-ascii?Q?yFNvK0R1T5sO5ggX64G1bOQWh+ixj4LFidEpJ/v5h+/g9P9h5HCdJgLdd/8+?=
 =?us-ascii?Q?2F9yNHvaM6HPGyjz+rZopknkFmuh6j+mwgmuz7V6GWapUkQfRRTa/zeZOURK?=
 =?us-ascii?Q?X7JOA0pPaPmkmhBAKBzWeeOBm683wpwdxiyD7njr9t70VZB8KaRUomwoQfgX?=
 =?us-ascii?Q?oc8OofycqWIxZCCh8Qa+rFI0jl7yqznstY5FZMvWrpoNmCoANCgmjJpLAlje?=
 =?us-ascii?Q?+iwMwsDfmt/Nw2fyTGQiVbZCVq653TUtBAsYS8WCv92Ht9h7ti5l+CvN/Nwg?=
 =?us-ascii?Q?CTtzoEXA1mx5DWtkBq0N5rGCNJcyryUaZw+UrFjSPp7hYFhlDHKI/p/T8hCU?=
 =?us-ascii?Q?itCujJQN5l9U3pvzOGyae5zfHhmGdvgD3HlRsQomqRoOl0OWf9q7GTGRG1o/?=
 =?us-ascii?Q?hHcky/QwQgnv56CPooaQJRSRALrgTLBT0VJNHO9t+Z5dLds4Bp0C1fct9GrJ?=
 =?us-ascii?Q?EINgu7pGn/EkYiSoDqaVjjm6oM814FOfmrpESUrkp5Ire1ADM5AJBTgt12EB?=
 =?us-ascii?Q?EN6QIQgRq72/IIynNNFdicFzbRuHGdXGDiE4NbYmH9DF/7addpJxrNdm/+SS?=
 =?us-ascii?Q?9frcCiRhcQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: a530e874-d495-4bc9-89c1-08ded855c24d
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1752.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 16:19:57.8704
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xVqpHLQ6JEh5G+1MesSVA3e0sgNkBJQyYsFi+JmZQoPhwfmeDQQkFa7lgLIs9Aqeykew8T/2Y/96C/E/vaK7bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI6PPF0D0688D15
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2026 17:40:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128002

Upgrade libyang to align with the version present in the wrynose.

ChangeLog:
https://github.com/CESNET/libyang/releases/tag/v3.13.6

* Add xxhash dependency.
* Update multilib header from config.h to ly_config.h.
* Refresh patch for new version.

Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
---
 ...-test_context-skip-test-case-test_searchdirs.patch |  9 +++------
 .../libyang/{libyang_2.1.148.bb =3D> libyang_3.13.6.bb} | 11 +++++++----
 2 files changed, 10 insertions(+), 10 deletions(-)
 rename meta-oe/recipes-extended/libyang/{libyang_2.1.148.bb =3D> libyang_3=
.13.6.bb} (86%)

diff --git a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-ski=
p-test-case-test_searchdirs.patch b/meta-oe/recipes-extended/libyang/libyan=
g/0001-test_context-skip-test-case-test_searchdirs.patch
index 3c6aee9247..70890e2485 100644
--- a/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-=
case-test_searchdirs.patch
+++ b/meta-oe/recipes-extended/libyang/libyang/0001-test_context-skip-test-=
case-test_searchdirs.patch
@@ -1,4 +1,4 @@
-From 5de24e1b39c09adb0c5bf4bb4228bd1bb935542a Mon Sep 17 00:00:00 2001
+From 24ec37bfe5c4c248dda0e80d6e7ab27afca1d60e Mon Sep 17 00:00:00 2001
 From: Yi Zhao <yi.zhao@windriver.com>
 Date: Wed, 22 Mar 2023 16:03:56 +0800
 Subject: [PATCH] test_context: skip test case test_searchdirs
@@ -13,10 +13,10 @@ Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
  1 file changed, 1 deletion(-)
=20
 diff --git a/tests/utests/basic/test_context.c b/tests/utests/basic/test_c=
ontext.c
-index cfba1d30f..8c3bb7ad6 100644
+index 116b2ce36..4e96f4e96 100644
 --- a/tests/utests/basic/test_context.c
 +++ b/tests/utests/basic/test_context.c
-@@ -1061,7 +1061,6 @@ int
+@@ -1110,7 +1110,6 @@ int
  main(void)
  {
      const struct CMUnitTest tests[] =3D {
@@ -24,6 +24,3 @@ index cfba1d30f..8c3bb7ad6 100644
          UTEST(test_options),
          UTEST(test_models),
          UTEST(test_imports),
---=20
-2.25.1
-
diff --git a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb b/meta-oe/=
recipes-extended/libyang/libyang_3.13.6.bb
similarity index 86%
rename from meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
index 0eff3247c6..8ea23990dd 100644
--- a/meta-oe/recipes-extended/libyang/libyang_2.1.148.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -4,9 +4,9 @@ HOMEPAGE =3D "https://github.com/CESNET/libyang"
 SECTION =3D "libs"
 LICENSE =3D "BSD-3-Clause"
=20
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df3916d7d8d42a6508d0ea418cfff10a=
d"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Db69fd3b2815bbf1cef5c97f0eee2519=
a"
=20
-SRCREV =3D "fc4dbd923e044006c93df020590a1e5a8656c09e"
+SRCREV =3D "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
=20
 SRC_URI =3D "git://github.com/CESNET/libyang.git;branch=3Dmaster;protocol=
=3Dhttps \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
@@ -17,7 +17,10 @@ S =3D "${WORKDIR}/git"
=20
 # Main dependencies
 inherit cmake pkgconfig lib_package ptest multilib_header
-DEPENDS =3D "libpcre2"
+DEPENDS =3D " \
+    libpcre2 \
+    xxhash \
+"
 DEPENDS +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', 'cmocka', '', d)}=
"
=20
 EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
@@ -31,7 +34,7 @@ do_compile:prepend () {
 }
=20
 do_install:append () {
-        oe_multilib_header  libyang/config.h
+        oe_multilib_header  libyang/ly_config.h
 }
=20
 do_install_ptest () {
--=20
2.53.0


