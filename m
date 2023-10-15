Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9535CDB482
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web10.90153.1697369039475722045
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:24:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=elPFPis6;
 spf=pass (domain: welotec.com, ip: 40.107.6.64, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftPa3DsrqeQmyWIxYYcxBCU1rpCam/bYeJU7N8gw+nkWB8X0CgEvN8D0WsBgnIQCZ7ysgLwvJwNURZ98/C4ZpwL3YwH+WB4iZvfxqbJ/w0PdyQG8pUK9F/+1ouyaZi4z9j0Ym8a5lUXAy1GnSk6gnL28N4iO9zN3kSIFNDwcidMjgMsTx0wDxy5d2Bpy2P+8hOLI6HQJ2JPg8bEkhB4M0NkAmQg7sy+E1wS/kVCEKUdG5APW2mzk7urpIhDvHVsTc+5ktU+C0/YyfWVGXytnJ631PpprxNOPNKAZCeZp68abLOK4wwM1492C3KFgQXtPGn8E2H3bqUvtjDu5VnHGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=ge0MiK+mq7pmTFuaErNhvNE6DE9ATVp7ONvqtpEw947ebDZEIZqPw2IrLBtwUEh+Uj9+cH9eMoR1oTFHVVaqmCfQ/3REfZxdOBvPQe/NQVEMxIQLDOPs8RuthLl5OYm22uerni3LSkqd6HESogULnDrT4fT3sKjW4JVWntS6XuwK2HP12hWQeyC71RaWhMjFWnHAeZa0WcyrmfbRFK+UtmqBPBXtzCCmewPUlgWJu4h9h+S7adC7Xf9X2ro04lJ82Sx7F6mYRZK1QWRv3KkRXlMwY3WgjfXu8UJL9bmJWna5Gaom6SzPj3YQpBAtyItRQF8M5ewusEEPHBLa0X/cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0r37I+i7IcUwDLpxeh9T2YIhLPLA6sWmKLn9yi2Maw=;
 b=elPFPis6E2MQ2nt1vq1Exediiw9HzMIWrmw55DkExSOIqF/TPskd0XupZAzI/kisUfPpg00cfulchy81bFIuFi01qYqlfhki97aKgaUkdSQuIJO6njLJc1qDJ2DfWRW/806rQtXzk7Lxq9hEakSrEvrPmKMFRa2qNBocgFdew6GR3x3C/AZ2q9S61lyj4AminzNOjlh813huWKvmORzoInuuxm8OOE0Pb8BjRuHC7sJg/l1mqWVgLrmdvwQffuC7kKHQ5vOo6/zfi4yuXOUBKcQqjBa6QhOCwfaGabRykMHBDjMptNIFS9hs4yeFLmbzpZ4K0+bIa2BQecUT7ALr5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:52 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:52 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 09/11] opkg-utils: add acl and xattr support
Date: Sun, 15 Oct 2023 13:23:34 +0200
Message-ID: <20231015112336.55722-9-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a770c1-4256-40e9-39c9-08dbcd71361d
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vlLnklsUI3w2pWWhDSUt1Q+oMzlhpNFEzaU6ARsYEN1FdOXYVxoA3abxRJn1Gq4hZFZ411opzqh0gnkFNb2n8d1TT+xgCIbe4Ce48Leq1iZQUES1Cqbk2Y/HWi49mfS6QtS8HUsyUx8Nlx+PcagMJ/cNDXhjJfH+VhavmiprGU8TDwwgaNsLYqWldXa6MVCs2sbqkeN0kbsmQBDJ98D9t9fMgztsqw0Fw//K8DwiFsHfcIcyGhItMo2Rl37ZZ0VkRcv4qQ1ioc7lPI6kRhGe4slubLesd9gFn9lUbrtIK7ImH7T/G5tQSTfcvT6d0NZC7tB3UQC6Ek4LWxw0QS1owe8eVsh1b2HiO3+Vkvyl8bouJavP2rW1I7ywQLcgTjxrszlmPKsDvc0MYSorEb+GJaxffzHlERtDNjPFUCphEmLM6D9nRU7qyPltPwprVQ1DN64zIKNl/xasOvxoE73yX/dhNq4PS1lKNJqYtLT2ve5KTKZDDYg/98E5ftKeZkhv5jS64RfzN5NtQqxpHXSCndv3Ma1oMGKARN5a3FwwVoYB9gQb3QKcsAviWbC7UZKDC48OHKdxYb+B2lV60yAnJCkAXBw5RPB/XsCrcLU3vsQ=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y6iZNZxj3rRXYWKcSzdyZFmb9p7uj9+2CSTSCYFUMUp6GBV1dnZob8StDaOv?=
 =?us-ascii?Q?DRpSItYlhryaIbEfyfHj5vZuiaRBur1pZcYG87iEWRUuUS9zgZX7WHWPc6/E?=
 =?us-ascii?Q?k1t1ySjLtcEBMpBJyd7XqCWl8RGoKe4kNS6FsFZPsl9SUcLPL29mZjCaxud7?=
 =?us-ascii?Q?YMzeMf1XXepa8UC94QnAACAZYLfHE38mwOMjEPAkaJ729WXvYoQ6jubQOrxH?=
 =?us-ascii?Q?oq5K/XRhIGTlJJ2qJEJYBEhEGF+GV3018rMS9ZFtJy8fnEB9liDWWcAeSIFB?=
 =?us-ascii?Q?QwrUBdKxkPiEja2BFIWR5vzpD0hagAXmKTDXT7cQbrq/vNUJ1rYLbiNliddK?=
 =?us-ascii?Q?ZDZIZNFd5ksJf0gAHGbxTQfz3uwhehgP8G4GKZ7bV2TDpdchY3E5axnizDYy?=
 =?us-ascii?Q?K19pGGtRoCfpXKq6NYgFFK7ofo2W8NJ9cXMaMmuQPBNI6KnIszfB4o3lExOn?=
 =?us-ascii?Q?KvF0WP3iCkXAX+etUSu2nvra7P6RC5waSDftVAOl0FHcd/iIJ2smf6rdnETe?=
 =?us-ascii?Q?/WPcWJOBwqthsBK8vUCCqNJy4BwDj+u1InrhMXKaGr61ViGb0p+WGqYHTf+x?=
 =?us-ascii?Q?3K4Hhw4mLICtPpQScNrHq33rBUGHNnOdBWvT+y/JBfyAGARu5CbsAIcoSWrn?=
 =?us-ascii?Q?8cs4+3gvsD3ZOI0hR70PAp8XPsXtlEtfzvgSZbGIW91hYmmcQnMfpy4yqSMY?=
 =?us-ascii?Q?bu3cUpoSKCyjE4JNW1amUjGYPbEA5uK0xqT5YYrP27i+olk9WNgrlKNh7yDG?=
 =?us-ascii?Q?X/k9aiTujxLbnxUoa1box+wJjKf0gT8P1xVgISnZXZ+FhE4nCPccImdoIClX?=
 =?us-ascii?Q?qetvoohGZnwhTRl5uEYuZGVAlQWQxW7sh3muffAkeJ1NN3a2MhFz2hWVp5Kj?=
 =?us-ascii?Q?ioBigm3OIQQs82vfd4xVSquFQVEdOONTtIj1tIiyHr+atHmacqVQYZs9RGsk?=
 =?us-ascii?Q?iEggVqTqhMudj3XjserHinHSUfCud4VsbdLdADMxM8W44hlWHTz7eJbMrtft?=
 =?us-ascii?Q?aG6gW8jJa/ttcCq7jKeduweTx5eLkk01icXeIFnQDM4gMeMKNOLQdf2DR5Qc?=
 =?us-ascii?Q?wjQxDb0pwSjIKuCvqfxmdU/PYt+Hmy5jqiQBsJkY2milgJjBUA8kWQJOSsAf?=
 =?us-ascii?Q?3Ig6Q6FQyBFRB9rIsNJKUvRzM093OU/zB2Wl6U/sZ3FJvMAsQ1nRXlkZm9l8?=
 =?us-ascii?Q?4cpK/P/+WlKvG8Juy9mH+Q+NT0//dtCNW1BaNEzkTq/REzHDCKQZUbjaNX0Q?=
 =?us-ascii?Q?lguKRwboc4d/rTabNPt1rjyrzA2QMnIKLXmiP3+0m4xNb/ZTEAeBJBa0O3cY?=
 =?us-ascii?Q?svjQYYpZxB6qsa9eLCRiOVJZdMVFoyVgz68KNkltLpru5CSDQJAHg34JQ3Am?=
 =?us-ascii?Q?CGe1X8OQorDXdpP8Yy18Kn86M9Cs6mrnLTgJm08w2lhGFEM8gdVIvmnNPEa5?=
 =?us-ascii?Q?EgKfKtZ1UWuzVf0tNo2tsPwVCmd0EE0fEpNdBRbftr8PafGIDPKon0xgzMd/?=
 =?us-ascii?Q?dAw2cgKq6carvWqnSy0v7LpjASSl4PPRzDsFqoOIE9hNb8Tzhp/TtRowMnVX?=
 =?us-ascii?Q?VmtMdqC84oBdpTX8/cEl7p9dfN+PfyMvMdTeJMWX?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a770c1-4256-40e9-39c9-08dbcd71361d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:52.7856
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +wy83MjfzNOyFScLWGmUbDWRFKx2GGPBgfRlpvSWWh36mk/E9qXp1u0ijJ6IShQqBlA93Qyv0r/RLHe0XmKzqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105539

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


