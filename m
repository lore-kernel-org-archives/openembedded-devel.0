Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED561CDB48B
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.52])
 by mx.groups.io with SMTP id smtpd.web10.89880.1697367079777818269
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=dFJmXpSO;
 spf=pass (domain: welotec.com, ip: 40.107.7.52, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e3idzjVU4tPd3DU2+n51Awc5EaODTZ5qlBIY3tjWT4vo96ToLbE23ttga/obmTikD8y5L073jvLc9QOpTqLtPGCe4IZc4jpJz2j+2056k9T5MOXllMcD+gsNTM5EJCrGw8UaJDC6zviDP52Zj8KhriAY04Nt1scNcnznwBvtVa11iZ5Pls2K4cPeOctDUcyfF6qsP8+q32CIfPHiFYozr8bevGM7wAHry62MCjk8jhhDu9SlMJhYbgaT+uDJtntIZtaaI2bGEYWykVhHZOJcojvFaOSWVQ3xoLUWIF49EWS/Tsg8MjPoMnOsRUFyGJVnD8T1QIKdHwdclmeNucZUWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=jYDtOS0lnNVE9uw2rR+1sfoydiWeton94hJZUblbXflGalZqtGbsSwi03d1Au3spKv+CINtSYxsgeLG1+eJbzgB2cyssqsTatjX3KAwfEbXfm1CLGHGhs3tSOAwgQY1L4ys7zZs2UaXf5lHKCWmRvpTOWk0gaCt33GCGNGhTqoO/kRnoMjt0z5JL8oekvzIh4zimEkEgS1HQDqAIzSNO0wI8P33r1HLd/9NnFXhFZ1K8w8Ily1n+zowCAaniyX1n+80R4RkPd6HrnKAx/g2V+kn9np+F1uz+TZIreLgUeY9pALsTHaErtkZ085jIWK4zVpB9FVUWBwm0xtfFkaPuHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=dFJmXpSO8vCIUCac3kiHJ10Ik46COOm/kKtAgfLaccgnqcch4KavqbF6osQQR5dBhXSoSPGQZMZrqn034eZDmMj7FcWuIv//XV4sR1i/kh/N1/J8i8JhR0s9u8la1Q+mXisdFxIdbQRdjp0Ymok4lV114nbYqGnm2LNKv7Qvw4O4Pv67FtWS+lOOq5ZFxUwc1tFlqhTGOrZ108VzzHZXDJZEMKQUoPDj+vqWwRCU1YbLAeT0pmNxdRx1siI+Q1Gm5xA6OPkx77zks2+7vnKZ4Pujdw1n+8QRHbUu53uE57kRo0ZX9U1whvwcRvRxgAWG+9GcJd7USXQWcYxoWKAsaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8308.eurprd04.prod.outlook.com (2603:10a6:20b:3e3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 10:51:16 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 10:51:15 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 09/11] opkg-utils: add acl and xattr support
Date: Sun, 15 Oct 2023 12:50:53 +0200
Message-ID: <20231015105055.52510-9-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 4783be3d-bafd-4374-11d7-08dbcd6ca7bd
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	NnqO91rXLbcA9SZ63rfysT1cI7WEY6+b8X+9UheM4cP76AAUYhvFOP/CptVudFgUb36af8TAP3cVAZgaIjNJZViXjatBb/iN1xkds2ZJ1/BHGRAt2op5oobcUG0GNF3wSwMrfkXyEypDfeZ2xDvnCLCz+0B4FJ25npIS6H1b6EyM75gcE7h3jdE6borQqCnwMEmunvYzuYaesS/FXwbKN/38tR968ph3sVxarIa9ZBT46aZP1tL/0kcNg91xAlRX7YcEh5bxHS/h1fHkT3tYeu+S9qOlCO/2GBzTdueAou6lepsWPxb08t/B0K0A+o6qh/I8nu91Etfv3TUu094H+TaLfUpvHia/Jz4+9uERT4bYtjN0iBnJgtvqwQ6pCR0+QJKYqjeK7Vofwdu5cXJo4S9pwXNmfCRhgCrPvoganKt94ilLZU96G/JL22BGbjGQSQkaxp+bzHioekFAqvkAN0UK1eVC8eC7cK0jBKdlD+hZJ6GTKKoG1WW4w5mUVOE03IktVzkUDKtFWgPLYsklaFyNsunTrdpD6uh3BumqCEU3w4Ofl9OVT7GcFZDr5AnXuYzYuGp4Rg+kIKr4q+11GOZ9ihjTab1a/qWXfnCpZVY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?13M3j9HtSRW8XkcnPxMBSiNFyCqnGHJz6p2irSqToGhZm60+GfE09VEb7I+u?=
 =?us-ascii?Q?C7nolsU2AE7T6LqeDyA7C1pRZX1vlf+1JqtGadpwZsChYw5ojzKLZ2Gp5r3+?=
 =?us-ascii?Q?4/OUu/DLzRXB5uOCFXOYw6UXHMbCkMUr5bqveeW9t7qTAxFCTP5TJF2/y2Bb?=
 =?us-ascii?Q?oID/VTShJ0beyOMm6hYtYLqrGtQGJFiLk/6MaMLA1ekJjlir/eam9zmLx363?=
 =?us-ascii?Q?vY/ZoKOlwME1ZGT0nPSD9+/WdzwkY98IPhFQEjtmcQ3nipYEjkshco8i0cOl?=
 =?us-ascii?Q?/elSYaFWqNgnQ9vVumRiLkT0rtqWwujvOwjpdIEFjnaYXAX4ej8hxehy2gry?=
 =?us-ascii?Q?X2k0Uw92YF7PCgab3oywl0lGZHqDy/vQV+druSAgZ2381QOpByfHsejnGN35?=
 =?us-ascii?Q?1iQVfNS9KveOH09AKu0DrLYfJk1uynggVWfziKU72BhhgL5ArmG0lotLOWoh?=
 =?us-ascii?Q?39abW/JXMFtHtpziiJTLGU/uTgpg3Cfcr7ASIS6T+3IZ4LzU2gRP+4hiIysG?=
 =?us-ascii?Q?9UQegn3Kb2DIfmQdyjNG6kZTb5Rc8k7++QMeWIfo0DJ23sR+5htzjGV2w7XB?=
 =?us-ascii?Q?VgdpOWB/fnOXW8mbB5iAHjTMAz2QA5UxiK6mrXK0iyg1jnmgIXNCksbfsMtS?=
 =?us-ascii?Q?u3x7rP8Lmm2BFk44n+7p7YWZTc9O4O3guFGDcIjGMDqoDS5Gs2NpBSp1JONu?=
 =?us-ascii?Q?ZFXkyY5FjFsZANHRfRHa5qElDFRRoT6Pi5vuK6DyF7NXlua7CLSC8DnwK9YM?=
 =?us-ascii?Q?3sYoFTiSV4OVSZHBPLkcHDzy2jc2lhJ6bni3qaIT0ewOUoQXExlTQvSGu7Tz?=
 =?us-ascii?Q?7aRZAbA2/oFHz9TsdBDAd2rAnKoPPmu9UvcjM0HfElZFy56LGc5hLtPfBOCE?=
 =?us-ascii?Q?Su23VUSMGhDN31aG7NFwZznTPlnboGePp281a49TgBCKG4xVhYcaZW7vAI35?=
 =?us-ascii?Q?R/r+XPp9bHRvaTOXaAOSU7LSeIFZS5c4RSUz0HlZYcZkiOq1ohzDKLoKrGsZ?=
 =?us-ascii?Q?qQHHiFe4LbpkkGqb8VWA4zg+Nw8fhC1eYQ2lD1gZNZ2I0l08CGLwBlHBwAyG?=
 =?us-ascii?Q?mKhoLLjcJbDzZA5h5nuLcceqKYk7g0SHBvHJKC2IzPwIcRcQMMHczYKHMEW0?=
 =?us-ascii?Q?jMThbyhx2Ba7R7hnZUza+jjBIN2uHSbGQE3pGCB56Drdi/DU/aZ8N3qgO78v?=
 =?us-ascii?Q?JKrVZ0VEO2rzuFtoxo2Go0t93F/k7esRScVZZpi8bacMQRYeRqyUpEyYLCrm?=
 =?us-ascii?Q?Nfo15RYZMIkkPi0DpRCtFxE5JYf8VJbUNvcQ1PoCLcaj50E+phuGP/y/grJ0?=
 =?us-ascii?Q?JiObQOT3RPKG7cF8wbM1XbrvBJgFKwZpkM2nU2W6Xl0Aszxhsi7HeZlkLFsi?=
 =?us-ascii?Q?B7Mhp1PNPnn8VgU17OFIBTE8Jl9/UWMmyWjl8K7geTd5iS2343Cr9yDT82mV?=
 =?us-ascii?Q?XEdcQlgfrvaaFZYnxPEcxdaBXWYfWiZBAcdHxwqh+ZgLMhpKfffJdGTL0HTC?=
 =?us-ascii?Q?dUgk1YybExAHwRmKw1bbiqgeKP5FQNdv8Wl8LITIU6hv77CvsDLRtuAvXhiP?=
 =?us-ascii?Q?GUjy/htDiMiNOofPnfKAYXBFXobGb1gls2+j+B1C?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4783be3d-bafd-4374-11d7-08dbcd6ca7bd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:15.8559
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7J1mB9b9pL1bVAU7A9zYLB6JX3R8FGi+pSpwCCnEX2kSnFrau+YTnIucVQfu62/6roDj4O2cuL8RyvatU/U9mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105502

Add support for tar archives created with --acls and/or --xattrs options,
PAX header format.

GNU tar and libarchive already supports ACLs and extended attributes.
We can now add this support as well to opkg-build script in order to use
fsetattr or setcap inside do_install command and end up with a file in
an image with the relevant ACLs and xattrs.

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...kg-build-Add-acls-and-xattrs-support.patch | 174 ++++++++++++++++++
 .../opkg-utils/opkg-utils_0.6.2.bb            |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-b=
uild-Add-acls-and-xattrs-support.patch

diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Ad=
d-acls-and-xattrs-support.patch b/meta/recipes-devtools/opkg-utils/opkg-uti=
ls/0002-opkg-build-Add-acls-and-xattrs-support.patch
new file mode 100644
index 0000000000..6cc81d3241
--- /dev/null
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils/0002-opkg-build-Add-acls-=
and-xattrs-support.patch
@@ -0,0 +1,174 @@
+From 8d9953dd8d589e9b740307976cbe474e0ce292a0 Mon Sep 17 00:00:00 2001
+From: =3D?UTF-8?q?Piotr=3D20=3DC5=3D81obacz?=3D <p.lobacz@welotec.com>
+Date: Wed, 16 Aug 2023 14:59:35 +0200
+Subject: [PATCH 1/2] opkg-build: Add acls and xattrs support
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+Add support for tar archives created with --acls and/or --xattrs options,
+PAX header format.
+
+GNU tar and libarchive already supports ACLs and extended attributes.
+We can now add this support as well to opkg-build script in order to use
+fsetattr or setcap inside do_install command and end up with a file in
+an image with the relevant ACLs and xattrs.
+
+Upstream-Status: Backport [8d9953dd8d589e9b740307976cbe474e0ce292a0]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+[2] https://groups.google.com/g/opkg-devel/c/aEGL7XRXfaA
+
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ opkg-build | 81 +++++++++++++++++++++++++++++++++++-------------------
+ 1 file changed, 53 insertions(+), 28 deletions(-)
+
+diff --git a/opkg-build b/opkg-build
+index a9e45d4..fb0873d 100755
+--- a/opkg-build
++++ b/opkg-build
+@@ -145,6 +145,7 @@ You probably want to chown these to a system user: " >=
&2
+ ###
+ # opkg-build "main"
+ ###
++attributesargs=3D""
+ ogargs=3D""
+ outer=3Dar
+ noclean=3D0
+@@ -153,22 +154,6 @@ compressor=3Dgzip
+ zipargs=3D"-9n"
+ compressorargs=3D""
+=20
+-# Determine if tar supports the --format argument by checking the help ou=
tput.
+-#
+-# This is needed because:
+-#    - Busybox tar doesn't support '--format'
+-#    - On some Linux distros, tar now defaults to posix format if '--form=
at'
+-#      isn't explicitly specified
+-#    - Opkg doesn't currently support posix format archives
+-#
+-# It's easier to check for mention of the '--format' option than to detec=
t the
+-# tar implementation and maintain a list of which support '--format'.
+-tarformat=3D""
+-if tar --help 2>&1 | grep -- "--format" > /dev/null;
+-then
+-    tarformat=3D"--format=3Dgnu"
+-fi
+-
+ compressor_ext() {
+     case $1 in
+ 	gzip|pigz)
+@@ -197,20 +182,24 @@ compressor_ext() {
+ : <<=3Dcut
+ =3Dhead1 SYNOPSIS
+=20
+-B<opkg-build> [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a>] [B<-O>] [B<-o=
> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destination_directory>]
++B<opkg-build> [B<-A>] [B<-X>] [B<-c>] [B<-C>] [B<-Z> I<compressor>] [B<-a=
>] [B<-O>] [B<-o> I<owner>] [B<-g> I<group>] I<pkg_directory> [I<destinatio=
n_directory>]
+=20
+ =3Dcut
+=20
+-usage=3D"Usage: $0 [-c] [-C] [-Z compressor] [-a compressor_args] [-O] [-=
o owner] [-g group] <pkg_directory> [<destination_directory>]"
+-while getopts "a:cCg:ho:vOZ:" opt; do
++usage=3D"Usage: $0 [-A] [-X] [-c] [-C] [-Z compressor] [-a compressor_arg=
s] [-O] [-o owner] [-g group] <pkg_directory> [<destination_directory>]"
++while getopts "Aa:cCg:ho:vOXZ:" opt; do
+     case $opt in
++	A ) attributesargs=3D"${attributesargs:+$attributesargs }--acls"
++	    ;;
++	X ) attributesargs=3D"${attributesargs:+$attributesargs }--xattrs"
++	    ;;
+ 	o ) owner=3D$OPTARG
+-	    ogargs=3D"--owner=3D$owner"
++	    ogargs=3D"${ogargs:+$ogargs }--owner=3D$owner"
+ 	    ;;
+ 	O ) opkext=3D1
+ 	    ;;
+ 	g ) group=3D$OPTARG
+-	    ogargs=3D"$ogargs --group=3D$group"
++	    ogargs=3D"${ogargs:+$ogargs }--group=3D$group"
+ 	    ;;
+ 	c ) outer=3Dtar
+ 	    ;;
+@@ -232,6 +221,32 @@ while getopts "a:cCg:ho:vOZ:" opt; do
+     esac
+ done
+=20
++# Determine if tar supports the --format argument by checking the help ou=
tput.
++#
++# This is needed because:
++#    - Busybox tar doesn't support '--format'
++#    - On some Linux distros, tar now defaults to posix format if '--form=
at'
++#      isn't explicitly specified
++#    - Opkg currently supports posix format archives, but gnu format is l=
eft
++#      here intentionally for backward compatibility
++#
++# It's easier to check for mention of the '--format' option than to detec=
t the
++# tar implementation and maintain a list of which support '--format'.
++tarformat=3D""
++if tar --help 2>&1 | grep -- "--format" > /dev/null;
++then
++    # For ACLs or xattr support, gnu format will not work
++    # we need to set posix format instead
++    if [ ! -z "$attributesargs" ] ; then
++	    tarformat=3D"--format=3Dposix"
++    else
++	    tarformat=3D"--format=3Dgnu"
++    fi
++elif [ ! -z "$attributesargs" ] ; then
++	echo "*** Error: Attributes: $attributesargs, don't work, without posix =
format, which is not supported by host's tar command." >&2
++	exit 1
++fi
++
+ cext=3D$(compressor_ext $compressor)
+=20
+ # pgzip requires -T to avoid timestamps on the gzip archive
+@@ -301,21 +316,31 @@ fi
+ tmp_dir=3D$dest_dir/IPKG_BUILD.$$
+ mkdir $tmp_dir
+=20
+-build_date=3D"${SOURCE_DATE_EPOCH:-$(date +%s)}"
+-
+-mtime_args=3D""
++mtime_args=3D"--mtime=3D@${SOURCE_DATE_EPOCH:-$(date +%s)}"
+ # --clamp-mtime requires tar > 1.28. Only use it if SOURCE_DATE_EPOCH is =
set, to avoid having a generic case dependency on tar > 1.28.
+ # this setting will make sure files generated at build time have consiste=
nt mtimes, for reproducible builds.
+ if [ ! -z "$SOURCE_DATE_EPOCH"  ]; then
+-    mtime_args=3D"--mtime=3D@$build_date --clamp-mtime"
++    mtime_args=3D"$mtime_args --clamp-mtime"
++fi
++
++# Notice, that if you create an archive in POSIX format (see section GNU =
tar and POSIX tar) and the environment variable POSIXLY_CORRECT is set,
++# then the two archives created using the same options on the same set of=
 files will not be byte-to-byte equivalent even with the above option.
++# This is because the posix default for extended header names includes th=
e PID of the tar process, which is different at each run. To produce
++# byte-to-byte equivalent archives in this case, either unset POSIXLY_COR=
RECT, or use the following option:
++#
++# --pax-option=3Dexthdr.name=3D%d/PaxHeaders/%f,atime:=3D0,ctime:=3D0
++#
++# https://www.gnu.org/software/tar/manual/html_node/PAX-keywords.html
++if [[ "$tarformat" =3D=3D "--format=3Dposix" ]]; then
++    mtime_args=3D"$mtime_args --pax-option=3Dexthdr.name=3D%d/PaxHeaders/=
%f,atime:=3D0,ctime:=3D0"
+ fi
+=20
+ export LANG=3DC
+ export LC_ALL=3DC
+ ( cd $pkg_dir/$CONTROL && find . -type f | sort > $tmp_dir/control_list )
+ ( cd $pkg_dir && find . -path ./$CONTROL -prune -o -path . -o -print  | s=
ort > $tmp_dir/file_list )
+-( cd $pkg_dir && tar $ogargs $tsortargs --no-recursion $mtime_args -c $ta=
rformat -T $tmp_dir/file_list | $compressor $compressorargs > $tmp_dir/data=
.tar.$cext )
+-( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion --mtime=
=3D@$build_date -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $t=
mp_dir/control.tar.gz )
++( cd $pkg_dir && tar $attributesargs $ogargs $tsortargs --numeric-owner -=
-no-recursion $mtime_args -c $tarformat -T $tmp_dir/file_list | $compressor=
 $compressorargs > $tmp_dir/data.tar.$cext )
++( cd $pkg_dir/$CONTROL && tar $ogargs $tsortargs --no-recursion $mtime_ar=
gs -c $tarformat -T $tmp_dir/control_list | gzip $zipargs > $tmp_dir/contro=
l.tar.gz )
+ rm $tmp_dir/file_list
+ rm $tmp_dir/control_list
+=20
+@@ -331,7 +356,7 @@ rm -f $pkg_file
+ if [ "$outer" =3D "ar" ] ; then
+   ( cd $tmp_dir && ar -crfD $pkg_file ./debian-binary ./control.tar.gz ./=
data.tar.$cext )
+ else
+-  ( cd $tmp_dir && tar -c $tsortargs --mtime=3D@$build_date $tarformat ./=
debian-binary ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file=
 )
++  ( cd $tmp_dir && tar -c $tsortargs $mtime_args $tarformat ./debian-bina=
ry ./control.tar.gz ./data.tar.$cext | gzip $zipargs > $pkg_file )
+ fi
+=20
+ rm $tmp_dir/debian-binary $tmp_dir/data.tar.$cext $tmp_dir/control.tar.gz
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb b/meta/re=
cipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
index eb88b9b734..d5ce2cfbe2 100644
--- a/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
+++ b/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb
@@ -9,6 +9,7 @@ PROVIDES +=3D "${@bb.utils.contains('PACKAGECONFIG', 'updat=
e-alternatives', 'virtu
=20
 SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dhttps;branch=
=3Dmaster \
            file://0001-update-alternatives-correctly-match-priority.patch =
\
+           file://0002-opkg-build-Add-acls-and-xattrs-support.patch \
            "
 SRCREV =3D "67994e62dc598282830385da75ba9b1abbbda941"
=20
--=20
2.42.0


