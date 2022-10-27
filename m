Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A11FFA3740
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 16:11:40 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.66])
 by mx.groups.io with SMTP id smtpd.web12.8407.1666887095201962064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Oct 2022 09:11:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=L4gcQcRm;
 spf=pass (domain: arm.com, ip: 40.107.21.66, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=b3Ipi1aymEbz5O//LL9L/nqDocEKH7sgohOdC2x0ZLZ3ER0tXuSUkzXDZnLgIDlu7fpLXkiCZ/+mTA4+jwRgavJz4PD+8D0EwpfcHErZnp7qy6QpGB6y45Lfxuywh6zfpgjyd55TF49scrF6Du5ps4kRhPnlhCEAXKCHWYjmjJjrE0UtUy+6NyWMBjJa0QOHBc8wa2ETfvXKFiXKSVyTOgwGuQOe/dLt7DKjnBImNjKp/D5dq9h3FFupmoKnCGOYioavD/elbOYoAln/UqxxuhLluux2w5DjpsZ50XeCZwM7VXFdnKCgGCwmkvEszALq1h6NmZPntUO7LxaM1S1V2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uM3ltIciqhKxXcNgbzteqPLLZlUI2ZkOP88i6/iiDo=;
 b=dZSiI0JwoBngMPE5bxUNdeVt5olfzUbiyWub+Ag+T8nHrxmA3QmNuKBRAlK8YoAdoDm43e9ml7VLVMyuM40qyikFZ1DiWnxcy8sSRScl9CjIkKZ9k4MH3RgT2oZDiacFIJKiHRcEINrrDaclgx/BzS/2kwEyUDy0zpvzfH8efgRsROLvElWseucNIyDD2+chMhItIaFU2wBPxeZrzMkLcqXl37PanrBCN+/59mkocStxZwdv9i17Pz0Uw9HoKx0REWDipFDeASh+dDRy2d1kwp35Wj1tM17p75RaLWsHsK7PFiswHxmKCSmN1jnvJ9CaB/baJ3hE1OVm1NcqwVpTug==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uM3ltIciqhKxXcNgbzteqPLLZlUI2ZkOP88i6/iiDo=;
 b=L4gcQcRmDHh2MzbhW0CeculX3PTVYmqYgE4lz4L40nCGckljgF8lfeNHSGoLkCG9TX0mfbPiRf73azbXv8KeXIXda0bggVkK0uaCyijWxn577D0N6tNSmjhrDLr1qEzB1tLCBSSjucvIEJirfZUAOR5wWoNGSlg3zkZsVQOjl0A=
Received: from AS9PR06CA0678.eurprd06.prod.outlook.com (2603:10a6:20b:49c::21)
 by VI1PR08MB5375.eurprd08.prod.outlook.com (2603:10a6:803:130::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 16:11:27 +0000
Received: from AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::97) by AS9PR06CA0678.outlook.office365.com
 (2603:10a6:20b:49c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28 via Frontend
 Transport; Thu, 27 Oct 2022 16:11:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT040.mail.protection.outlook.com (100.127.140.128) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Thu, 27 Oct 2022 16:11:27 +0000
Received: ("Tessian outbound aeae1c7b66fd:v130"); Thu, 27 Oct 2022 16:11:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2f14f85caef33788
X-CR-MTA-TID: 64aa7808
Received: from a25933555314.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 514AFC1B-FCC3-450B-A750-5221030224DC.1;
	Thu, 27 Oct 2022 16:11:20 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a25933555314.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 27 Oct 2022 16:11:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A+O/IZ+aPx2asyNjiuNiZVCiDCtWrrOANXaFG+XWe3/tw8k/3K/I4jqJO1AEHwZn74bTf9FdvOkvlNGoopUPNS45erBB1FKWw1NnRQoS2UPJs+lHkL6kmPczD46XToPSSGFbaN8MSAkTlpuSGiZROd5/WjUUZqe0v6x5hHWsOQa3QFXLSomfqUyimZhsXDberQ51PcgrqYmX+NV0mgJhlxgag5UzcO202JiwoT+frt1XVcpWbDe5seziuhZ68gvKrOoMcFPwUi3dOBI6lyjf9TH6SF00LRt0STWzxISHVvtsMHKhxqiiYCPHoIuCkiLAHTicdzlUpNwbO51CAZjWWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9uM3ltIciqhKxXcNgbzteqPLLZlUI2ZkOP88i6/iiDo=;
 b=lKU8DsTf0qw4x2RjzoHy13ScoaSu4O+FBjCZVytty7PxHF1hIKDvey70ouLSydRzWkMmY5U+6l9ew8slcd7PdETJRrUTJCPb3LVapGiBOLneXhTY3usKFs5Zv6PFbTwY+/OOi4nvS0i+rbqUNH8ekcpxOj6YjFEfPfPuZSW/LG3apiLKdif/iNG2EP4QFKpdTmKs5zhMvyoYtIFZbjgnywXXrAl8Rhy7dzteAaH/V4BaYcQvYR+fdm1GjlV0opMbRBoFRz3zp1fdeCSKCPca7Gk8rReQjruY9ni9gukmsNu1T9CDlizDOy6vtSOHnMEXTt3Tt9xAJRlr9yQgg0Q/IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9uM3ltIciqhKxXcNgbzteqPLLZlUI2ZkOP88i6/iiDo=;
 b=L4gcQcRmDHh2MzbhW0CeculX3PTVYmqYgE4lz4L40nCGckljgF8lfeNHSGoLkCG9TX0mfbPiRf73azbXv8KeXIXda0bggVkK0uaCyijWxn577D0N6tNSmjhrDLr1qEzB1tLCBSSjucvIEJirfZUAOR5wWoNGSlg3zkZsVQOjl0A=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9026.eurprd08.prod.outlook.com (2603:10a6:10:47a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 16:11:19 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::52da:ac9d:e42d:8cc%5]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 16:11:19 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "JPEWhacker@gmail.com" <JPEWhacker@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-webserver][PATCH] meta-webserver: nginx: Add ipv6
 support
Thread-Topic: [oe][meta-webserver][PATCH] meta-webserver: nginx: Add ipv6
 support
Thread-Index: AQHY6g9lKNvgeG7dKE+GDcoXN+Kqda4iaV4A
Date: Thu, 27 Oct 2022 16:11:19 +0000
Message-ID: <8459D7BE-DA2F-4EAB-9E61-2ED447F7EE6F@arm.com>
References: <20221027142043.177983-1-JPEWhacker@gmail.com>
In-Reply-To: <20221027142043.177983-1-JPEWhacker@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9026:EE_|AM7EUR03FT040:EE_|VI1PR08MB5375:EE_
X-MS-Office365-Filtering-Correlation-Id: 93bbadbe-5897-42b6-b14c-08dab835e6da
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 Mm6EquUBzZnSjKV/jGAghJy3HcDFI3eLvcmdILhRijeiKcS87n14JH3PEiHYBvwMtQksvt4dDtxqoi32QYLMrUhJcR9+1LQkWOiVAGdS1tihSyQkH6rlv+fAhVqziAVHxjiRvaBp0V/rb0CsGLpVMO4wt8a1tI91QRz1Kkzw8g4BnwQ/BzUvWy1p+tDEAkozn7X/SRXNGCLuUVXxhmwlRfivEn0cM+8PhYlb3NiwwzTKJw5geFYqklnrKJ9ttuSYRh7IfAGZRwn+OHJr5zMfLmgUt4wrbu4c8Ct9XTs5fNZTdvKjM1Ts3s96kb486gUYyq4yvZ068pl0sTGX3dBSFGUf+8gTyckWFkW5JtuDLOx4zNZ5b3oyLYShQGgaqdvUPjNtnBop6VB22jTf3+G1GhACzrHw8LI2R+hjRkjt7/B5/SFolbiI5CQNA6T0FY0JZ7pdwGnV9FQpqOpts57JDOgrWbbOuXh7HCZ9WCEMv32gty/rBUHNS4+TwTB3HHjieELjKPX0hbOoAC+GgnytJftzGHPzqQa5xjosj2KCubYEo2suBi61WID7ctf9rZgBTwO+7O6rh54NLcYc75aK1vw2up8zvFtmkRCjN5zym7Ya0Mi1KS/7kKlwINKGyfLJbRngZJqgykO2HibDe49R0pZST5IryimQzSHvx8GiAdCNDUKqfbWE/Rmpvn83jY2jtZlrM76RD72ZVHlaEsg0IuNQDQV5XRtlCYKVhAjyHtl7BuN7Y/zGchLkRHHHqlr09wzFH63ZTatE4kERnLkfeD3gTEYpYsXy+KxEyNxDjio1PBGBaVUGVjuyn6ASUbqCYnnhjx31Dy8ooNALsnQs0g==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(83380400001)(186003)(38070700005)(122000001)(2616005)(38100700002)(2906002)(4326008)(41300700001)(66476007)(966005)(76116006)(478600001)(86362001)(66946007)(6506007)(53546011)(64756008)(6916009)(66446008)(8676002)(316002)(8936002)(5660300002)(91956017)(66556008)(71200400001)(6486002)(36756003)(6512007)(33656002)(26005)(66899015)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <B16B2FDEFAC3DA41B77DDCB22E11D24D@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9026
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	d05d5207-e926-423a-652f-08dab835e218
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KaHwOUNbvz5dddAcKxpUV5PxNigmN05YTflTKAR+3emEEYpruWOPLUTmyaY7gAMJQT7QQfaAGXQ+XkzhagcrZ6BvQCEkUr3hYr9fvp8xlFmxS3fk0820UGb2ertYGPfqaRXkEa+/dVjScgtCx+wUAHKFhNoo+jkxE4L3cHWWRcDKgEoKRivjMwjVJKtsB2R1yWpQFWe2Rf17/58NFMZi6Vy+Od6grvk70XJ+03lQnY3HMOQdlIidyzVnrJ2YHVfzJyMawSKU8E5GUmIRm+7c3UkXvF1VU0bOAWoFQaxfDIWA81P4WV10q7teMXGoSKj7zWkq0CxiyPvJRZf7fNHm7i0rolvYflfBJ+P7R+YCmw7V5OSb/W2w7LiZdewkQ1yWBIRDhLjyEZRdOuBLYu9gXpYh31yYPv4b6K/vnaMdjd3alaMIeevccIAQPxr5H7fku9uK5vQFkG4mE0eiTDTg78ele4YVjzA2J55vkf7Z0uzNr+IBr6Sb54haSyhcGp5YUMGMB7XurDLCrBigEmL8jsN727HV5ZtSNoeHMod7nlWDUvDpUaB4NslFn1OTavls8F8UaOGeDBfvcxez4rxY82nkVa01s6hn2aUYw+WW2PDEQvmODMU2pSKyqAjUdIy3iW33Wpj2p/J8UFTSa3b/xCw9jiPtpphrwjRH8Pf0mY6T+4Zd5Zl78I4sIDB7pru7qsE6a6f19nohL5WLGdmvYhvCa3kVXOUOjA6SmpgJv1GiCOflyBvjI1UcFKsq9nlPobn6yWagONHgl8zmUVmdfWMQDA9X7K1MRBIOdkIlARQ=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(66899015)(966005)(6486002)(81166007)(478600001)(82740400003)(336012)(6512007)(316002)(86362001)(83380400001)(356005)(4326008)(6506007)(8676002)(70586007)(82310400005)(47076005)(53546011)(36756003)(33656002)(70206006)(2616005)(41300700001)(186003)(5660300002)(40480700001)(2906002)(26005)(36860700001)(8936002)(6862004)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 16:11:27.1590
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 93bbadbe-5897-42b6-b14c-08dab835e6da
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5375
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Oct 2022 16:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99322

SVB2NiBpcyB0aGUgZ2xvcmlvdXMgZnV0dXJlLCBzaG91bGRu4oCZdCB3ZSB0dXJuIHRoaXMgb24/
DQoNCihvciBhdCBsZWFzdCwgcmVzcGVjdCB0aGUgaXB2NiBkaXN0cm8gZmVhdHVyZSkNCg0KUm9z
cw0KDQo+IE9uIDI3IE9jdCAyMDIyLCBhdCAxNToyMCwgSm9zaHVhIFdhdHQgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPEpQRVdoYWNrZXI9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+IHdyb3RlOg0KPiANCj4gQWRkcyBhIFBBQ0tBR0VDT05GSUcgdG8gZW5hYmxlIGlwdjYgaW4g
bmdpbngNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEpvc2h1YSBXYXR0IDxKUEVXaGFja2VyQGdtYWls
LmNvbT4NCj4gLS0tDQo+IG1ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngvbmdpbngu
aW5jIHwgMSArDQo+IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQ0KPiANCj4gZGlmZiAt
LWdpdCBhL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvbmdpbngvbmdpbnguaW5jIGIvbWV0
YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9uZ2lueC9uZ2lueC5pbmMNCj4gaW5kZXggZGZjZWQz
MzMwLi4zMzc5MWVjNmEgMTAwNjQ0DQo+IC0tLSBhL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0
cGQvbmdpbngvbmdpbnguaW5jDQo+ICsrKyBiL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQv
bmdpbngvbmdpbnguaW5jDQo+IEBAIC00Myw2ICs0Myw3IEBAIFBBQ0tBR0VDT05GSUdbZ3Vuemlw
XSA9ICItLXdpdGgtaHR0cF9ndW56aXBfbW9kdWxlLCwiDQo+IFBBQ0tBR0VDT05GSUdbaHR0cDJd
ID0gIi0td2l0aC1odHRwX3YyX21vZHVsZSwsIg0KPiBQQUNLQUdFQ09ORklHW3NzbF0gPSAiLS13
aXRoLWh0dHBfc3NsX21vZHVsZSwsb3BlbnNzbCINCj4gUEFDS0FHRUNPTkZJR1todHRwLWF1dGgt
cmVxdWVzdF0gPSAiLS13aXRoLWh0dHBfYXV0aF9yZXF1ZXN0X21vZHVsZSwsIg0KPiArUEFDS0FH
RUNPTkZJR1tpcHY2XSA9ICItLXdpdGgtaXB2NiwsIg0KPiANCj4gZG9fY29uZmlndXJlICgpIHsN
Cj4gICAgIGlmIFsgIiR7U0lURUlORk9fQklUU30iID0gIjY0IiBdOyB0aGVuDQo+IC0tIA0KPiAy
LjMzLjANCj4gDQo+IA0KPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiBMaW5rczogWW91IHJl
Y2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBncm91cC4NCj4gVmlldy9SZXBseSBPbmxp
bmUgKCM5OTMyMSk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRl
ZC1kZXZlbC9tZXNzYWdlLzk5MzIxDQo+IE11dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5v
cGVuZW1iZWRkZWQub3JnL210Lzk0NjA0OTM1LzY4NzU4ODgNCj4gR3JvdXAgT3duZXI6IG9wZW5l
bWJlZGRlZC1kZXZlbCtvd25lckBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFVuc3Vic2NyaWJl
OiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5z
dWIgW3Jvc3MuYnVydG9uQGFybS5jb21dDQo+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+IA0K
DQo=

