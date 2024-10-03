Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F3CCF34A7
	for <webhook@archiver.kernel.org>; Thu,  3 Oct 2024 12:43:13 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.105])
 by mx.groups.io with SMTP id smtpd.web11.10398.1727959388976526076
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Oct 2024 05:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=CPJe0E5B;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.241.105, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gnN5DC1or177zGt6uAVLmyzlzXngDFBH/tuGXJm8P8XaONzCPoPrUgqmKglMbnMo/AgFjnB0Dsk/6FXlKXskpY+oPjk7wHv2mtRQEWuCvZil4+ZnJcMiR1hEUhhtKAZzUczceFUHJ1WNC2KwLEc1oSrJ+ZiM9DKfONgq3jXCGJegwC+bTIiKh+QmYprgmFax6QGAXaJIKZgrDZlMay2FHYa1700G8Fvl9k5Yk2NgkRPeaiRZ/51t42TiiD+yvEucAVVvAy3w4InX5XrDhwZf2dWyjfp5s9WO3Yf2JbjV4e/N6Bje/qJLYu/sCqhfvtdp6TYMf7pCXww4GQyI7WyQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WLJictBd89k+AlfkuDD9J75iiAIPqf8SC4dQBXPpLO8=;
 b=Sf8BWAOINO0jSl7NtBMU0Ym4hA1+tIcA0h1wRWCcDtNKUOiOIZSXDkTpl/fYKMGvwmpvp0+2mBFC+Uj5ejQzg1Hyucr1VqQ7rQ1+cHXSyhsP73hC70Q//izzR+RoZxU844eCa+Ij/4nbh3q4qnHdZip13a+ubjKA25lMZ0s1ver/r6uvQnECSRTny3F0Ls3hTbyDy8VrZ1qoZ7I0Vkln9QMAbA3LZS+QcuNul6k4+c3VeS4od3pR3boaS4/LlKyNDVfg1b2dkI9EqOLEm8ClH/Oq3RRR85pJjSWGKn9HUYB/hTKnmsztpDcrIeJHqmR2QiTOefQ6rgSklTOwlo/nvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WLJictBd89k+AlfkuDD9J75iiAIPqf8SC4dQBXPpLO8=;
 b=CPJe0E5BQGKl+FFMl0j8xuOzWAzUZ3d6TeZPEXwItw46vTWs8Kmeg0O3a4a/ZOmW7MZby3/L4f31+qN2qaNuhZK+pVcVuSplKfJLHxmThP7NrpSdkiGNTD1dTcqS6Csb5G6XMgAMDQu4yphq7AxNv9PI3br+83ove7GfGY6VGfD+t7LX0pe8SQlTPq/X6Jwz7tFzqaRHcryaGVb6pmmGiljqRJSYei9RTTGTM1B+i8j+cs1nq2l1LMZIYr0rgkakREKh0gAd0NObdofCitfw4DGbY1NzANWBvzOaloJE4QdH/0YxUftHVQwGXsEHOQ1an2S4dFnPJbj/cvNj8iFb/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA1PR06MB9517.eurprd06.prod.outlook.com (2603:10a6:102:45f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.16; Thu, 3 Oct
 2024 12:43:06 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%6]) with mapi id 15.20.8026.014; Thu, 3 Oct 2024
 12:43:06 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: raj.khem@gmail.com,
	Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH 2/3] packagegroup-meta-oe: Fix recipe style issue
Date: Thu,  3 Oct 2024 12:42:42 +0000
Message-ID: <20241003124243.2411621-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241003124243.2411621-1-niko.mauno@vaisala.com>
References: <20241003124243.2411621-1-niko.mauno@vaisala.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: GV3PEPF0000366D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::390) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA1PR06MB9517:EE_
X-MS-Office365-Filtering-Correlation-Id: a18ebf9e-13e0-4455-a853-08dce3a8ed93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?m6brFF5YSGIMI9ZenQuu2c/2knGCbLUJ9agMsY69ogJ0XuJOJ36P16YRjAci?=
 =?us-ascii?Q?biypB8JApWNdA2wV/eDqar70AaIaZQtQNEMDCdff//rJBDqNgR6+5sTTxx8V?=
 =?us-ascii?Q?ZDg/Q3mjvIF6JCWwLQaO4Im/65EsSmMjyG7o5fFyuYEnMHlUKIhXtcrmTTM0?=
 =?us-ascii?Q?3uFWW6mEHe9Jv9NL6/Z53cp9W3idgW5vugq7opm3Hh2VBIwYZ+/KWy77oM13?=
 =?us-ascii?Q?zCs6bsOcZVhXFL6LaxSEfMsyU3LT38+51BeSMo2d3n0G5rW2jSlHTNnaiAO0?=
 =?us-ascii?Q?G9dF+OQwiXgWQCXxHpHKXMYn/bDYf2KsT1fJYOJr/eTVVNCqhVgJOgH1EIhm?=
 =?us-ascii?Q?G4/QtDNSuz1xa6z1TRcNKvLKzWX3fxXnQvUrMgTqrrZssUfmbuSg6xzSWBfL?=
 =?us-ascii?Q?CYK2zVHkDfbis7ZBXzG1LXZyJq9S3xzYGLaBsBd1g+OVoyM73yoL0kTmb16T?=
 =?us-ascii?Q?bSSFj2VG6YNgZkJqkfGq5VfscX5qVjb3qDXT4Zbragwxy4qWyrhUK4WovmYv?=
 =?us-ascii?Q?48qbMWRRLxOHetc/3iFR5zCyIbS/Igfn3gZZ+R1PN5JiuDWZJD0IVro1ViXM?=
 =?us-ascii?Q?72KkRODw56u89VIdjZszcvQ/0g0WasAa65gScX08x4JcLN6Q0aIfuoI2Evwi?=
 =?us-ascii?Q?PLRbtbW14UDW54KVbyO60KQRb9cQYHb6kJhYC2HuPLEnzytXL66bvm/zcjrH?=
 =?us-ascii?Q?vnycPNowutnZvcSPzWQ/t5q+x2h8GH8aLJj0N+0RqJhMoaM6RTijS0vYiBAu?=
 =?us-ascii?Q?eGku5vi9hmBAYS5rpImweS/jelBSqc+ZmIwx3qKfCEVxPtC7JmUFjQx5tZx+?=
 =?us-ascii?Q?By0BMGObviSgQ3eBZSgk4SkZ7r37cLgOIW1FpPbZkG9HLG/jR1ScDXw54MtV?=
 =?us-ascii?Q?xDuo8IUSR1Mw61zKveXI3L0a0oBIkNiREy+N0dLykb8yyJc5Y4IqBw6llGTN?=
 =?us-ascii?Q?8M0eS+od+DBw6kJKeu414tNWhyYiGBiJIr3RRUdvvwGEE4N5O/VQtabxKyhk?=
 =?us-ascii?Q?C59/cl/BPOVy+sXMFoAYZtvo8JpM/rJYu3Y3cRVWTBTUe/bsv4q6bb8YXUnQ?=
 =?us-ascii?Q?3NFtE7cQmEzJwBjOcWB+cdlVMspvvHLCAS9KSycPEU/NXIxijX3D/CFxFTHh?=
 =?us-ascii?Q?0q+bxCibi0yB7DHb/z+llLZkbdgrO4hgllF2LKT8xZM4G2PhntjROFsnSm+J?=
 =?us-ascii?Q?XnvxncwTzfq8gS9fMRDHGQ7LQL3Tfh+cDnfxlSZJydw6HKjBPxO8z0k8FjzL?=
 =?us-ascii?Q?GxKlujDTFITzFJHw4rWA0tsVAhcfLTaHDUocGxj155Ig9WRZeUjNZC4uLkPt?=
 =?us-ascii?Q?4zXVF+gsFkFPR9P9ErbWxeSq/atSEjK80EuhTxFwfOdLwg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1RH4aBPorbtir8sk33I1dTwJbzvt3HRoUp0AA6x1g3/2XG4TKJ9EVyTVBUb8?=
 =?us-ascii?Q?bzY9RE5y5aC07Gwe9vx9BDCzBQi74jrt0zvCW7VSi/kVzNjyOoGdtsJWT+zk?=
 =?us-ascii?Q?LycSK2Wig3hPERIUeeWJNgId1BiUoSqFRh8+SrWKSiIHB3IwNQli8BorZlNh?=
 =?us-ascii?Q?LExk7FMB/HaH0zEFbSj8i9D0q3I2VtuOENQ8jWW8pqancuj4+kSjuIQnzBNE?=
 =?us-ascii?Q?cP8awi9LraEJHgl8CaVOlaQanaT2x5VpR5bHsNgcrUyHBHqYTwjdVHdOfvbX?=
 =?us-ascii?Q?/KCQ7UrT8aLDXPlBx51/4QYVmbwtvqSzbPNV3w7wQkY4hvIY9eiSOCPeCOAf?=
 =?us-ascii?Q?qYeCLjs6P7TfDikFWuFKZ9VCCuHYZXrm8IDnOgvA9ODUCMYAEa+7DiOR8o7r?=
 =?us-ascii?Q?hQbCOQQUpRfyUkEirIZBMurnGm5Yvr5ut07qv1RqMsB6WIYXWY8HgIFAEMGb?=
 =?us-ascii?Q?be7g1CGZt7WjBH/8WhtXbLLKtdPJddRKTSkYV/Wa4SVGQ1xsqRw5gqDE4nrK?=
 =?us-ascii?Q?2daTDZBrjilhlwYXmYVz12ZWeSsIgWSYvkKchpHOKhNYsMRkvuY6coLe19hI?=
 =?us-ascii?Q?ihq2sYWGKECzfmpPRyngz0EKZNbxSBdS/vTtpSHjbi/MMJKoJXKFzOp46+9l?=
 =?us-ascii?Q?FaQg78+3Xf+nPnCHXasAD1CXG37IEJlx+x16fW+sNT9SJIGhBQgj++R9FtvC?=
 =?us-ascii?Q?s1En0eAkt7iC9MONO4GaoWarZwoOKdfIQc7xSCqVKlGcxn03LYTPhLHRviyD?=
 =?us-ascii?Q?0BGKNHl0RQOVHUO+snBXnrepkSPwNUrZLDijiNOFlXg05aej6iRnqDtCUeux?=
 =?us-ascii?Q?UwM78glZps0vi+pw2B1WMmmU7BzpgqxL/QCgRMgOHELtRqlH3T3Y/e7PUYaG?=
 =?us-ascii?Q?vILA1RM+kbGWd/yMYUF4HAK1w9tvuRqY11mLlzFD6fFjg62UJ3pKvvL1i2K2?=
 =?us-ascii?Q?1N8BCJfOy54IRuAgF9h8scsUsxFdkgvtERcOEFnffz70njIfgrocnNU9Xkqw?=
 =?us-ascii?Q?sg2IdN6cJ8TmLgRHLiB/xA2N5GufenpNURWFg2gqUiQcCa5PmCGHCBPaQdLA?=
 =?us-ascii?Q?4Z5UBLua2TdogVkfJvAyaMYXw0Ib8BrEHXMr+ZQdDlKzF+KjIG0WNGKNqzYU?=
 =?us-ascii?Q?SPCkBm9jSWS59Qa8OsuyxrthLXEnOzWdATWAkd7/DloCLr45GOEhU71uZlOv?=
 =?us-ascii?Q?+1UuqXvPKm2fmGY3Zlmk70gc1EbmD3K0XEQVuXFPL72q73xLOOKLbfzRBASI?=
 =?us-ascii?Q?0uyEtGMWYev6SJliJ+icn0NoVV0z2vFGYwbw9MRkDCGe+l1tjIQivfHIIgEi?=
 =?us-ascii?Q?VURRjuz+dHe8tQvJPlmLIH2B9khIh83yYj6gFCqx8dLR0sgN2RcXnwIvxRXI?=
 =?us-ascii?Q?RP6vO09yaziGjONdaaBCUgRif0BHaOt5uVoG+g0xPVw99zutPRZ3FcTtEMM0?=
 =?us-ascii?Q?W+mWiYKMugQGgyqhYQaiB+UBFgthIFW7sXKrlGU+j7AM1BG4ZRqt2CgLvf6y?=
 =?us-ascii?Q?at+tukcbGjm1JaKWXks75Q+L7kOQ7wM6owyeA9PIXVsWc1mkwcE2S0PfM3WV?=
 =?us-ascii?Q?ceOLT8bvGcbOSH/KbMfOR+CvsX7u36vCc43l7nGaNYr/wa8EXLiGgwnKtSNw?=
 =?us-ascii?Q?JA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a18ebf9e-13e0-4455-a853-08dce3a8ed93
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2024 12:43:06.0811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kQFSqvrVVraxsEb8BAaQjHMNlwHunrbD0ImfE6VekR3nNAb21zlruSAi8t42b/nv101v3MFAVUiqAb62UuUolw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR06MB9517
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Oct 2024 12:43:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112648

Add missing trailing space characters after =3D operator.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 .../packagegroups/packagegroup-meta-oe.bb     | 34 +++++++++----------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/m=
eta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 1ff53757e..a8565982f 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -86,7 +86,7 @@ RDEPENDS:packagegroup-meta-oe-benchmarks:remove:mips64el =
=3D "tinymembench"
 RDEPENDS:packagegroup-meta-oe-benchmarks:remove:riscv64 =3D "libhugetlbfs"
 RDEPENDS:packagegroup-meta-oe-benchmarks:remove:riscv32 =3D "libhugetlbfs"
=20
-RDEPENDS:packagegroup-meta-oe-bsp =3D"\
+RDEPENDS:packagegroup-meta-oe-bsp =3D "\
     acpitool \
     cpufrequtils \
     edac-utils \
@@ -115,7 +115,7 @@ RDEPENDS:packagegroup-meta-oe-bsp:remove:powerpc64le =
=3D "efivar efibootmgr fwupd
 RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv64 =3D "efivar efibootmgr fw=
upd fwupd-efi"
 RDEPENDS:packagegroup-meta-oe-bsp:remove:riscv32 =3D "efivar efibootmgr fw=
upd fwupd-efi"
=20
-RDEPENDS:packagegroup-meta-oe-connectivity =3D"\
+RDEPENDS:packagegroup-meta-oe-connectivity =3D "\
     cyrus-sasl \
     gammu \
     gattlib \
@@ -189,7 +189,7 @@ RDEPENDS:packagegroup-meta-oe-core:append:libc-glibc =
=3D " ${@bb.utils.contains("D
 RDEPENDS:packagegroup-meta-oe-core:remove:riscv64 =3D "safec"
 RDEPENDS:packagegroup-meta-oe-core:remove:riscv32 =3D "safec"
=20
-RDEPENDS:packagegroup-meta-oe-crypto =3D"\
+RDEPENDS:packagegroup-meta-oe-crypto =3D "\
     botan \
     cryptsetup \
     fsverity-utils \
@@ -200,7 +200,7 @@ RDEPENDS:packagegroup-meta-oe-crypto =3D"\
 "
 RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 =3D "botan"
=20
-RDEPENDS:packagegroup-meta-oe-dbs =3D"\
+RDEPENDS:packagegroup-meta-oe-dbs =3D "\
     influxdb \
     leveldb \
     libdbi \
@@ -213,7 +213,7 @@ RDEPENDS:packagegroup-meta-oe-dbs =3D"\
 "
 RDEPENDS:packagegroup-meta-oe-dbs:remove:libc-musl:powerpc =3D "rocksdb"
=20
-RDEPENDS:packagegroup-meta-oe-devtools =3D"\
+RDEPENDS:packagegroup-meta-oe-devtools =3D "\
     abseil-cpp \
     apitrace \
     breakpad \
@@ -315,7 +315,7 @@ RDEPENDS:packagegroup-meta-oe-devtools:remove:libc-musl=
:riscv32 =3D "php"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:aarch64 =3D "concurrencykit"
 RDEPENDS:packagegroup-meta-oe-devtools:remove:x86 =3D "ply"
=20
-RDEPENDS:packagegroup-meta-oe-extended =3D"\
+RDEPENDS:packagegroup-meta-oe-extended =3D "\
     bitwise \
     ${@bb.utils.contains("DISTRO_FEATURES", "x11 wayland opengl", "boinc-c=
lient", "", d)} \
     brotli \
@@ -433,7 +433,7 @@ RDEPENDS:packagegroup-meta-oe-extended:remove:powerpc64=
le =3D "upm mraa sysdig"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv64 =3D "upm libleak mra=
a sysdig tiptop"
 RDEPENDS:packagegroup-meta-oe-extended:remove:riscv32 =3D "upm libleak mra=
a sysdig tiptop"
=20
-RDEPENDS:packagegroup-meta-oe-gnome =3D"\
+RDEPENDS:packagegroup-meta-oe-gnome =3D "\
     atkmm \
     gcab \
     gnome-common \
@@ -447,7 +447,7 @@ RDEPENDS:packagegroup-meta-oe-gnome =3D"\
     gnome-theme-adwaita \
 "
=20
-RDEPENDS:packagegroup-meta-oe-graphics =3D"\
+RDEPENDS:packagegroup-meta-oe-graphics =3D "\
     cairomm \
     directfb-examples \
     directfb \
@@ -602,7 +602,7 @@ RDEPENDS:packagegroup-meta-oe-graphics:append:aarch64 =
=3D " renderdoc"
=20
 RDEPENDS:packagegroup-meta-oe-graphics:remove:libc-musl =3D "renderdoc"
=20
-RDEPENDS:packagegroup-meta-oe-kernel =3D"\
+RDEPENDS:packagegroup-meta-oe-kernel =3D "\
     agent-proxy \
     crash \
     cpupower \
@@ -631,7 +631,7 @@ RDEPENDS:packagegroup-meta-oe-kernel:remove:mips64el =
=3D "crash"
 RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv64 =3D "crash oprofile"
 RDEPENDS:packagegroup-meta-oe-kernel:remove:riscv32 =3D "crash makedumpfil=
e oprofile"
=20
-RDEPENDS:packagegroup-meta-oe-multimedia =3D"\
+RDEPENDS:packagegroup-meta-oe-multimedia =3D "\
     ${@bb.utils.contains("LICENSE_FLAGS_ACCEPTED", "commercial", "faad2", =
"", d)} \
     dirsplit \
     genisoimage \
@@ -664,7 +664,7 @@ RDEPENDS:packagegroup-meta-oe-multimedia =3D"\
     libopusenc \
 "
=20
-RDEPENDS:packagegroup-meta-oe-navigation =3D"\
+RDEPENDS:packagegroup-meta-oe-navigation =3D "\
     geos \
     ${@bb.utils.contains("DISTRO_FEATURES", "bluz4", "gpsd-machine-conf gp=
sd", "", d)} \
     geoclue \
@@ -672,13 +672,13 @@ RDEPENDS:packagegroup-meta-oe-navigation =3D"\
     proj \
 "
=20
-RDEPENDS:packagegroup-meta-oe-printing =3D"\
+RDEPENDS:packagegroup-meta-oe-printing =3D "\
     cups-filters \
     gutenprint \
     qpdf \
 "
=20
-RDEPENDS:packagegroup-meta-oe-security =3D"\
+RDEPENDS:packagegroup-meta-oe-security =3D "\
     keyutils \
     nmap \
     ${@bb.utils.contains("DISTRO_FEATURES", "pam", "passwdqc", "", d)} \
@@ -687,14 +687,14 @@ RDEPENDS:packagegroup-meta-oe-security =3D"\
     auditd \
 "
=20
-RDEPENDS:packagegroup-meta-oe-shells =3D"\
+RDEPENDS:packagegroup-meta-oe-shells =3D "\
     dash \
     mksh \
     tcsh \
     zsh \
 "
=20
-RDEPENDS:packagegroup-meta-oe-support =3D"\
+RDEPENDS:packagegroup-meta-oe-support =3D "\
     anthy \
     atop \
     ace-cloud-editor \
@@ -905,7 +905,7 @@ RDEPENDS:packagegroup-meta-oe-support:append:aarch64 =
=3D " ne10"
 RDEPENDS:packagegroup-meta-oe-support:append:x86 =3D " mcelog mce-inject m=
ce-test vboxguestdrivers"
 RDEPENDS:packagegroup-meta-oe-support:append:x86-64 =3D " mcelog mce-injec=
t mce-test vboxguestdrivers"
=20
-RDEPENDS:packagegroup-meta-oe-support:remove:arm =3D"numactl"
+RDEPENDS:packagegroup-meta-oe-support:remove:arm =3D "numactl"
 RDEPENDS:packagegroup-meta-oe-support:remove:mipsarch =3D "gperftools"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv64 =3D "gperftools uim"
 RDEPENDS:packagegroup-meta-oe-support:remove:riscv32 =3D "gperftools uim"
@@ -914,7 +914,7 @@ RDEPENDS:packagegroup-meta-oe-support:remove:powerpc64l=
e =3D "libcereal ssiapi"
 RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl =3D "pcp"
 RDEPENDS:packagegroup-meta-oe-support:remove:libc-musl:powerpc =3D "gsl"
=20
-RDEPENDS:packagegroup-meta-oe-test =3D"\
+RDEPENDS:packagegroup-meta-oe-test =3D "\
     bats \
     cmocka \
     cppunit \
--=20
2.39.2


