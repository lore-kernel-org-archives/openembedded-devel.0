Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBDE7CDB483
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:06 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.89849.1697367728016861852
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=t6avzhfi;
 spf=pass (domain: welotec.com, ip: 40.107.21.80, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TjDCoSOKjUD3s6ci8VwTBPHSv7iCgV9CQO9hvv/c7cgXjxaYth3pu8PvJDqFDU9/Nw1jh1NI9+zeYDBHNY+ILNfqJkEcyLQMHvBbZzi30H2k/GCd2R8XJYuNCCeLRgF7Y9oCQnnJ8zneUVSjVtzllDsu8Ks5+j1AHG4AJoSOgQ8Kcd0AWjXOTi4bN2vCzEVVEH6FTMOjk2jZ0mstz1uNirp0bVt2k2/AHoYzUTuv92MC5dbH/h0xNMFiEIH/zTII0PCkYaLB89V2rfali7kOVxzi1hjXDurdvi/8tbXvE9HdlWvoZaM6IWwmDcBogX/l/NQo4agYg5ovG9y5HuDhdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=TKg7dJLdewCMOhrRxiPmBhdrRglYnZhxsNYXKeBwN6CILY6sJBiuJcnMtHjAJnJ7mIzWaMB185ScETZ6yRx6s9Tx1dsqE/FxAUyyXS40pSTBm51YMqvt71BekmXLKe4JkNGH9RZfLtZN87G7gv0YVErDNl1UgC2mk0msOorDG+pqqlwQifjRzIAC+c0y6xYWluB0W0mRw27I2sGHQ2RbCAIRCZODIJZbGyPqDYN+8SN15pV3JhK7ea9IkL8utcba73sR5Hc9oe+08hBx5yWoic9+tTT8AtiNBq9e9rK6qWMCz8RAv45XeB3RXn4L0PUwsMa3bhnEKlWnNPR/5D8ERA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=t6avzhfi7cBpVSoa+SEhYUQrqddrB9uMT5PTZMjKu8YUpa1f5cBhYWhrs1cTVi6Yq8Csa72qIhoQWdFgyWjYamRbdn/LI9eJ2FWIl6l9RrC/IorPDM85TrTEv55wIJPtyq3dsl11KyMBpChHp7Yb44vpS6DR8QgiQkg89HF0etpb5gsnLf/i4j7jlg9lB5ho/MhpDhvG0XToN55AKn3BAKnblCxFxwrmOab1ayYdzTs7lounq0R9Bd7FeFL9pNxwyxrif5lV2mCplbDBFdZ5Vw6kqzYPCJfCLCIXhoMGVjsUcC2NCr0DSdyL9KRbN5gw3m5w/HN8GnzGeNC0IaZa0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AS8PR04MB7925.eurprd04.prod.outlook.com (2603:10a6:20b:2a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.34; Sun, 15 Oct
 2023 11:02:08 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:02:08 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 09/11] opkg-utils: add acl and xattr support
Date: Sun, 15 Oct 2023 13:01:52 +0200
Message-ID: <20231015110154.53364-9-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: b799003a-e02e-4b55-dda4-08dbcd6e2c9e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vodsusK7GEVikftCS4q53CHzE6iyvAwT0+BA4XTwzJy8eGaG55L/fmtcfLsZq89x8NRO81abnuHjtaG2U6ZL9zXg3XZ7WnwwfZy3hSGit3H/lS+Xthi9zTgpjtGNvscDLTsd2NwzqdxrX/hu+957yluE/K+GuN6NHVihylpU/d3wNoVmHvc+lp4eV03mQ54OzfQPUMZ1FCMzCz/Addo9Bi55aKxGTofGdAnZHe4iuqVm+jcSZ6kef8Zdbdrr0wFXO+95A5y97i9uJXffelKX9NhaiewCX+w1tYH4k3egNBdE9DajH2oiDkl8jWLYaPHnj1EmpheVQgmQentWiSpcfBisnqpGsOV6oNLRM1j3sQaqCdfkTkBAUdwH8K4Hf1I6nNNsxnrYhUlfTTyJ1S3WPThvQrTOM+EYLxJXOI/SM6T4iaT5WhcGx8qGwnxneRniSacoaQnTTaPVa+rxxzJrRNXUJXOk9N/6/PAL/ye6lqvAuZwg7QH4hwH+P7SL2hhEgIcEOAj8MQ+3WXmSaIlX+INbIQuxzHuDx4slPqlwbMveXgsot5wHHkkj4CMLmtxXsgYwaTUEksLYoTJeIwWypGrgb+FXLD8gEfxLbiZWgI8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+y9tIQeyxOb68HQZk8ETvtmMvoaRLUk0PFOscaQTKpyOfMNQysJq0XIPNdG/?=
 =?us-ascii?Q?TnAbuyK0CD0f2GeeNAniTxDE+930yFMBkeYVCM4z2VyfKnW2nlKepyPhir3k?=
 =?us-ascii?Q?mmC7RRL5dYfqV/o/wmN/T+X2Hpayxmd/NJ+XJa4gM8VMdbcZ99HFOGUJQHEU?=
 =?us-ascii?Q?LBa3UpOb9dgo15McPutbYDOwVqS+Eya3+1lhurT9e4ryOvs/D/8jk9+RP4c+?=
 =?us-ascii?Q?856H96TIDb/5eGdwba6JT06KxlPMgyGM5hnoAuYg91/vMGpKBuRSUPOpQlPT?=
 =?us-ascii?Q?LBjE2uqQ9vAtuCp4aQz82aou7v8m1BfoaAiaegyPHqNJXvYidRqxVyqRpvgK?=
 =?us-ascii?Q?bz7eZY4AWXWgZxDnVtv4Ng8dUTu3/b+Mz3C5J4vxNPxk6DYdxrzSHu25vBNt?=
 =?us-ascii?Q?k1WxiLRFfyvy1tvajjLjilJffObZQAI+uP2KoPOkcIiBfpEMqM/9VmBGLfox?=
 =?us-ascii?Q?NdfboMn2Fm2ofHTlD/BugWIKEK74VLRoUTn570twEldmOtuKCpB7nCiJ4lu+?=
 =?us-ascii?Q?Dl5QNaHDNqZ61aJxF8dK4ilR6ifdllF43p9txQok7rm7hO6I6id2bseY3f8t?=
 =?us-ascii?Q?Y1QccAsk5RYrNMFHml5zFyvanw0cAIvzJwlhbxYMOgqpz6wwOjve1MGCZUUT?=
 =?us-ascii?Q?CFIOh5UHRHcaXiI+/VEAT3o/CF44ivw8c3i73RjRwipFMDGnYrXE6sO4c3Ur?=
 =?us-ascii?Q?KyQ8a9T5AGDUxb4498osPMrTizyy4FNIE7QTDFNZMgH7nhMpMe7zK31rZ9Mz?=
 =?us-ascii?Q?H2E4DJMUxFs4hFV6vOZ9NUmvijSluWVngFNL+temE89i1pkA2YKis65tDLNz?=
 =?us-ascii?Q?DyEfxJ9CNP1m+EAApQR5y3oWAcd2FJ6B88HmfhpYVFa7Y3jyIq/UY4sAr/U1?=
 =?us-ascii?Q?IKxoPGFP5pY9EqI8qjsb7TIFQKXP6GNsdQh+ELyjvbATEu/h8WCto1w/CBRq?=
 =?us-ascii?Q?zOWs+jztWhZvofWoXAzEXYxb9ulfqV6rpJe4wGY6H0UPps7+IS+95W5SX9bG?=
 =?us-ascii?Q?9IjQkBxyHo3IrCUY2XiQXJDP/3y41m6G0c6H7xXVSNqyHLBmnB9zakPlfdMJ?=
 =?us-ascii?Q?UHzJ2HXBqpDYo46lH461z7wc94ZPHgk1/dZWYbsATWiJ69iRCME1h7hB3hVD?=
 =?us-ascii?Q?x5xsxz6/KW7EyoW2ENo7Hvzqrmn8ie/0np2jKQEmaFyC2Wsw9QgtJSmyxxxX?=
 =?us-ascii?Q?caf1nixY6fCEazsC06Q/ZcotyeWq/4KEAFYg8otWmvxzLnLpqRqs6qSOrY5d?=
 =?us-ascii?Q?kk8+i/r7DTLfYgk1keAHtUqT6CAywMRMmH+ClMh/cyxrbVGeTjJVcjmPf2FG?=
 =?us-ascii?Q?alIItZdzV4nibVh2AMlTPT7JtSsvkWId4oh6oYOOic7Vko4S7+gTdOdJcO2m?=
 =?us-ascii?Q?dML+BhCSWOhCX5kE49NdfbM3ew1RQhGvZ0pvLiVgx5kK3x/5sFsxzkRie0y7?=
 =?us-ascii?Q?upF2mWbCVChmKluIbR35PgQf0XZwtAY65EzGy6AiMBAdIzixVPAqD+uYxEfy?=
 =?us-ascii?Q?Uo4lMHuaS/oQ7yZmAvvxlKl0Bgkku5kmFF2e9PLB8G5P5uXF48F3fNaXUzyo?=
 =?us-ascii?Q?61hfZTfoHtLACWs419ukrhGTCeuXXznFEy/vM1a5?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b799003a-e02e-4b55-dda4-08dbcd6e2c9e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:08.3418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3M6/EZLYFaSOqaKddJ3ElJ1asUkA/HiRkA+2JTfKJfuOhq4P8uws1RUZhVsilygqeRpxwXZIs+vewGZ5e+j7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105514

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


