Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0111C4332F
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 09:33:36 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.41])
 by mx.groups.io with SMTP id smtpd.web09.8686.1664876007762154726
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Oct 2022 02:33:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=dsBnOUsK;
 spf=pass (domain: arm.com, ip: 40.107.8.41, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BgEFr1dRAK7Xh0m8r41b1UO28hdsUrVBLCi4w0U+NQfXaZH8gcsJqbRATbDW3M2OpK9HlEJz2IZW4D8bCQCHXgW13805b1gRfpyAQM8cJUUmLkkVF1JjMHvdWf85bknX9jy8I+ILpGWk5WI3FeACPtjU9nU/dmo3r0STgB0cQCVDn3eqze0+8SiqIvN1hZx7AhqbcRB613og0inuNwolYO2OT4hFR7gP5ueRASj0Wq50LBUoTJtTDupqjP6aCNKlxeu+xUdVuxwR986lGJLIC8dsgzUaIgmT6jS05Hi8uGJHDGADl3jbww2ZAwISrbFvH3aPujt16BNt91JM+FH0Vw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSXBtELclmqk1v6IBYaPo/2dUdtuuBIGzYUb6W49oAY=;
 b=GNuQjkwDfZOaoOZpyJg8S9ZbArYFKKhMuTwP93WrcLGKHFi5ElHuXxtq7t5QqYpP2ybkKZGPBioblniJ1x2PpmBau1DEwCHl6Uz93FADOnjgSXhMEqa6Q483k7eRNsL3JJqInZplSlUQMOo9j+K/azjFlqLKwT8mU/M158NXPol0zt/NBhwXsWuWeOYxA5G/kd5g3qiUbaOOvEEfVW+8uiHz554Fap57Dz4cnI/qtXGWaAoU6lAqtYo1TqyGc0PQhhGRDbk981ahU2RxGcPibZRV06zRAN4lWkOAh4W/d9tb6QQzH/yZOKd0nmYrPopcnBSdbzXi2Xqji6t8p+r+Dg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSXBtELclmqk1v6IBYaPo/2dUdtuuBIGzYUb6W49oAY=;
 b=dsBnOUsKBIWQthHNhfBqK3zBxQKTMOEC8d7i0zX73oPXiY6JJuuLtlJ1QmKhqj3i0Z6hqAxMxM1jS+oroZ89TrrQJZGf8IXhaxsEjNJ1Y9CWjQOWD123S0JgwnKvQWzo05GiSHzqPI3/mgkdB4uBzi/wm1AXwwwfuxgfRq07Q48=
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by AS2PR08MB8576.eurprd08.prod.outlook.com
 (2603:10a6:20b:55f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 09:33:24 +0000
Received: from DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:469:cafe::27) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.20 via Frontend
 Transport; Tue, 4 Oct 2022 09:33:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT052.mail.protection.outlook.com (100.127.142.144) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.17 via Frontend Transport; Tue, 4 Oct 2022 09:33:24 +0000
Received: ("Tessian outbound d354c7aef2bc:v128");
 Tue, 04 Oct 2022 09:33:24 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: a216099f2e1ebf1c
X-CR-MTA-TID: 64aa7808
Received: from 53f75aa99242.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 10809C75-531D-460D-A860-D2B5E879A492.1;
	Tue, 04 Oct 2022 09:33:16 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 53f75aa99242.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 04 Oct 2022 09:33:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+A1BbBMnGORlnk/r1nuQxCwsBSmgKealm+FyeVmmXBbbO3ooAAC/YQzs6ygvH3py+TTYX/91LAsfC7JsXnF2EYSxzueFz5iYbFiMSFpsO/ziPgWhgJzOSr4TjC5NstBIImjO/1EW1kh05Wr5JpU0eK58GztfqkB/ZUM/2msMOqvB9quLXqZe161QeyhfToJl09xXvyo1nK456GsXSa/CKGqwU5T5e+PtsFMoL7pesr9y9jozNhjC/ZD56n/o24ctBDqmAF4mtP4KnldyxWXaUywgjhLqXAp+TszaBM4/c/Ti8YdFTLlCNgY2JvOWbk0/HWOiksv4VuXc0riMXzWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xSXBtELclmqk1v6IBYaPo/2dUdtuuBIGzYUb6W49oAY=;
 b=W9tneLNUN9lgUMNwDBj0Ju5CXPorYftX7hs+y9YeVb9oE+ss9pNizaO/R9VQXReBZ2giADlBUhYR0LVo/pgNO3Z5JPBWDEqcr24hQtnZNes18yMwbbRp73RZe9+IoS6SkNaHBBoRvLCe5cur0VmeSwxx4LIca429rgXVx4FjHDoiqSHS1FEhRPoJ9ubh6dYXJT0Mu2WgA5NH/X+bbTgU80LKoA1RXaRu7Aok8B36ORl5MTV8a+A00zIRb+UVbzHSMfn79sr/gWUk3tRJjyPizVD2r3h0ZIsl+fIddE24f6Ay53iML7vur74MASE0W3nyhwlPzgjLL3wZSPFjm9JZDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xSXBtELclmqk1v6IBYaPo/2dUdtuuBIGzYUb6W49oAY=;
 b=dsBnOUsKBIWQthHNhfBqK3zBxQKTMOEC8d7i0zX73oPXiY6JJuuLtlJ1QmKhqj3i0Z6hqAxMxM1jS+oroZ89TrrQJZGf8IXhaxsEjNJ1Y9CWjQOWD123S0JgwnKvQWzo05GiSHzqPI3/mgkdB4uBzi/wm1AXwwwfuxgfRq07Q48=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PR3PR08MB5754.eurprd08.prod.outlook.com (2603:10a6:102:91::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Tue, 4 Oct
 2022 09:33:15 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%5]) with mapi id 15.20.5676.028; Tue, 4 Oct 2022
 09:33:15 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.dubois-briand@hyprua.org" <mathieu.dubois-briand@hyprua.org>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>, Khem Raj
	<raj.khem@gmail.com>, "joe@deserted.net" <joe@deserted.net>, Mathieu
 Dubois-Briand <mbriand@witekio.com>
Subject: Re: [oe] [meta-networking][PATCH 3/3] mbedtls: Whitelist
 CVE-2021-43666, CVE-2021-45451
Thread-Topic: [oe] [meta-networking][PATCH 3/3] mbedtls: Whitelist
 CVE-2021-43666, CVE-2021-45451
Thread-Index: AQHY17obgNFDo7BkU0Si/733xGxAgq39+TIA
Date: Tue, 4 Oct 2022 09:33:15 +0000
Message-ID: <34F93D06-612B-475D-A3EE-62FD50EF5445@arm.com>
References: <20221004062437.2541052-1-mbriand@witekio.com>
 <20221004062437.2541052-3-mbriand@witekio.com>
In-Reply-To: <20221004062437.2541052-3-mbriand@witekio.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PR3PR08MB5754:EE_|DBAEUR03FT052:EE_|AS2PR08MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 324dc884-61d6-4c80-e420-08daa5eb7be3
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 ZSPhnOTN+CQILqYGaVHkpShcNBaKvnPhM7RFLpGBV+LP//2RB1F3QicpaeUO86pK+pXs1It9uLBHNhBMA5RgJzD/8yQAIGZkJ8RoenuI2Dt/U16AbOuXDaSqg6gGDnGcL/Yi49hNL6tNQU86tdcZFUXuuNLPKJpZpicRcQyu9sXaV2B1a8qXkjGgIbjr5ve/axmIOIrpH44bWr5R8qcJquJwayWjXYgeUs9WAfP5WVXRpY7pZ/4/gw5la6KquAQHxSTMFrFdSsKJ5kJ5NE2kt8gO8+zj43EDWwn2TS7w44nIeBspMR0OdGp40TMACnMQpmAi64dntU7WdG8RugDZvKenrkChU2XsHSdgEJUsGRvixO9o6iqP6oWsev3JwGDJesKVwfmERyCoz/GjBj9fdOZOsyZmOnihEmhcO0Ngn7T273zyGT8GXB1Vej7PSgUxlFjwXV4Lm5NwCvbU3LVkTcPvERs539zC8YBd6/GDk++JJ1qh00gwJ72WjXgCRx/LGhyz71wipuD8Dzywo3B3uJcYVXaH6VhH3t0Vm3XKEo0aZqAbcbjaC9BIKMiKOQ5pP5aIJ7+06BhF+jWm3x4WqPfblWEVFDSfBRIHfgwNK388TCMpyCBhjmLeixOcLJk2yCJkTwAp0XKH2bgBtNuj1ofYL/S4I6ehW/Cu7HAt7cYbnAbcAC+XJ7kHd0uRSoMhHrQmHfG9jTK0lJJSSsCrDwYAKbGgU+Lh7ljyzWewJK9UCorQrjO3Nym19UzYob/JJSjDHmyHCcylx4TziiAhiCz5X1ZvhmHXnmBqziZqM7OvzL7sonvN6HPWVk2KmrKRbbdKRMr6W+NorwKJv2HPwDqZfMSXDsAIm5cgUsVyG3XXlPop4zU+al/D4E+MHzsK
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199015)(2906002)(91956017)(5660300002)(316002)(33656002)(66446008)(64756008)(4326008)(8676002)(66556008)(76116006)(66476007)(66946007)(71200400001)(54906003)(966005)(6486002)(6916009)(86362001)(36756003)(8936002)(4744005)(41300700001)(478600001)(53546011)(26005)(83380400001)(38070700005)(6506007)(2616005)(38100700002)(6512007)(186003)(122000001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A478936AA7CDA45907D2B93DB327278@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5754
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f534e281-39c1-48b3-aa52-08daa5eb76b5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XJaMr3K2oe60kizKe7nSso1EiVF9k0c2LVepfvevmSuEkT4FLrYis0+vMrJKp/hOHkgz6+5thPk71lecQGyxzxF9i5P5I8rztStIBkgjAvE7CdTQa9J64E3OiffsjO1iYpJf3pmOmPIiXDMFIgSFKXst7SdxqeSeFAVAAnNQ11IyE/bbsiegu2BHaRh2jdNcycN3YrEwPbYFmVL12rn928uiXk477g3rUHQD7uKPvcTDzvaJTLoKwVRb5XYZq+SwKrn4ihXK2/gxHiRmeguAo3n8MmGXVHDvI36O6ur0H4XSZY8j4/JcnHwWbmSXzWxRFb1mj5JIyHl7rZcRwat9Z98+B4mwZCFIieUVBPBJzCWxR/408aR/46CRRtgiu2cpSWZC6R8HGZuuR+QoV1hzdnCSBs/KKotq76qwjfbMAl/ee6W04dieB8vVjYqBwO/BeV2qMcEPz11t4sfDy/RY586X/Z0zj2OS871pK+YsPAGBTctg1uEVv58aF/S/iXLt1ND0bM6enUJwgY/42VyQPTdvmcwVmUOhpl1S2Jqk4qKA1F0E10RP169LRmVlxag4MGq2GDVzgKVhYdiBT7Rc00u79xVsaNg2A2WUizfBEqErFMJ7Ie5ngJXSMN06fBa9soOTwSYOtuue1CSfZ0ibmSdYXfSCONj421nd/HIV4PhlY/Awjih4UlZG+s2tkTQByHxtCgF1IPmW3/iyBubV4yUwf0x3vkt0t/Ci/Di32+b+wqCDC2mrJn9gepbB373fKycrJhPzxSfOSj3iFPofR+tRqjOnOkK0/fga1OC0IhN/1f79JR/ooqA3v7rwibf/IW8u2M5IH6fCeADhLC2idw==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(4744005)(107886003)(70206006)(5660300002)(6506007)(2906002)(82740400003)(356005)(86362001)(36756003)(33656002)(54906003)(81166007)(6486002)(966005)(316002)(478600001)(41300700001)(40480700001)(36860700001)(6512007)(83380400001)(26005)(186003)(70586007)(2616005)(82310400005)(47076005)(6862004)(8936002)(4326008)(336012)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2022 09:33:24.0620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 324dc884-61d6-4c80-e420-08daa5eb7be3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8576
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Oct 2022 09:33:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/99058

DQpPbiA0IE9jdCAyMDIyLCBhdCAwNzoyNCwgTWF0aGlldSBEdWJvaXMtQnJpYW5kIHZpYSBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnIDxtYXRoaWV1LmR1Ym9pcy1icmlhbmQ9aHlwcnVhLm9yZ0BsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gKyMgRml4IG1lcmdlZCB1cHN0cmVhbSBodHRw
czovL2dpdGh1Yi5jb20vTWJlZC1UTFMvbWJlZHRscy9wdWxsLzUzMTANCj4gK0NWRV9DSEVDS19J
R05PUkUgKz0gIkNWRS0yMDIxLTQzNjY2Ig0KPiArIyBGaXggbWVyZ2VkIHVwc3RyZWFtIGh0dHBz
Oi8vZ2l0aHViLmNvbS9NYmVkLVRMUy9tYmVkdGxzL2NvbW1pdC85YTRhOWM2NmE0OGVkZmU5ZWNl
MDNjN2U0YTUzMzEwYWRmNzNhODZjDQo+ICtDVkVfQ0hFQ0tfSUdOT1JFICs9ICJDVkUtMjAyMS00
NTQ1MSINCg0KSWYgcG9zc2libGUgaXTigJlzIGJlc3QgdG8gY29udGFjdCBOSVNUIGFuZCBnZXQg
dGhlIENQRSBlbnRyaWVzIHVwZGF0ZWQgaW5zdGVhZCBvZiB3aGl0ZWxpc3RpbmcsIGFzIG1vcmUg
YWNjdXJhdGUgZGF0YSBpcyBhbHdheXMgYmV0dGVyLiAgSXTigJlzIGNvbXBsaWNhdGVkIGluIHRo
aXMgc2l0dWF0aW9uIGJlY2F1c2Ugb2YgdGhlIGJhY2twb3J0cywgYnV0IEnigJl2ZSBtYWlsZWQg
dGhlbSB0byBzZWUgd2hhdCBjYW4gYmUgZG9uZS4NCg0KUm9zcw0KDQo=

