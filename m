Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC82C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 11:32:20 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (EUR03-AM7-obe.outbound.protection.outlook.com [40.107.105.89])
 by mx.groups.io with SMTP id smtpd.web11.14513.1704799932531522787
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 03:32:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2a+X/hA4;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2a+X/hA4;
 spf=pass (domain: arm.com, ip: 40.107.105.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=GF8WVExWDUayiimbzAmy79Up9w+BsvDkOwec0Bwk9I8zu6eH/S3L8A28lA4C5lfbt6TDRviO7qUtv12/nzveIHz61vGYnaH5WwL4wOy4IRg3bu74icmHDvuuMbFrnPaAqo8e4u/Y/9br22aA0R9huv0dnBycgKh1XiGhIiwLSPFGiYUvVwCITQcbq8oYxIdEBf9Z5fyMetUBtml9bLXBaEbtjBssrdeRzXVjl9UUik3UWtiCiSi8KV7qIf2Hllwlk9P9GQqDVaSjTKdSqQmLE96AQQYDkIuW7cKEOEFLM86RtMz0PaPWZIgeK9QH9PDhqW5Drj2+tUn6OA8jQIbBrQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzd/gW6OT94Y8LGyswvXEdNmHBNzxUc7EBtUEacjdKo=;
 b=iuHeSEKTP6PCuZJi7uznLj+OzptjVROo51Gpz5F4fapeiL/Ab8NQp0wtLVcx5vgS1AAkBVpS6qYlRna7upbRAxxxp8+HeCFhzVSsjzYzdLgEppORS5YdHnH4/fYzvTZ03uyg16ph8WI2tRqumCwA5U+8LNzhr/fdBrgL5zG2Uxa9QDvfx9gdyoWdEGGWvspBfz1DpJiDRuQ1ajGMZfwe2GOM8+R/sarHMg036n1aS1Q2lqbgYr4NNlBgOjKwDr2DyGwuk6T7c/9Ck7HWD0qtbrtKQahshHb8MJYuy/U5rAuSmOr8E0T03rjPaQSzxOBmDMeYAdN5MzJUUOHRCAz3eg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzd/gW6OT94Y8LGyswvXEdNmHBNzxUc7EBtUEacjdKo=;
 b=2a+X/hA4wUwkwybi6DRho/bKuHDkhXeLJipFevcoVZAyu6G9LhWpCb/TCnoulzEzUAd/5Rf/i77Ghnw2EfypdKXmc+hDs7pEm3QVVDXqbRR+YbBWvEOrXJEkuYbZlwGh6Jmy8u1qF51En0fVOfz/iFB4dYwXudAhRMvRF/5vs7g=
Received: from DUZPR01CA0002.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::8) by PA4PR08MB5904.eurprd08.prod.outlook.com
 (2603:10a6:102:e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 11:32:08 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:3c3:cafe::aa) by DUZPR01CA0002.outlook.office365.com
 (2603:10a6:10:3c3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21 via Frontend
 Transport; Tue, 9 Jan 2024 11:32:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.13 via Frontend Transport; Tue, 9 Jan 2024 11:32:06 +0000
Received: ("Tessian outbound 9bee66383d2d:v239"); Tue, 09 Jan 2024 11:32:06 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 70023282b018718a
X-CR-MTA-TID: 64aa7808
Received: from 401757c00845.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 42052A9A-2DC2-450E-A134-D9A503DBCFC7.1;
	Tue, 09 Jan 2024 11:31:59 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 401757c00845.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jan 2024 11:31:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyHWpDXQdMNEPtj30egoQY2Fw8U6XvtHDZAfC5PyosNt6xNnbBVg2PMrLaQeiBgn/fFwi++Vx2qldpPLkqNmyhgzaUnUk9vPqPXfH+lPfqi26jidOgSyTDV9/O8CBZYo3ZPDCGJxxkjZgM3McsSFuvFycsaHGHmgJeexHaLnj3k2qrnXYkrhEsozr/uMNqT+//9mWdqsUL4eI7gjgWkei2OpZzEDdeMNmdrU2Kc1qERxpHa0gN1TCBnwnEhqm+9z34Het3ppqPB+rS9zw0JjOxc8r+J6I1ksgZcoEPoj5h5NUCLY9Lc7jqofEC0FUOgAoHYcPDvZr8SOI1QZC6mvsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nzd/gW6OT94Y8LGyswvXEdNmHBNzxUc7EBtUEacjdKo=;
 b=HZn4+v7xlo6ooeihDASCaK4uC1SsNJzLMKPFE0aXvQY4kj+3QZbP1l+0B4M7R7TqDZuRrD9wDWjbQ2ZGFkyVaiszeKIKlkQqiXsX67tNWoP6aCEcfFYic32yx8oGIVfLPNNvAxD6u32zaEgfm7dh+pnfgD3d5NEOh3bj3RQn/cU+4eQKdkniQrTwpb+NdrlwpuRRrest0GWldFhqw02QtpAQcs7utDR22eAJIGe+H4BsgR6zE2jEus0CEL2gU/RKbwN1heQ+gAmKPk4yFYZTOv8s0x+RZW+Qx8nt/2t3oSxiIc84cu/F+vrJyKcN7ZAnmW9ZIbKCWRcGvnphHu53vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nzd/gW6OT94Y8LGyswvXEdNmHBNzxUc7EBtUEacjdKo=;
 b=2a+X/hA4wUwkwybi6DRho/bKuHDkhXeLJipFevcoVZAyu6G9LhWpCb/TCnoulzEzUAd/5Rf/i77Ghnw2EfypdKXmc+hDs7pEm3QVVDXqbRR+YbBWvEOrXJEkuYbZlwGh6Jmy8u1qF51En0fVOfz/iFB4dYwXudAhRMvRF/5vs7g=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8950.eurprd08.prod.outlook.com (2603:10a6:20b:5f9::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 11:31:57 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 11:31:57 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
Thread-Topic: [oe] [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
Thread-Index: AQHaQl3+pivTG6bJuEGaFvrP4Ie87bDRWh+A
Date: Tue, 9 Jan 2024 11:31:57 +0000
Message-ID: <593B95CF-FB18-4AF4-997C-C1263BB0CF4D@arm.com>
References: <20240108181014.321844-1-alperyasinak1@gmail.com>
In-Reply-To: <20240108181014.321844-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8950:EE_|DU6PEPF0000952A:EE_|PA4PR08MB5904:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fb27c10-2e80-4ec2-0bdf-08dc11069c54
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 YklDbHkxthazc1Dxk5m2gSMBs3MWDUwJtT9/2F///nDMJLKGEIguNGacc4v4MwAagD633CSZPj5+TPtxIyuiKgCGbzdZ936eSNBH7SpWP9vFEKWVsG5nFrOXMWcuHyUDnyldgOy+lPswkAEeBV/d6BUFiSOpHesqffrLQ5en8L3B6riHa2v8x56peiPyEJKoVl5aiJTD68y7zDpDZIVf1MWo8Yqy0oYHhOVWVxpXe4zK+mvpMj1V0VAqhjOtJmW1dmGusfQW65DHmkt6QK3znO/LNbL0kloOCLyzfhn8P3the/jDBnMn48+7dpVAxW3hNY7irHfWjqXFoLmhgefJUMZiBVnHfI9w7dINDYGQGH7Bc3WoklcowqroVVimvFIVaQudhQWoNfps2rl4aFOnDSLT8/si2/EE9J27JOd0ZxIFCdEwYkYpnAcQFz9gmhCpKG8DFqubUuE3tLU0z2TdPtYlbs2G1c3bfg7fAzJzxsCDvssRLSAClHhEIEAQJsWPWw2Gkdy1dtqylJRoIptw73XPScg1FXiQ+Eri5ZG3UbsGPTgr9bcq6b2yXoaerZWx0gGlkTgm01iKoylXSGb7IBwSjF4aQd80ut0QWbP9No+FQLpEwNe7lPTIrLszlx9CbVxRjpysSrRWi7/xwtPg6A==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(366004)(39860400002)(346002)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66446008)(64756008)(66476007)(66556008)(4326008)(91956017)(26005)(2616005)(478600001)(76116006)(66946007)(6916009)(33656002)(41300700001)(8676002)(8936002)(71200400001)(6506007)(5660300002)(53546011)(316002)(6512007)(6486002)(122000001)(83380400001)(38100700002)(2906002)(36756003)(86362001)(38070700009)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <227FF66715D4FE4D9BD6CAA7DCF01DB7@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8950
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7f8e4d41-0ab4-4f71-8dd2-08dc110696ae
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7RNx/kHGjlTAWk2rB7iXrorE3h4EMPsuu52nvHdtQNeUnR1V5vdi/4ouvpMtOyhVzx7zGuZtUnw1xHmnAlW4qPMEz5jQsro6umIeqa03ea4WT9fiBNwEwjMF7SzinsH6vDlJZzjl/swaxpwrk9pz3h7UX90X4Giz53A6lUqvxXfSShVxtDwGivhG7td6q9vjxX1Q7h/zeXxG0G0Jw5ObtHARiFyj0L5IMs99V+6eRSB9GNDk4QDZFlrVMa/x9PZ5YqCJiHC4sd57iNZZgQacWcNHxhOONh2W1+elxdXGzSVO2QcALmkIJ4ggbWr4ajoMg0n/YDkP5ZqOxi8LSQKO2quieH0gojFqD2GxERh3cgHKPnkgL7FHsgTtiea0OmJbDJetCyb21dzCPwVlv/6x+a243QOfTV1D7gQIljlEJe+t9nu4ONr5Ros/rIbRseGqREwESeF5nmNx7FkXEwCM1ySBDSN0iY+WtFRWLkm3A42fQgMF6zjYKaWTiQB75ZL/Vgk2hErSmOD3xSHrBX5zTsqBnDdDq9w3aYOR8FtuvoK4lhH9mFTni48Eagw2izH5j9E55uTr1AEcnL64+nL11U86U9LkwBCqqX/5qOYug3h2Rq2gWORwPHFegXD3/XDV/kpBD20I1ZVsMPYG5j/EAyocGUgBIhRv5Rk2JNPwGPD89h2Y9GtJHrzfxiGEwno4STB1t5fGSKkx0AljBkUan3NGlry7zH0/5OvyIlL9eYebFiC4dDGhObrDs2HiBHae
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(40470700004)(36840700001)(46966006)(5660300002)(2906002)(33656002)(36756003)(86362001)(356005)(81166007)(478600001)(6486002)(53546011)(83380400001)(2616005)(336012)(6512007)(6506007)(26005)(36860700001)(82740400003)(47076005)(316002)(6862004)(8936002)(8676002)(41300700001)(4326008)(70206006)(70586007)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 11:32:06.9841
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fb27c10-2e80-4ec2-0bdf-08dc11069c54
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB5904
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 11:32:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108186

DQoNCj4gT24gOCBKYW4gMjAyNCwgYXQgMTg6MTAsIEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxhbHBlcnlhc2luYWsxPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IC1pbmhlcml0IGF1dG90b29scyBsaWJfcGFja2FnZQ0KDQpZb3UgcmVt
b3ZlZCBsaWJfcGFja2FnZSwgd2hpY2ggd2lsbCBjaGFuZ2UgdGhlIHBhY2thZ2luZy4gIEFsd2F5
cyByZW1lbWJlciB0byBjaGVjayB0aGUgcGFja2FnaW5nIG9ubHkgY2hhbmdlcyBpbiB3YXlzIHlv
dSBleHBlY3QgKGJ1aWxkaGlzdG9yeS1kaWZmIGlzIHZlcnkgdXNlZnVsIGZvciB0aGlzKToNCg0K
cGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvd2F2cGFjazogUEFDS0FHRVM6IHJlbW92ZWQg
IndhdnBhY2stYmlu4oCdDQoNClRoaXMgaXMgYmVjYXVzZSB5b3UgcmVtb3ZlZCBsaWJfcGFja2Fn
ZSwgd2hpY2ggYWRkcyB0aGF0IHBhY2thZ2UuICBUaGlzIGNsYXNzIHB1bGxzICR7YmluZGlyfSBp
bnRvICR7UE59LWJpbiwgc28gdGhlIG1haW4gcGFja2FnZSBpcyBfanVzdF8gdGhlIGxpYnJhcnku
ICBPZiBjb3Vyc2UgdGhlcmUgbWF5IGJlIG5vIGJpbmFyaWVzIGluIGJpbmRpciBzbyBpdCBjb3Vs
ZCBoYXZlIGJlZW4gYSByZWR1bmRhbnQgaW5oZXJpdC4NCg0KcGFja2FnZXMvY29ydGV4YTU3LXBv
a3ktbGludXgvd2F2cGFjay93YXZwYWNrOiBQS0cgY2hhbmdlZCBmcm9tIGxpYndhdnBhY2sxIHRv
IHdhdnBhY2sgW2RlZmF1bHRdIC0gbWF5IGluZGljYXRlIGRlYmlhbiByZW5hbWluZyBmYWlsdXJl
DQoNClRoaXMgaXMgd2hhdCBoYXBwZW5zIHdoZW4gdGhlIGJhc2UgcGFja2FnZSB1c2VkIHRvIGp1
c3QgY29udGFpbiBhIGxpYnJhcnkgKHNvIGl0IGdldHMgcmVuYW1lZCB0byByZWZsZWN0IHRoZSBs
aWJyYXJ5IG5hbWUpIGFuZCBub3cgZG9lc27igJl0LCBzbyBjYW7igJl0IGJlIHJlbmFtZWQuIFRo
aXMgc3VnZ2VzdHMgdGhhdCBpdCB3YXMgbm90IGEgcmVkdW5kYW50IGluaGVyaXQgYWZ0ZXIgYWxs
Lg0KDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9reS1saW51eC93YXZwYWNrL3dhdnBhY2s6IEZJTEVM
SVNUOiByZW1vdmVkICIvdXNyL2xpYi9saWJ3YXZwYWNrLnNvLjEuMi4wIiwgYWRkZWQgIi91c3Iv
YmluL3dhdnBhY2sgL3Vzci9iaW4vd3ZnYWluIC91c3IvbGliL2xpYndhdnBhY2suc28uMS4yLjUg
L3Vzci9iaW4vd3Z1bnBhY2sgL3Vzci9iaW4vd3Z0YWfigJ0NCg0KSGVyZSB3ZSBjYW4gc2VlIC5z
by4xLjIuMCBiZWluZyByZXBsYWNlZCB3aXRoIC5zby4xLjIuNSB3aGljaCBpcyBleHBlY3RlZCwg
YnV0IGFsc28gJHtiaW5kaXJ9IGJlaW5nIGFkZGVkIGFzIHRoZSAtYmluIHBhY2thZ2Ugbm8gbG9u
Z2VyIGV4aXN0cy4gIFRoaXMgaXMgd3JvbmcgYW5kIGxpYl9wYWNrYWdlIHNob3VsZCBiZSBpbmhl
cml0ZWQuDQoNCnBhY2thZ2VzL2NvcnRleGE1Ny1wb2t5LWxpbnV4L3dhdnBhY2svd2F2cGFjay1k
ZXY6IFJSRUNPTU1FTkRTOiBhZGRlZCAib3BlbnNzbC1kZXbigJ0NCg0KVGhpcyBpcyBleHBlY3Rl
ZCBhcyB5b3UgZGVwZW5kIG9uIG9wZW5zc2wgbm93Lg0KDQpwYWNrYWdlcy9jb3J0ZXhhNTctcG9r
eS1saW51eC93YXZwYWNrL3dhdnBhY2stZG9jOiBGSUxFTElTVDogcmVtb3ZlZCBhbGwgaXRlbXMg
Ii91c3Ivc2hhcmUvbWFuL21hbjEvd2F2cGFjay4xIC91c3Ivc2hhcmUvbWFuL21hbjEvd3Z1bnBh
Y2suMSAvdXNyL3NoYXJlL21hbi9tYW4xL3d2dGFnLjEgL3Vzci9zaGFyZS9tYW4vbWFuMS93dmdh
aW4uMeKAnQ0KcGFja2FnZXMvY29ydGV4YTU3LXBva3ktbGludXgvd2F2cGFjay93YXZwYWNrLWRv
YzogUEtHU0laRSBjaGFuZ2VkIGZyb20gMjU1MjIgdG8gMCAoLTEwMCUpDQoNCk1hbnBhZ2VzIGRp
c2FwcGVhcmVkIHRvby4gIERvIHRoZXkgbmVlZCB0byBiZSBlbmFibGVkLCBvciB3ZXJlIHRoZXkg
cmVtb3ZlZD8NCg0KUm9zcw==

