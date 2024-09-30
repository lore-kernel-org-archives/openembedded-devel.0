Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9C93CF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 12:06:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.138])
 by mx.groups.io with SMTP id smtpd.web10.52670.1727697977170095918
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 05:06:19 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=xCY+J1X4;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.20.138, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Jx9hWTgWZ30JIk1+T9IHwc4yyZ46VgGH/VXmLaqmOJrQbzSJ9RLA1v3/F09sUdIJkGCqQF1ZWBTMn90srSdAMbrVRZlFrAb/+4Zivvve10cimpwB05Mxq7KUErtR9E04yq+p12KzBchmOBcF/VgnapR2heVlx8rCqNLzrp+m/og1TBDabJyA2ZzFlG9bbXkRFsZazQJ3nEz4TTC07+KVWAvtXTJtjO1haKo8lxx6xwF+KBY5Rr999FkfpJBJmVCsBLsDLDUmOHwpRn7GO6tm5XGXCKwMFF5rrmMD6I5/ileZMokYURklGDw4/tihMRojGbC7oNZ2BjH1N1QAX9Jcuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=ayoPhc9YT3LUWgxRDABW/oxFu1+VWAJI7HKuqpiCA77fl0VMB/qz5qwbVpPiuKgjjhYmJcPuaMfGKkAvnrVXxMLdqqGb3nP4M7EPtN4FquAnUQqrxlJHb/b00M/OF0KJzVhWg4CuTEC/307jOkUmCaNp9xrECp0L6ZhlskIs9Qrm4WPJqXRL3rpsrtuQoKDFp8Sp9+YG5VA/fNTWLxC1qpaoghyZc4meSC1q59ihSCxtR64eXXjhGhI3pp7bAE5MOy3UcBOB1UX1ckD39kXwyqLXKmqlRQITYsCkmmb9sMkxTeXbfsReIoqPfqOoAxf3EwJc3SjxsXdTF5BlUvwqWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=xCY+J1X4wsJ7haLrxAkMFYN/g6U4qTHkB+TGJXjO/rSbG/5gGjRTs942E6nQAiHYLzHI5mT3eJ01qRTergpbB/HqqMedp0ha/bz6/ho8ZvqgWLCKPGqVYYbwHPOxct9bWx9u4NFMa0lIVSaBbCRyAKbtMIYRUXdE8NPmJbnOMCkO9Oz0etNqRONB0OfJFBkITVT6Ff/z5yCDoEVpAhM14YUfCJSAsmJMPs1I1VRLGAROY0Z7B9lmgU0AksQEjfzw/OCz29B/L0zHUseeUAN1zNpnUfsXvUBI/QoG1UdVuNpV3XhpJ7rwH8HgIbpWcGLmerZfjAsb141UdMTB25jvlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB9PR06MB8254.eurprd06.prod.outlook.com (2603:10a6:10:2c0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Mon, 30 Sep
 2024 12:06:14 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 12:06:14 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 3/4] lio-utils: Remove obsolete recipe
Date: Mon, 30 Sep 2024 12:05:23 +0000
Message-ID: <20240930120524.2051403-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930120524.2051403-1-niko.mauno@vaisala.com>
References: <20240930120524.2051403-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AEE.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::318) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB9PR06MB8254:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e7eabd5-286f-4994-3706-08dce1484784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vgS2yE6Ruk6erIQpy8VFs6AJKLFZl75COw364IZ3g/i1qgqxjompGK01S/pX?=
 =?us-ascii?Q?lbvLFJpmCSoaWsfC8qvSUWmFCuQVVFFDLE/n+8pJQ+E/acPAgRvCbUzsKFeK?=
 =?us-ascii?Q?oSpcm8K94uHroXQhGEziLVQ5ryNXthLLetkBNEBHUVqh/Wv74RINAiQAZt1M?=
 =?us-ascii?Q?emrSXBvjLCQpjy86Mh9D9w4PW7kdaCK6YMwIInTEL59gDzBjkr9aeaWdrZdl?=
 =?us-ascii?Q?dmlhkpAYwYhwd9+lpvazbWdBdU3nPLfJ6JO4y+YOzHhh28mKACR8U2boDKTE?=
 =?us-ascii?Q?8hdik28T9t7SZNtIZrZoUguttexnYZ2i1xmxjj7TvGaiQxZCz2w4bPE9unNv?=
 =?us-ascii?Q?SPqLgNkRW+PV2h0E3jjCNSllVrdnd8zJRY7/PHAs1pX12K2W3guttUGm8olN?=
 =?us-ascii?Q?ETZaWBUx8N/3NzZne8MGu5ONaqYAp9kNLKM8UnO3F2oF83UAZp9a2SXyU8Px?=
 =?us-ascii?Q?xXYH64C5drjGhd+L2ngGd6lvWr7vhTdtrWEo+XSf8SPUAxqmWfag24ZoQVH7?=
 =?us-ascii?Q?z7fj1W7acH+daNtODwolwtFD3JB1PxktRlk/CkqWSJH9g9c0z3DEUo/E90Kx?=
 =?us-ascii?Q?a0bH8mnoLOnZqPJDcuZN/7BE4SXWbXwfoMBgJcV8Q1HQqOtu8LdZ0remeNGF?=
 =?us-ascii?Q?nDf2384Y3creYI5rw3ehhhs7TfawTOigW1RU1/U76slaWyEYRG8qWqFwZ2jW?=
 =?us-ascii?Q?g2Tp2Rzic5EkOiDV7hvACtqFTnYZyAdsznbDrilQSA2ePCoBkGw/wVQRmZx1?=
 =?us-ascii?Q?d2TtSB9TYSFwxyPavPPCichAKuHYtGfwshQywZXBsPutfDSoXXFAZxpWXvbE?=
 =?us-ascii?Q?OZsMLDFxW340srbyErybUZKhYUyvGoS+qRj1xgod8xlE61+iZewmhL45Tq7n?=
 =?us-ascii?Q?9ApRBJaB8MT67pwItwoKiIz/H5aUix8qgevIZqHLw8p77vim4s0uiE3oqS1U?=
 =?us-ascii?Q?XXbJABryJwqFGFnFFuj6Y8KfXzNrxBuHVgLn8c804CbPswVyZmP0bs3gmHQP?=
 =?us-ascii?Q?o/Wq4OdjPuXcavnDxsCnlUYz+tiYFVbZEei9rTFT8OJdJxxqm8HwFog3Lgxx?=
 =?us-ascii?Q?kj57rQe4qaSBFLEuifD6PFY6lL1W2b0dTEXoXAcrypC5WSGlK4NXsciBAF/q?=
 =?us-ascii?Q?HhtWOlxRI5k9MuB7xutYx9A4cEMxHhqXuaisLrYqJ9nSCb9Tl07IHwdL0bnL?=
 =?us-ascii?Q?RJzWjVyM7PcDCf4/9O6ywI9WZb0hyq5xnSqI4d8O6RXlf/Yl40UfS+YH991u?=
 =?us-ascii?Q?7BqTastdtvMIz9LfQlhlhczjs34+E3BRslEA3SMPn8ltDDr364eG7WNUfw9R?=
 =?us-ascii?Q?iqQb5wDu4XpK2dXJ3uZBwhLFO+5ypEq7lth6JQLZp3LyNWmVN/r9oX09GkcH?=
 =?us-ascii?Q?W4E2Cb0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HCO41STq+wMQQ+dDJhRhkuz0xhgmk0V8SwI6xHEFBsKY6RZi1OQmiMSTsBx3?=
 =?us-ascii?Q?lTryUPfhce8W9dQ8nxtb3AJ94tcdYF8Uf1ske7ETOqsA0RRhGbyfthceRhup?=
 =?us-ascii?Q?zkVRVj2Em1mBm2/bdAC1bO2YyYhBqM/VeY/HkkCKq0o0rJ1mBUqRcHuwqCj3?=
 =?us-ascii?Q?dAOnHm/yId64/W4r/3I6Ns3DOn8YBRNv2CBZtxrm4Pg9IBhpDmWI9SiFvtpW?=
 =?us-ascii?Q?bFAISrByF8VLzyQXECcEjiGBgDuJyDrunYJcUnrkAut8VTrlKbR8zGO6yrdu?=
 =?us-ascii?Q?qH78bsFrXAIYLuWNVS2R9rm7xMuEgeLzH/TNL/dQIXA6i8g/njULkJr9QyF7?=
 =?us-ascii?Q?E44jA2/kw3guqU+mftYrCOYlBpLShuUO/FOG+2pru3yoh7dOX38HmnS/MlIP?=
 =?us-ascii?Q?nABwgY+hMXdGYqNfq6lFMv8gadGzUdFJUZjLVtGBGyVmf4OacyPf0MncY6AB?=
 =?us-ascii?Q?2kjJTX/5kpvFUzD9e28GllR3pWjIdg7jDc6y/Bae5HMuijMRJICMKuR8LixU?=
 =?us-ascii?Q?C4X1fkpnp/J+GUeBFxWtDeZadHjCMSoEho9gilJVbW+nDpGJ971KhmQyUNPA?=
 =?us-ascii?Q?uUxSYyMnSkeKP1InAIcGjI1pvUuqCh2e5gI6q2ZICRRMu195TUq+rA/MKlcq?=
 =?us-ascii?Q?eqLfSKVjUDJHRbLuKMpbj1yXvG0u5jdyyg701wBUlU9uPdJ9u0scrbI8AMKT?=
 =?us-ascii?Q?ONHkw4diblgB/8fbCuHHO+Ut7HiinxtpIE0Swg2ROva2tLHPyrvx529pM3bn?=
 =?us-ascii?Q?sqIo0FRA0prBGGlH7A0/RJ7XDgLhsaD+TeoopVfBt5apDEFnQJklYC46Fm8h?=
 =?us-ascii?Q?QwllHn1/87vbY81esvGxOObsJ40zF+4fb50GNKBSpZ432U4Htyqc6JyegKY8?=
 =?us-ascii?Q?o9Adlu23OJtDXMN37foD/C36nwj9qlUT/rawyTCjjIZ3mw6xJvtQy1WtQrYJ?=
 =?us-ascii?Q?yNB3llvqClC/Y6PtIlBimYfvD7OWjlF04K+b9arvMf9k0A9jcypJKeLvGos6?=
 =?us-ascii?Q?8zyJJXVB8yZm8+1u1SwIWc5SeXKlDT9j2pwSojacEZVIDp/PSBMamKaE78lQ?=
 =?us-ascii?Q?xwC5yNKEVTHubRIGVkxy2NNRWgffsC2bI4+7GT90GD87A1x1EXSCGpht4fX2?=
 =?us-ascii?Q?Iq+6hAugzCGntHRTczu/X4TgHgcXYLt+zcu0Ei2br2YV05xeMWLbyX1VtAIt?=
 =?us-ascii?Q?Iz9GvSJd932qPZD/FdTU2JdMO3HYyRpJGNUllLovg3L4BHZ39XZXiYn1eEEs?=
 =?us-ascii?Q?awSd4xcGQikaiF6ku8jGg17wF8kc4cjx1wh43hkXoPOfC3c18/WNJN5anwhu?=
 =?us-ascii?Q?0CcgDhXWsPkWHXwTJuluZvMGzcIXl2Bt7Cca5JYgWH70jtIDT1f296VTEEtX?=
 =?us-ascii?Q?CBful7HnJPNWgFOJ5ixQX04hd9FFMB+bvbogwGXTvG9ezz6xKvcxF9KNRzo/?=
 =?us-ascii?Q?8hX33xsdr3lFd/rqeh/wz/Q6GC1T0j6H8i35fu6gIcvKWYyO/NFi2MtLT3VL?=
 =?us-ascii?Q?LjU3LTzDOgfj0UEbd/C1tsdEkLp7xxjSJyDhHz7TMJ4E4YjWFJRtd2oQmJ9n?=
 =?us-ascii?Q?KLCX9o08v1ZhBtnm9494aveepXCZkF6pBMHjhUFnGWJmB+WWNT0SxHmfbEZf?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e7eabd5-286f-4994-3706-08dce1484784
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 12:06:13.4410
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iHwe4ehPM19ppgRuJl98FeX1jwIS9QUZtk8EIvmHlHUY7kF4X1If6SQQ40a67S/1XuNbzUT+LlvnO36o4VhnUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8254
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 12:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112603

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


