Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C31C55179
	for <webhook@archiver.kernel.org>; Mon,  3 Aug 2026 13:07:05 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42531.1785761983669860443
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 05:59:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=zDFzeGDC;
 spf=pass (domain: est.tech, ip: 40.107.162.53, mailfrom: adarsh.jagadish.kamini@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/m2U620zcJKerMt+d5r9lwV7YYG4Cdh0L7iKxXKC1RfE2wb1cQnq4CoXBxtUeJqZmrQK7rdGHKeVw+Did6jop6pJm8fTKkWzBDVvjTGwqXlr7cpazjpwzEeoRrPN9VMs1Ly9IFYcDFR3gBs9W+SK1FeuvnIBc3q4e2/S2qKmPSLV02BJ9cGb3+pPemwimEXIz8HVbzczeCSndJMmaxOsGsjNuUNzZdmgj+Q9CilFpENQRUHaGBzktD3tGqrCVTx9GS20XNluGKwD88wqbEyR5VAnMxA4pNDTYG+4C3I/rrefTdpFY32iYPcIhaW8793zNeAyo70SHC/VePfAncdrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X+jpKhEFcM0HxSJ56NaO62OhI25/ppEuil+zapdsloc=;
 b=liD3MTqgxNwd9CbXFQd8/ju9UI7iW36pOldi+d7bSmR3ChtOLHkcaI4TXqc2zC9MiTbnLUnKgN25Zn92m0wxkTenq/aReHZGOGljZcgkc4kLNxOYj5NdyJLVkteoBNlCYuF1t8TR9IL2tWARRxu56Pz2V6XYgzXQHKUEPmCCb3osgHQ2MoBZd4noTxdsxYqB0SIUg+CEq8cqVz8kH2cXSU31OL5lD4Nq2xIaPronBWLZgOYcBp32MqeYhv1O0GBLyky/xtAFte++cVFCyqVueu61b9Etw1q7agqrQr5H8MA7Wti7Yd3N0m4f7OUWb47N71y/pdcJm5IuZwxeF2xElQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+jpKhEFcM0HxSJ56NaO62OhI25/ppEuil+zapdsloc=;
 b=zDFzeGDCZ8QatMre+V5tAr1GKB4kgVNgTo7VHJez7SKh3JsjgOK9vTnqcn+qOfKH2gS+uNNqbLzw/sCgB/GHqyRMIpYKrWKxWbBYUzTpDCXIeRSWn18PseBxgrmfGKmRKsmXL0KU9gisCfEHbznGXAMv6zK3y0/sWQhXQjdz3fAwCwbnG55AMDXKEhp9NuW5o/yQA2gQBLOO26OVSorxlQzMuFyEtu1VtL5ISkEgZEHcXSKGGsH24EOCsf5A9uboXf9gk37ZIPNWMroVvD82xV2RW41cuJPb4zsBI8+Gks7Iz1hpa/wBtEZQWR9nww54CIZ8xEpk2JhcpyHv2naIag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:396::9)
 by DB9P189MB2050.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:392::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.13; Mon, 3 Aug
 2026 12:59:40 +0000
Received: from AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff]) by AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 ([fe80::f147:85e5:34de:eeff%4]) with mapi id 15.21.0292.012; Mon, 3 Aug 2026
 12:59:40 +0000
From: "Adarsh Jagadish Kamini" <adarsh.jagadish.kamini@est.tech>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][wrynose][PATCH 3/4] thrift: fix CVE-2026-48144
Date: Mon,  3 Aug 2026 14:59:21 +0200
Message-ID: <20260803125927.831690-4-adarsh.jagadish.kamini@est.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
References: <20260803125927.831690-1-adarsh.jagadish.kamini@est.tech>
X-ClientProxiedBy: DU7P250CA0019.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:54f::12) To AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:396::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8P189MB1672:EE_|DB9P189MB2050:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da5d0c0-5113-419a-cd05-08def15f14bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|12006099003|22082099003|18002099003|11063799006|13003099007|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	g8yVVfZZZ63iJUMFMvI0m03QIyTMkZd7gou+C8gnZA21cmzftGnuKee8Q6/0ulnoFNDIfGdfBeOQ7To8T5Cm33x0y8/9Or1hpqbjyJby763/XsEUvqYPCauBF6P5FI0DjdpswdS0pUzZLKzvhj0TbWMKGSArtBIdRvk/N6jOyvwCXeTi4YbQy6NvX3xAAHzdeh7tm9gMUlVFRyxHwQwwySArMRYbN1Oau0DH6b2HrQmNn98s605eufBUwBkT2dsrk/NHuWtUamnkVRdfOklqnuCzB+zBL3pF2RnNFpYh5xhVbWpTBxHftsKouxzXCCLWWZdgSrTdCT0Z7V6Hj0pQdkZ5q9j1kBMR+3MVk6QogaFzbnHvltut/GO5DTxPJkS5R+jikZxjsKL3u3wV/EvgpjBTc6MrOV2KIHJvXSOgrqfrzfXQMmgNcHyOE3qnQRzgSPvRHNbEbz5j+Ux/IuCSTrtyO/Ef6jCtJEUSp9lyvKA6xLtTlANYf9dXkR8ySNl2VrJ1wq6aU7dC96ctJwiqpxYbqsN5s+39su6QgIrVf3WWfRbrYV260LFcbtu4igLNIYjvEKzpgoba9SIcBVWrwC6zKVFV5ylhSECiM51tXRsjK9OkHKqAqVX37ugYnsMFP0pASXG7xp4Z7b9CGGN1c9g9cOU/5lpNANLBMwM3dj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8P189MB1672.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(12006099003)(22082099003)(18002099003)(11063799006)(13003099007)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vaUEVLTz/8UQFH3llNhcXH3eKUTZYc0rL48KR86Wgtg43WZcWdUe5r7k/8fM?=
 =?us-ascii?Q?MQVCYUSeYofUqLwN+FzRspu5/LhXW/adLnUpgENQ412/d1BYkJXEOkR6su+B?=
 =?us-ascii?Q?C/C9nRD+3v/He8Io/2vE6c06vxbBT+AwV4Ltizj1fow1rniCicqNdMuVpJoX?=
 =?us-ascii?Q?rYoKebJFQ9JeUS5lXFnBNwvPVbf2c+mPyQBJtDnrX8EggF2TYaOjfNWMWRl5?=
 =?us-ascii?Q?SC3KxKEpKKw+vemlGFiKQ+o5gxWHjAD3oSRobhnubXN/DOyArnY7CzoTR67m?=
 =?us-ascii?Q?g8BdmBAcoEtgCjKNttQgRQcHtkjVmNS4vuI+Q6/OswUuNp6CYqbmYosg6tlQ?=
 =?us-ascii?Q?l/kSI/n8E9a18LoB7i/X2/nHlFp6FVbMiPoqOSQXs80G5c4USqsEzZTNPGLA?=
 =?us-ascii?Q?20CtbZ0rN81sd5ps8kruvLvRPyTRuC4SfvY72VhN4XPWLa9RZseH/M1z4y4I?=
 =?us-ascii?Q?T0XVP43Vdq1MKiHb9OpzN8QGF14J4ekB81YoCm5Ez5Ovq06gRKEo3+uSoWiM?=
 =?us-ascii?Q?nH2tNggbYIY6czKuZCH3UJW4z/5pJneW7ne6iyqmDlrL81LN4ltHM5vKenZa?=
 =?us-ascii?Q?XMhtookN+W5K9IH/2SEGVlXK56gYCV5VHv52XspEamXAAIhY0U/FCHzEg96a?=
 =?us-ascii?Q?OofjjwAMVF00i3KGdEQ4DI/os0e+nRlyc3HCl/qbeNC6dmuBEzhJsQfT+5vF?=
 =?us-ascii?Q?wW68LNReTJ636whEuFVQbWy9avUYV6Ziebn14IYRNLu1wkm4LYgDBnfmWNJu?=
 =?us-ascii?Q?UYHkblLXIsglQO+Yywo+TknIdXJAFhsZNUZcl0pSzbfd8VRUihMBMIvkscyD?=
 =?us-ascii?Q?m9Lla2THrf4D6h/9z/eBhg9m/3W6Ubo93mLtaHk2O8ZQ8f7YSYGjMiUQjeJV?=
 =?us-ascii?Q?GR/haoRYCk2qsm2qiJLQhisHaXORoSPFTBp27BRf/za1PfBEdZrYPRdNKdAe?=
 =?us-ascii?Q?0jkk2lZwaCaa7yPT2DMXPm/Gbmm3N1ym+jc0oZgCGRh1czid6y/yonfaL6dS?=
 =?us-ascii?Q?3fLV0Qgl+zcgFqNupIpMgiFV8zD2SrCwnw9RzG5CqB+jW5uLO1vQA/nhNxIv?=
 =?us-ascii?Q?2MSVfIJBJPqLSkMb5hjeD21gYEpw0Zu2CzikFcz+sNczGOfN8cRXBDBYxbvn?=
 =?us-ascii?Q?e9GpzS9KihC65KrF2Oslu5qHviNDst0661Z/P9mRXxbnHh1mVKNuhWRUCeXN?=
 =?us-ascii?Q?zwvmxfEVezm87BnxfJGvNPvfC0kSYsiXpCi39BZd6W56i+eLr3XLbAdYOv/y?=
 =?us-ascii?Q?rSFpffG/Ucn0524AmToC7W23CdAhk0UgeFjGIfdJ9meSQVjXyAgake+09F67?=
 =?us-ascii?Q?cNi+S6FsZrpaMHkViT+JbakB85H0m64QtoGcae4PpDwOuycqPFUTursaJ5xs?=
 =?us-ascii?Q?QPei6rbHnUZNnCfijFG00AXi/e+Mf2SrxxBQtsmfb11VJEeqaRW85P1Wsv1x?=
 =?us-ascii?Q?QIH55k9uBdP3hdFfABzzev/t6q9ZKVfX+tVCVcQjBqnM6eDunm34lcKW5FNv?=
 =?us-ascii?Q?8sIcnwmzdpxMwXmSQn6yOc/HxDp+MAM6RJi0mhp9rCPrKOiPjVPewscLyddD?=
 =?us-ascii?Q?TCksK6ueGzoxCaIVAuKhteH7msku5jkMmmxq4mGdarPHOiU6FsVxcX4bun/o?=
 =?us-ascii?Q?Y0m9Rq+ohzKHPM/C8coMj6ReOeSfvHCUDMXvUaoINXLxJw0mOLBonYgPpc+/?=
 =?us-ascii?Q?9dwSrLI6x/bykYne3J0hjD45cvm5+XSJPMrSnz6fAfmM2kXgEUNKrfo98DqA?=
 =?us-ascii?Q?eU5K/NlbDPyBGFob4qagfC7O4PifVPNu+Qctw3dFj5/BufdjvqqT?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da5d0c0-5113-419a-cd05-08def15f14bb
X-MS-Exchange-CrossTenant-AuthSource: AS8P189MB1672.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 12:59:40.6794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7kZVvG/qQ0/qE/iX0HlDm7fw73uTJqyxro2mh+Yp/U1x2MRsW8tBrKnj3+mCm92aJZTdvs1oZPNr8MWw7a9d2wglKKz/2PVSJb7LBrzjMk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB2050
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2026 13:07:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128688

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-48144.

References:
  https://nvd.nist.gov/vuln/detail/CVE-2026-48144

Upstream fix:
  https://github.com/apache/thrift/commit/2b8baabc9be52807b08825e825bc0cd26=
568a193

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
---
 .../thrift/thrift/CVE-2026-48144.patch        | 36 +++++++++++++++++++
 .../thrift/thrift_0.22.0.bb                   |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-481=
44.patch

diff --git a/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patc=
h b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
new file mode 100644
index 0000000000..680cf4481b
--- /dev/null
+++ b/meta-oe/recipes-connectivity/thrift/thrift/CVE-2026-48144.patch
@@ -0,0 +1,36 @@
+From 4110973e59758dbeab5f527daae02f3b6a508bb0 Mon Sep 17 00:00:00 2001
+From: Jens Geyer <jensg@apache.org>
+Date: Thu, 21 May 2026 03:05:53 +0200
+Subject: [PATCH] Add peer hostname validation to c_glib TLS client Client:
+ c_glib
+
+Sets SSL_set1_host() before SSL_connect() so the peer certificate CN/SAN
+is validated against the hostname. Guarded with OPENSSL_VERSION_NUMBER
+>=3D 0x10100000L since SSL_set1_host() was introduced in OpenSSL 1.1.0.
+
+Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>
+
+CVE: CVE-2026-48144
+Upstream-Status: Backport [https://github.com/apache/thrift/commit/2b8baab=
c9be52807b08825e825bc0cd26568a193]
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c b/=
lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+index 0afcb1b8f..4423a781c 100644
+--- a/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
++++ b/lib/c_glib/src/thrift/c_glib/transport/thrift_ssl_socket.c
+@@ -422,6 +422,11 @@ thrift_ssl_socket_handle_handshake(ThriftTransport * =
transport, GError **error)
+       if(ssl_socket->server){
+ 	  rc =3D SSL_accept(ssl_socket->ssl);
+       }else{
++#if OPENSSL_VERSION_NUMBER >=3D 0x10100000L
++	  if (socket->hostname !=3D NULL) {
++	      SSL_set1_host(ssl_socket->ssl, socket->hostname);
++	  }
++#endif
+ 	  rc =3D SSL_connect(ssl_socket->ssl);
+       }
+       if (rc <=3D 0) {
diff --git a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb b/meta-oe=
/recipes-connectivity/thrift/thrift_0.22.0.bb
index b3f420bfe3..882e72442a 100644
--- a/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
+++ b/meta-oe/recipes-connectivity/thrift/thrift_0.22.0.bb
@@ -15,6 +15,7 @@ SRC_URI =3D "https://downloads.apache.org/${BPN}/${PV}/${=
BP}.tar.gz \
            file://CVE-2026-43870.patch \
            file://CVE-2026-55971.patch \
            file://CVE-2026-58023.patch \
+           file://CVE-2026-48144.patch \
            "
 SRC_URI[sha256sum] =3D "794a0e455787960d9f27ab92c38e34da27e8deeda7a5db0e59=
dc64a00df8a1e5"
=20

