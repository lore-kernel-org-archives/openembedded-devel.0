Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4182ECDB48E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.89880.1697367955844343434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=i9h3cl8t;
 spf=pass (domain: welotec.com, ip: 40.107.247.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a85oUXyaJ3eq21IoTuPLGEYLsfe7EiPPp0DraLhXTgQnxL6EFX6B59kzi6uzq7pwauvQl2mVOe9RvEE3cqoUlmDKniiNmt5yLKJVlC8JRJoQhX0BKvEHyf3rFlCHdABnqLN5WhtG+rJ2zxKhSC9TyIUu/+YKxvXFDkNIOeEBLsk5G2RT/ZkXJAWoy+IFI0n4aB7iTb6AEKdiInYHzFd61Y388spIY4LPwakCel0EQhmE9w8K4t7fOPCyxSlSrJy9UYhRV5vlTaYlUYR5U1oCYtbH1OODy1r7s6liUUfh/4pJDrk2smQy+dpUdM3U/HeTmRH/065QIH1MQV4VAmzEZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=J4P7sBpzLKpv6kkMHkMap+0VXXRiesod7PKaZFdW+9QsZtf148d2Pjm4GHZWuGRTEnn3BWE0CFiWqs9XiIJF7e7nGooiVpERvi8pEOjMhkyl4yValz/BIBAXlHD3yEM74VV8E3WiaKeYyfhOE73vJamCSJJcfZ75jMhqJgFtcp7QxIZXQJP+/U0YRQUEjpNUwmtfOU6PfAyCJk/QEyyGCM4ys/ftAI70EmF0Bl+NM9r+eM3591zqAE6A3DlQR7WCsjJ30E5/d28jxjFW48IINxlZhPoF7uBlxLjGZf+1N4feHntGonsKrHhGdVpuuUqCU8UWJmhyiSfXUTAk+e1TgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=i9h3cl8tKCjXqR41w0ikYdBauIMCdP3oAm2wkGLWaNlCJas1mQ98tV8COmgAds/2JmPve8VnhDkrGtAMwCICVgKs77gQNrRnO1wzCgdh3NmVwybDHLshZIGMoS+rkF98viZKtm7IUMCk1RsBBlp16YW5vowsnUsYhGhXuZ7aMZL2HK7GMl/Bgpx/gROtS+7pVREOPIpGG8lde6OOYOAtBrJisqGxE5fbV/0SLu6fHzsyM229kPqZ+VFOfR4xiRrtrNW/7Mm6MlEwIR7pdeyaeeL0+Cy9Lrgn4BCBrT3xwIu0jwTudoaVcn8BliHswEqLi1Fci6ZjHRC6/i7qYoEysw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Sun, 15 Oct
 2023 11:05:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:52 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 09/11] opkg-utils: add acl and xattr support
Date: Sun, 15 Oct 2023 13:05:24 +0200
Message-ID: <20231015110526.53738-9-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3865a686-7da0-4fcf-6116-08dbcd6eb24d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	95nzxEniITFNSJFySo3/WMyhnn3K3VwdBXw7A+Wy8VWa/38wCRB2j/dyw8OCmJiWapVTmqGwEFp9iTWA2nebWf0Om7OrUwheoi/TourZSnZApWU5PvLwHRjrqhf3ossTyY8aIGRGvwKD1W+8YmkajNZqi7xqGQqlx8a3WuBA2VRCoygXnYgmdiYApnKTRwbOwav+2S+xNVKKqDQvZQo9iKMGcCqp/uG9keU/7IXA0fsYv/mZaUMsnN8GViobuiBy02DMzxDugFxblGQEr8xCxm5xnyTLeRfq7D0nH0ktjSZ0VN6PSgMbNoSxxucHOu/aqc4V6l+nRGf3T7erYlz0Fgjtb4MtjZaNXiXnLMQutjlNUhLCwS0GEQSwStsHs6Ly3VFxpoB+9MC7WInax2BEFBEMQbwGc+M7gxeLxLkG2RAZ1hR4lOvWvqEuVMsbGS8KWRdwQBYiXFsEOPOUFiS+HCD6ujMw4cryzC4dRodZYkTatbgXu3FC3E5ZFuz6VN3/1/TBSr6eW5hEE2Rh9/wXtdA3eE/vjTKmK4XEfnaaO+uzsxj2f8tZ5XJelgqAOIF/b0mAsDEO16k+/k39EnjGmwBlqoYeVw5pq+ece/rVioc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Iej5FZi7A+zwlKUvGsbeEyMwb+o/ZfDKX+spBk37C4/8eI8opSGvz7I+7RID?=
 =?us-ascii?Q?pmzA0MAd+zjmcpi4IFEqWNojNm6nKNej6JWvdJnbgk7oYmnw0Cg+tjS4fEUS?=
 =?us-ascii?Q?Y15Vs2gv/2ljCt9cSodcvpijf9xtAmejl++8wtPVSXQT/Yzw1OMvC96ZF8Av?=
 =?us-ascii?Q?ifPF+jZ9GNz+rCQ5josrYcIvMjAucuCwFfGoq8gGjFSk+ED1Q93+Qf/La4Ev?=
 =?us-ascii?Q?tZcycb5k4D0jLigRnJ3bKEPizCpILuT4eDvD+8yGxjlF6mbKIOBCGjq9MNWw?=
 =?us-ascii?Q?3mb+Ov4IPrgu0WLvahIoziMKArCeJE+Eu2/3eKoQ2RaDexemsMKIMJmpCz/c?=
 =?us-ascii?Q?anKCnrxAVWiKqwFuD1dOM56rdU3WbPnRUfOnxeJmhHoVHq7PaFh324GICSiw?=
 =?us-ascii?Q?dtDwZwzAUsyu7XY3zSxmcxNAMXh2nYLJS1VCHj00R6boqKKXSUT/J/fr/S1y?=
 =?us-ascii?Q?PENbmxufFg3eKx+s5Z66GPqBv1tblJuAafYdnTwHkIn9ca5IYk13mUq+zWjs?=
 =?us-ascii?Q?LucduJT1C4yzZVE02Op+QMRy7fdQtKXHQ/RAm+4woDodG/tfinZ/7kasKZi0?=
 =?us-ascii?Q?iyXAsGziD2VY2PRFhf6i2LbQaL2aJe+1p4eNfzU44wKK/t+9iILEcl2FyR9n?=
 =?us-ascii?Q?sbPsOx0um1EJSf+7GCvqKEGlaNKC54QM8Oh9QEA5ZK8AGShsqsr1+I7M8Fx1?=
 =?us-ascii?Q?Sn026MZvYcY1rAdft9Fj9HRTtNBQOaTocyAWXc0zwIJlkvlWw26C1IrQA3aH?=
 =?us-ascii?Q?hFQVqU+KkkhPVW8FKMFxva216VhMyb+97bB3OzUaZRwZozV3BiJs6OOF3eLK?=
 =?us-ascii?Q?SpDVVc/0t2LEwwGAF1DBy9T5vhomrystpWJw48rzS5CRY/9bkBKm2ppYM6Yr?=
 =?us-ascii?Q?enwokk6fpSglgjVM3lLe3djX6U/GIcPHQc3tfDcM72twYWQbZxQOg+/nhA9m?=
 =?us-ascii?Q?04Tnt/3ZBIiqy4odR4M7MaxGeTQyOvdP5suGNKK9F2F3YkrLjB2gJU85+cYh?=
 =?us-ascii?Q?QuQbjEaXCfQ24rwb1UQt6ziBBv2QUh5UeGWobulLJjEMDunjNqmyxrnI49qz?=
 =?us-ascii?Q?LevtILo5n3gjG0wqm1sHspwwWbK4zhPcwJE16W1eiYD33jvisjKgnS9fG05b?=
 =?us-ascii?Q?TftR/guSiebUqC/KsUyA8BhtjtueMD6IA8Jb4fRepa1D0TBdhU1SFuOBDCpC?=
 =?us-ascii?Q?JMfazyvWDgJZHnVWimhwmyvE/hdbdJKhtTCL64Kbd1HxcK82zkgSLhfjnS1v?=
 =?us-ascii?Q?DwFRCfm13YGZB9aACio1yxOgL3EVx/aU5fbraux9sCg5WhyFJ2eQVVBOzMG8?=
 =?us-ascii?Q?1okxKP55DbTgszytqmWuWwq1lRBLgn3anteram/OErfpLF9YU1gbGj5n3H4j?=
 =?us-ascii?Q?0X5mGpcpE5Y5eQSCu6IJywAk4JikE94bdJSTlqNGLRXrgCLlJMFxPRCpbvOv?=
 =?us-ascii?Q?Xs775m0zvLZR7em97aIOHLCo2P0zdBJD6WOghB+slqIFlRRjKWEMPv26Jdag?=
 =?us-ascii?Q?fB7h7bBioqhTvvNHTN0BJJhQiuf/dTC7RaaSpP6u+XVQrrJBTsgE2g+PQjKw?=
 =?us-ascii?Q?2P6dVJDZoyMla5tFzR2dtKEvPDLlAHlRBq/Udlka?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3865a686-7da0-4fcf-6116-08dbcd6eb24d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:52.5997
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xuLMTqwGPSQK2nSh+pL0BQCWtqYt7Zx4SoYDZlr+9H7YdTKPVSNcau9lHguoktOwKZffVkabMcz+d+4HDmv3pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105526

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


