Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04930CDB486
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.64])
 by mx.groups.io with SMTP id smtpd.web10.90153.1697369039475722045
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:23:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=NIl9/kZ4;
 spf=pass (domain: welotec.com, ip: 40.107.6.64, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wvxqfg+cV6PJv2tQOMdqAX0y9Ou5LQRq+j1ZQazHGxtIA2x1P49OlhudwqbD4BWXPEP/pbKLoVIZsWrTwvWMB0FOLCs5Pg9JkkdGt7swOhYfEK9lRKZaJRQ+0HLyltYIGK5XfP/iTEBFoVxt0timftUyEBJ9Ax0vQVZQZEsEXf0dFty7qAtqfg/8N1kLzsfVVyCZvx0UyUhL4sXsEKiVd32Fxduzhqrn2UYnLFVl1gclJCRKEWGVHNfa3Xd/AAO5wtSRDVRf2NCSmGDqghBeI7xlgj/hrEqEwhhc5Fvg31OYzIR3cQt2oTmlmvtUV/Lmg9Ae5z6qht2ShuU2l0HpDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=ZEiKs8Drp0xYRFiGM96Wb2o8tXitlr/67lrmJyI9JFOHW9nqrDm1NnvthKHWVxfMDdvuqj3bdj28xuVM4I5m3sOTZaNDY89LFVLcgvBgT/VTgGliPCl3Q7tGZlwv3Hz6EiqjwZiUHEI4dGu2zXsIZ474hywnHfz+3e/mfXHkkBRnv2D65rl2IxyxRO9aL9SfliurQdwKsqudJqqaOzDxR7GJn385CWEwfARD8KISD/r7Zy3S/6xGC4veGk4E2+w5FSQpbv8q2AXhN1gPkgzBGcmPTrWE9LzhJHTj2Lhg04C+z5T9RUymllfgJciEjxJSTOisg2HOc8n2NlY6nVJ9DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=NIl9/kZ4dK1NqSGjJa2yc0fAOr4epDencpX2yn6KwMqbe3CpmjllOpb3QJFUDeGR8A4GiAs8kjdG+pTsaSQzI4sowwElCYUIRpeMbmPJhJVKmIjthvQBU1wwTm2JM0Wu0lj+/qvqColM3BNqbkeh7lMX1CG+4tNbrwQo6vAGv2Pn6N0r6oWioxhRQNuVaTC0SuMS7aDMvxoZriOaynPcMjUI+fkeohfX0/83vSdbAVaNPtQl/vEIVKjtuBszeZeS1E1spsCCHbzUsbRV6h12r5JshmROQN4SMscy1hxjipPM4R7q/R0nWnKJa+MU2qy/hc8AqUzFIfFmCh3PXKvBRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8113.eurprd04.prod.outlook.com (2603:10a6:20b:3b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.47; Sun, 15 Oct
 2023 11:23:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:23:53 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 10/11] opkg: add options to enable support for acl and xattr
Date: Sun, 15 Oct 2023 13:23:35 +0200
Message-ID: <20231015112336.55722-10-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015112336.55722-1-p.lobacz@welotec.com>
References: <20231015112336.55722-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR3P281CA0100.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::18) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8113:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e6a2e72-bb0a-4f55-4968-08dbcd71366e
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vM/A0AZrKwceep3wOhfp3iOP1aLqJm6wRJMFcOrxFFhIqDKBZSI0D67ZEg7/0koFDsGsyCvQDRbvJolaszKfk3q83tOUlGEfagWJ6exxp02sVWmrkW0O9eokdK3v8jh9aocpV0EDC4VUQebvLgOaMP7ciqr7A1cKhA44kVnZyVO5UWw074WM/QUzjtuUs4isB2bxiUX32myG4jAvwVZYyGEsyfNhERf1J3QmUHPzEZ5CfOXLvNMhasAejhAWdix8tNaXLKQ/XNFSMsSV8hrnphqv4v82buKuMyu9fqSi44yLQi61lFPPv8B91R4/qaWRoYMjaKMOdQIIegIS/3gXBYSnsZRkGBsrk+LumtmQUmJfbTSzFxPFSLHQVs7yqjUWW3bzMSIrrq+Wy5bmp3FIAUz7/04LJnnJ34LgV6+tOrnS+QWRPYDVKYc82/HHVh35/37Xe1N5DtHFWJhWFuB/9kF2f+shyJf2fxPN1HQIZQ1NESVx7H1pZNTjQZV2ntgKJEQLSBigLPrseeKxb2NosZoLqN3LjiUZp/rrlBunUL/FOGSNtGuJxB6iVwqYOAqCgqWNx/g3izN/HfA4w3JH2R0Yc14neOPa7EzgkKczWbo=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(376002)(346002)(396003)(39830400003)(186009)(1800799009)(451199024)(64100799003)(478600001)(966005)(6486002)(66946007)(6916009)(66476007)(66556008)(6666004)(83380400001)(86362001)(38100700002)(316002)(6512007)(66574015)(26005)(1076003)(107886003)(52116002)(6506007)(2616005)(5660300002)(41300700001)(36756003)(8936002)(8676002)(4326008)(38350700005)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wtpFwwGk7kFRlQpP++FlJVWL+LkaT0BKCtdDTAzGDm+rMKAUdL7GkeCuvUsa?=
 =?us-ascii?Q?4vui6OQp53dhcjMVLNf8wJesXQ0e7SBrildflhHiJr3usm0lz7fHq7/Ys+3N?=
 =?us-ascii?Q?epDPqXanRayJFrKBgnnJcUTH/cnfZkkBBk4HoLSQbdRAydrFvqsLbM5NSsuY?=
 =?us-ascii?Q?e2HNLoHl8p8n/vONDDhH9DxUdbtKBIq1wPhKdeu6/LV3Cx4HK/WPN2aNKrbQ?=
 =?us-ascii?Q?E8lq1aK+U9Bh/GKCvPML5aJm/VIZsGIqAgHXhXLt00a1FsCNriWvkFdlGZtw?=
 =?us-ascii?Q?cKV4UghqYsXRLd9I+8FQt4APP2F42YfqFIbvrEtBWEAgTVHV40dWicLaUwfI?=
 =?us-ascii?Q?vqhoaHYknGqvCgaq5a0KgPk6HiuHWXVSNdmAtm0MrT7SMt7Hihg19vo/iUhI?=
 =?us-ascii?Q?bfaDCvXUwU5eS8LE4IaPDchxFoxREOWcEe83M2V9ADowo4QrLe91ws8RuJxO?=
 =?us-ascii?Q?VXsoPARDMj2kltWo85cXUF7xFllmW3+wKtFnohg9UpG9MrvEJmNnQBQaXaOn?=
 =?us-ascii?Q?PvQBuz9HGrFO/b8MekB2WKOkVwQCIg5tV9cwlb22GBwKTLP5dJcuy6ymqCA4?=
 =?us-ascii?Q?BMoaVBKWna1mKxzqNkoem9kT4vNWHfF7Q2ks97sRZq9tAPfuVqHeqRorfw2h?=
 =?us-ascii?Q?vmiE9Yf6M0G6CdY7O0sEbg7dXfMzxx6uWRTa9GseLnek9ziSf3196eWIC41r?=
 =?us-ascii?Q?RNL1BUWqfQ5pNDoJlStaV+Vko5ISUfKajMXHLKhZ4ncg29xAJT919N6kO9Us?=
 =?us-ascii?Q?+MZGfQSub7I9EDyUu35s6OmIvzn5Sc5ODPOamdbhfcy2DIYDf05tiVXpXEDa?=
 =?us-ascii?Q?zR/WRFSnqz9TgvMrKqqYbHf3hDseBzOYmoPMljJ8QEiVx38R+jIMhMGJ7m6K?=
 =?us-ascii?Q?yI6tjeBGDfYuAlUK+w2kvn49seg8mZraWH20vPZSN29mKKV5NpJLvzjWSh3S?=
 =?us-ascii?Q?1N3wtk+uVeme6aYXp31NAX9H7OHZbsrQ8AFflXLXAxZQZSSWcxLa/OQzVius?=
 =?us-ascii?Q?st6C31UfLDAZ9kkeknh8zyz44t4/titNWi9oftYUpHorpbkFhQABA4CtWxhe?=
 =?us-ascii?Q?Ra/+HZy9I/onxDkmC/A07TWHGrvH+UkjAfqAuSvruPiichZdObP9iBoqVYEl?=
 =?us-ascii?Q?IFycXSYk71OlG0Bd8BDFbKQnt8TaJz+oNX89lIHlkwnZli3uRyHuSMK/r8m9?=
 =?us-ascii?Q?dl+5jotFNrjUBIuiK0Upk9/BSOFOSKC+kB5aRl2zcxIJrGkSei/I5LUARDWE?=
 =?us-ascii?Q?0H9dDk8I4SryYIPCNVovuCYLvujYbyO8POpanVxpskp/U+ETk+LBuM2fXoyT?=
 =?us-ascii?Q?TC/M2VkyV3HCAJLnT75LPPsmQ9EUnOUsqtGnHsOreYm1UkxBiPYLZzh+L1TQ?=
 =?us-ascii?Q?ysXRi8NgFYuD6uBu5LW7p7WXwPKBCxBRNOBLYSgEv/hZpEUgGccfifakqzAh?=
 =?us-ascii?Q?gaP92RW9Gmi+KsKyUhnRml/5E2c2GwbzrXF55TiG/EFcFLI+DdLIPClXwE1n?=
 =?us-ascii?Q?wyDllrqokhGp+VvHqZfBwE50VhKYE4AE1PbecgyX7ku53hVBYUdJMU73iXYQ?=
 =?us-ascii?Q?OwcdDMmw2JeOHe+7RxfpbOOch1PWrQ00NJO8YkCl?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e6a2e72-bb0a-4f55-4968-08dbcd71366e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:23:53.2905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iFuU0Qv2JtjryQI2E24AjdYGr0MhaaaVeYJbiwGh4vT4SdS4CGBt6+0OGbekcbZl/0WP/fVbn1qD2wiLEPo5EA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8113
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105537

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


