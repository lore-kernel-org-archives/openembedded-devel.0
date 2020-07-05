Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.63])
 by mx.groups.io with SMTP id smtpd.web10.42531.1593975466850180494
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Jul 2020 11:57:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=g9cJlVDB;
 spf=pass (domain: outlook.com, ip: 40.92.75.63, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jTgUuWwxY3//Xl/iVKKyDo7f9J/G8cV/fp9t25DNEolsPMq8k3VBSiz3kC7Akrs7Vhe4ZhhKvqzcO3+ysBIRWiD1SC+3BRx0e+ty/OLBoqEN/0YqBCczvlTrFid4TsXXHoR/fg44EixOcDMWg9msckQJkXmtNSztf8JH8E6Lru2haC1GCZXisHYn21FMCxky1Glc6gbIEkxciuSVxpw/9PrrkNoggIv5gagOYTNubW3LSr+lwPsqKOfQFF0JNZDghv0FyrLydgohpuzLMKEUap7ebpIkZMRMuQj0BgUbEs0R35w2YW5LL4OhbXiBF+bIDBrd2OpDRTOIfPMXXeKxgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrMqDCHLSMXYs9YC40se1GAfGiOb/6KkjSuu0CzbCLc=;
 b=ISbmRxCCQnqDWwqB9YzFQQINyzBZ/8x5lJt81nUhB7RCul3tnzf13o6tiz/4nIVfniIqTp/jWUq+7UBMymzm1Fjst9FEQ5sM6Xmb69MWQeKXHn8grSYoOjT0EBm9WIZc2MM4Im1PRHhvgsqG386ATHn0s0JMwAqZYaopfb27muS0OVE7VdMQFS9s8DKpEz5cSVxwxrVNkMJ/e0uhVY8PNK7PMDHY7paSoimSeZrnwAFxc0YkhWK1TVXiqD+nSEewyzmbzXrIqSqKMAy+kBPuPx53279wsAFfGy0BgiJil7cxxPFwwCnhSZ+2tQKHMw2kStKb/VSHrFe/rqrNyaVJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CrMqDCHLSMXYs9YC40se1GAfGiOb/6KkjSuu0CzbCLc=;
 b=g9cJlVDBNhj5Uy6asmyoDsJiBEr7+9+FeTUEoldEwoS8sLXsscIHqgprfciGsbxrVSMUBgKKDZXU0XHU5r3lO2azIsCTDtckwhfr+6U7x4EAnN3E06G3P2yNEZHDXtW/uF3odZm/N/l2/7S+1ttuZOemZbxrOXiGkw1otedcdbACp/QO42+hD1mYfz+Lv2HkmLfiiSUuZECyvzggG7Te8n10s06EbcubWtoeZWSECkyLXkcQDCVF5te1MLiDQTVx3FzoDisCeseQViOCUR8ZAf7cL9ekbGwRDfSo4Q7vcY7Pzp4yISvbAufsjeE0oh27MssfPpbAeFDHvDLdLH5llw==
Received: from VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::53) by
 VI1EUR04HT095.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::408)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24; Sun, 5 Jul
 2020 18:57:45 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::4d) by VI1EUR04FT026.mail.protection.outlook.com
 (2a01:111:e400:7e0e::127) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.24 via Frontend
 Transport; Sun, 5 Jul 2020 18:57:45 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A996DF01D4F9923EE958297BE6C957C4DDFB84B582047CC5091FF66471CAB489;UpperCasedChecksum:C79DA80C6765615D684272B67776F503B544D68B657590A0AF2F6EC3E0BDBE82;SizeAsReceived:7520;Count:49
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%6]) with mapi id 15.20.3153.029; Sun, 5 Jul 2020
 18:57:45 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 2/4] libconfig: remove cmake append from base package
Date: Sun,  5 Jul 2020 20:57:32 +0200
Message-ID: <AM7PR05MB68816A5898D1E159F72A9596A8680@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200705185734.839-1-kweihmann@outlook.com>
References: <20200705185734.839-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM6P192CA0036.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::49) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200705185734.839-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (79.215.14.174) by AM6P192CA0036.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::49) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3153.20 via Frontend Transport; Sun, 5 Jul 2020 18:57:44 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200705185734.839-2-kweihmann@outlook.com>
X-TMN: [GaGEE6WErBTKm9S1B/UFVAFbpgPqcvTX]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 49
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 74b69d30-1ed5-4b9e-b2fa-08d821154d4a
X-MS-Exchange-SLBlob-MailProps: 
	S/btQ8cKWiRpLJNj1ZiGHh21Av32QMOvRMBquL47ZEvCkFjdYAmVWkE+aFc1q9YSzpy51Y3DFyR+STE8t3Ml6was1JRGaCZNeodMWsd5fAE9zotCNJTt1KSKeXob2w407Z7PHGe4wPr8++KiM2aK/7woGU/HPy2qvNybEdlJBFxV6ve+ml38tcjHgRj09CYn546ZApOYQAXvX52NVFYXDGXM6P4pjwYIvktbl9WAh3pNlyNQNGiWSYIHRPPLVmBxSw2aPgX0TX3ZSc/dAolMLRErTrcj1bLrCmjPQny95W64o5Su7goSnSUO+F2Jz1AHHIl2Q0AJ49Qu+8FqNwV52sXzo3uHxZzDo4rLG0Jat4nqz9j83SFW6/POuFR8xMGShMkxcRlTNOjWvhkj6l1AmtGCiI33fKmaMNbQ7LEvlOLjUcRFh5tZqfmQbsMuGiyvPElFAfyTpPKD4xzYSOKB/U87lRdMhB+fN5JRjx0oIPOIur4J+A94YgyRtIwF6PftVEMRW2pimQdCZird4GzRpdPdfk31f8zfkdyU+o+C9XqTCG7SInxHOkeDKBKApePM5Oo5p+f//KSktONVWr1MS5fhhFduI9Ft4GzVwRFjKLQUuQ2yeiQ6i+udhwWt/8pA8WeSmhNJEgO4GqDDKBdtggiqw1JKSJZRxErIPKLVPCRC8khX9HKk06JjPpEF7a1BXuWjSpmQjXsqubCfpRMFVgIo9h2kb8HiuPUhC7iuY4zu817qjF9IGtf9LGiGZXyddRU+8yPoXQ4=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT095:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tCIaVJFFsaV68p8ScXo3OxudMwJY8oYUkkQTYyogqZ81y5L7uU6boaLmMqaedzza/li+Xl706VaQ7+TqElX6ZT/kcE1l6QEc/lSMlmkEw1aQJvqv7aZ2lf7O+Z+9fRZxpQEaE1uX9ff/c3Utma4mpoblRjm56bW9vj6Vr0dybXNUzwxY9A7azXSRuBL3zolG+rAzxHMCuCawKNMq9rNddA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	/FlQRWFfmInfnK2ipPqt1qGdDak2yKH8UCq2DXHjhce+DcD81KoUfEiZALebaQb+P7tFiDSubZzCenJ5EXSqPqAxdPDTKPE1xA7/PrFZaV402ksucDIw8wl1MI5O6ZAMajq5B1tH35n9Ne2YkebP0A==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74b69d30-1ed5-4b9e-b2fa-08d821154d4a
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2020 18:57:44.9806
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-AuthSource: 
	VI1EUR04FT026.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT095
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

as by default it should be packaged to ${PN}-dev,
which is packaged before the base package so the
append doesn't make much sense

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb b/meta-o=
e/recipes-extended/libconfig/libconfig_1.7.2.bb
index eb0a2c3ec..148e85ce1 100644
--- a/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
+++ b/meta-oe/recipes-extended/libconfig/libconfig_1.7.2.bb
@@ -13,7 +13,3 @@ inherit autotools-brokensep pkgconfig
=20
 SRC_URI[md5sum] =3D "6bd98ee3a6e6b9126c82c916d7a9e690"
 SRC_URI[sha256sum] =3D "7c3c7a9c73ff3302084386e96f903eb62ce06953bb1666235f=
ac74363a16fad9"
-
-FILES_${PN}_append =3D " \
-    ${libdir}/cmake \
-"
--=20
2.20.1

