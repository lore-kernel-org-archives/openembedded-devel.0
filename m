Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 496FAC4167B
	for <webhook@archiver.kernel.org>; Mon,  4 Dec 2023 20:15:04 +0000 (UTC)
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (EUR02-DB5-obe.outbound.protection.outlook.com [40.107.249.75])
 by mx.groups.io with SMTP id smtpd.web11.80192.1701720899781551754
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 12:15:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WMbs+4Vv;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=WMbs+4Vv;
 spf=pass (domain: arm.com, ip: 40.107.249.75, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=UE3TR/tmaAyHYU1Fdlxp0ltc0yEGhP036eipn3oP+z7IxdzY/4/PHC+XJwieWfTb/fAjoEXk3HXTFMWhBgARwjSg1pJ+oYk6wJeeznFkWTk4eIvKZYRBFarWVEG3R6ZVbh3V80kfAMfvPS0iKicFgqvr5sjdLxjSeVZCZ9caE7ATpxM4vY15qbiJ/3EyWB+i17luvRJXv+imf4f1ZgONPEodryB741YHC0NThF6ZZKJcJJdgQFRQEX82oRZWOqK0EeaGtAZ+F1JKrDsa6k+O4P9Wcif6hGLPUMmtRob4UoftpNlcwnoDy8i6asIJ+qRgD6mB0XoZnYrgFUSKtbG0EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvSZhn+/glJum9xhWqRm9y/Pj1fv/HmLYy/clnN7qLI=;
 b=BCQvn+kOzlz7I2q4SpPAErHg38qk3eptc5Pof+5iLzPjFSq+T5enIElmRnnhGVpiEDGa6R3LVMwOw951ONfXfPNCEBOHZHjFPLBmX8+mLo14HW9oD6ivA6NJduto52uGko0i9FHIKWyO5JDqTnRfRczlJmc1yCDDf2kHPK41MSbIMw76+MmsqhFTBLTwu9Z98X2LePIxhI8FluMPwL5YakJPhRO44PYsj+1VnL497ByDX5Ta8NAIEHlUThocKsTdwAiiQXvl1495chCyJHpbYBD0kgJXsAbxw80wtNadi6QLzKf/xTVMaZhJPt/mkrfJCnO+LjUuYYz9J7mBcfYnRA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvSZhn+/glJum9xhWqRm9y/Pj1fv/HmLYy/clnN7qLI=;
 b=WMbs+4VvHuKcsOrpZ7z6R2vxqSIoafK8MwMhLBA8Pl9ko31lDfiztH4no30He3XwxDPpK+4ubJH88/9JeP7mXu34G+0tBQjiuFJVKslEYZ/Et+722lpRxOFo4XHJUvoD7ec1VNRYO99eRbwT/KVUE040GLYM/YEpgfzBw0ehfd4=
Received: from DU2PR04CA0303.eurprd04.prod.outlook.com (2603:10a6:10:2b5::8)
 by GVXPR08MB10614.eurprd08.prod.outlook.com (2603:10a6:150:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 20:14:51 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:2b5:cafe::19) by DU2PR04CA0303.outlook.office365.com
 (2603:10a6:10:2b5::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33 via Frontend
 Transport; Mon, 4 Dec 2023 20:14:51 +0000
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
 15.20.7068.20 via Frontend Transport; Mon, 4 Dec 2023 20:14:50 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Mon, 04 Dec 2023 20:14:50 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 792d2319c577ecb1
X-CR-MTA-TID: 64aa7808
Received: from 3434160ae7a6.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2D7B1512-FEE2-455D-BCB0-A5E8CC2CED72.1;
	Mon, 04 Dec 2023 20:14:44 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 3434160ae7a6.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 04 Dec 2023 20:14:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WZOtK1WRx8j6oRmh2bjDXw8VfAvKgRb11kOfEN2Me6J/XhfoMGrKbsfeRRn7kSBixH23zKCr2zzM0JWJhLjZUF2kj3/ReuXOuTvo8mS3OQBGZRvzmrd7TuqOTXPYmr/zvSgAGQZGVKgnFacYzuagUdN7iJKnobU/cGqNxjfTJYikSxfyTdAj8CEKhWx0rDERn6MjJJCnpVRIypvGANi/otfBMOCfbWitoXe1j0lkgp1QgPuFhj4OsnpVpbsoa7StlCyDEw1kDo9mRtJwxODRK6ac3PLbnOpoz7R44H0XS6kUfnYWQoknMeOB0op/vAbWEOSR5e8++J2c8evvas6sDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MvSZhn+/glJum9xhWqRm9y/Pj1fv/HmLYy/clnN7qLI=;
 b=cGkNbM+HcamM1gbB7nD5WN1sWwC98cvm/aQOsT3fU24B25CmjMZTD4SPoQGQt+weKX0G597XVWLpITYz2ba5ztMe951Y99ytJ2ripxPC3yGe3yNBuiOO3UFYlJ7PCHyra8LFwQyA22HYr7Bcugv4HONqY9drvd0M+djeOiEM4dSX7c1fGa8V/PtDT0icRYELbpCUARRM4H7D6tDxVB6583xuax7QpbO/DkRpUHWBb5sh36WvQi/9fm5RLWazc7gXJCWZlwAbFw5LMPjoXhmjGW3c/2lPP3dzgaKIoCVQRZ5pgmAgK7SOpO1WJYqSjDy/02WhgY4mB6R24l0gDK9kUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvSZhn+/glJum9xhWqRm9y/Pj1fv/HmLYy/clnN7qLI=;
 b=WMbs+4VvHuKcsOrpZ7z6R2vxqSIoafK8MwMhLBA8Pl9ko31lDfiztH4no30He3XwxDPpK+4ubJH88/9JeP7mXu34G+0tBQjiuFJVKslEYZ/Et+722lpRxOFo4XHJUvoD7ec1VNRYO99eRbwT/KVUE040GLYM/YEpgfzBw0ehfd4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by PAWPR08MB9640.eurprd08.prod.outlook.com (2603:10a6:102:2ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Mon, 4 Dec
 2023 20:14:42 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 20:14:42 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Topic: [oe] [meta-oe][PATCH] jasper: upgrade 2.0.33 -> 4.1.1
Thread-Index: AQHaJutyVC1ebH+Tz0eB/ug97A8uh7CZjyIA
Date: Mon, 4 Dec 2023 20:14:42 +0000
Message-ID: <1EE9B5B4-2F96-4E7D-94E8-3563E37C0D40@arm.com>
References: <20231204195224.45946-1-alperyasinak1@gmail.com>
In-Reply-To: <20231204195224.45946-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|PAWPR08MB9640:EE_|DU6PEPF0000952A:EE_|GVXPR08MB10614:EE_
X-MS-Office365-Filtering-Correlation-Id: f54dae57-f671-4f87-c575-08dbf505abc2
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 TKvNOy1+IQHoWjE6IK326udGBF4nODP/ufxjIUqbZwZKE9WOtwn2SdDl8t8mJVIgKx72Mo1Bg6NIMkGlk6idbpNtyF7zdL7UEc0PUjeXOfvarCgx2GzOilPADb0BzTbsWbgosr8a5SQp+/GqMoDX+vT5dSIUVRtniVJ088rdn+sAVWZKQu6fbDDyacGi8xQlKc8om+eZlPC3qoAomcRAv7tpsENvDAleJERFYtvjqyYJGhzljLIgLTQYhuXzQraA2mYRN8UecA0pQGA/B9cu4muf8jbqH6pm1emwiULSJfUeKhxm+3npJWkWm1LSQuzGVmpufftDXCQ1SjLi+wS93rj7QvHS0h99FlbILI8oJer2VsGDpnQgCuqs3YCghKWDJueoyyQf5CFOdhXy9zhn36tXQhdo83VkMPgO1Rh/2q7DHE0Tult8hvO6x06eGvpOIFkcIJnzf5RoXoDz6We5Vd8SkoeHu6G3HjtRmAXRGaP5tMJpifyGuJpfkF2/SLIvght6EXIx4ZQZYPU7yYM7qBu7XTTbwuHnoLyy9zZ8mkROnQTs6kRMrb4wFjHsdQfmXNp/sdUfMCsdTApYeUbiUGj1BFXGnilaadqipZm0Y282HcXVU959hqWDbo7WKd1NVzXEullJ7UeQ5x3qBfZnOw==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(396003)(376002)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(6486002)(83380400001)(478600001)(6512007)(2616005)(53546011)(6506007)(26005)(71200400001)(316002)(66476007)(91956017)(66446008)(64756008)(6916009)(66556008)(76116006)(66946007)(86362001)(8676002)(41300700001)(36756003)(4326008)(8936002)(38070700009)(4744005)(33656002)(2906002)(5660300002)(122000001)(38100700002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <2F7FB1A9BDA4224C90C6A14CB3AE7D60@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR08MB9640
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	65c214f3-ae1b-4f35-ebf4-08dbf505a703
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aRKMMi/Bx/28P+jSzoYaSj0P7lti/UVTpxaHcOTRXwO16CXKSZAzXuq0C5ou1MUsUYr6C75mzT3AvlV7KHQepzBKKQ/VR/KkkVjvDjGGg2WwuhEXn6v/frI8mhX8BmN6sKoRVbmTc9gxDEkjq7cqAZi9u6y3fAYHMOaFxhPVc289MD80s0ju+De2O02k50It/GzcD1tQ5qfYahIAHVjUZUWDByN45k8VVnoA2VxdMRRXCakluGbFkYGkVYvhABcmSxLUmMRRoO02TI7MqQb9ywVWmiqXoDST2uOE5e/B+7QIykRaBCm70Lo/PftECJgw/cfw0I/r2iJWIc11HZQ6mjJyUsvay/MgiYJk3yc6z3jNdbYPuSr0e6fcbJNkGAlcu9tA/5odpLiiiKUkJccfcSOHv/bxOAlig+rBKos+cbuemc8QK4h2qGRmuuhcsdbfo+zm+5EUksSEiRyjHBv7qfDktn5qBdA2lwp20oU+/WqUnR0KZTSyOwkHRKybfLszOzk47CMNZsUVmVixOi85XNQcGR6peFV/A5rbHJeJbjfp2hYM5Bo7pwmKO/bAWnQZy6cF5WWp1lkkWAIvWc2jJb8rg0SQoil4BdWkl0ezWIc+y+7GiT1MiFeokPrA2yRKWK3rGK9EhE0Z2f75vW55BAbtEC7JoCG152KykUASlmdEXU2Qqps4vwZXHwoK7DuPFdGjRT9iAv0UvNWs7ERJlnx6/MDIEFJhl3nA6fGU0rI=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(376002)(346002)(396003)(39860400002)(230922051799003)(1800799012)(82310400011)(186009)(64100799003)(451199024)(46966006)(40470700004)(36840700001)(47076005)(81166007)(356005)(82740400003)(40480700001)(26005)(336012)(83380400001)(2616005)(53546011)(6506007)(6512007)(36860700001)(478600001)(6486002)(40460700003)(70206006)(70586007)(316002)(8936002)(8676002)(6862004)(4326008)(33656002)(2906002)(41300700001)(36756003)(86362001)(5660300002)(4744005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 20:14:50.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f54dae57-f671-4f87-c575-08dbf505abc2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10614
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Dec 2023 20:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107213

DQoNCj4gT24gNCBEZWMgMjAyMywgYXQgMTk6NTIsIEFscGVyIEFrIHZpYSBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnIDxhbHBlcnlhc2luYWsxPWdtYWlsLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
PiB3cm90ZToNCj4gDQo+IC1DVkVfU1RBVFVTW0NWRS0yMDE1LTg3NTFdID0gImZpeGVkLXZlcnNp
b246IFRoZSBDUEUgaW4gdGhlIE5WRCBkYXRhYmFzZSBkb2Vzbid0IHJlZmxlY3QgY29ycmVjdGx5
IHRoZSB2dWxuZXJhYmxlIHZlcnNpb25zLuKAnQ0KDQpXaHkgaXMgdGhpcyBsaW5lIGRlbGV0ZWQ/
ICBUaGUgQ1ZFIHN0aWxsIGRvZXNu4oCZdCByZWNvcmQgdmVyc2lvbnMsIHNvIHRoaXMgd2lsbCBt
YWtlIHRoZSBpc3N1ZSByZWFwcGVhciBpbiB0aGUgcmVwb3J0Lg0KDQpSb3NzDQoNCg==

