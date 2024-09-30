Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C9CCE836F
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 16:26:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.106])
 by mx.groups.io with SMTP id smtpd.web10.59036.1727713570740389019
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 09:26:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=s8iRp7Ls;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.21.106, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxfbz25jrBSQBHrkiHNpx6sD17roHMu4E5H5wmPfhOgSc1QNCaLhg3RkrIQAmzSVKuX/0wNowVd5AJ8cY5jhzrYBBtlr/51dTviUQ/oKQH4Fwwt8jCAbIxS/dimwk5O1kq0od7kOOmYp2r0L0q5jPZHnsh53VtU0cJds0OuuE+Y0SbuoXXurTPP4w0LCIBhOphOdei/gab494JSgO+opyMFk7YUV8COO4pNX3s3rm4CfdzfOTwbu3lmrMu9dVS+AZbFWpKxbBW5kIMH0+OVn6xjGNyz/r2hkbasYNEznP9KWeCrtOccIxBv5o8N5mmZnC2iAZRTmcdyQwTo7ZOlV0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=ACQFZ/HKqQA2Of36Fb5PPcBKf3V6gwWRxXMt0vJWFbjMCjnw/X5EdA0OtV2gG2dG2nXfRdY5d9kiDcnCHzERP01hFiXq4A9YgQDUxryxX4n79/LJKv0iEKIWMch88A2rBU+vVvvbXjMTxLA1nwMSxskznkvpD7SIfB/tDohCjGPLnS3Uy61rBvId+kM6KDnAjLaFuo6S4+CRCpSh2nP4r93cow1k4amOcvjQ8BQp9aRCu/sB05YfLZQ8+f3AZMWUS+o2TEwelnRCEqDEUkY6tWigO1AUQWtuDcu41qsIiYbIYSr8B4wa6STsgnxwP6+L4ODepSdToBCJovQBOVivYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iZykrOQ3wpk+J0Lfm0L+kFWZ6wQefZ20SDsLIYwROD8=;
 b=s8iRp7Ls1Z3jFckJLnCklm9ci+Gs+cWUQia3Zdg8PkwfMKso9lF4foVq3cPvDgdFjSREZTZo6gNMFd+SemXYTk+ZaBZtcu74ZEr559LUn4iebpcjkRRBJv/bUlwESAcdkkLzQfD+3xciO57PTJMeyDrGN6koPgHaFjiwCYnuTRF5fJX7TYUvjT9EagWefEkNd0UhL0QgCDSBzLkPKEsgMTawbni7dJn3hDnUjvQr2k2LyWJcsZGHTdGZGb7tuBCMsHpL4u1eSlZI5OXxGbO3U6SSPXCC+4MO86i+eiaExaMMP3ZqBWWnBqRM5fNdmYVqRA7IAOT2Ykh3Fs5Ul3XUdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DB8PR06MB6426.eurprd06.prod.outlook.com (2603:10a6:10:12a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 16:26:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 16:26:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCHv2 3/4] lio-utils: Remove obsolete recipe
Date: Mon, 30 Sep 2024 16:25:31 +0000
Message-ID: <20240930162532.4064184-3-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240930162532.4064184-1-niko.mauno@vaisala.com>
References: <20240930162532.4064184-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM0PR05CA0083.eurprd05.prod.outlook.com
 (2603:10a6:208:136::23) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DB8PR06MB6426:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ec39ff1-f89c-4bad-9ce5-08dce16c95b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?py6JvvjyvUcQLPxwxkqqmAzhVrVMhRpT0dbYVz76BFk06tjUrJsS28ga9buU?=
 =?us-ascii?Q?bkN6cGN5Xj4wlKyRBZqE7ygPpC7OLqV3b9HI2zf0A61k5M+9+WrMBBcBmIz1?=
 =?us-ascii?Q?98PJe+ET4GmV7teAEjX7tuRicDJRluhJ5ruRQW0Ny7Dsq79p+yxFer5TeE4S?=
 =?us-ascii?Q?6dlZZVa0mX+Xx1ZrOTFhgMvonqGUrJoniZ5JmsMtlYTqfUcPGtAzxd6QWhUR?=
 =?us-ascii?Q?AtfupqMPQTdq13th5LOlbE8ZTySK25+BLBu8gukfCIsqTOtItOp7ZlKSL9vM?=
 =?us-ascii?Q?tm7z8A94Jamct28M007ZhsbUjN+xSmWkItm66qQJCsPxjmo8PPhpCr0EJofW?=
 =?us-ascii?Q?nmvmMZC91+UjcO4C4ddRN2ps3s/WY93kOza95jEXx3mzpRlGJouzmwTTh+jT?=
 =?us-ascii?Q?f8y40MnR10MvfCxOf02nRZPNwX4J/EYiLmoJ/WLpBB9C9BVyax1SI5v54flo?=
 =?us-ascii?Q?OQdDtFclITWFNyLqP8C5b3gLqaLwEAJbqfJ7aCRaayfLGpvQJR0HKlVlRpJB?=
 =?us-ascii?Q?0Ja7sr9mtroJ8ELljEYVYHi4N1AYtk8ngEOUjiO6kzxUhPWPtYH7wo+pBP0E?=
 =?us-ascii?Q?wzA4XJzRfbuYx5dV2EdmdnvKs5yhyZ83GbdUI7Cg5ZWWBCImHHVGizhlDa9R?=
 =?us-ascii?Q?tY+unS5hCozRth3I/kYslSB6sKVAMvjbsuzCtPoKA6uSzjckzIeDkVtwyDZ7?=
 =?us-ascii?Q?+XTXx8BibbL4f524gSDqoV+KEyzk0Bu5d2Nh7K45CAt5Fx+ez6snGFpa252c?=
 =?us-ascii?Q?Axg72dOF9DtyujZtATErWkAknj61C6hAx3g7wUZxkAZVPb3FATNYqKwniHpz?=
 =?us-ascii?Q?0b9J1e9c+v7mhJ3aaZiWSMj/PFOcVeMlSkcLOzmY5B3LW6rhcAgaNTkXTsq3?=
 =?us-ascii?Q?aGWKBTBxXwXTfUewCi5SzCmUHtu7rOfNtMpUWrqPQyKgM+2ma3k/BvSmUhOw?=
 =?us-ascii?Q?tGv4pOn0QNy4F07gD0ZM83Gb/HlyQvHS+G9kLCFPBubcgRg2unWcKPZtoLSh?=
 =?us-ascii?Q?5s0rLUFXFoULMLxDTcj1pnpaJUq+9lani4iHPeiDuKadAkzoPA7kMXb9P/pa?=
 =?us-ascii?Q?m+DFuO/Zqb47zskHC375OPCkxzmJDpTKbCwDlq9WCgt2OFFO7nxAsaXrze9g?=
 =?us-ascii?Q?MoxTL45siQTtkTwvJs7LZMgQaFjBInEXk8cfD5TVT5UAr3boiLR040YQT+Fg?=
 =?us-ascii?Q?XPW8YKRwsgviluGbRwEUGn8UaSQqWwjCKQcDKKu00DNFAtdOpJuQta6n20GE?=
 =?us-ascii?Q?MUXa0R5PfJnmMpzyHnCLsjbqpYlB+kg4yx1EVcaD9g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q9ED0ytg9NcJchI9S0NtYUm82N1kGPwZ65rbYgt75BPRb3Bj85qqHA9vY8Bj?=
 =?us-ascii?Q?No54YL5t2jhvN2pWt9y41TjwJaf35Qxc+rcMKRfmHr3D/caX1D+ktMIqZSsR?=
 =?us-ascii?Q?6BtVN6jdnp2F7Aieo63R+k0uNbFmySof4AOz3jmqWeuhRIyEwFxyEzt9gLQ4?=
 =?us-ascii?Q?89tIooqLGjIdHOKKqyOqtDXPGzEzVxyaiqdI3Aq1aYMR50OykedgHkB3ypw8?=
 =?us-ascii?Q?o6XC5UOSdIufLfAdjcIdteZYpe6aeDbDeR6qtpKwGRGoAQ+nYn2KqWyEVFBg?=
 =?us-ascii?Q?mjMj0WAPIUqiRgp4fqm2iqR9HM9q68KheMXR7eFi6aF7lU9hm8PyaklfMF63?=
 =?us-ascii?Q?4338nyW0pBRk1xW0y0UxIlEkLT2TVpzOIPc2pv/hqXYGZbhTjtv0w93Pb962?=
 =?us-ascii?Q?XnfFdVICApgbxzXD5GNyQZYt+JHQNb0khUU1MEVCpNUXsOxe1Nwnyu3dLCzU?=
 =?us-ascii?Q?4GYIU92i/06uRzwU8SGBT2cbFSdcLMMCugPrgbmyltHuxVHzKl1j5Q6nyu3w?=
 =?us-ascii?Q?9iLrenFbXBwNg4taci1bTnePezwc3Tsh8/w4Cg7pBpavn2LH8ACFqJsbDLo6?=
 =?us-ascii?Q?55oV+KpU06gKTLiMtq+You9lAUmrgaB4AdHLD1P9gpyG4prNjX0QNdKBDvCN?=
 =?us-ascii?Q?wgcizAuHCV2CY1XRZUW5r9yZT8p2wIhSg8wV65S5P2wVNW8g0j65X4ifLQo7?=
 =?us-ascii?Q?EKaYkWS456p98bvuIc12PocXiUJgKBXBrDYb4lzNcPs+pbp/l/A/A6GPzrvd?=
 =?us-ascii?Q?iM/IQXnASg3LEqXW2om+WiSSju3PtEDGiEvOl+xM8X4vqQ40eo8tdrvO7ogL?=
 =?us-ascii?Q?VfivUZmxtCzrrAai0Uy5+QWIYHMh8qKfhHKNk5va8C+ayXYo2MiqUtrNiYaE?=
 =?us-ascii?Q?b6aHbSY05/Nm7jA2ZKANf80qCx5TEQKf3CPgW4ht6wk6mwhUbHvGR+rWzQd8?=
 =?us-ascii?Q?dBJiL1rDLBcTSKwedVTaqKQi15Brm63kx2oXBVxHodhB/Ih7ifyUJrQzYaD+?=
 =?us-ascii?Q?llac6uj/V30mhGjGURsmHtOV1lieEFBYY7tjptLI0Nhov6TEvxnbo20rnjN9?=
 =?us-ascii?Q?7IlqT40NdY+kbd4ZQdGliDgrUmhVekQjguioHk9XsWy+Q/t8z55TZFKSXiLm?=
 =?us-ascii?Q?5GhIi26hE7nDATnXJAThFrNkMxAq/Jzk14xKkXXkqBpZ79jW/HLOboVKgzcP?=
 =?us-ascii?Q?xXS0KvdkCJlkM8HfK3uY706ZvemKaAkhWaS2NbopnBc7x4bq7QlzqBGbrO79?=
 =?us-ascii?Q?kBTj8hGfgbzQ2+60y/z7zBZbGR43Wuzhhko8V2bxvqRiIm3/uVtQY9Y9zHJz?=
 =?us-ascii?Q?OA+zvzgpJWJ1XFyryH5KXsfd2JwtTZyeTnpzDBRi2GpVbBYlnpFtHZTo/17K?=
 =?us-ascii?Q?xj5IUmKxafRYhC/eO7PEOWBch5e+ULI1lhzfLgzvRNwjiw7zBXQrDTZ2a3VM?=
 =?us-ascii?Q?huwdIF8gMjcvFPnJqO7sBpPUm34SCCQGD3fUjQcRxPndWkdQWMP/9tRgN2HP?=
 =?us-ascii?Q?j+G/F9LeKzDeuY4Z+F5Df43RoQO8uJp4kd1AFb7v7dobwCM9hW8g4sVndOeV?=
 =?us-ascii?Q?kPU+oVWsnhqFRenZL2o53O47HUmw2T4MLZ2ttMIjwWT2iqG1x6Sf1B6jNwgE?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ec39ff1-f89c-4bad-9ce5-08dce16c95b7
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 16:26:06.5216
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYKBMbFBxM492VFkz3IzsYrrVlsxNrDpS5W1LwnNmy9jKxuyIKUUX+ZqwaWrwyCaUWyBWtl7efaF606HmPI5ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR06MB6426
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:26:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112611

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


