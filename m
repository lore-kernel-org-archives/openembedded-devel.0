Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54ACDC61DB9
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.37])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1881.1787856839229758022
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=E0zSuJs9;
 spf=pass (domain: est.tech, ip: 52.101.65.37, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uF45eWM8YKJTBe8c8dOI0FbwPmFWqQMBLqzNju1fEKA5SsdILltjHFPML+Xf/ylchUGTyyeqnTVVaXk/3twZvoDiAmhCB4k4Ivb0rQVThPG4XkdirbPG3/vTRM7RPOuek4hvsMd5xbnKO93QUWmy2gocy9hgdwALfYqB317R2FRLKJKfkDEs+bL85MHlkj+KkoktyWi7wiCdt154aQaN803PCptrmOd8VhmdfFbdE/KeQt4jz6iCATNZoxgaceuHFWxN/h/Vih58ZVX4NIdlHR55KWUblC12H3+IkQEF32uN9xe59NYTpumyIMCv1dCsk9ndicjFuF3JOoeT62HmYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HtjwWOwBbacWyKYkZJ31drK4XpD6NcjlQk6m62LdJBs=;
 b=BbUpbPwrcqIx6wtStc4rb0Q7cRNlkxyZf+aXTtxpOO8o4OU46ML0fMlBniiR6AQ6gFSFHvd5Jk2tGTK72gw3FP0uPlOT2iyPjDjvnApldmPnKHjRNNpqm66Co522kPMwElTECvbrxQcUGRedfdsra6YuyKRMb4ru3deu1McF+aN7UJybIdAYeqAmPvnllj9q9V34qn6xJCCgbkv2nkBxHZLL/HGLy+VzaYjO3QhGnLTrjTiWGm//B8jC4ivV+/vyV2R2IJqtyNXHNjop14lZNzLk8+GV1vzPBo+L9x8gGd3xcU2sotkw8iJtmeAbtkFuaCmRtugoYD3JJyh8YKTTlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HtjwWOwBbacWyKYkZJ31drK4XpD6NcjlQk6m62LdJBs=;
 b=E0zSuJs9P0qHb/k6rcnJSuaCRrITmRviDl4Adwa+ubZ5RHfOXBSPkqVwuwFGBhEZnooYWCmy7Tnx3sF6BXOATBzBF1DliBl2XXGefVGKr9xrepQu2wrQIsk+BawCPQr49ELSie2swhDpIrXabpseEvMQSRRvZWPXIwnTbtJxujCHaf2bEknKzbPOFSp5biH5FCp4mC4ApkzvmlMYnVE1L6iu29Iw8RPn236iAFaxumBDet+7tUgebLVnUKtXGEXGojkozlHGBfVJ1tVJwuHgOdOpNs42SCWlpHbyS0h1VPYPbfnxOuyD3eWHc3Jl7GMOiE8KtJ5ECfFvnYx6uAf3Mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:53:56 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:53:56 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 12/20] lftp: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:16 +0200
Message-ID: <20260827185324.78997-13-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO6P123CA0039.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:2fe::19) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: e2cf6920-dee9-45f3-e73e-08df046c8bfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|12006099003|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	UByva7wBraUQd9cKUrgbY6b1l/LdDM3OxXSXqU8Zh9O/fb2kiOJhXymvm72WADPUarifEJpoxMRB6APZrQ2M2NjTkm5hThVf2ugtd6QYtz87coAlcyte3IqgA1auA/5u0Kj4u+76zzqJ/AlBLDCi3btc8aJw5TRF38ovNAjm/mJ7RNPXpgc3oD+RzlQ0OF1VaWcbhxGOIVIFGTKDrXafDgsNPkHVfZQvP10uduAZ0OcmXQhdROWqVeNnQFta+8R92Ex+WeRSLewzkcnOJmjWjh5VcxMG+v/g5RmsycdXQFFOWzeQpRrhKnDwReugSsRKGblOrx5Rgrcm21ayDi0L0uJH0266GLrABzKapE+veSdSApO5w7lxmA0fKdmZR7MAVHeEN7yw2pah2Ls1xsCNIYj1MyQzSuBkzWozCQ6Hf3LqGc8VFshwmI/os9K0QrMjJoTyj80tFSR3NCL8AlyDwBfjxYwRARQ9IggS9bhd673c/eAVGOwoTmRz+8K3EMwZPfBk8wFxhihk2akLnCnLPj9yclssoz7l3BbfZTxdKPjfVAeOAdjNTi8cSpIi91Ux+vyuAvKY+VvgDzJhtu2lzHbHQg5XfVIcwPj3ilWgyYfIfULrLRQnQn3LRgRV4q0F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(12006099003)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9Wr3JBLaUMrLAJq3lwa4dA4NuNpSAqFP8sIOXm2fYj/eQ6J7l8FhXVzqud5h?=
 =?us-ascii?Q?wmJSjp8Ssmwe0QJVQ1iyfVjR/uFyiMhlHxSrGLcDJ+t0lNbPDiFdhNp2lzF7?=
 =?us-ascii?Q?a+FR1AHb8LNkwRviHYhqGQhjep3iMKKwQ7iEIviKzJ3Q1JQp9diGem5ZlUqF?=
 =?us-ascii?Q?p5erN4UY+uOJ8fmND39WegXv8F0ZAqSrQDBIPTDZ480873dCXzc4OrzDAhkV?=
 =?us-ascii?Q?WSaR5BoSV5ypAP/03iXtormCfRowZaedFgiQbiVlr6Z8oh5eDSdjgkf4L/p1?=
 =?us-ascii?Q?eQ9btvIJdrEqHVv4qU00pKNESXtoR0FNNPinzIWcEUM/ROx1VfBUsW1Avoqh?=
 =?us-ascii?Q?m/1T5or4O/Y8Ag3Oj3L+xjZddHfK7J2Z3w9SQ+CXaG3MTEwNRNIZwcU0MpH/?=
 =?us-ascii?Q?Vy9/1VN7mDOjRhy8DcX4Oi4ljrnkMdgzQgZKuL+vImhsdGeOjV0cYQO40x3A?=
 =?us-ascii?Q?5KWidWdlYRKwPankeyDv+i4np25NMly+csK9lxtnONuvK4nE0qiO3KT8CyOz?=
 =?us-ascii?Q?qFZX6OnLS5IfvODJ+MCQ7XwN4Fm6pOjhZu454jzsFDf+GfbbCe0BupZZf78c?=
 =?us-ascii?Q?OxH4O4ZhXctvfM7MWxyhwjjCTjx74NVcDBbBpSDHk4zaN4jkON54vIrdZgVb?=
 =?us-ascii?Q?hTSRR5Ws2jcPUkRBilsgDmAiKdm8GbFbwk3y9I/G/ml7oSw+wQ/cROVHEKPq?=
 =?us-ascii?Q?Q5eAWnVS8XU9R1sKGKMAVygGPBJf4OhcQOJGspkVZpLgKiwDE/HZI2OsuDVZ?=
 =?us-ascii?Q?7mW003mmQFfHPMg3UtI6f+Hr02Oi9ajknNwq+K6oCgODM6jF1F9Mu6woyx2t?=
 =?us-ascii?Q?L4ENVhOUEI7PivZ1+EB9+osd6bsUtp97OKBVOFx0B+WEJfhyaKTpncrFbZoh?=
 =?us-ascii?Q?J+y+UUO3+hU9FticrIKTYE/8JNrdbG9FqqVaPMsbImYLUgh4cm8cGTVReXs4?=
 =?us-ascii?Q?xmMTPe5r0GpGZ7HTKjmGZ/a5qMdXT7e6H6Ih4vNdC7fEQpgDWA0h8G7gfZ/z?=
 =?us-ascii?Q?lXqU4jaXwSOosAGLT9iPYrT3DUVYl8mwgawGW08zafN3lZmwPpIMSEI/80NY?=
 =?us-ascii?Q?Kl9mNPtZYOl38epQyNhJpxLbZV450hjQvbZyiO3l3loEEuj3Xp0vpXerFUzZ?=
 =?us-ascii?Q?VqzJEwlEe4ttb6wdR2Fmyb3g2k2oku5oMonXtHhYj0NIPP9mfeU5OKwly1xk?=
 =?us-ascii?Q?2mav0uFB3KM7zsNNRhKIHzLp1Z7qsz7tPekCBbYsTsNjXXwbXe2hfT5jkpTT?=
 =?us-ascii?Q?IapUqSG1YfJ3r8P0d7wIvfRCApd5HrD49W7xqoGeXF42cIYDLeVa3d3DNtBl?=
 =?us-ascii?Q?ou4VdHemmRf9LDZ/q6E/ZDF4LELlxgtXw6ryGg4P9/4q1YfZT4CNnuIinp6Y?=
 =?us-ascii?Q?ZMLpQNuM1bJXz2qrSx1VgQMyMbx3xye2rnj2lSK/UUt0JIVPPZlnTBv1zOsK?=
 =?us-ascii?Q?QAA1LO2JxeO7pr8yq5eY34/ezj97qE7r40RMD+VINjMF31CYwx0aEMDFIVJZ?=
 =?us-ascii?Q?FXTzavKU5z9Rm3RLxcbBsLaQMoapjoYEXZw8WU1wksn4X3BVnVbI8JZy6M8O?=
 =?us-ascii?Q?RUsNeTInmc3+aU7nmYMcjmBH6T+/YlYuHD0AKoTMehHhEo2NZsXKBEE1UqFb?=
 =?us-ascii?Q?lU6t73m4zESObOZUeEUfZuKYReBOt26KD0W4aYGaF3xV/R+EDcXgRa9vb+k7?=
 =?us-ascii?Q?JXAMvpIMM5/+jjKfXul9srKzrgEhkAERmxuJA6Rj0dxCerzh+2Tdy25TzYjw?=
 =?us-ascii?Q?2c52UGOFcxXDPkgjtLQUQdsRKijT0k+kFBGQqnBY77JPq5uszCZStJMgULg9?=
X-MS-Exchange-AntiSpam-MessageData-1: buEMUzw2CegJoRIK2zF+wof/ZtagvvYAjws=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: e2cf6920-dee9-45f3-e73e-08df046c8bfc
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:53:56.2489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WUACNcn4QAMFEgirK190ZMPvjaTDhLD45FT0ELMBDpw7qs0L6dUSfLdMoCyFspsycKQ9dQsgOtSFy7KQFLHiht7IUL46wkEGCgA2uYP1wT4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129547

Backport upstream fix allowing build with OpenSSL 4.x.

Upstream-Status: Backport [https://github.com/lavv17/lftp/commit/68d42105d7=
88]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-allow-build-with-OpenSSL-4.x.patch   | 55 +++++++++++++++++++
 .../recipes-connectivity/lftp/lftp_4.9.3.bb   |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/lftp/lftp/0001-all=
ow-build-with-OpenSSL-4.x.patch

diff --git a/meta-networking/recipes-connectivity/lftp/lftp/0001-allow-buil=
d-with-OpenSSL-4.x.patch b/meta-networking/recipes-connectivity/lftp/lftp/0=
001-allow-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..f617a0e269
--- /dev/null
+++ b/meta-networking/recipes-connectivity/lftp/lftp/0001-allow-build-with-=
OpenSSL-4.x.patch
@@ -0,0 +1,55 @@
+From 68d42105d78838d0ab155296b69fcb99d28d22c2 Mon Sep 17 00:00:00 2001
+From: Rudi Heitbaum <rudi@heitbaum.com>
+Date: Sat, 21 Mar 2026 03:56:46 +0000
+Subject: [PATCH] allow build with OpenSSL 4.x
+
+Upstream-Status: Backport [https://github.com/lavv17/lftp/commit/68d42105d=
788]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/lftp_ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/lftp_ssl.cc b/src/lftp_ssl.cc
+index f53edf24..49328f74 100644
+--- a/src/lftp_ssl.cc
++++ b/src/lftp_ssl.cc
+@@ -1022,8 +1022,8 @@ const char *lftp_ssl_openssl::strerror()
+ int lftp_ssl_openssl::verify_crl(X509_STORE_CTX *ctx)
+ {
+     X509_OBJECT *obj=3D0;
+-    X509_NAME *subject=3D0;
+-    X509_NAME *issuer=3D0;
++    const X509_NAME *subject=3D0;
++    const X509_NAME *issuer=3D0;
+     X509 *xs=3D0;
+     X509_CRL *crl=3D0;
+     X509_REVOKED *revoked=3D0;
+@@ -1436,7 +1436,7 @@ void lftp_ssl_openssl::check_certificate()
+     unsigned char *nulstr =3D (unsigned char *)"";
+     unsigned char *peer_CN =3D nulstr;
+=20
+-    X509_NAME *name =3D X509_get_subject_name(server_cert) ;
++    const X509_NAME *name =3D X509_get_subject_name(server_cert) ;
+     if(name)
+       while((j =3D X509_NAME_get_index_by_NID(name, NID_commonName, i))>=
=3D0)
+         i=3Dj;
+@@ -1446,7 +1446,7 @@ void lftp_ssl_openssl::check_certificate()
+        UTF8 etc. */
+=20
+     if(i>=3D0) {
+-      ASN1_STRING *tmp =3D X509_NAME_ENTRY_get_data(X509_NAME_get_entry(n=
ame,i));
++      const ASN1_STRING *tmp =3D X509_NAME_ENTRY_get_data(X509_NAME_get_e=
ntry(name,i));
+=20
+       /* In OpenSSL 0.9.7d and earlier, ASN1_STRING_to_UTF8 fails if the =
input
+          is already UTF-8 encoded. We check for this case and copy the ra=
w
+@@ -1522,8 +1522,8 @@ int lftp_ssl_openssl::verify_callback(int ok,X509_ST=
ORE_CTX *ctx)
+    if(cert!=3Dprev_cert)
+    {
+       int depth          =3D X509_STORE_CTX_get_error_depth(ctx);
+-      X509_NAME *subject =3D X509_get_subject_name(cert);
+-      X509_NAME *issuer  =3D X509_get_issuer_name(cert);
++      const X509_NAME *subject =3D X509_get_subject_name(cert);
++      const X509_NAME *issuer  =3D X509_get_issuer_name(cert);
+       char *subject_line =3D X509_NAME_oneline(subject, NULL, 0);
+       char *issuer_line  =3D X509_NAME_oneline(issuer, NULL, 0);
+       Log::global->Format(3,"Certificate depth: %d; subject: %s; issuer: =
%s\n",
diff --git a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb b/meta=
-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
index d132813403..e46b5c7f10 100644
--- a/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
+++ b/meta-networking/recipes-connectivity/lftp/lftp_4.9.3.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463a=
b874e80d47fae504"
=20
 SRC_URI =3D "http://lftp.yar.ru/ftp/lftp-${PV}.tar.bz2 \
            file://0001-gnulib-fix-lftp-build-with-clang-lld-and-gcc16.patc=
h \
+           file://0001-allow-build-with-OpenSSL-4.x.patch \
            "
=20
 SRC_URI[sha256sum] =3D "adceaef1bd21a38d07c973233fab603813c431f0a8dcbd2323=
9fa9a41ae17b6e"

