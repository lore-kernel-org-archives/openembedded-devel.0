Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1571BCDB491
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 13:19:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.83])
 by mx.groups.io with SMTP id smtpd.web10.89881.1697367080398083208
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 03:51:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=M90Ft4oC;
 spf=pass (domain: welotec.com, ip: 40.107.7.83, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VZrr8dXDzYjo0ISvpsTsVP91WqxmJEIvRXv69Wh9QuXY62LllTd8DMzU79XyBJEhGywE5KDzZEhJJE+JkwKfX/tM/MAz1wnB6DWkBuBe8Xc4UMXUI0C6jvpsIyvgIDPmM0TvL00NqP3UTClPMQyPZJIvJNnF4AXpVWrUNXgP2JfERSxG3xnzfPdvEFGCh1x+WmYVAAapQyDaohOwrKXd0xyZHPm0fhvRHr0vvZNem9lnKG0Ssv17/3MmgpIjQBDKL6SuCxIMhZ9f7AoPUzZeUu4k3CnlgJ/JYQliADyK17C+wt6cEgwJx1kt4rm5FIdN4FoaiT1fPGkrJHvts51wNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=LQBMuuriOTV8Wiu+CJZ61yysJe3fEuwdZ5Z5YlhXFAAQj5z82Oavp7dfitn7noqPkEXUwBNpy9Dmpi6R1KfnJgFVtTNkjIj/dsFmaSvqg/3HK6D0aBBrHKqvK3aY594I0tLoAPLShLHqmPe3RbncYgfr4+tAn7m9rfO5NTUZD/38aOQHezkU4qi61jBXuATVMEOChrXNRfKXHHjflEOkEqPVV+4deD2H+41z38R5Pp5Dz3dVirOAqlB6bUEGqnkAVvn6kLHKWWWOC47ixOkP7FN2mXtxLSUgsCoVykNCBy+evysWLQsdUFS59ZKrahG9COHJpfBlQj/qt5+S7uq87A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=M90Ft4oCdELSa/Y166VNxxnS0oXXl8Z714W0gSEEM4z8iFlZth6pLSYkfSDI2bD5QVm+6PEr81Z63LLi7D8mzTjPH7oipYO6n/SdeLmO+sxlBMwEuPBMv4MKKxb+XmUCe/6LCUBLixVtNui9yNpVUR8/DqkX/b/TI4RFqyEByKIFcSTmATIuFLYfgCBAihBX4TpdLl6aj6+qU8UwDmhZt3XuaAwKWQanBkaXMd3pKs8mKlL7UcHYK85KW0H1UMMbKEGKtkoYibxjqY0dkvw51E9v+cU6Uk4yJOEnZd5Yhm08uG5kGX9YL6KWawyX0vneM8XgGuzrEE9eik20ulJuZA==
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
 10:51:16 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 10/11] opkg: add options to enable support for acl and xattr
Date: Sun, 15 Oct 2023 12:50:54 +0200
Message-ID: <20231015105055.52510-10-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015105055.52510-1-p.lobacz@welotec.com>
References: <20231015105055.52510-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR2P281CA0168.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::17) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d130bad-30c9-4c8c-35f5-08dbcd6ca802
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	sZt4l1Dznd7Hlxho6IB8mcTnKwODu863m9PZCKDDhtIo5s4BpgKJBpvHYsnlGweKIqEQz00R5B+B5E2uYJOpWumE6Jvf7MKvOrLuyYBMzU2Ce1ROfl9W4DebtXCEdO3Wu/WrkSrZMBold8DWxv7i65LV4f8WLO2UBt6zMArKL+bFd8YzDh1zpi+e6OXsuaLcyFZgBgmkubhf7tvIPPhFuHsZvcJXBAoyryOrgeIX666PJQouoylao3Lwl1jbGaNa2YcCFrFORiHw29AdFShI29w2GrYbHgcuN/lQ5XNm0pW1TYGIkwk83hlihz4inAM06b2CANiiiCn4XA6IS9YhFktg5gxvwcPAk7HW+dBKvCoOlztQv/r588aSq+ntFLyUgQrqHxb3ZucecTC+105h1Y8F4Z0gVqV6ljjGeJYbkw/po/aVTYrTl80STZYt2docAln4UDMJmQS7iEwLsmMDvVU0p4NEEl2nOz650PZdhHp0Ox+U6AYVjrEr0qbeROvtj49HH15cQT/vXx/NmtqCDxq3FnDuIjqwQNd3jIeFED4PpiCffMHXk0fuCOu1gA4a26Yw12KD3nDlorHJI0bUiNfBSAsFYwoQzepOTvyhsDI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/20l8b6sABZlY7Ai/JBDwv2q3m6+V1TOT7c8MVu44fFxwnRwbMZvwsD4W5yU?=
 =?us-ascii?Q?IJzgUoEjo71inyjCi/+sQkkDA74s6Gid+0mrCoCkyLcuU0yEJCzaYT82DMTo?=
 =?us-ascii?Q?A8vNlFlh9vo/fmNnLQw030h8B9u1UV4fza/0zrAysDdn0MVCztAaIoP9Dq9l?=
 =?us-ascii?Q?nMVmSQlvCAyDOIvd3tKV+7dDnoY76ejHeZ6cwCPCcM0Bv8M41Omraju/iKk7?=
 =?us-ascii?Q?RwbzAfsxX2yAAMkKjaP8hACocv2d1IyGamHN/c5WmJNgMOc8D4uV0780+Uwi?=
 =?us-ascii?Q?goS4NI5mxUQ3/M/f3iqVaC7q4+f1CcdXtazulUIbuDh5nTokTkHCdCR0zcca?=
 =?us-ascii?Q?JAklAu5RRBvMKxDc2XdqAGpxcBHGwI0Xe2iQj8HDbyjplkPjXL1uhcVR46fQ?=
 =?us-ascii?Q?7r9uxjEA8CEUMtETY0aFlTb3ElyA0xKE45nMFmcaQzeXbj5wRnCEzQF6r8IJ?=
 =?us-ascii?Q?DUxnd0mpQ1rB9toZ5LL3pdb8IrTd91U00XHwr7UDTwxYYjSppMnnDNBqYVvZ?=
 =?us-ascii?Q?YcIIrDEWgcCHI4PpcoGSYgjEB+BehSmaA/N1n0M2MwKC2dAWl5AeSL1ih8BQ?=
 =?us-ascii?Q?N1jWb2bvv+M7Rqr3OUs/K2shlrxGORKWbQNLoGeprVFIIXCfWlMvj2s9wyp8?=
 =?us-ascii?Q?RG/mOBVgl0rauR08PqJlE2Ow0URmZpJrastLI8w3dbxDCLxoxNZCvyPNBHJk?=
 =?us-ascii?Q?W8E7NDYGy79QL2LU994IdOlsOTt4U92xJ0dh51+0FUM+/QMQYzrOoSWsQTEH?=
 =?us-ascii?Q?XR/hdPle7jNrCzW5TC23OaQZd92gl0H2P3tHgC+4vKCoPypgQt6dPhjToXJ7?=
 =?us-ascii?Q?y4zNR5fCRlfc4HNxia5QmIyNb94JVwqDT8GB2sKLZ1FfEP7XtYvU/87Ef9B4?=
 =?us-ascii?Q?D8ATgs4azsq4wVkP4Ztbxhoy8bzREpRpeQRn8wJPNn7OvatvZ0EN5dokvRUp?=
 =?us-ascii?Q?B6uD0opaN/Vn8d/fRfS7TjYMTUmzTK9b7WyFZpBz3vI8t9kDoN7Q6irBtSAK?=
 =?us-ascii?Q?J/TtAGDelvRioPh9WbJmIu6uvP1szFs6odpfDtFrhIQhyC5G5vJdiOu/lWtP?=
 =?us-ascii?Q?FGlXmDqESikRgFhLDd7EDccLDdZCv0K/XJECQCDc94r0FE1Ne62thTVgjRyi?=
 =?us-ascii?Q?HRk4+8SRcmjO0feaxM3OPYPnxrw4rzFCoiaqrynI8J2jgPtHCzUGJaMy7+/U?=
 =?us-ascii?Q?KsycEG1Kd9NxXEsSSJ2/IE6ISm01KDzDbnXqGDdS5Uko+vFRRY0SmLurCNr8?=
 =?us-ascii?Q?zIiOVqLlOOmtGskawTXOBfZWZon8UjdukfsEN51qfgTRm0TDB3YpXg3R5UoQ?=
 =?us-ascii?Q?iPrP6PE1joVna83KcjqUh4kyKOVTg/9qd5ZFu0CvTw3O/dYiWOFcmd1JXkc1?=
 =?us-ascii?Q?wV110xZVY9kwmMubJcBUf9nTIswbGTQprbzXuX0+KW+xyxc6cLWcOa7EgPlr?=
 =?us-ascii?Q?tecOaT5LkhF1gLnRGNzpRCcb4uIlxCVl88HlfGN0Kn1DXfAOHWxkhWrIUHNY?=
 =?us-ascii?Q?4RVw9UZfzHjio/EvzrBtuqdAtBqEe/jUaLoHNdm3cW3ARLSI0hN8WLtu2f8r?=
 =?us-ascii?Q?DNWUPA3cIcJ8+seHnnhP7fn2pu7SYyfV9q78hPhT?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d130bad-30c9-4c8c-35f5-08dbcd6ca802
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 10:51:16.3415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0PYHhAE8jmeYToWXLuME+wpP/J1a99Yydi1y0zPO7Wr1iuNBwvhAsIWz6OHr0okczkpl53Zqh3BbrlYlLLjSYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8308
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 13:19:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105503

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


