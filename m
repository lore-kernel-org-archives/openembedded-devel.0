Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32F47C47258
	for <webhook@archiver.kernel.org>; Fri, 12 Jan 2024 14:23:34 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.68])
 by mx.groups.io with SMTP id smtpd.web10.8105.1705069405838691504
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 12 Jan 2024 06:23:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AlzNEhtO;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=AlzNEhtO;
 spf=pass (domain: arm.com, ip: 40.107.104.68, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=h4Dybu/WA+wYJXjbjz7+ZTYcYYPIfyABvuPppFdAZophis3ymTOkU3q8CpDUxOdNkapcBzjh5DDgWBbmRhQ/3/cd7fzcLBDx5w94T/pJk4oZOzBigfFYo6iG+e1IzVBU4lGgZQMokKS/cQplVpAEvt9BJ190TZUtUtvzIILqnV4ofjG99K88I/DfyB2XTYnizuJFK4obVlVy6PCpN4/f70EaA2jLrk9Voy/WfzWVFiuDKsdD8wdw7bEdeIde3/ueRwhi07xRllHPX3pYCxrnlDIZxfcE0wcYo1+XmsIsoAwKAoahaqN8UPBqYa3oP5G8QI8TduLFpg72tq+DxUSdRQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au4ZuKfvQjvj89LOD4iwFZKt0sbD3eh2oCSZS3Hpo8E=;
 b=REdn2xIbISbkl/2fgHk4Iy6bJnLtf4jmFeLuO5vSRN1LJhkkykw2HE/3iihXPSoF3ttFVgPhOehKftPCe8Xxsx3H76AoyuhIxLuMQXZOnFyAdRCKWTR+87dKqb92z/X4gUCL0FPXxyuvBDWF/wLCZJVQ8gGG4ULdZ+3p5gy6hX1Mv43dxT0f6XuXpbU0WCMu3nYxhKuRmN+5GrD1eikm4HpG5CLtw38fDsjkT3RsBHOnZ7txOa406gEfYS0LVXXWS3TlS/5rHN9EVrVb6GN0u5V7cOsr1voqNURYVJ80OyNB1i8GKf8l0jmU8TtBGMyZQuNnjMNrRBjD7MAVQ8v19Q==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au4ZuKfvQjvj89LOD4iwFZKt0sbD3eh2oCSZS3Hpo8E=;
 b=AlzNEhtOk0F6v0HEWX41ae0DWBvI0FtclN5QCSo8fTpoCt1M4pkRJdEKcxolTwxlaYKmIkYCj+yJc1vcstL0wFiYKNDNl/9BTfTJHaNG7AzxpplTs/xOrJBj9u/dIjkMt24OR7od6WcGyCUZWJvWoQTMt4t8YaO8gJmX86Nfru0=
Received: from DUZPR01CA0200.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::10) by GVXPR08MB10518.eurprd08.prod.outlook.com
 (2603:10a6:150:151::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 14:23:20 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4b6:cafe::17) by DUZPR01CA0200.outlook.office365.com
 (2603:10a6:10:4b6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21 via Frontend
 Transport; Fri, 12 Jan 2024 14:23:20 +0000
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
 15.20.7181.14 via Frontend Transport; Fri, 12 Jan 2024 14:23:20 +0000
Received: ("Tessian outbound a064b9944658:v228"); Fri, 12 Jan 2024 14:23:20 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5e25971713c55d81
X-CR-MTA-TID: 64aa7808
Received: from a59f6c07c47d.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 87C4F183-7FA2-4625-8F5B-384980050CE4.1;
	Fri, 12 Jan 2024 14:23:13 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a59f6c07c47d.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 12 Jan 2024 14:23:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BWN6oafLp4IhYpG9J7LwqnSD0Zg1w34NIECoA4zO8TFv15ogAZ6rl6yZD/zERQo4K6UAlzei4UsQjDIh0+yeKHuOCZ+GQkIOd5qd+dX+CslWDtRhRA5oqPCbFlPaE63zUZtgMUZg/1Rr2f6qqKthQnqKzLcalKzZ1UrD/fG5Jiam2pKl1jAjdukJKhbGhKqppzXCBw0nSlpj39mldu25Ujp1lMMYdwTVejCdELtwnPD5V9lvD3lGJrXldt1NSvAHi+tfYN2HoIC8oe6ey+OnoZLuZaxjxT79lJAsFVrBU301GB0y0BMW4wwLV9XSaEYy/fP2uFjnRAZ/VwGQbMgHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=au4ZuKfvQjvj89LOD4iwFZKt0sbD3eh2oCSZS3Hpo8E=;
 b=lV9yfv3a/zfCcoCcLHoV/nbj1vwsMVP+8sDIs7BmkqUUZAQpPb3MklNZbIaHBEtwPHtnne2V5cDUK0sqXweiFdKsvAXZoIAILyhCH82wXSlg8q94C9oNyiSYrlHfdOc22O73mBqRuCnx4QgIJYOw15WOpp8KesnWlcIAl3ghXbU/D0Ww+itWqfJHXaV6o6mNcOPRgl7fImsJVEwiLa3PGO2AxR8iK/LqVYWOrnzoDNzLm+9wa0kmtGSLt7NieiTbL4ipTiNLFXVjUYkneSE57sTArs0NQW6xQggPkDg+Dt/nqd5xhVsY1PVmwFjm8OYadntzrevP4mGAETJgmCii8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=au4ZuKfvQjvj89LOD4iwFZKt0sbD3eh2oCSZS3Hpo8E=;
 b=AlzNEhtOk0F6v0HEWX41ae0DWBvI0FtclN5QCSo8fTpoCt1M4pkRJdEKcxolTwxlaYKmIkYCj+yJc1vcstL0wFiYKNDNl/9BTfTJHaNG7AzxpplTs/xOrJBj9u/dIjkMt24OR7od6WcGyCUZWJvWoQTMt4t8YaO8gJmX86Nfru0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB6440.eurprd08.prod.outlook.com (2603:10a6:20b:33f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.21; Fri, 12 Jan
 2024 14:23:11 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::9f34:f165:4c51:be06%3]) with mapi id 15.20.7181.019; Fri, 12 Jan 2024
 14:23:11 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] flatpak: fix gtk-doc build
Thread-Topic: [oe] [meta-oe][PATCH] flatpak: fix gtk-doc build
Thread-Index: AQHaRVh8n6IWpnIgr0mRlrqAz1CI/LDWOv8A
Date: Fri, 12 Jan 2024 14:23:11 +0000
Message-ID: <9BEB559E-98FD-4184-AD98-18446B15718B@arm.com>
References: <20240112130825.940790-1-f_l_k@t-online.de>
In-Reply-To: <20240112130825.940790-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.300.61.1.2)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB6440:EE_|DU6PEPF00009525:EE_|GVXPR08MB10518:EE_
X-MS-Office365-Filtering-Correlation-Id: 19a8953c-f2dd-42d9-7ae5-08dc137a06eb
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 X6JT/OAUQArLRqByv4LaCM6nc7L++4nz4aPJoox78gJwnUnAv79IlQsGbqiKLl3w4BvZaJOmg4/x2JG8F0obskHnY4d6MLH3YPpPSUwEoG3LJjjUNXs6ZlVp7z+eOq537prWW1LmBovPWwIqLOXxvNFLR56bfNr7TsQlTkwmJwzQtFu5fy+3k+/gu8dLODnaBUAiDDQqN7lmMGSFmDvkjE91xly970IDj/ZcFW/2HDGQ10X4wmfvjZj+cm8hMg78MBY5/27YeenCDTZnPWSllPcmw6TVwI+kpE8PAAZhrwx/CAcVHpEEEnRsoMJbmELopYBFiCqNJGgnc2W6HpnKGjuF/ZNjTUoBfHYqWkUWSQLZI397v8h5IzFKAEgnRFIBIerja9kRkjZZXn52jmJJTx33hJlREwOugRKsAF7UOZjMVJMS9FiOQ/m9vYyL4Ehn2QHkR9Sc4rzhRrpp514C2gSwkSNz3mMxov1Vc+mcdIOb7K3p4oQGswjeCX6dDUXl5TvXxIsbwjNBwOo5h6bn17qI0kfUK1pYav6tmnUAuMy+jTkq4za8LkXJa42Cp7yVT+N1HAiuI7kj3Yb46bpG6qvTce1swheBEAGF36ffDkSaquO57mlJBeZzpEUo6IOokQh1it8cIxeIle9BukBzAQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(39860400002)(136003)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(2906002)(4744005)(5660300002)(8676002)(38070700009)(4326008)(8936002)(66556008)(64756008)(66446008)(91956017)(6506007)(66946007)(71200400001)(66476007)(2616005)(6916009)(76116006)(316002)(26005)(6512007)(86362001)(53546011)(478600001)(38100700002)(122000001)(6486002)(33656002)(41300700001)(36756003)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <9F675DA35B97224F878820CAD3BF7A24@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6440
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	30ddff32-4c21-450a-983b-08dc137a0173
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	P/po7qlaJzg1aJDHVXuO9xcBIaswlHAA8kRkhubbr4isY72Uze6OgL68DM2xQLYJrvXx4S41K0CSZFgkMtVWlDUwQZo1eI4f2sciOvWwLUHrT6XR7EjonqI54nKdKX5MA4X8uTcyCJXEXo6hbetjZCtsbfKsAUjJet2UcAwHqp3Wz9aqkSf8wY5GWQvY6I70e6RvgATE/EAIResg/Jbus8wQaHhAjZeJiiCgT2kkkhlADQjZDnJ39ed58tf63KesVEil1x1p+xvYpx9d04V8VsGl8CYMsSmUr/1N/N2WliHWfdDqKhTAI47vAiiVRuSu4JtnSvQOwfo4jy9CY0k6bOjn2O5WlQKUbo1k1GMfHSix/PJSg+15mcRKtSHv1Y0T2OiJ6TwH04lPDl79oZ4H+9MWQkCyve296uYjaRdzyFzWSNomrc1hItYbxQxa/eJA1AmSFpdHwPOJRI8WzbnJonWQEr7Dz7CWPYbYX9eO/ocbhnnBWoGGfpjpDm6pfmBBN941z1wwHAbB2yhufS76A68NtzPG5u8gfPVRmfs0AyYKIPIwV9OABFdyiuNc+vPa32Og2/7ocdVl4YsEYoAtVpTieQ3zUZ+k7S9Mfc8DcGkYNO6S3Y8b9jWjA06DvxbfWyPaOrGVivkNUjCc8Qz6ZmPDDGozkIm1u5/i1QUktQPbfuhsY6EYtorNPcFi8MB090FbN/q43xTh+lgsz0JsWk8tl+jkINLT+6x+q0BUP0Q=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(136003)(346002)(39860400002)(230922051799003)(82310400011)(64100799003)(186009)(451199024)(1800799012)(36840700001)(40470700004)(46966006)(40460700003)(40480700001)(47076005)(83380400001)(86362001)(33656002)(36756003)(81166007)(356005)(82740400003)(36860700001)(8936002)(4326008)(6862004)(5660300002)(53546011)(2616005)(336012)(26005)(8676002)(70586007)(70206006)(316002)(4744005)(2906002)(41300700001)(6486002)(6512007)(6506007)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2024 14:23:20.2645
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 19a8953c-f2dd-42d9-7ae5-08dc137a06eb
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB10518
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Jan 2024 14:23:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108243

T24gMTIgSmFuIDIwMjQsIGF0IDEzOjA4LCBNYXJrdXMgVm9sayB2aWEgbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZyA8Zl9sX2s9dC1vbmxpbmUuZGVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gd3JvdGU6
DQo+IA0KPiB0aGlzIGZpeGVzOg0KPiB8IFJ1bi10aW1lIGRlcGVuZGVuY3kgZ3RrLWRvYyBmb3Vu
ZDogTk8gKHRyaWVkIHBrZ2NvbmZpZykNCj4gfA0KPiB8IC4uL2dpdC9tZXNvbi5idWlsZDoyMDY6
MTM6IEVSUk9SOiBEZXBlbmRlbmN5ICJndGstZG9jIiBub3QgZm91bmQsIHRyaWVkIHBrZ2NvbmZp
Zw0KDQpIbSwgYmVmb3JlIEkgcG9zdGVkIG15IGd0ay1kb2MgY2hhbmdlcyBJIGJ1aWx0IGV2ZXJ5
dGhpbmcgaW4gbWV0YS1vZSB0aGF0IGluaGVyaXRlZCBndGstZG9jLCBzbyBJ4oCZbSBub3Qgc3Vy
ZSBob3cgdGhpcyBzbGlwcGVkIHRocm91Z2ggdGhlIGNyYWNrcy4NCg0KVGhhbmtzIGZvciBmaXhp
bmcuDQoNCkNoZWVycywNClJvc3M=

