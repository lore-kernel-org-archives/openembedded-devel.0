Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51B75CDB483
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 08:28:35 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.72])
 by mx.groups.io with SMTP id smtpd.web11.276724.1697617706623938702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 01:28:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=U9KHnlED;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=U9KHnlED;
 spf=pass (domain: arm.com, ip: 40.107.20.72, mailfrom: luca.fancellu@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhFGUDGWAhFZXBWqxTDpNATfVoPzi4YVAoxXGOzOplE=;
 b=U9KHnlEDVnwTt6Ri0H6YcyegZJYz1fmSzbBVhymYA8T15w7cC16v/UTBZa0opcZQxc+L2NtETtga4/stImeOMZ673kUa0r+VZ5n2hAKXk0SFAmHVXh2OWExNn8xKT95kw3seEpMyVZuDssCFiueE4L2eXI953lOkznVAlkdzppg=
Received: from DUZPR01CA0222.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::29) by DU0PR08MB8731.eurprd08.prod.outlook.com
 (2603:10a6:10:401::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 08:28:22 +0000
Received: from DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:4b4:cafe::69) by DUZPR01CA0222.outlook.office365.com
 (2603:10a6:10:4b4::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Wed, 18 Oct 2023 08:28:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT027.mail.protection.outlook.com (100.127.142.237) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 08:28:22 +0000
Received: ("Tessian outbound fdf44c93bd44:v211"); Wed, 18 Oct 2023 08:28:22 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc5c6ff51ab591de
X-CR-MTA-TID: 64aa7808
Received: from 388fe08c0d1b.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0FA482CC-742E-44BE-B89D-F65FAAE00DB8.1;
	Wed, 18 Oct 2023 08:28:15 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 388fe08c0d1b.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Oct 2023 08:28:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eC69wSkx7V8szMgmIVJMXfXpjtgETh2KGIBZi2TuPwaC+hyyBO2jc4aBekwgTVaj7qHSYlMSkyMz6d5i1ycZFaJxM0Vi2TKwlUij4c/xF408kzDGh7n/I7GbH74iaewFzoRc+8LWliPHkcMoyRkeCplcazg2Rbl4IOgVckwNRBaOrVGe7ygXVDXa62xOCaMBXWosHxgKF5JxhQ26+zRaf4txoR+LYQc/Ce956MrB8Cd4MjYQafooxYQbFdtlduf7d+XanjjHBUoUryDd61tzAlotlEoUORzSYQhRbR15xalXSnOx8vhdfctujoEGCCTy73+XF9HNxGKmyTFWcRB9nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KhFGUDGWAhFZXBWqxTDpNATfVoPzi4YVAoxXGOzOplE=;
 b=gd2Sol8YBHm5KosE0NeWUe4P7sGB/qQSRGegHLgFX58Shsk4UmTUXu38W6D/9TPiabEYmm77g3Yk+fU/z4zl7mB+iM2oYna8Dbh6R69JZN9ShMSJYt6MqNroOQdeBsNcGC5gKNggpqtXttteZuXaa/P6nR9BGC1ny8lAnrLQxZv1Otm3ii8TrDTwa/QEgWf9Duk9HDpE4+Xu6bGQkbvcwMorw+NweZrdSfgGYKTW4z8Rtk0cuizUGPOW1t5Hu/X3UX0LajIALDBkzDrVzYhBaP2xHOA/yQpJHUNDJaz6g+HKvQCgjntdMxOsNo48zbMFCfLSnN4X68N7GANJUGqR6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KhFGUDGWAhFZXBWqxTDpNATfVoPzi4YVAoxXGOzOplE=;
 b=U9KHnlEDVnwTt6Ri0H6YcyegZJYz1fmSzbBVhymYA8T15w7cC16v/UTBZa0opcZQxc+L2NtETtga4/stImeOMZ673kUa0r+VZ5n2hAKXk0SFAmHVXh2OWExNn8xKT95kw3seEpMyVZuDssCFiueE4L2eXI953lOkznVAlkdzppg=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS8PR08MB6245.eurprd08.prod.outlook.com (2603:10a6:20b:293::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.23; Wed, 18 Oct
 2023 08:28:12 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 08:28:12 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [oe] [PATCH 1/2] linuxptp: Drop unneeded downstream patches
Thread-Topic: [oe] [PATCH 1/2] linuxptp: Drop unneeded downstream patches
Thread-Index: AQHaAX00WZLIg4SeS0m0RqZrOVQJ6rBPNwiA
Date: Wed, 18 Oct 2023 08:28:12 +0000
Message-ID: <D7089C8D-0718-4F03-BC26-55F47C1732A3@arm.com>
References: <20231017133214.1562048-1-luca.fancellu@arm.com>
 <20231017133214.1562048-2-luca.fancellu@arm.com>
 <CAMKF1spNBkb9jwMjA2F_w36=djB4Bi44qjZed4NCt3k5E_Yd8A@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spNBkb9jwMjA2F_w36=djB4Bi44qjZed4NCt3k5E_Yd8A@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|AS8PR08MB6245:EE_|DBAEUR03FT027:EE_|DU0PR08MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ca9114a-86e0-4d64-6c0e-08dbcfb430f0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 o85mX85hkhd1QiPZLT49aJKV+kXLwYQe/LNTJyvMS4reBD3wf3kw0t+BjS2PzrkGUDLKenkB/lngL+ZoMKTDCbb0VS/f8HJRzIWqhmgGpUKX1d1MCI+IWNqjmZP/DMssZKp51hCqNJvgSS89VBEw/NBbNtd00cD9odoHOLok7D9pygZ+Xoq2nuuLAR9ROaGcASCOc4kbneltvRb2CrLnJ43wOmsMXK9PCJpwIfCLiHprK8maRajsGOZ6A3/iUlVRlnYms6d0IACnlYj+hvild9pVBgOuV5IuyljnSr85brSopHuaNgC0M+BDL1Y2RdH3jeqTFF2sf1/pQ5CdJyqvB7L6LZ9MYa0oyvZ7hCnpQRrYU3+Y4UUVKk1fbGzG598cjuki3zrwrBPqgGkc+ZgT4U0enBerGRkO8jopEcG3TCyEfYaPtgOMoaHeV6FIUo3rmPVhLCq1ofFMD2o8+Y93S2c3Fi9cRkrfzJObRCvGdSyLd2l1y2NBZHSSCK5mJlpw3F3yO9vm2FCGvwDZ8pGacTh/m5F+LiH+XiukERRnzYzHivHlKCzO+Rllzqui8EVkkCqRmXPPfBYvlivg+eV0AtiYUaEcJRWAYPzvU4F8KvjFZYkXIsFT0uxJ2qyrQEridUsmdSCZx5RU1jTj8tAB0Q==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(4326008)(316002)(6916009)(26005)(53546011)(2616005)(5660300002)(8936002)(8676002)(66556008)(71200400001)(64756008)(66946007)(66446008)(66476007)(76116006)(91956017)(54906003)(6512007)(2906002)(41300700001)(86362001)(83380400001)(6506007)(966005)(6486002)(33656002)(478600001)(558084003)(36756003)(38100700002)(38070700005)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <94EEE72A493AF84396C41C4B8D7038D4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6245
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	56d29e81-0e54-4fd0-9d76-08dbcfb42ac8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	U2Xn7EPAizJryG60LHdyrExZP6bqhV2RUJFnJqTTPv9tB+Qn2toBsNbtezckGZB5XirfMPHXC81+EEK0gEw1/dTJFBihL2bt2i+H4dftXr9acEbU4MXSuD5M0gyhmjvhlojowho+pT9ilxBxCTbCEvmJz8y4enNGbkJVE+wGLuqhEP4QEHSsQixz1+5EQTkZpGXK55jgkqj8YwXKwebHuv5bk+tu9jkGa88y17otjOvI65FNPvsx1GhaM8uZZs1D6m6ywb7j+wQyWOonQ/2uQm5o9Yg9biYWTDHllraIO327qyu90CDXJHytq7gyMSSZSZexD38l4J8+AelvWeDTF/P7dssa0vX/7ugL331H4l6VN81IR1rAUWDdjf2RFwRs5IYMzQKR8qP14k4didEVTCVrb0lqCI3YDqddNIyj5u9Aj635CoRVKQ7sQP0In0cDef3lT6YBoCQRDA3dX+c42PJrLU/TTYstzuIAFdHLbj+Qm4umqva1mun4vRV3F/Wgz4X3uTLvWpAKq21BEDp2UE2kIMRQDCIMFKMgbPfss3apSjdDaqbG0uB2rJs3uQasvxb3q6UuMH3Aag9hWHoB9v1k+OpCTQ9hgxjbWlQbV3bhevFx6MNcaz4KY1f79IRTffKUp5MZ9oWUcZENthLmiydlP78rjW2zgaSo1ygFcuELc1+ig+SlnqobQS47CNE13n2buHgU3+S/sADuxjmz/jI0AcWp0Bdfvz3PtDBY9vs=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799009)(82310400011)(186009)(36840700001)(40470700004)(46966006)(26005)(40460700003)(2616005)(6506007)(8676002)(8936002)(966005)(53546011)(47076005)(336012)(6512007)(83380400001)(5660300002)(41300700001)(6862004)(4326008)(2906002)(6486002)(478600001)(316002)(70206006)(54906003)(356005)(81166007)(82740400003)(70586007)(36860700001)(558084003)(33656002)(36756003)(40480700001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 08:28:22.5026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ca9114a-86e0-4d64-6c0e-08dbcfb430f0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8731
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 08:28:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105565

DQoNCj4gT24gMTggT2N0IDIwMjMsIGF0IDA1OjQwLCBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPiB3cm90ZToNCj4gDQo+IFNlZWluZyBhIGJ1aWxkIGZhaWx1cmUgLSBodHRwczovL2Vycm9y
cy55b2N0b3Byb2plY3Qub3JnL0Vycm9ycy9EZXRhaWxzLzczOTk1OS8NCg0KSGkgS2hlbSwNCg0K
VGhhbmtzIEnigJlsbCBpbnZlc3RpZ2F0ZSBvbiB0aGVtIGFuZCBJ4oCZbGwgbGV0IHlvdQlrbm93
Lg0KDQoNCg==

