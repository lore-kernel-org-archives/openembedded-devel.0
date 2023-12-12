Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17129C4332F
	for <webhook@archiver.kernel.org>; Tue, 12 Dec 2023 16:42:55 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.43])
 by mx.groups.io with SMTP id smtpd.web10.1158.1702399368954036603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 Dec 2023 08:42:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yGMHeX37;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=yGMHeX37;
 spf=pass (domain: arm.com, ip: 40.107.7.43, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bfuErhkxXTJN9MW/4IEA/XBULgC8//c4m/WaoV2+AUUBi0/HG9znKkIhVlC6RpDv1gu8p72XTdGg9bSbLS1zcJ+Yv97Iyf+O6mb+48ux81EX1BsUUPCzLkbkkbT5ovp7OXYS7RxItvQX50UlEZwttTuDNKb03DJuLrwSmGklO+wl3FOE4q6ofDVFwZHZAwAg8yL0mZjXFsdejCChKSCfuyu6XyWV0cZgfMzzqNq/8NlXdYH5m5cEyOXeU6KXNewUg0nwp0GMMqF/34Aezu80X6Y9Z1249NIBvxAuhIAsPX7ubnDF3Kb4vgZDaaNFAnb2/JPK82nb0ietN+r7U31vuQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3dtwoJuveYkDwen9joQgJkm9O7tvNCFI/hMr2ebPJU=;
 b=WzXvhfZystyU+7vzzomzthJwhgS8jdcuVK3x3UhvCWg5zlniwKxGykC2QbqCGPCBdcZAyAakXvrEbLYaHTKYEakBuzzI9OfvHSNEpOJtkIup79HL2OOIwMJTdYqOWT9xkdxZ5TLVZUniPMszomjtRbg62z59eW65BCF0xlSFI7oiruyad6xpaQffReZhGYlz9uHO5GVXD7Zp4lAZ6MJ6ge+q/R44iLFaYpl2sI5pfGmGbHZswcrCYz+l6Kwe/RhMak7Q2Jt7w+3r98K15rPlDsOtwpCFMqUkEOyr46HUva3VkYE9wMuMFZMBNaHxeg5bGVXlVdkJRzHK5mQS6CuRjA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3dtwoJuveYkDwen9joQgJkm9O7tvNCFI/hMr2ebPJU=;
 b=yGMHeX37Zz8D6I/hPrpRWNGU6d0g3kRmptAaUmK0DlpyZf2ljrTYg991wXUuoSqtO3GZORMlp4aqCANnTsJOF/lpJuk3Sgu9cvACB7gEOT+EvaZRXUvhtz5xEdICBosdyylhWU7vL23sLXijC1SbrmoYqH49OQzf4N6ZY6Eajyc=
Received: from DUZPR01CA0255.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::27) by DU0PR08MB9678.eurprd08.prod.outlook.com
 (2603:10a6:10:446::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:42:44 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4b5:cafe::58) by DUZPR01CA0255.outlook.office365.com
 (2603:10a6:10:4b5::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33 via Frontend
 Transport; Tue, 12 Dec 2023 16:42:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.18 via Frontend Transport; Tue, 12 Dec 2023 16:42:44 +0000
Received: ("Tessian outbound 385ad2f98d71:v228"); Tue, 12 Dec 2023 16:42:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: bbfa47621dfe649c
X-CR-MTA-TID: 64aa7808
Received: from 0c1e13d08f13.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 34AEA493-7D05-4FBD-899E-768493C56DDE.1;
	Tue, 12 Dec 2023 16:42:37 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 0c1e13d08f13.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 12 Dec 2023 16:42:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AoS3gVg+CLyAX0b1Ku1hz+9u36ad7FQLc2GXawvrPLQWgOZCUdfeT+eRLGPWu+yN+eohqBKJrzKNhcipSMJ+bYprTc8rk/cR5fpz3/ammYFxkVHjok1eLTFWshcFrb/KDqSlkvPTrZGkOG5fkOClkkcS85ljpZEH7gA+HYez2dhmIjxjQQyelVB9mCPhqPyrpyMps1Q4BZcznoJT0B65Mq9ZUR9K1uXrzjFTnh+UcyYEE3qEkhXtjevHgHWCY7WQZbL4A8Za0WaSjnJZw/9LqiBUwstc8hiqbCMxZYbupvZAVpuUDnDPnC6w7yJZGhc73Y7GXiSWW8BOvvMCtFggkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3dtwoJuveYkDwen9joQgJkm9O7tvNCFI/hMr2ebPJU=;
 b=J61MZv/kStGw967RqCpP8cjsrbaZMuPjWZTut77G7mIZw52iZXfg774zNe2X5+7RSaYaElkSa/QaO0+/gfSTvxT0VIINTJ1jccPefU7ERvDIlQkL4UHaTWN2x9Snuo/zl/OzBxTj332gobvnGekbUxLokSkT3YjOrnmxXbAo+o4m3v4D6qibhC7kagm4ucIwMIIQoLK0RI3MRINPGSQeVQdqVZkatiiDbi0QtDJ7fj6jFS8HGJeUzS4cOKvF984Ga11kcYbcETR3Kw8W7lNXQX5POH8OZ9AyEsbyvVBTaRIyRC0bbS7amPaw0YXHtvuNAbFPpXPsd+l02qkcnSVfew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3dtwoJuveYkDwen9joQgJkm9O7tvNCFI/hMr2ebPJU=;
 b=yGMHeX37Zz8D6I/hPrpRWNGU6d0g3kRmptAaUmK0DlpyZf2ljrTYg991wXUuoSqtO3GZORMlp4aqCANnTsJOF/lpJuk3Sgu9cvACB7gEOT+EvaZRXUvhtz5xEdICBosdyylhWU7vL23sLXijC1SbrmoYqH49OQzf4N6ZY6Eajyc=
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com (2603:10a6:20b:4e1::9)
 by AM0PR08MB5490.eurprd08.prod.outlook.com (2603:10a6:208:184::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Tue, 12 Dec
 2023 16:42:35 +0000
Received: from AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::1fc5:537:c01c:c887]) by AS4PR08MB7429.eurprd08.prod.outlook.com
 ([fe80::1fc5:537:c01c:c887%7]) with mapi id 15.20.7068.033; Tue, 12 Dec 2023
 16:42:35 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Robert Yang <liezhi.yang@windriver.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Subject: Re: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error builder
 aarch64
Thread-Topic: [oe] [meta-oe] [PATCH] minifi-cpp: Fix do_configure error
 builder aarch64
Thread-Index: AQHaLNobhA1bLkdDrECy1oZrw4/DPrCl2qqA
Date: Tue, 12 Dec 2023 16:42:35 +0000
Message-ID: <04DE494E-01A3-41BF-9E0D-591DF8ED739E@arm.com>
References: <20231212093804.1012506-1-liezhi.yang@windriver.com>
In-Reply-To: <20231212093804.1012506-1-liezhi.yang@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.200.91.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AS4PR08MB7429:EE_|AM0PR08MB5490:EE_|DU6PEPF00009525:EE_|DU0PR08MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: a1444393-7019-46d7-6b70-08dbfb315d8a
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FaPC4SZBOVkf+xwPdrBroTHNe2sa0/25wA3Kz2NdvzKpjGH4AgssPhHAAnUDvPWJ0nC1bMv4Hf1OsxXE7Eji2iuBqhKe316rNKVCnWxrf26b4jhPM9mTFnd+RJ/+XRLCo6V/kcGEOW9EvxP2Gl14JPBbB6Q/xU2Rs/75/gQOnw8100osV473/ODlJHYKH/EFJyWXKl46RxfOZMSlPRXKHgLqiC57UlVkpIqkrxlljGco9j7E+Sn4cxeq5A6/HX2YzNLvcbVSNQBx4gx15UQ6pc3bB5Kt8bJD3tZgpj0q3t9JUnrg23lTeqp/z+2yjftC7HXq5MUXHgvadHMTNHmqt9JuY1GAik9vwiRAuLHG23EfmwTDbQkYD84zCv1XyylSivuzd4BdBWOCBM9V8FqzgSGDDvltc9Zw6Ru53+MVbqu5y1PoVInq1rXMSDX3wXwJhMNMx9ry4Nk6zBkeWT9nsGec2HWCP7C+I3TYioodUNV77Ad7uUdTqQMShaxODzJ7Z277Pjcu7c8YqsbpbP09E/0lZeDSErecjFiOyVttiknX7ABNvJcPHkZ4l36Dm3Ormrl9h2G0RtzDZGNld7JrrXCYx+ZpZmCMdk0W26t8E/u5JTHiY2eBA5oBr8CetOP8LPSEqCvoyfveGorzEZfQvQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR08MB7429.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(41300700001)(122000001)(38100700002)(8676002)(71200400001)(316002)(8936002)(86362001)(36756003)(64756008)(66446008)(66556008)(33656002)(66476007)(91956017)(76116006)(6916009)(54906003)(66946007)(478600001)(6486002)(38070700009)(2906002)(6512007)(4744005)(26005)(6506007)(53546011)(5660300002)(2616005)(4326008)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <E72F9DFE3D4AAF439D7364E08DD1294F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5490
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7501c300-a660-440a-5c7e-08dbfb315856
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	62doLdQbWZ1xVgj6LdMnmqvAt6VcKtLVdw45D175FWdxYFvHdGgoF25lHmMbovYwUNPI1IulrqpcPwNbeAFr4WblphUfrgxlHjmyEb61YQnslSJjEc79gpEjlZx/VNA+ftqGpxmSe1DAgCaM3OXXeJWDPYiYMuiNVEfCkzPs/0dia6HFjU4f5TgWELKtY33lNoHnKwCK2UHtFCpklU8xACp84xS7kqz/sKT8wGkyM14UlWEEXPRMt+ju22Qz1FqycKTFKmP4RS8aN4WyuRi3yFXwKjbMZyIz5K+dTr2AI0rtI2KTcUnp2bTWifgWkiWVzf5lKXpPtZBPcDvlCcePI98A9TT+u7D4FspoLlQPay/4M75Xv5y52DHEcA8xGiBOQbCvsDyl0xg2zQYcFTT7fLidRyfUyMliTzheXmu5wsWb3nFy3uKVl8j8hbgffls04bZ1GyK3y7rV7mNNEfBm+ahsso2XmGdj+BNhpq1j7+5il7TpB2cZ5YQrIkdPyfS2OqRhdA+4XTTIlRxy/duP+UknGAZyfpadDhSscGa0nCYkt0EwJdJfmNtfbOBe7ZRiMe/FEKb4PyTJ+CucnqF7g6WT0scSB8uvWokmNYusX1y7CvstRBIX2pwF4lD3SQZpSWF3O2bdHnBmrG0ei5RPp4Fxtr+/sTjBYFyrscB0Xg4i4llwLYufLuasxg6/mBsqwvpiEgAxls2ny8f7qmNW+5Fo6tCgaY7S26n/3wxjz0I=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799012)(64100799003)(82310400011)(186009)(451199024)(40470700004)(36840700001)(46966006)(40460700003)(336012)(26005)(107886003)(2616005)(6506007)(6512007)(53546011)(36860700001)(47076005)(5660300002)(8676002)(2906002)(4744005)(478600001)(41300700001)(6862004)(70586007)(6486002)(70206006)(8936002)(54906003)(4326008)(316002)(81166007)(82740400003)(36756003)(33656002)(356005)(86362001)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 16:42:44.4222
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a1444393-7019-46d7-6b70-08dbfb315d8a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9678
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 Dec 2023 16:42:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107336

DQoNCj4gT24gMTIgRGVjIDIwMjMsIGF0IDA5OjM4LCBSb2JlcnQgWWFuZyB2aWEgbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZyA8bGllemhpLnlhbmc9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnPiB3cm90ZToNCj4gKyAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNvbmZpZy5ndWVzcy1T
dXBwb3J0LWJ1aWxkLW9uLWFhcmNoNjQucGF0Y2ggXA0KDQpJZiB0aGF04oCZcyBhIHN0YW5kYXJk
IGF1dG90b29scyBjb25maWcuZ3Vlc3MgdGhlbiB1c2UgZ251LWNvbmZpZ2l6ZSB0byBpbnN0YWxs
IG5ldyBmaWxlcyBlbnRpcmVseS4NCg0KQWxzbyB0aGlzIGlzIGEgaHVnZSByZWQgZmxhZyBhcyBp
dCBtZWFucyB0aGlzIHJlY2lwZSBpcyBlbWJlZGRpbmdzIGl0cyBvd24gY29weSBvZiB0aGUgdXVp
ZCBsaWJyYXJ5IGluc3RlYWQgb2YgdXNpbmcgdGhlIHN5c3RlbSBsaWJyYXJ5Lg0KDQpSb3NzDQoN
Cg==

