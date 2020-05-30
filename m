Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.92.75.76])
 by mx.groups.io with SMTP id smtpd.web12.3221.1590869557049061148
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 May 2020 13:12:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@outlook.com header.s=selector1 header.b=bZYAYtpN;
 spf=pass (domain: outlook.com, ip: 40.92.75.76, mailfrom: kweihmann@outlook.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j1idpydJydzb1dFdBkdWc+JyTmuu0p/CqjccE64BSeEaMH3iNvSKUWtKVS1sHXjfh5reG0qTlFxBhImuCvGXRWRax6IrSTvOZDxZHt0vsXnIosfS9Nfm325TpKya47WS+/koPks6ylKOqZ7E9Y/yDt0k0I2YdY1wTIoP3XyE/KfhqbGi5AxObl89c7TFVN2hbgMoEnT45IKxc+XibeVtR4O0YawLLl54cajRo7xzAayho+DAzpiB8wLW46ptQ8kIGCKgNc7FzbfvRCkf1aa75+bYa6lUDwCXGlnNXIiC6LvQb97SM6pmv5yKm1SXbSvHMJZ9SCF790wjN3Y1gIR4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mneWUo3xzSomm8tKHxYt/3i6jabLR6VbfDwP6nde9K4=;
 b=TRCX17tey0uneGYTYOq6ptzGp2lrlmHSxwpmW1piXuR3/Mmx/xLITA+HVdxSW5WjOqVUZGrXHccjDIBX3no+c4GoVPwlGXNjahMjLNKIMS9dmP7q//1ryqvcjNQ4c3ykrM2kLP0/4oOxLnlzfiNdcRQyRi0jmKAR5EHvV4ClB3FxKQYv/Clh5RAYeUfMM3PJROL9Q+iBYdgI1Q6xISySqwkA67dkA4ywwP3BbTuzexNatT3aVkhUN0tcXEzt6Zrt6xbTb+clrNg6NwXUyOxNUJvcsV6Ov+wrmakBn+nqpLJb6WeSgw9eXJcbUiKBk54UB80WhmMr9BttV+BswarlKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mneWUo3xzSomm8tKHxYt/3i6jabLR6VbfDwP6nde9K4=;
 b=bZYAYtpNNhaJP/Fk4Dy49Z1mjsUQu+P7nRIgY2MP4rPugB/KP5oJFGZjoHAijSJW+bDPeGZ0wQe0H6/ZbaOIygmvwzpWsEgwGddcGHtNhVSSbYmtW6qMa6Y1ADEXADVXzTimoSMrB56C8XsP0/9s9JVbmP98O/kSlsbGuSiscEYVgpcG5UUlxauK187pBh9vNIzbB7/r5kefZDoaLbtowmPqzP/JVKsrxYq8LGRaK54xNKbzhCQkdI1z58oImAFzmUVxG8bbgSDEGm4yshOkpVn6KuH6Pn1U/VGXt68vczRNyGz/8H2z383tQfg6zGZQugVEWssHe1Bii4GNdAePgQ==
Received: from VI1EUR04FT021.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::4d) by
 VI1EUR04HT144.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::297)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17; Sat, 30 May
 2020 20:12:35 +0000
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 (2a01:111:e400:7e0e::40) by VI1EUR04FT021.mail.protection.outlook.com
 (2a01:111:e400:7e0e::319) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend
 Transport; Sat, 30 May 2020 20:12:35 +0000
X-IncomingTopHeaderMarker: OriginalChecksum:61689958A1B389FD5B077ECB38035FDCE8D216A7563C9F4323609D93F5B15FE8;UpperCasedChecksum:7FECB8D14305F55A48F9234792EB97E8750FFFA34799E68025A1B01DD5359C66;SizeAsReceived:7567;Count:50
Received: from AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722]) by AM7PR05MB6881.eurprd05.prod.outlook.com
 ([fe80::2c81:794e:63ae:e722%7]) with mapi id 15.20.3045.022; Sat, 30 May 2020
 20:12:35 +0000
From: "Konrad Weihmann" <kweihmann@outlook.com>
To: openembedded-devel@lists.openembedded.org
CC: Konrad Weihmann <kweihmann@outlook.com>
Subject: [meta-oe][PATCH 6/7] zbar: fix typo for DESCRIPTION
Date: Sat, 30 May 2020 22:11:24 +0200
Message-ID: <AM7PR05MB68819889673388CBEB20B3BDA88C0@AM7PR05MB6881.eurprd05.prod.outlook.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200530201125.9938-1-kweihmann@outlook.com>
References: <20200530201125.9938-1-kweihmann@outlook.com>
X-ClientProxiedBy: AM5PR0402CA0005.eurprd04.prod.outlook.com
 (2603:10a6:203:90::15) To AM7PR05MB6881.eurprd05.prod.outlook.com
 (2603:10a6:20b:1a9::19)
Return-Path: kweihmann@outlook.com
X-Microsoft-Original-Message-ID: <20200530201125.9938-6-kweihmann@outlook.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ICKE-EDGE.fritz.box (87.150.43.214) by AM5PR0402CA0005.eurprd04.prod.outlook.com (2603:10a6:203:90::15) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3045.17 via Frontend Transport; Sat, 30 May 2020 20:12:34 +0000
X-Mailer: git-send-email 2.20.1
X-Microsoft-Original-Message-ID: <20200530201125.9938-6-kweihmann@outlook.com>
X-TMN: [FCkgUgtMU5MmPG1xISvsUoIHcEhGnJyD]
X-MS-PublicTrafficType: Email
X-IncomingHeaderCount: 50
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-Correlation-Id: 1e89a886-5fda-4040-b34d-08d804d5caa5
X-MS-Exchange-SLBlob-MailProps: 
	gjx25WM8ZNWDLNYE12708/BbGTepinvyFWAdt0x2VR1/jDnDDBjCWHTagMXfrk6yeLbOQCUZM9f7Fl7feoPui3NjuqfPsQoryGWsdYCgbBwaiXICrK2Fq07cmIp/o1V/AQkNhFoZAa1ZsNkAJngBXG5SORj6gN0ldLqLFuwiMcSW8bst4aYhdO4CLJ+1xAC7vLKxx3peLNf9AwE9EU65WMaWTEbc+QmsbK9X4piecSz2Runh36x0aDZO2NivGvwOwgA8+M8XGMkBa6lCOfukYqNdwKXJFqCiK5L5FLOeuU3NyGqFYg918oqm5hAJeeasCCSwMc0vFcZZbbGXU1M71UBYWcT2QWWIfbAt0zJc5p/qwayH1yye3EXM8xOZ4EvIM/nDS//VZofMxc5tIUDJ5qjJQdcgRIvahoqZuUzfCpmkUneqIECTCBx0/v3d6m6FzJY7DOt/Q9TBTH4awhDdgskj3NvgjrkM7bGR3BP2UiSXnJ7JpKAhYl/N23GyNN3xUMuj7KGGMV0Vu+Tz1PDQWy8ONRNgVAjjO/DPFtSbSTlv8XbeFP3wd02wvU6YVNRk7dvyu64DPc0kYFRDNFsojZxpv6xPp9K/lYYpkwcIsXw7NCX+snW/Zb99/MNf6W/ccf3YD3iaAY1lPf89dBvFfxqRyB5lj31PSh9JgvqkAhd/UM+BjAw5zmEz5/dCWFJvH7G4g6pGT2a8shnmZ1tKMyze/41wLL7uSgcyQUcwYlk=
X-MS-TrafficTypeDiagnostic: VI1EUR04HT144:
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	X4m6JqMDy8qiNAXJDKL+/r5jDX+joDWwNQ7QqjQ02p4qg3xoA/1kqDF10bUYbS1Y6DOhrnm3VXWmBXK65/pjKRB0USKKc65KCyMFlE9sbcJDusJpCMJ0m/rE/OuY2pvd8WTkiQYBdHBU4JuAyNVThZw+vfjqkNNsTqsdbze19M+ilOu0hKvFsyftnBC7wB4BOP+oxG80BwcJJdDQsaU4/w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:0;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR05MB6881.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:;DIR:OUT;SFP:1901;
X-MS-Exchange-AntiSpam-MessageData: 
	Y8KpI3CnldHs3Lrg1g8iioFLH6krEeV9sm4eNug8af8/wOIPeQj3vIHd8dggpRSJ074C2SONHdpGgB9t8Nklb9cQ2H+N+3fO0xRPB4KR2TnIbfUJYjvPuO54qikN0lahvhIniBEXvztkVIhRz9I1XQ==
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e89a886-5fda-4040-b34d-08d804d5caa5
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2020 20:12:34.9547
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-FromEntityHeader: Internet
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT144
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

Signed-off-by: Konrad Weihmann <kweihmann@outlook.com>
---
 meta-oe/recipes-support/zbar/zbar_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/zbar/zbar_git.bb b/meta-oe/recipes-sup=
port/zbar/zbar_git.bb
index 935e09cd5..181d7ae43 100644
--- a/meta-oe/recipes-support/zbar/zbar_git.bb
+++ b/meta-oe/recipes-support/zbar/zbar_git.bb
@@ -1,4 +1,4 @@
-DESRIPTION =3D "2D barcode scanner toolkit."
+DESCRIPTION =3D "2D barcode scanner toolkit."
 SECTION =3D "graphics"
 LICENSE =3D "LGPL-2.1"
=20
--=20
2.20.1

