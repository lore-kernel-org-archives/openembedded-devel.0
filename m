Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F678C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 22:17:11 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.55])
 by mx.groups.io with SMTP id smtpd.web10.34514.1699395422376317420
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Nov 2023 14:17:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QGCohLIO;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=QGCohLIO;
 spf=pass (domain: arm.com, ip: 40.107.22.55, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=BjyEkuWhv91iZQUTRieqrThj22RGFzX0ZeyiKCafmOi9/Wa3XjfOtK75jDgJ1G4Sv7KZLbQNZG6z0J1IcrbBqsAFE4lFwyTO6oxe8Eva2wddZk8HF4Bo18BytKDGoZ/9aFivU5D9/Xglpxyyjb2J1MoRsQ9vnJ9f2+KEKZx5T6Cq7MxczaEWNaha4z0sjRh7Y6AATQSwFRc9eCLc0Sn/AEa3rL1CvsFIRrnlWsCqdhubaTVaHQ3pOgrFPJMZOPy6zkjo8L2DJOwjQf4XQ7YkYO3oJBAkggWhJDROU6UXYlvtj+TUZS749KOk4YFALeLNLw5fecem27xTf5KZBR9nzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=638lOrY8mDWgaIsohc9Qg3QThEBoQx+d/tsl2Korx6M=;
 b=etp8LIhDbrz9YQUJLrct1cFGZE0FQ8bOWMMYCOBZghZX96Lxy3XgnwjTRwlVD5iFS26fnD5fPn712iJWrAFrtDSuuIAItWpt8kpSP5faLKL66r924INBEBBfI1KSyojtc2bSi0A+WSW8U/4VXPwTuwZTJRBhFGukbJ/uHcAzcqGTL7RqFNQDzlNf21sLf1q8LoL0mFD9WY9Xr07X2TsY+5se1RZ24QFl88aO5Pn9lpCFZLuDcsEyR0xIIX967iwTeaC30QZIDfLt+KSUQ6Nt1sgDzBSlm9th9EuSZ0u9lydy487FGbUtnHJUXDbmwzKy8XNDA57M2r5TKA+ZduGMvQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=638lOrY8mDWgaIsohc9Qg3QThEBoQx+d/tsl2Korx6M=;
 b=QGCohLIOQSkZWPM4nrNJW9HWr2LnkftkjkB8TuvYEGqU/XyVGXNov7Bb14Q4wCXvuBt11t5wRYl3Ui9t+jb4LAFeBYJbxqn/JHqqnMx9+gMRmtuke+YOcU1LOsM62LBRYHWhBYsj4syfiylDptk/gxIX7xo4qeAuIgWQsWkllGo=
Received: from AS9P250CA0024.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:532::29)
 by AS4PR08MB7604.eurprd08.prod.outlook.com (2603:10a6:20b:4ce::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 22:16:56 +0000
Received: from AM4PEPF00027A61.eurprd04.prod.outlook.com
 (2603:10a6:20b:532:cafe::20) by AS9P250CA0024.outlook.office365.com
 (2603:10a6:20b:532::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29 via Frontend
 Transport; Tue, 7 Nov 2023 22:16:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM4PEPF00027A61.mail.protection.outlook.com (10.167.16.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.17 via Frontend Transport; Tue, 7 Nov 2023 22:16:54 +0000
Received: ("Tessian outbound 5d213238733f:v228"); Tue, 07 Nov 2023 22:16:54 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: d3e894c63a7277c2
X-CR-MTA-TID: 64aa7808
Received: from d33a7edabccf.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 5FC23E76-1868-4AC6-BC26-E0A6D4364CC7.1;
	Tue, 07 Nov 2023 22:16:48 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d33a7edabccf.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 07 Nov 2023 22:16:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHymZTO3/bu0Z9LhZBrqoXbiqIMqdC/BwqHjxjgXx1RJXOVHNXKzCf0cu9u8hqiOGSR5e3vL1nejZWibHk2iRLZtjQCAauLFw11KiHXgpayU4tkjgoIsMFhUgM307234r/tODg1+OM687S1fdlOeEk5ipVAFZfsOaiEcrsjE60Y0DmhOlI/X4n6pYnQk3PfcoReS++p47io9ULIoVdss43L6xoqkM2CBRBTZHrbCzIjaVXDwFj4k9p3vdGmP9eTaqQMdH0MDMX5lCkP3Cm4qCA4/IehOSqwPm02q8b3zgSjxiPlCEJa6sQuMRQbYl369giVoc7lIzT9mikdn9suujQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=638lOrY8mDWgaIsohc9Qg3QThEBoQx+d/tsl2Korx6M=;
 b=EskmKMPyfHBmZtWgqGFDR8IIubwoAKXTKwQpyHRKn3I5BHCKQon9WAgBnUKEeOytvCtdaZT3uGAI9N5FLfUYr5zCHoaD8nLVt1eM9qhokf8EnRG+ARmNp5qZOEfrLQFI79/OAULVfH+wAZ1hyOWB4SFLaa8bfQQVp9cE/YzV9x5obcmr0+8w0yDaW7ZYflRzNUJgprvxBAJ24T4v7YdEi35J5LIrAz7yE+Hu6PYqVzYPDrZZNRVNt1MF06d7DZvllwre18BqVCOOWNqLV4Yjl/syZgWJO+fxZ0miMd1IDayVpP3pUkAW0thJpMqWbMyc9QMgTpPSetqxXAtsZ3rr6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=638lOrY8mDWgaIsohc9Qg3QThEBoQx+d/tsl2Korx6M=;
 b=QGCohLIOQSkZWPM4nrNJW9HWr2LnkftkjkB8TuvYEGqU/XyVGXNov7Bb14Q4wCXvuBt11t5wRYl3Ui9t+jb4LAFeBYJbxqn/JHqqnMx9+gMRmtuke+YOcU1LOsM62LBRYHWhBYsj4syfiylDptk/gxIX7xo4qeAuIgWQsWkllGo=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB7337.eurprd08.prod.outlook.com (2603:10a6:20b:444::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Tue, 7 Nov
 2023 22:16:46 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::d066:526c:84ed:fb05%5]) with mapi id 15.20.6954.027; Tue, 7 Nov 2023
 22:16:46 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "mathieu.anquetin@groupe-cahors.com" <mathieu.anquetin@groupe-cahors.com>
CC: "openembedded-architecture@lists.openembedded.org"
	<openembedded-architecture@lists.openembedded.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [RFC] Support for alternative init
 systems
Thread-Topic: [Openembedded-architecture] [RFC] Support for alternative init
 systems
Thread-Index: AQHaEVzaZ9J97SR5eE21kPcXpoCmj7BvbWmA
Date: Tue, 7 Nov 2023 22:16:46 +0000
Message-ID: <3B240B93-404A-48D7-B2C5-BAA593221877@arm.com>
References: 
 <AS4P251MB101352FEDFB9A83CA5454B3EDCA9A@AS4P251MB1013.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: 
 <AS4P251MB101352FEDFB9A83CA5454B3EDCA9A@AS4P251MB1013.EURP251.PROD.OUTLOOK.COM>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB7337:EE_|AM4PEPF00027A61:EE_|AS4PR08MB7604:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d1ba103-2ec6-4b7e-13d4-08dbdfdf4012
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 smsQY+/+N+hNsrnORT6L/QXn0LWVDtrKG2Go87c0Ll9RPIcb7RHIWcX6Muvuk5AXVTrKEQgWl4kIKUYNmUiJ8FoNqXyeGUDp4v3o/Ox7xzAOvpFIhuojR0DB4CCCOatXvd2uVwvlRJZrpAJYyEnYUqJNqMyJqD6ZN8awrSjAieDtPItx96GyjZ3tGJBtAmb1l6xgIqs8gttW5QzMWoQj6ArKEl6w4YSRk0+RaSv/Ibo+wt/GFkZEmuwmt+GAX3Lv9QAJX3oNGVzZTso7R0P9HI2Zm15aFEvWAjO/kuA6BshiicjpaNlLY8LfknpY5k+OViIDB7sXaulMHoGJiXxTzwquXxJCd5iiQzAw023/Kw0dSxMuVBSKi64pOevgkBJwJEQqhlK6V0xgeVaF/TFdOEiTjALZGWDfacpwb7+7znRjduvmFhMVyfPnl31Ivvt6iNRhnDTfvn8Mwo5SribezgsL7sf9KXhDLkWFRk4WxKPWyiif9c4Q0DN46IJ2HpbrBPiMYFikfRxQe84RgdhCReSSynvrQOCP7M8WKoljG3H9zOTU8PcO8mNATLnF8U/tCC7TnQWl3/kYKuzXIpqHwowmXa9KaSGNlUh3Kb7DKl2+ZpCitemXgG6W1m6yvmO/FbvcCjRsC8O4Rj0EO7nJsQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(396003)(39860400002)(376002)(346002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2616005)(66946007)(66446008)(64756008)(76116006)(66556008)(54906003)(6916009)(33656002)(36756003)(316002)(86362001)(38070700009)(38100700002)(122000001)(6512007)(83380400001)(66476007)(6506007)(71200400001)(53546011)(4744005)(478600001)(91956017)(2906002)(8936002)(6486002)(4326008)(26005)(8676002)(5660300002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <038464964850DA4485E9B6F7F2DCCC62@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7337
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	eca542ff-a737-4388-1658-08dbdfdf3afd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Ty6QhfUSZQypO+OQWipxV+4exbxqbcBcGtlhCevPGlyUnx5LXc5ek1uaGLXTvQdtzCTLadfDHD4S2MqbpJlUkrulFT+E4oh2ghYTBKQ3uRL2XK8MZXZEpWOVZ1hIT3+lTbMTFBr5dR35aUXIILMeB8vSHFB4wmMRBt50zNxCPf53534Q/hWqxZzxC8Rw1XVSXeV1RVRQcaqYRB9Ge+Zc76WwgCQrqQdZljzWHV9aIk5C6NfynPV30dYwvfi1Sd9S8XyTMz55nMg3TkomoNrFtENXV9oqw2mgafF69dOdGmPO1mleJHSPpIJ8Q3+VdGzDX8SZ7XqleTeJSERZ4YAzqIZFy2LGdCZmkcb75b+oPGh6e93WrJJzbszcaNjFtvQJk4ZwZysjiiatSXpj3A+8G68Ca32b01upibX7+KVWbgWT+gYROnPq4/J3ynz1eiYIM51RYLSRE9Y+NWzcRZv0gKu5lKcVji78aT6P1oYMqio9w+iFiozKQchGvkNTCC6s06vmzCUIqVnu3vOnkPfh/CJoiQwAWMFD3S5VDmZXtMES6drzeO4TF35u/vZTBY66gk+BNS0aNzzCcCaHtG8zxgXc1AZnHb2LBBdDd7B88D5BxGoCpuOsvR1jov5KD6N0rZ4/NvND3DIhwcHo99vJHX/Z4r4E1HN21VQ5Scokz510U4J5xS3t6TGDQWXgO/uch6PilJJmHh6Obi0n1v2h9exK0VzMPfbKPVrOTDwMwiX4kYgcc1yojXJhR4q+FeQz
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(376002)(346002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(1800799009)(451199024)(40470700004)(36840700001)(46966006)(478600001)(41300700001)(47076005)(6506007)(2616005)(6512007)(6486002)(316002)(336012)(83380400001)(8676002)(8936002)(450100002)(4744005)(4326008)(2906002)(36860700001)(5660300002)(70586007)(26005)(70206006)(6862004)(54906003)(356005)(81166007)(86362001)(82740400003)(36756003)(33656002)(40480700001)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 22:16:54.8059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d1ba103-2ec6-4b7e-13d4-08dbdfdf4012
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00027A61.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7604
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Nov 2023 22:17:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106463

T24gNyBOb3YgMjAyMywgYXQgMDk6MzAsIEFOUVVFVElOIE1hdGhpZXUgdmlhIGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmcgPG1hdGhpZXUuYW5xdWV0aW49Z3JvdXBlLWNhaG9ycy5jb21AbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4gd3JvdGU6DQo+IFRoaXMgZm9yY2VzIGxheWVycywgbGlrZSBtZXRhLW9w
ZW5yYyBmb3IgZXhhbXBsZSwgdG8gcmVtb3ZlIGZpbGVzIGdlbmVyYXRlZCBieSBvdGhlciBsYXll
cnMgYmVmb3JlIHByb3ZpZGluZyB0aGVpciBvd24uIFRoaXMgaW5jcmVhc2VzIHRoZSBtYWludGVu
YW5jZSBidXJkZW4gZm9yIGxheWVyIG1haW50YWluZXJzIG9mIHRoZXNlIGFsdGVybmF0aXZlIGlu
aXQgc3lzdGVtcyB3aGlsZSBtYWtpbmcgdGhlbSBhbHdheXMgZmVlbCBsaWtlIHNlY29uZC1jbGFz
cyBjaXRpemVucy4NCg0KTm8sIGl0IGRvZXNu4oCZdC4NCg0KUmVtb3ZlIHN5c3Zpbml0IGFuZCBz
eXN0ZW1kIGZyb20gRElTVFJPX0ZFQVRVUkVTIGFuZCB0aGUgcmVsZXZhbnQgY2xhc3NlcyB3aWxs
IGRlbGV0ZSB0aGUgaW5pdHNjcmlwdHMvc3lzdGVtZCB1bml0cyBmcm9tIHRoZSBwYWNrYWdlcy4N
Cg0KSSB3YXNu4oCZdCBhd2FyZSBvZiBtZXRhLW9wZW5yYywgYnV0IGl0IHNob3VsZCBqdXN0IGhh
dmUgYW4gb3BlbnJjIGluaXQgZmVhdHVyZSBhbmQgYmVoYXZlIHRoZSBzYW1lIGFzIHRoZSBleGlz
dGluZyBpbml0IGNsYXNzZXMuDQoNClJvc3M=

