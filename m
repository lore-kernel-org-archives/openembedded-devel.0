Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2381ECAAA1
	for <webhook@archiver.kernel.org>; Thu, 15 Sep 2022 16:44:54 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.50])
 by mx.groups.io with SMTP id smtpd.web10.12675.1663260287377008975
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Sep 2022 09:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com
 header.s=selector2-armh-onmicrosoft-com header.b=1oKKT2H/;
 spf=pass (domain: arm.com, ip: 40.107.6.50, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=IHu/luqfsSAphVBQF3tAtTajBsXZnsoTlToFJ1fSYynxf4Lt4EBAcv28Kxzc3oLgqdEwtnxQKN2icq1Z5NdXDsVon/iI50wdZDTEd0844X3hM+4vIYocDB1agZZTX/F+YAsJo3e3kGkd7UAZN9FS+dGpVLyGNLWyax03uomrmiCFLR27Wc/9oc8vNYG6qSw5Y5+/DVgKwn1F6W1+FKYxOtit8wFbF9pFQr8No/O2KPd2MbhmlU3e/5yd2XH6Amym/voQNTKbwlGmVwnSuHRzBzcXTAkVJcyPnzustq3FB+L/k5I/of6Q4jMC28gr4/xVmf9vGUb1nNgUDveUUTYPzg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on+urKhL69+17as8t/btC8iejzV/x5UrwDQIR53JD1A=;
 b=ip8TadDFdKZago9EpxlNMxvUeFchlTMLHJw0BLfCMOMdJiP4aPaKxzfOxmOFnacAX+KRMM6dRqz0JIp5VBw+kFIAy0+RuyhEdNfrhVgHdQ1D6NIoGQoABIAkASOizNqmZcDyjLdd3ZL+YSLu1K0gTRSwAfd6kdUNCE39jdmpnqeGv6mhByZZfbH9gLw9taddQvnqtIxLb+rLhPOTANdGnxst43J80wohMARFUIF4H/IiE2rNHd07LWpjpnnD5RexzrIzKkeJjjRQyWbte8kyuyUaypwxkAGKAEfHEh07dgbri6NFhICwJUMrifdUG4Nhkp+xRZiyPjc2sAkVLDijbQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on+urKhL69+17as8t/btC8iejzV/x5UrwDQIR53JD1A=;
 b=1oKKT2H/eb5VvZK8QTCfi0nbjb10Xrg3PwdcH6P9oqToZ5gqSW8Dj6IJ04mxjNvMIkvvy618ZmKheOJ0+Gj8/QWQXhYAi6ONMNhLMbPSn8Gt/fCfAtlupwZbGtiF3cfdne5uJIHT7ZZ9zDU7c5sahiuY0kSnoR8wu89nzlmixc0=
Received: from DU2P250CA0002.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:231::7) by
 AS8PR08MB8275.eurprd08.prod.outlook.com (2603:10a6:20b:56f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5612.20; Thu, 15 Sep 2022 16:44:41 +0000
Received: from DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:231:cafe::c9) by DU2P250CA0002.outlook.office365.com
 (2603:10a6:10:231::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Thu, 15 Sep 2022 16:44:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT029.mail.protection.outlook.com (100.127.142.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5632.12 via Frontend Transport; Thu, 15 Sep 2022 16:44:41 +0000
Received: ("Tessian outbound 0a0431bdcdb4:v124");
 Thu, 15 Sep 2022 16:44:41 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: be1be234bd73d746
X-CR-MTA-TID: 64aa7808
Received: from 61886f9b087f.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AAB893D7-AE04-4C55-8B7F-B576F838788C.1;
	Thu, 15 Sep 2022 16:44:34 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id
 61886f9b087f.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 15 Sep 2022 16:44:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OKVnS5aI1EKYoG6aX45KFXs978rFo45coh+Y19Q2lm+VYfOUhSwl8KntCDr/yWq8ewaVUp+l5/81OJDEy5ARznl7Dov0589e9bWBZdPWNsbIpR0wh4+smMvA1CTkUAeagIVEE7+PJVMnbDjlbR0Qz7xlpxd4Yi+bOlJ6nVFxcKPwO+IAEgaLgxl1oxh9WTqbHd/zMQGJmy7vma+/rBrRK2lVde6nGQr6qF8uldWn5z2vfW2vkoKMeifQwdYq+nGkDBzE5Ukj2Ns6AS/2Q373H3maYVYF4jbieizdxCGEzbruhoslHJOfYf7Bi/cyQphLZNe2IGZgxx3JubujQiB2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=on+urKhL69+17as8t/btC8iejzV/x5UrwDQIR53JD1A=;
 b=I2uBfuzvTjYdDFDsDGQhoc8JEPQt6+Cc7nXGLsHyFZWyNm/AQP3lVH7ZWI+6AAG1KKZo6EoCGfQxJLP6uGrUwAmjuRkCO73yzbwXopTdexRnww+nscO/8z2vOfo3L2qtFZJF1VsKh4SzPni3+yKy9A1G3ZvAubqgsYQC928aYqeof1vDexEMQFsI5QZ0Hx8kaZ6/sLqwpb6033Sri5SK2j9UV58S9AWQGowBEScHDxvYE9f3AYJr5Batmf7EdS6H+7QrehhnB+4gdEBimqxIQE7RzRSFoM5yM54+e2mPCScLRDidLzpTbot/hjxhRXcO7TU6UtaBZ+8C5BLaOhmOiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=on+urKhL69+17as8t/btC8iejzV/x5UrwDQIR53JD1A=;
 b=1oKKT2H/eb5VvZK8QTCfi0nbjb10Xrg3PwdcH6P9oqToZ5gqSW8Dj6IJ04mxjNvMIkvvy618ZmKheOJ0+Gj8/QWQXhYAi6ONMNhLMbPSn8Gt/fCfAtlupwZbGtiF3cfdne5uJIHT7ZZ9zDU7c5sahiuY0kSnoR8wu89nzlmixc0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS4PR08MB7760.eurprd08.prod.outlook.com (2603:10a6:20b:517::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Thu, 15 Sep
 2022 16:44:29 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::a108:b98f:c57a:1d1b%3]) with mapi id 15.20.5612.022; Thu, 15 Sep 2022
 16:44:29 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "Zheng.Qiu@windriver.com" <Zheng.Qiu@windriver.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "randy.macleod@windriver.com"
	<randy.macleod@windriver.com>
Subject: Re: [oe] [PATCH] jq: add ptest
Thread-Topic: [oe] [PATCH] jq: add ptest
Thread-Index: AQHYyRWK8ezR+xgErUyvP8y87BBTmq3gsqwA
Date: Thu, 15 Sep 2022 16:44:29 +0000
Message-ID: <2025F5CA-89E9-4AA3-98F2-BCAE10C8543F@arm.com>
References: <20220915151146.29844-1-zheng.qiu@windriver.com>
In-Reply-To: <20220915151146.29844-1-zheng.qiu@windriver.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3696.120.41.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS4PR08MB7760:EE_|DBAEUR03FT029:EE_|AS8PR08MB8275:EE_
X-MS-Office365-Filtering-Correlation-Id: c08d21c9-2188-4696-feb1-08da97399611
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 yTYEOuZF+/f5ctBSbGXRf/lEZy/xdmSvdrWoZSMtlOXOqxgEAe4aGZ7olQSTzMivxc9ls8PJrlvwByzHS+V+zaXwH87xK+PU+xiP84Sbsk87mYpb6lJ3xEiRwmV6HD9RfbT4qeTLoPik8TArewNfcbJZcyEHfNe0VDGZw9tcKounBCJy9OpOcPmiGY+5MpEwKMPdeQkAs4mQ0fvBmFq3q61XFENf3qITzlV+QPW1DL9ZwI5a3i5FbMfm/PEiTM6FLNXtIPBqe4D8uyxIzR9Ytr5dvxGEkh6TD34BdXjSWIzQS6ko0SkEKvrY/ASKE5+enBdasOtewmi7VysRIfwal+U0XlEH+o9CzD2FR5NhtsQGi0Xah4o117NjdGxOL63vhVb2VYvup6XcmRHXbcZ52XktydvPIkQV57Y1OPYrbJqx5AuqdhPqX2Vc/AqfKOs/PfT9T51SftP97Z3UIe94oiox39D6z+15YtJ0BC147y80vZ+dMWoFdbj1Jq34IDznaCENO2zxSeHTBUolHQoESZBcor9wzR6CgktFzlx4x9cOnXgn9NJm9aYETYxDOOAkdmEXRPSCnkv/6ix+PLKaIYXWK5DSU3VpkJNMb4R5ZIRqvKafBEvcL7GtxW39bhFMc2h0BFDRYwnU7heJ9zdjwSTx6RMMDITgZi6FdivOMP3JcCBhjCHUBPt+EEEjGvfN/xukX18mevohApWFMNCmES+9HUtOHAklHiXXqWraz8OI9/7+xDOsAHUMYO15HqO9YjHCReV+SDyirbUKOqo9uUbKZVCedZdUBXQa24Cf6yk=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(396003)(39860400002)(366004)(376002)(451199015)(36756003)(5660300002)(54906003)(66446008)(66946007)(6916009)(8676002)(86362001)(38100700002)(6506007)(8936002)(4326008)(66476007)(71200400001)(55236004)(64756008)(478600001)(66556008)(122000001)(6512007)(6486002)(33656002)(186003)(38070700005)(41300700001)(316002)(2616005)(26005)(2906002)(91956017)(76116006)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <D45A0B3B1C4D174ABADBAEAF7F41620B@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7760
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	00b1f231-969e-4161-9964-08da97398efe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KMo0XwFyoce2BYnM1bHAfB6PvsGcJjAQAm7AkR5QIb/PNWuycZvG/ZYaHHXpW2t4PQwXAtQRrE4uBIR1swmZG0nLAs9cuROJBcX2esmR+RXfqibZ2sviBSynUQGY/YbFTqDHKXm/0BGvIy6TwvZmT9Mze95ghblr1c2KbwcIbF2qlvNNwKGx0wPohIyLn654k74pYarTqk6sJ031wXi4krARVpDOviZWfmaNrLaeijKkAUgduL+hxKNspCSeBHbFwXwv+VqZaaUV1RhnOoUaCpdoAqjJsn4PmHPU4PyfNSGqsVTRbzfIWyJEIpr+gpKW5cqsCss8dzQIDDspqwcwIzm/m4aWUmIM8hjnUVXqMcIdBT6shrrkw7KDe6PEWDWOmAp8xiceAEits9ziuEfpk7yEiw9pMl72z7OOCgDoYSUbZXEPGIwGvsUP6hd0Nb7TV5sEDX0mDvw1rNeweu2qMHUhpuJBuLQcxFO1AQLihE9hBFT83+VGGwDfAJReZVebjfAQBrDHA/uZUkZJmfKxKjGncgXrm2ajDFLKFy3FogT5Hq4PTQWvkg141NzpI81LW8ocqysN9j0CMOKYNVLb7/v4NCI2Y7SO3Bza8sojfe4l+W5+CKEZ1Oe+zUDPVZwmAiElGXVPp7KiH7T7Fc+hLuUlGBzIiPNvmex12YrI7JgG3TNPxrwYKGCtLXNXvzNYzvVk5+gPgwxkOYQYmaB1LwqdZvwqYdA2bQVFnOEnDUSFsdAV2nrLlhw54vjh5E7vXvl/oFQGCGFthA7CXJDkmg==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(6506007)(478600001)(2616005)(47076005)(36860700001)(6512007)(2906002)(336012)(40460700003)(8936002)(40480700001)(316002)(41300700001)(70586007)(107886003)(8676002)(70206006)(186003)(82740400003)(86362001)(33656002)(356005)(81166007)(4326008)(6486002)(5660300002)(6862004)(82310400005)(54906003)(26005)(53546011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2022 16:44:41.3038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c08d21c9-2188-4696-feb1-08da97399611
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT029.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8275
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Sep 2022 16:44:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98824

T24gMTUgU2VwIDIwMjIsIGF0IDE2OjExLCBRaXUsIFpoZW5nIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxaaGVuZy5RaXU9d2luZHJpdmVyLmNvbUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3
cm90ZToNCj4gK2NkIC91c3IvbGliL2pxL3B0ZXN0DQoNClR5cGljYWxseSBwdGVzdHMgYXNzdW1l
IHRoZXnigJl2ZSBiZWVuIGNk4oCZZCBpbnRvIGhlcmUgYWxyZWFkeS4gIEFsc28sIGlmIGxpYmRp
ciBpcyBjaGFuZ2VkLCB0aGlzIHBhdGggaXMgd3JvbmcuDQoNCj4gK2xuIC1zZiAvdXNyL2Jpbi9q
cSAuDQoNCk11Y2ggZWFzaWVyIHRvIGp1c3Qgc2hpcCB0aGlzIHN5bWxpbmsgaW5zdGVhZCBvZiBn
ZW5lcmF0aW5nIGl0Lg0KDQo+ICsuL3Rlc3RzL29wdGlvbmFsdGVzdA0KPiAraWYgWyAkPyAtZXEg
MCBdOyB0aGVuDQo+ICsgIGVjaG8gJ1BBU1M6IG9wdGlvbmFsdGVzdCcNCj4gK2Vsc2UNCj4gKyAg
ZWNobyAnRkFJTDogb3B0aW9uYWx0ZXN0Jw0KPiArZmkNCg0KRG8gdGhpcyBhcyBhIGxvb3AgdG8g
YXZvaWQgcmVwZWF0aW5nIHRoZSBzYW1lIHNjcmlwdC4NCg0KPiArUkRFUEVORFM6JHtQTn0tcHRl
c3QgKz0gIiB2YWxncmluZCINCg0KTm90IHN1cmUgdGhpcyBpcyB1c2VmdWwgZm9yIHVzOiB3ZSB3
YW50IHQgdG8gdXNlIHB0ZXN0IGZvciBpbnRlZ3JhdGlvbiB0ZXN0aW5nLCBub3QgZGV2ZWxvcG1l
bnQgcmVncmVzc2lvbiB0ZXN0aW5nLg0KDQo+ICtkb19pbnN0YWxsX3B0ZXN0KCkgew0KPiArICAg
IGNwIC1yZiAke0J9L3Rlc3RzICR7RH0ke1BURVNUX1BBVEh9DQo+ICsgICAgY3AgLXJmICR7Qn0v
LmxpYnMgJHtEfSR7UFRFU1RfUEFUSH0NCj4gKyAgICAjIGxpYmpxLnNvLiogaXMgcGFja2FnZWQg
aW4gdGhlIG1haW4ganEgY29tcG9uZW50LCBzbyByZW1vdmUgaXQgZnJvbSBwdGVzdA0KPiArICAg
IHJtIC1mICR7RH0ke1BURVNUX1BBVEh9Ly5saWJzL2xpYmpxLnNvLioNCj4gK30NCg0KWW914oCZ
bGwgZmluZCBpdCBlYXNpZXIgdG8gcGF0Y2ggdGhlIG1ha2VmaWxlIHRvIGluc3RhbGwgdGhlIGJp
bmFyaWVzLiBpbnN0ZWFkIG9mIGFzc3VtaW5nIGtub3dsZWRnZSBvZiBob3cgbGlidG9vbCBoYXMg
YnVpbHQgdGhlIGJpbmFyaWVzLiAgSWYgeW914oCZcmUgbHVja3ksIHVwc3RyZWFtIHdpbGwgdGFr
ZSBhIHBhdGNoIHRvIGFkZCBhbiBpbnN0YWxsLXRoZS10ZXN0cyBvcHRpb24uDQoNClJvc3MNCg0K

