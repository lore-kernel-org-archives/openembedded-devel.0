Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7416CDB483
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.83])
 by mx.groups.io with SMTP id smtpd.web11.89851.1697367731043602381
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=k+jpcVO5;
 spf=pass (domain: welotec.com, ip: 40.107.21.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T7lMISpfq38qpD3mpr1UVEYRz8c4XprMMKnijm7fu9KJkA6D5KNyhKdJH+seIZjCxCDw0iS5yrk9pLj+VHxfLwGFoa0KEPNped2ycUWKAz+1xjdk2pPHwTeKtXVZ5LvRNqj74JOSTK5WeHgJjKNba9ZUV22FdUXP8IAIQpKHJX/4QOVmxOSy6svibFX88tv24rXtK6AJnyw3xrDIGoX23zksP75FQHE0NYJnIkDOUANFYpGXEfEwav7Fm6GC//TOestqXrqAN1Eg7hdlD5x2EpePlolseMOa3Km9O5BCymzYbXcCx24JI9e55aWBLnRkxt4HNjzRDD5ltMGS77wxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=nUTxUZOHOT/i4ZsfeYU2LjFyBHTOUN30uXpgkTzPJhojDP6YRdan49WTCZzQ1WvpJk27tWSQCBOuPabZ6PNC+CTI5Z+50o9MEyU3apmaLyXAp7DfsZBRBCleNTCVN6v+kg2RSOorS9ppTh61mwEnIao+9MPwl2+u6PHzrjiaaFVDdLo7bCeFYLVFDgRRchxu7NyaB3LSsfSVFLL3ZpTQzvw2+VgMZGQQGRXmSt3emUYTVAb52LB9mpCbu6Ih+rtEh9ELiwrNgMh9v2Da7Zqkf+PBy2wc+9Gz6vTy+RNH4JZqBZuP8URz4GO6NEvUb5xDcv5zsWFbGK0Nu4yedfNHbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=k+jpcVO5wmk8FvZMLrpZZLITMRPvUTrurQMUQr4VI4/aoeGFanDCDJAZafYL4xhOesJIKoSH2aGsychaQ7Qww8xIjesZ974J3o405bLAN7RrEkaS7e6eAgZFvmVhMM02gaMarfu4VzT8C4OtmWN8if9aBQcLH2sedNtc5xZXDgZmC/a7bYnoRCmGoStqVY/qOFBvzvbfY1qQPrdfp9NGfvgXiKA3Pe2CLFvSHJVNdKXp3EoVSaibuzJHTiAL4JJIxWUaQPdHa6H9H2MT0TVZZw/q2KQFMLtPils06vLG+Irm7yrlyVJHGWNCVkPUVVu9DOgvVMw7S+kqfSjBYqzklg==
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
Subject: [OE-Core][PATCH v14 10/11] opkg: add options to enable support for acl and xattr
Date: Sun, 15 Oct 2023 13:01:53 +0200
Message-ID: <20231015110154.53364-10-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110154.53364-1-p.lobacz@welotec.com>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AS8PR04MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 370a3236-af35-48df-ed7e-08dbcd6e2cef
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	HSpSc901mY6CojVi8GfDR3MaukdFjxMIniT9x8uGdUHtaoGq7EMuRwliA0NCpF3WHiMYoh3Q762KXyuydKUwaosSAGnHS8CEO+0ajgyr57kwS7waWlAMCqeLEvk5bjJi73QCu4DC3QUnlhf/LTSq04oHlPEXVeLfS00gnj7VPgxMMslXUVqLYylumeqHQvaafLwge4DjIx1PuOdBHGPeOWPHtg8CGO2xavMhWpcKqbSdIykDymGA16M4MuZ/nxaQHNCGPjbU/Ph3Own09bHY+qpxwAD4u2OM+rRFjnqSTzHiFuGOu8vX3kkS4Dlpzv+W9VRUC1J5p/zVNlfyi5SK+jvWNbUs14A7sFq7TPOgYdnyXt4MFx233KjBFGsdavMnS9GaL72ZlBHx9rOxWPm25bw1k1/1wuTujA33zLYmbddCIr4Pkh7iLAumACuHTYB7m8N+YA2l7a5Hwc6tRcsOGNwDJf37YstUCOeMd1LfzrFY2CAr/cwA/UAt2col2p49UwbXO4RtyM6lyfs5ejxqszb9GYcqZ5yV3mOtHHgMFOEq/BkZofnJQho1+vvEVZaFANhBep7uanXsl28L4x+tgiYRyhOt2hl0WSQj0rZ5u70=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(376002)(39830400003)(136003)(396003)(186009)(1800799009)(64100799003)(451199024)(6666004)(6506007)(6512007)(52116002)(478600001)(966005)(6486002)(83380400001)(107886003)(1076003)(2616005)(66574015)(26005)(2906002)(6916009)(66476007)(5660300002)(66946007)(41300700001)(66556008)(316002)(8936002)(4326008)(8676002)(86362001)(36756003)(38100700002)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YnlY1GFSdY5gkZaY86TXC2eldBVZuXGfL5iRIkcij7NvqrPRy8FvttwQgrf6?=
 =?us-ascii?Q?U0m9sOm1iSOF+LaccQIeLRp8fcenBVg6vIC5SuEUnh2jFCxlI07U+wXXLAw/?=
 =?us-ascii?Q?fJ2+xBLPnLCH2VPJZPSaok6fsWFcPU23p7N7nEhqPn/XwcVJLenx0vdtozRQ?=
 =?us-ascii?Q?mHaMqcCD+lkMhHn2Nj8DF/OwjyO4Ojj63M75QvAcU+j/Qze/EJvfYnP8aPcE?=
 =?us-ascii?Q?jYg0VWOmKxEsKXQGvBIQZdHZ9QlBoYvBDbyFyvpIkDxOAQIXC4e9S3JPTn87?=
 =?us-ascii?Q?U+o4FcRaz9GDXn/sQUPfQeh3n27273BP4J2TJtUs4gVWjQnUlM4iCS7wKReu?=
 =?us-ascii?Q?Wgqvmg2rV/wJUWZFTqjXpneyisaFAs83R6MVoyVfzMuFrbJkjxKSwrgZHPhX?=
 =?us-ascii?Q?e9254wQ88tkvE7pXI2Pdzji42ZvPDeI7Np+N7GlpuzwpXHXom3PoSDZuTJov?=
 =?us-ascii?Q?eL8jMKeZtux47d4n/UxjWm5q3Dm3TDVu5CxaTwkTuIUQMWjTOk0P+eqEtYnl?=
 =?us-ascii?Q?8Rw66AlKL5hC6EFFnUlieJICZEPcmCrO7whSgLI4u1bytGT+jjoDKUynNbwC?=
 =?us-ascii?Q?CrhKIub982EHg0K1WCxocEhOQiVlg51Jlxq9t+8KNG1ynqLUv4lJgJ0P1mqq?=
 =?us-ascii?Q?d1x+cGyW1qAmZrEpduHNCKfwvBKt3jyPoqKbU+zOEvQ53S/mIciWWJFEM24t?=
 =?us-ascii?Q?2myTcQjkhou0rl9lersn1R60Lxr/z5P9XWN0lCYGN9Abp846Mq9nk4uVbbgw?=
 =?us-ascii?Q?WF/704wTUZLn6Gn7yxpNWdCD5paEKlecS5Nc7fRrbaGsGt3AuhCFK676EXqH?=
 =?us-ascii?Q?asZBjXfFjYpKd081hkjfHSVk9SlxWSxK0eRi0lBH97T9to0Xwu/N1UaSG1Pj?=
 =?us-ascii?Q?QTqwX6v0Mx3UI5kooyh8Ag9b4XxMs7ULAwQA+ezKnhz5Z5DOocXznoZ93NGl?=
 =?us-ascii?Q?/gKoAeNTGmYmaQKCZMGGsqEzAIJFFgjczvGtSag4acdMS+CWvAsqoUin7wRx?=
 =?us-ascii?Q?I4mPmM1Y28iJtILxYiyNDx42BuWgeIABZxmTI7FaihCsPk5hq9dwHrPNpZcn?=
 =?us-ascii?Q?R03bdxs+69KIgLHAChtnUYEIDlp6DJRt8hfij+K+J2tEmejOFD8xrqWtp0nA?=
 =?us-ascii?Q?r56mdY5HDAsTcKjWwIJ7u8O4Nt/QSLSP6w8TaR3UkHlhY1GCDCd1f+rX2WeR?=
 =?us-ascii?Q?i0V4Ntubkfd135inx2ubEKmhrobJEqTbPXt65Z53/YeZMxMFjlqW0z2DppjR?=
 =?us-ascii?Q?CtHBqtBqeqBVPt8rBxRR9C4m32gNRCUzzfbCR2oDFVNumfqgnj6CTlW+8+Bh?=
 =?us-ascii?Q?/A2K2xM2YpIBy8DpTxQt/H0Q5mnHE3r/u1UawMrKdBbc3YDmHZBGacpN3lIc?=
 =?us-ascii?Q?Uzq3kMBSxTT9UekkWvORDetSYgciW71QAuZmIGtdYSDqJOcj71w3rTeudtoc?=
 =?us-ascii?Q?LjLxahX8j+H0P8fzZXPiqp3BNiQtMpwRaUhMecMyqgbgyDjg+IsM8errxVWC?=
 =?us-ascii?Q?46gvrq43BDP3LbZ9/dFfVbX+pYrx3FT5somYWgH5rVhieZQcmC9aS+gWnkVW?=
 =?us-ascii?Q?KbzVIQWm74Mb4GRDn9/d3f0v+vj0lAS69ePEmwqd?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370a3236-af35-48df-ed7e-08dbcd6e2cef
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:02:08.8342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwpA9QJgf6D5V+5zHQVSoDfBX8P/Tv6G12eBELweUSxXlXrRazzc6ynnFLH3pDcm6knPCslJxcLrt3ORIGuSRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7925
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105516

The libarchive library, which is being used by opkg, supports ACLs
and xattr already.

More informations can be read at this link:
https://github.com/libarchive/libarchive/pull/691

Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
---
 ...-to-enable-support-for-acl-and-xattr.patch | 70 +++++++++++++++++++
 meta/recipes-devtools/opkg/opkg_0.6.2.bb      |  5 +-
 2 files changed, 74 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/opkg/opkg/0002-Add-options-to-ena=
ble-support-for-acl-and-xattr.patch

diff --git a/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-sup=
port-for-acl-and-xattr.patch b/meta/recipes-devtools/opkg/opkg/0002-Add-opt=
ions-to-enable-support-for-acl-and-xattr.patch
new file mode 100644
index 0000000000..26b2a36c42
--- /dev/null
+++ b/meta/recipes-devtools/opkg/opkg/0002-Add-options-to-enable-support-fo=
r-acl-and-xattr.patch
@@ -0,0 +1,70 @@
+From 1c935e994bd572d9fff436f660ac1a060a434df0 Mon Sep 17 00:00:00 2001
+From: Maciej Liszewski <m.liszewski@welotec.com>
+Date: Tue, 4 Jul 2023 22:01:58 +0200
+Subject: [PATCH] Add options to enable support for acl and xattr
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+The libarchive library, which is being used by opkg, supports ACLs
+and xattr already.
+
+More informations can be read at this link:
+https://github.com/libarchive/libarchive/pull/691
+
+Upstream-Status: Backport [ef743b75745939df210a9e6a70a44d69181ef05a]
+
+[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15097
+
+Signed-off-by: Maciej Liszewski <m.liszewski@welotec.com>
+Signed-off-by: Piotr =C5=81obacz <p.lobacz@welotec.com>
+---
+ configure.ac           | 12 ++++++++++++
+ libopkg/opkg_archive.c |  8 ++++++++
+ 2 files changed, 20 insertions(+)
+
+diff --git a/configure.ac b/configure.ac
+index 389a818..46949cd 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -158,6 +158,18 @@ return OPENSSL_VERSION_NUMBER; ],
+   AC_SUBST(OPENSSL_LIBS)
+ fi
+=20
++# check for ACL support
++AC_ARG_WITH([acl], [AS_HELP_STRING([--with-acl], [Enable ACL support])])
++if test "x$with_acl" =3D "xyes"; then
++  AC_DEFINE([ENABLE_ACL], [1], [Enable ACL support])
++fi
++
++# check for xattr support
++AC_ARG_WITH([xattr], [AS_HELP_STRING([--with-xattr], [Enable xattr suppor=
t])])
++if test "x$with_xattr" =3D "xyes"; then
++  AC_DEFINE([ENABLE_XATTR], [1], [Enable xattr support])
++fi
++
+ # check for libsolv solver
+ AC_ARG_WITH(libsolv, AC_HELP_STRING([--with-libsolv], [Use libsolv solver=
 support.
+   ]), [], [with_libsolv=3D"no"])
+diff --git a/libopkg/opkg_archive.c b/libopkg/opkg_archive.c
+index 03a4afb..8dd902d 100644
+--- a/libopkg/opkg_archive.c
++++ b/libopkg/opkg_archive.c
+@@ -912,6 +912,14 @@ struct opkg_ar *ar_open_pkg_data_archive(const char *=
filename)
+     ar->extract_flags =3D ARCHIVE_EXTRACT_OWNER | ARCHIVE_EXTRACT_PERM |
+         ARCHIVE_EXTRACT_TIME | ARCHIVE_EXTRACT_UNLINK | ARCHIVE_EXTRACT_N=
O_OVERWRITE;
+=20
++#ifdef ENABLE_ACL
++    ar->extract_flags |=3D ARCHIVE_EXTRACT_ACL;
++#endif
++
++#ifdef ENABLE_XATTR
++    ar->extract_flags |=3D ARCHIVE_EXTRACT_FFLAGS | ARCHIVE_EXTRACT_XATTR=
;
++#endif
++
+     if (opkg_config->ignore_uid)
+         ar->extract_flags &=3D ~ARCHIVE_EXTRACT_OWNER;
+=20
+--=20
+2.34.1
+
diff --git a/meta/recipes-devtools/opkg/opkg_0.6.2.bb b/meta/recipes-devtoo=
ls/opkg/opkg_0.6.2.bb
index 46be137354..d7dc6ab715 100644
--- a/meta/recipes-devtools/opkg/opkg_0.6.2.bb
+++ b/meta/recipes-devtools/opkg/opkg_0.6.2.bb
@@ -15,6 +15,7 @@ PE =3D "1"
 SRC_URI =3D "http://downloads.yoctoproject.org/releases/${BPN}/${BPN}-${PV=
}.tar.gz \
            file://opkg.conf \
            file://0001-opkg_conf-create-opkg.lock-in-run-instead-of-var-ru=
n.patch \
+           file://0002-Add-options-to-enable-support-for-acl-and-xattr.pat=
ch \
            file://run-ptest \
            "
=20
@@ -30,8 +31,10 @@ inherit autotools pkgconfig ptest
 target_localstatedir :=3D "${localstatedir}"
 OPKGLIBDIR ??=3D "${target_localstatedir}/lib"
=20
-PACKAGECONFIG ??=3D "libsolv"
+PACKAGECONFIG ??=3D "libsolv ${@bb.utils.filter('DISTRO_FEATURES', 'acl xa=
ttr', d)}"
=20
+PACKAGECONFIG[acl] =3D "--with-acl,--without-acl"
+PACKAGECONFIG[xattr] =3D "--with-xattr,--without-xattr"
 PACKAGECONFIG[gpg] =3D "--enable-gpg,--disable-gpg,\
     gnupg gpgme libgpg-error,\
     ${@ "gnupg" if ("native" in d.getVar("PN")) else "gnupg-gpg"}\
--=20
2.42.0


