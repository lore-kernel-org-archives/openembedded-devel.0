Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A327CCDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 09:51:47 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web10.204762.1697536297173758501
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Oct 2023 02:51:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bFZIUM7K;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=bFZIUM7K;
 spf=pass (domain: arm.com, ip: 40.107.22.56, mailfrom: ross.burton@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tfziu/a+oY+lhnqjRkBGMt5w2FLz0MHPqFqpT7etDQ=;
 b=bFZIUM7KPRp8ArzIBJLImgopusczAoX2D309Aau06pMSxLFhc8/RPvVT6sGUbgh4pz0tplYCJaop5hkzUVZwvpJ9RKZY+jcHtwWpFKH1SfO4LzrsdQRjAtzCqSA+gAYKQwTgeSrGF3tLMUiL4uogQfsPgTAI9k+biHFvM/1OECk=
Received: from DB3PR06CA0005.eurprd06.prod.outlook.com (2603:10a6:8:1::18) by
 AM8PR08MB5747.eurprd08.prod.outlook.com (2603:10a6:20b:1c7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 09:51:32 +0000
Received: from DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::3) by DB3PR06CA0005.outlook.office365.com
 (2603:10a6:8:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21 via Frontend
 Transport; Tue, 17 Oct 2023 09:51:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT034.mail.protection.outlook.com (100.127.142.97) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.20 via Frontend Transport; Tue, 17 Oct 2023 09:51:32 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211"); Tue, 17 Oct 2023 09:51:31 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 14eea85084b062ac
X-CR-MTA-TID: 64aa7808
Received: from 5134a7478252.1
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 8348D728-51AA-424F-B3D0-E9D06CFE168D.1;
	Tue, 17 Oct 2023 09:51:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5134a7478252.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 17 Oct 2023 09:51:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c2c2Whk5VF1CFIeVyDYpbr+a+T6ctubnnnXirrygYkJZ8SvMKDt26JoX9Y1fuwVBwaqF7Z3/NnaFkHr9iCoey3eWP2bjIm+HH6akkDHfmru1gGFR25ogh4OaGhkgvFRWF7Lp+kU6dNpWdFeUKo6G+Eld4dSf4tGEMQ6PKX70Ll7AcJFNV54FPWfmDP9mK1tpT7Ljs4oHmkMmri4cOMn9r6KjCx1q/gCMlyAu7194Trj26sbWWC6yd0pNqp44ONigj8xdw+UdFNeC2Rfl3QLz3gJEHE4h+CZB1wlpgjtUooLEvNr5+cBC0iTT7ki1RqVtBqj6/SHjvJSt4jzGYzOuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Tfziu/a+oY+lhnqjRkBGMt5w2FLz0MHPqFqpT7etDQ=;
 b=VJuv2uwaOaDuydFmKG0+qeuBc/bZrTlhtSLFBfBcciCPN1Rapkls/eG+j6eLViCy+xbEgDa2WH7kUs5Qw8JPgQHAlFqAWPyslqo+kR3HCeSzTxTlvzm4ItvLJ1wIFgyAV1ZVwlYXFJR5R672X2ej8npz5ZY4PHle+a2U/ph4VFtQEMrZVz9IYFrNhkjX85Vvk8BgNZTu1rCDGYN5GP57rxeBpVN1oq+4h9pfiEQYExZq181+p/VAYvGUF7bQFLiEy1FIluMHSpQMml+qmeTnz/TgjSQghBOqpnOpM6ZVBCnataxWOfZNjT4FJFxcau+N/zo++m/9dRJGrZbg5eLxDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Tfziu/a+oY+lhnqjRkBGMt5w2FLz0MHPqFqpT7etDQ=;
 b=bFZIUM7KPRp8ArzIBJLImgopusczAoX2D309Aau06pMSxLFhc8/RPvVT6sGUbgh4pz0tplYCJaop5hkzUVZwvpJ9RKZY+jcHtwWpFKH1SfO4LzrsdQRjAtzCqSA+gAYKQwTgeSrGF3tLMUiL4uogQfsPgTAI9k+biHFvM/1OECk=
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com (2603:10a6:102:2a3::12)
 by DB3PR08MB9036.eurprd08.prod.outlook.com (2603:10a6:10:435::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 17 Oct
 2023 09:51:23 +0000
Received: from PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5]) by PA4PR08MB7411.eurprd08.prod.outlook.com
 ([fe80::1817:56f3:7623:c4a5%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 09:51:23 +0000
From: Ross Burton <Ross.Burton@arm.com>
To: "wangmy@fujitsu.com" <wangmy@fujitsu.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Topic: [oe] [meta-oe] [PATCH v3] dnf-plugin-tui: create symlinks from
 /usr/ to /.
Thread-Index: AQHaAMrr5s4TNXaac0SeRiAciSxlg7BNvVeA
Date: Tue, 17 Oct 2023 09:51:23 +0000
Message-ID: <7F1CE9DA-A95C-4079-9436-F8D233A6A116@arm.com>
References: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
In-Reply-To: <1697527418-5791-1-git-send-email-wangmy@fujitsu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	PA4PR08MB7411:EE_|DB3PR08MB9036:EE_|DBAEUR03FT034:EE_|AM8PR08MB5747:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c408ca-116a-47bf-bce5-08dbcef6a485
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 JnzzG0YqUsUWknHvG2ssu1cWnzRjjo/DHi1GKrcA+eIYnaSuofovDwewqVzOQCBjceb+Y9kFNM/UG+7AZEO9+Ahf8z3kGyuWfyD+5YjlwmGWIuGJREwx2uYk80s0pta/yKwJNNhnnL85tCb0aLj0jUHXswXcu80TRnbMI7gl5RjnaBECPjO/xEF4mpzGUHBgkRJG1eLpN7MaNLQ1MoFNBfz9Yv2Z44vef4vX9Kw+h+X0L0zysi5lJYyFB1Vf0dlf4IBfOL6LTJDkG8k9N9fJBbvSbv38vaXexbBC7MFfUzmgTxSP7SNyKXDtBCcCY/3d34MbeOtz5H8swGgb1fWe0tZLwSnqSprM/+giXErwinBo4bDv4ZepNk2LTrZyPOuTP47a25c9m1siiiB4zJu+Ztp/eW7qp8gc8WSpHfkOHsLhigVa0W7GNGMmWYa46n+8GpuEqHKJT4vuyc7BS2S3608N79FkT8D0QPh8a8ZnYeDU0qfqI+LAmnmqVF4sSl8GabZyEH4hjxzbPqVlf8YITmQucCeeGuHnopJWdp0zRfuHdYqPYmgby9Quqr4aI5KRLzFa8g2E/NymxCjKyhCl1oLLByFj92QDl6LyYQi7KbVgLiuuaTbTg2K7S/8pgq8yrJD+GACgJM3U2AfEyI/2FRNGJ5aeaeupjIaUY9BbfoQ=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR08MB7411.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(39860400002)(366004)(346002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(66899024)(26005)(71200400001)(6506007)(2616005)(966005)(8936002)(53546011)(6512007)(83380400001)(41300700001)(5660300002)(8676002)(4326008)(2906002)(6486002)(478600001)(76116006)(316002)(91956017)(66946007)(66556008)(6916009)(64756008)(66446008)(66476007)(38070700005)(122000001)(38100700002)(86362001)(36756003)(33656002)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-ID: <3984B37CF3E84D4D8005B2A18E5F91E6@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR08MB9036
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	7a9f507b-1a6a-48fe-fa96-08dbcef69f93
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MmPV8+OCwq3apwG6k4G31khxcfNSYPbaG0ZjRLf36j81lLK1Ous3/QCxADCg7JFS6b5y71mHvCFGO/9Tsw37gCd0+63n7wKCL6FenzLbTIPhLIzL3cdCoKZ6oE4pSbjPesxhfqQ8cz8277WMgTfmH3KEeUgufHrIWW74l3UjgQy9Td3d+5joQSQbfkiEzLVhQQUYMpUgmi//9BCE//1SP4qaXCTR6lcDKlped5K/saK3IlsHWj93/LV9QXYt8ECGiS72XJrCyA+Pd9BDDY+evlaZWPPFmkyHbRwVEtNXiJKqIgXzul6fCy0Gyzu23F+INTlvFMOQWNGeFkVaCphM6Tgj7BGiS08rdBXRJ/KRY336F6eOKelq3PpRFY9MVuU3wmsu9T/j99Yl+1Do24RuGpTm3nh2NeqiuT9c+t1o5PSJPWN9O55viZHTjyZfvXUnc8Y4iHwwNGIYo7IIHPWPago08CwY5S0k/A+fnbWYzF209luieXZOVV5BhQQVx4Nx8K6r535FlMEWnA66NpivHiuoZV4CXBgXcQPNg20JqBnLfjXo7dOb+du+fClBeVt7Erev3NaPEBfd8BD0IC0NTREvaYOCjT8GJk0HyhOO4HiRMCei40rIRvjMX3JEB9Jyh4Q7KvroETuazbgLgHdCdd8pjt8gds9aPhxfyjAJqQizgmwrhTpEuoi54GbtsMLsZV/yx5c13usFG4FQDRUmRpLKWNZMi9cS2RAi5w3f8RQ/xXyrvCZZ7n+bemVfL92hMiv57w9hqZIFU6eemmrcKA==
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(346002)(39860400002)(376002)(396003)(230922051799003)(82310400011)(1800799009)(186009)(64100799003)(451199024)(36840700001)(46966006)(40470700004)(41300700001)(81166007)(40480700001)(356005)(966005)(6486002)(86362001)(2906002)(478600001)(36756003)(53546011)(70206006)(70586007)(36860700001)(6512007)(6506007)(316002)(8936002)(8676002)(40460700003)(26005)(82740400003)(336012)(2616005)(83380400001)(66899024)(6862004)(4326008)(47076005)(33656002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 09:51:32.0405
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c408ca-116a-47bf-bce5-08dbcef6a485
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DBAEUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5747
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Oct 2023 09:51:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105551

SXNu4oCZdCB0aGlzIHdoYXQgY3JlYXRlX21lcmdlZF91c3Jfc3ltbGlua3MgaW4gaW1hZ2UuYmJj
bGFzcyBkb2VzPyAgV2h5IGRvZXMgYSBETkYgcGx1Z2luIG5lZWQgdG8gZG8gdGhpcywgYW5kIG5v
dCBhbnl0aGluZyBlbHNlPw0KDQpSb3NzDQoNCj4gT24gMTcgT2N0IDIwMjMsIGF0IDA4OjIzLCB3
YW5nbXkgdmlhIGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcgPHdhbmdteT1mdWppdHN1LmNvbUBsaXN0
cy5vcGVuZW1iZWRkZWQub3JnPiB3cm90ZToNCj4gDQo+IEZyb20gUG9reSA0LjMsIGJ5IGRlZmF1
bHQsIHVzcm1lcmdlIGhhcyBiZWVuIGVuYWJsZWQuDQo+IFNvbWUgaW1wb3J0YW50IGJpbmFyaWVz
IGhhdmUgYmVlbiBpbnN0YWxsZWQgdG8gL3Vzci9zYmluIGluc3RlYWQgb2YNCj4gL3NiaW4gc3Vj
aCBhcyBpbml0LiBTbyBpdCBpcyBuZWNlc3NhcnkgdG8gY3JlYXRlIHN5bWxpbmtzIGZyb20gL3Vz
ci8NCj4gdG8gLywgc3VjaCBhcyAvdXNyL3NiaW4gdG8gL3NiaW4sIC91c3IvYmluIHRvIC9iaW4u
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIE1pbmd5dSA8d2FuZ215QGZ1aml0c3UuY29tPg0K
PiAtLS0NCj4gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVn
aW4tdHVpX2dpdC5iYiB8IDIgKy0NCj4gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYiBiL21ldGEtb2UvcmVjaXBlcy1k
ZXZ0b29scy9kbmYtcGx1Z2luLXR1aS9kbmYtcGx1Z2luLXR1aV9naXQuYmINCj4gaW5kZXggOTQw
MjM5MjJhMi4uMDcwOTAxOTA1NiAxMDA2NDQNCj4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRv
b2xzL2RuZi1wbHVnaW4tdHVpL2RuZi1wbHVnaW4tdHVpX2dpdC5iYg0KPiArKysgYi9tZXRhLW9l
L3JlY2lwZXMtZGV2dG9vbHMvZG5mLXBsdWdpbi10dWkvZG5mLXBsdWdpbi10dWlfZ2l0LmJiDQo+
IEBAIC00LDcgKzQsNyBAQCBMSUNFTlNFID0gIkdQTC0yLjAtb25seSINCj4gTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQy
NjMiDQo+IA0KPiBTUkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vdWJpbnV4L2RuZi1wbHVnaW4t
dHVpLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIg0KPiAtU1JDUkVWID0gIjgzOTE3
YTM5MzVhYzdjZTFkOGQ5NmU5MTRkOTZhNjY3OTMxOWEzMzYiDQo+ICtTUkNSRVYgPSAiYmFhYzMy
MmE4YTZkNTdlNjJjNzAzZjZlZDUyMzE1MmJhZWMxOGI0ZiINCj4gUFYgPSAiMS4zIg0KPiANCj4g
U1JDX1VSSTphcHBlbmQ6Y2xhc3MtdGFyZ2V0ID0gIiBmaWxlOi8vb2UtcmVtb3RlLnJlcG8uc2Ft
cGxlIg0KPiAtLSANCj4gMi4zNC4xDQo+IA0KPiANCj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0N
Cj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+
IFZpZXcvUmVwbHkgT25saW5lICgjMTA1NTUwKTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQu
b3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA1NTUwDQo+IE11dGUgVGhpcyBUb3Bp
YzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMjAxMzM3NC82ODc1ODg4DQo+
IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBVbnN1YnNjcmliZTogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL2cvb3Bl
bmVtYmVkZGVkLWRldmVsL3Vuc3ViIFtyb3NzLmJ1cnRvbkBhcm0uY29tXQ0KPiAtPS09LT0tPS09
LT0tPS09LT0tPS09LQ0KPiANCg0K

