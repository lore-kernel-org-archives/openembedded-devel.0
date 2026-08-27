Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B252C61DC4
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:13 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.10])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1807.1787856849642552033
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=bFnu6Rh1;
 spf=pass (domain: est.tech, ip: 52.101.65.10, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tzK9ntYrBviAnI/V61OJFf+Ms8OchbkJObKHw2j6FYhx6OP01RgHOUvtPWk1zmUBg97ZTk8CKNFDzedqNOYdDeQ82h7PKBqYfhVStWik7Z+qL94DVptqqky6Bq1nJscE30fHFj/FXiMQVcUlPLy9hSDsv4H588XT2tobfbxhjFN29kY1POq1ltdr5CT8zxX0I2m8kw19GRobH4L3/vfoocgqwMWYfuo61yQ73wqHOK45baI09SxmbvueCLATWNayykI3pmxneiw2q/8iGSbbdeYwWeWOdCoSrcQ/sFoF06iciDobHElRlovmc4MIuBDcf6O7LjFTNWsuzCkG9/NgdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+zhMGs7xT9DgtW8XHgzO+fwuG1PtUQzlrPfhunYbK4=;
 b=iR/F5tBMLUAQwFHqjA+URm6wb/X5ial/CpI0vJSpJZm5MFo+nBTzm2jj7ggKd7MLtJhbvX6ZBU9LnPDz2so8cGH18Y5wTYn4j6J9MkNTSmnjZodFJIZF1BIQtCZqAPf0sCs+XzvmMBkKIKjsSVU2cJzAkLt7vaBWreKmDP4ll+CmBOSsqEZ2JzNvXzmyvQsWOSMLb4py1U7t/zONT7aq8gI3LtwDt3+yRgLcDvGXUxzoddAh5LG7EMklQl7rkYAGj01i/yYxd9OhvtD9NartlI5Nst7KOpsfX84+hHLF5aDyW6GMlyVBciC+9kcLW7NuUczlR9fnyojgwnPlUUUoCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6+zhMGs7xT9DgtW8XHgzO+fwuG1PtUQzlrPfhunYbK4=;
 b=bFnu6Rh16Y4aubhLww5ghqnETJfS3F10EKNTzgWsJ4buw0t9iIGGqXzMrX2DB+qXW+5D2yHw9CUFIxvQJ80/fZ5Acs/JCAgveFNBor5GweulUiIVl9/QRIG336MiXIVw1FGqBqw5zV/zX3vkOsSAn5hY4GW5R5AAe66EtRBh/6kgj5mcO+6bvF5F1CspGb3Sq5e2pOMFCajoIknPcvBSEE0SQgxC9QvKEdg8ms1rD8CJcTgayMkm9XUPMH5LjYSOTbcTVxoY0D6P0Qerq+8ye5Mmqz2A0funmyz4aa/+wFVUwqSPe48qYUIZgzdL/QBqXb2BmfeUDVYHXX3s8FvZyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:07 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:07 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 15/20] snort3: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:19 +0200
Message-ID: <20260827185324.78997-16-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: f611737b-b896-4a1b-5c9a-08df046c92af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	IcHOqN+T7HpU3UBE3x4RjZDFjTK79W0i7wFIfuGEuU7qrsHMINS+nAcbJ6zJgktP5hYsUpYZz8QJvOzQlLKPoUgbgyi5358fMPHacwfhcuEvxum12YMj0ORzT5obTq/WrrN3Pm+Z0QbBwrZKqUfovnroqJyiczvkq1S0pZ2d+oKlnUsju6ouxRPmZTDbJbQrgZJbwqAhW6/2MUpPGMItgae2VDoWDmsly7w4bOCTvPfM5n5cD7wjLcPKNX7eAs+wMdHJqsvaNKvKL19kQsSnmumpgD7O2kA/X8Cfk513UK8UbvH+/PeSsOoTYX2Y6BQZPQxF8tOAQzfEaYSozJD+HXYuSaVGf01IB0643tLQwZ1QY0eKgkYECzeJ8YQxTzt0zfq1j0e53A+LRdumx6Y2RePBzWg9OKo2RK2zrWENevy8e8pZ/LCH+xRteuvFyT3Eh/DS18ZwPSWuJVITB7YqAv7Jrd72R0POMLb3phfiMdYyy+eWEMEjkPbzAN5LQpyp0YUsGB85oGC1yvy13ze18TgR5u3KmkgsHCDR1lgOZZtZSeNgeI0PeZyrKomsJWIHCS0hOIS4YXcEbHjEMFJQ/KLrI88PU94n3mwYq+FAYIX96N4O4ag76bqhQ2V9vDtSWq7R/R2VzrPg4lNRUMVqXKUa99Gqv4fX1PFduZzqh/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z+whsW347Y0WofyrRD7BGOfrYpVpihHe3YQkQzAJUL0sWgB3rsRL6Lva3hOw?=
 =?us-ascii?Q?Kztz+kE+9YjAmteqGiPjRJEt0SlKc5vJeFCroOgQrh04vP87BlkRm0A818l8?=
 =?us-ascii?Q?noJtWSjgRrWLtxa0rNUrsFDObDUXrPbFcHH/bV8nsfe359lyClK4LkcoybFh?=
 =?us-ascii?Q?16UyRcBq74Vax1Qc2b0mL0Epu5+6tYSyy1ioTnEHRZJ7A+llaOpclkihfB+2?=
 =?us-ascii?Q?Bcf5bidRYN4hkO7pta4FIARMzx/Nj7BVmbswHI+Th9b63XW6U8SyH9ldx3G5?=
 =?us-ascii?Q?Dx7PWkMbx8STb8uvV21Ewrlcc2rp75xZNf1Td41EzTyZslIyFGDd64bD+oiw?=
 =?us-ascii?Q?yDvkiJXheyMMYQ4/5SxDppHVpkZV4/9rmW8i1+5wUuHf/PfVjkzfYCID/s14?=
 =?us-ascii?Q?/sMRxHGDq+1ispQyYo/YXhVDkT6wxJaIPIYMslte26I324OArnY5kD3lHGA7?=
 =?us-ascii?Q?wAC5mE3eh4UGjJnxUCtwzdxcjnIjk/Y5ctnQ6zVgxITZa4kythaA+KgkkTQW?=
 =?us-ascii?Q?BowCL3YrjDfy0rPvGhRo7zZJ9nvR9K6Vc4DZoNikzpgBx7bO2zlqpnWC2DgT?=
 =?us-ascii?Q?GQlNwYCrbgDNk8Sm11xyFRErZL/hns8QakWuHMl4gE6CmPPFCWVZDzZZ9UhE?=
 =?us-ascii?Q?CcysyukbxdsaaLoD96E+MQxAjnHYVX7BaXC/rJaCrCJcbTjcbaa2s8g6LsF0?=
 =?us-ascii?Q?9n0+dDCPLxQebCdGtidySuC2KjXYwrWmlg2QU2LRvIsrNNoo48ihNZJomqUL?=
 =?us-ascii?Q?85sh8CJPQXYcq+QlWFwy1PTadUB+3H7DxM5ny02aj4WAvEo9M4lyRv1ObLdh?=
 =?us-ascii?Q?PiFTZBStyLUQIkwIh6BBbbIoCKiCyWHMD1Q6ytI1oGBfM/KYTbEImSH+7VUk?=
 =?us-ascii?Q?St+RMc8u7Y3o/Oxx4JRD2qOAhYlnpbDaAbpqS4n/9jpHuiGNACH/9cKTsN56?=
 =?us-ascii?Q?ncE8KC31+wL8bZUNFHv7ogCEDlGSNI6C9d7DeCAT/wX51eOb5kS2V7PDpvzb?=
 =?us-ascii?Q?eXHJf36AsKzNkVTgWe4c4DHSTsH4VcB6ofLEaJe6ZTO8h6+v5vrcWRsRzd3v?=
 =?us-ascii?Q?nzqDjSIUwqR721mj9CZ7w3Uym7+ntW7HbNTZkkbj/ZL0olCR293wp5Uo90PV?=
 =?us-ascii?Q?Fn87lGErknCIkuReR1ajFwqgZxtvgwuGsFf381E4axtPnS/ub8/UDtx0iHx7?=
 =?us-ascii?Q?g3hd25BJLX4H/pPIkXyMHv2WEQgfasMKM+Rw9CgQolWabO+aijIIAI1Lt67B?=
 =?us-ascii?Q?8Wx0PCAav3sWAXye/Ny9g99BOp8wPzof9luim73ZFe/FuUgUBxddHI1FjMBt?=
 =?us-ascii?Q?MTIj8YaJuFZS/OZw/lNzWjT0Eh+qAlfGKaPjXSa+0nqxSigdoO0ezL/Kd8tf?=
 =?us-ascii?Q?835hOWKn+AfUQ7zn/hOy3lu8qGBHQW4bytshK1mzKnP4mJteWLmDEv5/Wc36?=
 =?us-ascii?Q?3PeMY0SdXXgEkoyktWnObfHs/Ao1n5MvakwoK7CtHyLsWsUqEjFuve1FV4xd?=
 =?us-ascii?Q?ROsFOM6G6j1/+ilhKx5XXlP1Vz7d6JbYrJ2QJW8zrznkPscb0dP6DKQvl7q/?=
 =?us-ascii?Q?Ek32mEDAYqzTVT0+LOUI4tshANm+uE9bi8Nq7UrRLzSYzjHIg8M0qf4OlypY?=
 =?us-ascii?Q?wuZcFQW7QftW4FkxBc6Ra09T8rbpqEEjYiMPP2F99eRzU+Yr+IaNL9bT9tzD?=
 =?us-ascii?Q?hVVocbBrlCytfvGh7xhiDSCZehkl/Oy6mvVF2Vjtbv+pOzERQ4lpHh1KjJzN?=
 =?us-ascii?Q?WYE6pcqgVdVjAajeW480IBUICE8Nzk1bnVqA2pl/1D2+Co1LkcF7koPnpmLV?=
X-MS-Exchange-AntiSpam-MessageData-1: yt2ThjdCF9s0HY3cjWvRgsNzVcQU/z9VsXw=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: f611737b-b896-4a1b-5c9a-08df046c92af
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:07.4755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LyHdxFNj5uP0yjEQZOdItPRA4O91gAVOPbNQf+PeIfMp/XQmD3yRXVNmkfcZkUXmGKqGPXlDWznx8DdMwM6GmzwZSi0h4Gt4dKqGUuAYHio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129550

OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
X509_get_issuer_name(), X509_NAME_get_entry(), and
X509_NAME_ENTRY_get_data().

Upstream-Status: Submitted [https://github.com/snort3/snort3/pull/477]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...fix-const-qualifiers-for-OpenSSL-4.0.patch | 53 +++++++++++++++++++
 .../snort/snort3_3.12.2.0.bb                  |  1 +
 2 files changed, 54 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/snort/snort3/0001-=
ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch

diff --git a/meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix=
-const-qualifiers-for-OpenSSL-4.0.patch b/meta-networking/recipes-connectiv=
ity/snort/snort3/0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch
new file mode 100644
index 0000000000..21085d1037
--- /dev/null
+++ b/meta-networking/recipes-connectivity/snort/snort3/0001-ssl-fix-const-=
qualifiers-for-OpenSSL-4.0.patch
@@ -0,0 +1,53 @@
+From 799739f51e8bc40c55f58a8dcbcb00ddb7ff679e Mon Sep 17 00:00:00 2001
+From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+Date: Wed, 26 Aug 2026 16:39:34 +0000
+Subject: [PATCH] ssl: fix const qualifiers for OpenSSL 4.0
+
+OpenSSL 4.0 returns const pointers from X509_get_subject_name(),
+X509_get_issuer_name(), X509_NAME_get_entry(), and
+X509_NAME_ENTRY_get_data(). Update local variables to match.
+
+Upstream-Status: Submitted [https://github.com/snort3/snort3/pull/477]
+
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/protocols/ssl.cc | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/src/protocols/ssl.cc b/src/protocols/ssl.cc
+index 733d19adf..4afac05dd 100644
+--- a/src/protocols/ssl.cc
++++ b/src/protocols/ssl.cc
+@@ -860,8 +860,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertD=
ata* server_cert_data)
+     while (len > 2 and !(common_name and org_unit))
+     {
+         X509* cert =3D nullptr;
+-        X509_NAME* cert_subject =3D nullptr;
+-        X509_NAME* cert_issuer =3D nullptr;
++        const X509_NAME* cert_subject =3D nullptr;
++        const X509_NAME* cert_issuer =3D nullptr;
+=20
+         int cert_len =3D ntoh3(data);
+         data +=3D 3;
+@@ -918,8 +918,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertD=
ata* server_cert_data)
+             lastpos =3D X509_NAME_get_index_by_NID(cert_subject, NID_comm=
onName, lastpos);
+             if (lastpos !=3D -1)
+             {
+-                X509_NAME_ENTRY* e =3D X509_NAME_get_entry(cert_subject, =
lastpos);
+-                ASN1_STRING* asn1_str =3D X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e =3D X509_NAME_get_entry(cert_sub=
ject, lastpos);
++                const ASN1_STRING* asn1_str =3D X509_NAME_ENTRY_get_data(=
e);
+                 const unsigned char* str_data =3D ASN1_STRING_get0_data(a=
sn1_str);
+                 int length =3D ASN1_STRING_length(asn1_str);
+                =20
+@@ -941,8 +941,8 @@ ParseResult parse_server_certificates(SSLV3ServerCertD=
ata* server_cert_data)
+             lastpos =3D X509_NAME_get_index_by_NID(cert_subject, NID_orga=
nizationalUnitName, lastpos);
+             if (lastpos !=3D -1)
+             {
+-                X509_NAME_ENTRY* e =3D X509_NAME_get_entry(cert_subject, =
lastpos);
+-                ASN1_STRING* asn1_str =3D X509_NAME_ENTRY_get_data(e);
++                const X509_NAME_ENTRY* e =3D X509_NAME_get_entry(cert_sub=
ject, lastpos);
++                const ASN1_STRING* asn1_str =3D X509_NAME_ENTRY_get_data(=
e);
+                 const unsigned char* str_data =3D ASN1_STRING_get0_data(a=
sn1_str);
+                 org_unit_len =3D ASN1_STRING_length(asn1_str);
+                =20
diff --git a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb =
b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
index b95de9490d..0d972b8aed 100644
--- a/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
+++ b/meta-networking/recipes-connectivity/snort/snort3_3.12.2.0.bb
@@ -10,6 +10,7 @@ DEPENDS =3D "flex-native hwloc libdaq libdnet libpcap lib=
pcre libtirpc libunwind l
 SRC_URI =3D "git://github.com/snort3/snort3.git;protocol=3Dhttps;branch=3D=
master;tag=3D${PV} \
            file://0001-cmake-Check-for-HP-libunwind.patch \
            file://0001-cmake-Pass-noline-flag-to-flex.patch \
+           file://0001-ssl-fix-const-qualifiers-for-OpenSSL-4.0.patch \
 		  "
=20
 SRCREV =3D "14aeb09f5a0856812dbe08ead3c21f99e8860aa0"

