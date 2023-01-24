Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F345C25B50
	for <webhook@archiver.kernel.org>; Tue, 24 Jan 2023 12:08:59 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.67])
 by mx.groups.io with SMTP id smtpd.web11.13197.1674562136038525506
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Jan 2023 04:08:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=AV4oCNHd;
 spf=pass (domain: vaisala.com, ip: 40.107.20.67, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OoAT7ymspf7Zk98aLh2fsliXH1pU+gbNNs+KSYZClBoHa7uM9YW6+yNF32MCgEqEStIdxV/+In4TMLp9Eern4hctyP71OlVZE7EqEfdX67mjgHOyHrgpjL3nAVO8f7MGwwuiHx1X9fEbDI/Kxd1am9bsAu2NV50I/kEgHETKWHBwwHRc8rVlceN6PWpHar6MIaA9gjIJSMvX6rfFP5amwD3CZMYBFGUZs82V4Zb4gpm4ErJC6AeGMDXjO2LOJ5v+s6gonmZuAi/jo5SL1lX+xid7zJ86PMRAwrd5m4ZL4+UQBf961uMQH5FOnS+FPNALSb5j09hXW3WWFM308kD4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUAThUd1R5j+9sgImtlrXkbCzWptNHeozada2xCg2Gw=;
 b=TO+phMS++HftMaAR5NCyG08Rh1YCvFXonkXc7vJsKpbUw6HsFH4Mzjfp/B38KSW0clSEAXfiEaSBeeioTeJbgAkXbXDHcQvuKjjB01jv2FFL1FU+1JtNoW4YJPylXFDAa+PhCbk9k80jNXmvbKs+OM8JdTmorEuxAzxR2vM1RRe2dLYnlqiryv0oD7KrKKFdzWW080qC45R4V45ruub1XN0xGXyHPQUxwr1BXBF0WpjgbDkIsJ5Ho89TYrBWxi/4566SpKHLE4aZRl4EKWmh8kJ8VOCmhJ5GvgljDDSNeNsRRP9bYen4/mfCFhWulFqMk/Fq/i5Iwbvq43psd32dIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUAThUd1R5j+9sgImtlrXkbCzWptNHeozada2xCg2Gw=;
 b=AV4oCNHdlJIu+VTaLuQwaYigYs0hbz64AdvU0e6RJJ6Z3lcuUIcodAqfHWjkKAv7sfBd7Whc10M5QO3NDASMYm2QaQSyN2pVack3f99wyYuGWSjDw79naM0qlC+WbDjBFmvsTFGAOyJgcEm2UwJPCWQHpygVA9MsmkfBXrEc5VxNWp/ZCFwC7ah3MMrBcb1o/KwnUWxCgaolOij081RcwbuVW6aZ6zkHt4RlgsJhCENYUxLvc2MJJagH++BsvKJqvDAQC6FNclyY4BXi2bEuMcVZd4DdFCBNyB0W2GFR6bsWTOrBDWjBT+9LYkjXjQwd3CLi4dhMtwnIYR0oYofZhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com (2603:10a6:102:2b3::22)
 by VI1PR0602MB3405.eurprd06.prod.outlook.com (2603:10a6:803:9::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 12:08:53 +0000
Received: from PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049]) by PAXPR06MB8579.eurprd06.prod.outlook.com
 ([fe80::ce6:3fa7:e565:c049%3]) with mapi id 15.20.6002.028; Tue, 24 Jan 2023
 12:08:52 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-devel@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [meta-oe][PATCH] Fix missing leading whitespace with ':append'
Date: Tue, 24 Jan 2023 12:08:13 +0000
Message-ID: <20230124120813.3888580-1-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.35.1
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM3PR07CA0124.eurprd07.prod.outlook.com
 (2603:10a6:207:7::34) To PAXPR06MB8579.eurprd06.prod.outlook.com
 (2603:10a6:102:2b3::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR06MB8579:EE_|VI1PR0602MB3405:EE_
X-MS-Office365-Filtering-Correlation-Id: daa56c92-2f11-40b3-aa97-08dafe03c271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	t480dTlC/EY2hugdHfgpf6mkpLrhp8Qix5YEwOw6VfQHlm8G5bnB987MIHYFRiw3VkMfZJ0hzmF8TY8xr05+yngePPcujHnYMYx01e29OpNf5MXb05CIotxvHCNsXKGOjqyjGu3+parntTD9sm16sZAQIZm6YXVofhuAZWwKEvYFLHJ6lGw3GUrl1u7G9/N30Yu2KHH+Wb3OMJMWu0vQO/uTti2AG0GasgjVVeXi9+FIrr3yvv8s/KbPLFW5lZL4y8RudLmZI+92TFss3vDcexJxZDUL5Vk64XTsxuI6j2jsAt9fmpHmFJHbeIDKtcBg0AaKOPc2WUL+JGcTLRcv5rW9ep4e5G3Om65qyljDvk3CcYaBA7sHWMHbVgSjxTAvOwwz53OoNqi5aE+tfxUOAG6FkRXkM4j8QPB5cciyMovkn5ILMn0hbaRMNYqwE246/dn7/42VZhugy0HZyuU1ESGnf1CG7xY7mTk1nOSi5mZ89WDIy01/Yr4N6TK+M65kj+vUVV7ZbmHBwvKNbA58ipGzUFJacSLvjm4NeshJ4KIHOZSz+yvJePkIOUZl1tO0i7Vb8dqLoerp/xOXv6wUmSajytwUWCzIPUHetdpa5N2Xf6YtaRYwUjAXmOB05K8hwvsNsJq7ZhoK4UmK01j9lVtxCdO+qi1htQRv631IPcdLy1W06jeeJsE+c2eiCYcz86KBqng/TT7aTcw8jwHkRA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR06MB8579.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(136003)(346002)(366004)(376002)(451199015)(6666004)(86362001)(6506007)(26005)(107886003)(6512007)(478600001)(186003)(1076003)(6486002)(52116002)(83380400001)(2906002)(36756003)(316002)(2616005)(66476007)(38100700002)(66946007)(6916009)(4326008)(8676002)(38350700002)(66556008)(44832011)(41300700001)(5660300002)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?oVdLVTyPl34VIlTcSdHa6/dFVidak/0zIs4bcsEjn4KFNAfEovfSe+ROu+cS?=
 =?us-ascii?Q?Q98W86zCOQWiZqhx/BTsEwZjL6i3nrjwsk8rsaa2ehwnH8jN6ULB5Ofza4Gv?=
 =?us-ascii?Q?0XElDfkG6R+p9YgW6VkLqqxEyBiZw0OMHFZ8BmEYvPHGmMAtbOblXpjVnSE9?=
 =?us-ascii?Q?zyUY7gZgcjZQ2G715wFhBqwn4DuMju247mt15Rr8xRTPPvKeBuzfhncMBKBp?=
 =?us-ascii?Q?ntdOiCTVgGzY3p+q3ZoaL+Z4gp3OvDVGxXpscLJ+bYX5m7qvB2Urb8Z5jZ4n?=
 =?us-ascii?Q?FittI+08hvwoJijq/cpezMNzP5fwm1uAUnQRgKvSqKChVSZzO9zpjnuiUHAK?=
 =?us-ascii?Q?DHCSMDhmHAejFJqmML46GKF1k2u6hh4keQ41JnMqZfxnv4j5A8/hRh+38SNz?=
 =?us-ascii?Q?+OXfgFQ+++2aNPT12RXweXgT0P2HXcvetx6xYkBamiTCa0Y77CRPrmKmzOEv?=
 =?us-ascii?Q?K6rvspMeVvNVhoU9GSKyccXpTjLmqIP8CVLRCt48dAta9KfZc56sebbFvZ8I?=
 =?us-ascii?Q?QTadlo625vC7jsKPO9TBH0mdLd9CRsvzhd9aTHhVqkjopLEFe7Ewyr6y3ZzS?=
 =?us-ascii?Q?tJpfAdtaPn0f1I4vIWTL1Pz/3a21/4gmH/jtAD/Mhx/3d6yFRbaH1dQSRUOS?=
 =?us-ascii?Q?K57Oz0rtMEufEaOwvlt+SAsbRRpQAc8A2y79ZmJxizuJ+6WlrUP5o7+vwLQE?=
 =?us-ascii?Q?0z3hJQK2hwAh8UmNoSeKR29+HwuHRZIfsfs9InkHdjXuY5YQPj1IqE3VNm7+?=
 =?us-ascii?Q?O+IAXsRKJ87FUCGubg0Mzlz/IBQyvvyebbfEteZNNobi+cwaa0V7jf/XRv6/?=
 =?us-ascii?Q?Q2zwbiSWzT/9ulvBooYCPgnj4bkyjQDX+NVIaqJUoDac2btt2e5l1W+Pbsg0?=
 =?us-ascii?Q?fbIFkepnjD1aap9UzeUHo5pc75ovxVtQyy1S70qB3lsgd5ANrTRlzCjiau4v?=
 =?us-ascii?Q?0r9d4MB79DkBKBTPmUDDPX2TGbdmhLssI5CpQE4xNzDBIZB5FXKbKUS44x1s?=
 =?us-ascii?Q?5Hq3Fgl6Dj3JvKmvrbLX9Knm1iiEplWpjwhDVsY1Pxhs5JCTjBSnzC3CErIQ?=
 =?us-ascii?Q?7x7voTKfo0XHXHq2HyYe5XlWuJYufAR6oLbD5ncc1Z8cE14/whbdRwUm88m2?=
 =?us-ascii?Q?lj6H9Dgm4XvbmusMNwRUF2O+iSUkT5YvO505z+eYyjp8TNIiCVUSKhJejm8y?=
 =?us-ascii?Q?5jWy1n0SufoYwNUd2jvKDcJ4Dyrilr/l16dlSyT/qE+e7h6VN1VCQtpNQQ49?=
 =?us-ascii?Q?ml8s4lkpZxloA7GMYEi5/Y9RWLV+HUqLlego4zDk3nnO3os0u/BPqSuyPjE1?=
 =?us-ascii?Q?DHht0ZmEcv7tg+dudB+VjCmstmJRhrfPaP8XdOcGhlsQGiEZMK3IHv6rObbm?=
 =?us-ascii?Q?qxDT/gfIXov6e7RaTWxGacxq5fnHhlLaQDdq42RwnHMvXPdvpSQ8SVdiCtF9?=
 =?us-ascii?Q?4brHSlUpSFrmF9Po+PKAwNjvDo2gx1g7ffXe0z3NN4P3aaF+QCD+cuKrLlMy?=
 =?us-ascii?Q?0HY/l9rFgqInYe9hONZaBIuGJjJfYGN7ETcHt33AwkYqy3Etgzc+EdfMR9sn?=
 =?us-ascii?Q?f1kJo83bne3aaeupJ/IhFE/9IAuuYwTlE0zcnit/AXL+IfXYEUOaswT4yFEE?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daa56c92-2f11-40b3-aa97-08dafe03c271
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8579.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 12:08:52.8338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8HeKk9yThhS7erwdLwLiraplTnU4jDsDo82bJCBecFzL6vPx4eY55cJ6AtKDJgx4WRvOJOMKukW1Y6zi3EetiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0602MB3405
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Jan 2023 12:08:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100718

Mitigate occurences where ':append' operator is used and leading
whitespace character is obviously missing, risking inadvertent
string concatenation.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb             | 2 +-
 meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb | 2 +-
 meta-oe/recipes-support/neon/neon_0.32.4.bb                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb b/meta-oe/reci=
pes-core/dbus-cxx/dbus-cxx_2.1.0.bb
index c8dabc5ea..44804545d 100644
--- a/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
+++ b/meta-oe/recipes-core/dbus-cxx/dbus-cxx_2.1.0.bb
@@ -9,7 +9,7 @@ SRC_URI =3D "git://github.com/dbus-cxx/dbus-cxx.git;branch=
=3Dmaster;protocol=3Dhttps \
            file://0001-Include-typeinfo-for-typeid.patch \
            file://0001-include-utility-header.patch \
 "
-SRC_URI:append:libc-musl =3D "file://fix_build_musl.patch"
+SRC_URI:append:libc-musl =3D " file://fix_build_musl.patch"
 SRCREV =3D "73532d6a5faae9c721c2cc9535b8ef32d4d18264"
=20
 DEPENDS =3D "\
diff --git a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb b/=
meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
index c95a5b2d3..1c2c6e21e 100644
--- a/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
+++ b/meta-oe/recipes-crypto/fsverity-utils/fsverity-utils_1.5.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/git"
=20
 DEPENDS =3D "openssl"
=20
-EXTRA_OEMAKE:append =3D "PREFIX=3D${prefix} LIBDIR=3D${libdir} USE_SHARED_=
LIB=3D1"
+EXTRA_OEMAKE:append =3D " PREFIX=3D${prefix} LIBDIR=3D${libdir} USE_SHARED=
_LIB=3D1"
 # We want to statically link the binary to libfsverity on native Windows
 EXTRA_OEMAKE:remove:mingw32:class-nativesdk =3D "USE_SHARED_LIB=3D1"
 EXTRA_OEMAKE:remove:mingw32:class-native =3D "USE_SHARED_LIB=3D1"
diff --git a/meta-oe/recipes-support/neon/neon_0.32.4.bb b/meta-oe/recipes-=
support/neon/neon_0.32.4.bb
index c16a2c10a..d281bfde6 100644
--- a/meta-oe/recipes-support/neon/neon_0.32.4.bb
+++ b/meta-oe/recipes-support/neon/neon_0.32.4.bb
@@ -33,7 +33,7 @@ PACKAGECONFIG[zlib] =3D "--with-zlib,--without-zlib,zlib"
 EXTRA_OECONF +=3D "--enable-shared --enable-threadsafe-ssl=3Dposix"
=20
 # Do not install into /usr/local
-EXTRA_OEMAKE:append:class-native =3D "prefix=3D${prefix_native}"
+EXTRA_OEMAKE:append:class-native =3D " prefix=3D${prefix_native}"
=20
 do_configure:prepend() {
     echo "${PV}" > ${S}/.version
--=20
2.35.1


