Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.92.65.55])
 by mx.groups.io with SMTP id smtpd.web11.22785.1588514567026822324
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 May 2020 07:02:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=nnqvpaGq;
 spf=pass (domain: outlook.com, ip: 40.92.65.55, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ebvv9PWj4DLIcsDYFto2OyENUYpWsxdq0okdgdsFSBU9Ssfa6NQRF6V2oLbqsEuFj2rkcdLGb3i2xZ89NqAgyJJNfNaUPM+uMihOJMhMl2hkIdKt4IR4bwU1JVRsBJvxFi2ZBxc5t4ZHFrFqKxW6zo7IyKkkiRC6oe2K5bgKWKHcj8+dA8dzOn9FnHviyE/7NMBjJOws9wgoq9ZHSM3wx10/dava9vpogPsNtGbtfUuHEBmoPUOzgJcu6K2hGjJUuT9xKz+8Z5IEHd8xH0iwE9Wxn4IWRBfHV5ePLnZ5Wu7bTmhpTFQ6xtFs09TwVKXjOK2xgYpmP2A0wyXf+eW/ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1bJzi8l0427/YridrRv5dt12v3mFsHRif1b+3EtLHE=;
 b=Erw6Agg2zkH88IEgvbx4WNlJsvJaeCfe0IFuCE3A4Ou/gwttD6r5WUBmDvoipVpxSIaWcrmMxZpM0UNs6qBgsg99jwjpOIcH48SmvPPrndvQ+OwVBKjCdhyro79A/drSFp34//0D/yiqyUCZE1EKcjfNFozFTKuHm8KfnGTUdeHdy0/VFfySXjFiXqKlXBbn20rTzqPZjthDJ7Nqj1KahGU6ago6qwcU9o6lh7BcjXS3gQ6YwY9s6FCcAk2rzQVsUcM0q/uEtuv95OLtId1eCsgIz030IwGiaUXW7NUBHWIUqGbvTrGMm2yyKaO709X9r1J38uPsBd3kh8W7lfW52g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=outlook.com; dmarc=pass action=none header.from=outlook.com;
 dkim=pass header.d=outlook.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1bJzi8l0427/YridrRv5dt12v3mFsHRif1b+3EtLHE=;
 b=nnqvpaGqECMiC+svCQ+yf0WhA0PvgM+IKipzCVDEj/ORcbfoOZDZ9ASJeBr3D1B24Isg6OODUEaAodP6ylqXArtyvDo/TtcNz4hSsKzbXA1gfNzZCkz0RkC6ZCV4jrakH84mdt0Oi2Y3zd35IrxX3S7m/FW3iq51xwaIgzrFR7D3FjiuTkKcPYfa0ZGs6axsMsukL8J826a3i1Ou6WWKObwA8WnHZmuWwZQMQIlrGMhEC0Vad7ruKESUqEGtTLZaFHFyRJ96LPwj4Zk+PQX1P/Oltl74AsC5hragtW9Tzk6OnXDYd74xAA3eMQHv7lm+V5+1+raTDzjPJR68fj7JQA==
Received: from DB5EUR01FT037.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::45) by
 DB5EUR01HT170.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::386)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20; Sun, 3 May
 2020 14:02:44 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e1a::52) by DB5EUR01FT037.mail.protection.outlook.com
 (2a01:111:e400:7e1a::212) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend
 Transport; Sun, 3 May 2020 14:02:44 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:90AE6BC428FC9D9219C83FCC90894FD2647EAA92466EA35CE4882086B4DBBC40;UpperCasedChecksum:0D129EA71A88057D2E53C946BED9A6BB26EEDBA8723C3A9A399BB4DF1508D2DA;SizeAsReceived:7599;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::f5f1:b5e3:66d7:e590%7]) with mapi id 15.20.2958.029; Sun, 3 May 2020
 14:02:44 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 2/2] php: add multibyte string support config
Date: Sun,  3 May 2020 16:02:24 +0200
Message-ID: <AM7PR05MB6881BA0EB34C7DD5DD895168A8A90@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200503140224.27018-1-kweihmann@outlook.com>
References: <20200503140224.27018-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P194CA0036.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:90::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200503140224.27018-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.141.87.181) by AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2958.20 via Frontend Transport; Sun, 3 May 2020 14:02:43 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200503140224.27018-2-kweihmann@outlook.com>
X-TMN: [ogWpzneV4XAmx7uAZfwPEkKrH6CLBEBy]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: bee73ccf-4db5-4b98-6700-08d7ef6aa689
X-MS-Exchange-SLBlob-MailProps: 
	mBRmoEB1kyLZjHvRyHEJ2yv1rq5fk3tpGVdpPpL/mvO0/XnegDhZAgPlBjK0BAhruG6PvWHJfd+RxjLWV3mWOBioAkDrZleU3M0MbtjRC02j2rUOxKBm6ZYs8is5wtJL2wEX0ln0VSuA91g4ib6OnzBv9fUP5NTSRPB/UeH/rEDaUWQKtADcJYb/FTpaNyfma1d1sZMZniVrySGa+Y9FcAOGz8hJZz1Cbb7hyMIZPaHl3Tcoc33CCu9RpY/0+Ffl7Ah1N5KMUm+y/XbbMvL/2X1NhI7MnOQ5mf9hgMPaVx2RcXmrvndAgYNGntR7fA4eRSlLVKeo64ulZpGAPCUMBbDadflFAu0GJZ8XLtUaM4akRhcthvMeoqRjLKgV0u6sIp9n7yQpV7o+hCtCM4X9013lHcQAjrIiBos7l/83q6B8v+VovtJQVN9jH1F/i02+x64jNpaPcjGwP0MEknUXhAW1UHi0KhNu+jHiKQ3blfa1oZu2iR/k2moPR7sS23kNHgvg6mvd5d5tRA7p5gEbYC17EnNpaLI6mZkfVeLVCR4URUXlnjHPlInYpn0+5ZUMmQNXMktIwW1QsUv94y2Jb2FkfxNpmFmtPR+QPDtzgKTHNrdRWVbOhksTUE4UQrh5ShmSCV/jd26kI7z2p3zJlz42M9Bb13h83LrsgyI1uoR2KaVYrrlXCAOQILzTTkj2airkqu6iNsxYbmHwzTy25OxJKbI/wBTrdOGWxIAFTswVt6MHIktM7kD5Rfl5BFJvABjoMob412o=
X-MS-TrafficTypeDiagnostic: DB5EUR01HT170:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0LpxngKWxXJpZsXhPV4kkbRIh85tMi5inVakJlhOgufT3rKeLAFwIGnDaCA6vjdI1sJePnxTGffM9EpS8G+jA1FsB7YNYqdfxr//IgocTgNaSMysoAqWkPZsrhDJJhWratgEekB3UtLFMgLNWRYfMKan+fpafhgILj5A8OtGIxlqHgjhpOgDeVzz6mwV8GiQQ2qYhN4F+jh7Cq1Pyhk40w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	+0zjWWyUS/vQfF8NP3KrvP8JKOW4wC9wY8QjbTx7qX0dS8o1zl1z4lE3r9noNtaJ0hyaHk0IlujKc0u6hMfzfT6EK7f3P3p2tZskRJL9BKA+E0RBxs9ZF5Bagt5YkEIdCoyyeBvqfL6C00XY3WTtMg==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bee73ccf-4db5-4b98-6700-08d7ef6aa689
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2020 14:02:44.5068
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT170
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Add mbstring to PACKAGECONFIG to enable
multibyte string support in php

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/php/php_7.4.4.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/php/php_7.4.4.bb b/meta-oe/recipes-de=
vtools/php/php_7.4.4.bb
index c1784a78d..53cda40fb 100644
--- a/meta-oe/recipes-devtools/php/php_7.4.4.bb
+++ b/meta-oe/recipes-devtools/php/php_7.4.4.bb
@@ -105,6 +105,7 @@ PACKAGECONFIG[opcache] =3D "--enable-opcache,--disable-=
opcache"
 PACKAGECONFIG[openssl] =3D "--with-openssl,--without-openssl,openssl"
 PACKAGECONFIG[valgrind] =3D "--with-valgrind=3D${STAGING_DIR_TARGET}/usr,-=
-with-valgrind=3Dno,valgrind"
 PACKAGECONFIG[mbregex] =3D "--enable-mbregex, --disable-mbregex, oniguruma=
"
+PACKAGECONFIG[mbstring] =3D "--enable-mbstring,,"
=20
 export PHP_NATIVE_DIR =3D "${STAGING_BINDIR_NATIVE}"
 export PHP_PEAR_PHP_BIN =3D "${STAGING_BINDIR_NATIVE}/php"
--=20
2.20.1

