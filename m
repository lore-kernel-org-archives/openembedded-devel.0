Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C3FC77B7C
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 16:33:17 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.58])
 by mx.groups.io with SMTP id smtpd.web11.1356.1683822790038054742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 May 2023 09:33:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=Vg1SUiBI;
 spf=pass (domain: advantech.cz, ip: 40.107.215.58, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RMVMBIwqPmgV2RbG6eBUl4LjU5sOjav0xLScyz8YTS8NXESXLw+0NvRsUuvrxna9xoC5ETEXTRVp7A7WeY3wLu5B6gCPD41P1tKf05g4aE0diqLRjYm2tjnTT0Okf1y+DAuspM3U8Yw88oL1vF6pjfL97HfS+yc3KVsd10+xkbfahC7HRqgryT4iotnuPKOg47FTBc94kqqx5rSSt1hjBbCx2S/wiGh4tJnz4sF03I94LBBIficEYIXE3cpwb37bOLHmx9ld6a00jT5t9z9LAK6Zic9lAv0nP+CrOZYb+X2358BR6/kjh4fZD71sHif4MiXKEkc9Y/xd6CsXfhyTtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x37f4E+2+WLT6zeCKCa30gJ+vVDo4TMFkAOnTMejtSE=;
 b=XrmOws0CEHCcdIBK2iEixw8EwgS7E5ooBExQf+hWlwNsrkpc19JXT+NfHuK00EELh4FeppJMQ17RkpY0BLYegp+8ShT7xg2wZWHH3G5vTu8OGcBQURfBfc/XORY/zge65UwgqeCoCT8lINjMj+rUZtNM+Arb72FM6oliat4UcAtETuBM2Av9QMJfm5w9KY+qaUoz/YXNHrPvokWJrr/02wcTmKfGnubQzAnH96b8EoM+rkjFrg4mKgU3Ef5icNFnUml0dV6FK3m15zXN85+j/KVPKyQbTMmkc9PUIoS2g07A059GReL+kqkoHzab7q5S5m56Z49SeJyagQi8m4bzsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x37f4E+2+WLT6zeCKCa30gJ+vVDo4TMFkAOnTMejtSE=;
 b=Vg1SUiBI4OH7k0fvUAs1oEMDoEV/1SzPVpVzA76k64GQYKm0aTzUw3wccZbH8v710tAPiGrfNEYg4ZZS6nrkpcSPdjBer+24H/sozTNCr+POSNtUhq00RIYfjv1xIjcn1yrmiHtME3O69SLtPVHmYWaXTciHokfVSKxbLu4iLJwVCcgAaEV4REoFOcHbrdeL44KDNeJMSdY1U7I/YnYRFlDI2QZLApymYPAiPt7VLdZH1/+EPffdWR9pAFikftOPNMsqT55CRCo+FZjZYrlfAPbD89y3fQ8Th2E02wn5V8Xw8SSeY4bwh1mffisWdKlV+oCnEc7eFNXuy9hMROTcCA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB4953.apcprd02.prod.outlook.com (2603:1096:4:151::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.19; Thu, 11 May
 2023 16:33:05 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::3e74:b6f0:fad1:4598%4]) with mapi id 15.20.6387.021; Thu, 11 May 2023
 16:33:05 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-networking][PATCH] networkmanager-openconnect: add new recipe
Thread-Topic: [meta-networking][PATCH] networkmanager-openconnect: add new
 recipe
Thread-Index: AdmEJJQdrfH5UqZDQDS9jCHz7v/L5Q==
Date: Thu, 11 May 2023 16:33:05 +0000
Message-ID: 
 <TY2PR02MB367872AE3A1AA146901FF92881749@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB4953:EE_
x-ms-office365-filtering-correlation-id: a64a023e-c1df-4aab-c243-08db523d6590
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 17UmQ/J7typrAlmn4nQilk3mo9aK+uQOYvfreaxJRVL6W19tw/OEPeRPDElEUu97qgunaNmU3ivUyn9ie/+OfawNg23CCNXT3EKrfEM1kWakq280hdBFU2LMYxioQAfkt+eiLsqDqkWAiy74f0DiWyyi0Ji3pyYlN+YZ5SmWyCsdGso42GgLoLczMlFeJBHyCwptZHJBbwvUx6wajoUXgjJqagfxIJM/nCkkiFNX2jiqNQh4VrIU+i3C13Lbr4WuTosKawv2cMwPBanFiq2S9BK7wD1JnxG4ENm/qGCp0KowNIz0QHnP1V9XYCcFnMYPANTphkhXC2SmbYh7dIuzqKtdOyFrP+kVyAZofBVSfek/PZaXS+Jf/aeaeEx9Y8MoVa05GGwCQ31KOF9te4L0dNtxYiqLJp4c6v05+aiaT1pmlDOMk1bLyOP7tHiMRTQ/SVbuCJG7QCu3epUxgSg2MhUQ3jXQ2DakPNhGXBdLUSIHJ21bZHjk1m8Z91/Df/nHLv/Cll/aZVzfM9NKHSV6q3ePiwRLyuiPTKcriNpa6AFoVB6EqhqL4fTOEDuttu6O1nNLOW001wI0Xc/CK2V2JsgZk71o6WFWhHSdqTalikU=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(451199021)(86362001)(33656002)(66476007)(966005)(316002)(6916009)(66446008)(71200400001)(478600001)(66556008)(76116006)(66946007)(7696005)(64756008)(41300700001)(52536014)(8676002)(55016003)(5660300002)(8936002)(44832011)(2906002)(38070700005)(38100700002)(122000001)(6506007)(26005)(186003)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?U1Z2ZEVTbUNVMUxhei9pRU40UERIRmFxT09VblpYTmVTYnhIT1JuNmF3R290?=
 =?utf-8?B?Z1VqRjg3YXFkNmNYTjdnMDJ3czAwK2VBdzNYN2Jlai93RExRQ2xZUHpYUzJW?=
 =?utf-8?B?clBSeW5ZS3BCMzhoMDVXU01zRytZYWVrcEhzYlk1QndXcENndVBXbHQ4V2Fz?=
 =?utf-8?B?SnI2T1RDRWhRY0ptbWhFMWZVTkVYUU0yZmJVSFkwQ2RxSWVwY2xobS9YYU5P?=
 =?utf-8?B?WTdFR2tBQmdIM2xPY1hqdEtaYnp1cXBDZzFTeElEZHBrOVhrYThPWDFZOUxO?=
 =?utf-8?B?Z2s1ZG4vT2ZJZHlHWitlY3Ava1FlU3lXcHJFeEpScWx5M2tQa2tFemFiVG1R?=
 =?utf-8?B?Tm1PanErQ2s4QXpEbURzbHlxVEZtaEZUU2pBcUxMNkxTT2VobFFSU2dQYmo0?=
 =?utf-8?B?aFk4b3VHbE9ZczJUWlk0OTdUVHhnd29QaVhKOFVOOXgvRDJsdThJamoyMllO?=
 =?utf-8?B?RE40Njc4VVJKM2lKZVhmQWlFYW5sK01RcjNRbkxXcmRpWXd1dTJHTW9oaWM1?=
 =?utf-8?B?eWV2eGFsMy9oRTFndU1nVU5UdUlDcWFiLzUvQlUyN3ovcE42K3pvVWk4Q2Y4?=
 =?utf-8?B?MEMvaFNsVFNPOFk3eG5BbFJjUEp2TUw3ck1sOGJTdS9idm5RTHY4TEU4UjFJ?=
 =?utf-8?B?WUhMbkxKTWVLZXU4UDB6SFZCNVB5WjQ3aGVEUjR5cVlNckFOTFFrNkdQMVVW?=
 =?utf-8?B?RGVmdWwvWHIrTDBHeEFmRHNDZjg2RGZrUEplZjd2SXlhOTh3VlU4TVNIcVUw?=
 =?utf-8?B?amF1akZDVVMvd2tFek5pZ0NGK0RkbXo4VzNFUTVXQzBzYUt1cmxnQk1tN0NI?=
 =?utf-8?B?Y3dlNVMyQXJMaVZBcWxtOXh0Y3VkWjA1QjZ3bDlGZUZvdmxldGlRMUl0VnRh?=
 =?utf-8?B?ZnVYNnd4L2FaQW91WDFpSVdIbzdrSi84Qld0MlllSm9YaTdGUEZ4dGZqZk1j?=
 =?utf-8?B?WFhTNmNMc2VmWW84anllVjBrM2ErWFdxaEJtMi82UHNTNnJHL1IvV3NpRlV3?=
 =?utf-8?B?aXV3U0R1Uy85WTdyZEJJaDQ1WnE1U01icjBPUWY0Y3NERzcxaVlvUS9RandF?=
 =?utf-8?B?MjlkaXZncDBMMXQ3Q2lPM1NpSVkxVnQ3TEI1YjN5OWpoYi9WNHU5NUoxdVUr?=
 =?utf-8?B?cEZQY3hQS015VEhnb0ZWWGlRWmVnTUVCSDRuUk5Mb1cyREpHbHFJRjE0ZmpK?=
 =?utf-8?B?OXk5K2hFTXZ1dnEyZzZUU1A0Q3dWdnJKVVBBNE5KWFhqemg4SExqOTZWT05n?=
 =?utf-8?B?UzZUakdKVG5XOUtocGxzS1o5WlBLa0x5WGZaclBFcXZWNktSSlpxUmpjamxB?=
 =?utf-8?B?WkM4Q3YrUkpWaVdrWm10KzlWTTdXbjc1SlgrZThSWDBXUFJqd0RneWNNNmtW?=
 =?utf-8?B?QU9JUmRRdkczTktGOS91NkIvQlNFUVJNMmE5L2t6YlBhUmp4aGxmSzIzTllX?=
 =?utf-8?B?bk1tRXRPUC9xL3BDRUtac2d1bkNUN0ZpNEh4a216OFJmSUthdzdOK0R3RnYv?=
 =?utf-8?B?Zjc4a2RtUEx5V0JaVm52NU40OUphcm8zV3BIOWFydWx4SFFYY3ZUbUdEY1lq?=
 =?utf-8?B?Y2ZyTitrUlJzNzJtTFRvRnJGMHozcnV2U1FYL0hDYWd4cC9qOE9RY3NMZC9u?=
 =?utf-8?B?Z09odDY1c29ZNEtINlRpVGphUWxxTGZEQTlicCtWQTlQdU0vc3RaVm14cFdN?=
 =?utf-8?B?UitMKzhNeHpoOHlMd093cjFNMHNma1ZNMk90cDFqd0RRUzJNWHEyMUtkWkRE?=
 =?utf-8?B?ek9EZE4yNEMwR0g4b1hQSVZpOUo0Rzd0b0pFaE5VOXp4TjgrZzJER2RXU2RI?=
 =?utf-8?B?Wjd0UnJKeGhRY3l0VmJEVEw1RFJXREM0QTJWY29KSk1IcVpjVnkwTHlGVERt?=
 =?utf-8?B?aXZSK1lyZFlnb2F6RS9LSjhxSmZJb29FR2hSNDVnT1FNc1VKWkJBa0pEUk90?=
 =?utf-8?B?Z2VrczNKOXJjNFpCNVc2bDJ0Mm1SRW9YTGFCZkQwNUFGS1Yyd0pkQkpWeEh4?=
 =?utf-8?B?NVhYaXZmeXY5OXhIWDg2SHlyOEpTaGlVdFpPbE1XSG9kVFVMdUJCZi9jNXhm?=
 =?utf-8?B?bldhTnMwbnBVU3BMWjZhMEtEdjR5Y0MxOFVuWTJmbHhHL0NRdWQweW13MXQ5?=
 =?utf-8?B?OTAxTVlnY3pjNkp6TzlXMVE3M2hRWVErQ3Vub0Yxa2I4L0hCeGkySHVXTCth?=
 =?utf-8?B?bmc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a64a023e-c1df-4aab-c243-08db523d6590
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2023 16:33:05.3374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /Ib4eS3qvbD3L3uiYs0/4owhBljPS/ArVudLbdD+eK/IFCg/HeFiMa8/Ja/AOedCuDQpdtKcfbVuo9na+3TIKMXs4k7I3t/kcpgBAHfTjQw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4953
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 May 2023 16:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102546

SW50ZWdyYXRpb24gb2YgdGhlIE9wZW5Db25uZWN0IFZQTiBjbGllbnQgdG8gdGhlIE5ldHdvcmtN
YW5hZ2VyDQpodHRwczovL2dpdGxhYi5nbm9tZS5vcmcvR05PTUUvTmV0d29ya01hbmFnZXItb3Bl
bmNvbm5lY3QNCg0KU2lnbmVkLW9mZi1ieTogUGV0ciBHb3R0aGFyZCA8cGV0ci5nb3R0aGFyZEBh
ZHZhbnRlY2guY3o+DQotLS0NCiAuLi4vbmV0d29ya21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjgu
YmIgICAgICAgfCA0NiArKysrKysrKysrKysrKysrKysrDQogMSBmaWxlIGNoYW5nZWQsIDQ2IGlu
c2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMt
Y29ubmVjdGl2aXR5L25ldHdvcmttYW5hZ2VyL25ldHdvcmttYW5hZ2VyLW9wZW5jb25uZWN0XzEu
Mi44LmJiDQoNCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjguYmIgYi9t
ZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29y
a21hbmFnZXItb3BlbmNvbm5lY3RfMS4yLjguYmINCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRl
eCAwMDAwMDAwMDAwLi5jOTc4ZGVmYmJmDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvbmV0d29ya21hbmFnZXIvbmV0d29ya21hbmFnZXIt
b3BlbmNvbm5lY3RfMS4yLjguYmINCkBAIC0wLDAgKzEsNDYgQEANCitTVU1NQVJZID0gIk9wZW5D
b25uZWN0IFZQTiBjbGllbnQgZm9yIE5ldHdvcmtNYW5hZ2VyIg0KK1NFQ1RJT04gPSAibmV0L21p
c2MiDQorDQorTElDRU5TRSA9ICJHUEwtMi4wLW9yLWxhdGVyIg0KK0xJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTE4NmU4YjU0MzQyZGE0Zjc1M2E2MmI3NzQ4Yzk0N2RiIg0K
Kw0KK0RFUEVORFMgPSAiZ2xpYi0yLjAtbmF0aXZlIGludGx0b29sLW5hdGl2ZSBsaWJ4bWwyIG5l
dHdvcmttYW5hZ2VyIG9wZW5jb25uZWN0Ig0KKw0KK2luaGVyaXQgZ25vbWViYXNlIHVzZXJhZGQN
CisNCitTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS9OZXR3b3JrTWFuYWdlci1vcGVuY29ubmVj
dC8ke0Bnbm9tZV92ZXJkaXIoIiR7UFZ9Iil9L05ldHdvcmtNYW5hZ2VyLW9wZW5jb25uZWN0LSR7
UFZ9LnRhci54eiINCisNCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWRlZGFhNzg1ZDgyZDhlMjM5
ZGRkMDgyYmZhYzUyNTBjNjkxZTk2NDQ2NGJlMTgwN2I2ODI3MjYzNjMzY2RjYyINCisNCitTID0g
IiR7V09SS0RJUn0vTmV0d29ya01hbmFnZXItb3BlbmNvbm5lY3QtJHtQVn0iDQorDQorIyBtZXRh
LWdub21lIGluIGxheWVycyBpcyByZXF1aXJlZCB1c2luZyBnbm9tZToNCitQQUNLQUdFQ09ORklH
W2dub21lXSA9ICItLXdpdGgtZ25vbWUsLS13aXRob3V0LWdub21lLGd0ayszIGdjcjMgbGlibm1h
IGxpYnNlY3JldCwiDQorUEFDS0FHRUNPTkZJR1tndGs0XSA9ICItLXdpdGgtZ3RrNCwtLXdpdGhv
dXQtZ3RrNCxndGs0LCINCisNCitkb19jb25maWd1cmU6YXBwZW5kKCkgew0KKyAgICAjIG5ldHdv
cmstbWFuYWdlci1vcGVuY29ubmVjdC5tZXRhaW5mby54bWwgaXMgY3JlYXRlZCBpbiBzb3VyY2Ug
Zm9sZGVyIGJ1dA0KKyAgICAjIGNvbXBpbGUgZXhwZWN0cyBpdCBpbiBidWlsZCBmb2xkZXIuIEFz
IGxvbmcgYXMgbm9ib2R5IGNvbWVzIHVwIHdpdGggYQ0KKyAgICAjIGJldHRlciBzb2x1dGlvbiBq
dXN0IHN1cHBvcnQgYnVpbGQ6DQorICAgIGlmIFsgLWUgJHtTfS9hcHBkYXRhL25ldHdvcmstbWFu
YWdlci1vcGVuY29ubmVjdC5tZXRhaW5mby54bWwgXTsgdGhlbg0KKyAgICAgICAgbWtkaXIgLXAg
JHtCfS9hcHBkYXRhDQorICAgICAgICBjcCAtZiAke1N9L2FwcGRhdGEvbmV0d29yay1tYW5hZ2Vy
LW9wZW5jb25uZWN0Lm1ldGFpbmZvLnhtbCAke0J9L2FwcGRhdGEvDQorICAgIGZpDQorfQ0KKw0K
K1VTRVJBRERfUEFDS0FHRVMgPSAiJHtQTn0iDQorVVNFUkFERF9QQVJBTToke1BOfSA9ICItLXN5
c3RlbSBubS1vcGVuY29ubmVjdCINCisNCitGSUxFUzoke1BOfSArPSAiIFwNCisgICAgJHtsaWJk
aXJ9L05ldHdvcmtNYW5hZ2VyLyouc28gXA0KKyAgICAke25vbmFyY2hfbGliZGlyfS9OZXR3b3Jr
TWFuYWdlci9WUE4vbm0tb3BlbmNvbm5lY3Qtc2VydmljZS5uYW1lIFwNCisiDQorDQorRklMRVM6
JHtQTn0tc3RhdGljZGV2ICs9ICIgXA0KKyAgICAke2xpYmRpcn0vTmV0d29ya01hbmFnZXIvKi5h
IFwNCisiDQorDQorUkRFUEVORFM6JHtQTn0gPSAiIFwNCisgICAgbmV0d29ya21hbmFnZXIgXA0K
KyAgICBvcGVuY29ubmVjdCBcDQorIg0KLS0gDQoyLjM0LjENCg0K

