Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B40C61DCB
	for <webhook@archiver.kernel.org>; Thu, 27 Aug 2026 18:54:03 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1801.1787856842746752130
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Aug 2026 11:54:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=xF0TVT1F;
 spf=pass (domain: est.tech, ip: 52.101.65.60, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=acCOp/nHrvIMnKHb0S1R945d4EB6rvHOFpa+eUos5bFHvqN3oPPiUsHvgJc86DDUXO4H3hyZmhXjXQpRn18NXeQrYKUEEWtJzLnbtt4AKptNTdv5RgRaJplWNjLF87LEJ0RupYj4qz1mLDaihsnQ5f2IPfqyNvKpwiE2JLS56FW2CA310sQyAtjBWBpvVtXNfqAGHThnMGyO7sPEnt6Kqz0E1qJ2Ro91nHO7OR5ZVLYquppxIPFYILqwMr6a3nlUkGRl12Mp96fTu/LXZdrdmOfZgek9F2qcWSs3QPsSDa+x3fu6XHRcKXk7iE7pursh10M0xI0Lu+OA/Dchme/32Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=voVf3ZTSP6G1NingBNt/Vl5TvpwZpx/qMMQlHPaUd0g=;
 b=fi7I9MxV31zgv2ee6/VvNo4UiL5pIMIEspIxr3J6Cfp+UPLzOg1xHDxYnKy9RmoAWAxUKfa4HNednKJfsXttu+gpkw01DNPpJbfNxyKxGznnjCl/5ZKFVILQ0hNHLkUqiXaJI89jH3dL7pZlaa0w5qzQq1im3ldkkjMzuI0vuaxQ18BLdP/d/GT0PbUzXtg7uOH9IAfuscrOT+V6NGn1ABgGqMJAAPHYamSO56wpvu8qOUwrVb9nOHUCFjbQCTb0thQ6E8rVDTjMyGV+c1tGvc/4ycby+KBB6+IdsrCZNyxop/uY9qAf/xtmL5seSdkjG2wVCvIdxBUXMWTpzpmVbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=voVf3ZTSP6G1NingBNt/Vl5TvpwZpx/qMMQlHPaUd0g=;
 b=xF0TVT1FDla3jBjYSyRl1CvBNjlykRly7VEdzOw+6HqK8GZabcQJDPqq7Y0qbq8Ax+akSm4ZZzQu0zSNtEgkAB4GSFCh7o3PIa8kU4TvdSwP15zFAPbNghfod7hA2GA2XN+inJwDb2Axi5BqhJx5NLDkA4/Egc7DHZEpYMj4v4bNrEiCBfEmBHFvQ7xghzfRhlk3KnwlZXHHCCSW5NtgiqkyR2+PBvftWYOYkRR7G/KuBpDeNaQPZghBys2MzWk1svBFMJx0JYimpzW8mhDeR5yuHQ8l8ASs7+/TzMYBTDlxLZnC79J3sXg/EpdB7EEKdFefCil+IlSptqWif2de2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by DB9P189MB3598.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:5fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Thu, 27 Aug
 2026 18:54:00 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0360.008; Thu, 27 Aug 2026
 18:54:00 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-devel@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [meta-networking][RFC 13/20] civetweb: fix build with OpenSSL 4.0
Date: Thu, 27 Aug 2026 20:53:17 +0200
Message-ID: <20260827185324.78997-14-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
References: <20260827185324.78997-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: LO4P123CA0244.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|DB9P189MB3598:EE_
X-MS-Office365-Filtering-Correlation-Id: 13abc91e-c24e-4af2-4347-08df046c8e83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|23010399003|366016|10070799003|10067099003|56012099006|11063799006|3023799007|22082099003|18002099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	c2zW9pSfZ3FDVMAn4U2VK+oN4za8dsh11D0XNK1MqL5aINyd4llPnJYsT5UuapP/UJATdoWsGPRLIhTWs3hQfB5ztRFZSbTQFBB0FNJigLXMoMDMpcGlN4LoXSnitlDHkKaoappB3AhG/DzKyaTnQEwf/U9mw8dbn7M6inwMadA28nPvskR+PMClUzdyC9nDPVGSTBlbDDXe7NvzfDuRxf6xeTqEAjED0+JqJJnbbn7XaqXzfO7R3vaRjzMF5h38M3Ygds5wwrhYAWnDQyH/TC2g/rcvLygpwPAbxuIz80IWU5QkssMGTY42uKpjI7qNc3ZitO4u4SEncubgMBF+xvuoGrN4evdBr8LNiuAgnG0fgc1QSR/xfsxkYrsilGTHGHTcsDJlExpTN7L05vCWQtQMmlhVdc+7LugHGvyojCw8msosAvIiUhsOX5I6DL0d++0LOYCjP9Dhac0KZbUhil5XUTm8H2yLWCuBriJ5GCwDNE1OBy8sIowheMd9JCUnFCrFWZjBcUZULHFK+jOYC1KNcTeidhT2VXIOk8HYsh1p2/6WxS18JpVUGqCEmZOIkqRVA4HiMbOHU1kf6nsvs3J57lkQvaVRAiL3obpsCoXCdJUPtuZyC+/Kk8J6nl1vjR+hHR1dkQhyl5vxMmjL1RI5mH5DaM6RBB1OuWJZMdk=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(10070799003)(10067099003)(56012099006)(11063799006)(3023799007)(22082099003)(18002099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?g3PkcHC3RWyA1J1AB+qO8YEaTvMKJFoD8mZ4RI/gR9Zio41cD09aXI8XgiiG?=
 =?us-ascii?Q?jSsNqPi00jNZnTuRI1zSiKs5r9PIbEh54FeAl5d3b273iUzx6L2XqypB4AIV?=
 =?us-ascii?Q?7chn5lzXvK4HnHSeox7M3gNqFlaZRhnzWLZd7ihoX7qXmeKvnBddKqugYuQ/?=
 =?us-ascii?Q?0YRUItrS8NkQLRrVafxxUpdSeAczzzE+Klwqa/B3qXArMcX+C0VxMnYxaed7?=
 =?us-ascii?Q?WnFUk/AME+c4FGcRa+iy1uFKtzPCyqOfjt6U3iqk9Pc4ZOezpQwZTI9HjSY6?=
 =?us-ascii?Q?tBWOMNiDmzeYBnT81BmWTE4QoMNHBj0uMOEl69HRrmI7gbkWIi5m27vgZciT?=
 =?us-ascii?Q?lxfheQZTJophI4RRfk4vWsLlwWCqcBn2Tht+HoXhliPuHX1KXiBVFjIzFFZl?=
 =?us-ascii?Q?mabI+PaAZaH7WIhmIuKW7aFw/ogi41Uvk+OHXa4VrAbwGnpsiCQufuB03rND?=
 =?us-ascii?Q?Z16tgWtZioFmPV1KMsiGDpKoYvi5Tfwdr6CJL2hCtrI8IAmEK2jr7JLzDxq6?=
 =?us-ascii?Q?jZYM2J8WXJgfTzdeEi8I27kMQNBe2iBATe7m9lXIDvDPmor/y5C3Mdqsqm5p?=
 =?us-ascii?Q?cd+o8AKrNvOzFpnFyPQ6TzQVl9aO+aE2GYtBqtSp4fnsA258uzX1BSch7TKh?=
 =?us-ascii?Q?bEloe1cmruXVkWosQLzjJr/nAMWbLobbAO5Nt2g4pKIgHF89Qe9h7Eb4X5Wf?=
 =?us-ascii?Q?IVWbHMeRPpX/zmStKdLWdaVHMRmn+lTLRvs2TCv+IUOy0THWd93i9iUzMcMJ?=
 =?us-ascii?Q?ysLIOjd0M50eSeoGCcjuoELLxsb1qBdT1aNJr/SPffd2r6A9Aw++M/r+vJNa?=
 =?us-ascii?Q?nN8jSqFy1wx552IzD6/uo5smVDqT6C8EaOfz+/baE8GJ9ZzUj+Kn2uB8ZByl?=
 =?us-ascii?Q?1H/SJVzKRWIteGAhYoQ5GOR3q5jiNf4R+b4tKcrXYLaNTCxo7JwY/b3L6AbN?=
 =?us-ascii?Q?BZ6Y13BlczGP8WlXlLIwwqto9jRsJdf+25nWAAxp/0TipcBG98PKjZiQYFWD?=
 =?us-ascii?Q?TjnqR5ddYvKTqRnICh/AYzi1z4GXvJau1IOrYue6lISOt+GA2OPbJhLd5gjF?=
 =?us-ascii?Q?qQSbqpXRSj4t74WvqO9UV4Vj+ufskYG2IrIEY1ysq3IktjioE90mrxp+MXdX?=
 =?us-ascii?Q?I44KN4IsEh3xr0/J4WVeMtrRC+mwPik7shy2GWoGl6DeRUEiy6IT0zT8uN5Z?=
 =?us-ascii?Q?DlmEdJfqyG51FEm8cZg6I26TpHt+cPbpqBsSw2DC2C/Pfa9KMpN8pvZDdwc0?=
 =?us-ascii?Q?kKAiQv0cZOh6xAXY3TMjhYGYeiKfTqu/fjeuGYzYMmWEmKCzw8hWKXlXlChV?=
 =?us-ascii?Q?CMycFJ6OmA/a6kOIFhVpwa5KV/KXoCwRFVRGYQGGaQjMBhfjNnR7e//A4FRS?=
 =?us-ascii?Q?CCps4BFbcMbaRFUeutLxdcfe4q66dQ8hK9JekUSAVPjuMS7STIEias5M2j5Y?=
 =?us-ascii?Q?yBx/rs++WJmgpexMXp4UyTKKhMmea0W24/cZ38EQGKGCqWjrn60wIviy6Vj0?=
 =?us-ascii?Q?ukkOhEZY80cjPxxTDlKy5tNGa+DgscMqV7CrMoCZv+g/HjiWRg/Sv2wEpt3E?=
 =?us-ascii?Q?2Ed+z2a0Xzaj+a1T5F0nasBG8Ay7LfuAyrgzdXN46Gng/csn3EiWaMRhKc0p?=
 =?us-ascii?Q?oYuTxz4cupWAG4i+zqhFZj2atMyJYnLIZG2lJwi0d6tsWPkfxVgsTCxcH/fh?=
 =?us-ascii?Q?eQE27PKiLRtQvXErlRm+SXJffK1sJXE6msyEwnNG07SThXLkEr0w4zjwfmUP?=
 =?us-ascii?Q?8ENpl7vAZ4n42HQrXWk6R45WnKdBPquWIR7NTmAxc1hTPVJEwGG51YO5h3hQ?=
X-MS-Exchange-AntiSpam-MessageData-1: CGEq8n8uA1/+iBZ/uzuk2GJ7Ect7vlCCsHE=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 13abc91e-c24e-4af2-4347-08df046c8e83
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2026 18:54:00.4868
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C5Z8Pqs1sO87a1M3YQA+JpzWp/bU09y6Ax1EDd/zlyiriT0XqXwMSU87A/CXnebP+bkHRwYKhRF5hsy1YxaKCgGLRuIUQ+iztqFPWGFwkiQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9P189MB3598
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Aug 2026 18:54:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129548

OpenSSL 4.0 adds const qualifiers to X509_NAME returns.

Upstream-Status: Submitted [https://github.com/civetweb/civetweb/pull/1423]
Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../0001-Fix-compilation-with-openssl-4.patch | 27 +++++++++++++++++++
 .../civetweb/civetweb_1.16.bb                 |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 meta-networking/recipes-connectivity/civetweb/civetweb/=
0001-Fix-compilation-with-openssl-4.patch

diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fi=
x-compilation-with-openssl-4.patch b/meta-networking/recipes-connectivity/c=
ivetweb/civetweb/0001-Fix-compilation-with-openssl-4.patch
new file mode 100644
index 0000000000..134760d8ea
--- /dev/null
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb/0001-Fix-compi=
lation-with-openssl-4.patch
@@ -0,0 +1,27 @@
+From b3449269bbf13852824d19f164d00810432649d0 Mon Sep 17 00:00:00 2001
+From: Mattias Ellert <mattias.ellert@physics.uu.se>
+Date: Thu, 20 Aug 2026 21:04:22 +0200
+Subject: [PATCH] Fix compilation with openssl 4
+
+X509_get_subject_name() and X509_get_issuer_name() now return const.
+Upstream-Status: Submitted [https://github.com/civetweb/civetweb/pull/1423=
]
+Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
+---
+ src/civetweb.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/civetweb.c b/src/civetweb.c
+index f6a60e214..e093e094e 100644
+--- a/src/civetweb.c
++++ b/src/civetweb.c
+@@ -17125,8 +17125,8 @@ ssl_get_client_cert_info(const struct mg_connectio=
n *conn,
+ 		const EVP_MD *digest =3D EVP_get_digestbyname("sha1");
+=20
+ 		/* Get Subject and issuer */
+-		X509_NAME *subj =3D X509_get_subject_name(cert);
+-		X509_NAME *iss =3D X509_get_issuer_name(cert);
++		const X509_NAME *subj =3D X509_get_subject_name(cert);
++		const X509_NAME *iss =3D X509_get_issuer_name(cert);
+=20
+ 		/* Get serial number */
+ 		ASN1_INTEGER *serial =3D X509_get_serialNumber(cert);
diff --git a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb=
 b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
index 0e13bc6deb..d9ca7ccd53 100644
--- a/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
+++ b/meta-networking/recipes-connectivity/civetweb/civetweb_1.16.bb
@@ -8,6 +8,7 @@ SRCREV =3D "b6ef58f4c4c7fbe90fd1065bccf45b143345f1a6"
 PV .=3D "+git"
 SRC_URI =3D "git://github.com/civetweb/civetweb.git;branch=3Dmaster;protoc=
ol=3Dhttps \
            file://0001-Unittest-Link-librt-and-libm-using-l-option.patch \
+           file://0001-Fix-compilation-with-openssl-4.patch \
            "
=20
 CVE_STATUS[CVE-2025-55763] =3D "fixed-version: The vulnerability is fixed =
in the used revision"

