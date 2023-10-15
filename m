Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 354E3CDB48F
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:28 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.53])
 by mx.groups.io with SMTP id smtpd.web11.89880.1697367955844343434
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 04:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@welotec.com header.s=selector1 header.b=Vkjh/y+M;
 spf=pass (domain: welotec.com, ip: 40.107.247.53, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW2E+3z5l7lPzA2OfuTSRIhD8Wq4dFD9znpdbmhkx+21cqU6uCNZ99Q+4Ruw5VlM9H5tNneKvdHaQuTzsVio2Nj3ntrFbh+/Ck2JGuGMt6sxf1smhhpwb+hTojY+W2EY12CoN/9JPGWBvCyDdqttZql6uIAkZpVnM9qaFJm9F5ryH5K9+NZtbK2HEFao6L5yMYXACRSQetmoTdmXtQRullBHfhfdGDGZDJK+OU1+MSaC8K8NpJdttWfHvaeS6NxoqB0psVXfJf9Z3Ts+PkBJAdvTVUyWLn6UOi5bM4vgPzMPe/xuW2jQoyY20H6Kdt2i5a0NY6w/e1Yg3AtOTJ6PzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=VepfykKkeIq+HsEGc3yPer6E1jm5gjDGWHA/AiOHeTfFE9XNyo4xobs555qMjigeMqWSrMIfvndK2lwuUdLMQWIhhEzMLNG6qUkZmd1ymEHwS6sDk0U+UDDty81FVpCXN7VxLqg0JjREYKWSGc3jvDFcZjO21OWhzsS9ZowfKMYVoTEyUSEe0LVrGHBuJGuvdg3BNK7oAm/ncEP/wSXziEPUuan3w33uaQe0lsROnRBMXjFKfJrnyieeGjZzvGAptufxdVKcjC2cxq3TtV4uGqgwtiwpC4r7Eut0I3HAAl1Vgd1W1KukI6mI7aw/A5cv+xHm+8CnmhTcD/UYyAFSyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aufmz5XXUPx3GT5C7Upri0nkPs2fm01KEawbIS+GMqA=;
 b=Vkjh/y+MgDZkUdbwMR51oq9SxqlLK8o3GTOuNG/7k7T+RJUykY4pTHGLTT3264z7IbR2u2lt1wp/O375XeVef3DNtLwGY2M71dVzxJyvJULw6lb6N8BFYlECZJYCJM6K8x+eEIcH8wjfQjZODosF5p7WV5Kxnj8o0e/NWM5dqLALoclT8jXeKG6ZiTlAFm/++afrQuuAOL6XhFH4P3WsIxLJ80rnNBb3CAhrvx1uNb+EfAJne+mykohQBs2fLDx/94RqtWb3Vj/qtvpPP4cWA5NW2NJz+U4uEVeqDYEcTTrbLZ9EtBi0XkEym2mktyteqWiDy3Ep3mEDVT0cAzAIXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by AM9PR04MB8940.eurprd04.prod.outlook.com (2603:10a6:20b:40b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Sun, 15 Oct
 2023 11:05:53 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 11:05:53 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?Piotr=20=C5=81obacz?= <p.lobacz@welotec.com>
Subject: [OE-Core][PATCH v14 10/11] opkg: add options to enable support for acl and xattr
Date: Sun, 15 Oct 2023 13:05:25 +0200
Message-ID: <20231015110526.53738-10-p.lobacz@welotec.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231015110526.53738-1-p.lobacz@welotec.com>
References: <20231015110526.53738-1-p.lobacz@welotec.com>
X-ClientProxiedBy: FR4P281CA0049.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::13) To VI1PR04MB5373.eurprd04.prod.outlook.com
 (2603:10a6:803:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5373:EE_|AM9PR04MB8940:EE_
X-MS-Office365-Filtering-Correlation-Id: c1eac84b-69eb-48e3-3af1-08dbcd6eb2c2
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aXJqT/map3myNmHag+NCD6qrnBTm4D3xjL9PXHIUCxHKqk/2L/F7J9X28ttmRvQ69toebeJHyhK6jumm2O2ZLnhSM0dXxR7OFkVCexXyM/z2111V90HuNwcym2Xp9v3muDd8g+UdjNrAYHXw3TvJyYxW8xX/Fi42rD8taBmORoh0MLiI8xC7YHLl/MDRPpQShqmeetjPbS4XMj5hzgHOUSdYHjbs9u4DlZQm2zjLwh+Vz7e3SsRYu16cdvvNG0a5jdQtTF9MIfDiQntmbPj1eWOsrqqxouJk4UTAHhR22FRPbEeiiY23L6bDWUVeapluQy1QiNUwK0+BMXqvTvfGTKUwuea42UQMsRKRL904Nb51w9r99Qm5Rxjw3EuGCjexVd4gqWWDP25WTJFEVS1y4SdeRIJoNKbOM9CxDctzHu7R/b2WjCeeiUD7PrQi32uY+ydE771rozWgY0DgSPmyMQ4pSvSCxUxvoGWd7Rv5vAKAYcbsGXsb/U1fVvuGb0DqX434fgH7lanPeyuvh1dI73Zn0x7lKmqW/2Yp5tejAY9oPoFZU1azYlfD0AFfclqjg6nXL2yjHFriiE5/IBwbRyqvbcLUe5wsPOa1gG47wm4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(376002)(39830400003)(396003)(366004)(1800799009)(64100799003)(451199024)(186009)(38100700002)(6512007)(26005)(66574015)(107886003)(2616005)(1076003)(478600001)(966005)(6486002)(5660300002)(8676002)(4326008)(8936002)(86362001)(2906002)(6916009)(316002)(36756003)(41300700001)(66476007)(66556008)(66946007)(6666004)(52116002)(6506007)(38350700005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5A/k2/I9teSWZVUsAph+wa8IjCejOTZhZWuQKNpOdRiPVn8uCIawq01B1Eaf?=
 =?us-ascii?Q?2zZDMwuacj6m2STG2smuUKEUaX8GIFNQCq9Zbl7Zy2vOR/4dsM4kmo0/lN1+?=
 =?us-ascii?Q?Faqr0JK8jb6zl51VT4H3pqfK8NTsU7A1dTzICM3VaI7A491xAATmPY7muDAj?=
 =?us-ascii?Q?ZJBrVst69f3Z7FB6LSUGNClCyKmTihvNs+LID2Aic6N8i9lr7yvlUKZB8f5K?=
 =?us-ascii?Q?qRr2uvIeq4jcQhTfOCzxfXNq6oF4ZEc1O/Lz7rPGCcQoTbM19hNmAGqjr4Ps?=
 =?us-ascii?Q?B4/Luf0XjsdWHvtS7FLqbV1YtwJrnT7PxVVBa+BPTRS1PaMvTW/nHQL+Hedk?=
 =?us-ascii?Q?9fL5mkfzMLruzluLBIpF2iCAYjcJ92OIue6g3AJgLsjL+f8l4Marw90jw7Xl?=
 =?us-ascii?Q?r33mJRvH29zkZvaxb5vU4E914aHzVFWUIy1t3tY9cGbOs8IWfLqomnjFDOSK?=
 =?us-ascii?Q?cm76S1kjBSYhmpdsmbVv1LENCU0wdRFKKoqP5/oAOhegWGs0Z30Ubts6x6wN?=
 =?us-ascii?Q?FFA/TlsqVYFKzan7TdWC4gl3pm04i23yUZM7RULu3a/k0RsjYRsfH0t3iAHA?=
 =?us-ascii?Q?JhBJo9rIigsa4IMPBh4wD0REfVg/VYZWmIoWq2AvipRtk9rN4Q8CGN0l2Dme?=
 =?us-ascii?Q?pnOZbk3pvVctUxb2AkYB1n0lG4+MvZ5y6l+0eEu8hOxxFRQJAdbFTfAUV5zV?=
 =?us-ascii?Q?J9DeOtoRNqOeHVRQHwCjXzLmtHRT8W6IYqN1YfyyzFcbEQ/qg0bsvdqoifTU?=
 =?us-ascii?Q?zdyNiFxc6Q2yDodr+QkClq3QqVTEBbtJEWMS1WkVrRn2VTUtOczUpBpz7vln?=
 =?us-ascii?Q?sFIUOVRN9ss3m6KwjKyDUTv5ZrN2WMWn23p6ZAfaVRGF1Md0isQNEE9wG9+0?=
 =?us-ascii?Q?EO+TTLJRFH0FmOvSrKuPVhcano98IcmMv/ojKFyWlnnQkS0kGeMKO4h8UeAn?=
 =?us-ascii?Q?VXUeRmfeMU8/BlCDxCnodypBuxAj6mCVZ07pjGxPxY//PZ7CDYlwOUYTYfOJ?=
 =?us-ascii?Q?RVuGny+h0+3oB11d7a/Eqj+6PKKKvQr8a7W3ClXT4LZwvzTlpLju+Hfovdw8?=
 =?us-ascii?Q?yj3JiUPYc5/sLKeQtzesAnabAIhqUX+A4KwIebT86U8ksCagDj6blNKniDge?=
 =?us-ascii?Q?mUMFXphdWCC6EMA638nIpHOK+4vMIH1UY4HR+h0thO5IY1fPOthQ/jQ3/JBP?=
 =?us-ascii?Q?GO5tPQFcyJyYPAIXC5qtVWd9RjaKQW2FGovJc9K+sKIGqG5PnQ5zYdX+Dkja?=
 =?us-ascii?Q?L47hPC0TVbkl53KDNVd2Jzhc2FV/2TdAMF+Y3NVqTXWRzOdwAUGwtL+LBJXw?=
 =?us-ascii?Q?gGW5D6iW4P1DR+C/7ZwNZGdW+lrBWQAwrUMvVO9w2ohPgjfYgJdBQRFb7sAk?=
 =?us-ascii?Q?bO4E38DtNHcLci44c/BkBu3cFm5J5L2TgpJWCuAV6eGvbXoSUz6KdrvhsDLb?=
 =?us-ascii?Q?ko3EcB8JjoDVACNhcRJFR+pKpnAOR3G5TeHmocITKvLci6IrxxOCZABHN5VC?=
 =?us-ascii?Q?5oH0H6XYEhUW2ddwOoPiWfranx/S4ZSpFkDP1lgvMpwi9kUPzRaHiBrIA5km?=
 =?us-ascii?Q?KRSIwqFfT2K14PYquNG9W2j1ZTYcfxb53nXEnIFM?=
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1eac84b-69eb-48e3-3af1-08dbcd6eb2c2
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2023 11:05:53.3534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9l2yTHISZOOIMbI83c7lrpCjPE+r0+5INJTdHLNgMDaVNStS24OwmTmPnZydcJAtUr5NdYhIEUGby4jiWbJUSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105527

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


