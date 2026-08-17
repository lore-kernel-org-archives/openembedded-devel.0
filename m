Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70EB9C5CFC1
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 06:21:09 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24212.1786947658497264077
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Aug 2026 23:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=qetQMVfF;
 spf=pass (domain: est.tech, ip: 40.107.159.30, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cLLmKqE7k+szmpHrDjwp46sq64Ys6tKQVglRQfbANXmq+tjfUsv3hTu+A3Xzyowdtj40JyOQC0Vm0tHa7ZakAjhvj2Y9rmAyaMmMVSKt1wvehc2oKQtPNmGSEfTRdPcHzEvm7SlRCBsbOFL2zZVeJll/uYRgzyDycSQHapFfDTFa0EdTjvOHGWkhXf9YNg7xu7Z4gtRkdmL4PTlDBjHAAVtb0fR5rGQ8+tK2/WNPUVS/hNxMV2D+h1Y795bcViA+CWuS765rqzAmJwC6pt3QqRiwtHgYQcn2WgsXe9Ma7EVPzrE1iVdVmxmolsnl7KGdlEY8iQ3gRST74f5K+1dUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HedTslNqBTAiEcEaMhSxXKOMjDsLbCZVs1/aPtoOTVE=;
 b=i/GNuJAIGPKKiUCTyhmpDiE2eqwL+p/t4XKrsK7VbE4PBp6DSrFY5AhD1TYZvTDljhSFm+aEmp63DGfxcGMsS83tF14/qEaiVpi/zJg8dCaeqbcOGJh9McQ3+cmsf553z/gmDEc5iWkFOTX1tLgsn1cKfTFcjiE9a5iug7aEPoAbveO8eTZS0VLX5jRMCbK3T5IDezsC4kwhsSKGMUniP8lAyXeyZWbQx1IeLS1YdJnVS9FQMojqeyZ06EZIlG8sBCC6kgtQtYrlT/u9Kl3v9QLseryzQYHnLYUgfL12zxhVVPov6yuxMwOLuL12k1Sp8ZZWYukcoK2bes0SESiScg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HedTslNqBTAiEcEaMhSxXKOMjDsLbCZVs1/aPtoOTVE=;
 b=qetQMVfFRvt5VI/uFCiNUXFqR1LCqnG48RnUdUrQR13qcMS6R4JFrDANlBk4E9AKFNablpmN1ve7+4Z5yzrntLj9Kp4fwANbGvqoq6aQPxCfwz77oN6HiMBQ7Eu5PIHfhZfs+zzYcC04uhYEehABFq/teS7QQLwadgiriEuROhg6cIV/rSQS1qHjcM18ecAUGPKKrSFSkq7HFsB9i76/2kxjAsNuSQNrmR35x/qvnoU3wukjak00dshg4B2l7jKzSayHx1e9sTZHyyNIlgvmacYOhz4uxYIxUU3h0eoyZGW06vGNaPwwA0+1CjRcvrkC2LgSsvrzCJn1DGQwndXiMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by PAWP189MB2610.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:330::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Mon, 17 Aug
 2026 06:20:55 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Mon, 17 Aug 2026
 06:20:55 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] meta-oe: fix trailing whitespace
Date: Mon, 17 Aug 2026 08:20:42 +0200
Message-ID: <20260817062043.43792-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260817062043.43792-1-jaipaul.cheernam@est.tech>
References: <20260817062043.43792-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB8PR04CA0012.eurprd04.prod.outlook.com
 (2603:10a6:10:110::22) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|PAWP189MB2610:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a6b1bcd-1948-44b1-98c5-08defc27b1ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|10070799003|23010399003|376014|10067099003|56012099006|29003799003|3023799007|6133799003|18002099003|22082099003|12006099003|25016099003|5023799004|11063799006|13003099007;
X-Microsoft-Antispam-Message-Info: 
	r1UWCQbohI8BsdahNgd7xn0hlpasYrrk+EGW98BoACWh+DhKA136vUwMbZb7HOCk4gFCMwrV7DLn3gm0KQq25PkxtDOVW3MrZC6HsDEKfKOrxTt93YxP1QcC1mdS23CKYx6wnAaoEzSehc/c73sAVzSXEx325EibD2dI4h5I1Qq99yUHsME5ad2RP9EDsDPaplVpudnQAjlBr1lQMbgO2m21sCHvNkWYdsOas1ro0WaNHnkoCEKhTK1aiiLl5eb008Uo3VaKhZASSPsb0amMCWiF55DREWnEce69+XqxLSEsB4TSuikb24+DXrSCmi/1W+wie3IPl1n8wPDzWnkK5YiFxAxClHsQPAAppu0pEyRQUN/3nmBjVy/pb+WpF6NRpOiwQq4bFl5IEJfKBIXBIdQ+ng+1duoKcwtQCs5QW5UQb30KGNaRYrG05S2pELedMu6D8b9PS4i6QlcU9kLkTZou+7oD5GHtYPqYkdiqI7/3lVwRIZyIMZzMWz6DzNIeBXso71EcA9SMbWfNEosQPdk/91YoJtU4tW0JV3kZiasoGolz8ryzAm/oTKZ7b/zICmTvfGsiIlRghfwDbDgeu8qO0xZ1jPhPUt23FlnJ2mw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(23010399003)(376014)(10067099003)(56012099006)(29003799003)(3023799007)(6133799003)(18002099003)(22082099003)(12006099003)(25016099003)(5023799004)(11063799006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?1+6iKAYdO73XKxWBvgUWrRg5k7X0NQkeVdc7rWg//6y/3nUCLf4JBCXFiVWu?=
 =?us-ascii?Q?qJc2cWHIQrmJnwptQ2LXDd7ydCK9TfHLZrpgWm83vZCK+9bf1JwbQ0zcbEsD?=
 =?us-ascii?Q?7VvY5a7vkCiQMcleoKSpePO1xzQ1Qfz1SXUXy5zcVHRNzzxZ62/pg251VPZP?=
 =?us-ascii?Q?CoGYcJLyxOera848pZ5mf3euvHTMFgBCumyWpBJf8/2i+a8uPLsLyVf6B09v?=
 =?us-ascii?Q?uIIjKpL7tuUqFzfy/RYoAECEc8VOPjRw1a/0wQU30i5jyrx6nLItgEF+t15Z?=
 =?us-ascii?Q?cQEsxPp1TL818gKOjvOImTz5LpUcZVLI8Qh3kW8BlM4+uSvRKFkxs/Pp6J/F?=
 =?us-ascii?Q?wL5gQIfvSZ7Sgl5K2u9jbVCbHEO++gTUSq06lZeq37wz4L1zYpLN2wzs7bJa?=
 =?us-ascii?Q?wwYgBaNOrn5kgnz37bO6yxXwggOO5LmpaPONurzNunI1ZNZ+adBa/GvyXTKX?=
 =?us-ascii?Q?BwnA54voh2abOaL1VmiDMbmc0QEmMhR08euRHmQuGBV0fh226BoBTz35T1OA?=
 =?us-ascii?Q?Z7DXqdUtOdjLGpnHEdtKYxy79iXG2Qc3w+c6DwVTTFmt6H1+yC7VAZ2Nkq97?=
 =?us-ascii?Q?pXblyyG7xN10Yf3ryd0dWn+PJ4pFuYqNSI57QI+dJTZyJZoIt3K7TbWKlABc?=
 =?us-ascii?Q?vE9oVE9OkcpkauI/m2DnWC2UpWfPu3YfvJOIow0ffycWse2g249i1PFGdzCp?=
 =?us-ascii?Q?LRbG7YamTplWLGKV8Q5J1bR/EnAQv4XzoDSGyF0PetMXgVmCzFXoM4wWRBEy?=
 =?us-ascii?Q?tlJde0g201Octwg/x2d2Y7De4zk8KgZTBTYpRKP8LJaXN9E2Bb/y7VPfOADZ?=
 =?us-ascii?Q?tro0OfFDRkKf6gFN+hW2YaIRLUkhYbsJ9TvEA7v9foWLg2HYj/b7qVr9akBS?=
 =?us-ascii?Q?FVd+hZg94mfSwdf6Un+Gfs9QpyAX65NgCGtgKgUI+9fCN4BN45w77qOc2HKv?=
 =?us-ascii?Q?H5eqZXWUwWxj+e1Hfeux95sJhEAF6a7b6Hu70LnBxrsKf2hkPI+FvjNxlDdN?=
 =?us-ascii?Q?Zx+qebnjy0R9GLitC831q1cgWQXgHwC+7PulAj2u56U6Bn8vH+pS3soOI8p5?=
 =?us-ascii?Q?45xwMlogSIyyUsGxhop3GCD5JqglotENV+bBAyln6/7Y0TEZ99CtDLUHzonW?=
 =?us-ascii?Q?5wJYhMNkn3g4s/N3EMDvPk4ZCUXxjN02/qGGcsrlcWYxAnIcomIaHtncvYjJ?=
 =?us-ascii?Q?i8AHvy8QmHxBYCkmBKvoVrDXJuMzVuhNq7HRZvnEMq/i0tv7scgsgE5LAw21?=
 =?us-ascii?Q?bXx4oh3eZB7e9Q2pAaOR43qWrXFjcWUZSnfuchaBRymm4jAE1QHvjBiWYv6O?=
 =?us-ascii?Q?MgqiCz/dBuU5X86bL1Mxs9fwsMDdQQF42qpx/I4Ev+ZLVr+ozG4q4Z6cFFN/?=
 =?us-ascii?Q?O0xHdoXOv/tL4Dp7tZqgPTZOYgDFzG7xBuuJEyR8wiGA0A3yVgLMp0inxWxo?=
 =?us-ascii?Q?lsOm2MDLA6D6mM1q0Z50D2vY5AkS0YOQNE/E9lwHILp6bWByoUkiHWgNbvSe?=
 =?us-ascii?Q?PG3PP09EpqRsHdhNF7gFe2W84BM3+SBAsECncMylD5LeNqZ8D4yyZReiPsTu?=
 =?us-ascii?Q?/vmBEbAxlh9zitpHEZ0T3AKUwGWJDfkfIuws81hrsmCm7plbHaz9TpS80k2f?=
 =?us-ascii?Q?YoWdk+hfNbXP3HYSDa+Y7ibMZo13t+//j8TXLzTtDHGNPVPx8fpiX/6Y3gOK?=
 =?us-ascii?Q?QqemFOkwEenMLYjN7cmUI5rJkgF5WbRr/YWk7ZA5esARyULVbfCt2jbW+bIC?=
 =?us-ascii?Q?Ffns6cLS0lzLMjNfLk3Wj5yp26qg6eXJ9GOCefhcL/0PLnplqI3YhJ/7DCFQ?=
X-MS-Exchange-AntiSpam-MessageData-1: URlzmkp18yVxCbMcEgzNTaLJAcs5cCL5zAQ=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a6b1bcd-1948-44b1-98c5-08defc27b1ee
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 06:20:55.4002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE69w1fYA7VULe1KLoBpb/a7MUHqhfwJn4TcYEHSLlI1w0HpE5CbSMlkjf6zygkW5lOtJ9rMLo/C+J6E/Y7/qABE3HQUsEYleyEMTRKerBg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWP189MB2610
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 06:21:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129192

Fix trailing whitespace in meta-oe recipe files to resolve
bitbake parsing warnings.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb    |   2 +-
 meta-oe/recipes-connectivity/iwd/iwd_3.12.bb  |   2 +-
 .../wvdial/wvstreams_4.6.1.bb                 |   2 +-
 .../flatbuffers/flatbuffers.bb                |   2 +-
 .../nlohmann-fifo/nlohmann-fifo_git.bb        |   2 +-
 meta-oe/recipes-extended/minio/src_uri.inc    | 204 +++++++++---------
 .../rsyslog/librelp_1.12.0.bb                 |   2 +-
 .../drm-framebuffer/drm-framebuffer_1.0.0.bb  |   2 +-
 .../graphviz/graphviz_15.1.0.bb               |   2 +-
 .../libforms/libforms_1.2.5pre1.bb            |   2 +-
 meta-oe/recipes-support/fftw/fftw_3.3.11.bb   |   2 +-
 meta-oe/recipes-support/lcov/lcov_2.5.bb      |   2 +-
 .../recipes-support/libpcre/libpcre_8.45.bb   |   2 +-
 .../libsimplelog/libsimplelog_1.1.0.bb        |   4 +-
 .../libtinyxml2/libtinyxml2_11.0.0.bb         |   4 +-
 .../openldap/openldap_2.6.13.bb               |   2 +-
 .../recipes-support/pcp/pcp-native_6.3.8.bb   |   6 +-
 meta-oe/recipes-support/pcp/pcp_6.3.8.bb      |   4 +-
 meta-oe/recipes-support/pv/pv_1.11.0.bb       |   2 +-
 .../xorg-xrdp/xorgxrdp_0.10.5.bb              |   2 +-
 20 files changed, 126 insertions(+), 126 deletions(-)

diff --git a/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb b/meta-oe/recipes-b=
sp/ledmon/ledmon_1.1.0.bb
index 25f638be5d..13783a1e9d 100644
--- a/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
+++ b/meta-oe/recipes-bsp/ledmon/ledmon_1.1.0.bb
@@ -27,6 +27,6 @@ EXTRA_OECONF +=3D "${@bb.utils.contains('DISTRO_FEATURES'=
, 'systemd', '--enable-sy
=20
 EXTRA_OEMAKE =3D "CC=3D'${CC}' LDFLAGS=3D'${LDFLAGS}' CFLAGS=3D'${CFLAGS}'=
"
=20
-# The ledmon sources include headers in ${S}/config to build but not in CF=
LAGS.=20
+# The ledmon sources include headers in ${S}/config to build but not in CF=
LAGS.
 # We need to add this include path in CFLAGS.
 CFLAGS +=3D "-I${S}/config"
diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb b/meta-oe/recipes=
-connectivity/iwd/iwd_3.12.bb
index 073814d89d..86ba81a321 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
@@ -7,7 +7,7 @@ DEPENDS =3D "dbus"
=20
 SRC_URI =3D "https://www.kernel.org/pub/linux/network/wireless/${BP}.tar.x=
z \
            file://0001-build-Use-abs_top_srcdir-instead-of-abs_srcdir-for-=
e.patch \
-           file://iwd \=20
+           file://iwd \
            "
 SRC_URI[sha256sum] =3D "d89a5e45c7180170e19be828f9e944a768c593758094fc57a3=
58d0e7c4cb1a49"
=20
diff --git a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb b/meta-=
oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
index 4bb4c11d6f..8302e4cce1 100644
--- a/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
+++ b/meta-oe/recipes-connectivity/wvdial/wvstreams_4.6.1.bb
@@ -27,7 +27,7 @@ SRC_URI =3D "https://storage.googleapis.com/google-code-a=
rchive-downloads/v2/code.
=20
 SRC_URI[sha256sum] =3D "8403f5fbf83aa9ac0c6ce15d97fd85607488152aa84e007b7d=
0621b8ebc07633"
=20
-# The code.google.com/archive page is generated using Javascript from a JS=
ON file and does not=20
+# The code.google.com/archive page is generated using Javascript from a JS=
ON file and does not
 # allow devtool to find the latest version
 UPSTREAM_VERSION_UNKNOWN =3D "1"
=20
diff --git a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb b/meta-oe/=
recipes-devtools/flatbuffers/flatbuffers.bb
index 289330ee04..b6ba51ffaa 100644
--- a/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
+++ b/meta-oe/recipes-devtools/flatbuffers/flatbuffers.bb
@@ -15,7 +15,7 @@ RDEPENDS:${PN}-dev +=3D "${PN}-compiler"
=20
=20
 EXTRA_OECMAKE +=3D " \
-    -DFLATBUFFERS_BUILD_TESTS=3DOFF \   =20
+    -DFLATBUFFERS_BUILD_TESTS=3DOFF \
     -DFLATBUFFERS_BUILD_SHAREDLIB=3DON \
 "
 EXTRA_OECMAKE:append:class-target =3D " -DFLATBUFFERS_FLATC_EXECUTABLE=3D$=
{STAGING_BINDIR_NATIVE}/flatc"
diff --git a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb b/=
meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
index 9b42ea17f5..4dc66f4d0a 100644
--- a/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
+++ b/meta-oe/recipes-devtools/nlohmann-fifo/nlohmann-fifo_git.bb
@@ -26,5 +26,5 @@ CXXFLAGS:append:toolchain-clang:runtime-llvm =3D " -DCATC=
H_CONFIG_CPP11_NO_SHUFFLE
=20
 do_install() {
     install -d ${D}${includedir}
-    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}=20
+    install -m 0644 ${S}/src/fifo_map.hpp ${D}${includedir}
 }
diff --git a/meta-oe/recipes-extended/minio/src_uri.inc b/meta-oe/recipes-e=
xtended/minio/src_uri.inc
index 964dfab9dc..941e010647 100644
--- a/meta-oe/recipes-extended/minio/src_uri.inc
+++ b/meta-oe/recipes-extended/minio/src_uri.inc
@@ -1,509 +1,509 @@
 # 	github.com/charmbracelet/bubbletea v0.19.3
-# [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc51789d11=
229a1fb00f137d02b50b04cac372b=20
+# [1] git ls-remote https://github.com/charmbracelet/bubbletea 3dc51789d11=
229a1fb00f137d02b50b04cac372b
 SRCREV_bubbletea =3D "3dc51789d11229a1fb00f137d02b50b04cac372b"
 SRC_URI +=3D "git://github.com/charmbracelet/bubbletea;name=3Dbubbletea;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/charmbracelet/bubbletea"
=20
 # 	github.com/cheggaaa/pb v1.0.29
-# [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516cc95f7=
bdd9176db0b83f098=20
+# [1] git ls-remote https://github.com/cheggaaa/pb e2a33cc368a206516cc95f7=
bdd9176db0b83f098
 SRCREV_pb =3D "e2a33cc368a206516cc95f7bdd9176db0b83f098"
 SRC_URI +=3D "git://github.com/cheggaaa/pb;name=3Dpb;protocol=3Dhttps;nobr=
anch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/c=
heggaaa/pb"
=20
 # 	github.com/dustin/go-humanize v1.0.0
-# [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc912132=
97a60d18a6f513aa74bced52=20
+# [1] git ls-remote https://github.com/dustin/go-humanize e673fa1ffc912132=
97a60d18a6f513aa74bced52
 SRCREV_go-humanize =3D "e673fa1ffc91213297a60d18a6f513aa74bced52"
 SRC_URI +=3D "git://github.com/dustin/go-humanize;name=3Dgo-humanize;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/dustin/go-humanize"
=20
 # 	github.com/fatih/color v1.13.0
-# [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6791d3=
376ec4dad01196448=20
+# [1] git ls-remote https://github.com/fatih/color a05da93ebe62ca9fc6791d3=
376ec4dad01196448
 SRCREV_color =3D "a05da93ebe62ca9fc6791d3376ec4dad01196448"
 SRC_URI +=3D "git://github.com/fatih/color;name=3Dcolor;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/fatih/color"
=20
 # 	github.com/go-ole/go-ole v1.2.6
-# [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b1728609c96=
94f2cff140d34fd91f8=20
+# [1] git ls-remote https://github.com/go-ole/go-ole 8b1f7f90f6b1728609c96=
94f2cff140d34fd91f8
 SRCREV_go-ole =3D "8b1f7f90f6b1728609c9694f2cff140d34fd91f8"
 SRC_URI +=3D "git://github.com/go-ole/go-ole;name=3Dgo-ole;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/go-ole/go-ole"
=20
 # 	github.com/goccy/go-json v0.8.1
-# [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219c6183=
ec6febe2b5f7a6b06fb=20
+# [1] git ls-remote https://github.com/goccy/go-json de89bd3db67f2219c6183=
ec6febe2b5f7a6b06fb
 SRCREV_go-json =3D "de89bd3db67f2219c6183ec6febe2b5f7a6b06fb"
 SRC_URI +=3D "git://github.com/goccy/go-json;name=3Dgo-json;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/goccy/go-json"
=20
 # 	github.com/google/shlex v0.0.0-20191202100458-e7afc7fbc510
-# [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468=
cdfd1efcd7d196cd1d=20
+# [1] git ls-remote https://github.com/google/shlex e7afc7fbc51079733e9468=
cdfd1efcd7d196cd1d
 SRCREV_shlex =3D "e7afc7fbc51079733e9468cdfd1efcd7d196cd1d"
 SRC_URI +=3D "git://github.com/google/shlex;name=3Dshlex;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/google/shlex"
=20
 # 	github.com/google/uuid v1.3.0
-# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f1=
06b36d56ef13ccc88=20
+# [1] git ls-remote https://github.com/google/uuid 44b5fee7c49cf3bcdf723f1=
06b36d56ef13ccc88
 SRCREV_uuid =3D "44b5fee7c49cf3bcdf723f106b36d56ef13ccc88"
 SRC_URI +=3D "git://github.com/google/uuid;name=3Duuid;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/google/uuid"
=20
 # 	github.com/inconshreveable/mousetrap v1.0.0
-# [1] git ls-remote https://github.com/inconshreveable/mousetrap 76626ae9c=
91c4f2a10f34cad8ce83ea42c93bb75=20
+# [1] git ls-remote https://github.com/inconshreveable/mousetrap 76626ae9c=
91c4f2a10f34cad8ce83ea42c93bb75
 SRCREV_mousetrap =3D "76626ae9c91c4f2a10f34cad8ce83ea42c93bb75"
 SRC_URI +=3D "git://github.com/inconshreveable/mousetrap;name=3Dmousetrap;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/inconshreveable/mousetrap"
=20
 # 	github.com/json-iterator/go v1.1.12
-# [1] git ls-remote https://github.com/json-iterator/go 024077e996b0485171=
30b21ea6bf12aa23055d3d=20
+# [1] git ls-remote https://github.com/json-iterator/go 024077e996b0485171=
30b21ea6bf12aa23055d3d
 SRCREV_go =3D "024077e996b048517130b21ea6bf12aa23055d3d"
 SRC_URI +=3D "git://github.com/json-iterator/go;name=3Dgo;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/json-iterator/go"
=20
 # 	github.com/klauspost/compress v1.13.6
-# [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac157cb=
858763e016645e14e74c13c4=20
+# [1] git ls-remote https://github.com/klauspost/compress 38d4ba985ac157cb=
858763e016645e14e74c13c4
 SRCREV_compress =3D "38d4ba985ac157cb858763e016645e14e74c13c4"
 SRC_URI +=3D "git://github.com/klauspost/compress;name=3Dcompress;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/klauspost/compress"
=20
 # 	github.com/mattn/go-ieproxy v0.0.1
-# [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a03b415=
673a2462ad5c21eaabc588=20
+# [1] git ls-remote https://github.com/mattn/go-ieproxy 439dd0581a2a03b415=
673a2462ad5c21eaabc588
 SRCREV_go-ieproxy =3D "439dd0581a2a03b415673a2462ad5c21eaabc588"
 SRC_URI +=3D "git://github.com/mattn/go-ieproxy;name=3Dgo-ieproxy;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/mattn/go-ieproxy"
=20
 # 	github.com/mattn/go-isatty v0.0.14
-# [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f517=
c4586048b49b37f829c8e=20
+# [1] git ls-remote https://github.com/mattn/go-isatty 504425e14f742f1f517=
c4586048b49b37f829c8e
 SRCREV_go-isatty =3D "504425e14f742f1f517c4586048b49b37f829c8e"
 SRC_URI +=3D "git://github.com/mattn/go-isatty;name=3Dgo-isatty;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/mattn/go-isatty"
=20
 # 	github.com/minio/cli v1.22.0
-# [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d13933b024=
6f8a75cf80b0f74=20
+# [1] git ls-remote https://github.com/minio/cli 735b30120ed7535d13933b024=
6f8a75cf80b0f74
 SRCREV_cli =3D "735b30120ed7535d13933b0246f8a75cf80b0f74"
 SRC_URI +=3D "git://github.com/minio/cli;name=3Dcli;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mi=
nio/cli"
=20
 # 	github.com/minio/colorjson v1.0.2
-# [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd51dff=
32a726d3d6ab9e1db0633=20
+# [1] git ls-remote https://github.com/minio/colorjson f964b335cdb6cd51dff=
32a726d3d6ab9e1db0633
 SRCREV_colorjson =3D "f964b335cdb6cd51dff32a726d3d6ab9e1db0633"
 SRC_URI +=3D "git://github.com/minio/colorjson;name=3Dcolorjson;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/colorjson"
=20
 # 	github.com/minio/filepath v1.0.0
-# [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396deea35=
d06389e3e9809c887fcf=20
+# [1] git ls-remote https://github.com/minio/filepath a116cb5d2b6396deea35=
d06389e3e9809c887fcf
 SRCREV_filepath =3D "a116cb5d2b6396deea35d06389e3e9809c887fcf"
 SRC_URI +=3D "git://github.com/minio/filepath;name=3Dfilepath;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/minio/filepath"
=20
 # 	github.com/minio/madmin-go v1.4.3
-# [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4ebf73=
308e7f9a849a781859f78=20
+# [1] git ls-remote https://github.com/minio/madmin-go 4f71c826739af4ebf73=
308e7f9a849a781859f78
 SRCREV_madmin-go =3D "4f71c826739af4ebf73308e7f9a849a781859f78"
 SRC_URI +=3D "git://github.com/minio/madmin-go;name=3Dmadmin-go;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/madmin-go"
=20
 # 	github.com/minio/md5-simd v1.1.2
-# [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebbd5=
0fe5c1d61b0c80c608df=20
+# [1] git ls-remote https://github.com/minio/md5-simd 776275e0c9a74ceebbd5=
0fe5c1d61b0c80c608df
 SRCREV_md5-simd =3D "776275e0c9a74ceebbd50fe5c1d61b0c80c608df"
 SRC_URI +=3D "git://github.com/minio/md5-simd;name=3Dmd5-simd;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/minio/md5-simd"
=20
 # 	github.com/minio/minio-go/v7 v7.0.30
-# [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426c8977=
6854b2ea4f7936deb11c=20
+# [1] git ls-remote https://github.com/minio/minio-go 81c303325bb4426c8977=
6854b2ea4f7936deb11c
 SRCREV_v7 =3D "81c303325bb4426c89776854b2ea4f7936deb11c"
 SRC_URI +=3D "git://github.com/minio/minio-go;name=3Dv7;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/minio/minio-go/v7"
=20
 # 	github.com/minio/pkg v1.1.22
-# [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b0a795=
9bbef55bfe0d364=20
+# [1] git ls-remote https://github.com/minio/pkg 3b76bdaec27995a31d0b0a795=
9bbef55bfe0d364
 SRCREV_pkg =3D "3b76bdaec27995a31d0b0a7959bbef55bfe0d364"
 SRC_URI +=3D "git://github.com/minio/pkg;name=3Dpkg;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/mi=
nio/pkg"
=20
 # 	github.com/minio/selfupdate v0.4.0
-# [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277355ad=
d4fa3983edb0b376d12bb5=20
+# [1] git ls-remote https://github.com/minio/selfupdate 9e32fb8d38277355ad=
d4fa3983edb0b376d12bb5
 SRCREV_selfupdate =3D "9e32fb8d38277355add4fa3983edb0b376d12bb5"
 SRC_URI +=3D "git://github.com/minio/selfupdate;name=3Dselfupdate;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/minio/selfupdate"
=20
 # 	github.com/minio/sha256-simd v1.0.0
-# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae8=
83aee331b71aaa40d5a7dd9=20
+# [1] git ls-remote https://github.com/minio/sha256-simd 6a57409d8e0fa3ae8=
83aee331b71aaa40d5a7dd9
 SRCREV_sha256-simd =3D "6a57409d8e0fa3ae883aee331b71aaa40d5a7dd9"
 SRC_URI +=3D "git://github.com/minio/sha256-simd;name=3Dsha256-simd;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/minio/sha256-simd"
=20
 # 	github.com/mitchellh/go-homedir v1.1.0
-# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf30047=
01891bf4fdb884bfe4920b3727=20
+# [1] git ls-remote https://github.com/mitchellh/go-homedir af06845cf30047=
01891bf4fdb884bfe4920b3727
 SRCREV_go-homedir =3D "af06845cf3004701891bf4fdb884bfe4920b3727"
 SRC_URI +=3D "git://github.com/mitchellh/go-homedir;name=3Dgo-homedir;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/mitchellh/go-homedir"
=20
 # 	github.com/pkg/xattr v0.4.4
-# [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9f0eaf=
606b3c6f962467a=20
+# [1] git ls-remote https://github.com/pkg/xattr 8725d4ccc0fcef59c8d9f0eaf=
606b3c6f962467a
 SRCREV_xattr =3D "8725d4ccc0fcef59c8d9f0eaf606b3c6f962467a"
 SRC_URI +=3D "git://github.com/pkg/xattr;name=3Dxattr;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
pkg/xattr"
=20
 # 	github.com/posener/complete v1.2.3
-# [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd10c42=
0993cb1cf927b346c057b8=20
+# [1] git ls-remote https://github.com/posener/complete 05b68ffc813dd10c42=
0993cb1cf927b346c057b8
 SRCREV_complete =3D "05b68ffc813dd10c420993cb1cf927b346c057b8"
 SRC_URI +=3D "git://github.com/posener/complete;name=3Dcomplete;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/posener/complete"
=20
 # 	github.com/prometheus/client_golang v1.12.1
-# [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4818cc=
fdcf953ce399cadad615ff2bed968c=20
+# [1] git ls-remote https://github.com/prometheus/client_golang 2e1c4818cc=
fdcf953ce399cadad615ff2bed968c
 SRCREV_client_golang =3D "2e1c4818ccfdcf953ce399cadad615ff2bed968c"
 SRC_URI +=3D "git://github.com/prometheus/client_golang;name=3Dclient_gola=
ng;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/github.com/prometheus/client_golang"
=20
 # 	github.com/prometheus/prom2json v1.3.1
-# [1] git ls-remote https://github.com/prometheus/prom2json ac13972e54feb2=
f8eafc9a613112cb310f5463dc=20
+# [1] git ls-remote https://github.com/prometheus/prom2json ac13972e54feb2=
f8eafc9a613112cb310f5463dc
 SRCREV_prom2json =3D "ac13972e54feb2f8eafc9a613112cb310f5463dc"
 SRC_URI +=3D "git://github.com/prometheus/prom2json;name=3Dprom2json;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/prometheus/prom2json"
=20
 # 	github.com/rjeczalik/notify v0.9.2
-# [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a8cb7a=
78366f7633a4071cb43be7=20
+# [1] git ls-remote https://github.com/rjeczalik/notify 69d839f37b13a8cb7a=
78366f7633a4071cb43be7
 SRCREV_notify =3D "69d839f37b13a8cb7a78366f7633a4071cb43be7"
 SRC_URI +=3D "git://github.com/rjeczalik/notify;name=3Dnotify;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/rjeczalik/notify"
=20
 # 	github.com/rs/xid v1.3.0
-# [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedcb0867=
98381ae22206=20
+# [1] git ls-remote https://github.com/rs/xid efa678f304ab65d6d57eedcb0867=
98381ae22206
 SRCREV_xid =3D "efa678f304ab65d6d57eedcb086798381ae22206"
 SRC_URI +=3D "git://github.com/rs/xid;name=3Dxid;protocol=3Dhttps;nobranch=
=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/rs/xi=
d"
=20
 # 	github.com/secure-io/sio-go v0.3.1
-# [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcacdfe18=
557d117db15c0629fb7e2c=20
+# [1] git ls-remote https://github.com/secure-io/sio-go a455d2cd8fcacdfe18=
557d117db15c0629fb7e2c
 SRCREV_sio-go =3D "a455d2cd8fcacdfe18557d117db15c0629fb7e2c"
 SRC_URI +=3D "git://github.com/secure-io/sio-go;name=3Dsio-go;protocol=3Dh=
ttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/git=
hub.com/secure-io/sio-go"
=20
 # 	github.com/shirou/gopsutil/v3 v3.21.12
-# [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ceddf44=
cebe53a1b563b0b7173cc=20
+# [1] git ls-remote https://github.com/shirou/gopsutil 2f8da0a39487ceddf44=
cebe53a1b563b0b7173cc
 SRCREV_v3 =3D "2f8da0a39487ceddf44cebe53a1b563b0b7173cc"
 SRC_URI +=3D "git://github.com/shirou/gopsutil;name=3Dv3;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/shirou/gopsutil/v3"
=20
 # 	github.com/tidwall/gjson v1.12.1
-# [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2e43b7=
7d03e4f509a48b6b2f2=20
+# [1] git ls-remote https://github.com/tidwall/gjson db0033701cccc8e2e43b7=
7d03e4f509a48b6b2f2
 SRCREV_gjson =3D "db0033701cccc8e2e43b77d03e4f509a48b6b2f2"
 SRC_URI +=3D "git://github.com/tidwall/gjson;name=3Dgjson;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/tidwall/gjson"
=20
 # 	golang.org/x/crypto v0.0.0-20220525230936-793ad666bf5e
-# [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec613920=
92b27061be9618e4e219b=20
+# [1] git ls-remote https://go.googlesource.com/crypto 793ad666bf5ec613920=
92b27061be9618e4e219b
 SRCREV_crypto =3D "793ad666bf5ec61392092b27061be9618e4e219b"
 SRC_URI +=3D "git://go.googlesource.com/crypto;name=3Dcrypto;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.g=
ooglesource.com/crypto"
=20
 # 	golang.org/x/net v0.0.0-20220225172249-27dd8689420f
-# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde0885143=
97d015e4fea5174e0e=20
+# [1] git ls-remote https://go.googlesource.com/net 27dd8689420fcde0885143=
97d015e4fea5174e0e
 SRCREV_net =3D "27dd8689420fcde088514397d015e4fea5174e0e"
 SRC_URI +=3D "git://go.googlesource.com/net;name=3Dnet;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/net"
=20
 # 	golang.org/x/text v0.3.7
-# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d229d=
707172ed356727aae99=20
+# [1] git ls-remote https://go.googlesource.com/text 3cd4007149f3f883d229d=
707172ed356727aae99
 SRCREV_text =3D "3cd4007149f3f883d229d707172ed356727aae99"
 SRC_URI +=3D "git://go.googlesource.com/text;name=3Dtext;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/text"
=20
 # 	gopkg.in/check.v1 v1.0.0-20200902074654-038fdea0a05b
-# [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda479dc2=
e08d2220ec74=20
+# [1] git ls-remote https://gopkg.in/check.v1 038fdea0a05bc030b0bfda479dc2=
e08d2220ec74
 SRCREV_check.v1 =3D "038fdea0a05bc030b0bfda479dc2e08d2220ec74"
 SRC_URI +=3D "git://gopkg.in/check.v1;name=3Dcheck.v1;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ch=
eck.v1"
=20
 # 	gopkg.in/h2non/filetype.v1 v1.0.5
-# [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f0413f00d=
adaf1bf97dd0b7b1f8d8b=20
+# [1] git ls-remote https://gopkg.in/h2non/filetype.v1 8f3142c797f0413f00d=
adaf1bf97dd0b7b1f8d8b
 SRCREV_filetype.v1 =3D "8f3142c797f0413f00dadaf1bf97dd0b7b1f8d8b"
 SRC_URI +=3D "git://gopkg.in/h2non/filetype.v1;name=3Dfiletype.v1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/gopkg.in/h2non/filetype.v1"
=20
 # 	gopkg.in/yaml.v2 v2.4.0
-# [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2a8ac1=
f31859dda8c=20
+# [1] git ls-remote https://gopkg.in/yaml.v2 7649d4548cb53a614db133b2a8ac1=
f31859dda8c
 SRCREV_yaml.v2 =3D "7649d4548cb53a614db133b2a8ac1f31859dda8c"
 SRC_URI +=3D "git://gopkg.in/yaml.v2;name=3Dyaml.v2;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml=
.v2"
=20
 # 	github.com/charmbracelet/bubbles v0.10.0
-# [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089ad7c81=
898564ebeb7b6876b5844e26ccd=20
+# [1] git ls-remote https://github.com/charmbracelet/bubbles 7714089ad7c81=
898564ebeb7b6876b5844e26ccd
 SRCREV_bubbles =3D "7714089ad7c81898564ebeb7b6876b5844e26ccd"
 SRC_URI +=3D "git://github.com/charmbracelet/bubbles;name=3Dbubbles;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/charmbracelet/bubbles"
=20
 # 	github.com/charmbracelet/lipgloss v0.4.1-0.20220204041308-bf2912e703f6
-# [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e703f6=
ecf88a1b843472afd47ce5002caf=20
+# [1] git ls-remote https://github.com/charmbracelet/lipgloss bf2912e703f6=
ecf88a1b843472afd47ce5002caf
 SRCREV_lipgloss =3D "bf2912e703f6ecf88a1b843472afd47ce5002caf"
 SRC_URI +=3D "git://github.com/charmbracelet/lipgloss;name=3Dlipgloss;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/charmbracelet/lipgloss"
=20
 # 	github.com/gdamore/tcell/v2 v2.4.1-0.20210905002822-f057f0a857a1
-# [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac3e4ff=
f8c6cfe8126f8387cd1=20
+# [1] git ls-remote https://github.com/gdamore/tcell f057f0a857a1b3ac3e4ff=
f8c6cfe8126f8387cd1
 SRCREV_v2 =3D "f057f0a857a1b3ac3e4fff8c6cfe8126f8387cd1"
 SRC_URI +=3D "git://github.com/gdamore/tcell;name=3Dv2;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/gdamore/tcell/v2"
=20
 # 	github.com/golang-jwt/jwt/v4 v4.4.1
-# [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb35788=
2afc11db8218644ad565=20
+# [1] git ls-remote https://github.com/golang-jwt/jwt 0972257eba279bb35788=
2afc11db8218644ad565
 SRCREV_v4 =3D "0972257eba279bb357882afc11db8218644ad565"
 SRC_URI +=3D "git://github.com/golang-jwt/jwt;name=3Dv4;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/golang-jwt/jwt/v4"
=20
 # 	github.com/navidys/tvxwidgets v0.1.0
-# [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6d4bd7=
fb22529305d7a438c3f1369d=20
+# [1] git ls-remote https://github.com/navidys/tvxwidgets f017cfd5ce6d4bd7=
fb22529305d7a438c3f1369d
 SRCREV_tvxwidgets =3D "f017cfd5ce6d4bd7fb22529305d7a438c3f1369d"
 SRC_URI +=3D "git://github.com/navidys/tvxwidgets;name=3Dtvxwidgets;protoc=
ol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fet=
ch/github.com/navidys/tvxwidgets"
=20
 # 	github.com/olekukonko/tablewriter v0.0.5
-# [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a09b07=
6b70918308a3cd95464b2ae3b5d8=20
+# [1] git ls-remote https://github.com/olekukonko/tablewriter c7d2a8a09b07=
6b70918308a3cd95464b2ae3b5d8
 SRCREV_tablewriter =3D "c7d2a8a09b076b70918308a3cd95464b2ae3b5d8"
 SRC_URI +=3D "git://github.com/olekukonko/tablewriter;name=3Dtablewriter;p=
rotocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendo=
r.fetch/github.com/olekukonko/tablewriter"
=20
 # 	github.com/prometheus/client_model v0.2.0
-# [1] git ls-remote https://github.com/prometheus/client_model f44e7adcba5=
ee54c8a94709e6fc300d83245f171=20
+# [1] git ls-remote https://github.com/prometheus/client_model f44e7adcba5=
ee54c8a94709e6fc300d83245f171
 SRCREV_client_model =3D "f44e7adcba5ee54c8a94709e6fc300d83245f171"
 SRC_URI +=3D "git://github.com/prometheus/client_model;name=3Dclient_model=
;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ven=
dor.fetch/github.com/prometheus/client_model"
=20
 # 	github.com/rivo/tview v0.0.0-20211202162923-2a6de950f73b
-# [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658f7e75=
4d4b5593f15c8408=20
+# [1] git ls-remote https://github.com/rivo/tview 2a6de950f73bdc70658f7e75=
4d4b5593f15c8408
 SRCREV_tview =3D "2a6de950f73bdc70658f7e754d4b5593f15c8408"
 SRC_URI +=3D "git://github.com/rivo/tview;name=3Dtview;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/rivo/tview"
=20
 # 	github.com/tinylib/msgp v1.1.6
-# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b4=
86e350b4d105da6d8b=20
+# [1] git ls-remote https://github.com/tinylib/msgp 205265da651409c54677b4=
86e350b4d105da6d8b
 SRCREV_msgp =3D "205265da651409c54677b486e350b4d105da6d8b"
 SRC_URI +=3D "git://github.com/tinylib/msgp;name=3Dmsgp;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/tinylib/msgp"
=20
 # 	golang.org/x/term v0.0.0-20210927222741-03fcf44c2211
-# [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5eb775=
10b5f7c1fb02d6ded50=20
+# [1] git ls-remote https://go.googlesource.com/term 03fcf44c2211dcd5eb775=
10b5f7c1fb02d6ded50
 SRCREV_term =3D "03fcf44c2211dcd5eb77510b5f7c1fb02d6ded50"
 SRC_URI +=3D "git://go.googlesource.com/term;name=3Dterm;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/term"
=20
 # 	github.com/beorn7/perks v1.0.1
-# [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a7373c4c=
d83578f1065cf3e143=20
+# [1] git ls-remote https://github.com/beorn7/perks c49ff274687222a7373c4c=
d83578f1065cf3e143
 SRCREV_perks =3D "c49ff274687222a7373c4cd83578f1065cf3e143"
 SRC_URI +=3D "git://github.com/beorn7/perks;name=3Dperks;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/beorn7/perks"
=20
 # 	github.com/cespare/xxhash/v2 v2.1.2
-# [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f8a6c2=
1e05eeff4d91b5e401c4=20
+# [1] git ls-remote https://github.com/cespare/xxhash 7ae26c41ed6fb1f8a6c2=
1e05eeff4d91b5e401c4
 SRCREV_v21 =3D "7ae26c41ed6fb1f8a6c21e05eeff4d91b5e401c4"
 SRC_URI +=3D "git://github.com/cespare/xxhash;name=3Dv21;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/cespare/xxhash/v2"
=20
 # 	github.com/containerd/console v1.0.2
-# [1] git ls-remote https://github.com/containerd/console d5efa7d56fd239f7=
f3dad2ab6685db09359a3618=20
+# [1] git ls-remote https://github.com/containerd/console d5efa7d56fd239f7=
f3dad2ab6685db09359a3618
 SRCREV_console =3D "d5efa7d56fd239f7f3dad2ab6685db09359a3618"
 SRC_URI +=3D "git://github.com/containerd/console;name=3Dconsole;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/containerd/console"
=20
 # 	github.com/coreos/go-semver v0.3.0
-# [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe9657d=
d0ee60d73a9f8716f0c6f5=20
+# [1] git ls-remote https://github.com/coreos/go-semver 6e25b691b0ebe9657d=
d0ee60d73a9f8716f0c6f5
 SRCREV_go-semver =3D "6e25b691b0ebe9657dd0ee60d73a9f8716f0c6f5"
 SRC_URI +=3D "git://github.com/coreos/go-semver;name=3Dgo-semver;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/coreos/go-semver"
=20
 # 	github.com/coreos/go-systemd/v22 v22.3.2
-# [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd65760243=
a3eceb80a299772c23c8470=20
+# [1] git ls-remote https://github.com/coreos/go-systemd 0b40357fd65760243=
a3eceb80a299772c23c8470
 SRCREV_v22 =3D "0b40357fd65760243a3eceb80a299772c23c8470"
 SRC_URI +=3D "git://github.com/coreos/go-systemd;name=3Dv22;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/coreos/go-systemd/v22"
=20
 # 	github.com/decred/dcrd/dcrec/secp256k1/v4 v4.0.1
-# [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3281ac=
63a9ef9eb699200e5=20
+# [1] git ls-remote https://github.com/decred/dcrd 75f1b4dac2e43133f3281ac=
63a9ef9eb699200e5
 SRCREV_v41 =3D "75f1b4dac2e43133f3281ac63a9ef9eb699200e5"
 SRC_URI +=3D "git://github.com/decred/dcrd;name=3Dv41;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/=
decred/dcrd/dcrec/secp256k1/v4"
=20
 # 	github.com/fatih/structs v1.1.0
-# [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593aafa6c=
bbba2d65ec6e1416047=20
+# [1] git ls-remote https://github.com/fatih/structs 4966fc68f5b7593aafa6c=
bbba2d65ec6e1416047
 SRCREV_structs =3D "4966fc68f5b7593aafa6cbbba2d65ec6e1416047"
 SRC_URI +=3D "git://github.com/fatih/structs;name=3Dstructs;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/fatih/structs"
=20
 # 	github.com/gdamore/encoding v1.0.0
-# [1] git ls-remote https://github.com/gdamore/encoding 79c592247a62484688=
05a0e297f43a7cac979903=20
+# [1] git ls-remote https://github.com/gdamore/encoding 79c592247a62484688=
05a0e297f43a7cac979903
 SRCREV_encoding =3D "79c592247a6248468805a0e297f43a7cac979903"
 SRC_URI +=3D "git://github.com/gdamore/encoding;name=3Dencoding;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/gdamore/encoding"
=20
 # 	github.com/gogo/protobuf v1.3.2
-# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede2=
9f62fe3ce239267c1bc=20
+# [1] git ls-remote https://github.com/gogo/protobuf b03c65ea87cdc3521ede2=
9f62fe3ce239267c1bc
 SRCREV_protobuf =3D "b03c65ea87cdc3521ede29f62fe3ce239267c1bc"
 SRC_URI +=3D "git://github.com/gogo/protobuf;name=3Dprotobuf;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/gogo/protobuf"
=20
 # 	github.com/golang/protobuf v1.5.2
-# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a1c=
1c41bed0ae0744bdb0c6f=20
+# [1] git ls-remote https://github.com/golang/protobuf ae97035608a719c7a1c=
1c41bed0ae0744bdb0c6f
 SRCREV_protobuf1 =3D "ae97035608a719c7a1c1c41bed0ae0744bdb0c6f"
 SRC_URI +=3D "git://github.com/golang/protobuf;name=3Dprotobuf1;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/golang/protobuf"
=20
 # 	github.com/hashicorp/errwrap v1.1.0
-# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14=
dd0caaacbd13e76254d02c0=20
+# [1] git ls-remote https://github.com/hashicorp/errwrap 7b00e5db719c64d14=
dd0caaacbd13e76254d02c0
 SRCREV_errwrap =3D "7b00e5db719c64d14dd0caaacbd13e76254d02c0"
 SRC_URI +=3D "git://github.com/hashicorp/errwrap;name=3Derrwrap;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/hashicorp/errwrap"
=20
 # 	github.com/hashicorp/go-multierror v1.1.1
-# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec576=
96378079ecc3accd3d6f29401b3a0=20
+# [1] git ls-remote https://github.com/hashicorp/go-multierror 9974e9ec576=
96378079ecc3accd3d6f29401b3a0
 SRCREV_go-multierror =3D "9974e9ec57696378079ecc3accd3d6f29401b3a0"
 SRC_URI +=3D "git://github.com/hashicorp/go-multierror;name=3Dgo-multierro=
r;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/ve=
ndor.fetch/github.com/hashicorp/go-multierror"
=20
 # 	github.com/klauspost/cpuid/v2 v2.0.9
-# [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7d800d=
4537ee9eebe81ea97000e=20
+# [1] git ls-remote https://github.com/klauspost/cpuid 6903d4066801a7d800d=
4537ee9eebe81ea97000e
 SRCREV_v212 =3D "6903d4066801a7d800d4537ee9eebe81ea97000e"
 SRC_URI +=3D "git://github.com/klauspost/cpuid;name=3Dv212;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/klauspost/cpuid/v2"
=20
 # 	github.com/kr/text v0.2.0
-# [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb81b5a5=
1f20fdc35f9c5=20
+# [1] git ls-remote https://github.com/kr/text 0e5f52c28dd72ab84daeb81b5a5=
1f20fdc35f9c5
 SRCREV_text1 =3D "0e5f52c28dd72ab84daeb81b5a51f20fdc35f9c5"
 SRC_URI +=3D "git://github.com/kr/text;name=3Dtext1;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com/kr=
/text"
=20
 # 	github.com/lestrrat-go/backoff/v2 v2.0.8
-# [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9d2bc8=
339e1d5099a4550366a675f60=20
+# [1] git ls-remote https://github.com/lestrrat-go/backoff c3af762cb9d2bc8=
339e1d5099a4550366a675f60
 SRCREV_v2123 =3D "c3af762cb9d2bc8339e1d5099a4550366a675f60"
 SRC_URI +=3D "git://github.com/lestrrat-go/backoff;name=3Dv2123;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/backoff/v2"
=20
 # 	github.com/lestrrat-go/blackmagic v1.0.0
-# [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f88bbf=
d5be3192a38af3148dbd64f0976f=20
+# [1] git ls-remote https://github.com/lestrrat-go/blackmagic 370527f88bbf=
d5be3192a38af3148dbd64f0976f
 SRCREV_blackmagic =3D "370527f88bbfd5be3192a38af3148dbd64f0976f"
 SRC_URI +=3D "git://github.com/lestrrat-go/blackmagic;name=3Dblackmagic;pr=
otocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor=
.fetch/github.com/lestrrat-go/blackmagic"
=20
 # 	github.com/lestrrat-go/httpcc v1.0.0
-# [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e32f75=
49252ad15ecf17f3a3c1a268=20
+# [1] git ls-remote https://github.com/lestrrat-go/httpcc e7e8fea419e32f75=
49252ad15ecf17f3a3c1a268
 SRCREV_httpcc =3D "e7e8fea419e32f7549252ad15ecf17f3a3c1a268"
 SRC_URI +=3D "git://github.com/lestrrat-go/httpcc;name=3Dhttpcc;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/httpcc"
=20
 # 	github.com/lestrrat-go/iter v1.0.1
-# [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3dcc090=
33086e547a5cab96b0d708=20
+# [1] git ls-remote https://github.com/lestrrat-go/iter 628869e97ee3dcc090=
33086e547a5cab96b0d708
 SRCREV_iter =3D "628869e97ee3dcc09033086e547a5cab96b0d708"
 SRC_URI +=3D "git://github.com/lestrrat-go/iter;name=3Diter;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/githu=
b.com/lestrrat-go/iter"
=20
 # 	github.com/lestrrat-go/jwx v1.2.14
-# [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812abc4f6=
30320f8632108ccfe34bf=20
+# [1] git ls-remote https://github.com/lestrrat-go/jwx de7d9bca43812abc4f6=
30320f8632108ccfe34bf
 SRCREV_jwx =3D "de7d9bca43812abc4f630320f8632108ccfe34bf"
 SRC_URI +=3D "git://github.com/lestrrat-go/jwx;name=3Djwx;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/lestrrat-go/jwx"
=20
 # 	github.com/lestrrat-go/option v1.0.0
-# [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce320ff45=
667b138ae503367c92deaa0b=20
+# [1] git ls-remote https://github.com/lestrrat-go/option 7e3467dce320ff45=
667b138ae503367c92deaa0b
 SRCREV_option =3D "7e3467dce320ff45667b138ae503367c92deaa0b"
 SRC_URI +=3D "git://github.com/lestrrat-go/option;name=3Doption;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lestrrat-go/option"
=20
 # 	github.com/lucasb-eyer/go-colorful v1.2.0
-# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a0d83c=
ca9d610425691c3253d5f36d0ad06=20
+# [1] git ls-remote https://github.com/lucasb-eyer/go-colorful d2b05a0d83c=
ca9d610425691c3253d5f36d0ad06
 SRCREV_go-colorful =3D "d2b05a0d83cca9d610425691c3253d5f36d0ad06"
 SRC_URI +=3D "git://github.com/lucasb-eyer/go-colorful;name=3Dgo-colorful;=
protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vend=
or.fetch/github.com/lucasb-eyer/go-colorful"
=20
 # 	github.com/lufia/plan9stats v0.0.0-20211012122336-39d0f177ccd0
-# [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07bdf5e=
b6f051ab9b09651f05d6f2=20
+# [1] git ls-remote https://github.com/lufia/plan9stats 39d0f177ccd07bdf5e=
b6f051ab9b09651f05d6f2
 SRCREV_plan9stats =3D "39d0f177ccd07bdf5eb6f051ab9b09651f05d6f2"
 SRC_URI +=3D "git://github.com/lufia/plan9stats;name=3Dplan9stats;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/lufia/plan9stats"
=20
 # 	github.com/mattn/go-colorable v0.1.12
-# [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53c38a6=
0962ad4b8f658226cc983710=20
+# [1] git ls-remote https://github.com/mattn/go-colorable e1bb79c8d53c38a6=
0962ad4b8f658226cc983710
 SRCREV_go-colorable =3D "e1bb79c8d53c38a60962ad4b8f658226cc983710"
 SRC_URI +=3D "git://github.com/mattn/go-colorable;name=3Dgo-colorable;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/mattn/go-colorable"
=20
 # 	github.com/mattn/go-runewidth v0.0.13
-# [1] git ls-remote https://github.com/mattn/go-runewidth df1ff59654317c1b=
5a3f860ffc47402931932104=20
+# [1] git ls-remote https://github.com/mattn/go-runewidth df1ff59654317c1b=
5a3f860ffc47402931932104
 SRCREV_go-runewidth =3D "df1ff59654317c1b5a3f860ffc47402931932104"
 SRC_URI +=3D "git://github.com/mattn/go-runewidth;name=3Dgo-runewidth;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/mattn/go-runewidth"
=20
 # 	github.com/matttproud/golang_protobuf_extensions v1.0.1
-# [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensio=
ns c12348ce28de40eed0136aa2b644d0ee0650e56c=20
+# [1] git ls-remote https://github.com/matttproud/golang_protobuf_extensio=
ns c12348ce28de40eed0136aa2b644d0ee0650e56c
 SRCREV_golang_protobuf_extensions =3D "c12348ce28de40eed0136aa2b644d0ee065=
0e56c"
 SRC_URI +=3D "git://github.com/matttproud/golang_protobuf_extensions;name=
=3Dgolang_protobuf_extensions;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${=
WORKDIR}/${BP}/src/import/vendor.fetch/github.com/matttproud/golang_protobu=
f_extensions"
=20
 # 	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd
-# [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b=
15be4a9909b8ac7a4e313eec94=20
+# [1] git ls-remote https://github.com/modern-go/concurrent bacd9c7ef1dd9b=
15be4a9909b8ac7a4e313eec94
 SRCREV_concurrent =3D "bacd9c7ef1dd9b15be4a9909b8ac7a4e313eec94"
 SRC_URI +=3D "git://github.com/modern-go/concurrent;name=3Dconcurrent;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/github.com/modern-go/concurrent"
=20
 # 	github.com/modern-go/reflect2 v1.0.2
-# [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231=
aea69b8861c540102b087070=20
+# [1] git ls-remote https://github.com/modern-go/reflect2 2b33151c9bbc5231=
aea69b8861c540102b087070
 SRCREV_reflect2 =3D "2b33151c9bbc5231aea69b8861c540102b087070"
 SRC_URI +=3D "git://github.com/modern-go/reflect2;name=3Dreflect2;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/github.com/modern-go/reflect2"
=20
 # 	github.com/muesli/ansi v0.0.0-20211018074035-2e021307bc4b
-# [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766c3fb4=
faf6030b13dc9ec51=20
+# [1] git ls-remote https://github.com/muesli/ansi 2e021307bc4b4f4766c3fb4=
faf6030b13dc9ec51
 SRCREV_ansi =3D "2e021307bc4b4f4766c3fb4faf6030b13dc9ec51"
 SRC_URI +=3D "git://github.com/muesli/ansi;name=3Dansi;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/muesli/ansi"
=20
 # 	github.com/muesli/reflow v0.3.0
-# [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e33fa8=
c74e352a46fb9486947=20
+# [1] git ls-remote https://github.com/muesli/reflow 602e329532049c9e33fa8=
c74e352a46fb9486947
 SRCREV_reflow =3D "602e329532049c9e33fa8c74e352a46fb9486947"
 SRC_URI +=3D "git://github.com/muesli/reflow;name=3Dreflow;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/muesli/reflow"
=20
 # 	github.com/muesli/termenv v0.11.1-0.20220204035834-5ac8409525e0
-# [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee6cd96=
daeae32d47902b88f32a=20
+# [1] git ls-remote https://github.com/muesli/termenv 5ac8409525e03ee6cd96=
daeae32d47902b88f32a
 SRCREV_termenv =3D "5ac8409525e03ee6cd96daeae32d47902b88f32a"
 SRC_URI +=3D "git://github.com/muesli/termenv;name=3Dtermenv;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/muesli/termenv"
=20
 # 	github.com/niemeyer/pretty v0.0.0-20200227124842-a10e7caefd8e
-# [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d600ce=
a437f5c3613aeb1553d56=20
+# [1] git ls-remote https://github.com/niemeyer/pretty a10e7caefd8e0d600ce=
a437f5c3613aeb1553d56
 SRCREV_pretty =3D "a10e7caefd8e0d600cea437f5c3613aeb1553d56"
 SRC_URI +=3D "git://github.com/niemeyer/pretty;name=3Dpretty;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/niemeyer/pretty"
=20
 # 	github.com/philhofer/fwd v1.1.1
-# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a1=
32ec243ba944efdb644=20
+# [1] git ls-remote https://github.com/philhofer/fwd 9bcb9cab1b0394d8516a1=
32ec243ba944efdb644
 SRCREV_fwd =3D "9bcb9cab1b0394d8516a132ec243ba944efdb644"
 SRC_URI +=3D "git://github.com/philhofer/fwd;name=3Dfwd;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/philhofer/fwd"
=20
 # 	github.com/pkg/errors v0.9.1
-# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a=
985424175c39b465=20
+# [1] git ls-remote https://github.com/pkg/errors 614d223910a179a466c1767a=
985424175c39b465
 SRCREV_errors =3D "614d223910a179a466c1767a985424175c39b465"
 SRC_URI +=3D "git://github.com/pkg/errors;name=3Derrors;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.co=
m/pkg/errors"
=20
 # 	github.com/power-devops/perfstat v0.0.0-20210106213030-5aafc221ea8c
-# [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221ea8c1=
ff54b0835cbd5f2386a8410be11=20
+# [1] git ls-remote https://github.com/power-devops/perfstat 5aafc221ea8c1=
ff54b0835cbd5f2386a8410be11
 SRCREV_perfstat =3D "5aafc221ea8c1ff54b0835cbd5f2386a8410be11"
 SRC_URI +=3D "git://github.com/power-devops/perfstat;name=3Dperfstat;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/power-devops/perfstat"
=20
 # 	github.com/prometheus/common v0.33.0
-# [1] git ls-remote https://github.com/prometheus/common 63e75f51cd2368130=
efbd51b95a4e457e64b444e=20
+# [1] git ls-remote https://github.com/prometheus/common 63e75f51cd2368130=
efbd51b95a4e457e64b444e
 SRCREV_common =3D "63e75f51cd2368130efbd51b95a4e457e64b444e"
 SRC_URI +=3D "git://github.com/prometheus/common;name=3Dcommon;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/prometheus/common"
=20
 # 	github.com/prometheus/procfs v0.7.3
-# [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece38bf0=
80d446b3ca27053b305eaac=20
+# [1] git ls-remote https://github.com/prometheus/procfs f436cbb89ece38bf0=
80d446b3ca27053b305eaac
 SRCREV_procfs =3D "f436cbb89ece38bf080d446b3ca27053b305eaac"
 SRC_URI +=3D "git://github.com/prometheus/procfs;name=3Dprocfs;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/prometheus/procfs"
=20
 # 	github.com/rivo/uniseg v0.2.0
-# [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c241=
e2dddd06a9bc9e53d=20
+# [1] git ls-remote https://github.com/rivo/uniseg 75711fccf6a3e85bc74c241=
e2dddd06a9bc9e53d
 SRCREV_uniseg =3D "75711fccf6a3e85bc74c241e2dddd06a9bc9e53d"
 SRC_URI +=3D "git://github.com/rivo/uniseg;name=3Duniseg;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.c=
om/rivo/uniseg"
=20
 # 	github.com/sirupsen/logrus v1.8.1
-# [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853c56b7=
cd1ac2ba4e11b47d7da6b=20
+# [1] git ls-remote https://github.com/sirupsen/logrus bdc0db8ead3853c56b7=
cd1ac2ba4e11b47d7da6b
 SRCREV_logrus =3D "bdc0db8ead3853c56b7cd1ac2ba4e11b47d7da6b"
 SRC_URI +=3D "git://github.com/sirupsen/logrus;name=3Dlogrus;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/sirupsen/logrus"
=20
 # 	github.com/tidwall/match v1.1.1
-# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d34=
7e9190aa78c5bec09cf=20
+# [1] git ls-remote https://github.com/tidwall/match 4c9fc61b493b7aa0a3d34=
7e9190aa78c5bec09cf
 SRCREV_match =3D "4c9fc61b493b7aa0a3d347e9190aa78c5bec09cf"
 SRC_URI +=3D "git://github.com/tidwall/match;name=3Dmatch;protocol=3Dhttps=
;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.=
com/tidwall/match"
=20
 # 	github.com/tidwall/pretty v1.2.0
-# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a8=
54b85675801362cbdaa2=20
+# [1] git ls-remote https://github.com/tidwall/pretty aaa765e7476acb0028a8=
54b85675801362cbdaa2
 SRCREV_pretty1 =3D "aaa765e7476acb0028a854b85675801362cbdaa2"
 SRC_URI +=3D "git://github.com/tidwall/pretty;name=3Dpretty1;protocol=3Dht=
tps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gith=
ub.com/tidwall/pretty"
=20
 # 	github.com/tklauser/go-sysconf v0.3.9
-# [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e19d24=
2c2daa08e0d645c19832c1939=20
+# [1] git ls-remote https://github.com/tklauser/go-sysconf 746b19d14e19d24=
2c2daa08e0d645c19832c1939
 SRCREV_go-sysconf =3D "746b19d14e19d242c2daa08e0d645c19832c1939"
 SRC_URI +=3D "git://github.com/tklauser/go-sysconf;name=3Dgo-sysconf;proto=
col=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fe=
tch/github.com/tklauser/go-sysconf"
=20
 # 	github.com/tklauser/numcpus v0.3.0
-# [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d53d50=
d94380963bddd24bd373e2=20
+# [1] git ls-remote https://github.com/tklauser/numcpus cc3fdd5f3955d53d50=
d94380963bddd24bd373e2
 SRCREV_numcpus =3D "cc3fdd5f3955d53d50d94380963bddd24bd373e2"
 SRC_URI +=3D "git://github.com/tklauser/numcpus;name=3Dnumcpus;protocol=3D=
https;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gi=
thub.com/tklauser/numcpus"
=20
 # 	github.com/yusufpapurcu/wmi v1.2.2
-# [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e666c4c=
0fc42083824e7c89f0cc8d=20
+# [1] git ls-remote https://github.com/yusufpapurcu/wmi 253c5f0cb35e666c4c=
0fc42083824e7c89f0cc8d
 SRCREV_wmi =3D "253c5f0cb35e666c4c0fc42083824e7c89f0cc8d"
 SRC_URI +=3D "git://github.com/yusufpapurcu/wmi;name=3Dwmi;protocol=3Dhttp=
s;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github=
.com/yusufpapurcu/wmi"
=20
 # 	go.etcd.io/etcd/api/v3 v3.5.2
-# [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e577d72=
69851938db0c1da3d4=20
+# [1] git ls-remote https://github.com/etcd-io/etcd 4591a096d4d3c08e577d72=
69851938db0c1da3d4
 SRCREV_v31 =3D "4591a096d4d3c08e577d7269851938db0c1da3d4"
 SRC_URI +=3D "git://github.com/etcd-io/etcd;name=3Dv31;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/github.com=
/etcd-io/etcd/api/v3"
=20
 # 	go.uber.org/atomic v1.9.0
-# [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8adf4d3=
7dc757e3df0ebdd0dfe8=20
+# [1] git ls-remote https://github.com/uber-go/atomic 135466e2d0c8f8adf4d3=
7dc757e3df0ebdd0dfe8
 SRCREV_atomic =3D "135466e2d0c8f8adf4d37dc757e3df0ebdd0dfe8"
 SRC_URI +=3D "git://github.com/uber-go/atomic;name=3Datomic;protocol=3Dhtt=
ps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.ub=
er.org/atomic"
=20
 # 	go.uber.org/multierr v1.7.0
-# [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66750a1=
34671435786579bc994737=20
+# [1] git ls-remote https://github.com/uber-go/multierr 19d9fff1d3b66750a1=
34671435786579bc994737
 SRCREV_multierr =3D "19d9fff1d3b66750a134671435786579bc994737"
 SRC_URI +=3D "git://github.com/uber-go/multierr;name=3Dmultierr;protocol=
=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch=
/go.uber.org/multierr"
=20
 # 	go.uber.org/zap v1.19.1
-# [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd1902b=
03e89ce07cd1218a1=20
+# [1] git ls-remote https://github.com/uber-go/zap 2f61e97148e69cd2dd1902b=
03e89ce07cd1218a1
 SRCREV_zap =3D "2f61e97148e69cd2dd1902b03e89ce07cd1218a1"
 SRC_URI +=3D "git://github.com/uber-go/zap;name=3Dzap;protocol=3Dhttps;nob=
ranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.uber.org=
/zap"
=20
 # 	golang.org/x/sync v0.0.0-20210220032951-036812b2e83c
-# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193dd=
5a34e034151da389d09=20
+# [1] git ls-remote https://go.googlesource.com/sync 036812b2e83c0ddf193dd=
5a34e034151da389d09
 SRCREV_sync =3D "036812b2e83c0ddf193dd5a34e034151da389d09"
 SRC_URI +=3D "git://go.googlesource.com/sync;name=3Dsync;protocol=3Dhttps;=
nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googl=
esource.com/sync"
=20
 # 	golang.org/x/sys v0.0.0-20220412211240-33da011f77ad
-# [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff5b6a6=
fb4a9a1e6d6b285809=20
+# [1] git ls-remote https://go.googlesource.com/sys 33da011f77ade50ff5b6a6=
fb4a9a1e6d6b285809
 SRCREV_sys =3D "33da011f77ade50ff5b6a6fb4a9a1e6d6b285809"
 SRC_URI +=3D "git://go.googlesource.com/sys;name=3Dsys;protocol=3Dhttps;no=
branch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/go.googles=
ource.com/sys"
=20
 # 	google.golang.org/genproto v0.0.0-20211223182754-3ac035c7e7cb
-# [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c7e7cb=
d86eb6d8b95be888cf83d73dedd3=20
+# [1] git ls-remote https://github.com/googleapis/go-genproto 3ac035c7e7cb=
d86eb6d8b95be888cf83d73dedd3
 SRCREV_genproto =3D "3ac035c7e7cbd86eb6d8b95be888cf83d73dedd3"
 SRC_URI +=3D "git://github.com/googleapis/go-genproto;name=3Dgenproto;prot=
ocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.f=
etch/google.golang.org/genproto"
=20
 # 	google.golang.org/grpc v1.43.0
-# [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b1b32a=
5d18f865762634c0ae=20
+# [1] git ls-remote https://github.com/grpc/grpc-go 14c11384b76b67f7b1b32a=
5d18f865762634c0ae
 SRCREV_grpc =3D "14c11384b76b67f7b1b32a5d18f865762634c0ae"
 SRC_URI +=3D "git://github.com/grpc/grpc-go;name=3Dgrpc;protocol=3Dhttps;n=
obranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/google.go=
lang.org/grpc"
=20
 # 	google.golang.org/protobuf v1.27.1
-# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b92717e=
cb630d4a4824b372bf98c729d87311a4d=20
+# [1] git ls-remote https://github.com/protocolbuffers/protobuf-go b92717e=
cb630d4a4824b372bf98c729d87311a4d
 SRCREV_protobuf12 =3D "b92717ecb630d4a4824b372bf98c729d87311a4d"
 SRC_URI +=3D "git://github.com/protocolbuffers/protobuf-go;name=3Dprotobuf=
12;protocol=3Dhttps;nobranch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/v=
endor.fetch/google.golang.org/protobuf"
=20
 # 	gopkg.in/ini.v1 v1.66.3
-# [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea187d1=
b963536bcc=20
+# [1] git ls-remote https://gopkg.in/ini.v1 fcd6cc399e588727c1231f4ea187d1=
b963536bcc
 SRCREV_ini.v1 =3D "fcd6cc399e588727c1231f4ea187d1b963536bcc"
 SRC_URI +=3D "git://gopkg.in/ini.v1;name=3Dini.v1;protocol=3Dhttps;nobranc=
h=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/ini.v1=
"
=20
 # 	gopkg.in/yaml.v3 v3.0.1
-# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c32c=
51f8194bf51=20
+# [1] git ls-remote https://gopkg.in/yaml.v3 f6f7691b1fdeb513f56608cd2c32c=
51f8194bf51
 SRCREV_yaml.v3 =3D "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
 SRC_URI +=3D "git://gopkg.in/yaml.v3;name=3Dyaml.v3;protocol=3Dhttps;nobra=
nch=3D1;destsuffix=3D${WORKDIR}/${BP}/src/import/vendor.fetch/gopkg.in/yaml=
.v3"
diff --git a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb b/meta-oe/r=
ecipes-extended/rsyslog/librelp_1.12.0.bb
index 260e4171a7..21ec9f25f7 100644
--- a/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
+++ b/meta-oe/recipes-extended/rsyslog/librelp_1.12.0.bb
@@ -28,7 +28,7 @@ PACKAGECONFIG[tls] =3D "--enable-tls,--disable-tls,gnutls=
 nettle"
 PACKAGECONFIG[tls-openssl] =3D "--enable-tls-openssl,--disable-tls-openssl=
,openssl"
 PACKAGECONFIG[valgrind] =3D "--enable-valgrind,--disable-valgrind,"
=20
-# For ptests, copy source tests/*.sh scripts, Makefile and=20
+# For ptests, copy source tests/*.sh scripts, Makefile and
 # executables and run them with make on target.
 TESTDIR =3D "tests"
 do_compile_ptest() {
diff --git a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0=
.bb b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
index 64aa6f655e..8ea216e02b 100644
--- a/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
+++ b/meta-oe/recipes-graphics/drm-framebuffer/drm-framebuffer_1.0.0.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/embear-engineering/drm-frameb=
uffer;protocol=3Dhttps;br
=20
 SRCREV =3D "09df30960552f23d0fa7471be0caf7f095fcd522"
=20
-inherit cmake pkgconfig=20
+inherit cmake pkgconfig
=20
 DEPENDS =3D "libdrm"
=20
diff --git a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb b/meta-oe=
/recipes-graphics/graphviz/graphviz_15.1.0.bb
index 4cc38f15cb..6771a41757 100644
--- a/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
+++ b/meta-oe/recipes-graphics/graphviz/graphviz_15.1.0.bb
@@ -44,7 +44,7 @@ EXTRA_OECONF:class-target =3D "\
                 --disable-sharp \
                 "
 EXTRA_OECONF:class-nativesdk =3D "\
-                --with-expatincludedir=3D${STAGING_INCDIR} \=20
+                --with-expatincludedir=3D${STAGING_INCDIR} \
                 --with-expatlibdir=3D${STAGING_LIBDIR} \
                 --without-included-ltdl \
                 --disable-java \
diff --git a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb b/meta=
-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
index e59de6f0ca..d5200f5815 100644
--- a/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
+++ b/meta-oe/recipes-graphics/libforms/libforms_1.2.5pre1.bb
@@ -23,7 +23,7 @@ S =3D "${UNPACKDIR}/xforms-${PV}"
 DEPENDS =3D "libxpm jpeg libx11 virtual/libgl"
 RDEPENDS:${PN} =3D "bash"
=20
-EXTRA_OECONF =3D "--with-extra-inc=3D${S}/lib"=20
+EXTRA_OECONF =3D "--with-extra-inc=3D${S}/lib"
=20
 do_compile:append() {
     sed -i -e 's|${B}|.|' ${B}/fd2ps/fd2ps
diff --git a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb b/meta-oe/recipes-=
support/fftw/fftw_3.3.11.bb
index 83010d3e7d..e33d12af10 100644
--- a/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
+++ b/meta-oe/recipes-support/fftw/fftw_3.3.11.bb
@@ -43,7 +43,7 @@ do_configure() {
     cd ${B}
     # configure only
     oe_runconf  --enable-long-double
-    mv ${B} ${WORKDIR}/build-fftwl=20
+    mv ${B} ${WORKDIR}/build-fftwl
=20
     # configure fftwf
     rm -rf ${WORKDIR}/build-fftwf
diff --git a/meta-oe/recipes-support/lcov/lcov_2.5.bb b/meta-oe/recipes-sup=
port/lcov/lcov_2.5.bb
index 2f3e787dbf..67fd0249d5 100755
--- a/meta-oe/recipes-support/lcov/lcov_2.5.bb
+++ b/meta-oe/recipes-support/lcov/lcov_2.5.bb
@@ -37,7 +37,7 @@ RDEPENDS:${PN} +=3D " \
     perl-module-getopt-std \
     perl-module-list-util \
     perl-module-load \
-    perl-module-metadata \   =20
+    perl-module-metadata \
     perl-module-mro \
     perl-module-overload \
     perl-module-overload-numbers \
diff --git a/meta-oe/recipes-support/libpcre/libpcre_8.45.bb b/meta-oe/reci=
pes-support/libpcre/libpcre_8.45.bb
index c5ecbd8cf2..c1ca298715 100644
--- a/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
+++ b/meta-oe/recipes-support/libpcre/libpcre_8.45.bb
@@ -68,7 +68,7 @@ do_install_ptest() {
 	# Skip the fr_FR locale test. If the locale fr_FR is found, it is tested.
 	# If not found, the test is skipped. The test program assumes fr_FR is no=
n-UTF-8
 	# locale so the test fails if fr_FR is UTF-8 locale.
-	sed -i -e 's:do3=3Dyes:do3=3Dno:g' ${D}${PTEST_PATH}/RunTest=20
+	sed -i -e 's:do3=3Dyes:do3=3Dno:g' ${D}${PTEST_PATH}/RunTest
 }
=20
 RDEPENDS:${PN}-ptest +=3D "make"
diff --git a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb b/m=
eta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
index 7a385d537b..12ee172952 100644
--- a/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
+++ b/meta-oe/recipes-support/libsimplelog/libsimplelog_1.1.0.bb
@@ -23,7 +23,7 @@ EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1 -D__LINUX__=3D1 -D_G=
NU_SOURCE=3D1"
 # You can use as below without any problem
 # EXTRA_OECMAKE +=3D "-DUNIX_LINUX=3D1"
=20
-# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated upstrea=
m.=20
-# Please see branch "main", commit "4827c4325063266f6d2a7e133a9d3a9050ff6a=
3c" by=20
+# Drop 0001-allow-build-with-cmake-4.patch as it is now integrated upstrea=
m.
+# Please see branch "main", commit "4827c4325063266f6d2a7e133a9d3a9050ff6a=
3c" by
 # Author: Alper Ak <alperyasinak1@gmail.com>
=20
diff --git a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb b/me=
ta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
index d295b99f3d..009cbaa43d 100644
--- a/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
+++ b/meta-oe/recipes-support/libtinyxml2/libtinyxml2_11.0.0.bb
@@ -14,8 +14,8 @@ inherit cmake ptest
 EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-Dtinyxml2=
_BUILD_TESTING=3DON', '', d)}"
=20
 PACKAGECONFIG ?=3D "shared-libs"
-PACKAGECONFIG[shared-libs] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LI=
BS=3DOFF"=20
-=20
+PACKAGECONFIG[shared-libs] =3D "-DBUILD_SHARED_LIBS=3DON,-DBUILD_SHARED_LI=
BS=3DOFF"
+
 CXXFLAGS:append:libc-musl =3D " -D_LARGEFILE64_SOURCE"
=20
 do_install_ptest() {
diff --git a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb b/meta-oe/=
recipes-support/openldap/openldap_2.6.13.bb
index 59f20d0f08..743888e5b6 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.6.13.bb
@@ -65,7 +65,7 @@ EXTRA_OECONF +=3D "--enable-crypt"
 # Backends=3D"asyncmeta dnssrv ldap mdb meta null passwd perl relay sock s=
ql wt"
 #
 # Note that multiple backends can be built.  The ldbm backend requires a
-# build-time choice of database API. To use the gdbm (or other) API the=20
+# build-time choice of database API. To use the gdbm (or other) API the
 # Berkely database module must be removed from the build.
 md =3D "${libexecdir}/openldap"
 #
diff --git a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb b/meta-oe/reci=
pes-support/pcp/pcp-native_6.3.8.bb
index e25cf2e8e4..fbbc87f848 100644
--- a/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp-native_6.3.8.bb
@@ -1,6 +1,6 @@
 require pcp.inc
-inherit python3native native=20
-#autotools-brokensep=20
+inherit python3native native
+#autotools-brokensep
 DEPENDS =3D "python3-native python3-setuptools-native flex-native bison-na=
tive readline-native ncurses-native"
=20
 export PCP_DIR =3D "${D}"
@@ -13,7 +13,7 @@ do_configure:prepend() {
     export SED=3D${HOSTTOOLS_DIR}/sed
     export AR=3D${HOSTTOOLS_DIR}/ar
 #    export PYTHON=3Dpython3
-   =20
+
     rm -rf ${S}/include/pcp/configsz.h
     rm -rf ${S}/include/pcp/platformsz.h
=20
diff --git a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb b/meta-oe/recipes-sup=
port/pcp/pcp_6.3.8.bb
index bf1d728b7c..1a5eac2ca7 100644
--- a/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
+++ b/meta-oe/recipes-support/pcp/pcp_6.3.8.bb
@@ -80,7 +80,7 @@ do_compile:prepend() {
 }
=20
 do_compile() {
-        oe_runmake default_pcp=20
+        oe_runmake default_pcp
 }
=20
 do_install () {
@@ -115,7 +115,7 @@ PACKAGES =3D+ " ${PN}-export-zabbix-agent ${PN}-testsui=
te \
 FILES:libpcp-gui2 =3D "${libdir}/libpcp_gui.so.2 \
 "
 FILES:libpcp-archive1 =3D "${libdir}/libpcp_archive.so.1 \
-"=09
+"
 FILES:libpcp-gui2-dev =3D " \
 	${libdir}/libpcp_gui.so \
 	${libdir}/libpcp_gui.a \
diff --git a/meta-oe/recipes-support/pv/pv_1.11.0.bb b/meta-oe/recipes-supp=
ort/pv/pv_1.11.0.bb
index 32b8fa9d48..cd57418b76 100644
--- a/meta-oe/recipes-support/pv/pv_1.11.0.bb
+++ b/meta-oe/recipes-support/pv/pv_1.11.0.bb
@@ -58,7 +58,7 @@ do_install_ptest() {
     rm -f ${testsdir}/Memory*
     # test requires at least 3GB free on /tmp
     rm -f ${testsdir}/Integrity_-_Large_file_support.test
-    # fails due to our prompt:=20
+    # fails due to our prompt:
     rm -f ${testsdir}/Terminal_-_Detect_width.test
     #
     # sed -i -e 's@\$SRCDIR/@./@g' ${D}${PTEST_PATH}/run-ptest
diff --git a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb b/meta-oe=
/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
index 225de422e6..d8f0a23901 100644
--- a/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
+++ b/meta-oe/recipes-support/xorg-xrdp/xorgxrdp_0.10.5.bb
@@ -3,7 +3,7 @@ SUMMARY =3D "Xorg drivers for xrdp."
 LICENSE =3D "MIT"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Da2523660329fdca3d954c0a87390e00=
7"
=20
-inherit autotools pkgconfig=20
+inherit autotools pkgconfig
=20
 DEPENDS =3D "virtual/libx11 xserver-xorg xrdp nasm-native"
=20

