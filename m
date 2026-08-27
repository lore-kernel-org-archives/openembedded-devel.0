Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971F1C61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:23 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.8])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1896.1787856862427402475
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=UYg11mbb;
 spf=pass (domain: est.tech, ip: 52.101.65.8, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AcgHE1lps9GxbK/Up7NPcvaHQv+d5ItnVmg7A9jC0n7qjNxkD7LYBzvBl43CzCzGcKhQBj3y6TujzON1OFRs1s3FwXshdWf5pjXWJLLX/GH8Frz2YirUYx8ucLSLt6o8onYaCpuU0mIXHIShXhoePmJg7KlcIYWr1dYZROazcXT987A4udtz1LAhuhBOZC1pj1F5luNFLubikEA0pciiBiCxFsS6kFJYV/NDvv0LOxc97VjZpZF2QZ/pI6Fe1nYnZ2Ry5ravLubzBRYUi5l+/uLLwUnz7CdIErpPdL157XQ9fegBGsXRFbZ13EMZeT9R7pB7jQX9N/wU6NRzTQ2pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LtKTByfJXL6BQAVUIjhwFUilu2MtoOBN5FT1fpD2Od0=;
 b=ruxXbeYAL8BsOq3/J6JVJQqKXQlGVpFFgoT0KaJMrSl2lTb+TRax0cH9dm654iOITGyAFHUvpAkSFa9I2YX7hn/hVUpkdOwXqIUbcgyNS5iqIG9BLE8QRcCsxfnxZGGrc+bi0xUdJgkh5sy26os6twU0BaSsVf1oQH6AU+XUlNWyNXA4LEIlt6lqea3qsnia+5nK71sa8acTtsmblo7eA0LkvHHJC/Eae9pgZfcilPs5z6UBYoNMVxFl/Dc8jEnhmLMoWUQU52OeJASlOx8tXK3Bacy3OXhDXTx7TxeNSoUdXRazEwvV1rASms0SAf6uW5JTPVsf+v/UfWzerHh6ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LtKTByfJXL6BQAVUIjhwFUilu2MtoOBN5FT1fpD2Od0=;
 b=UYg11mbbqwbJMYaMIs6aaM6tkpkmjzzBJhD08aOgeZGoBaebLZ7o40tJoPbb9BeCF0WJXsd2vkrPynI0nqwcfBtXrEKoxDh2hXMUquQbsGX3e6H+rTmYz3oLFfSLjqO7M0ty2YiYZtoPOE8Tqu/HZs11Zlk7Umu76I28dRDfnEJIUjMQjdnFOQMwo4gmrp4ZnPNlxlrVyAs1kYT+q1g+HVlXnraGZRBbl5HCoDlwaY2gAZg6I5lZGUY9PAo9f22K5RWaRCgkxseV0h4LkTWszf9XLa3OO2ue01Pr/x8NI+wFm/9Z5mj4/8WB0lvEuDcS5dnJQ+1gTJN7imyJAx29XQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:20 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:20 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-multimedia][RFC 20/20] pjproject: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:24 +0200
Message-ID: <20260827185324.78997-21-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU2PR04CA0001.eurprd04.prod.outlook.com
 (2603:10a6:10:3b::6) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f4ae3d4-62b4-4bf0-2bc1-08df046c9a3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|6133799003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	o8DCC2Nfn+zy54/thcGx25XX7o+puoorOan3R1qYx2CRDIUKea4dRX5vlfjzoYjt5kXhmxLDvG7ejCyV1jmnOnqZ4VZok4DuWQSgcQTiLfvybkvnNR0gexewoAPyjTKo3T5WCsMbutt0iWcbsm8AWXOLNxG9HWeB+DH3lWQbcgOhtzcUA0djOa7+w8278WIrK0Qh8j9gpb2OQObZfbXwGu2pmJ3XsRXgoXYSoWQNcF+Fe0RAL2p9HSOebjA9aLdw8XKkojVttxB+OLrrARTDlwuGOC4e9Disowq2p9nIgxLmqUGd8mmp6LLkGlsduEXcD4FHJs9hk5fWPb+48SOzMLkjC/rLCl2zivMBkyXnIXtSuVdiqbENhtKv9S0E38bAMJNJzI3Pvg3Z+3nqqvFd/IAKmKqHHganGTKD552Zk5HD/nehtg+UJoc4FMcGVThqbWujTQxqPYadQ76cMnp7qyFEj2FQ+v56486eK7xOx3/9ZMEpccjBtJSCM+y7qGqWDQ+D3AJ0vHfFQfvh822rJu4zg/6lhuFdsv0Dssqmsf1huIZxgO1gHDYzuNmx0y/OS8qRqomCl4wN5eLO5JhBs2KVHfB3oCl+c6JtHK6JN9yETEECmHiXpquiN9rt4rWIsz4URFz1ZrMhx+bRqrzsYK5mpFgrd7CJgxwUDZD5H/w=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(6133799003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AoIe+AAMPmq0zNXpFl0QHsip/Y9XZV5sY8TQeApXed/1A5JVTlV9WCXNvIWn?=
 =?us-ascii?Q?yBKziwSugBVFabrlCrDq9w68vbJ3WpxIZElJNAaCFPU4Eg8sso2riuaDVOI1?=
 =?us-ascii?Q?jDtHayXiusgAd8MIscMjsxsHWD7E6JceSJsmlgn08dgzBogk1z2gH9kkhHZK?=
 =?us-ascii?Q?dYoeUfE7cBJ8dInIDtjJkVjK8XgUqp/bB8o78dJ0nkvamfwJvhHN/vE7ls5u?=
 =?us-ascii?Q?BBL9IP2n8MjXgTdwXIY5SCucR3DptNoAh1qelq/HbYVHF7eTvEdO+2iSTYrt?=
 =?us-ascii?Q?j2xHwAF+rvO8EgYfOx1j6fAkdB6e+l3iztf2cuF3hlrPEOAhWCyyj8HuqWXI?=
 =?us-ascii?Q?HjVzPYSYk0ULuTqIFFq67hMx8VGHd2MFAwx/MmN61DZvLzo8SeT8Tm9jIWxS?=
 =?us-ascii?Q?OR1ZjDdbRRsjaizZ8w6UH3hIPJFY5irqrW0GsZJ7j6Ws6BQHvsKWvfLrwgnn?=
 =?us-ascii?Q?lxCLlaBijb5i1LplxIU3ghs1mqj3ydgFmtkLDi2Tf7qits+bX3u1B3ThHd3J?=
 =?us-ascii?Q?XQo2d02rxgkm8Of8An3lEy1UNIfZT2bbF7j5uKVSII+NniFfFsHm34U2Zp6u?=
 =?us-ascii?Q?E9H5LssdPTy75O/ydzKhYi4O9od576qs/TnyhW95qGkvUrbFfSqfK62gRe5j?=
 =?us-ascii?Q?bWwfoIst3r0bES2JGymaNTCQy22A2HQnrToakkR1NHuYJt0ZPQdCLpqpdjoa?=
 =?us-ascii?Q?l6OAeBt4vtttLkol5DcDZLlFY37HeE7U5eRxr2HcFb/NFQD513aQOEd7ci5o?=
 =?us-ascii?Q?cwe99Rh12GDnosx8sPJB6mn5bMoqyLoaf40pZMNLHpZpZDzLfIMcMlSENMO9?=
 =?us-ascii?Q?VSF+X9ndUwhKpsLQYkezVfKIDAbPUDAGZPAMhoPPV/Yd8/5ZDiK38sQj0EJP?=
 =?us-ascii?Q?EPOMATxT6yqug94m8NdArT0zfNSGND65DUficngnHjeTmRm37Zv7DRm8lL2t?=
 =?us-ascii?Q?ciZWcP3z880Cw+D1r+XH4j3WTNUIxuQJw+3VFOzXgsyW5vqzVrmNIiKarlEu?=
 =?us-ascii?Q?HPsMQyRxUWoTRxIxwcwy+8TVLNMgZAjIOZHW0G1cJDOPD5Gijb7Tj4gcmdCX?=
 =?us-ascii?Q?3mZ+zsZRsCRGPJiVGFw7sCZQx5zpzUIFlURFNqpkzmqDuX5vAclQXIExSYiK?=
 =?us-ascii?Q?Csvd9ORjR0ScC2fEx3gvF2N+QnD9xURsMoS/XykNHOBSOkR5bTsWuNBJt2LM?=
 =?us-ascii?Q?z5vdxkmtqin5ZwDMB63x+bXDvpjZbBulKTv/dqEMub2B4RRIy9wTJ9g5WjtX?=
 =?us-ascii?Q?03VBMmlCJqMQN2kBKySt3nHj37tsspnA8wQ5HdZvRSX84spWDuKKt04FZsS9?=
 =?us-ascii?Q?Ju42oCjXtAYtib/+4OLgkdVaLrUrA1nh7kH96trLR2O9jBU8kIbgioZ9vzG6?=
 =?us-ascii?Q?tPa53yaC/qKFYQdeTizgmXsYiO7F7jWEU1bVj+axIPUSubiF7zShOQb/HpQX?=
 =?us-ascii?Q?EXQAJ+OP1GzUD8bWt3FUzJNehLoJbJHMdL1hRnr3v9JySUJ4ZnZwYM73stnV?=
 =?us-ascii?Q?9TmJunL5P92WFdx4/ACy4TokPzZiz25eL1Xf8m/FkD2gj8Jd2iYi9VpKGir5?=
 =?us-ascii?Q?RVXNdUzWZR5A6//ljhk74rr6GsYps+T4D6HKgm0hCp+2hhCvM4BpyZy+0EVd?=
 =?us-ascii?Q?ciGcQ6ymDmJeh++4u4tn136eb9qn960/vTbtbOu3jLGiSKZ4YINDZJ1mrH/0?=
 =?us-ascii?Q?p+pJBsycxE2DWhIGYT8ytdlaQi++I6kn5DLMX1+XkkA3+NCzYnFSnQqXBSw5?=
 =?us-ascii?Q?r66Niv6CJIz7+jGLC+Z+DtQcF+FNHVE4NwFatdK0uzOkYjGojGDR5JKyUv5Q?=
X-MS-Exchange-AntiSpam-MessageData-1: /hdry0HlGkv+x7NY9kBJrEpYk7+xm5KOqWc=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4ae3d4-62b4-4bf0-2bc1-08df046c9a3f
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:20.1589
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: stU4vFBzXHZeuGj6e4rk3o9Bu6HKea2PXk5MgUKjmqsQQBjzw8KdUdg40UFC6VQmKlSvdtTM3yHFwOwEmvTkh2YwZwU7blGf7yoA79CuMso=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129555

OpenSSL 4.0 makes ASN1_TIME opaque. Backport upstream fix using
ASN1_TIME_to_tm() API.

Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/3923fa=
d2e4f6]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...k_ossl-fix-OpenSSL-4.0-compatibility.patch | 40 +++++++++++++++++++
 .../pjproject/pjproject_2.17.bb               |  4 +-
 ...L-4.0-const-and-opaque-compatibility.patch |  2 +
 ...sport_security_utils-for-OpenSSL-4.0.patch |  2 +
 ...ing-const-qualifiers-for-OpenSSL-4.0.patch |  2 +
 5 files changed, 49 insertions(+), 1 deletion(-)
 create mode 100644 meta-multimedia/recipes-multimedia/pjproject/pjproject/=
0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch

diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ss=
l_sock_ossl-fix-OpenSSL-4.0-compatibility.patch b/meta-multimedia/recipes-m=
ultimedia/pjproject/pjproject/0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibil=
ity.patch
new file mode 100644
index 0000000000..938eb6620f
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject/0001-ssl_sock_=
ossl-fix-OpenSSL-4.0-compatibility.patch
@@ -0,0 +1,40 @@
+From 3923fad2e4f6f3403c3d6f1176b113c1c1b91066 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <rks1986@gmail.com>
+Date: Wed, 24 Jun 2026 11:30:40 +0200
+Subject: [PATCH] ssl_sock_ossl: fix OpenSSL 4.0 compatibility (#5036)
+
+Upstream-Status: Backport [https://github.com/pjsip/pjproject/commit/3923f=
ad2e4f6]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ pjlib/src/pj/ssl_sock_ossl.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/pjlib/src/pj/ssl_sock_ossl.c b/pjlib/src/pj/ssl_sock_ossl.c
+index 000aabad61..93fcf10f14 100644
+--- a/pjlib/src/pj/ssl_sock_ossl.c
++++ b/pjlib/src/pj/ssl_sock_ossl.c
+@@ -1645,10 +1645,7 @@ static pj_status_t init_ossl_ctx(pj_ssl_sock_t *sso=
ck)
+                     if (PEM_read_bio_X509(new_bio, &x, NULL, NULL) =3D=3D=
 NULL)
+                         break;
+=20
+-                    if ((xn =3D X509_get_subject_name(x)) =3D=3D NULL)
+-                        break;
+-
+-                    if ((xn =3D X509_NAME_dup(xn)) =3D=3D NULL )
++                    if ((xn =3D X509_NAME_dup(X509_get_subject_name(x))) =
=3D=3D NULL )
+                         break;
+=20
+ #if !USING_BORINGSSL
+@@ -2105,9 +2102,9 @@ static pj_bool_t parse_ossl_asn1_time(pj_time_val *t=
v, pj_bool_t *gmt,
+     pj_parsed_time pt;
+     int i;
+=20
+-    utc =3D tm->type =3D=3D V_ASN1_UTCTIME;
+-    p =3D (char*)tm->data;
+-    len =3D tm->length;
++    utc =3D ASN1_STRING_type(tm) =3D=3D V_ASN1_UTCTIME;
++    p =3D (char*)M_ASN1_STRING_data(tm);
++    len =3D M_ASN1_STRING_length(tm);
+     end =3D p + len - 1;
+=20
+     /* GMT */
diff --git a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb=
 b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
index 44100c8231..8aa7775205 100644
--- a/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
+++ b/meta-multimedia/recipes-multimedia/pjproject/pjproject_2.17.bb
@@ -12,7 +12,9 @@ SECTION =3D "libs"
 LICENSE =3D "GPL-2.0-or-later"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a426=
3"
=20
-SRC_URI =3D "git://github.com/pjsip/pjproject.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV}"
+SRC_URI =3D "git://github.com/pjsip/pjproject.git;protocol=3Dhttps;branch=
=3Dmaster;tag=3D${PV} \
+           file://0001-ssl_sock_ossl-fix-OpenSSL-4.0-compatibility.patch \
+           "
 SRCREV =3D "5a457451fa2712ba18e12b01738e8ff3af2b26fd"
=20
 DEPENDS =3D "swig-native python3-setuptools-native"
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-co=
nst-and-opaque-compatibility.patch b/meta-oe/recipes-devtools/grpc/grpc/000=
2-tsi-fix-OpenSSL-4.0-const-and-opaque-compatibility.patch
index afaaf509ad..91f9c7e815 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and=
-opaque-compatibility.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0002-tsi-fix-OpenSSL-4.0-const-and=
-opaque-compatibility.patch
@@ -10,6 +10,8 @@ and use ASN1_STRING accessors for opaque struct access.
=20
 Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
=20
+Note: Our fix for areas not covered by the upstream PR.
+
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  src/core/tsi/ssl_transport_security.cc | 10 +++++-----
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_=
security_utils-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/0=
003-tsi-fix-ssl_transport_security_utils-for-OpenSSL-4.0.patch
index a7d6c0f789..56eaa50ad4 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_securit=
y_utils-for-OpenSSL-4.0.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0003-tsi-fix-ssl_transport_securit=
y_utils-for-OpenSSL-4.0.patch
@@ -9,6 +9,8 @@ auto* for X509_NAME and const for ASN1_OCTET_STRING.
=20
 Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
=20
+Note: Our fix for areas not covered by the upstream PR.
+
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  src/core/tsi/ssl_transport_security_utils.cc | 10 +++++-----
diff --git a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-cons=
t-qualifiers-for-OpenSSL-4.0.patch b/meta-oe/recipes-devtools/grpc/grpc/000=
4-tsi-fix-remaining-const-qualifiers-for-OpenSSL-4.0.patch
index 468aa9d669..956ea64f33 100644
--- a/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-quali=
fiers-for-OpenSSL-4.0.patch
+++ b/meta-oe/recipes-devtools/grpc/grpc/0004-tsi-fix-remaining-const-quali=
fiers-for-OpenSSL-4.0.patch
@@ -10,6 +10,8 @@ to avoid const-to-non-const assignment.
=20
 Upstream-Status: Submitted [https://github.com/grpc/grpc/pull/41932]
=20
+Note: Our fix for areas not covered by the upstream PR.
+
 Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
 ---
  src/core/tsi/ssl_transport_security.cc | 7 +++----

