Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CFCC7618A
	for <webhook@archiver.kernel.org>; Mon, 20 Mar 2023 16:09:45 +0000 (UTC)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (EUR01-VE1-obe.outbound.protection.outlook.com [40.107.14.72])
 by mx.groups.io with SMTP id smtpd.web10.18726.1679328584289949797
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Mar 2023 09:09:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=N+jzhcoK;
 spf=pass (domain: arm.com, ip: 40.107.14.72, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ipYitkhgf2tV7UmjvaZwuFlI57BhdO8i+4V+mBYj70=;
 b=N+jzhcoKubLFujXEvkLHrhrVlAfihPhuUW9FlZjCW8WuDGpTkAmJ1wXLU+/vvsvjy0LYgAmUfaNsc7dfhYuIvbPhwdWfE8G5H4Zy5kAvA7Ri6Z7kKpRUxiWFOyZdyZGUulSDVPUWYgEGUDSxfXj5Oaj/cVb0n0Qp6mAIolOA9Rk=
Received: from DUZPR01CA0087.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46a::18) by VI1PR08MB10073.eurprd08.prod.outlook.com
 (2603:10a6:800:1bc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:09:40 +0000
Received: from DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:46a:cafe::b7) by DUZPR01CA0087.outlook.office365.com
 (2603:10a6:10:46a::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 16:09:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT018.mail.protection.outlook.com (100.127.142.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 16:09:40 +0000
Received: ("Tessian outbound f2a8d6d66d12:v135"); Mon, 20 Mar 2023 16:09:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0f6d174191028bab
X-CR-MTA-TID: 64aa7808
Received: from 36c3dc04d26a.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8CA60AD6-033B-430F-A9AE-913F6D299C56.1;
	Mon, 20 Mar 2023 16:09:33 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 36c3dc04d26a.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 20 Mar 2023 16:09:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f+jvRnvfGVXSQLF0hc2gfOWSpMas2+V0p2SNTvugfryRFDZwrQ/Plmqik8vhPqaxyIHeLIKMdy1N0MyP/HpOHadl1iOYd3Wf2H5/3wsJZU1yu5MHV1h0bP366rQJpi+1vxdAiRva55i1Md5W5rhA6t8bl4brzLYNnXTNam6mmyeO0q34Vrm7hCOeAcetFBZBpNsSaWdlnK1gkuJHReNeaoz5nqAzuqmEwq2k7RU/1RIX6RSBrJU2MT+pc0VNjCJCABiwn+YLaESInz6VE4dr5H6DFlkE5qxdkPckSV1gXcz02/9ezwf4zKzAemqh7rr+MdYB+KDOMyY4o5DL50CsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ipYitkhgf2tV7UmjvaZwuFlI57BhdO8i+4V+mBYj70=;
 b=aD+hvr+/V4faTgulpy5HNf1O0QtxyI/iR4QhoRc69euKxnOAPpPjI5H3E42a2iF8j6WIer2jO14Qxt6IaZXzByWZljUwyDRD2o9ypv1MJgmNWK6KWvoWXCQRGNztnjBM8tYFdt5fY5we/BbhwwDeBcCwkKZRbcqCS5UMirktQtpi4XfjbQxmQGqT2LldYHeIA+biqItK0woDQc3QLsQ+nxpp4nTwLiYd/rnbNRESEJ3KnrTl93D1eOP1hTnaseLSCaI3JQpXe6YGe6MVV3hwIZsPcjPQOB6LHm+VPqT2HlzjBeSHCJXOiJv6hhUwyeWbK2qM7p5WlfS35PadRW8Q3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ipYitkhgf2tV7UmjvaZwuFlI57BhdO8i+4V+mBYj70=;
 b=N+jzhcoKubLFujXEvkLHrhrVlAfihPhuUW9FlZjCW8WuDGpTkAmJ1wXLU+/vvsvjy0LYgAmUfaNsc7dfhYuIvbPhwdWfE8G5H4Zy5kAvA7Ri6Z7kKpRUxiWFOyZdyZGUulSDVPUWYgEGUDSxfXj5Oaj/cVb0n0Qp6mAIolOA9Rk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB9PR08MB6428.eurprd08.prod.outlook.com (2603:10a6:10:263::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 16:09:31 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Mon, 20 Mar 2023
 16:09:27 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: =?utf-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH v2 2/4] python3-patchelf: New recipe
Thread-Topic: [oe] [meta-python][PATCH v2 2/4] python3-patchelf: New recipe
Thread-Index: AQHZWKHDh6j5P2uEfEO97aL5GAaPjK8D22WA
Date: Mon, 20 Mar 2023 16:09:27 +0000
Message-ID: <6EF2E102-0CB2-4C98-8A0F-048EB096A5A4@arm.com>
References: <20230317072547.1031123-1-zboszor@gmail.com>
 <20230317072547.1031123-2-zboszor@gmail.com>
In-Reply-To: <20230317072547.1031123-2-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB9PR08MB6428:EE_|DBAEUR03FT018:EE_|VI1PR08MB10073:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cd3a631-ad5f-412b-ef02-08db295d8277
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 b8Fk8z9mq8H4D3iakDBnDcAwUL83p1JLdUjf51kj6CMqS3TFIoxs9EAcE6dfaxI2O9l36nzDN5Jl06TygUP6w4ob393WrgniIo0mKI4x4kI/8+q4TJS+wMBVSSX+qkxKVyGWoS5mOA91NbUJxG0yqcQ7ByeZw5KPK+3G8iUKCF4k3z9cOVUv7i3L6W3Yz97SKaMHj86WJ7sIYCDO8tCm4OefWIGXgajfguHVjVnYNrk5kffeeq8vf2ccfUZxeYP8aNQU9T2S3oI5vBrGqcBRfovOFuwbRKQgiaUTN2kRoRSBf9oYgKHcgNb2IxsoXtfqcFj2uvR8UI5OfcpV3uxOJIiCk0Ii6SEvq+FtRv6yLhRvr/BAxHrP4KYqhfVUqd0Nv6PrmdN8k/W6wlo6s0J3AIn0TwBRmPk/7c9il51FeXOpDyLXGhkXMNfk5iKA9f0/zow4TrPLf3oH1VVOQdQiZRPFbMIWnSEzhf1cOU1I1e99kJ5GDkXo9wjFKQWhUA2KRbEIJV4Gmzn0e+Gx/VQjHD+X0djjwwYJBNyB2RXiBawUxOrLl+JDRtBGGLz7MfybBfO5Lt3lCX8OzpaLgmPg1B6hDgAEqSsqLHFovrK9blVjagcP+AQxGuzn0ICHVHqCzCvHkSlsfD0EEE+YYjs1823KK+ME9XBpIhUmlc9Bm4lG5+BJXGG09jjC20hvGXxSmmyc5MxVBHlDOjli/cjcOypEwaXlv47CiAwrDw1qj08=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(396003)(376002)(346002)(366004)(136003)(451199018)(2616005)(478600001)(86362001)(38070700005)(38100700002)(122000001)(4326008)(66476007)(66556008)(41300700001)(8676002)(66446008)(91956017)(64756008)(36756003)(8936002)(76116006)(66946007)(5660300002)(2906002)(6916009)(4744005)(53546011)(26005)(186003)(6506007)(33656002)(6486002)(71200400001)(316002)(6512007)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <FBEEFEC69BE543429B1FD090574D70E1@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6428
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	850782f2-c60c-4039-c9ef-08db295d7afa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	aGTJA6kl9OQp3hjXA04hEtHXw3t4mn+2PTrVgVLJ4ouDzi1obS4SV5MhWmBLgLqlLzpNZvrPqrP6ctW+b9SY+pHW9v9KRLsaBUoOpN2XlFhSYec9+MXWhGe74fhVgm1jDfhHzv/zwqma4a9B5oCIAHFbhpE2mTOvhOWCFGGt+q+pSx+EKIzD3pEzritc6sOap8xAORnnOA982CVLXQT9c5KqNR27gRBkrNDasykx6mterQ8LZ8vPaoomxVHc+Wc3GwsEBsjfwH4KHAagyO9KPpHPZobuICngY8dTPazMhx4QbavoU2haaMCvhV9lF0bBHIc8lQg+V2NZg2+8JMyymBGFxR2g+hncOVr5d05RxHMF2crAll8ChOYSNs4drqcvN3CKr6149zx2HJSjfFI8iigQc8OsJWbmuhCYGipAYcXteYAaPye53yAph0SX/7NS9H75ee6vUU2LFrdXu3719ftTZxiQcIQFIm4RmiQtFDHlBGkeR/xWnl5HB3dbaubW29mqo/mmxEuJpQ1LByN9iMppLinNZ+PqNUJaaim4rnAlwsyD5iFKNzZoeBkh5Aq/cgultOJxWwEdIBB5471OFNDkkKBnIjMRgEE0gtJ6cDrP3odex0MyQkUGi/rKc2RD0K0m866/dUJKpxVQ3/ysI3jqcE/Wap7LIWRJzrbkesELIUrzYOVPEJhYBxPDAd/rJxtmLhLADmM6srb4sKC96g==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39850400004)(136003)(346002)(451199018)(40470700004)(46966006)(36840700001)(8676002)(70206006)(5660300002)(4326008)(186003)(70586007)(41300700001)(8936002)(26005)(316002)(6862004)(478600001)(2906002)(6486002)(40460700003)(6506007)(53546011)(6512007)(36756003)(33656002)(40480700001)(2616005)(336012)(82310400005)(81166007)(86362001)(356005)(47076005)(36860700001)(82740400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 16:09:40.0496
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cd3a631-ad5f-412b-ef02-08db295d8277
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB10073
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Mar 2023 16:09:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101613

T24gMTcgTWFyIDIwMjMsIGF0IDA3OjI1LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiArIyBUaGlzIGlzIGEgZHVtbXkgcGFja2FnZSBuZWVkZWQgYnkgcHl0aG9uMy1t
ZXNvbi1weXRob24NCg0KSeKAmW0gbm90IHN1cmUgSeKAmWQgY2FsbCB0aGlzIGEgZHVtbXkgcGFj
a2FnZS4NCg0KPiArREVQRU5EUyA9ICJweXRob24zLXNjaWtpdC1idWlsZC1uYXRpdmUiDQoNCklm
IHlvdeKAmXJlIG5vdCBidWlsZGluZyBuYXRpdmUgY29kZSB3aXRoIGNtYWtlIHRoZW4geW91IGRv
buKAmXQgbmVlZCB0aGlzLCBqdXN0IHN3aXRjaCBza2J1aWxkIHRvIHNldHVwdG9vbHMuDQoNCj4g
K1NSQ19VUkkgKz0gIiBcDQo+ICsgICAgZmlsZTovL0NNYWtlTGlzdHMudHh0IFwNCj4gKyAgICBm
aWxlOi8vcGF0Y2hlbGYucGF0Y2ggXA0KPiArIg0KPiArDQo+ICthZGR0YXNrIGRvX3BhdGNoYnVp
bGQgYWZ0ZXIgZG9fcGF0Y2ggYmVmb3JlIGRvX2NvbmZpZ3VyZQ0KPiArDQo+ICtkb19wYXRjaGJ1
aWxkICgpIHsNCj4gKyAgICBybSAtZiAke1N9L0NNYWtlTGlzdHMudHh0DQo+ICsgICAgY3AgJHtX
T1JLRElSfS9DTWFrZUxpc3RzLnR4dCAke1N9Lw0KPiArfQ0KDQpVc2Ugc3ViZGlyPSR7U30gdG8g
cHV0IHRoZSBDTWFrZUxpc3RzLnR4dCBpbiB0aGUgcmlnaHQgcGxhY2UgaW5zdGVhZCBvZiBkb2lu
ZyB0aGlzLg0KDQpIb3dldmVyLCB0aGlzIHJlY2lwZSBkb2VzbuKAmXQgYnVpbGQgcGF0Y2hlbGYg
YW5kIGRvZXNu4oCZdCBoYXZlIGFueSBweXRob24gY29kZS4gU28gd2hhdOKAmXMgdGhlIHBvaW50
IG9mIGl0Pw0KDQpJZiB0aGVyZSBhcmUgcGFja2FnZXMgd2hpY2ggZGVwZW5kIG9uIHRoaXMsIGVp
dGhlciBwYXRjaCBvdXQgdGhhdCBkZXBlbmRlbmN5IChhcyB3ZSBjYW4ganVzdCBERVBFTkQgb24g
cGF0Y2hlbGYtbmF0aXZlKSBvciB3cml0ZSB0aGUgZmV3IGxpbmVzIG9mIHB5cHJvamVjdC50b21s
IHRvIHNoaXAgYW4gZW1wdHkgcGFja2FnZSBkaXJlY3RseS4NCg0KUm9zcw==

