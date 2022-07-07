Return-Path: <Neetika.Singh@kpit.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F57CC433EF
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 08:52:53 +0000 (UTC)
Received: from IND01-BMX-obe.outbound.protection.outlook.com
 (IND01-BMX-obe.outbound.protection.outlook.com [40.107.239.87])
 by mx.groups.io with SMTP id smtpd.web08.3402.1657183966798433715
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 01:52:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kpit.com header.s=selector1 header.b=pMlXVMzJ;
 spf=pass (domain: kpit.com, ip: 40.107.239.87,
 mailfrom: neetika.singh@kpit.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VDdzMXROVzfW/oLo3Dz4nabCXoHQle5T6MvvqiMoI3IlltS9pqVajv5ehye6X0/aWj2B1HN5MqMI+JQxVBtpmJuA6P8jD3EYibhKe9WH0u0ewPTJTNgwqlo3nG3qU3sqoQao3ulgn7F3uRfcvOU2r+LzevrdD7HwqpVJ9FxcT9WcOr3Asc5qMTIIDi1mjaXmA837R8UeImyqyT2BqjW/CtB5JGofLMh6BmcMb3aKvH41LBDJKRCZoMYA0tVfz/nvi0vPqkpD1YqxzA7hjjBexBdRz+2/2tjsUjgQEGmHVirk2l3ubD6szgnJPG6f1tqYcVV5n6uH1XSBr0IIOUqUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfBTQdBxjEgCOXGjEap/EK3rLukwgmHQkQYIFCTLazE=;
 b=lpWBjxP0zrBf4XWTW9cDs23kbhNqyY231kRde1AX6NYRbrtW8h8CQnc69R9N16g2VA7DJ0eTxvLYJp8sUYWcv1yfWT41qCDNzyZpRFSRQEiFCzzFqNFzHTFp53foXSZJqG3BBZOrW00U14dvo+kHBE26NJK3WI0OhXd7j1zqESrOomBI0w6slJMvtQOz+kf9bFPZ3z/VW966h7cb2Geuie4y7mao1dkzrivweXImtHRdujNUnNlcCWqVfwmyxmoTUDafFO6BnCsYzs7/Q0wdukcYXwBnemL71b5XsemPR4lo9xUCkYyQKwlYThcwo+Vjc1YHeXxaw0cGNl7xM1mOMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kpit.com; dmarc=pass action=none header.from=kpit.com;
 dkim=pass header.d=kpit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kpit.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zfBTQdBxjEgCOXGjEap/EK3rLukwgmHQkQYIFCTLazE=;
 b=pMlXVMzJlWDVeE+NXNxGByfkQBYcGbuysYjSrdQ5P/iOX5dlvXeS4Gv2nbe1Kupp3jlXiFYdNRwtoaZ0h4+R1E4krbwQRz214hD7W4OOg57gB1o4MsmjC8Si3F1dNdJpImxZJC/JieiS9DM1NOWOTulRRKiwZYHCvPrfYMrZ/0s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kpit.com;
Received: from PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:29::12)
 by MA1PR01MB2506.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:3b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.18; Thu, 7 Jul
 2022 08:52:37 +0000
Received: from PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d87d:de05:d2d4:7a77]) by PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::d87d:de05:d2d4:7a77%7]) with mapi id 15.20.5395.014; Thu, 7 Jul 2022
 08:52:37 +0000
From: Neetika <Neetika.Singh@kpit.com>
To: openembedded-devel@lists.openembedded.org,
	raj.khem@gmail.com
Cc: Neetika Singh <Neetika.Singh@kpit.com>
Subject: [meta-java][dunfell][PATCH] xerces-j: Upgrade to 2.12.2
Date: Thu,  7 Jul 2022 14:22:22 +0530
Message-Id: <20220707085222.1121-1-Neetika.Singh@kpit.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BM1PR01CA0164.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::34) To PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:29::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f0703629-7863-42dc-09cf-08da5ff60ac9
X-MS-TrafficTypeDiagnostic: MA1PR01MB2506:EE_
Content-Transfer-Encoding: quoted-printable
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wkDwPTgUjCVM6uWeg+GWATwHJjycn+rY8n1ARy+UJoJPFSY2wGzYWiH7nD3E2RIJ3qz56V6xAAtmjzLpu3LkrqJYJHKsx5gGyQiJGwuJrMlDAA3aaXX3UZc28nR2g2rnBkhfisbGgw9XbGdYmbgv+6eIWp0VP9Cm4y8z6jW3qq9fZRUtBblIua5XzjzERaGlsRIHPlFQfZ2R8GDK6WqOuVIR1dwRvgCivXLPWTLrsbxb7kz1CxiO3Kavaz1mPShfbiff0AbLt+6Zn07Cz9Vd1oxm6kH90jwoA5NBO3K7Mbh+4CXhJGeMoeYRAC8cZ+y0U7NffJnR997JV4IuG8CRmRT2mduvS+HQkR0+I7MD29vW2HeCvcZrTb8CewMc2ABTkXbbiIMe4h0k1ST9aKUWeH3TWFsw/8y8X18pu40M38G2RWyjnOK6bbrzwyLVdd2uPzt8bhm2TVwmgyRJMU5mmWzVHSyjPlbPhPAMDzr89hwABkRHuyKNYkyG/F1xWVLrANVu9YzaFvloYfEE6x9JH/cVvn6HKDxL/fCW2y5HAcEh6vhXIDMIcW1A1T+k7P6tNJbf/inXddcBLXmzKL5yYi3hXHl5RNt1/wvLcorM/sMYTEB9UdDL8qtOs4EWEwv84GHofdAeiksepJ/0HQ985rMZ9dRahARQ5Mfetv7KXQuWKT0KqUCJevzKbWu3bPwMkUDZsMkiqAEwOeZLceA+Njh5AYm+glBnDlKCwOT2T11mFMDg+YmlwTV5AFxFgCXxYGjvX0g2YC/ZvbQXVn8lfPuRJnCj8LKEuv3a9wMSA8Y=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39860400002)(396003)(376002)(346002)(136003)(4326008)(5660300002)(8936002)(41300700001)(66574015)(6666004)(66556008)(66946007)(66476007)(86362001)(2616005)(6486002)(6512007)(6506007)(316002)(2906002)(36756003)(186003)(8676002)(38100700002)(966005)(478600001)(1076003)(107886003)(83380400001)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?p36ysqYGv/HtnePMXRHuJhwt9EY40/ftma/3rD8axwm9dOKmLdHTe0L7LR1D?=
 =?us-ascii?Q?4aVGyBL3G+lPY0b6HXIZ9ltiaAnDeAS3ILa4Cx2u+qYty7d8ubOmV0xw97/N?=
 =?us-ascii?Q?9ewyABTWxuniNe0Cg1jAKXE9k1ob23rCQSZQ5s0TBXJG7YXX81dPTJBY2fiS?=
 =?us-ascii?Q?FfjX9+LK++vTVL08YWr3bw07Wi+Rpl1x2oG3uELPIr1aaAy5BUWQm2dU0yvO?=
 =?us-ascii?Q?xxHXbn7BD+eh0JZdBd0xvGc2g0ZCuo3KiD2eeihg+6rBdNg/d97fgw/kOpd3?=
 =?us-ascii?Q?6j70rtIGcwkYTEM+30ZEZbzA5dDwmbJmpu4l5gJkwk6TiiAikoKipMKwGJIl?=
 =?us-ascii?Q?fzp/K3EmqvBC7eYz6MAktid+dPexj1HaKrzZ4j5eCr/rpOFPpx45SJXfahDk?=
 =?us-ascii?Q?8WgWuIrw5M3Mt5RMLRTE8ii2zKMjSKiIy2CwmC6PV4Ddfvua9UOlwZW9cwt1?=
 =?us-ascii?Q?sHzYKkSPmSby9MwD4Sv+hRBlhi7X2kUiuS60smP98og7DEDZgkgvRYGEM9Dq?=
 =?us-ascii?Q?ICGWCWpHuj6hqBVsVQ4h4dMfwZD9Sl9MVrPNOxviToiEPW5LYtutu3s2MM/s?=
 =?us-ascii?Q?FJLnAH9v3m2JLdTbQaiqvOXmIdF+P6DoC2DnJsbXFWjzqOMq/dcpeuX/Lbqp?=
 =?us-ascii?Q?jK3t47gi2AHhLva/5IyC7FnIj+8zrXpNjXj+4Y3J8RSxjpn9JX42LhHpAqvl?=
 =?us-ascii?Q?8Y0ECIxmHBwP2X/QBAvC6awdshEhZsd/wjGdi0uuXogHfD2IL3tUfHBQw9r6?=
 =?us-ascii?Q?JfuAsrleRLV4YXjZI/Cqmsqle9xfD67xx4yIRU+vWGgxB2d2o5aa2QH8ygYN?=
 =?us-ascii?Q?Qd/N8riaCBxrYGM1YGMeYCl/Ep6lIF12DAv4i9eYQ5x5cF9FSud+RevyUVrq?=
 =?us-ascii?Q?Zo2chSUhof1HVkGN0lfGg9PMhslnqaDJjx9EeUMZjLHz3/A8Rv6lEnCxCIH5?=
 =?us-ascii?Q?Z8Zou6e5P51whRq5Htxbia0OozjhJjLJr8L0xpeawipKfaOcto6EQXpC1gbQ?=
 =?us-ascii?Q?/vqIXZY0NinI7Hl5uX/GTp0V089RrzSfyHc+IZdXKJlEVGQRNtu6c1a8327j?=
 =?us-ascii?Q?4Ks6/okUcKAHOIM8goDtA0pXlxLUnYLG8MwyjSaMbouatWzbU7ju96nxm/i2?=
 =?us-ascii?Q?Vf3x2qa5R7LdC7On+cFxLFIlJXq8hVzuDZ7utuNGtgzWTFITrv6A1FdWT5ae?=
 =?us-ascii?Q?0SGh2ZJoF8jOVwYBaLHssm/zeSS68d2ZHeDfQnwjUWNpRf/8ffOcFQ8rQ22e?=
 =?us-ascii?Q?k7se25TlSMLhBPIp/NGsINRlX6+MYCnJvup4Tt/NF/aKQpbZKhYWRNhyGIK9?=
 =?us-ascii?Q?hw+MJZFgv2gUm7iJcfy39c4aJZQkWu6oNDnhKm79B9N8XMIMPRajSQlI7UQ5?=
 =?us-ascii?Q?g0Y7vKk0nWC16QN0HeF3PPi1d4Sgi3UqwaiWN7noeSf8yOqC6IEyrVUpp52j?=
 =?us-ascii?Q?iXVumneMtyQzU3z6+Z20zV2i7QEDg9JzQPvqPGMMeza20FlFM3tXWXDwQHJF?=
 =?us-ascii?Q?f5Hs3zbixAZAG5Sk9g+UsgClc4KEYtBaGbtWa878enMjdQldFnhMD0ew3m0v?=
 =?us-ascii?Q?wKWppF2oIH0mpWTzsTQd+FR7FZ3yvgffuVzJozAZGGEgzO0jvNoUybKOS1XS?=
 =?us-ascii?Q?/BHJ2pOlogSOcP4z4R1+8an5SeWzmpS6MTJdpCuEwbOi?=
X-OriginatorOrg: kpit.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f0703629-7863-42dc-09cf-08da5ff60ac9
X-MS-Exchange-CrossTenant-AuthSource: PN2PR01MB5375.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2022 08:52:37.5449
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3539451e-b46e-4a26-a242-ff61502855c7
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AhjTczNffmi4BpGuU7Pilcu30KIOrSB3MxWWb85gZ90drYgPkFFfzbPMPrmZqHHUPfGUH9C7n+pMIvjCc/kw2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA1PR01MB2506
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 08:52:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97764

From: Neetika Singh <Neetika.Singh@kpit.com>

As per below links CVE-2022-23437 is fixed by upgrade of
xerces-j version to 2.12.2.
https://bugs.gentoo.org/show_bug.cgi?id=3DCVE-2022-23437
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D743111a72f39a1b24f87=
bd1b2fc32ef707b41407

Hence upgrade the version.

Signed-off-by: Neetika Singh <Neetika.Singh@kpit.com>
---
 .../xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb}   | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename recipes-core/xerces-j/{xerces-j_2.11.0.bb =3D> xerces-j_2.12.2.bb} =
(88%)

diff --git a/recipes-core/xerces-j/xerces-j_2.11.0.bb b/recipes-core/xerces=
-j/xerces-j_2.12.2.bb
similarity index 88%
rename from recipes-core/xerces-j/xerces-j_2.11.0.bb
rename to recipes-core/xerces-j/xerces-j_2.12.2.bb
index fda6fe4..bc2780e 100644
--- a/recipes-core/xerces-j/xerces-j_2.11.0.bb
+++ b/recipes-core/xerces-j/xerces-j_2.12.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM =3D " \
                     file://LICENSE.serializer.txt;md5=3Dd229da563da18fe5d5=
8cd95a6467d584 \
                    "

-SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerces-J-src.${PV}.ta=
r.gz"
+SRC_URI =3D "http://archive.apache.org/dist/xerces/j/source/Xerces-J-src.$=
{PV}.tar.gz"

 # CVE only applies to some Oracle Java SE and Red Hat Enterprise Linux ver=
sions.
 # Already fixed with updates and closed.
@@ -20,7 +20,7 @@ SRC_URI =3D "http://archive.apache.org/dist/xerces/j/Xerc=
es-J-src.${PV}.tar.gz"
 # https://bugzilla.redhat.com/show_bug.cgi?id=3D1567542
 CVE_CHECK_WHITELIST +=3D "CVE-2018-2799"

-S =3D "${WORKDIR}/xerces-2_11_0"
+S =3D "${WORKDIR}/xerces-2_12_2"

 inherit java-library

@@ -63,7 +63,7 @@ do_compile() {

 }

-SRC_URI[md5sum] =3D "d01fc11eacbe43b45681cb85ac112ebf"
-SRC_URI[sha256sum] =3D "f59a5ef7b51bd883f2e9bda37a9360692e6c5e439b98d9b6ac=
1953e1f98b0680"
+SRC_URI[md5sum] =3D "41dde3c515fca8d307416123bc07a739"
+SRC_URI[sha256sum] =3D "6dd1ebd4c88e935c182375346cd7365514bd8dd2ad2f30f0d0=
b05257bab34ee8"

 BBCLASSEXTEND =3D "native"
--
2.17.1

This message contains information that may be privileged or confidential an=
d is the property of the KPIT Technologies Ltd. It is intended only for the=
 person to whom it is addressed. If you are not the intended recipient, you=
 are not authorized to read, print, retain copy, disseminate, distribute, o=
r use this message or any part thereof. If you receive this message in erro=
r, please notify the sender immediately and delete all copies of this messa=
ge. KPIT Technologies Ltd. does not accept any liability for virus infected=
 mails.

