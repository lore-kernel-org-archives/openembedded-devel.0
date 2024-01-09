Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2D69C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 13:12:40 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.68])
 by mx.groups.io with SMTP id smtpd.web11.16334.1704805957966408468
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 05:12:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=p6OEexcC;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=p6OEexcC;
 spf=pass (domain: arm.com, ip: 40.107.22.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=dN8VhTjJjsIs6mVdXHE1CcAXnWCYjjseogLd93vQw1KlE9OVKafoNLrXLafkjMvh9r32rLyBj5b4MbvDCRgpG6hx/TU9vGHvs8dOisTDjomc5fOOVoMVvM005yiC1kWJPFSjl3AP8xjxd+k3a26HWKzB0T9fBJZbOaljgrusK1Hwsch18KiUzbRjDXDA795jJvDs0O4FHGSXEHnM6JVRthOiHerHnWp/N3UHR7GzWDxGwABL8m71fn1sLbL2zlQ1VXNEzzOheALYQ501PJJueitho9McpyxBPQ0zGDq2hEmnMKqu9JCjmrnZFqmknLucePlkUmMZi/IkFGixMnBlOg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a72nQza52OXqRqgrgCL/4zaqDpyJXgukxCgYZQJbwHo=;
 b=Slk9MBHfH7gWSCRvIFjPAbksdQ8y5NHtHQGF7f5L2yeOzzDYkFlNefPmXKjuYA27R/AAtQMtPfNpmsHCqXr+HqUkGVBMXwZRDv8m2OihMram8jPWWlZxHZ9Rn2VXGUXBKoorXvAEAXI2Q0V+fQYLOksfA3ODIHcSXeYI2icOOh/vHE5IQUrDQRC1hrHPAqcVCtsxATYIXvwxWmaKmnXKS9c2fnw7j0/EzzMP9+MgnnV6qNO+luBEdFMsmohLg4XSd/miowHkwrUEm+9W1CYA4gA25XzWFDQgA7zAJq867xXi7WEhKlFUtIVcOHqFyNoRf27bSY/1EUvTa5Wkg6MHQg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a72nQza52OXqRqgrgCL/4zaqDpyJXgukxCgYZQJbwHo=;
 b=p6OEexcCgEYTNdMSU/zDSuutYvfVseWW2h+uReYToUnhx+d+LJkoFKv2C4dJO6CtLagNFiAAq7aoCjAaqFFvluwYNr1Z6gIENYv1jAWFR8uRRNQ179GmZI7q4KKejeRM0p2k9WjlxWJEO2q9WVS29N8liIozHQNAzLpBXuIXOq8=
Received: from AM0PR02CA0008.eurprd02.prod.outlook.com (2603:10a6:208:3e::21)
 by VI1PR08MB10148.eurprd08.prod.outlook.com (2603:10a6:800:1bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 13:12:33 +0000
Received: from AM3PEPF0000A79C.eurprd04.prod.outlook.com
 (2603:10a6:208:3e:cafe::34) by AM0PR02CA0008.outlook.office365.com
 (2603:10a6:208:3e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23 via Frontend
 Transport; Tue, 9 Jan 2024 13:12:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF0000A79C.mail.protection.outlook.com (10.167.16.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7181.14 via Frontend Transport; Tue, 9 Jan 2024 13:12:32 +0000
Received: ("Tessian outbound 53c3c09c1e1b:v239"); Tue, 09 Jan 2024 13:12:32 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 59b92ff05513f5dc
X-CR-MTA-TID: 64aa7808
Received: from b61443ce9fc9.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 4055BE8A-A770-414A-9E79-4DFAE6E8C6A1.1;
	Tue, 09 Jan 2024 13:12:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b61443ce9fc9.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 09 Jan 2024 13:12:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PXCbQ8nQa4p/UCYPIMzwu52+R/9W3QpsaFkQyuquCZkDh2zhtZVtH0cEGAYS8NGoITt6X1o/pp/6X3OXpAx6COEc53lxuHjYJQK0Eu0boXmEdNonoBj8dYMVbBJ3zaG7ZLaKHF1vc56TS9XIK5OSl1xBb4uY3cOfAYlRsMKZ3bSY+mjIJOKA7e4TmQpIbREszOttY9RMPf/FfFpa+rsdfX+MeHMPzyooC1ShHIsDMArVCaRpx4P8CKw0cdTbnqlXF63gGgxZz1mDN6QgxQg6x5JqX/2Y8IMM21p4f+TGl/Oqk7U+7gZzgUyyCPNhBjIQQEOqqqE8ekT4BI9cwbU4RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a72nQza52OXqRqgrgCL/4zaqDpyJXgukxCgYZQJbwHo=;
 b=lGMcPXOWO1FKa8xfTL3Nv2bm9RcgOBYbFy8KqUA7LGogpiilJLxW4mW798XYqXUYgUYTvEegrARhNiwSkuPAalDm8GHbvGrj3QX2MGSWQem7JOvhoJG9OzxBn1UjknPtW7J7fP5VTsFmeQ+MLesnmmTgOO5mCQQWoM4Ni1zxs5vlz6N2kNkJvjYl1GQRTJuIflK/Jl/kOMVVKRTPr5B3nTjeUk9e4f8DEIcYrThLZjZKJlLuqZk7rgQtFVgPb1jL+MjSuoO/c8Gn+ouOhf9Swk4vfT6t+xE5DqObFnoHGVTGBJizbIe0/f6wNU/vzQ3be1G5EAuXwN5Yt623KiVg1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a72nQza52OXqRqgrgCL/4zaqDpyJXgukxCgYZQJbwHo=;
 b=p6OEexcCgEYTNdMSU/zDSuutYvfVseWW2h+uReYToUnhx+d+LJkoFKv2C4dJO6CtLagNFiAAq7aoCjAaqFFvluwYNr1Z6gIENYv1jAWFR8uRRNQ179GmZI7q4KKejeRM0p2k9WjlxWJEO2q9WVS29N8liIozHQNAzLpBXuIXOq8=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10667.eurprd08.prod.outlook.com (2603:10a6:150:15a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Tue, 9 Jan
 2024 13:12:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7159.020; Tue, 9 Jan 2024
 13:12:21 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Alper Ak <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
Thread-Topic: [oe] [meta-oe][PATCHv3] wavpack: upgrade 5.1.0 -> 5.6.0
Thread-Index: AQHaQl3+pivTG6bJuEGaFvrP4Ie87bDRWh+AgAAatICAAAFagA==
Date: Tue, 9 Jan 2024 13:12:21 +0000
Message-ID: <5F728096-A476-4819-B943-2F07EA02271E@arm.com>
References: <20240108181014.321844-1-alperyasinak1@gmail.com>
 <593B95CF-FB18-4AF4-997C-C1263BB0CF4D@arm.com>
 <CAGpma=6tqLfMV_swJaupYfXdQ=tsbD1PvYete+PHq-GY4sscSA@mail.gmail.com>
In-Reply-To: 
 <CAGpma=6tqLfMV_swJaupYfXdQ=tsbD1PvYete+PHq-GY4sscSA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10667:EE_|AM3PEPF0000A79C:EE_|VI1PR08MB10148:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b2dc5b0-bf64-4b9f-2cba-08dc1114a3ea
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 bc3JeiiKcfHelzt63nv0loknpjEVa1ZL0fWVitQrzuK0pSCnxxlqGlAQkN6LYZK74j321+kuQ6+y4+ltuZAMGN+ZKRH6i2sG1qhZ6yyppXXR6LcFuy14/lzwbHO8I7u0pqqfqMOLc6/eJHJMj3x44xzimEdfCa5ui+E5uARhY3cL7C4X8JjmBABQBxb0+AlvAWR3jIrrYjzM+qKaf8RJpb6DmlHDo5N4/yGbY6YewHcajnr+e86BoCnR+eSxRDuchINz227lLpFFNWkpm1lpRDkQiSLZ3qLEYD7qlUDuDDiI+JFqWmqkA3QjxzUQiuWGLTao/6DVV/QoJJImJZZf88f5AHTmwW7JFPBmo7GzrKluzm2Mbp0hCeHU/GkpAmj5Xtdgax+sXDvWT6ylf67bwSgMLYScNH/SP72tU4kPDahe/xDVJ7pLuYyhtdWyFzGskvlSqfCCW3F8/vw9AsuFLmw1ZTqpSA5y8RCRjSfGv+iDoSiIN92lmdbEwSk93Td11XwPkqY0L2Z9sBD/GSqBgdSTMbOlSb/0OAegVMnlWCs31IemVzZX6ILltPbBL5/XXNmY+KEo989+c1DkezL/ph5VXs/MQa0lK+2a9uj9eOfgyO4rIDdonpmnf5GTQe0HUKkrdTRbMeCBPKNVgQHNSA==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(366004)(396003)(136003)(376002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(66946007)(41300700001)(91956017)(76116006)(33656002)(36756003)(86362001)(38070700009)(38100700002)(122000001)(26005)(2616005)(6506007)(6512007)(53546011)(6486002)(2906002)(66556008)(66476007)(66446008)(64756008)(6916009)(316002)(478600001)(71200400001)(8676002)(8936002)(4326008)(4744005)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <48FB28339448074591BAA4B2ADDD90A5@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10667
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	996dc3f1-6eeb-4073-1e52-08dc11149d5b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KmRuzFBrqyFXDMMMhzsZH4ev2PsasGa8+gAMAZt7x6k1Ldfr1rMw6SfNxkYsvDoQIbvwGsU41cBrmHnn0WvBW8SXBClRUh9DdYUvPkRjmGJaZNqaqcsHYY9TASRLE+jtr2XCoD+pTQZPmdsiPVS0NOTvBc1huWlqkRGFDgvlALotaGn9+owfshGs7NRaxepsbmdiN3W8aXdk6c+2mZ88bpSqi9caMiqyVjSZ/jwWF8yOldjXVAzWq43jjtBxgVvxYYnGMvpJNvbuOGybuHwRQTpLDWiS49M5I+70mHHyIUZEIpG4k93xj1l0RLQaw4ciC/naWyCXLSZ6HQw2GqvjngINOXBj1+Mkc5FB+IVSCuazBShOIzNtDs5KYuBk3WgLPoAITXtzfRlJzP8x69pZIqsS7gHui0psG+EBlIIrYKJZntQ9N6KYUacw0YfaFrm9eenOyR2ER/lZg+j0vhEob+ps3wlNUJcNFLNK9PCfgKviaYZr5IgCCd5GPwgJuQRAF/4J3U8tdp/Pcl0JNPSiiapvq0dZ+LI6KzjkENoFny8s0Y2wy9uk/FL9FEIaNJ/sHhcStfq8qjSrg1n4imSmrT+H/pE1PYHWQF76fW0X6wPVOYpLuc9YwuhmRIECs1XeFYlpHz1Ml0t599Q1jxrXwg9yFWMgriMjNyDDM6IprAPDeVc51LB0T395VcoKzj7OxWyOLcdj5EyHM5KUUt6YUQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39850400004)(396003)(376002)(346002)(136003)(230922051799003)(186009)(82310400011)(64100799003)(1800799012)(451199024)(36840700001)(46966006)(336012)(6512007)(26005)(53546011)(6506007)(2616005)(36860700001)(82740400003)(5660300002)(6862004)(4326008)(4744005)(41300700001)(2906002)(6486002)(478600001)(316002)(8676002)(8936002)(70206006)(70586007)(47076005)(86362001)(36756003)(33656002)(356005)(81166007)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2024 13:12:32.3693
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2dc5b0-bf64-4b9f-2cba-08dc1114a3ea
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A79C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10148
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 13:12:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108189

T24gOSBKYW4gMjAyNCwgYXQgMTM6MDcsIEFscGVyIEFrIDxhbHBlcnlhc2luYWsxQGdtYWlsLmNv
bT4gd3JvdGU6DQo+IEkgdGhvdWdodCB0aGVyZSBzaG91bGQgYmUgbm8gbWFucGFnZXMgaW4gdGFy
Z2V0IHNvIHJlbW92ZWQgd2l0aCBjbWFrZSBvcHRpb24uIEkgZ3Vlc3MsIEkgc2hvdWxkIGhhdmUg
Y3JlYXRlZCBwYWNrYWdlY29uZmlncyBmb3IgYm90aCAibWFucGFnZXMiIGFuZCAic2hhcmVkIGxp
YiIgb3B0aW9ucyBhbmQgZW5hYmxlIG9ubHkgc2hhcmVkIGxpYiBpbiBiYi4gSWYgcGVvcGxlIGRv
bid0IHdhbnQgdG8gdXNlIHNoYXJlZCBsaWIgb3Igd2FudCB0byBhZGQgbWFucGFnZXMsIGl0IGNh
biBiZSBhZGRlZCBmcm9tIGJiYXBwZW5kLg0KDQpJZiB0aGUgbWFucGFnZXMgYXJlIHRyaXZpYWwg
dG8gYnVpbGQgb3IgcHJlZ2VuZXJhdGVkLCB0aGVuIGp1c3QgYWx3YXlzIGluc3RhbGwgdGhlbSBh
bmQgbGV0IHRoZSBwYWNrYWdpbmcgZG8gaXRzIHRoaW5nIChwdXQgdGhlbSBpbnRvIC1kb2Mgc28g
dGhleeKAmXJlIG5vdCBpbnN0YWxsZWQgYnkgZGVmYXVsdCwgYnV0IHRoZXJlIGlmIG5lZWRlZCku
DQoNCldlIG9ubHkgbmVlZCBQQUNLQUdFQ09ORklHcyBmb3IgdGhpbmdzIGxpa2UgZnVsbCBBUEkg
ZG9jdW1lbnRhdGlvbiB0aGF0IHRha2VzIGZpdmUgbWludXRlcyB0byBidWlsZCBhbmQgbW9yZSBi
dWlsZCBkZXBlbmRlbmNpZXMuDQoNClJvc3M=

