Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2485C636CC
	for <webhook@archiver.kernel.org>; Fri,  3 Feb 2023 08:10:08 +0000 (UTC)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (NAM11-BN8-obe.outbound.protection.outlook.com [40.107.236.41])
 by mx.groups.io with SMTP id smtpd.web11.4818.1675403341716839320
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Feb 2023 21:49:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@elektrobit.onmicrosoft.com header.s=selector2-elektrobit-onmicrosoft-com header.b=N7yD4ZcV;
 spf=pass (domain: elektrobit.com, ip: 40.107.236.41, mailfrom: simone.weiss@elektrobit.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2BfRpmmD0pG5uq8nG9sFx5lLyy62rIfksSzXX6zRxs=;
 b=N7yD4ZcVpS6uTWq91jPKH5knufQwaOdw3PplVVHAHPSywIAsZnjmlHYk8aSPR4T7t11HpB31nv8QvM7wGNDvNr3Avl7EX6yh3cym5cnJoHBFTvWMqNHjUGvqJyvk7HCQmjKAC6xC4Se2ZA8k2Yoafans+NbDrVbp3WKB9taJ0J8=
Received: from MW4PR03CA0293.namprd03.prod.outlook.com (2603:10b6:303:b5::28)
 by SN4PR0801MB7743.namprd08.prod.outlook.com (2603:10b6:806:202::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36; Fri, 3 Feb
 2023 05:48:57 +0000
Received: from MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
 (2603:10b6:303:b5:cafe::a5) by MW4PR03CA0293.outlook.office365.com
 (2603:10b6:303:b5::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.27 via Frontend
 Transport; Fri, 3 Feb 2023 05:48:57 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 4.79.107.243)
 smtp.mailfrom=elektrobit.com; dkim=pass (signature was verified)
 header.d=elektrobit.onmicrosoft.com;dmarc=fail action=none
 header.from=elektrobit.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 elektrobit.com discourages use of 4.79.107.243 as permitted sender)
Received: from usbth1es003.ebgroup.elektrobit.com (4.79.107.243) by
 MW2NAM12FT063.mail.protection.outlook.com (10.13.181.102) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.9 via Frontend Transport; Fri, 3 Feb 2023 05:48:57 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04lp2057.outbound.protection.outlook.com [104.47.12.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by usbth1es003.ebgroup.elektrobit.com (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Feb 2023 21:48:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUCsCgk3+Ys1DRtZw8uo/4oJNihaxfZUUTQTZ9MSbu86VRYIA+5WPj4DDhflgIRTog0QeUGuZreGJGrKrSHrMWYuVT7aEfkmenaHgnuR318mTIhyWeyWUV2AEgzKxd//t+nIdmHBfX01HKaDhngLPd/hPJORDuLVbsfdKkjRokJ/rmRaxgT/VZ/2aSGNqgin9ZS9RM83lFtAMEfIfRm9KiGVQUfVZKM21S163LPahhLEu2edjQnzfl30C9z5TPG4ddaxLAHlDZOMMx2vYyJ9lraM99MTr0SuRO8+pQMGUNOJ+Ze1EFMB1jRHfq/vLvaQzfoJbKAds+ZqMfjKcUJoZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y2BfRpmmD0pG5uq8nG9sFx5lLyy62rIfksSzXX6zRxs=;
 b=Y2OoraMX3kUzcuay/Lg7swJbbBbsVbSmApWatGPLo+Dujilr9UhrFAa3maYD58gohfElxvUDAs5vJIca8ov2argTJBoYvjIBgnIn26KT2WORtcktoXL+A35FJcVmjLl5fGFv/dtlx+B2gJ9D4Pm0k2IsPoyB+m65prf38PcifuY83cfab0bD03ADQjn7mYGE2F6sVlAV8JTd1VXwov4+U0cSbGkW8dd5MUodSAdeEGCoISdW8wuJs+pYhVv5xjBRLI8NFe6DyVWVwEkquC5swqHR71lYdboPGnIm1FcnDgsj2/HhPQkCR/LxooDxewSjf4B9Q233KTmRp/oiB4yU1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=elektrobit.com; dmarc=pass action=none
 header.from=elektrobit.com; dkim=pass header.d=elektrobit.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=elektrobit.onmicrosoft.com; s=selector2-elektrobit-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y2BfRpmmD0pG5uq8nG9sFx5lLyy62rIfksSzXX6zRxs=;
 b=N7yD4ZcVpS6uTWq91jPKH5knufQwaOdw3PplVVHAHPSywIAsZnjmlHYk8aSPR4T7t11HpB31nv8QvM7wGNDvNr3Avl7EX6yh3cym5cnJoHBFTvWMqNHjUGvqJyvk7HCQmjKAC6xC4Se2ZA8k2Yoafans+NbDrVbp3WKB9taJ0J8=
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM (2603:10a6:102:1a3::10)
 by AS1P195MB1399.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:4ab::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 05:48:54 +0000
Received: from PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::3e59:b70d:f2fa:db8d]) by PAXP195MB1231.EURP195.PROD.OUTLOOK.COM
 ([fe80::3e59:b70d:f2fa:db8d%4]) with mapi id 15.20.6064.029; Fri, 3 Feb 2023
 05:48:53 +0000
From: "Simone Weiss" <simone.weiss@elektrobit.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "Tomerius, Kai" <Kai.Tomerius@elektrobit.com>
Subject: Re: [PATCH 1/2] minicoredumper: Add ptest
Thread-Topic: [PATCH 1/2] minicoredumper: Add ptest
Thread-Index: AQHZN5KSDKLMdE5tlUChYzJMsQ0wqK68tzqA
Date: Fri, 3 Feb 2023 05:48:53 +0000
Message-ID: <342201c762be66b67711edd865d072230d0dcbd9.camel@elektrobit.com>
References: <20230203054415.5958-1-simone.weiss@elektrobit.com>
In-Reply-To: <20230203054415.5958-1-simone.weiss@elektrobit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=elektrobit.com;
x-ms-traffictypediagnostic: 
	PAXP195MB1231:EE_|AS1P195MB1399:EE_|MW2NAM12FT063:EE_|SN4PR0801MB7743:EE_
X-MS-Office365-Filtering-Correlation-Id: c75beb60-01d9-4501-6909-08db05aa57a0
X-SM-outgoing: yes
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 zCjNIi05l/gTZvPMFpxs0FSR4TCXeF5M2ZIYQvAGrODnhFSSIimjhJgY22WV5sCXI5ae214k/CEC3tm0z+APjnhAeWCe6RvY0Wp8UITXOKSp5bTTQBqr5VAVbf/KCl6OjqqPxZZT1N88LYVWmMsC86NEM9A6vSh3KfEy09NJiZRKKZxV0BPpD9tyThUE1KRULTvpn5r+ExHl9JCy7fBi3y5qXnxLi2xQI7OB4DQzwkN9ahui+vA1fAbZjuG9GODWTGZmJdrhDHbi5c+7+iTMmICzguiXZ3uvMZeSAamf7yXAZ5bhmlg0Z6xxjg/+sK5aAGBHqYt382y+0NYPYSTApHqcueqZoib+MQsePXGMTpRmNrUayCdINLCc7ZDNVrzA22au9/Umf5nM4NGMYdexAXwGNmFe5gCzjNPRdyMmxsk73t2GrE+VuRR7GaTCt7iJ6PzG/Zo7UYeQ6vpaAIYhFMg9w9clPtDk25/pp35XLrRaJ3Ns6SSdd/uuPw1afFA+Vwp65KKIxI64sYnRJWu1TwadraIWbf00oWDqNATOR5VU8Sx/84I4yaaOmPbajIUKq+FXh09+xeL/+7/5lUDSZ2noS6eivXIhao4bEphaod0YWlC40Qlabj8OthsV2szgsGHZ8wqsiur/qxxmCnP16pAL7Ecpb0lZ6bjBvBKVYDkOrmjCGH/b4v53GOmV2t4A6DPn7Vpy2fHhS5Pw6CusX3R3fto6yE88osYcz8zarhU=
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXP195MB1231.EURP195.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(4636009)(346002)(366004)(136003)(396003)(39850400004)(376002)(1590799015)(451199018)(316002)(6486002)(478600001)(91956017)(66556008)(66476007)(66446008)(64756008)(8676002)(76116006)(4326008)(66946007)(6916009)(41300700001)(71200400001)(8936002)(6506007)(107886003)(1580799012)(26005)(186003)(83380400001)(6512007)(86362001)(5660300002)(2906002)(2616005)(38070700005)(36756003)(85182001)(38100700002)(122000001);DIR:OUT;SFP:1101;
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1P195MB1399
X-SM-smarthost: [elektrobit-com.mail.protection.outlook.com]
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	36777824-91f7-4fa7-d5a5-08db05aa554e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nIH8oUg515ZvkEtKv9TnhKvya6DdZ3sm18qqMNZfpH0n5bSOUHiA0Rz93DmbvIcklcJ0V7J9ldSN3QnF0i9SnhhGOGP+Wc921ru07673WAWvCmnWp5TJ/PsAGXW2k/5sFKiq4bQ1hIDAi4t7LN7G3RFP/j06PfmhqYLyZr3wdXH/ga7pgdK9SNBzOjIz1tP466aRQ7w5Pq4QJomljrTjt9PqFDpLEDwzMQwUj95h2P+eeROQB49LmH7Ck177yElHL/QQF3EggcREuDHXo1WzMC2ZFXM72SQp5sRwgdM21yoV+3u2NHtLmreKdUrowAby8KssEPw6WtCTNxQ/WZbLCpOcLp/fAxWaXDs4EKuto3RZ9LLIz6/RRof5fCZpvjZU0R16OLXjSyb3DCxspIRXBgjigjHrZdxtX30e/qgKUEoe7G3HWy6ehzPUwL/GLGw1Xqilq2/8HqPyCdu4IiOX1yw2pi6EnGtB1TVzM6oXCSy114mWQOFRs+nhXTlkBywXgRwHDUULvbeKObMwbzTeGXZ7xX1HhUkiurirFASkK/42QcjFv3w42IQdZOslgVkAoOMK6Yvq/97ZUXb1S1dLEah25wgQQYAmQEbaTUG7kB02gUt/BwSw1ODQMnDbWe71Mlex5nAc2xVOh4lFFp24qJYGVlF1s2GBiC6fuKPeDCQ9aZ0sVCyuLnMhti1ZxSyGIhRmPE0qgNyu6lQHtV4O5CRES22EQBXNLepSdMzYfH0H+Bdx9YlApn9HdHbIGNB/yz07YrCFei73kTTxbbkKIw==
X-Forefront-Antispam-Report: 
	CIP:4.79.107.243;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:usbth1es003.ebgroup.elektrobit.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(1590799015)(451199018)(40470700004)(46966006)(36840700001)(2906002)(1580799012)(26005)(186003)(8936002)(5660300002)(85182001)(41300700001)(40460700003)(6916009)(86362001)(4326008)(8676002)(40480700001)(356005)(316002)(81166007)(478600001)(6486002)(70586007)(82740400003)(47076005)(107886003)(6506007)(6512007)(36756003)(2616005)(70206006)(336012)(83380400001)(36860700001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: elektrobit.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 05:48:57.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c75beb60-01d9-4501-6909-08db05aa57a0
X-MS-Exchange-CrossTenant-Id: e764c36b-012e-4216-910d-8fd16283182d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e764c36b-012e-4216-910d-8fd16283182d;Ip=[4.79.107.243];Helo=[usbth1es003.ebgroup.elektrobit.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MW2NAM12FT063.eop-nam12.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0801MB7743
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1A1E508553F75B47A919F647A8A84940@EURP195.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Feb 2023 08:10:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100920

T24gRnJpLCAyMDIzLTAyLTAzIGF0IDA2OjQ0ICswMTAwLCBTaW1vbmUgV2Vpc3Mgd3JvdGU6DQo+
IEFkZCB0aGUgZGVtbyBmcm9tIG1pbmljb3JlZHVtcGVyIC0gdGhhdCBpcyBpbnRlbmRlZCBhcyBh
IHRlc3QgZm9yIGl0DQo+IC0NCj4gYXMgYSBwdGVzdCBmb3IgbWluaWNvcmVkdW1wZXIuDQo+IA0K
PiBSZXN1bHQgZXhhbXBsZToNCj4gDQo+IHJvb3RAcWVtdXg4Ni02NDp+IyBwdGVzdC1ydW5uZXIg
bWluaWNvcmVkdW1wZXINCj4gU1RBUlQ6IHB0ZXN0LXJ1bm5lcg0KPiAyMDIzLTAyLTAyVDEyOjI3
DQo+IEJFR0lOOiAvdXNyL2xpYi9taW5pY29yZWR1bXBlci9wdGVzdA0KPiBtaW5pY29yZWR1bXBl
cl9kZW1vDQo+IGV4cGVjdGluZyBTZWdtZW50YXRpb24gZmF1bHQgd2l0aCBjb3JlIGR1bXAgLi4u
DQo+IFsgICAyMS43OTE4NzhdIG1pbmljb3JlZHVtcGVyX1szMzBdOiBzZWdmYXVsdCBhdCAwIGlw
DQo+IDAwMDAwMDAwMDA0MDE0ZjIgc3ANCj4gMDAwMDdmZmU0MjcxZjg3MCBlcnJvciA0IGluIG1p
bmljb3JlZHVtcGVyX2RlbW9bNDAxMDAwKzEwMDBdIGxpa2VseQ0KPiBvbiBDUFUgMA0KPiAoY29y
ZSAwLCBzb2NrZXQgMCkNCj4gWyAgIDIxLjc5Mzg4Nl0gQ29kZTogMDAgYjggMDAgMDAgMDAgMDAg
ZTggN2QgZmIgZmYgZmYgODMgYmQgNWMgZmYgZmYNCj4gZmYgMDEgNzUNCj4gMmYgNDggYzcgNDUg
ZTggMDAgMDAgMDAgMDAgYmYgNTggMjEgNDAgMDAgZTggNTIgZmIgZmYgZmYgNDggOGIgNDUgZTgN
Cj4gPDBmPiBiNg0KPiAwMCAwZiBiZSBjMCA4OSBjNiBiZiA3NyAyMSA0MCAwMCBiOCAwMCAwMCAw
MCAwMCBlOCA0NyBmZg0KPiAvdXNyL2xpYi9taW5pY29yZWR1bXBlci9wdGVzdC9ydW4tcHRlc3Q6
IGxpbmUgNjogICAzMzAgU2VnbWVudGF0aW9uDQo+IGZhdWx0DQo+IG1pbmljb3JlZHVtcGVyX2Rl
bW8NCj4gbWluaWNvcmVkdW1wZXINCj4gU1VDQ0VTUw0KPiBEVVJBVElPTjogMw0KPiBFTkQ6IC91
c3IvbGliL21pbmljb3JlZHVtcGVyL3B0ZXN0DQo+IDIwMjMtMDItMDJUMTI6MjgNCj4gU1RPUDog
cHRlc3QtcnVubmVyDQo+IFRPVEFMOiAxIEZBSUw6IDANCj4gcm9vdEBxZW11eDg2LTY0On4jDQo+
IA0KPiBQbGVhc2Ugbm90ZSB0aGUgU2VnbWVudGF0aW9uIGZhdWx0IGlzIGludGVuZGVkIHRvIHBy
b3Zva2UgYSBjb3JlZHVtcC4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFNpbW9uZSBXZWlzcyA8c2lt
b25lLndlaXNzQGVsZWt0cm9iaXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBLYWkgVG9tZXJpdXMg
PGthaS50b21lcml1c0BlbGVrdHJvYml0LmNvbT4NCj4gLS0tDQo+ICAuLi4vcGFja2FnZWdyb3Vw
cy9wYWNrYWdlZ3JvdXAtbWV0YS1vZS5iYiAgICAgICAgICAgIHwgIDEgKw0KPiAgLi4uL3JlY2lw
ZXMta2VybmVsL21pbmljb3JlZHVtcGVyL2ZpbGVzL3J1bi1wdGVzdCAgICB8IDEyDQo+ICsrKysr
KysrKysrKw0KPiAgLi4uL21pbmljb3JlZHVtcGVyL21pbmljb3JlZHVtcGVyXzIuMC4xLmJiICAg
ICAgICAgICB8ICA2ICsrKysrLQ0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCsp
LCAxIGRlbGV0aW9uKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNpcGVzLWtl
cm5lbC9taW5pY29yZWR1bXBlci9maWxlcy9ydW4tDQo+IHB0ZXN0DQo+IA0KPiBkaWZmIC0tZ2l0
IGEvbWV0YS1vZS9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy9wYWNrYWdlZ3JvdXAtbWV0YS0N
Cj4gb2UuYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91
cC1tZXRhLW9lLmJiDQo+IGluZGV4IDM0Njg5ZmI0OC4uZDM3MzgzOTE5IDEwMDY0NA0KPiAtLS0g
YS9tZXRhLW9lL3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC1tZXRhLW9l
LmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1jb3JlL3BhY2thZ2Vncm91cHMvcGFja2FnZWdy
b3VwLW1ldGEtb2UuYmINCj4gQEAgLTk4Miw2ICs5ODIsNyBAQCBSREVQRU5EUzpwYWNrYWdlZ3Jv
dXAtbWV0YS1vZS1wdGVzdC1wYWNrYWdlcyA9ICJcDQo+ICAgICAgbGliZWUtcHRlc3QgXA0KPiAg
ICAgIHBvY28tcHRlc3QgXA0KPiAgICAgIGNtb2NrYS1wdGVzdCBcDQo+ICsgICAgbWluaWNvcmVk
dW1wZXItcHRlc3QgXA0KPiAgIg0KPiAgUkRFUEVORFM6cGFja2FnZWdyb3VwLW1ldGEtb2UtcHRl
c3QtcGFja2FnZXM6YXBwZW5kOng4NiA9ICIgbWNlbG9nLQ0KPiBwdGVzdCINCj4gIFJERVBFTkRT
OnBhY2thZ2Vncm91cC1tZXRhLW9lLXB0ZXN0LXBhY2thZ2VzOmFwcGVuZDp4ODYtNjQgPSAiDQo+
IG1jZWxvZy1wdGVzdCINCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1rZXJuZWwvbWlu
aWNvcmVkdW1wZXIvZmlsZXMvcnVuLXB0ZXN0DQo+IGIvbWV0YS1vZS9yZWNpcGVzLWtlcm5lbC9t
aW5pY29yZWR1bXBlci9maWxlcy9ydW4tcHRlc3QNCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4g
aW5kZXggMDAwMDAwMDAwLi5mYmRkYzA3NzQNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRh
LW9lL3JlY2lwZXMta2VybmVsL21pbmljb3JlZHVtcGVyL2ZpbGVzL3J1bi1wdGVzdA0KPiBAQCAt
MCwwICsxLDEyIEBADQo+ICsjIS9iaW4vc2gNCj4gKw0KPiArZWNobyBtaW5pY29yZWR1bXBlcl9k
ZW1vDQo+ICtlY2hvIGV4cGVjdGluZyBTZWdtZW50YXRpb24gZmF1bHQgd2l0aCBjb3JlIGR1bXAg
Li4uDQo+ICsNCj4gK21pbmljb3JlZHVtcGVyX2RlbW8gNiAmIHNsZWVwIDMgJiYgbWluaWNvcmVk
dW1wZXJfZGVtbw0KPiArDQo+ICtpZiBscyAvdmFyL2NyYXNoLyB8IGdyZXAgbWluaWNvcmVkdW1w
ZXI7IHRoZW4NCj4gKwllY2hvIFNVQ0NFU1MNCj4gK2Vsc2UNCj4gKwllY2hvIEZBSUwNCj4gK2Zp
DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtDQo+IGtlcm5lbC9taW5pY29yZWR1bXBl
ci9taW5pY29yZWR1bXBlcl8yLjAuMS5iYiBiL21ldGEtb2UvcmVjaXBlcy0NCj4ga2VybmVsL21p
bmljb3JlZHVtcGVyL21pbmljb3JlZHVtcGVyXzIuMC4xLmJiDQo+IGluZGV4IDBiOTM0ZWUyZC4u
OTkyZGUwMTRmIDEwMDY0NA0KPiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMta2VybmVsL21pbmljb3Jl
ZHVtcGVyL21pbmljb3JlZHVtcGVyXzIuMC4xLmJiDQo+ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1r
ZXJuZWwvbWluaWNvcmVkdW1wZXIvbWluaWNvcmVkdW1wZXJfMi4wLjEuYmINCj4gQEAgLTcsNyAr
Nyw3IEBAIExJQ19GSUxFU19DSEtTVU0gPSAiDQo+IGZpbGU6Ly9DT1BZSU5HO21kNT03MTgyN2M2
MTdlYzdiNDVhMGRkMjM2NTgzNDdjYzFlOSBcDQo+ICAgICAgICAgICAgICAgICAgICAgIg0KPiAg
REVQRU5EUyA9ICJlbGZ1dGlscyBkYnVzIGRidXMtZ2xpYi1uYXRpdmUgZ2xpYi0yLjAgZGJ1cy1n
bGliIHV0aWwtDQo+IGxpbnV4IGpzb24tYyINCj4gIA0KPiAtaW5oZXJpdCBhdXRvdG9vbHMgcGtn
Y29uZmlnIHN5c3RlbWQgdXBkYXRlLXJjLmQNCj4gK2luaGVyaXQgYXV0b3Rvb2xzIHBrZ2NvbmZp
ZyBwdGVzdCBzeXN0ZW1kIHVwZGF0ZS1yYy5kDQo+ICANCj4gIFNSQ1JFViA9ICIxNmEwZDQ0ZjE3
MjVlYWE5MzA5NmVhYTBlMDg2ZjQyZWY0YzI3MTJjIg0KPiAgDQo+IEBAIC0xOCw2ICsxOCw3IEBA
IFNSQ19VUkkgPQ0KPiAiZ2l0Oi8vZ2l0aHViLmNvbS9kaWFtb24vbWluaWNvcmVkdW1wZXI7cHJv
dG9jb2w9aHR0cHM7YnJhbmNoPW1hc3Rlcg0KPiBcDQo+ICAgICAgICAgICAgIGZpbGU6Ly9taW5p
Y29yZWR1bXBlci5zZXJ2aWNlIFwNCj4gICAgICAgICAgICAgZmlsZTovL21pbmljb3JlZHVtcGVy
LmluaXQgXA0KPiAgICAgICAgICAgICBmaWxlOi8vMDAwMS1taW5pY29yZWR1bXBlci1yZXRyeS1l
bGYtcGFyc2luZy1hcy1sb25nLWFzLQ0KPiBuZWVkZWQucGF0Y2ggXA0KPiArICAgICAgICAgICBm
aWxlOi8vcnVuLXB0ZXN0IFwNCj4gICAgICAgICAgICAgIg0KPiAgDQo+ICBTID0gIiR7V09SS0RJ
Un0vZ2l0Ig0KPiBAQCAtMjksNiArMzAsOSBAQCBJTklUU0NSSVBUX1BBQ0tBR0VTID0gIiR7UE59
Ig0KPiAgSU5JVFNDUklQVF9OQU1FOiR7UE59ID0gIm1pbmljb3JlZHVtcGVyIg0KPiAgSU5JVFND
UklQVF9QQVJBTVM6JHtQTn0gPSAiZGVmYXVsdHMgODkiDQo+ICANCj4gK0VYVFJBX09FQ09ORjph
cHBlbmQgPSAiIFwNCj4gKyAgICAke0BiYi51dGlscy5jb250YWlucygnUFRFU1RfRU5BQkxFRCcs
ICcxJywgJy0td2l0aC0NCj4gbWluaWNvcmVkdW1wZXJfZGVtbycsICctLXdpdGhvdXQtbGlibWlu
aWNvcmVkdW1wZXInLCBkKX0gXA0KPiArIg0KPiAgZG9faW5zdGFsbDphcHBlbmQoKSB7DQo+ICAg
ICAgcm1kaXIgJHtEfSR7bG9jYWxzdGF0ZWRpcn0vcnVuDQo+ICAgICAgaW5zdGFsbCAtZCAke0R9
LyR7c3lzY29uZmRpcn0vbWluaWNvcmVkdW1wZXINCg0KDQpIZWxsbywNCg0KSSBhbSB2ZXJ5IHNv
cnJ5IHRoZSBIZWFkbGluZSBzaG91bGQgc3RhcnQgd2l0aCBQQVRDSCBub3Qgd2l0aCBQQVRDSA0K
MS8yLiBObyBzZWNvbmQgcGF0Y2ggd2lsbCBmb2xsb3cgZm9yIHRoZSBtaW5pY29yZWR1bXBlciBw
dGVzdC4gVGhpcw0KaXMgY29tcGxldGUgYW5kIHdhcyBhbiBlYXJseSBtb3JuaW5nIGdpdC1zZW5k
IG1haWwgZXJyb3Igb24gbXkgc2lkZS4NCg0KS2luZCBSZWdhcmRzLA0KU2ltb25lDQo=

