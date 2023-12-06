Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7775EC4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 12:15:37 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.80])
 by mx.groups.io with SMTP id smtpd.web11.29859.1701864933762134889
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 04:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JI9k2V7o;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=JI9k2V7o;
 spf=pass (domain: arm.com, ip: 40.107.21.80, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=f0O1wvEVF31HmBRQM59uJ1tLnK/thiOSxKQJxWMQJVJsfFigO9PG6R5QU8n73UfMqu0WTh44w4fOcUBaQ43Z41vuL0VjnoIPSXiQNc0t+yLx5v+IGB/eX3sxi65NPI107XUD1PyzlFTtGEa4llASIDJ636rzrmwW/41Z1dIrHcFHZ5vkIi21O7zlxg1SCc/GvrLk8P3xoT2Efk6cVOY1698d3GEehwJTRZlbfbZNwmAtk5xX0QvpUUndxYS0cc6v90WxILXyk7mj8Y6SwiUROMp49/59+Bgfbh7k4ta7zxq8W0UXIvAsGMz9mRQbiHCY/h1+wkbjn61cvjdOhubYeQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gURCK35L2bPhgnJ7+H0B0h/dMtWm7JKW+dY0s6pmlw=;
 b=cACtyXFQa8wcuJFhBmj/MOkhy2s//1YHUnG368IyLQKx4wcNEhZrIRzwlp9WeflhNc3Pvsq4EKoAJhh9cUVVCmsxXqQ2y2EIJhr8dIsYgHeKQoE6ggkdR1loJPsmAd9ztCzDCYOhmVvEK4IX4fab+3HODgvNwvJ+bQX0mDTp7lRYCR6zrzMWPeAVM+4jASggUSusBSAREY/kMVTqcMkYqjyLMw/0fO5o/SXn8JNqjwVgPnqc4Yp9EbklZrym54Wnx5qjCKAUpUdyqtKdk4ooa2QHRBz0dACOMqRKD1dtgjr+gSdKIO9lzgB1To9XeG30H5xvmJbF0z12i1ZQ+4k6xw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gURCK35L2bPhgnJ7+H0B0h/dMtWm7JKW+dY0s6pmlw=;
 b=JI9k2V7ocfkP9/yLeOoevoRJrVnlsmXPaEHj7iMP8Pbbg0xU/JF0h5NtxV4UodcXrfS3x30z1TD1OFFywwRG8jH0FHETkSFYMmmLItoW5p82vh3pYVD8UQU7+LbEJ9KlXXVH0m0wkx27t0L1m/NF68Jj78A/b1RJTR52XcZQPz0=
Received: from DUZP191CA0040.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f8::18)
 by AM8PR08MB6484.eurprd08.prod.outlook.com (2603:10a6:20b:357::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 12:15:29 +0000
Received: from DB1PEPF0003922E.eurprd03.prod.outlook.com
 (2603:10a6:10:4f8:cafe::4e) by DUZP191CA0040.outlook.office365.com
 (2603:10a6:10:4f8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34 via Frontend
 Transport; Wed, 6 Dec 2023 12:15:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB1PEPF0003922E.mail.protection.outlook.com (10.167.8.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.20 via Frontend Transport; Wed, 6 Dec 2023 12:15:29 +0000
Received: ("Tessian outbound 7671e7ddc218:v228"); Wed, 06 Dec 2023 12:15:29 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: c679a0bb1393ddea
X-CR-MTA-TID: 64aa7808
Received: from 27539e9b9061.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 0A76F354-E8C6-40D7-8B4C-8FB1601FD343.1;
	Wed, 06 Dec 2023 12:15:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 27539e9b9061.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 06 Dec 2023 12:15:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QKuEdQHd7waxSj4parlQE64S9TgN4Wmzl8NcVzEvkFlPo8GzrxJf2vsPPLXaZao097j9ic7A2Pyr5JF+KrUUZ0S4kwWw4hWt8CUVuc0HKnSMTh1V+xSrp8ChuOIavXHc8oOVthtD5whvJ1TRnFIYP5AMmCJAPuqFgTZAtoatomQjACF5RRpFlyQA5MX7h+uJ0N9FtV+ERwSkVgErwqLqyEw+wqXxncaV1A2YAIlCdp+7Ljm0SVn3zVwMyalzVWpWqGRLGuMdE8HUxllpc9tVGEUihreENhAc3JuAPXLuA3g8ILf7VInW0259PWr6cJZycNPmw/HYkzmWwFHrgYPB+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7gURCK35L2bPhgnJ7+H0B0h/dMtWm7JKW+dY0s6pmlw=;
 b=TFH4TuNUmAv9MOxPWQaldCA5hGPgca4vK3AOz59emAUdUJn/7Sa5ZlWpYYdYnXCeoez7Uu17hlTQpaiNaVOI+03oGkC34R4JToGl4aOH1BUmEtzBiUlcYos3GnaJynMbVfTI6p2p6UP7B79f/RDi/ajpwAb6Xs9Y5O1TW3Y8WO4vXed8SD2wzncYsDxtHww/pOji6pG5U6KeMrGfVpAzBKyDRIUszo6dfCp/ropXQk8OiH0Cox4wLB/N/cW2teTGdowMh29X92vUtJ6E1dRztPlzofjOSutS35zKXCQKcPvi/r4Xmosth6ukM6EJSP6kfiJO9nESKGqJ55aETCXsNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7gURCK35L2bPhgnJ7+H0B0h/dMtWm7JKW+dY0s6pmlw=;
 b=JI9k2V7ocfkP9/yLeOoevoRJrVnlsmXPaEHj7iMP8Pbbg0xU/JF0h5NtxV4UodcXrfS3x30z1TD1OFFywwRG8jH0FHETkSFYMmmLItoW5p82vh3pYVD8UQU7+LbEJ9KlXXVH0m0wkx27t0L1m/NF68Jj78A/b1RJTR52XcZQPz0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS2PR08MB8747.eurprd08.prod.outlook.com (2603:10a6:20b:55f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Wed, 6 Dec
 2023 12:15:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 12:15:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	=?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
Thread-Topic: [oe] [meta-gnome][PATCH v2] zenity: Upgrade to 3.99.91 (4.0 RC2)
Thread-Index: AQHaKA7ymUxN/43HaUK47fZLdzM9MLCcGSoAgAAF0gCAAAyaAA==
Date: Wed, 6 Dec 2023 12:15:19 +0000
Message-ID: <988EE7C9-3D77-49C9-94EB-0B0D926B6E5A@arm.com>
References: <20231206063902.152089-1-zboszor@gmail.com>
 <3AC073BC-F68F-4A45-A6F2-0E8E2E15261F@arm.com>
 <048f1bd7-4986-4fbf-bdf8-55d7b8557bc8@gmail.com>
In-Reply-To: <048f1bd7-4986-4fbf-bdf8-55d7b8557bc8@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS2PR08MB8747:EE_|DB1PEPF0003922E:EE_|AM8PR08MB6484:EE_
X-MS-Office365-Filtering-Correlation-Id: c514c974-9d30-4df4-2794-08dbf6550967
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zdhZp39LjRR0sa5BfQYoO5edZ2qAImZGtbEb6Dd361yycGwe9GgF6EyCpRX4Bzgvi9gK9k0ct2qDW1/ZEqIe6S81rt/XLlDQjzz/XSFExi5BOqmhwaktc8iq38xHS0sAoCaZ3xkkYhPYR0DCQmUAxZ8LgYdv4/03IWu6zaYIjbhx26X+73Fe/P+A1vyzOI0ya7rKQwJhLPnzpY6N9eR2+/PWjBdr8kinS6b4nTu/YL0xhvCzQUAVHouwKkmWmlJ9Hy/sR36a7jp19XL1jEH/DQ0now76sgvaXmmZBniWvSAeB5TzER0KdWb1hsTP5Sdxe2kGFUrIBdaT6SXaf8u9GPhye51fRpcFehsgEdYAoqsUANFcVJ9aWFKziwPICbd20wifSKqZIt1vOaCmTjf9SlWtleM4BPnvJusw8BJA9pfa+omFryujSXcVWS8FU8VbNVrMFSIKoZYufHJm8NrnXU5co+NQk3dWFWCS04gSesjo74gvBnkP3BvJTLalwQjGwc5dXfZ+Iae6Zx7AEuXErnhyCHRunhDauGlI2MlG3b0e1lTsGOQIgla+OvBZw/Css7+EYcViAQFPDBLfaxwyOtyGdguYQ1xgq/S+huBncJA5XfoyT+LqoyjcqWeValD6YoEayH8Qa1cfd2QejMkJtQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(396003)(346002)(366004)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(38070700009)(86362001)(2906002)(26005)(66574015)(83380400001)(38100700002)(33656002)(122000001)(558084003)(71200400001)(36756003)(53546011)(5660300002)(2616005)(6512007)(8676002)(4326008)(8936002)(6506007)(41300700001)(6486002)(478600001)(316002)(66446008)(64756008)(54906003)(66946007)(66556008)(66476007)(6916009)(91956017)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D0A2793ECFAF3B4B94B0C035751F0808@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8747
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	a6cc4209-b08c-4494-a637-08dbf6550343
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	EETgQ2s72pF2hq6xv8gtBxgLlZRJpHdOiyU5X/h0RU0o8HiQywkHQZgOjaBStGa4jMh2P6KVfqVWZA0f8ILdw8TFSw04qDcEGcs3B5byADd9xui+RmvfEQDmq1xqw1DrO1TDXJbhLSr8oEjxKJAaptylYTyZWkl3+e0Igc2oGIvomSX3SE5pTRuq2M4u8qDyDdR7a5R+0CgKCEfjbLkYYhzZLczmQtTvIO9/DUVJ9kxlkPNOovEKNX1J2yvaqRhcWLA7cLDnm5fzaMStI+voLfTcMTRxCgTnsQmkSDgRgZGzT+G9TsNF3+XrCdrNQA4cBHjR3UMldFoUJos7JmGj0owtKVtmMohXjmcfAtkkRnUOmiA/d/jr6GQqNuCl23gbAHIstVBqtWAj5FlBFVbnyaI09O03LFjGeC2asWyu/lCFnjXPJYJf9QxrsOv62zj71nI0xYJAJwQkgiPCR1pY6FTC50o2bz5/ngqEVGTsHG1nJlQmsDNSVBhRy6P/bi9WIn79YBCcGhtq6oe7LPt8bYCPA2frxpGtougCIkcm89HMOxIR1ruY8SIDrp+xjIrcBQGrmx2iSbdDgXd1lMJaKJBEErM6Bie1a/RFmbRZtNTgTKwuG5AmnKgFOLeeY3VXao0ttVzti7m/gH/srD0PngX9nwB2PiiHbGQwj5VN2fgn5Bgbw8MXQah+jUKK8lR88L/r37tVzHs7sbto/j2QmP47aKcps/ZPole41HCWZII=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(39860400002)(376002)(136003)(346002)(230922051799003)(1800799012)(186009)(64100799003)(82310400011)(451199024)(46966006)(36840700001)(40470700004)(6486002)(70586007)(40480700001)(70206006)(478600001)(316002)(54906003)(86362001)(2616005)(107886003)(6506007)(83380400001)(36860700001)(8936002)(8676002)(6862004)(4326008)(66574015)(53546011)(336012)(26005)(6512007)(36756003)(41300700001)(558084003)(2906002)(5660300002)(47076005)(81166007)(356005)(82740400003)(33656002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 12:15:29.3309
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c514c974-9d30-4df4-2794-08dbf6550967
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF0003922E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6484
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 12:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107241

T24gNiBEZWMgMjAyMywgYXQgMTE6MzAsIFpvbHRhbiBCb3N6b3JtZW55aSB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8emJvc3pvcj1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4g
d3JvdGU6DQo+IA0KPiAyMDIzLiAxMi4gMDYuIDEyOjA5IGtlbHRlesOpc3NlbCwgUm9zcyBCdXJ0
b24gw61ydGE6DQo+PiBXaHkgYXJlIHlvdSB1cGdyYWRpbmcgdG8gYSByZWxlYXNlIGNhbmRpZGF0
ZT8NCj4gDQo+IFRyZWF0IGl0IGFzIGFuIFJGQy4NCg0KVGhhbmtzLiAgUGxlYXNlIG1hcmsgaXQg
YXMgc3VjaCBpbiB0aGUgZnV0dXJlLg0KDQpSb3Nz

