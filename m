Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C13C4167B
	for <webhook@archiver.kernel.org>; Thu, 30 Nov 2023 23:20:22 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.89])
 by mx.groups.io with SMTP id smtpd.web11.10112.1701386414129011658
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Nov 2023 15:20:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4xq7emyl;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=4xq7emyl;
 spf=pass (domain: arm.com, ip: 40.107.8.89, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=Ts1JoL7IXTTdsR/5v8A7g6jM4rQodvU5UtQcv7dC+lQLcBWLSIe4LQ9Yq41kdG8noFEbDaaTwS54W4wF0rMdHxAUZoV3PRDinMKQsAxEPJyKJ2vKyZWWZ8sbjnuM/v9TVp9P2oYtF9dRcQ1z921ZSnVw0IS6S1t+HSbuAa9og0kAmwoJ5FWoL2XNHykHRwgsUs9PGM3cinZCvJ4Ilw7X+FDwSr6wwaAyOaAKsPxbXSomM3R3USfVcVAg5AE6IPrJ9yezRL2Xlqpql97T4yn47sDLiaQ9n/KXFiX4tfflN8SG6D00vzTd9bm2+w/1xXQBguRvGPbh3kMgwWsLg9Z3uw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNKS4yczRxCjhOMnefPm+Y04Y9YNMbhFZ5UpsW6y3Yk=;
 b=gjU4blT5Z9A5LsA/izr7Cxac4rAspNpUcQ5KjirLtZTgjPc8ktBSDetW1D2L0L2XNC4Z33XyWuxKA4ediT6Cp872mpIJiUxZey82GFkQJ6iSFs7aAVf4BviNV6Rucxaz6m3CeJkyONYaCEZDgdg2cviCZd2nR25MEn5KZZyzcBtABgmzBR/W7MVm300LhhQ3RyvENxRBGUM7rCJjJjkSHGF2Ca5BlMwfSGRM+IpeSa1hDpMRBXz3Ygf3J1yhJ57ewwCE63I3+J0raMZx9BhsdMnLyX3d5RlLh6OVLeCUq7iVoci3ceLMXZEb7f0TXnGHN7oF2H2X4aAZiLVUhzO+vg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNKS4yczRxCjhOMnefPm+Y04Y9YNMbhFZ5UpsW6y3Yk=;
 b=4xq7emyl2oLhebbTqV1+v1mqqmffPZQESemJjCNI0oraH43hRMgGBHbhdxoYX4MU9uHzA2s83D//+Nle+ydFM9fyOlL2aytMy3Mq0/M1m6U2xlkRhknVK1tfT6y8Lnj69zjbOA0xW587cTh/pNXr2oaDmp+kKAN1gBLuDrgubSs=
Received: from AM6P192CA0035.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:83::48)
 by DU0PR08MB8731.eurprd08.prod.outlook.com (2603:10a6:10:401::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 23:20:09 +0000
Received: from AMS0EPF0000019A.eurprd05.prod.outlook.com
 (2603:10a6:209:83:cafe::a6) by AM6P192CA0035.outlook.office365.com
 (2603:10a6:209:83::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26 via Frontend
 Transport; Thu, 30 Nov 2023 23:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AMS0EPF0000019A.mail.protection.outlook.com (10.167.16.246) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7046.17 via Frontend Transport; Thu, 30 Nov 2023 23:20:08 +0000
Received: ("Tessian outbound 7c4ecdadb9e7:v228"); Thu, 30 Nov 2023 23:20:08 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1bb3259c79f191d1
X-CR-MTA-TID: 64aa7808
Received: from a2e69858b59e.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 50E3C1D9-CDAE-4FEA-B2E3-EEFCB2C9950A.1;
	Thu, 30 Nov 2023 23:20:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a2e69858b59e.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 30 Nov 2023 23:20:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MxH6VbJIb/73WdVWNn8uytmKd3dKiRt4f2nPPGU04zj1gXeLdMbfDcIFzRvUu50dwkg0UG+FxYxgmuwjfCixpmQAa5ouGX9wj7kDQJxIfWBlGY4GYp6+YxSDvH7oR06ce2eAj/qtZaUf0L+CO9OgrA5kd0wTw0ALBkT58mhKlF7/Iubf+i1P15u97zQOdukyJNVE50wfoaxHgkMJonVznFjmzUvVVk55+7kqcwcbKaU9nt5Hw24o0fcs9l9muihGK364MJKfjDUfTPgx5nN4Qt8deqCiXlkOpaTPdqWzKEDIJEEPViqAzGXWLaoHWp54KzKprFk8JmJ8lZA1jNcDOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PNKS4yczRxCjhOMnefPm+Y04Y9YNMbhFZ5UpsW6y3Yk=;
 b=GQqVqZrow6fACv/2OMVnRbtz6lwuhI7OzDVSQOygN6Tx7K8OGNaZzjnqEhKSRPcGa3dv45MlNV4cAEukmBmH62tPVlNGIkQ5e8LGGkPW0wAgJTi1uJ+HNkWeOdmfvPPehXRURCAEv4p0ukKMDngmpcUk/d4D41q5xjMzcnqYkC58FRo1n0+wyVnmEo81yNG6ji9xYQi5N9hFZvc3SA1onsNxSUcpba0iDUZE0LtgcVFuqrgzNoRfXuyjuqUxLdVCsP7l5onySmHAW2iXroapWdKvrD4zeDFrEtEL/Po91voMDJ02rKyXyJ+dKTWqCZxrUYh9Ero/b1wmx3tAxDZQDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PNKS4yczRxCjhOMnefPm+Y04Y9YNMbhFZ5UpsW6y3Yk=;
 b=4xq7emyl2oLhebbTqV1+v1mqqmffPZQESemJjCNI0oraH43hRMgGBHbhdxoYX4MU9uHzA2s83D//+Nle+ydFM9fyOlL2aytMy3Mq0/M1m6U2xlkRhknVK1tfT6y8Lnj69zjbOA0xW587cTh/pNXr2oaDmp+kKAN1gBLuDrgubSs=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8202.eurprd08.prod.outlook.com (2603:10a6:10:39d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Thu, 30 Nov
 2023 23:20:00 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7046.024; Thu, 30 Nov 2023
 23:20:00 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "alperyasinak1@gmail.com" <alperyasinak1@gmail.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Topic: [oe] [meta-oe][PATCH] libpwquality: upgrade 1.4.4 -> 1.4.5
Thread-Index: AQHaI9NNO1SfPA97Mkexc3KiRONXcLCTf8aA
Date: Thu, 30 Nov 2023 23:19:59 +0000
Message-ID: <98080AD1-F99D-49C1-BAD1-1D8A8B23BDDE@arm.com>
References: <20231130212143.3192153-1-alperyasinak1@gmail.com>
In-Reply-To: <20231130212143.3192153-1-alperyasinak1@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8202:EE_|AMS0EPF0000019A:EE_|DU0PR08MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cda3834-dbf8-4af0-4626-08dbf1fae4fb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 5OnAaUSkR41PsUckAwiXVorM/z7xBBYv84cNg/W0IcofXvZejeVoU+vT/seBQjG2uw+/RxgWgBZjK2lmLvpmmW/FPZEI66Jt21mGFjoZfDoRnzIK0h2OHoy5DT8f+UogZpQhTCP3BO+wowYu6AGcyrlJrz/gslcLHVXLW57PcDDf8wNNNpSSbYxyiAKgDXNeoax3GmuD7te87uQN/mL9dNywSKNzbV1R4eegIPA1aZlrKGlGpouwyBuC4VazniiXrpF0LpL/wRQtIcw6EYCT+aFOGZeGUR11CXp8s1ygXrkAK1ZWU0qiHADegRQ7YLjbBi41SINttVJbIWQDGxuL8wbQ+MtGCzK1yOCkU86HQoaEJUpZePW0SONvBHB7BSYxBIcfrMBn5dnE1VDR5jyuiZw55i4ZV/ZV+8uiC0SjCZTRWYsO+rj45jyrEB6sr2zrS1kmnCvbW8sL4fwY7nP8GbbY9UnBXKN/YxyZAxhuPXxXK+y9Z7QCA4Y9fhA57jJAloY1C7Do8MVfd9/t5RY3jQTmKAAal0zl2zdGhHRGPFUmLTGqlSfQkJWIm8UqIsOhvKJN1+HnNP95yg4cTGGhfepSLw3DS0huk7dME7T0k9cF9tM9G0hytkUC/zXLRMviILJXNaCon1YVqVMUcj8Qha2wt7m0GPT8NZ4CRxZLucI=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(71200400001)(64756008)(66446008)(66946007)(316002)(76116006)(66476007)(91956017)(66556008)(478600001)(6916009)(966005)(6486002)(5660300002)(4744005)(41300700001)(38070700009)(36756003)(33656002)(2906002)(8936002)(8676002)(86362001)(26005)(38100700002)(83380400001)(2616005)(122000001)(4326008)(6506007)(53546011)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <6D7695948480334682028BB9181FCB0D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8202
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	792c3cab-8952-40ce-f267-08dbf1fadf92
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PjgpCJtpZwe9/lzo78kA3bUqWwm0BRNO8D6aGU3zo9N7V2jCOonGvVe+8z4omngmBhiKyj5rqhRI4chvUuISu0mD4HzHH4Rg7W0bByYbR3zHb/YYp3OZo2nmwdeTpHAnO81mJjy3xg3ld8+R6LFVm9s9HoLthu/e1sUuPzI74DzlU+7K+4PYR1UfxCPraeyVB1d26DiYqNZpax4tFwJQ0R0rXsFb7SUvYHeSpQLrc6kE+LU/emZhKx9cZPFqzraXteatKqzGpo84CrB2yt3rdSzVjzTwTK9P3ci9FRMcc7zYFeiJoClLzDQUez+5p//SSjLC9IJaanrtYT3/1LO3GPH5NmzkVVNu9f63bgN8v8JTKnW0Bk98jAEPz4/bzRl0XNSooZxGzrPvutcWNoh1DfrknHOtLT/Uf8/6sOHtoVDYoUEangZSm+ScxiFfy/w9CGZQGeQq9HWkXv1CPVyEvbnh99vlmbxyG1kMwRq7PgSH7tyHNcYdmX7OpssFtUE0G+WM9fYqBHD2+YtJL9wJAr7IhIpPZnez9pKR9iFP2OGM8bTYMWJg3ZA9nCJy3Ys/MFabTCUCMnmNDI38xfFS39agZhKebme44QsqMeGa/i3p2/dyaKaMzo1M4LF4X2UxvkolsNmFgSTVsgYuiwsCpIE+NjV7pV53x3s8G4jjZ5zzwO+EJxFMc5GUTGXtF6SzbvFt5locH2dIEc/UxYQwbgGyEPFzGgVMrovfwGdo80uIRZJZnVVFGkkhO0AcxshbsDt0d3G61s5HgGZunbCnjQ==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(346002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(36840700001)(40470700004)(46966006)(356005)(47076005)(41300700001)(4326008)(86362001)(2616005)(6862004)(8936002)(5660300002)(8676002)(40480700001)(2906002)(26005)(4744005)(6506007)(81166007)(478600001)(316002)(70206006)(70586007)(6486002)(53546011)(966005)(336012)(40460700003)(36860700001)(83380400001)(36756003)(82740400003)(33656002)(6512007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2023 23:20:08.8380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cda3834-dbf8-4af0-4626-08dbf1fae4fb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF0000019A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8731
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Nov 2023 23:20:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107179

T24gMzAgTm92IDIwMjMsIGF0IDIxOjIxLCBBbHBlciBBayB2aWEgbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZyA8YWxwZXJ5YXNpbmFrMT1nbWFpbC5jb21AbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3Jv
dGU6DQo+IEFCT1VULU5MUyBzaG91bGQgaGF2ZSBpbnN0YWxsZWQgdmlhIGdldHRleHQuDQo+IEkg
Y291bGRuJ3QgZmluZCBhbiBhbnN3ZXIgYW5kIGFza2VkIFJvc3MgQnVydG9uLCBoZSBzdWdnZXN0
ZWQgSSBjb3VsZCBzb2x2ZSBpdCB0aGlzIHdheS4NCj4gDQoNCkFoLCBzbyBub3cgSeKAmXZlIHNl
ZW4gdGhlIHdob2xlIHBhdGNoLCBJIHVuZGVyc3RhbmQuDQoNCj4gLVNSQ19VUkkgPSAiaHR0cHM6
Ly9naXRodWIuY29tLyR7U1JDTkFNRX0vJHtTUkNOQU1FfS9yZWxlYXNlcy9kb3dubG9hZC8ke1NS
Q05BTUV9LSR7UFZ9LyR7U1JDTkFNRX0tJHtQVn0udGFyLmJ6MiBcDQo+ICtTUkNfVVJJID0gImdp
dDovL2dpdGh1Yi5jb20vbGlicHdxdWFsaXR5L2xpYnB3cXVhbGl0eTticmFuY2g9bWFzdGVyO3By
b3RvY29sPWh0dHBzIFwNCg0KSXQgdXNlZCB0byBiZSBhIHRhcmJhbGwsIHdoaWNoIGluY2x1ZGVz
IHRoZSBnZW5lcmF0ZWQgZmlsZXMuICBOb3cgaXTigJlzIGEgZ2l0IHJlcG9zaXRvcnksIHdoaWNo
IGRvZXMgbm90Lg0KDQpJIHdvdWxkIHN1Z2dlc3QgdGhhdCB1bmxlc3MgeW91IGhhdmUgYSBnb29k
IHJlYXNvbiB0byBrZWVwIHRoaXMgcmVjaXBlIGZldGNoaW5nIHRoZSB0YXJiYWxsIGF0IGh0dHBz
Oi8vZ2l0aHViLmNvbS9saWJwd3F1YWxpdHkvbGlicHdxdWFsaXR5L3JlbGVhc2VzL2Rvd25sb2Fk
L2xpYnB3cXVhbGl0eS0xLjQuNS9saWJwd3F1YWxpdHktMS40LjUudGFyLmJ6Mi4NCg0KVGhhdCB3
aWxsIGxldCB5b3UgcmVtb3ZlIHRoZSBBQk9VVC1OTFMgaGFjayBhbmQgZ2VuZXJhbGx5IHJlZnVz
ZSB0aGUgYW1vdW50IG9mIGNoYW5nZXMuDQoNClJvc3MNCg0K

