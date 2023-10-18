Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB7CCDB47E
	for <webhook@archiver.kernel.org>; Wed, 18 Oct 2023 15:27:47 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.78])
 by mx.groups.io with SMTP id smtpd.web10.284542.1697642860109147611
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Oct 2023 08:27:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IUNyfd3G;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=IUNyfd3G;
 spf=pass (domain: arm.com, ip: 40.107.6.78, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Enyle14Hk++WKOi5Zd57KlyVOhtkKg5FJe28MmDHpHo=;
 b=IUNyfd3GLkXbf+Ma0ztBFOVe5H1SLzaP7fCr2sHnjTUw4wSYGZoYFH6qN+4pvNekeK2usb7/6fl8H0FpEwV7SfqT4T79a+BCUby/wjf53wgV65xetxIk4Xqm6bY247Sjj12ttguH4wTEWcIbvftlcX3Zgn2M3oeZjbup5EU+RlI=
Received: from AS8PR04CA0153.eurprd04.prod.outlook.com (2603:10a6:20b:331::8)
 by DU0PR08MB9322.eurprd08.prod.outlook.com (2603:10a6:10:41d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:27:35 +0000
Received: from AM3PEPF00009B9E.eurprd04.prod.outlook.com
 (2603:10a6:20b:331:cafe::18) by AS8PR04CA0153.outlook.office365.com
 (2603:10a6:20b:331::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 15:27:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM3PEPF00009B9E.mail.protection.outlook.com (10.167.16.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.21 via Frontend Transport; Wed, 18 Oct 2023 15:27:35 +0000
Received: ("Tessian outbound d9a8e74be042:v215"); Wed, 18 Oct 2023 15:27:34 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9b5602a0fb8d5ad5
X-CR-MTA-TID: 64aa7808
Received: from 7eade3399760.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8AD53D53-561D-432C-BCF7-98B8818112F8.1;
	Wed, 18 Oct 2023 15:27:28 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7eade3399760.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 18 Oct 2023 15:27:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiyFpQaABoTiw+wsiEKBYXFdNBDt6IBQOzPGRRRdvn6hTVqTW+M6HZLRVO5kAAz26vC5TNKJ+WLf826vJkjbGVSxJ1E+mJer8XvfCbdFdrOeUBWBI4qGwWZPMW2I21UXl3HCTjeZmDxUWPdLKA08Y6hV5Vug3xb6T0Skp2a4bOB2gQ1dmXBuwEUpv9cm8YwVieCGDdMsVY0NMOAK/E3zw2uBMlRYXrtA20Z6tmO2svtR7qIad+kk4K8L8uHxZmflaPXySzxB1VR5/SAZsSOBfBGFnu6fF2744QGsKo90ZQNLJ+MQdu+SpwewVBqhW65GmsyNvApYJVa/8yte7Aq8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Enyle14Hk++WKOi5Zd57KlyVOhtkKg5FJe28MmDHpHo=;
 b=iLQH7DMGOapXhtVWbImt3l0ZJf1p90zNaztDCHEqSbyroOgKeAWg8zmuaXIDc8pZe8r3Cv7nHGTlKdIpamQwhxwXXP/cFlqAclgttNj9OEBXXv8VFIJApHeBCTSBn0ScYkU6L4gxbIMZQYfjvRaAiKlZ9OtEtWs9jgcaxZtIlCMqOHSR1GPVRDM5DTdjymDnAs/gRLm06/lIJGLdarZQfTfxro2djybi1PaQ/VWV4OGRzTkVzOrAca4TecDAgDX8M5wNiAP9hLpzKG1a0QDinZWKLk8NrNL12LXlTcFkM0OXIV1O1jGsZUUiXyQK1Mi3RPwQm8Aw3CXf9Xq12b1jpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Enyle14Hk++WKOi5Zd57KlyVOhtkKg5FJe28MmDHpHo=;
 b=IUNyfd3GLkXbf+Ma0ztBFOVe5H1SLzaP7fCr2sHnjTUw4wSYGZoYFH6qN+4pvNekeK2usb7/6fl8H0FpEwV7SfqT4T79a+BCUby/wjf53wgV65xetxIk4Xqm6bY247Sjj12ttguH4wTEWcIbvftlcX3Zgn2M3oeZjbup5EU+RlI=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB8737.eurprd08.prod.outlook.com (2603:10a6:10:3d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Wed, 18 Oct
 2023 15:27:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5%4]) with mapi id 15.20.6886.034; Wed, 18 Oct 2023
 15:27:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Samuli Piippo <samuli.piippo@gmail.com>
CC: Vyacheslav Yurkov <uvv.mail@gmail.com>, Martin Jansa
	<martin.jansa@gmail.com>, =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?=
	<peron.clem@gmail.com>, Khem Raj <raj.khem@gmail.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Thread-Topic: [oe] [PATCH] Revert "protobuf: stage protoc binary to sysroot"
Thread-Index: 
 AQHZ88PJicwuzQ9u/EiKck1IajUDGbA0GosAgAAlnACAAHd7AIAABaiAgACDrICAEOC0f4AJdA2AgAAx5IA=
Date: Wed, 18 Oct 2023 15:27:23 +0000
Message-ID: <B44E7E80-2B09-47F4-9F8F-4741F4683197@arm.com>
References: <20230930173003.3210-1-peron.clem@gmail.com>
 <4b4d6fb9-3034-46df-876c-81c534e4c801@gmail.com>
 <CAMKF1sp+ZiEfFhOOOvHbKBoRMA0fWeRpXXh9-s1uuY2qcO+PcA@mail.gmail.com>
 <CA+chaQc6z6MasEHbKUr1s+VKEO-n163T5WqAXHeXHXeXkC0wVA@mail.gmail.com>
 <CAJiuCcd=uZ+eUt8Brj-y48Gewy3=gzmDTOLdKrkhvZebZsSD2w@mail.gmail.com>
 <CA+chaQez2kfNHw4f3NK0ft4kagtfqsQTkoO=2DRQA63j2Kdn3A@mail.gmail.com>
 <178A5713556C6E82.9230@lists.openembedded.org>
 <9714b98c-66b5-48bc-a00a-69e1634b0307@gmail.com>
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
In-Reply-To: 
 <CABXoSoVp=45ccqwzQXFF1y=fjcwCGjXh0HiuLBAE-UssDzf5Yg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB8737:EE_|AM3PEPF00009B9E:EE_|DU0PR08MB9322:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f2ddfd-618c-4d4e-6d07-08dbcfeec10b
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 E7mqe9eVFXEJIwKiUIbrQ1AydmN20kkWWXJOKd1cbof8c5H98e1zR5y3wkNhps/cdmG1Yc1aGOgYr38bjw+yyJRqAF8fe4ldKwMk+exflKc+ALhcaPkf2YKaQzyzYg1bI4VzKrLg0JK8Ew+Ze3/9MRzPRlB7on129dK20Q5Dq52BgV/yPaSlVflMxI9S+EEv2oalFZ6SgH+f0KJp70k1pkl6oS+sN87yaFZJ/Me+zKjUQ809czQzeUtRisFf2MaCNjeDgHqHOXQllNva6O+vzWUbfQP3yopZ694KPE3psmBS/dqc6eJoTz0V3y5troz+8sDtRCBjrvZcaG4q+T6rqID8/EPeBk0aGoX7bgAnb9vD9ADJngaKQUEQPWiYsxstyTAqBo8bwrQ7c0+G3lDGmUUxUyn4uPWR9uRwlq+4dG7zh3kq3XntlHW5YvXiAX3H7/oOEwD+MRa+l8FecTB4kHNtnwaqDABoLFyNWMG5UhHTc60eiQ55WB0YwYBTNTvL8xZId0G0NTrzCOSw3ikRKryJfkD9RI6ivmZazbzaF8pmiQ673eMXloEwB+djDKUWg6mje+na2A/SRhUMG8ICiBPYIVVX6Uet4l2x0MYajE2mVMLjxgm+crnGhzWZMPAUEHvoNrNNIflVVRbzDWxFVQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(1800799009)(451199024)(64100799003)(186009)(4744005)(122000001)(38070700005)(8676002)(4326008)(33656002)(8936002)(38100700002)(41300700001)(5660300002)(86362001)(2906002)(6506007)(6512007)(53546011)(478600001)(6486002)(71200400001)(36756003)(2616005)(26005)(66556008)(54906003)(66946007)(91956017)(6916009)(76116006)(66476007)(66446008)(64756008)(316002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <17AC5CDC43AB104BA42D21997109D6A6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8737
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	f93ac537-59f2-4e45-0c74-08dbcfeeba4b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	x4DwK4Ui+BqQc9HvEOgs6OQMKqhwpCq7hVCpaYjVEMQn4Q35kD1LmwFEP0BOov7OB+pSU7a7SQdt0Y+wm5/AlY7aogpadQ4w7JNww69FiaoNNLlDjmn+1v4YaDIGDI9DlJ0AgOS+0qtP9lN6MgcSxa9dFPeWfc0EmTkNiPTCWZdGi87xjMmvdEgarieYXV2NUv4aq8e+DnJbXF//+GA3kQCB6aS9kR1cuC4BXIgRphQj7CQZaYwI5uPUvJo/CnuP99ia121ttErYWm56kg7/w0iFabP4vEVam/GzTVXAx40i3NIf6ueDTN4xvHWZNlw/Yn2fWG4lGsFiC/WtpBedTWNfXEMuoUcrHgVIm9LsW+BVSEeTXxWHxcnmuCzN+gEmyD9qUq0z9YiGnkJJy/L98v9QWOl6TSluXIIpF0EQWzZOoAX3ZaEpEJ+R83AfCpNI/Xn1Jz/8172ZpqEG8xgJN6Zngk1GLYW4CDIM/bvlmtkYGvFp5FdSccZ8smQqpxlWSJk0hDJ/UWzN38xNasOlDWBMQU0EptV5jWl2X/JnPZJxurf6fKKjhvDyXdozAp4cX/30f+G3+xZu21wfsrFw7nHdAvhawvp9yyy8enOP7a2QxvrxTLCT4j0KznNLJFQnmclwYw4Ndto+mDL+2/jT63KpCvSBAAgeikzJEBr3kcepFooZ0C3Cvv7l6QES2VAOQqwFjh675bX5Ptv1kIWrxY95CzwKcfqHn58oGz1IOykqpRgXXI4uoNJjpBY2Vlil
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(346002)(136003)(396003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(40480700001)(36756003)(4744005)(2906002)(6486002)(4326008)(8936002)(8676002)(6862004)(40460700003)(81166007)(36860700001)(41300700001)(5660300002)(316002)(82740400003)(54906003)(70206006)(70586007)(356005)(6512007)(2616005)(33656002)(6506007)(53546011)(336012)(26005)(86362001)(47076005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 15:27:35.0505
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f2ddfd-618c-4d4e-6d07-08dbcfeec10b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9E.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9322
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 18 Oct 2023 15:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105577

T24gMTggT2N0IDIwMjMsIGF0IDEzOjI4LCBTYW11bGkgUGlpcHBvIDxzYW11bGkucGlpcHBvQGdt
YWlsLmNvbT4gd3JvdGU6DQo+IEkgZG9uJ3QgcXVpdGUgc2VlIHdoeSBldmVyeSBwcm9qZWN0L3Jl
Y2lwZSBzaG91bGQgZml4IHRoaXMgaW5kZXBlbmRlbnRseSB3aGVuIHRoZSBzaW1wbGUgd29ya2Fy
b3VuZCBmb3IgdGhpcyB5b2N0by1zcGVjaWZpYyBpc3N1ZSBpcyBhdmFpbGFibGUgKG5hbWVseSB0
aGUgdXNlIG9mIFNZU1JPT1RfRElSUykuDQoNCknigJlkIHNheSB0aGUgb25lIGZpeCBzaG91bGQg
YmUgZG9uZSBpbiB0aGUgcHJvdG9idWYgY21ha2UgZnJhZ21lbnRzLiAgSXTigJlzIHRyeWluZyB0
byBmaW5kIGEgYmluYXJ5IF9pdCBjYW7igJl0IHJ1bl8gd2hpY2ggaXMgd3JvbmcuDQoNClJvc3M=

