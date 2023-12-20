Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32472C3DA6E
	for <webhook@archiver.kernel.org>; Wed, 20 Dec 2023 12:36:17 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.78])
 by mx.groups.io with SMTP id smtpd.web10.20585.1703075767967999816
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Dec 2023 04:36:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2+ZNkCx2;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=2+ZNkCx2;
 spf=pass (domain: arm.com, ip: 40.107.8.78, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=cVEGJ0HOkMrgkNouhfg7yxWKkg3Glk84epJQLu0nZ+jjXRUFh4EBPJGsCZUZ6OPPE8r/cgZn9YB3EDXWEoQnthv9sNz1nu62tnKLzG0cEmJ8oTBDQKVBJ1AEMvU3/+l+Ey3qkBXbprEvvZ0MIQN1Eh2BqgzfxURwIZW6b/lFwy8PgfEbrIsR78S4JUbMn3J6s95Cj3b7GVTaBP8WonStKco/xD5MHq32QDx+3Ieco6UxyYcM1nR7gMPcf7YzVMFaFnaCtrGsMx+ubPVnZBd7kSxVbHM/AiRv0F6zpqqL0AlPQxXGd3sdUYMD43Vqbw7sMkbDWQtspeFFe2r5gq1+0A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0abf9dcceLabWaiNQZoVsDvRx3CqxKR4lTzdsqSrS0=;
 b=GXcQC5fgxNkhVlBZRp2aaEpAn7gLc/rnVgg5tgOR5xWahnDoZNMlfbphvI6HeiqtSsF9l2OANMyn78f1OdJ+pAAyHHdvFhiDYRX1Av+YzxP7C0yVg80DSuQKUQ/UmqqxtOG4zSBkzqp2iEVSsd4H271nVf2139UKc3FzHqpCeJ7vjnuxlBSlLfDOL7QN15ZY0xPJx61a8Wa9AamJTtJzVlHugMwafQKKzIguEr85KccifTA3aKCrqkOrFk53i7b/3WCNiBq0jjV1RZTrX69x4dJ0xVsRnZy991T5xKOOP9iX6Km3OJAfwUo6pMM3GJqG0Ka5A08lanME4uIspfEogg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0abf9dcceLabWaiNQZoVsDvRx3CqxKR4lTzdsqSrS0=;
 b=2+ZNkCx2SdWfHHa24vkhO9sofgrZdXchrdQqfo67ecfH/O/jONoohr8qDTj4IFchs7x0hqPRe3BPazFR4RUA/WrZHDwefitRzeoQxXoqKp11zJe7bHaUze8jRbbVfeUyfC9o8S8NWbJyfSQsmA2QGtSgSNfWS1J5CjsHqm6w0Dk=
Received: from DB3PR06CA0016.eurprd06.prod.outlook.com (2603:10a6:8:1::29) by
 GV1PR08MB7363.eurprd08.prod.outlook.com (2603:10a6:150:22::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7113.18; Wed, 20 Dec 2023 12:36:02 +0000
Received: from DU6PEPF00009526.eurprd02.prod.outlook.com
 (2603:10a6:8:1:cafe::41) by DB3PR06CA0016.outlook.office365.com
 (2603:10a6:8:1::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18 via Frontend
 Transport; Wed, 20 Dec 2023 12:36:02 +0000
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
 15.20.7113.14 via Frontend Transport; Wed, 20 Dec 2023 12:36:02 +0000
Received: ("Tessian outbound 20615a7e7970:v228"); Wed, 20 Dec 2023 12:36:02 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8212280ddc216c99
X-CR-MTA-TID: 64aa7808
Received: from 1369ecd1847d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 14A1DFAF-7A47-4F12-9100-7E8B3086154D.1;
	Wed, 20 Dec 2023 12:35:55 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1369ecd1847d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Dec 2023 12:35:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QQWz7UhhbPBMhtFEdF+lLktrw0T9IN20749J+vN1xyh9udD7vJYxW4Vtt0k/hI8tTjo+nHz2yx3ZIXgVHUYB74/BneTjxF3dI2kR7aqmIXoFQFzH1Fp5csllx8DcjzAga4bL+BB057keRyzBY14mcNi1yu/PFMCCq5XZJc6O9dHALXieLOummi76Vkb9FBr64t7oVup0xiEkIoD8TqsFK5YkKb5AR7Zybe1qGI6Yo9s9LwA2KPyCDhRKmqWGRGcq88opyq1SdacPRaE4DzFbtM3GQXQkG62RPM3PRNPN+SA9GKgSECBZufllJxkOXziA2VhYZjIJReJqpr2drYibxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0abf9dcceLabWaiNQZoVsDvRx3CqxKR4lTzdsqSrS0=;
 b=HVeqlawyKI29ohvl44jh2zm5BPSPIdpDOF+tR/eqUdyYUohNY7njlUWLZq+c1sFNFjGqecEk5/1Q+GB3/+vQ4srbN/8odJnKEdypWQ3MSpraFnFew3pbygpijRHVSh+tHOMDaBmnynfJOKHGh44HWAO/d2lOewXVTir/Xw85RMU0jdKEqs86w/BEQk6FcuoOjMZpGAq1T0lpi2QzSmsYgABdq0re+ODzJUK0/fxEAg6asfiFGjmtTWlNL55NTg1o7TSW2bohucBbGowlQk5gFTLgWJrFw3UvzCGoAyR/DP7I4PRDfkgs9uzPGDQwHJ04c/hCxnURnswKzm6JF+thzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A0abf9dcceLabWaiNQZoVsDvRx3CqxKR4lTzdsqSrS0=;
 b=2+ZNkCx2SdWfHHa24vkhO9sofgrZdXchrdQqfo67ecfH/O/jONoohr8qDTj4IFchs7x0hqPRe3BPazFR4RUA/WrZHDwefitRzeoQxXoqKp11zJe7bHaUze8jRbbVfeUyfC9o8S8NWbJyfSQsmA2QGtSgSNfWS1J5CjsHqm6w0Dk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by GVXPR08MB10713.eurprd08.prod.outlook.com (2603:10a6:150:14c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.18; Wed, 20 Dec
 2023 12:35:51 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::ef47:2c42:1ef6:fe5c%6]) with mapi id 15.20.7091.034; Wed, 20 Dec 2023
 12:35:51 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "thomas.perrot@bootlin.com" <thomas.perrot@bootlin.com>
CC: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH] networkmanager: fix some missing
 pkgconfig
Thread-Topic: [oe] [meta-networking][PATCH] networkmanager: fix some missing
 pkgconfig
Thread-Index: AQHaMy6vhkXTOxYMnUiWUoRz/n09NbCyG7cA
Date: Wed, 20 Dec 2023 12:35:50 +0000
Message-ID: <7CC98C36-78F5-4EE9-95C0-8D2C9105AC6A@arm.com>
References: <20231220102355.1303991-1-thomas.perrot@bootlin.com>
In-Reply-To: <20231220102355.1303991-1-thomas.perrot@bootlin.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|GVXPR08MB10713:EE_|DU6PEPF00009526:EE_|GV1PR08MB7363:EE_
X-MS-Office365-Filtering-Correlation-Id: 31857d55-2172-4501-b0dd-08dc01583a38
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 PM/W+NGKbblufqT3mDhxkOUdKieiIhxATYuXKy1UgcWGw5iy2j8xDMEH7webaIDp1YnSD4L3t7P8OQQvsTbbUEaYF9qPcwVlwjG8IMzPT2TAf39NY9FIM+94CFISQWR4BGin95qQvNS5lLkvWHZz9XG82+U4tcIb/9Vcq1T2/u4HXuHrApKjcD0y0rHql71llWw3r0pAT/GB4aG7BMR0Ra1Q7lmLYnUIcJYIdm5veCEk9gNl6t002tgftiSdc7jh7wkSN5lIXcR/qoj/Bem2QnwbhOlDzQfCBGsSC966jJXCC6a78p5D8eAejGk01vm36PdCRA8XbwKr9Dd1WB9ELbEGJS8OslUKw3mMzZc7zFBr3IpwkLE1X9oSEIWXqPJnu0UjddGO1gQJC9hUUaT4ANHfnv2W5V3wyFkApmxc1rm/dk74gm7vp3b06Mi5vnNQiPOqx62PTikmTTeuCN1cNOP1AZgKmnh3G33wY7yhfRrq7661D1i3TN2gVRFRfT15dbJzKl4175Gju3w5WWkubEsz6UqpCyknfcUZFt7x4e9BiT8xaN7g4ON221cQcD6F8ZoatjMMdCUXJDEav8ws0Lhfkb/PqkmFDP6CUN3wo6IJbOa1hRSuPdD4EsqF1/v6LKDw4zxeY8ukdFfPDxjzwg==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(366004)(396003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(6916009)(66446008)(4326008)(6506007)(91956017)(76116006)(66476007)(66946007)(316002)(41300700001)(66556008)(64756008)(8676002)(8936002)(2616005)(38100700002)(122000001)(26005)(6512007)(5660300002)(86362001)(71200400001)(36756003)(558084003)(33656002)(2906002)(38070700009)(478600001)(6486002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <16879B93FFBF094CAD40EF9A87D54147@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10713
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	cbdd9247-8504-436e-2abe-08dc01583356
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hc//nFsopajoSJbW2kSgJxXhz7wbBkfB5SiL4mcEmTRGjhfUbObdQXu4BTh/1L6r8t8itqf3mC+H3r6Lviz7HyT9VRsmyz9NXP3gwr67OCRB2m8lO9xT+5zOxd6uD35soOe/dqnh0NaK3CzwRCh9OMgdrS0+H88X7QohtWMuvgUv8kfGvfj5CluCL6tLhsty+IBr5W1wgJ1DXMGPxWD9J0b0lOwsglTBHw6WlAHBxg52yIlQut2WYFe+aYug9Do4wHo9rpVUS5W4uSn/ysZBBrmw1lsMTujjsl+mrG52EITUOFJK+F/CxRKMoVftyINbo8h4e3Mw5/2Ot3x1jESGoE3OTnREyt51dVWkn60207Ki76uZjoS640maxLaqEnI3u4hDdrA190y8lZMa31qRtsfSaRuPtsOq6WsZFqAJf1axNU2Usr+Y2EnVCKbDXHPyirohF9K9mRtFnmBFmoCZD/soIYbdjSg+h0+mfgghM7gMyrJAV3UWAsXTpwzmjJ+NKt2do87PBvIexy+v6dOPIimXPTgE5LlkQwouD9BSUWJc2pANGoj67mcAwb+MdzQugZViyGBkOSR+ABhRIDAoU2oH6+BPlakUt5cQhsxGfdBTv1/4AOe08QIAdl8bd1lW3u9/6XfTrggIWQzIcH0NmNDb5zUVvskGtpHgfbXjmQ/KcQ7YvwdsPwg85pXNOuJHqLjhn/p3/jsvV6C/kc1rPYE1MD5NTPQDXo2SZUSvFuM=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(136003)(346002)(39860400002)(230922051799003)(1800799012)(451199024)(64100799003)(82310400011)(186009)(40470700004)(36840700001)(46966006)(40460700003)(40480700001)(4326008)(336012)(6862004)(26005)(5660300002)(6512007)(6506007)(8936002)(70206006)(70586007)(8676002)(6486002)(2616005)(478600001)(316002)(36860700001)(558084003)(33656002)(81166007)(36756003)(356005)(82740400003)(2906002)(86362001)(47076005)(41300700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 12:36:02.5311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 31857d55-2172-4501-b0dd-08dc01583a38
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009526.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7363
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Dec 2023 12:36:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107655

Q2FuIHlvdSBzYXkg4oCcUEFDS0FHRUNPTkZJR+KAnSwgYXMgcGtnY29uZmlnIGlzIHNvbWV0aGlu
ZyBlbHNlIGVudGlyZWx5Lg0KDQo+ICtQQUNLQUdFQ09ORklHW25tdHVpXSA9ICItRG5tdHVpPXRy
dWUsLURubXR1aT1mYWxzZSxsaWJuZXd0LGxpYm5ld3TigJ0NCg0KRG9lc27igJl0IHRoZSBzaGFy
ZWQgbGlicmFyeSBkZXBlbmRlbmN5IGhhcHB5IGF1dG9tYXRpY2FsbHk/ICBUaGlzIHB1dHMgdGhl
IFJERVBFTkRTIG9uIG5ldHdvcmttYW5hZ2VyLCB3aGljaCBpc27igJl0IHRoZSBwYWNrYWdlIGNv
bnRhaW5pbmcgbm10dWkuDQoNClJvc3MNCg0K

