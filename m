Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06ED5C433FE
	for <webhook@archiver.kernel.org>; Fri, 14 Oct 2022 10:31:38 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web11.5735.1665743495659791381
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Oct 2022 03:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=zYkVbZWL;
 spf=pass (domain: arm.com, ip: 40.107.7.42, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=bs2dfhANl9UNIPb4zD4dtSNKlxqyKJ286N2YCCw5AOy6nqafVbfsYnaSgX3pj4ea4EtPPVXEG0LY3+YD840tuHgGbekwozFcIixkI5Vzuz6vaS13sJWEqqviFD7ZI/WRqeJWQ4uEiYKiErTJvvqVR29Ktpww1elqa3rb0umtrVoQu+Y7JYIpmCGLPWJQySv1v/85qMiOTUYdck+7NHRuGuoIL9RRRX+j2uCDZPhTcn2DfS50OtnQlIUjT33HiWnHwbeUCfBXTmkepHPUFgWqJjk5NOjr7AH3lF7m/2nKco1V2vMIqSu0Yd9w933tVdpq+AN604JKrLzEq8PvB3M4fA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b05UbKAKW7GGb2zeqwXSr7o9ZD1vdvSh7LO9gn/em4Q=;
 b=GtYY2lvrwR8YyUQiIp1aXLGu10s3MVLjFHGr8AnNjTndWc2OtjMxS0tdAw6nQHMfvV25Do20a4ujiOrD/h07vG3Li+dLqV6VAS8dCdyU/HtulBQaHsXChNRk4+1XYxJmL+AA1/vYe3cGmRpyvrKk5wGckRc9C17qio/q+e96fOVICJb7RZc6vUhMvVchCquMhbt7S7+E3ZqV4LBfu0GEaHMx7qs+bxtX4YvMjp0/BcRksuTY6A3kt0/Gu3svB2rf/C9Us/HaLYZ5WrwD3OaAutqAgUfI1vqow3uA28N8kFch5YQQ6sQl04r8dbzhoioRVWvsXRRtEVn6bA9YPabRVQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b05UbKAKW7GGb2zeqwXSr7o9ZD1vdvSh7LO9gn/em4Q=;
 b=zYkVbZWLMr8QhR47e+qkPUbFpfIxJvvuLHjlW4zwSCREiAxlzEW4LLTBcaXqLmXfR8ZHZIPzInTIcQIUBaOy11cBV7CV1L1CRWDznsXCKq5TCG5aUy01+4QgfAZk+EYXTL2fgJWUkngKvZsh8stf5wBFZhtgDdxxW5JLxzFEVJ4=
Received: from AM7PR03CA0022.eurprd03.prod.outlook.com (2603:10a6:20b:130::32)
 by DBBPR08MB5899.eurprd08.prod.outlook.com (2603:10a6:10:208::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Fri, 14 Oct
 2022 10:31:27 +0000
Received: from AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::dc) by AM7PR03CA0022.outlook.office365.com
 (2603:10a6:20b:130::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Fri, 14 Oct 2022 10:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT020.mail.protection.outlook.com (100.127.140.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 10:31:26 +0000
Received: ("Tessian outbound 6c699027a257:v130"); Fri, 14 Oct 2022 10:31:26 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24f02ef09999bf67
X-CR-MTA-TID: 64aa7808
Received: from dffb160e18fc.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 9C172996-A0F0-415C-B468-69407CF87C4C.1;
	Fri, 14 Oct 2022 10:31:19 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dffb160e18fc.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Fri, 14 Oct 2022 10:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wu5aesp/D4u9+egkOAdAKAHoFTAzDpF9F4GanwGth9Q3LnrFN7UlN1t8gfsrxYVfMEdDFJ9mhgcUuiIwmzjp1BzGT7d6scWnBWEKPjGVigiuuhy52PkvuzL9ZruwRahbPzsr9vAtXTJNR5F52eaLpWhOMMCqNtiG3Tf6GMC57i/eAhpm5seJ/RZr7B66E4uz+ZyHRocnx3equnhrOyrWihlUzHr2D4yh+CeOQqPa1r833OUvTD7+pnFdsLHo4eUOnfoYVGyxbTw2TU5G4DpzFG4u4RSaB0jlQK97++zLGei3EmvLtJJllesZ3vLt9iuu5vgsWxsrJHHSyM1HraIu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b05UbKAKW7GGb2zeqwXSr7o9ZD1vdvSh7LO9gn/em4Q=;
 b=KYVSxZ0sgK0Rc89HzThP68l/dhxpPa9QtP5DuTsUqOYJ+2YS2xq3bM+yhWledavQLKf5DBNquXaHV9Hw+p4x0zKylzon4W3chDnkv9nxFlkTFREKNwr6rYYDk2C0dL51S7LyLIe9f7DM0TdY3dJPScUA3cvzwOueD7n/5LanOgMhVgWWNwWDrksfVbeZTeMd1qf7PI/v4IhPFkIFMFS/tI8axmzEyvafJwpBqUb/s4Pf5AdJ3Wjycd/VVZiNoTfwzxSfRfR2WshGg8Y2W75okxhv8Dk0VDy8KjxigKokCk9IBrkfbc/P6Mm+shwfLqbW2zH7Uai7YviIn+Afg28FCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b05UbKAKW7GGb2zeqwXSr7o9ZD1vdvSh7LO9gn/em4Q=;
 b=zYkVbZWLMr8QhR47e+qkPUbFpfIxJvvuLHjlW4zwSCREiAxlzEW4LLTBcaXqLmXfR8ZHZIPzInTIcQIUBaOy11cBV7CV1L1CRWDznsXCKq5TCG5aUy01+4QgfAZk+EYXTL2fgJWUkngKvZsh8stf5wBFZhtgDdxxW5JLxzFEVJ4=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DU0PR08MB9875.eurprd08.prod.outlook.com (2603:10a6:10:423::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.19; Fri, 14 Oct
 2022 10:31:18 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::7d2b:2570:9a99:a3d2%6]) with mapi id 15.20.5723.026; Fri, 14 Oct 2022
 10:31:17 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: wangmy <wangmy@fujitsu.com>
CC: "raj.khem@gmail.com" <raj.khem@gmail.com>, Jose Quaresma
	<quaresma.jose@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of
 dnf-plugin-tui
Thread-Topic: [oe] [meta-oe] Add nativesdk-systemd-systemctl as dependency of
 dnf-plugin-tui
Thread-Index: AQHY3e+3cBcl71btbUS8NVyrPhpyfK4LAfEAgABVz4CAAMRBAIAA7ouAgACpwgA=
Date: Fri, 14 Oct 2022 10:31:17 +0000
Message-ID: <5ACC99BC-0F7C-4E93-9075-B59AE48475C0@arm.com>
References: <1665547429-23508-1-git-send-email-wangmy@fujitsu.com>
 <CANPvuRm1e0ahSFda7VOqpKG-OB-g-8xza7E5_X-csm4QTAr=9Q@mail.gmail.com>
 <CAMKF1sq3tZLuvT+4yeoCui6COj5x58hrApw4COpemz7UjmSkHw@mail.gmail.com>
 <F57949F9-AAC0-4F69-9942-4829C9B296B2@arm.com>
 <OSBPR01MB1845EC14164CABBA0849ACECDC249@OSBPR01MB1845.jpnprd01.prod.outlook.com>
In-Reply-To: 
 <OSBPR01MB1845EC14164CABBA0849ACECDC249@OSBPR01MB1845.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DU0PR08MB9875:EE_|AM7EUR03FT020:EE_|DBBPR08MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 33566089-c060-481a-10d7-08daadcf3fad
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 +I9F7go7dSCtxs7vOldXSS+vCeZ7xXmlwgwGbp4wPDqk8fVYCEZz/JmEHtDKDJbnTXSTh2anfMLlIlEZUvH8x7tqM5sy9F6aw1D4P9BxMNc1bX7v/tev7hzQVt4gN2nZapH0Zxi4mWrIhZcfd13oh1YstiCKIfESGuJTuqey7x9r0djYitVJEaWpkpLJgy6EPplOojsM8jgi88mv24/IEsBrXBHxvwBR/4uzGCIEyLbayVLNxWeLNkYnCODpH6aog/nX5mP+LklfakFSYS7pMLJcBofgCm8/l/gkuZtqox32RbsuCYsIH5GABLNFobKRAuB8P5N8SO1ppcQyP0q4ASRKI1w66n8IG/7s4bqecmN4k6wMY6vZsAo6fWZabABT0q7WusMcNb11MIms6cX657trxgP141WfYIk0r4waYVOXqswXGrPhk7NnXIAbeUsrinQN+sMPVGCuFHTBFGRLLAulZqi5jqLh9Kgji2GPzwtqWd+YuSA5chM/xkRPJBDUostaHlIo5naoRbfOtRbuJEQXT38oYYQs1Yr/dqYoLVfGf6bxwb7jpqinF/gwHdS5cAOANnXMlUyw7LmV0NqAYdA+aAmWSNkINHWSjaF496qt9oM+KDPQs8n8i0e7gh8WMJLRCk9DJBoEPyjszv5oD9ZA1U/rajOTCPpjdxipSHpQodzFS8kLiikr7AhvqQ0xDgLZz5h9ZTeKYmJywdP+4kXEBFbu45ppo0yHQQi+LpWS/wNGYQoF3XDl0xcg/Jaua0ESjO4ID9pYukIaEA1TtGliMJn3ssaPw24/sfYw5VA=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(451199015)(2616005)(54906003)(6486002)(71200400001)(2906002)(4744005)(8676002)(478600001)(38100700002)(122000001)(36756003)(33656002)(26005)(38070700005)(6506007)(66946007)(41300700001)(5660300002)(66476007)(186003)(6512007)(64756008)(6916009)(53546011)(8936002)(66446008)(91956017)(86362001)(316002)(4326008)(66556008)(76116006)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <952E6DFFFEB89C4DB8D498242527B109@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9875
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	28b25a59-6890-4201-39db-08daadcf3a26
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QUKLLFU7anpIOVPuXEyC/ro+GryIH1ZCuBED3HHkBvpQi40HErvAGQltiEir4p2KIUQ++6ij9naA4W49FIpNWR+oS00pIy5c3Atm/3VKMfBYkR5TXDyMjADGtLmwSbBwEEbwliJzAlBK8COUvrai6mlIf+twnfGKz7cDr75Ia1W1MY8neGJ7/LaJ5jEUB5ygxp5gmmeR7l00RJ0mx5P0IMr/9X8qKcKJFnQS2WEpKcqHYM5dmRtb5fD0TmJJunyRyJqpvM6crwiSVaEPw66LDPf+unXYoGK+YgW68Y02leJtL/t6z61mRFR5R7PJrgLUUwQ6JDhOy+u5D/ShgCIUiJaNy93NetVWSTgjXLX/LkOGTtd72Nd7GmbgcSRPwWPu3SNWkxSbmpdmXhem6+UryDw2HwaY61AXw77zU5VoHvDO3BlW8zivmd9ywJXIqPyoqEw5RoVoAUVnwjxC5Y78kL2L1XyLZ9NGc9N0KZuCBrPDGWqYrX2WaiXIebGlpuqPo7tnoxB5Eca/FHj4wjgOw/PeC7OcuxCdkeY/bo5+ddgLXDRRzhsMjPZ9UZwzVqdmYOmPFNNMN2rk5KuKsUiF8aKqiXrdlxCcPyY3P9COM0dIApSqAfKgampSo4O9kLL6fh1tV2D1dI1ZZ3XK3c3WEtSTfarGfyiIROLhgZV0lMc/SIAlwhGztcCZ4d9ubdA54HpbogVTgGXWs+iGivIFWVJdQKjYN7QOpV1zE9wIGwV83BrleaVTEHWJz8PX6/QR4w6DaqN5uFNBw7XfGHtw8Q==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(376002)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(316002)(40480700001)(6512007)(36756003)(70206006)(356005)(70586007)(33656002)(8676002)(4326008)(6506007)(47076005)(40460700003)(82310400005)(4744005)(36860700001)(53546011)(81166007)(336012)(6862004)(8936002)(2616005)(6486002)(41300700001)(478600001)(186003)(5660300002)(26005)(86362001)(2906002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 10:31:26.3863
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33566089-c060-481a-10d7-08daadcf3fad
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB5899
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Oct 2022 10:31:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99168

T24gMTQgT2N0IDIwMjIsIGF0IDAxOjIzLCB3YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4g
DQo+PiBBbHNvLCB3aHkgd291bGQgYSBuYXRpdmVzZGsgRE5GIG5lZWQgdG8gbWFuYWdlIHN5c3Rl
bWQgdW5pdHM/DQo+IFdoZW4gZXhlY3V0aW5nIHBvc3RpbnN0YWxsLCB0aGUgc3lzdGVtIGlzIG5l
ZWRlZC4NCg0KU28gdGhpcyBpcyBhIGRpcmVjdCBjbG9uZSBvZiB0aGUgc3lzdGVtY3RsIGluIHN5
c3RlbWQtc3lzdGVtY3RsLW5hdGl2ZSwgd2hpY2ggc29sdmVzIGV4YWN0bHkgdGhlIHNhbWUgcHJv
YmxlbS4NCg0KV2Ugc2hvdWxkbuKAmXQgYmUgZHVwbGljYXRpbmcgY29kZS4gIElmIHRoaXMgaXMg
YSBiZXR0ZXIgc2NyaXB0IHRoZW4gaXQgc2hvdWxkIHJlcGxhY2UgdGhlIG9uZSBpbiBvZS1jb3Jl
LiAgSWYgdGhlIG9uZSBpbiBvZS1jb3JlIGlzIHN1ZmZpY2llbnQsIHRoZW4gaXQgY2FuIGJlIHNp
bXBseSBiZSBleHRlbmRlZCB0byBidWlsZCBmb3IgbmF0aXZlc2RrLg0KDQpSb3Nz

