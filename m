Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94855C433FE
	for <webhook@archiver.kernel.org>; Wed,  9 Nov 2022 12:49:30 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.49])
 by mx.groups.io with SMTP id smtpd.web09.2839.1667998162385526502
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Nov 2022 04:49:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=3p3GiHfb;
 spf=pass (domain: arm.com, ip: 40.107.20.49, mailfrom: ross.burton@arm.com)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=ZGjBL6+ewVkimikZz31Q/XHXlDIjYvkywRAuf2FF7VyyiDMfzgRBXLFqG1TflTvZnB+LADP62dZgdKp73h5tVUKLl9+xvxOiknIg2voPYJDojsmsIJTAA5silyr0BLVeZ4/epKtABR07Drw36FiG0UuIX3my8COrDded/aPWJJDCMi9+jRz7rAQY9qOuQIInd8veHPekvRrFF2Su9l20CSuBV54hdK6mjLsw2deBtOV6pnR/nsg74m4J04Xonts4DdjOOvh2hSrnHwW6t4mKkktClKwLWKIb9L0o2vzQ9cay3rr90YTqDWM5u5RcnBnNjsEX1U+XbeHJpgcgoSg+jQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic3fg1tC3LExPK3sMERNOq3S0/dpN+QxHAtwyHEne84=;
 b=lrGSt09UUI12bREc5Txn+iF5tL9H1J25Lmx7lUVt/wjTQo/0IoE5SMb8FPI+hqvfY+JND/d0E6Rs+oCQLYsF2jMfjYA7ppGD218R0ETyBzSU9Qvqsj2SjYMqpKJzB7Dptix2cjeP9vXbQNvLCwINuEJ8qcFtOwmsFXRLhd8YEcpn4MX3fpBNkRrrb/cLmzXdMFfiSuLV/ARQEXy4OdWNuKiVq1kgCg75oHZmyc6S8o12UQaKUr9Dt6RADHarNCrPyKJdoyP9vjU59NPqzndvEMNYkTi4wPkl6fj/q6Jll+WCqlsOGhNSxYKjmzRttmQYovtcULEHEtzdQQT6o+Oauw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.openembedded.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic3fg1tC3LExPK3sMERNOq3S0/dpN+QxHAtwyHEne84=;
 b=3p3GiHfbdHYIf/72f8f223t6pCE0rDBaU3ciEBVdh2BOZlOKFspQ3RIEgxLQhKYJC2T+kMIVvO6efI+De3h6ktjje6Mp9xc/Q37u1fz3GfRFo+b0oycdgZYTmDoU5TVBVn9oAuoXkpf9WypsGed4qnD7OrbEupTF4p8N1QQkB3w=
Received: from DB9PR06CA0024.eurprd06.prod.outlook.com (2603:10a6:10:1db::29)
 by DB9PR08MB8650.eurprd08.prod.outlook.com (2603:10a6:10:3d2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.11; Wed, 9 Nov
 2022 12:49:18 +0000
Received: from DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::e8) by DB9PR06CA0024.outlook.office365.com
 (2603:10a6:10:1db::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27 via Frontend
 Transport; Wed, 9 Nov 2022 12:49:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT006.mail.protection.outlook.com (100.127.142.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.12 via Frontend Transport; Wed, 9 Nov 2022 12:49:18 +0000
Received: ("Tessian outbound f394866f3f2b:v130"); Wed, 09 Nov 2022 12:49:18 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: e774dbb24b98f654
X-CR-MTA-TID: 64aa7808
Received: from 83088c2c58a5.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 31619D47-2D6F-4622-803C-E3F086CDA1E5.1;
	Wed, 09 Nov 2022 12:49:11 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 83088c2c58a5.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 09 Nov 2022 12:49:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PGRWyqiVNB9KQR2a7MXebaCwPteFq3xinHY8VI+QbUy1gPRO/buC0sSrY5RwRM1uUwnQaG8fzuUwvotBpqggKjKsVjz3hgDiCTH6XES222YLUvpJhk3o9iBUKwlMvLXbAYVebEFSz2flHCZoZjcfzXBQR0ae9goD7ItghTcuUHSpGEEo7tuCn7HdTyF1gvwuGAxkHiaVJXNBTgfJ6CVKOp2noEDzq/CErXhk23QKtejF0n05LtWnLyDQAOj/+AXox001MCkatlxC5h2sW0KsQQI6oyBFy5ClaGy9F/DMFr8/ZQBy+IPOPs1hc+EHRkbcXruW+7nYo1lIsfEqIYLY+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ic3fg1tC3LExPK3sMERNOq3S0/dpN+QxHAtwyHEne84=;
 b=RVtfNDLBoWYAzv/7K1YKAkCwNHm89s1chp6azj+x7cYwvKR1ICpiduwAhH2xcE4TVRaGZ7vrFP3BYifny1NyY6rf3VrnDu42fLfyneiw355iLow+2jUa71fFhg05CuIrJob+xRBEIVCyEfB1YV5k9sSGoxSDW2nELMnR5mggJ9cRvm06aXy8npRdmooiNmpF43UTxSou5sZpoxo5T1Iw9aN+XlGCypHCszXgBQp3j9e3RM7uzKapob1uClkrHAojlhuKF0BD8B7U7kndlw9VUp3DUp/Hz5AgeuVaVF38kT3+avoVNvOXWpx0jOI2cBlqsAkP7kop9dAYA4NDGqDWUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ic3fg1tC3LExPK3sMERNOq3S0/dpN+QxHAtwyHEne84=;
 b=3p3GiHfbdHYIf/72f8f223t6pCE0rDBaU3ciEBVdh2BOZlOKFspQ3RIEgxLQhKYJC2T+kMIVvO6efI+De3h6ktjje6Mp9xc/Q37u1fz3GfRFo+b0oycdgZYTmDoU5TVBVn9oAuoXkpf9WypsGed4qnD7OrbEupTF4p8N1QQkB3w=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS8PR08MB8733.eurprd08.prod.outlook.com (2603:10a6:20b:565::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.12; Wed, 9 Nov
 2022 12:49:09 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::af9:29f:ae3b:108f%4]) with mapi id 15.20.5813.012; Wed, 9 Nov 2022
 12:49:09 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: Markus Volk <f_l_k@t-online.de>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] hwdata: allow to build native and nativesdk
Thread-Topic: [oe] [meta-oe][PATCH] hwdata: allow to build native and
 nativesdk
Thread-Index: AQHY9B7Gyuz6ptEObUC3T3flD/vmxa42iwiA
Date: Wed, 9 Nov 2022 12:49:09 +0000
Message-ID: <D7B0F690-42BF-4D57-9A34-FB8650CBB7C7@arm.com>
References: <20221109093534.2718027-1-f_l_k@t-online.de>
In-Reply-To: <20221109093534.2718027-1-f_l_k@t-online.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.200.110.1.12)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS8PR08MB8733:EE_|DBAEUR03FT006:EE_|DB9PR08MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bbc83cb-e4e5-48c6-ea40-08dac250d0d6
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 oaGpC39V3kYdmqFANaNkiO6IhBK7j43lqq5bc+2ydMppRuiFWJeNQok3OrhmnRcnGhNObr1QPLsYF6mzadNPGwUmw5YLdXtMJ23Te448myweCTD2eZEzrsdyeTKQQN6LZO41ZN4jWucKQjYcAnmLV10+50ntCpkd0pMQrtlY0zoFFldXuVGXMXm2uX5i5E08iYO8vYDavUHGuAyOM3mfDdjD5nZii6VqTbKr8FgCnqo6ImnpuAGTRUNW6g2AoAMgtuVcP0NLaBIhn8UiOJYJ9tW2r4BtmKpTDr+qqmghHvpDn60ScxhfB8xE7tLTQ1WSQLw43tL8OjnGXix2BonUlUlaMnanzlev9jmhCkRBZtw24/OfxY0xGpEPWmU0k2LmcLc3O6AQfmjpXbLJ1ljKWV8FB/QpUD/dkYOKbiALuE94iHi5SopXy+y5AsKxQYJPD3YA8aYNBZO1uwasuslC4UxSyZVh/qCikPT/wVSVRNPA7JaYoWzT5Gj9J+jPmcODvOHQzHv8lU2IfjtWcUObJAkLwSPQdsr4KjCUDMppnD8t3SjRrEouKOTgJVgVWYlu+KxcR3bhyOGehPw2zkJyx67hk7jzFfZSJz8Ra/t0YoslbvxPRMQgfR7t8ZYdp57RnA+QhH8WPEzy49MG+z6Nal3safULTSDEOQnjPszNaDmQqQui9aI8Pcq4+4/sUHv4K5bD3MnrMvlf5RSU4i9oRhfPCGwFYRcAVL3LBH8f5Okt0amCxbb9QTYF4cGhW1JPowNOzPOJ7GjLr7t1CTqVkYPSpegc8RP86vUrusiY8lo=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199015)(36756003)(38100700002)(122000001)(33656002)(66556008)(66446008)(8676002)(66476007)(64756008)(4326008)(41300700001)(38070700005)(86362001)(83380400001)(71200400001)(6916009)(186003)(2616005)(478600001)(6486002)(4744005)(2906002)(8936002)(316002)(91956017)(66946007)(76116006)(6512007)(26005)(53546011)(6506007)(5660300002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <CE97A8E7F626EF49A84C2723E80306C4@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8733
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	307610ec-db14-473d-cad0-08dac250cbc7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	QAuqP9XWzWZCZpsk7HhkaJeQpKOABmPzzGuYOqE35E6GB4VE3Ql01IO7u621MwY4OmIirRN/Gl69b8Pd/jDueqA1JjXv0N9vtMoe2KVJefqDrsNPQB7uUVQugleaA/WY1cTWbASHs3bYy+7GEwraG+RYCoAPyda99VGGbg4ZJLI7KynNf75yg06cbpPUnWnt59IZjIf97UR2Ay4rLpifAmvrVdj4VFOrTaiXIFLo+sJp2W1oVsswjbzQAriABm+WrHHQPfm2HrrGwFywrbh3scc28hJsT+7PUFZuUHqmv3OqbNrLMTZffP8726HmSIh+TnoNQeW4x+mW0rIaEs5HOgqkwQKrRiweOKfXBgz6pFmTkLGynh0hxNeJyt+H0gU+LptEmBltov2RLnKj9Gv1bq5KleJ7OqmJDYLK+TMflOGyehVZmLYbSGmtWIUgK0tV1FYD+4/327Cby1vDIA1WBjpLjH2mPWRzURBLdqTjge1FgdkrbzkH02sYgDNBeo00r1mOTFyG4Iv4Ni8GhWQrSV8aNyT1ZQh4vV/Kv6bjClPcUmc8twDqS6eW/yzE0nBc/3KRUSe+Q8Tki96/wj9UPwxbdWBbRfK6WwJ8smwsU3P8y8eSpBQZI0ZtnJBxOQudXLB33Z2N8sWSw9ynm3U5q+CFY5LNx6w+u+7fwddiInv73aix9VY9Hl57pAWg9za2WejG7XfPsavj5gwfpBNp+L6yUKLv2AtQk95Iies+7hYYI187AVwEST4ezdBaEgdWpMRRuScfow6gmXEi9Ctva7FEVDoKBneAYZzEQB1L/Sf6aqDZyXZwJbcV2jIJc/O3
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199015)(36840700001)(46966006)(40470700004)(36756003)(82310400005)(8936002)(4744005)(5660300002)(6486002)(40480700001)(26005)(316002)(83380400001)(81166007)(356005)(82740400003)(4326008)(70586007)(8676002)(70206006)(41300700001)(2906002)(478600001)(33656002)(2616005)(6512007)(40460700003)(47076005)(53546011)(186003)(6862004)(36860700001)(86362001)(336012)(6506007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2022 12:49:18.3108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bbc83cb-e4e5-48c6-ea40-08dac250d0d6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB8650
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Nov 2022 12:49:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99496

T24gOSBOb3YgMjAyMiwgYXQgMDk6MzUsIE1hcmt1cyBWb2xrIHZpYSBsaXN0cy5vcGVuZW1iZWRk
ZWQub3JnIDxmX2xfaz10LW9ubGluZS5kZUBsaXN0cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToN
Cj4gDQo+IFByZXZpb3VzbHksIHdscm9vdHMgcmVhZCB0aGUgZWRpZCBpbmZvcm1hdGlvbiBmb3Ig
dGhlIGRybSBiYWNrZW5kIGZyb20gdWRldl9od2RiLg0KPiBBZnRlciB0aGUgbGF0ZXN0IGNoYW5n
ZXMsIGl0IG5vdyBnZXRzIHRoZSBpbmZvcm1hdGlvbiBmcm9tIGh3ZGF0YSB0byB1bmJsb2NrIHBs
YXRmb3Jtcw0KPiB3aXRob3V0IHN5c3RlbWQgc3VwcG9ydC4gRm9yIHRoaXMsIGh3ZGF0YS1uYXRp
dmUgaXMgbmVlZGVkLiBJZiBpdCBpcyBub3QgZm91bmQsIHdscm9vdHMNCj4gdXNlcyBod2RhdGEg
ZnJvbSBob3N0LCB3aGljaCBtYXkgbm90IGJlIHVwIHRvIGRhdGUuIFRoaXMgd291bGQgZW5zdXJl
IHRoYXQgdGhlDQo+IGluZm9ybWF0aW9uIGNhbiBiZSByZWFkIGZyb20gdGhlIGxhdGVzdCBod2Rh
dGEgdmVyc2lvbiBhdmFpbGFibGUgaW4gb2UtY29yZS4NCg0KV2h5IGNhbuKAmXQgd2xyb290cyB1
c2UgdGhlIHRhcmdldCBod2RhdGEgaW4gdGhlIHN5c3Jvb3QsIGlmIHlvdSBERVBFTkQgb24gaHdk
YXRhPw0KDQpSb3Nz

