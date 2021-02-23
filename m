Received: from NAM11-DM6-obe.outbound.protection.outlook.com (NAM11-DM6-obe.outbound.protection.outlook.com [40.107.223.64])
 by mx.groups.io with SMTP id smtpd.web11.6897.1614065820575744537
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Feb 2021 23:37:01 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=BwCnHIqe;
 spf=pass (domain: windriver.com, ip: 40.107.223.64, mailfrom: yanfei.xu@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FEiqbMbMHPWV3F82V8EMXFGQ2eeRDA78meLweQSkiushnwODsfhRn7Iof7xX8FehiQ822Z628KHlhYVmQzqarotyjy48n3WA5AkdMVg/RNsdK5aAY+lfLRt23IaQ28GgN2NeMdp6PvsP2Xu5G0KM9rV/QLsCKWgbiTIQhCNGf29Kz0Sl0ticaX+wyrEGpeByHzWUPIrK8GnJtmI9wUqtVGaUH8R26g92KZITZnvcYNk8sM5MQHjXugakz8ROdLj10BP2TqLWTQXBZkNJrYCtjMFTujlhCTwPxWkelMjQChQIZmBVrBdzE0APwISKGoqH411JICzU/OyyD1jHts21Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNRCu3zsvj19ndjNaPQlCOUu34tWihOrBl7CcmxA+rI=;
 b=e5eH97ctH+GO1QxLInbGtUagPM7Pvc47a0Q8ooTsyap4eOPAIVzikdBOIpfNdvcuUDR2kFnp6MCYpU4NTejhUC22RS1Ino+az/BlkV/3D4OVj8exNqKkDogTfykTXgUCwAzSqht7SpFtkfwc1Au6drHrQ1MCpOn+wpZf/VWhU2XMBeY1X8dEuIB6D+DTSSWJHipacFr/TN7/P/ODwPWe11EQZ18Z5Bx1478UVYy+Ig4oB1n8AP/rnhUU8SlBUSajFJke77Ncyj35jfSGZ5V4EbKhi//VqtTFWbNy8K+z72ZsetFbdo43e9k3xuuX199aCeVKJ67PN523RSTJbqbBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bNRCu3zsvj19ndjNaPQlCOUu34tWihOrBl7CcmxA+rI=;
 b=BwCnHIqeNor7FHrCtX1CZcgB2ZTsN0TmWVpAX2a0UDZ9ZGXBGPoL5wCWGJFZrOD6vEwfh/KUOhK1IlrpdyfGP1E9bnv29AcWzVLB9DIKumqRHSN6qEVrWMpjuOwVKQC9yM8vh4RkgEnOqmSYCfIGgKWktmXqRaP83h0F/t8GG4E=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BY5PR11MB4241.namprd11.prod.outlook.com (2603:10b6:a03:1ca::13)
 by BYAPR11MB3816.namprd11.prod.outlook.com (2603:10b6:a03:f8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.29; Tue, 23 Feb
 2021 07:36:58 +0000
Received: from BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4]) by BY5PR11MB4241.namprd11.prod.outlook.com
 ([fe80::95a3:653e:2078:fb4%6]) with mapi id 15.20.3868.032; Tue, 23 Feb 2021
 07:36:57 +0000
From: "Xu, Yanfei" <yanfei.xu@windriver.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][PATCH] lmbench: Install cache command and fix typos in manual page
Date: Tue, 23 Feb 2021 15:36:44 +0800
Message-ID: <20210223073644.975-1-yanfei.xu@windriver.com>
X-Mailer: git-send-email 2.27.0
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM
 (2603:1096:202:1::33) To BY5PR11MB4241.namprd11.prod.outlook.com
 (2603:10b6:a03:1ca::13)
Return-Path: yanfei.xu@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from pek-lpggp1.wrs.com (60.247.85.82) by HK2P15301CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:202:1::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.1 via Frontend Transport; Tue, 23 Feb 2021 07:36:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff2a1a09-9c36-4217-f8dd-08d8d7cdcc72
X-MS-TrafficTypeDiagnostic: BYAPR11MB3816:
X-Microsoft-Antispam-PRVS: 
	<BYAPR11MB38168BC2782CC6EA492CCFE8E4809@BYAPR11MB3816.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:79;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/MZIbvJW8v8Aqv9wQfHoYdV7XKkMbtxhDI69JqtA+/czz8oM+cfL2m2F+zQ06GtDBL6mag2ymvMtsMJFCBYn6Ar6+iFRFxxNG79/+aL0AiJhgr8A4bqxwDXjrPLtDF5Mux9b8rcDsyVN9QP46oY8vsTe5E9VPgSTICd5xJSjMkGku4HyEtSPkj6XYNgEbmjVShyLkN4/yx/CP7RZIcLyWZ0OfXh5T/0+IDEJAX4y8AAEdWIumbWI6+iCZLuJFB3sda1aQ3Ho9jaKYUE4Fdfnv7SNGYgc5W1Da5tnGsf8qPN5lhyH3I90i14E6hPso2g0WN9w0SZKffbVbkFG9jkXWkufBcLizhXLReF/NA2rYxWCuw4DXRh8nQ6HcmTym8VK4YE3EbsyekEc3BKmgALOvAHi0DNBWrz93gPta2btDSf3j1wmcGLwWIUvhWKnRnGaYbxRgG7xGeHh0zeMGKb4RP9zh3B4pbHWuMC++HK4OUy9fTuhcEvck4qIb8xomD18ANBDAg9PPlr/bPK5IRigfQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4241.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(366004)(346002)(136003)(396003)(376002)(9686003)(8936002)(16526019)(6512007)(6916009)(6486002)(83380400001)(2906002)(1076003)(956004)(316002)(2616005)(66556008)(86362001)(5660300002)(66476007)(478600001)(186003)(8676002)(66946007)(6506007)(26005)(36756003)(6666004)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?us-ascii?Q?SX+PMJLCYhW3GVH7Y68pIUXd8gRWUXD81yR6koJu1771SFan/T0ZpMKfNobq?=
 =?us-ascii?Q?6RC9/KhUoXgxbgH/T3zLaz/2d45SmpNJn9hqQWvqb0SC3kdBIbfEk2FwIgb+?=
 =?us-ascii?Q?JGIzLu2n0qoYYwXvSFYazuBbTBCGGAeVSi/nZEVyWxdnWCyxpxqUQJ1YrKil?=
 =?us-ascii?Q?zSDjwQWVItcmqKxHnyOoBsYIw/C8DL20W5WyDadD0Vx+aAPtMV3d1VtRX9qf?=
 =?us-ascii?Q?oHpu4RKjWOkcfXoGubU6xlHJRfdg3cA4cgDCBLlS42PXBlqwD6jTfjTKf1yN?=
 =?us-ascii?Q?8BWPQZy6GSf96tkSv4vpy1Fb0r2lw3PasdockGWEfRBAHVuShLMQIpy/0mt0?=
 =?us-ascii?Q?iywFknTSVP30rn1cJoqVMoHYAD513Vr5skyXvKtFjR9ENBWbuQmVW1iU5gB7?=
 =?us-ascii?Q?YxneMYF3RSTJ2pADeTqzFL8HGgVgE0FuJ8zMWxvpu+r0bWbG6bTjFqSDp9gy?=
 =?us-ascii?Q?+82D+9UwZAstU4+fnNQ9pd7gd2b943rDhwGYlzoyq7GqXe/elEWkXgeu+eNu?=
 =?us-ascii?Q?VVqPuwG2RhKuqQqJ9YpzKSrvgvVaWmae0RqzstxQ/vqFfnkyTqutF9ogFveu?=
 =?us-ascii?Q?3jFfqFfBqzh2Q14pIvN35qt7EuLtKX+pAGZe+Vqf3jq/fmyHIrUkwEFaRgTe?=
 =?us-ascii?Q?sQ3jAUJujoF52PGHt3j32ILPreivauknN1lk+ZfEySLmNXE3K0yViwIR1ior?=
 =?us-ascii?Q?maqpRv2pj8G1MH0hGalbrCfpCz/aAlA/MEgYcpHQs7A8wM3BYpze6TCs8RLp?=
 =?us-ascii?Q?yZJ+dN4jTix9//9uVDo+xO4zy8RFNvWTHN775oC/pIkwPxlcKOQ4gooaSMBI?=
 =?us-ascii?Q?bfYlU/RPrhH7g1DOGR4EZ/5PHi4unTwY70K7uEEKy2978Kn6eZpUzWZK9rJ2?=
 =?us-ascii?Q?aX16eeV1Psx3B/b9lbV7/MAD8pICbJ5kSex6B1dtqgxTBlpfRKSkuFSh3YRd?=
 =?us-ascii?Q?q3AoyDLuDPyZjUwbLaTOr9/zwEfiZ3htdZZ+ZXRSS7EGEZ2j22ghq3Zqqj/q?=
 =?us-ascii?Q?1GdVMUOXAC6QR4urYAp1pOe0CE54TM1UeD8FqGABvkz1pMnq0MKHcv2o/ji/?=
 =?us-ascii?Q?nxl9bpGDy6GdX8NwGKp0K+l2eXDIUoWGxv1ClsItM2DTOJiKA671qu2pWoO6?=
 =?us-ascii?Q?XjpWN8wP3NtSSWjVZffeWLpSkQthJfciJkzEt4EIe2plkO3ezHuwmDw0CT+A?=
 =?us-ascii?Q?EzzJjJVORWVhFk2tH72MPiSFrTgYH1gJ6cGbR8mmPROkiI96S3XL0TDZjm8d?=
 =?us-ascii?Q?QacK8TzcbgV10vtX55EFevIOiQJ4QgFMLBN07TEi8YT5oFwGLaZhYml8aGr1?=
 =?us-ascii?Q?0S+0awZZgO6YO2owRRn35h3Y?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2a1a09-9c36-4217-f8dd-08d8d7cdcc72
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4241.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2021 07:36:57.2988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZH2unMkyTvk9FgeAlQFKZ31g4QhYwvmfmPONEOv8JA42BNvxp4m5rWZKv8UsmFvK1o9WF/dc/vbbecpt55BRQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3816
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

From: Yanfei Xu <yanfei.xu@windriver.com>

Cache command was omitted when install, now add it.
Fix a few typos in lat_unix_connect manual page.

Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
---
 ...ypos-in-lat_unix_connect-manual-page.patch | 30 +++++++++++++++++++
 .../lmbench/lmbench_3.0-a9.bb                 |  2 ++
 2 files changed, 32 insertions(+)
 create mode 100644 meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-d=
oc-Fix-typos-in-lat_unix_connect-manual-page.patch

diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-=
typos-in-lat_unix_connect-manual-page.patch b/meta-oe/recipes-benchmark/lmb=
ench/lmbench-3.0-a9/0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patc=
h
new file mode 100644
index 000000000..d49dac5b2
--- /dev/null
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench-3.0-a9/0001-doc-Fix-typos-i=
n-lat_unix_connect-manual-page.patch
@@ -0,0 +1,30 @@
+From 9bf2b363c5173c03adecf366f116415dbc559017 Mon Sep 17 00:00:00 2001
+From: Yanfei Xu <yanfei.xu@windriver.com>
+Date: Tue, 23 Feb 2021 10:54:26 +0800
+Subject: [PATCH 1/2] doc: Fix typos in lat_unix_connect manual page
+
+Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
+---
+ doc/lat_unix_connect.8 | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/doc/lat_unix_connect.8 b/doc/lat_unix_connect.8
+index b42e9a4..5ab1a51 100644
+--- a/doc/lat_unix_connect.8
++++ b/doc/lat_unix_connect.8
+@@ -25,9 +25,9 @@ is a client/server program that measures interprocess
+ connection latencies.   The benchmark times the creation and connection o=
f
+ an AF_UNIX socket to a local server. =20
+ .LP
+-.B lat_connect
+-has three forms of usage: as a server (-s), as a client (lat_connect),
+-and as a shutdown (lat_connect -S).
++.B lat_unix_connect
++has three forms of usage: as a server (-s), as a client (lat_unix_connect=
),
++and as a shutdown (lat_unix_connect -S).
+ .SH OUTPUT
+ The reported time is in microseconds per connection.
+ Output format is like so
+--=20
+2.27.0
+
diff --git a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb b/meta-oe/=
recipes-benchmark/lmbench/lmbench_3.0-a9.bb
index 21e81ecf2..e9d1067d4 100644
--- a/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
+++ b/meta-oe/recipes-benchmark/lmbench/lmbench_3.0-a9.bb
@@ -29,6 +29,7 @@ SRC_URI =3D "${SOURCEFORGE_MIRROR}/lmbench/lmbench-${PV}.=
tgz \
            file://0001-lmbench-Point-webpage-lm-to-target-directory.patch =
\
            file://0001-doc-Fix-typos-in-manual-pages.patch \
            file://0001-lat_fifo-Fix-cleanup-sequence.patch \
+           file://0001-doc-Fix-typos-in-lat_unix_connect-manual-page.patch=
 \
            "
 SRC_URI[md5sum] =3D "b3351a3294db66a72e2864a199d37cbf"
 SRC_URI[sha256sum] =3D "cbd5777d15f44eab7666dcac418054c3c09df99826961a397d=
9acf43d8a2a551"
@@ -73,6 +74,7 @@ do_install () {
             -C src install
     mv ${D}${bindir}/line ${D}${bindir}/lm_line
     install -m 0755 ${WORKDIR}/lmbench-run ${D}${bindir}/
+    install -m 0755 ${S}/bin/${TARGET_SYS}/cache ${D}${bindir}/
     sed -i -e 's,^SHAREDIR=3D.*$,SHAREDIR=3D${datadir}/${BPN},;' \
            -e 's,^CONFIG=3D.*$,CONFIG=3D`$SCRIPTSDIR/config`,;' \
            ${D}${bindir}/lmbench-run
--=20
2.27.0

