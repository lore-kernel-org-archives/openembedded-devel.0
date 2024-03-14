Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A18C5475B
	for <webhook@archiver.kernel.org>; Thu, 14 Mar 2024 09:11:04 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.121])
 by mx.groups.io with SMTP id smtpd.web11.8295.1710407456865300792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Mar 2024 02:10:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=PzfNtSQ+;
 spf=pass (domain: navimatix.de, ip: 40.107.20.121, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l0K348PnT/Vc3T+OMCaOAH/qo3ODjc70hkoU2Y4c+cBDNOaaeO1g2yxrEFIuOaKJ6BH3pR1FwS7Hx97iTyBpkzEy1ZgT3RRcsrsE1lA6Z1vaPs5BOZQycJEgxB8ZCnwgRTTSUWeQ3eM7M0/2Hqya5TVmYzqmnOJX/lLeCnN6fcyXl5EgIJuXgBGDKGz3U66IKNHsG5RRg8axhty8G3EJF1RbX9PCk+ZG7iaLJrfQMjBxILUv5v0pFfyR4snoqd6mALQn258ocMjgKNH4Ob/NadVeKL6Savqdw7g96lzFUAl/tRtmxTKw8jXeJdTSf5ceOHGzxZIPrl0iHcysohi5rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DnBOlBlDkb/VTRVtGjSAWQW6woFvaktXi2IgZCV5n+o=;
 b=D5rRGD2Um9OYfpxWBOfemHrThvQj3Uj7TQI5cNiDuC+ElztZJUMIMC5O2gV8yiAGHY+aEf53vQtRKSmC8heWQzjLv94Di9J8eZzCXU20ET3Ck9txp6V3FM8QInhIPgrfl/wulKx/G1gbLZ+2orK4GFrVvN02An5yu4ayU3HK23APKFE08kWmWgIkqlV7V3HRyMOzQtzF1SfGAaeEsHfQLi4eDiPapc7v3dcYh++mbmdEUW3AoanL7XJLE6lKVI76mi5pxqROLuYDK4bPSVF7jZvCK72NRZe20JsRQRnHFI2EivM7BsDnndbHSsWCe62kTAxpzXSkfpNgSX0qx8RgsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DnBOlBlDkb/VTRVtGjSAWQW6woFvaktXi2IgZCV5n+o=;
 b=PzfNtSQ+AZyH5eeDsTYByPX8LA14QYisJtIDtbr7cQZ2gnR8Ju5wEXRfK34pH2MWpVy6p+je8eboGAQqXuvKfUXTURTZAwqEMxE+I8I6zwhUzFejMI7SJjngBTsbju1mXOZi5C0HyGmfnVBWFR0/o4786rqPQepLwRU//sZfe4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20) by DB9PR01MB7868.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:21f::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.21; Thu, 14 Mar
 2024 09:10:53 +0000
Received: from DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5]) by
 DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 ([fe80::25b0:e60e:c5dc:54f5%6]) with mapi id 15.20.7362.035; Thu, 14 Mar 2024
 09:10:53 +0000
From: joerg.sommer@navimatix.de
To: openembedded-devel@lists.openembedded.org
CC: =?UTF-8?q?J=C3=B6rg=20Sommer?= <joerg.sommer@navimatix.de>
Subject: [PATCH] sngrep: new recipe for ncurses SIP Messages flow viewer
Date: Thu, 14 Mar 2024 10:10:43 +0100
Message-ID: <76e6ebe89fdcb927fc181ca0b7664f64079b380a.1710407443.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0138.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7c::16) To DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
 (2603:10a6:8:7::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB3PR0102MB3658:EE_|DB9PR01MB7868:EE_
X-MS-Office365-Filtering-Correlation-Id: ea05891a-449f-4bcf-c53d-08dc4406a634
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	k1Bh/rB7gf37zoNDuVZNaIG4AzTYjGnOJNafbtIQ/NBB5sw2lnYxYAqVStDtoN8ylH4FYKGTzTtZ0AZ1YRM48CUnbbCh1BWrQ3tp9KbT4+nqi46MU75ZXrRA0gwmD0viRHd+DSH/vcXXlfybhECn8lpeOIcO3yfS+nrAM9eceRoDTnNymnaCeqIB/6Pu6JCwHQsrNW3j3uA3EecP2bR1zDAr9HO4XlNGxADE44gnsm43hqxqG4kYCuy4VbJwCqzch1pE+Qyf73twHIg+4vqSMYJI+wRdGjfZZTnPdH+Yby6typTEqA4fTba7+Mr3snosp2NkiANqR2eTcB53IBY+yBge6ALfHVUfocYchwUVhtfI/UgjqXakM1O6GDrxI2xZaL1znZVB9ESN1PcLPTmt7ODpwwhy5jx5mbe3QdF3vmztCSirIRWE9HLKkHnPAydefVoHEJVg+Mb6Uq2JPe5oeqLTlKyRzqt+oUO7j4Os0Uoe72aKwodGacS0ni/9D9MfROBzqgfiRcgiUged9GTYgI8bZ4B1nxMv+zusHy3mVZjvtGRS4gTK3zAPUV1ouRrDESA0f6EoGstec9rsCMPqiJX0iiIY9k62rVZ8MsBZlOC3XA5JUGWP/+aa0gTt33ZoDV70HA10L551QJf9lyih2PpoTtlZhtici927vdTOBTk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0102MB3658.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?kcBqxIEb+J8yJOXhYoEz6k85lVUXZXpTQGz7zp9GXzvmlJY0m9+v8E95VZBD?=
 =?us-ascii?Q?g/v9gRxDONr6Mp5I7ENKGLWbQ0AYO14c3+JuNZQx5+UBzCRvtqO8zfrNIMP+?=
 =?us-ascii?Q?cj194ig2Vd13Pcq0GlspDk83T7mHRY8YdLiexriQhc6tbW9nvtJo6buwEUhB?=
 =?us-ascii?Q?/h0eZaBLn9PrrX509Iig831DjObt7Dn47GbGDkT4Dcg22TBeWIY+WgXcPuhD?=
 =?us-ascii?Q?BY0whUSjOqz9jcb6pKJtAlKLIDyCI1Iuf8abiw4DVBJNVOOAEFGfO2eRM3Dp?=
 =?us-ascii?Q?SVrt/LCBA032rgMt7pbG+SHncqrEBOSdFSfiIICGAceiD9S9cYuEAjRm054J?=
 =?us-ascii?Q?EDQArN3ZOkU5itnn5fpYiD4JnWTlVbMQ95uwE4WqjBK7yg97yMrK29llIGjZ?=
 =?us-ascii?Q?veHpq2J080BVh6qPXakY18Y1AVlA9w1915+iYa8eYJV0MQSe6UkYtvw5TDMf?=
 =?us-ascii?Q?URQ2xYR/0+NaKUO5VM3l8n2eHzGviaOouTU0qNU8qjWpegpXKFcNGzz1gZFL?=
 =?us-ascii?Q?dzElPK2K8kmMYEEMbAKfEzZy6PX6lPGZSr91YXoogvDjLsGZfcDV2f/GVw+A?=
 =?us-ascii?Q?psuU/A8rZr9tM2LOiDXSLJfH2ue9q62T1v/1ZMdWKk3kGu6l4rSYiMZpfwJk?=
 =?us-ascii?Q?vjxt125wF1PWe+BMmJANqIV3hDgQAMWB7AT0d0RSl5c8ZzLkObUC6XdUWYBo?=
 =?us-ascii?Q?p4rbgUo2hSLZlWKrgccjXkSjhNxLCGNuxjgGLo+O5OnmjMiLZkqrNYJPMb6s?=
 =?us-ascii?Q?3Mn+yopxOymlIhkQPBtHwdF1Pj6wflq5+Bu02KjM7u8KqHyM9m0gdHeBZZ6e?=
 =?us-ascii?Q?ZLegyTF4iPz4WQYFQlt70wd3s6Da1iavQZXkUKI0092jIFWl1BSSl05uRaQx?=
 =?us-ascii?Q?+4Mrg164mWgx8fsnyotarar1ywiUvY0f6efgCl0u3gudQxXRnXBbEUKGQMg3?=
 =?us-ascii?Q?4CHZoB2VPVYMEXyCjGQi0PNQLw7mkHm1RwuqN8pwtTKq/Lj3h5J15v59709I?=
 =?us-ascii?Q?Kj01Y1S6WXZymmZI7/6WFVJywLILiO6Z0nR8PvT8ulIQHuY+0C71nWXH9OR+?=
 =?us-ascii?Q?Qa5XOxpz7dU914EUggXPo+Fe6pnVMYD0DqdG8OzR1SZDwMYX3f/dcJzAoZC2?=
 =?us-ascii?Q?KNmhpYJObLjdueaNXSa5v941gSAva2/udiedvo5RppkUPqJrmunV6xhVIjzS?=
 =?us-ascii?Q?R/MdWP5WyxXOaWAspYcKqaRSOewxpBOeRootgdz8S7zruO56Q/xUKcA7/SCZ?=
 =?us-ascii?Q?/YNXeZvpAptt0HUIl79bQTYHiFN81YeKzI4Vm366jMkwyjdJluw+ig5OwFMu?=
 =?us-ascii?Q?n9FF9pJWIefWPRXfF2WlYk3qj3HnBLmmT1/JbyYHy6C+YWTsOl0PO7zfGv14?=
 =?us-ascii?Q?Yp9mLxNLaKGA1C30vsptvpaF7ZwvU6ZVZaKnyvBaoxz4ibc99gGFGhY2isRq?=
 =?us-ascii?Q?Ew7rVq8q5SPJo02m4ukjaDBSx/4wJmP+pFBWL5hzjQbuiyY9xgTySlnBe3Xa?=
 =?us-ascii?Q?Jgyjk7SJa2pP6o/F3vhHqVXdrO+lnyZ1kRKTx+cTkxGoU3da/O21YVfBYbxr?=
 =?us-ascii?Q?AZSVz4VMB6QKzyItKQGQL+EbfYJTk9Q324LV5l2UDnyCGFT2YylpYjh9HH6f?=
 =?us-ascii?Q?uQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ea05891a-449f-4bcf-c53d-08dc4406a634
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0102MB3658.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2024 09:10:52.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHwz+sveFVsPiYA1MyJ1BOPoJEOg26jXlGh+ajEK51gz0PKcuzSeSSLCwC5Q52X6v6GG7BtUEe80pSv5Li4QjBu91tCKLPLGCGNZyLj+l1A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR01MB7868
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Mar 2024 09:11:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109313

From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
---
 .../recipes-support/sngrep/sngrep_1.8.0.bb    | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb

diff --git a/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb b/meta-=
networking/recipes-support/sngrep/sngrep_1.8.0.bb
new file mode 100644
index 000000000..2824dde88
--- /dev/null
+++ b/meta-networking/recipes-support/sngrep/sngrep_1.8.0.bb
@@ -0,0 +1,37 @@
+SUMMARY =3D "Ncurses SIP Messages flow viewer"
+DESCRIPTION =3D "Tool for displaying SIP calls message flows from terminal=
"
+HOMEPAGE =3D "https://github.com/irontec/sngrep"
+BUGTRACKER =3D "https://github.com/irontec/sngrep/issues"
+SECTION =3D "console/network"
+LICENSE =3D "GPL-3.0-or-later & OpenSSL"
+LIC_FILES_CHKSUM =3D "\
+    file://LICENSE;md5=3Dd32239bcb673463ab874e80d47fae504 \
+    file://LICENSE.OpenSSL;md5=3De39170c41c6f83de36426dbf49a03632 \
+    file://README;beginline=3D100;endline=3D124;md5=3D758a88cf2b27572df059=
96a3810066b3 \
+"
+
+DEPENDS =3D "\
+    libpcap \
+    ncurses \
+"
+
+SRC_URI =3D "git://github.com/irontec/sngrep.git;protocol=3Dhttps;branch=
=3Dmaster"
+SRCREV =3D "f7b36df3b79617892958b67cb4ad9313c6ce72d2"
+
+S =3D "${WORKDIR}/git"
+
+inherit cmake pkgconfig
+
+PACKAGECONFIG ?=3D "\
+    openssl \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
+    unicode \
+"
+
+PACKAGECONFIG[openssl] =3D "-DWITH_OPENSSL=3DON,-DWITH_OPENSSL=3DOFF,opens=
sl"
+PACKAGECONFIG[gnutls] =3D "-DWITH_GNUTLS=3DON,-DWITH_GNUTLS=3DOFF,gnutls l=
ibgcrypt"
+PACKAGECONFIG[pcre] =3D "-DWITH_PCRE=3DOFF,-DWITH_PCRE=3DOFF,libpcre"
+PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
+PACKAGECONFIG[unicode] =3D "-DWITH_UNICODE=3DON,-DWITH_UNICODE=3DOFF"
+PACKAGECONFIG[ipv6] =3D "-DUSE_IPV6=3DON,-DUSE_IPV6=3DOFF"
+PACKAGECONFIG[eep] =3D "-DUSE_EEP=3DON,-DUSE_EEP=3DOFF"
--=20
2.34.1


