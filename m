Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C88C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 12:46:20 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.69])
 by mx.groups.io with SMTP id smtpd.web11.6864.1678884377876872420
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Mar 2023 05:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=DQo0lDU8;
 spf=pass (domain: arm.com, ip: 40.107.20.69, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQO8BYTWTBLnQ0vakTrSuh+JyVfiDdjwCxfBzjvBnrc=;
 b=DQo0lDU8RUGyAnwh8nKX+9shmkvHE7Eg1X/8OLNXKkSEmIRM7Rc6Ke12QExUWKMwbBMvk9UuQDAoUQ5ngUikgBHCjBI46sJlPm7FsRDU6i54bpdTDiy2qZf5hfcz9JvzZCh5Rl22rbVzZQcSUihSRQklWFWueXETTuyO7+5kvp0=
Received: from AM5PR0402CA0010.eurprd04.prod.outlook.com
 (2603:10a6:203:90::20) by AS8PR08MB7321.eurprd08.prod.outlook.com
 (2603:10a6:20b:440::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 12:46:12 +0000
Received: from AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::5a) by AM5PR0402CA0010.outlook.office365.com
 (2603:10a6:203:90::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Wed, 15 Mar 2023 12:46:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT003.mail.protection.outlook.com (100.127.140.227) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Wed, 15 Mar 2023 12:46:11 +0000
Received: ("Tessian outbound cfb430c87a1e:v135"); Wed, 15 Mar 2023 12:46:11 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 88b144d54b5fa400
X-CR-MTA-TID: 64aa7808
Received: from c8b0ae4a3133.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 05DE1DEA-EDBF-404F-9075-76146192AEA5.1;
	Wed, 15 Mar 2023 12:46:05 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c8b0ae4a3133.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 15 Mar 2023 12:46:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j8g6tNaJRdrRZHLqz5HdmIBM3cJkARPyOUZ0gKLmhaIBLcJdXzSQyfG7DP/8AEgQs9MnBumoDD2gquad3LlPghv/08xD2TPZj/z1wrRwDCSokjkP9a1aGX+WQZ9OvZ4Qq5WXTJc6CaUNm0SkZNkgKR5b+6IoPXHS3GrYUDVVngIrY1RGn6Mm+PK76fR8cE3uji9S0UWRiKqsqWFTvgosbCnHy2KRc6oTveiud/n7HwOsnchXJMy/+KQS6W1PnTCx0tP7BT2XqyiFZ5weK0HRiUJfqhg8R6UZwE6Gha9aHHlhWUpyjheRXJV4aiUio1J76mZ4H4CwBJjtaCpOeH3u5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gQO8BYTWTBLnQ0vakTrSuh+JyVfiDdjwCxfBzjvBnrc=;
 b=YYW550EHNYUeJTeCWS7zYWA47tO4omeGEifxkqm2w8ChFYxN5nQgowvMw4D+fGcg+yNq7BuBa1ZI4q166ERoYvnC2Ku5A9NxqtFUBgqqr+r156noilVIf9mRnRbHgicgN18nPVvaLh0aGNTHdEug2wvDNSYsguCNvNkyCY9Mh/qvWpciG4QpS9g+BRatmYOJWC27GFQpJfRY87BuCJrlXd2ZgVDZXYVNpCgUL6PgS9tze1UUFF893tJSQvYMcycX9MGrz15sgzIfpQ3+q2gJU/Znz+XDUmQs4tUDwrSchosX4yXnfGVcI2IBJqIGqK85ekyKUoL0dRlnP+dWkVjUyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gQO8BYTWTBLnQ0vakTrSuh+JyVfiDdjwCxfBzjvBnrc=;
 b=DQo0lDU8RUGyAnwh8nKX+9shmkvHE7Eg1X/8OLNXKkSEmIRM7Rc6Ke12QExUWKMwbBMvk9UuQDAoUQ5ngUikgBHCjBI46sJlPm7FsRDU6i54bpdTDiy2qZf5hfcz9JvzZCh5Rl22rbVzZQcSUihSRQklWFWueXETTuyO7+5kvp0=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by AS1PR08MB7451.eurprd08.prod.outlook.com (2603:10a6:20b:4dd::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Wed, 15 Mar
 2023 12:46:04 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::e305:742e:e10b:1093%2]) with mapi id 15.20.6178.024; Wed, 15 Mar 2023
 12:46:04 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "zboszor@gmail.com" <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
Thread-Topic: [oe] [meta-python][PATCH 1/4]
 python_setuptools_build_meta_mesonpy.bbclass: New class
Thread-Index: AQHZVxTO7h3lJuGPbki1zHmLmrgMya77yf6A
Date: Wed, 15 Mar 2023 12:46:04 +0000
Message-ID: <25DB9C8C-6830-4DBB-9B27-4FB04C393F38@arm.com>
References: <20230315080429.2722555-1-zboszor@gmail.com>
In-Reply-To: <20230315080429.2722555-1-zboszor@gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3731.400.51.1.1)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|AS1PR08MB7451:EE_|AM7EUR03FT003:EE_|AS8PR08MB7321:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c2eb5a-6b9c-4cb1-9490-08db255341c0
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 NBqIIagWN+FnZ/Wt7c+t/Axq8LHrhHOOPmRo4w/rVfaPxn+tOpkRs2T9kRaJR+G+cnTjlfZiHjdCegD5+F81iyxQn+Nn8r2Qyy9T5RLxgnGYYcMf4QIXZz01e7yhZt2Leim7WNrrta+KQSbxWCfwYIM5JTctZVssDNykTSnyECjhGCPawMFo35SO39wlFbs2Cmy6ruGQOjkDY+VJnYKD+HXpxl6D8JxdGPpCsdKTwLbreuTIBPGODikvZDovzirxpUiusoDi/ZRcLaGCsyn1kbB4ZNOW+NCd77WFMdYBjn0A0JaPmFNDJyoTfeXN27ErrlW+Kwv4yFck96nO7yzvD0CWhUJeDByIqp7EPYAstYQ6NZIIYgtMtAF9YvehIP6Nbh18EXpkx18CImORjLQ8Jg2Yq7zVDuEmqbW7iSO75+6fAaSjcU+WQrWNBUuoG/3gz51dL5lfUXWEwCQSc5ivcF2BcS3nolcwNRpPxiGi0748jXNCZqr2pueVvwx/JQx9qyF8i+Xwi+s8TCCCMpDygvmvba48GBdck6PE+aQCpzN1I8F1PJH5h3VCo9JTRty9JMb2qeY0cQhWGJPNcHoOyta7DmBzcD8qoQpNhkNC/tNT5btj3TszIv7SuRM72WoH7fqjJ6fwuF9XM5CtCgPr3qjG8YXjI9N+/v8FMrGtKRwAXtbw1sYgVyjX4hz4Ozd3Ca2fbBy+g3lZVaBVdTMUoTsLXfrfmXfkreFSxByg9sE=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(38100700002)(33656002)(122000001)(316002)(86362001)(4326008)(38070700005)(8936002)(6916009)(41300700001)(8676002)(66476007)(66446008)(76116006)(64756008)(66946007)(91956017)(66556008)(2616005)(36756003)(478600001)(5660300002)(4744005)(71200400001)(6486002)(2906002)(26005)(186003)(6506007)(6512007)(53546011)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <172501A11B97E9488AB65AD10BE8CACA@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR08MB7451
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	781aa679-89a5-4982-5fe9-08db25533d35
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VsirNkNX3dEFVIW1K5h4CBzHcvpw8HjLqWb5DQ9kHoGStjtr82S5CWdwGrMtBor3LTLqPUP/uF8wkXKVP2KzLApK0prhdBd23v+IIwVLTG7MRvN/vEzIV+0lwpIuME6QaSkD8MJN8BzND1JCwxMuR7nHbqz6akUXUV1MUANaOQu0Pes9cLkSfZIVKz6FHs4RrilTqri1qudN3aZxNspWQJVSIDBBa/+1VCBQIrZIbuOHHEYRcfo94pdUy2eZLnRM4Siqv6/6wfaEKumrq36DwZeQrubsyGcciVYLh2vF56tnwygVbDZlWD95VHQ7KouZV2q5OEEVGsqW3AS/vpOyw+W8vWNo3h5KhHs8b6zOHlMgltB/Sa+Qdz1mGkmp/EHyVzVSuRugazvuNq7wHj6TKF/0B5q2AMu1gHXxp+eocekIh111sS99LjNFW2cahn6e9x3kec2MSGi9LPANPvTr68FpMfqdcpkOJ77AB6fOelXxQU93FxsymvKWPpYSURi08kXeaYDCdnMEoRFDUjz0RuGLDzWAF3cT2bXuhPgx50d3Cw1fZnULUSjZoir42zFMbAH4nlkw5YyqNQL3wrtTqGn73iiludNgnjS+FEk/u+9HmsZA4K/BBvzzdgdf8tpqCDXDCALZ70pB0zJbKcphADe+slPtzCbIJwYy4gdtGd5RkoegueW8ry7qUk5zKsXpvP4/FWjUFYzuOZWfpfkOzA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199018)(40470700004)(36840700001)(46966006)(82740400003)(81166007)(4326008)(41300700001)(82310400005)(36860700001)(316002)(356005)(70586007)(70206006)(8676002)(8936002)(6862004)(5660300002)(2616005)(40460700003)(478600001)(4744005)(336012)(47076005)(53546011)(26005)(6506007)(6512007)(2906002)(86362001)(186003)(6486002)(33656002)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 12:46:11.8085
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c2eb5a-6b9c-4cb1-9490-08db255341c0
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT003.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7321
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Mar 2023 12:46:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101537

T24gMTUgTWFyIDIwMjMsIGF0IDA4OjA0LCBab2x0YW4gQm9zem9ybWVueWkgdmlhIGxpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcgPHpib3N6b3I9Z21haWwuY29tQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+
IHdyb3RlOg0KPiANCj4gU29tZSBweXRob24gbW9kdWxlcyAoZS5nLiBTY2lQeSwgc2Npa2l0LWlt
YWdlKSB1c2UgbWVzb24tcHl0aG9uDQo+IChhLmsuYS4gbWVzb25weSkgaW4gcHlwcm9qZWN0LnRv
bWw6DQo+IA0KPiAgICBbYnVpbGQtc3lzdGVtXQ0KPiAgICBidWlsZC1iYWNrZW5kID0gJ21lc29u
cHknDQo+IA0KPiBUaGlzIGNsYXNzLCB0b2dldGhlciB3aXRoIHB5dGhvbjMtbWVzb24tcHl0aG9u
IGFuZCBpdHMgZGVwZW5kZW5jaWVzDQo+IHdpbGwgYWxsb3cgYnVpbGRpbmcgc3VjaCBtb2R1bGVz
Lg0KDQpTbyB0aGUgcGVwNTE3IGJ1aWxkIHRoaW5nIHByb3ZpZGVzIGRlcGVuZGVuY2llcyAod2hp
Y2ggd2UgaWdub3JlKSwgYnVpbGQgaXNvbGF0aW9uICh3aGljaCB3ZSBkaXNhYmxlKSwgYW5kIGF1
dG9tYXRpYyB1c2Ugb2YgdGhlIHJpZ2h0IHRvb2xpbmcgKHdoaWNoIHdlIGhhdmUgdG8gc3BlY2lm
eSBtYW51YWxseSkuDQoNClNvIHdoYXQgZG9lcyB0aGUgbWVzb24tcHl0aG9uIGludGVncmF0aW9u
IGJyaW5nPyAgQ2FuIHdlIGp1c3QgcnVuIG1lc29uIGRpcmVjdGx5Pw0KDQo+ICtERVBFTkRTICs9
ICJweXRob24zLXNldHVwdG9vbHMtbmF0aXZlIHB5dGhvbjMtd2hlZWwtbmF0aXZlICR7QCcnIGlm
IGQuZ2V0VmFyKCdQTicpID09ICdweXRob24zLW1lc29uLXB5dGhvbi1uYXRpdmUnIGVsc2UgJ3B5
dGhvbjMtbWVzb24tcHl0aG9uLW5hdGl2ZeKAmX0iDQoNCkZXSVcsIGFsbCB0aGUgb3RoZXIgcGVw
NTE3IGNsYXNzZXMgaGF2ZSBhIOKAnG5lYXTigJ0gZGVwZW5kcyB3aXRob3V0IGxvZ2ljIGFuZCBl
eHBlY3QgdGhlIHJlY2lwZSAocHl0aG9uMy1tZXNvbi1weXRob24tbmF0aXZlIGluIHRoaXMgY2Fz
ZSkgdG8gcmVtb3ZlIGl0c2VsZiBmcm9tIHRoZSBERVBFTkRTLg0KDQpSb3Nz

