Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC87CEB2F0
	for <webhook@archiver.kernel.org>; Tue,  1 Oct 2024 04:25:06 +0000 (UTC)
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (EUR03-VI1-obe.outbound.protection.outlook.com [40.107.103.128])
 by mx.groups.io with SMTP id smtpd.web11.73994.1727756701186100776
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 21:25:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=EBUz6oIO;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.103.128, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EUFkuuJxUeA/oe4os1XTUWtRZIkzdhGbgkVJqUraYklY0cnUuD2yroAgsXzl5PIr1NtFHvOogsSkvbBJqxM3tI/+lS61mzOpQbfiPwcTdpXREGxFqAOPRbcg3ZIxwmiJdnajq8AFwl/MBdYBFp4/QqBCDUiQ0ofwSMJ810mnNOEC+9yCPf6knHsWpa8Q87m0gSK0qiKCSxvYxRYGxhXvhs2UfQ+m1opv54e+2FmoLGvow/vP7nLhUTFkwqOGL2zH68RoIZXhRvcwbF30T3gNtEmrqlTUn0d+3GDTJ9Ikw+NY48tTgGPu4K2WwQpJZkqNX1LI59QEuqekRo2bzpwZxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=V716+WbTLYE+XfDpj9Q2w6UBFvhZn/6/O/O5I82Jpk2AFpu7XbKTAghUAGauO1+DY1Nlxc2SbnFNvQh2SYadlTJdmpUK1riZyjSu5YxoLKUzRcqKNt0gkm+mAWQdqFJ4Mk9VMXVtHoBDvRx9WTVqahhK0JVSgoxf5KrIocZed9aBvTTnkR7NOQr6jCMrpEjnUHYmwxVj8OZPlGs5iF6VCHSKWsFpja3ysGebwcJj5CkUeuU9tRz3Q3oLrAxP9fRY91yomCjk8CGa9HzH6x8I2Mc5cbeL8e+yY4rNcgmp7WZPy1pDAqD2dRwB/RQWr0wkTUbIO5B6hM0V+dAoi1flqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=EBUz6oIOCaHLST9ZwmJyCorpnjtXerEmsUSNc4wuu7+vNb1LbA/bsDHmNIxzIt6tGKF45urD0rbPAg2hNegErApFlUKnRisBddKuEcOLreMdNZM0pTL1gu+BNRFiqveY70HUEaHdgKIk7cR6P/1FIunt/BcFhP+6fF+jvwdSf5nys3HbO54SeHHfVNws1D4B7OoxM/mT8vPPNN1yTTGy/kek+fr/X9LIAhaIqZBtSrnEZPsDMXzSkbnNSI1mi8orNTvlzUlODsDGGJ03w1lby5LIOGrDZD6hblGc0csFhIsjnvdzhJjHSnerEZ/E+IZvOmMEHmqTaXWr89l20eqzqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com (2603:10a6:10:371::13)
 by VI2PR06MB9500.eurprd06.prod.outlook.com (2603:10a6:800:223::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 04:24:58 +0000
Received: from DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522]) by DB9PR06MB8439.eurprd06.prod.outlook.com
 ([fe80::1af3:29c4:e7f6:2522%4]) with mapi id 15.20.8005.024; Tue, 1 Oct 2024
 04:24:58 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv3 3/4] lio-utils: Remove obsolete recipe
Date: Tue,  1 Oct 2024 04:24:28 +0000
Message-ID: <20241001042429.3651-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241001042429.3651-1-niko.mauno@vaisala.com>
References: <20241001042429.3651-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV2PEPF0000384A.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:144:1:0:9:0:8) To DB9PR06MB8439.eurprd06.prod.outlook.com
 (2603:10a6:10:371::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR06MB8439:EE_|VI2PR06MB9500:EE_
X-MS-Office365-Filtering-Correlation-Id: 4457e74d-862f-4b9a-af54-08dce1d101f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qj/NYMIXR2GjQSU1HGngD0HvLbJZoltDyPlPo3RKe3KGws0DSZNk7c93i7VZ?=
 =?us-ascii?Q?ppRXexhiHBM6fLjC+qpR3C7rU7bmFGlFFvUyq7lJG1jeu7LGMryiuyJWX2e3?=
 =?us-ascii?Q?/11YJ4qk0fTN4rRI6gxU1X2NQRwFbA/5jbcr9gDiCkqxq9j0XXfWo2BM8Mcv?=
 =?us-ascii?Q?IAGJs0xdUv7HPjfRKtbVRlSxkvM41XZSLyxVFISfmvl6mClsgMKNkO/eGE6v?=
 =?us-ascii?Q?gArUcZroNVvU5u3JxWYfEno0dTeWENMTo2vpmIublAAT9vV/ltCT7Wsek1Lz?=
 =?us-ascii?Q?dSpve1M5scIIjYuY3s0nusumbZ5+vcPXhDTdFr0w4flxgK9CoLhcn/CHSaUb?=
 =?us-ascii?Q?S5IZLyMRrcVUeJdVjC1v7Djn4vqYB0DgC4u43XL+eRReARynjcdBAeDomprm?=
 =?us-ascii?Q?no8uomB9RccxrzEXY/yWwYvMjIFroj2/wKRo6vjkhykVfA0YQmJcJRoMhyop?=
 =?us-ascii?Q?X37j6GSuft2let5pbkGJ6VL9vDtvLXOWm87uSvyi2HdAMaMz0kzBkICkyhL8?=
 =?us-ascii?Q?Mjk+7NxnK8wTj5Q5yARYo9obMciP3neuI+Kn1CKVPKDfyvrMe61GcY6xYnIe?=
 =?us-ascii?Q?WNyYbKAobKUSUthX7NtP+DUI/WyUOa2YRjLTNi4cRLPVLDphjHBVWhnUBOgD?=
 =?us-ascii?Q?OikVym6zCYbNndLAVnC0qkZyr4z9/Fw1Is537s/gD15UM8XFVcRwhR3G9I8u?=
 =?us-ascii?Q?vUEtc2WoanKsGnlQX81/WOsEPTgmEj9epBGw+ctvMq/02e1NVOb4HVA5eEna?=
 =?us-ascii?Q?1j8x8X0dDETxrNqDmTSviYCRK3HAX3J3ghQGEjcveGXNMdbNGkh3bO87ygth?=
 =?us-ascii?Q?2llvDifDih7EvkhwTgwNN++wI8RGfsBeYUVaJ8uibI6NYbBAJFvm2gXns0nK?=
 =?us-ascii?Q?NJvftrDAXMSZalFp5vJknrc4mYk7s4hduEgzvm0sNIUVWWOuv35yEtaDjlEF?=
 =?us-ascii?Q?Go9n+Nuh3qWkXd36kyJROpK2626GFgLf6RRTPFvEesYOOhRmCol6VHGbIl+n?=
 =?us-ascii?Q?SwuljK5/230Z1ROPWG5JubzFnKq81qBko0ESoDF5a2sS1wfbVS6xvZfk3qdb?=
 =?us-ascii?Q?4g5DQqtBARQDvIJqevl4rhlN7hOL8KDwkfNAOHX0UITNEs8JPirD6C3cdHni?=
 =?us-ascii?Q?MQ1YD7J6wBsiEd2wIFnCAYEJowvGX6Zfai74frZTS4GlADRNbVHszsZtHDVo?=
 =?us-ascii?Q?TwX/1gymH25qq8ti4rS8CICNhoprt7pH3q3RCzCZ/o6IoRpaB0OP24mtrEhf?=
 =?us-ascii?Q?+dPq93cf4glvyP8s63EjeRvqIunHQRC/8AfiGItYcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR06MB8439.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ovSTIVse4GiEnNA2QZF4eKY/m9GO/FEZWShcfQ6YB/TsgT4RJYOr2WOu5tuh?=
 =?us-ascii?Q?DNzMT7E/+9bvc7d5G4A59+oTM3v4GSGNRL2vLrjcWM64CV8Rc4/gmtRxbQXr?=
 =?us-ascii?Q?Dzz07QzRY9e5FA3O5OAxrTZEiobie0gxIEOYEk0sUdj4UsXmLjfppEwIibLk?=
 =?us-ascii?Q?tdsMBARQfQ7VlhA8jfyMt4NpLc3qdMvZLDryUNDepUCtiMvsCarD3jpeWMOM?=
 =?us-ascii?Q?kCbI4k3UqE32eitQRNElN12j7uP+6KlVBrI6tDA/aaKF8R6j94+BWazUKNw4?=
 =?us-ascii?Q?6f/rZCMlWxjQ0FVgVTSlaM7XohSaCN83hrYvWzIdvrdhvcqSvnuVxI9sQnT4?=
 =?us-ascii?Q?PHDVDjRBEk3mXPRcOPLmGgfrq/SPsSa4o0sCwTwLEFcN2BYU9fmGQGTYmt5n?=
 =?us-ascii?Q?Y5dyM/LHZaA2mOsX7KDbK8aSwhAIEKTDJcF1InRSQnHwm5xmEJslo4JMxn7s?=
 =?us-ascii?Q?e7km16Y/78WDqC15UP02WMjJNP8+GxYF6/j+DztrQZADKdSKsA88VSBN7t4R?=
 =?us-ascii?Q?Dj1OsnMOUf1PTcK9W4FACFy9gVMKmJUhmwgmUGQAMC5TbqIVlVNes32FjKDc?=
 =?us-ascii?Q?lHgSAqd7hVt4b+SlQi5iwhT/3EfMTTaFGBOPTMlmAk05fm6iRJ3rE8RDPoGT?=
 =?us-ascii?Q?czAl6YoqAc33T8RZjVx3sQfBtr+WE7Ygl9RQOk3GbB+TS0fw9nlcRe7tR7oD?=
 =?us-ascii?Q?nnFr7y5L7QWf6afiDZBlWYglbMgUvmt0vt24vRHM21MlBojkf5SQ/t7YFeTd?=
 =?us-ascii?Q?+/kB5ntLj83O0MmhErm2IbAyjBigBevKFtPfrDg9x46pedZ7ymy2AAnj/l74?=
 =?us-ascii?Q?vt2tA2RtYgVwa5ICX+3jshPvM1vCbUzJT7mX1O9HApuEGlkI70WdIsy1+kcr?=
 =?us-ascii?Q?6EN4zsOIWdZPgYr57gO0m4Lk/7BPnPv1QN32E4rdAu9d8VAYWM/0uWUCIOML?=
 =?us-ascii?Q?7Y/33dwWGQambwNUxO68dy0Yf4CQE8zszKDQ1DprLSyEHqPQv5aD0WSDSl16?=
 =?us-ascii?Q?SZ0kT94NPeBh3jVCnYI/77deRouVwx9eSriZ2FQoz3iQ5vRP6O/eL0HmAx7v?=
 =?us-ascii?Q?ThIjOTAceAMUFquC8w9iq/idEd6MKQ4bUg8Flxvd7B4zMCFCG4AKPAy2XIRC?=
 =?us-ascii?Q?KroS9Psxg6oUdUVpq8R8zlod+U34qBe7G5SGmeo/Ipq4x0RVUBvxLK+uqym1?=
 =?us-ascii?Q?troLdpTI3k/O9xGDFzzS8jtT5BIsgMltlei3zTMbmutwYVwIahz8t0osHTnY?=
 =?us-ascii?Q?UI2xSWEVEvIQsQok6ZDb3fEzZLxJ6ulWJ/utqAk2U2TOuLOO3ijhirxQsLPM?=
 =?us-ascii?Q?sZG77mFH5xu1WvaemnbJBvIK90ohC+e1MO5HsmtPFHwF4rhrCidR5O+6XjNc?=
 =?us-ascii?Q?c0nrvnmAA35VTLyZsnFOCVjLEpVLbQAnjmK6P2dy4QCBLEA1BiiXnp30ls9a?=
 =?us-ascii?Q?akyPUXvcNxoBiTX5REgK4KjhDF9pSpWi/G8mEdWXAsP79tNsJe9Z7ePwgHnX?=
 =?us-ascii?Q?w7u8aLncwFWb4UCaUcsDSOcNhSx1Z5GWFvgbfKll/9FVpPVQ7Pn0jGliQvYO?=
 =?us-ascii?Q?nxrqr4uuHuSWxRizEYixJ4cn2+OMNIFsjRaye7LDjLfUz9aEn46fGqMxA0DS?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4457e74d-862f-4b9a-af54-08dce1d101f6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR06MB8439.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 04:24:57.7938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eifE0lBwxGMNVrEcjU7lZqVn20bSaxQrs0pghp4x/fG8JjrybumRWyDhax6DVfyVwmnrSY5D0cWo8oWKxGDRVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR06MB9500
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 01 Oct 2024 04:25:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112620

This recipe depends on meta-python2, master branch of which has not
been updated sine February 2022, see
https://git.openembedded.org/meta-python2/log/?h=3Dmaster

Also, master branch of lio-utils has not been updated since May 2014,
see https://github.com/Datera/lio-utils/commits/master/

Thus, remove the obsolete recipe, along with associated packagegroup
declarations/references.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     |  6 --
 ...t-environment-variables-and-add-LDFL.patch | 63 ----------------
 .../lio-utils/lio-utils_4.1.bb                | 75 -------------------
 3 files changed, 144 deletions(-)
 delete mode 100644 meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefi=
les-Respect-environment-variables-and-add-LDFL.patch
 delete mode 100644 meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 163061ca7..b29b86d45 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -22,7 +22,6 @@ PACKAGES =3D "\
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-support \
-    packagegroup-meta-oe-support-python2 \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
nome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
raphics", "", d)} \
@@ -47,7 +46,6 @@ RDEPENDS:packagegroup-meta-oe =3D "\
     packagegroup-meta-oe-security \
     packagegroup-meta-oe-shells \
     packagegroup-meta-oe-support \
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "packagegro=
up-meta-oe-support-python2", "", d)} \
     packagegroup-meta-oe-test \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
nome", "", d)} \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11", "packagegroup-meta-oe-g=
raphics", "", d)} \
@@ -914,10 +912,6 @@ RDEPENDS:packagegroup-meta-oe-support:append:aarch64 =
=3D " ne10"
 RDEPENDS:packagegroup-meta-oe-support:append:x86 =3D " mcelog mce-inject m=
ce-test vboxguestdrivers"
 RDEPENDS:packagegroup-meta-oe-support:append:x86-64 =3D " mcelog mce-injec=
t mce-test vboxguestdrivers"
=20
-RDEPENDS:packagegroup-meta-oe-support-python2 =3D"\
-    ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", bb.utils.co=
ntains('I_SWEAR_TO_MIGRATE_TO_PYTHON3', 'yes', 'lio-utils', '', d), "", d)}=
 \
-"
-
 RDEPENDS:packagegroup-meta-oe-support:remove:arm =3D"numactl"
 RDEPENDS:packagegroup-meta-oe-support:remove:mipsarch =3D "gperftools"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv64 =3D "gperftools uim"
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Res=
pect-environment-variables-and-add-LDFL.patch b/meta-oe/recipes-support/lio=
-utils/lio-utils/0001-Makefiles-Respect-environment-variables-and-add-LDFL.=
patch
deleted file mode 100644
index 86edcc2e4..000000000
--- a/meta-oe/recipes-support/lio-utils/lio-utils/0001-Makefiles-Respect-en=
vironment-variables-and-add-LDFL.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From 2cc2315eecaa48fd24792aaa889dc7d9fb96978b Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 20 Mar 2017 22:18:44 -0700
-Subject: [PATCH] Makefiles: Respect environment variables and add LDFLAGS =
to
- linker cmdline
-
-Fixes QA errors about GNU_HASH
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- mib-modules/Makefile | 10 +++++-----
- tools/Makefile       |  2 +-
- 2 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/mib-modules/Makefile b/mib-modules/Makefile
-index 0d54c9b..051d4d2 100644
---- a/mib-modules/Makefile
-+++ b/mib-modules/Makefile
-@@ -17,13 +17,13 @@ TARG		=3D iscsiTargetMib.so
- OBJS		=3D iscsiTargetMib.o iscsiMib.o scsiMib.o ipsAuthMib.o \
- 		iscsiAuthData.o
-=20
--CC		=3D gcc
--CFLAGS		=3D -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup -=
shared -fPIC
-+CC		?=3D gcc
-+CFLAGS		+=3D -I$(INCLDIR) -I$(INCLDIR)/agent -I$(INCLDIR)/agent/mibgroup =
-shared -fPIC
- CFLAGS		+=3D -I../include -Wall -Werror
- #CFLAGS		+=3D$(AUTO_CFLAGS)
-=20
--LD		=3D gcc -shared
--
-+LD		?=3D gcc
-+LDFLAGS		+=3D -shared
- INSTALL		=3D install
-=20
- all: $(TARG)
-@@ -32,7 +32,7 @@ all: $(TARG)
- 	$(CC) $(CFLAGS) -o $@ -c $<
-=20
- $(TARG): $(OBJS)
--	$(LD) -o $@ $(OBJS)
-+	$(LD) -o $@ $(OBJS) $(LDFLAGS)
-=20
- clean:
- 	rm -f $(OBJS) $(TARG)
-diff --git a/tools/Makefile b/tools/Makefile
-index 79ed3cd..ffd9bf3 100644
---- a/tools/Makefile
-+++ b/tools/Makefile
-@@ -6,7 +6,7 @@ ISCSI_NAME_OBJS      =3D $(ISCSI_NAME_SRCS:.c=3D.o)
- all:: $(ISCSI_NAME)=20
-=20
- $(ISCSI_NAME): $(ISCSI_NAME_OBJS)
--	$(CC) -o $@ $(CFLAGS) $(ISCSI_NAME_OBJS)=20
-+	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $(ISCSI_NAME_OBJS)=20
-=20
- clean:
- 	rm -f $(ISCSI_NAME_OBJS) $(ISCSI_NAME)=20
---=20
-2.12.0
-
diff --git a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb b/meta-oe/r=
ecipes-support/lio-utils/lio-utils_4.1.bb
deleted file mode 100644
index 844e5acf9..000000000
--- a/meta-oe/recipes-support/lio-utils/lio-utils_4.1.bb
+++ /dev/null
@@ -1,75 +0,0 @@
-SUMMARY =3D "lio-utils"
-DESCRIPTION =3D "a simple low-level configuration tool set for the Target+=
iSCSI (LIO)"
-HOMEPAGE =3D "http://linux-iscsi.org/index.php/Lio-utils"
-LICENSE =3D "GPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://debian/copyright;md5=3Dc3ea231a32635cbb5debed=
f3e88aa3df"
-
-PV =3D "4.1+git"
-
-SRC_URI =3D "git://github.com/Datera/lio-utils.git;branch=3Dmaster;protoco=
l=3Dhttps \
-           file://0001-Makefiles-Respect-environment-variables-and-add-LDF=
L.patch \
-           "
-SRCREV =3D "0ac9091c1ff7a52d5435a4f4449e82637142e06e"
-S =3D "${WORKDIR}/git"
-
-inherit ${@bb.utils.contains("BBFILE_COLLECTIONS", "meta-python2", "distut=
ils", "", d)}
-
-EXTRA_OEMAKE +=3D "DESTDIR=3D${D}"
-
-do_compile() {
-    cd ${S}/tcm-py
-    distutils_do_compile
-
-    cd ${S}/lio-py
-    distutils_do_compile
-
-    if test -d ${S}/tools; then
-        oe_runmake -C ${S}/tools
-    fi
-}
-
-do_install() {
-    cd ${S}/tcm-py
-    distutils_do_install
-
-    cd ${S}/lio-py
-    distutils_do_install
-
-    SITE_PACKAGES=3D${D}/${PYTHON_SITEPACKAGES_DIR}
-    install -d ${D}/${sbindir}
-    for var in tcm_node tcm_dump tcm_loop tcm_fabric lio_dump lio_node; do
-        if [ ! -h ${D}/${sbindir}/${var} ];then
-            chmod a+x ${SITE_PACKAGES}/${var}.py
-            ln -s ${PYTHON_SITEPACKAGES_DIR}/${var}.py ${D}/${sbindir}/${v=
ar}
-        fi
-    done
-
-    if test -d ${S}/tools; then
-        oe_runmake -C ${S}/tools install
-    fi
-
-    install -d ${D}/etc/target/
-    install -d ${D}/etc/init.d/
-    install -m 755 ${S}/scripts/rc.target ${D}/etc/init.d/
-    install -m 755 ${S}/conf/tcm_start.default ${D}/etc/target/tcm_start.s=
h
-    install -m 755 ${S}/conf/lio_start.default ${D}/etc/target/lio_start.s=
h
-}
-
-SKIP_RECIPE[lio-utils] ?=3D "${@bb.utils.contains('I_SWEAR_TO_MIGRATE_TO_P=
YTHON3', 'yes', '', 'python2 is out of support for long time, read https://=
www.python.org/doc/sunset-python-2/ https://python3statement.org/ and if yo=
u really have to temporarily use this, then set I_SWEAR_TO_MIGRATE_TO_PYTHO=
N3 to "yes"', d)}"
-
-RDEPENDS:${PN} +=3D "python-stringold python-subprocess python-shell \
-    python-datetime python-textutils python-crypt python-netclient python-=
email \
-    bash"
-
-FILES:${PN} +=3D "${sbindir}/* /etc/init.d/* /etc/target/*"
-
-# http://errors.yoctoproject.org/Errors/Details/184712/
-# python-native/python: can't open file 'setup.py': [Errno 2] No such file=
 or directory
-CLEANBROKEN =3D "1"
-
-python() {
-    if 'meta-python2' not in d.getVar('BBFILE_COLLECTIONS').split():
-        raise bb.parse.SkipRecipe('Requires meta-python2 to be present.')
-}
-
-
--=20
2.39.2


