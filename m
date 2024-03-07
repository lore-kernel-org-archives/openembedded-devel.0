Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CF0C54798
	for <webhook@archiver.kernel.org>; Thu,  7 Mar 2024 22:40:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web11.7318.1709851231905126961
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Mar 2024 14:40:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RUDx63NE;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=RUDx63NE;
 spf=pass (domain: arm.com, ip: 40.107.7.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IAIDp7Jfcqv0kK3OD6eaHwDsriaFqaxqo6/2NULNRPrPEHIiCxbxIShst2Ge/80QnhmHBx05Y9O7J9B/Zlj9W6smBCl/9CrnoVV94TiTQ9k+hzGuM7wSYE6SUmi1VQjRpfhC8Q+hQJOwfYeB7/rGny+Ki7L3yE3CnDpvAKxFDkf0j12AG7wn8jG9awMcjwpZuVHd2O5evHJdRFbB6sPcsjeG/ql4dY5nyt1+VWK0OJEPpu2Uqj6Phk2XG5pwE2CPJ3fPIYHBsmxXz/8g6xl+bAzpcXq2RcVKhmDYYmBrRldZB/rx9q1Lk+BMo77ssOAudcRnfqbXd3BQpc1goPAgrw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1ZozvykBxvfrGV5mR4Gw8mAcZ/V1DLGO3RcJP3/a/Y=;
 b=IXwC5QBLV0UOIum1fJOgc8x4Ttwfu6du+vRpPiRG0PIYW0J/1Obo2Ra4RtpaaNaB/ybGp9SynreQF1ts7P2DAhlmcKwJ67JnLC5Yl1yzNT9b5/PqGSgpHmnNhotkR0tJFnMA5EVEPOFECafMpCe96tVOEwJ52ogPDfzz3QEGPnU2Q9ZeeiV4UJ5FOWRDGJx3OTomv1wtAVXVdnM4qjgaVnZz9cN5MTGPJw9DAj38HuHLGKtsvcy0ZaX0h+oX6jsi80bSJL0kM16qckrzsNDbSF0eSsfoMT689VXALxvKNGDhRA5JxGQ8s+a0hHhA2ULpwxUmVyt1K4N6JBJKsA4sHg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1ZozvykBxvfrGV5mR4Gw8mAcZ/V1DLGO3RcJP3/a/Y=;
 b=RUDx63NEerhAUY8A2fgeqT6aO4+fzo+yw/azfmieQLINoUHjJjENSRk3nrJNuN2Jr9FRsGuertwHSMmS+c32hG85vw0kVRTNQEqs37zIMRRhIe7kxjYLPWSK9YlPgXCi5dBS2Antp5gWpwHrIzTVILs/b2e8NYJaPp2SRAKh/oo=
Received: from DUZPR01CA0277.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::21) by AM9PR08MB6129.eurprd08.prod.outlook.com
 (2603:10a6:20b:284::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 22:40:28 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:10:4b9:cafe::6d) by DUZPR01CA0277.outlook.office365.com
 (2603:10a6:10:4b9::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26 via Frontend
 Transport; Thu, 7 Mar 2024 22:40:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009526.mail.protection.outlook.com (10.167.8.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Thu, 7 Mar 2024 22:40:27 +0000
Received: ("Tessian outbound 5fdc1e2b2c35:v276"); Thu, 07 Mar 2024 22:40:27 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4511daaee7ee3e77
X-CR-MTA-TID: 64aa7808
Received: from ef96e808dc41.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0704F827-2F41-4463-98DB-04664F4B5C07.1;
	Thu, 07 Mar 2024 22:40:21 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ef96e808dc41.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 07 Mar 2024 22:40:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RK+XWNqn8Ued5M+mAPfL9We5q1jZNBeQxHkgOkYk88BpK8UPb0wLF3Q69ypk8lMVY1m/v0XNPVlcsdColEIogP4n49aZts/PSqdWU3Rs/2FwBkn+q3fLogjCdhGwcx9wnMF2kXsOc4IrHllw8/BRw/aBW9TOV6Nb0BnkDM2lhPQUSE+zyuMX9896wdspuQh+IOErVW3oqM7gBhIQlyhkZiDypHJ5EUqY1Y42xyjocbRblZW+veDd7PYCk30qHCay0ooYjvKM+YlHPSdUiKGuRbCaur1byTHKiXAsTUO/S+DnN1IRDqYH/EPHMB6IVtI5Scdw3m/t54Lnk/L0k5Il1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S1ZozvykBxvfrGV5mR4Gw8mAcZ/V1DLGO3RcJP3/a/Y=;
 b=clCzj9JkuH5nLh2Jnk5Aj+ej+MrclcxvtDIb1zkIwfVd6I5ueiEaMsAkSZtkN96ASVddeoAQTXiSTnriSfF/3fmRCqUATQMNpmzWbxsvL0EzFMuAvfAGcGI1f4kL7fjr2EIfyWJhze/Gr9k1qinfdAmI5NDdv9y66d8vkz6ee4rW7LrmIGlVMkbMIBYlvKxJ38wbixYC8CXoEYG3iJmQFNoK0eAJTjBR8Bs+1zpvDtoYfydFlEc8rqMes+YLmEU3V1AJA8OiQP2Q8FqbG+tx+wrnM8d2hoai/GdETRQHY+vE+XkRKSHqLG/st54OUJcHbBM394V6aoWntF+03YKqbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S1ZozvykBxvfrGV5mR4Gw8mAcZ/V1DLGO3RcJP3/a/Y=;
 b=RUDx63NEerhAUY8A2fgeqT6aO4+fzo+yw/azfmieQLINoUHjJjENSRk3nrJNuN2Jr9FRsGuertwHSMmS+c32hG85vw0kVRTNQEqs37zIMRRhIe7kxjYLPWSK9YlPgXCi5dBS2Antp5gWpwHrIzTVILs/b2e8NYJaPp2SRAKh/oo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAXPR08MB6560.eurprd08.prod.outlook.com (2603:10a6:102:12d::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.27; Thu, 7 Mar
 2024 22:40:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::36de:39f1:4d:5228%5]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 22:40:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "andre.paiusco@gmail.com" <andre.paiusco@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>
Subject: Re: [oe] [PATCH v4] ydotool: Add new package
Thread-Topic: [oe] [PATCH v4] ydotool: Add new package
Thread-Index: AQHacMssOPmiszhCxE6SpQX888WbPbEs3zkA
Date: Thu, 7 Mar 2024 22:40:19 +0000
Message-ID: <BF0ED5F2-9D1F-44AA-843B-048FD6D88683@arm.com>
References: <20240307200746.26808-1-andre.paiusco@gmail.com>
In-Reply-To: <20240307200746.26808-1-andre.paiusco@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.400.31)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAXPR08MB6560:EE_|DU6PEPF00009526:EE_|AM9PR08MB6129:EE_
X-MS-Office365-Filtering-Correlation-Id: 12ee93e7-a4e8-4217-54a6-08dc3ef7963c
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 k9UXBQj8VSbev7ocQa5UjKkStKxormFCpBsU4qNREwHxJJdnySlaRu+Q7ZqIfP99JlPhaVoLdg2k46g7CSt1mXSc2rOw7Yn0vp5JeHpjmNcT5kleq6C/LCIBDa+Hfj7jSIOa7kFb4X4rtWnM2AAOeq3fLe3GVLg0po0CW+/vud6Lt0Sa4OsPGjcFpd1w4V9p1uaxdpHDRwKLMK3GpCYAnHKUiS0ln7zFamnoXr7ALh90qCxRYjnTSdzsqHXBihreVwAe1Tl+HhK04efVxwV0r/oFiHeefIL/5P9v3dnYPtiCdefWibEqmSuB8SSolbObzMcgX0TnY0NyNr/IgRT7MtOyH4VgvBKdYGpJMntGz+hdAyvs2wCESJOiQl2DMsgGUviKw1yulsJMVCNLcW0G1wXoLxNgPd9IZ4E5losTXVKD++T65kpzOUcHqeVjJHlik3U5QlsGiAvt94k6pGQIX9miMOedbYPtgRG6VmaPphnXV191QrCRdtRHICTTrKM4EcctctH933ND8XMIOR4aT+Sq7To1AUfzSABLF0FXQ38nksZW+Opf9aNBBe1LXTodoHTjCxA/LmBQ5OfHPGD1akZZvOWBApU/DxFw4TTKnwly3uWPKuaKHKIajK7GtABfz5AgSmyHZqwbnt8CW11wo81myGhYwNZ8rdEi+KykQGb13bqbKkpkJEast4W+wEEAAGh74u50rlx06BHjO3BPoIuogp6JVi8wqVDpnKWj/vA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(38070700009);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <30DA6D7B26DA5F449F82D657D8FBF144@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6560
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	71e0a136-b726-49dc-1452-08dc3ef79127
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wDhJEJxy/IFaEQWf5qhGQSQpeWs2m1QZYtUsPXAKddOmTAK/2hO69Ut1zWgYvwKdpmqtzNU6nff0EZVIEVpgZeZuGSyhPRydZGOu4X/4FY+7Bukc6RvT9zPyu9ZTD+MedILNZUku43cbOPJY51nqEAAHbDqyB3TzxJA197uAzzYEbM1l+C0fmFU7D22mGnjGMCW0j4H2oY/EDPNyIrnZOCdSm6i3sK3GS/KS6W2aixVJq1wP528sOr/+/YZo9/pkjrQlG4z/mcz5peac5rvb7dmF+oouIqoJA/cI5l2xjeXOBBLqBewbLilF/8zP8XPI0muP+64lZeLU49HcKeOQZkFZnWP6m+wrxVj+MupWYWOZVQGhcicolTcfNQTarx7F01YmW/pEYcMcIH3oL0A3tRqTnJpjkpcJuouQM9GE+INU62eKmDDKREzFyQXfhT41Bf8BtbGVum9ZF1LyftdizF0LLHF63H82n6CA/6KmPaRWGbWchu+dM3LtS0qLoMoSh534Jgfpm7jSI5kid7doRU8DR6TkHLp1Cx7SFgN2uaS1OXYOnhgetnmrH3gybZ/ooN5IR61LBuIf9turslVtectHz1MnZDpKqhblEv1KDlOH/Kcedp7wzBchweFAvlF7HpWySuvbn1jGAAzZixVVBFVFcTNR/JGJugFkhDiEEo/l4IbdKKMEhdTcWzKkxiWEb4uqTbc3QuPKZAeV1Q+vv6auUHESGyrJ3BAB+dGsqXLnXlH272qNMK2XJk+2Hq4N
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 22:40:27.8148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ee93e7-a4e8-4217-54a6-08dc3ef7963c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6129
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Mar 2024 22:40:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109210

T24gNyBNYXIgMjAyNCwgYXQgMjA6MDcsIEFuZHLDqSBQYWl1c2NvIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxhbmRyZS5wYWl1c2NvPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gK0RFUEVORFMgPSAic3lzdGVtZCINCg0KSSBjYW7igJl0IHNlZSB3aGVyZSB0
aGUgaW4gc291cmNlIHRoaXMgaXMgYSBoYXJkIHJlcXVpcmVtZW50PyAgSXQgc2hpcHMgYSBzeXN0
ZW1kIHNlcnZpY2UgZmlsZSwgYnV0IGl0IGNhbiBhbHNvIHNoaXAgYW4gb3BlbnJjIHNlcnZpY2Ug
ZmlsZS4NCg0KUm9zcw0KDQo=

