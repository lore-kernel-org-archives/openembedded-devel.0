Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.92.73.100])
 by mx.groups.io with SMTP id smtpd.web10.3258.1590869552441487788
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=hd059k1A;
 spf=pass (domain: outlook.com, ip: 40.92.73.100, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hEyrL7wunf5aJL/q7jqZJq//QVnJ18I/J7n4oZWXEMfpulpTqJVKUxPjJTv7sgiCxnmP9jWlg6KCioM6uCh1g/L9RyTWQdgJocucwHAo0uiVR1PaQey4+9xXdvQksI4JxiLK2iqgRG9dP6TsmzcA67EFf3hmKCVboJLuJ/OkA6Tb5PxnP/PgzMf21j6vxAH7BKE9mD8LrN/f5+D93qA4QnpwEtxUSnD8gxRF1BD4qOMjbEN7xeahHZO03EDqwWySB8bwp720bLHWHgJaveTOiyNv29uWl3ItfrSxV8Viu/2hf7XVHD7vjmXepD9rCY8Ow8ahGCDOT3SiTuynXVY6EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph4Boiam1kFbu4trADbjJgBa5xPvVJGKYRbV+t5uIwE=;
 b=N8rpiwz2dKnJS5cxB7+FnMBTUgf4+9/NVBuqcuhxhyYfL6uoeeQdRtkdgWqaVMrEMIuND2d2K01N0OvXpUmS6gkn/IE7lqAebwZQ/NvGxx/AwnmBYRVC6dl3xrKVWs3IK7imvqHT3WoDfiLAByrI90rWjM/u+BJvDzF4KM5vD69X9XXrn276inFkarFfOgozeDBwnafuJ3QVgtwXF3eh+tjUqK4+MuUtFfJ3W/sFWQzuf1xWSF4W/YeVHc5HQF5e2TpUg6n6zgtSMqtbtmP7k9kApGJfUgSxf6G2IMx0CWqtcwc5Nnkc/QM78PxWhZ74hXN8jTQwelAHpAswrRhU6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ph4Boiam1kFbu4trADbjJgBa5xPvVJGKYRbV+t5uIwE=;
 b=hd059k1ANXsIobbktEp55y7PxbMYX2dirX8Cm3Nco9RXHtYEracmTk5myESjb1w3CexEYrxBrpJCKD5A3LIQSZvcgzOz77MS3RtO0DulPhuJoP8mY2kBjjswnYHIpiZRsa+FK1uidaSyFJP3OkedTjdoBmDJx/u60VIwdpuz9FqMI3b0nh3KdXF4dsXEYnmRPnH0FOOiwscLim7+xqH9xSDmsGncMmogINhkiyH6cUXdsjLDfDoixa+g/dxON1mduD1Z+wDgO3fD6XUQ9W9I8UaTO3T62NsYcqnVQH0DPMKbdo0BWke4CT8byzDk9i3oo38zEmIc1CoMkCJxAy3Orw==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::44) by
 VI1EUR04HT030.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::244)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:30 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:29 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:A4602DEB1E1B1FFE800CF4C35AD7BF40705F5C1DF69350531BD1AD34CFDCBA5F;UpperCasedChecksum:24C1394F70E0192C74FB081215F1C3029B8E8A41A3E1B66152EACB560AC52A15;SizeAsReceived:7577;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:29 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 2/7] distuils-extra: fix typo for DESCRIPTION
Date: Sat, 30 May 2020 22:11:20 +0200
Message-ID: <AM7PR05MB68816C8574B7BED3838BD64BA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-2-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:29 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-2-kweihmann@outlook.com>
X-TMN: [Ep22tnvA5FVoQAORABQkVoaxuAkxtN6e]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: eb6c7f0b-107f-4084-9563-08d804d5c7a3
X-MS-Exchange-SLBlob-MailProps: 
	KE5ywuOaN5hmCfBDvSaek53LyH2iVPSXE9y24k1i/7AOoRT1hpD3kRCUAzmn44Ll4MEHqEXuQFqYBF4OQNVoVxMlVqXWa5f77K5TcssRsJBbfeTAs2FgCNA84ZAGuFwavmpv8Z07dmwNACK0qCUotPmdCHBOjLM1g5uaZVOrhzHxHsuwfWcr5YByggtMnMLD3PRjG+ZDMCcbE2GMowjZlk6wWxSG/tYxSsFg96dz8gmTbeGZoQrNxjwnK9W4ZHujczmQmBab43CSvwZwY80l/TKu15X5PU9MNgV5YvoEdsA3QHzzDGzTlRlGfM+DkwZ/EeO/BDdjTymxXxw9Q/lGkKR5nNgZOPIW291ctVMBTvBFsvtuxsUjsrs6Djor5kSwNYIRypELxk6QLmHRq4/tK8i6HaR53tFPb8S9z/TP9afD3iR6l/CB91zQyF+yk9vPvaldeOW3PV0jqc4e+Yma2xRdeXMX7X+9wwhDP8hhkZYA5BoV9Tdt2dX/CzD8KMuzCef0oMvNrpHwVVw5pcTH9/bOX4BXgTYx1DH+J9xEtsKBwkkuXIN5XP2ttESD6SSAWhnMdBLcyx16IWbEmOxMrBDBD4VsBN6zY+WIahorcnX++e5WDAqh7ilIye04vjIgcNoT9hpLq4Tkvf1BniPJ7+EOOpqBfm+Ce2ifsMIIR+Zr6R2NU4X7Hl7ccBbCig0TkrJ8OBkss/9oNl9sbIKcXdAogjwslMKCF9gB4R1+ANpW5ZSmXUDZsGqMOySnlhUQn9IprhtlD7HnpnRVKBJrhzuaUQ0xxyJfzF8Wgcw2+/xnWzH/htmecGNV3ONym9nx7rXIGOU/l6CWbzMNRL5q+N9pJkd6gcGaILvvpTv5w0F256T0KpSpl5AkRPZANk1sZ/g6SMUki443eNKftpgMNUHnTUDWnPbe2cGQzfttehwBTCPWycut537ViKEANMsEf2/T68mChXxak0sQCZYq3zWSExCT7e/1
X-MS-TrafficTypeDiagnostic: VI1EUR04HT030:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	lHdeYxmy4eAOW78bHuj7E48DzscuHoU1KhuUnndk7Q2bueZyNkOZRhIde+7ADmoVdOQQ96m3DozFUfs5KwcjSsNvibpecvmxGFB5RQMWwDVdMuP1a0SABEEBuSX9Zq0y6MUxF15X+sCclJO5aE8rYVoHKdP2qfWzCV72yMeCdafMb7iICzhcIXuuX3BDnaRa2MksXMOK7drm0MBa8gQq00U2YeO/iA0I1VLJ/Ij0Dpqdg/RO/dGIFMBUfBVmyKdB
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	u2Ix0u1V7NBdQdMgfl9gzn/nVUxwT/+ZhIEkBjQHaRNTIFFpL1HFgVhL1qk1Lrqi4jGIhJ/J9dq0eQmiAhTIf+Jetfwt6iwMzBXkTIzhQ1nwJpG37D4VlUINhNUFG3MMKLz+jay6j9OsuC6ZK9bwUw==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb6c7f0b-107f-4084-9563-08d804d5c7a3
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:29.9206
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT030
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-devtools/python/python-distutils-extra.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-devtools/python/python-distutils-extra.inc b/m=
eta-oe/recipes-devtools/python/python-distutils-extra.inc
index 4d87d77cd..3430cedf6 100644
--- a/meta-oe/recipes-devtools/python/python-distutils-extra.inc
+++ b/meta-oe/recipes-devtools/python/python-distutils-extra.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "python-distutils extension"
-DESCRITION =3D "python-distutils extension integrating gettext support, th=
emed icons and scrollkeeper based documentation"
+DESCRIPTION =3D "python-distutils extension integrating gettext support, t=
hemed icons and scrollkeeper based documentation"
 HOMEPAGE =3D "https://launchpad.net/python-distutils-extra"
 SECTION =3D "devel/python"
 LICENSE =3D "GPLv2"
--=20
2.20.1

