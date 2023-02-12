Return-Path: <petr.gotthard@advantech.cz>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF87EC636D4
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 18:04:06 +0000 (UTC)
Received: from APC01-SG2-obe.outbound.protection.outlook.com (APC01-SG2-obe.outbound.protection.outlook.com [40.107.215.43])
 by mx.groups.io with SMTP id smtpd.web10.16593.1676225025327040631
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 10:03:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@advantech.cz header.s=selector1 header.b=asUET/H6;
 spf=pass (domain: advantech.cz, ip: 40.107.215.43, mailfrom: petr.gotthard@advantech.cz)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gg5bPgjYxLJvtYw2Bqv3QQFmraTeGxalO3L/070cRUB0tODpKyXlgLxbBtM1cwZQCoNr77qtBzSI3HQGO1k6fwHduvElnN+9GjZNfpAmuGHNvTMd3r7ihWn1UNTjg33aXkDbW8+pJU5YwzRN6kyTwb65xHd+G2nfkHWtEHyJqIT8+7zcXXpTxt3uahKVLkDh7C/raQtl4rIDI0qGD4BEmD43ZMpEGdMKIFV5JqhOYzfol91FnqRe4kjM+BUL7dAyaM7ZHFa/JwrfzGYa1poH9VWQHRvmdBAn3uXmsTFvysl6d0bExdkpHzPi9PrxCUT1EImSSzwf6VyOFyYUq0RuFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYSkY0nLbQUr1lcyjhJ6b+zuDfWEGupF59wIlmWPnYw=;
 b=D8zBjdnD6sFXHD/2ywOc6/2cRnk9bU83yuTrUOQtnynkWeb7aJXw1W/PMqmjoikcldWceZ4NgoUReR0UG+YNZXdE+VVt6XrQOAPaI6i6VmQTHvQQtaYD+V826RU7dyryYayWIXR8e0apRCtYq6TaWtLlwoOW0d1upDCVJ1GNtS4/tbod6jBVBO5/OG9AC5TXnnjrlV27HqoEDjbXWakP9qsVk6yh/d5wOwmYM6lzCrtDHysapbuKGOUfPPbag+IwfmIynj4IWlzn1209JfO02y5msBYD7sZIzCnMTGd3UGbvfAK9hUT9ySUGYQhhnnwrHWGY1alcIy2DmyuuviDhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=advantech.cz; dmarc=pass action=none header.from=advantech.cz;
 dkim=pass header.d=advantech.cz; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=advantech.cz;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OYSkY0nLbQUr1lcyjhJ6b+zuDfWEGupF59wIlmWPnYw=;
 b=asUET/H6amJAeZuEwBCV3WuM8tqtKktMHOgSInijl737KoxFaNSzSzEafnyNYUPv3JNUn/SCaw6AoNsoj0TJim+7Sr73BeSbaD51P7leCDrnF2T8qWNf8UzOpHavjR0NqtXM8+pgQnMx+8s577O9JXQWyW1+X+soEnJDIZQFiqGTsUGpkoI6GcoFE6xDMOwa+OHzjcii7C0M+QiN8N0d/z0fNpATaah8k9FDXHzgKkrZxnYwZOwrTehLYQfeyBNNGKWg0J+VOKRYiicAIpwgvoKOPT4VdV9vHdVqkRHAZKN4GRZQ3yFJE3qlHjDTABokq35ZvJVKfCd6u0zZ6GtSfA==
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com (2603:1096:404:b7::12)
 by SI2PR02MB5067.apcprd02.prod.outlook.com (2603:1096:4:15d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.23; Sun, 12 Feb
 2023 18:03:37 +0000
Received: from TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417]) by TY2PR02MB3678.apcprd02.prod.outlook.com
 ([fe80::e2f4:d03b:1736:e417%7]) with mapi id 15.20.6086.023; Sun, 12 Feb 2023
 18:03:36 +0000
From: Petr Gotthard <petr.gotthard@advantech.cz>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH 1/3] libqmi: upgrade 1.30.8 -> 1.32.2
Thread-Topic: [meta-oe][PATCH 1/3] libqmi: upgrade 1.30.8 -> 1.32.2
Thread-Index: Adk/CMwX+97Di1pYRV+x3zunuOsLHw==
Date: Sun, 12 Feb 2023 18:03:36 +0000
Message-ID: 
 <TY2PR02MB3678F38C0828385ABC1F094781DC9@TY2PR02MB3678.apcprd02.prod.outlook.com>
Accept-Language: en-US
Content-Language: cs-CZ
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=advantech.cz;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY2PR02MB3678:EE_|SI2PR02MB5067:EE_
x-ms-office365-filtering-correlation-id: 844d0e98-e165-426d-3c20-08db0d23763d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Bcranl7fOsA+C6fGdh73tWJ1RATc+Lb6LVv0jvpR1vPhfmETJw4p2L47NqbS0tfsV/dhZYwTkSxtiTTQwfHUbWsWr9ugRJ87XeVPmk1Pk5MGR3A3AyrX1qaPp75hD20beq9A3ECA8NHct/x4R68oy0bUmOcx6SmTvbXyeC9+edY46ou3fZala4X4MIvhD/9EFW/Ks4a2mBEX9F3eV2YLKiJXkVIns1p3RHoMYUFW9zmr8FmQ5iVE5X3vtzVn+iUFM3Qp3854qnQJQ+BNFOpN4G3tjArx0C9eKq3N49eWo6a0KysI8XfZL7ROd2hc+5HnRAdhI3qZUtkfDYndkpBMuAgd3nUOICEnyQk6ffFNB4orBeN9JqdB6lpUBSK9qvvW26hL7iRTzOGQI0fvrnNSRqwrsYeR7CBPU7IU/Ssrk6DsWbd8NEX9DwHGUEC6LbGwEhTJQcovSs3OjHe/ghf764fBC/qrmgmnnB5UtXosgMDdYbAhjrHj0uNed4vQn8KnL9KUNjbieqS69vUoLw6FiL0xn1rXjG0fkXJckMevWoCilWVMc/0bBgkvxrQMNQKAj3+6qHxQ28Ijs4Gbl6Wa8zJhG6MwhuO757BHTNu3ciMHQl3BXuEjM1glHPqLYyNLOsEUPb3LbokEe7U4FQ8yUfyvQvWudHKRm/I1Jc55m+o=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR02MB3678.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(396003)(366004)(39850400004)(346002)(451199018)(8676002)(8936002)(71200400001)(7696005)(52536014)(38100700002)(55016003)(44832011)(2906002)(5660300002)(86362001)(122000001)(9686003)(26005)(186003)(6506007)(41300700001)(966005)(478600001)(316002)(66946007)(76116006)(6916009)(66556008)(66476007)(64756008)(66446008)(38070700005)(33656002)(83380400001)(2004002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MjcwTG41Y1AvbUtnNStIQXVWbGtrbGxwQjliZUs0SHZsOFgzbWNWZHFJdnJt?=
 =?utf-8?B?Uk9uRTFmd3h2VEhmazVEUDJhL21Zam9nc25xQXBzUksrQ1A2Tit2VGw2aWtC?=
 =?utf-8?B?cUlSdmMwcTVuT0drSUZONHc1QVZSOU00MFROanpOSWVnVkVtSldmcGRiK20x?=
 =?utf-8?B?Vm5VeWdQWWpBMnoyVE52SVBJaDZqL0IzUWRzOWtyQWEvekRFOXcycUFXMG9N?=
 =?utf-8?B?eFcrWTROZ2c0aFM3emFzRDN3eWR5OTNFWTNQZWtWbm9GY2I3bVZseW04TjUv?=
 =?utf-8?B?TFJmb0hHUVVoN1R4WERTNzRZU2xOOHZrazN1TjcvSjJQS2xqOEVKekM4dGNZ?=
 =?utf-8?B?aTAzVWFmWElGbjhPZWxndk5ZTG5LMHhlNXQ0Z21zbXlJZ2hyeFcyVFl3SFlQ?=
 =?utf-8?B?ak02WGlpK0JjcXVGbG90Uk5pZnlYVjh5V0lUNDZWT2VseWdsd2tqbU40Smha?=
 =?utf-8?B?dllaQXl6Tm1QcWlSb3FFNEl2Tm1JUFlQMjFwdkhWZmRaeE9EVCtWVVl6TDEx?=
 =?utf-8?B?UmJJRjZwUlJ1WVhIMG1DdW1PalljZkg3eTJVNE9rRFZhVUtxWmg2bnNQbU12?=
 =?utf-8?B?bVpLd2Z6QXlHRDJlUWg4OVdjYzhzNk50TVNKUXg1eUc2Vy9zTEtMSzVSWGJH?=
 =?utf-8?B?VWZNZ1c3akdOdm55S0pTSko2a05CbVZXSWNxV3lSc003WlhpT3U4ZjBlWUVo?=
 =?utf-8?B?dWhVTXVZT2RhandnMEVKWThudlZjK011c2RpWENXODJpZVVwUEZCWVV2eDdv?=
 =?utf-8?B?bHIyVjdSQXpGQkZkYkxiY3JONlhyMDFCL0kxeXgwVlNVS3VuRWtDOWFSV3Ur?=
 =?utf-8?B?RG5GUG5yZDJWMW9mOExjNERDMXA3UmNocGl6dlM5MWFKaFhmb1J0N25sdXZS?=
 =?utf-8?B?cDZkWHFuZGM5YkNFVWZXLzFXQTBSRDZ2WFVQTDk5TEFZdnkvazJsdHI4NGpi?=
 =?utf-8?B?ZWtRQ2RqRk9mVnNmUUIzaXEwOTE3dVFYWU5EUE5PekdsY0s0MUFWTzdyUWxB?=
 =?utf-8?B?WjMvaU1Zbm1QZi9naFVxelRRZEo2ZXFTWkJzSjdGNGZHRDVwMnFpY0pnYTlP?=
 =?utf-8?B?TEpyZUVndDZOR0xQM3pQWEFkcWNYdDNUekRSbytnci9aNkpRcnJHYjJEY2dh?=
 =?utf-8?B?cVhORUlCUWZ1b3JJY3FrZUZ5ZkdNZEFOM2RYemZxOVg0QUl5Skc0YWwwUkhX?=
 =?utf-8?B?L0plMlJva3BCTEZCU3lDMTFyclNGZXAvazVvaFlUWFQwdlBmUEp4WTRob2lo?=
 =?utf-8?B?T3Y5NU1qSU4xaFR6RjRnclliSE8wamlwbFBhYWFBeWZvRmtHRms1U3RWNzVW?=
 =?utf-8?B?RDZCcFk0RDFtM1pGZC9iZCtFV0R1UENTUjVDajY4eWlralQ3bW93N0hycVhs?=
 =?utf-8?B?VjFXak5sSXd4WUlFdjJQYkVMQkN2UWI3elczbk1jS1paMGs0UGRoUjgwTzdx?=
 =?utf-8?B?NVhELzRKZEg2cmt5a3NnNnYxRUN0RloyZTVQWUZpMXVoS01qMFhlN3VmTytT?=
 =?utf-8?B?NTJ3Rjd4T2lVeC95R3Bkd1h6a0gyUDh0WHM2MVVlUk9EN3VSUXNkbzJPSmsx?=
 =?utf-8?B?UWs4T2paNG9jaEdSM3FBTG92MjEyUUExVml1UnJGTExkSWp2WXk0OVhXcWxx?=
 =?utf-8?B?cTgvODJPMkNmM2xyMW9VdlhzK1ZNdHB1UFF6MWJ5eENxd0poano5WEtUL0Y2?=
 =?utf-8?B?ckl2N0ZkZlJXZVVUOXVnWnJhYVVpeUt6aXo5cWxoWHAybjFUYVZERngyNDNt?=
 =?utf-8?B?WkR5WUFZWW1JMkF1dEdaYi96Rm5Tcy9sWUduMEV0OVNQV2t6WTJrMS8wSWRh?=
 =?utf-8?B?TndqMllJZG4raDNNQmtlMnBraDRzZk1QQytIcElsK2lPT21qTVVsQ2NjYkgx?=
 =?utf-8?B?cS9EU01JL0tmaTlZc044bDBvY2hMUGp4QXVFME5CbXFucGhYZEV2b1I3Nkxn?=
 =?utf-8?B?bzlXcjYrYjlGUjRMMU5ReGtkUm84a3N0TWx1S0V1aTFXejl2STgyWGwyMzNY?=
 =?utf-8?B?Nkp1TU40UkUxK0JEWm01a09KZ2twZHdURFNEeG9YYTRiQWdRZlRvdUJjMGhZ?=
 =?utf-8?B?dFpzeDUwRElTalNRcWZEMTZURVpwN1lHN0loeGViR2xDQkl4OXhBUWRXaUpz?=
 =?utf-8?B?c0tlcjJNbVVXakphSEpZRk1lVXRNaytFZEtHYjNjR0VXcE5aZ01SYXlWSGxE?=
 =?utf-8?B?TlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: advantech.cz
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB3678.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 844d0e98-e165-426d-3c20-08db0d23763d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Feb 2023 18:03:36.1485
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a77d40d9-dcba-4dda-b571-5f18e6da853f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypv2uPmOwC/5ImAermY1lKrra5ZjNrqFelwj9Xe+80nTdF6vIDKHDokiyKiJQD3gcr7tQ8EdrmSHhoP2Z9zkwb9U2dbadUB2VAESEt2Czy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5067
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 18:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101057

Q2hhbmdlbG9nOg0KaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL21vYmlsZS1icm9hZGJh
bmQvbGlicW1pLy0vYmxvYi9xbWktMS0zMi9ORVdTDQoNClNpZ25lZC1vZmYtYnk6IFBldHIgR290
dGhhcmQgPHBldHIuZ290dGhhcmRAYWR2YW50ZWNoLmN6Pg0KLS0tDQogLi4uLzAwMDEtYnVpbGQt
dXNlLXB5dGhvbjMtZXZlcnl3aGVyZS5wYXRjaCAgIHwgMzMgLS0tLS0tLS0tLS0tLS0tLS0tLQ0K
IC4uLi97bGlicW1pXzEuMzAuOC5iYiA9PiBsaWJxbWlfMS4zMi4yLmJifSAgICB8ICA4ICsrLS0t
DQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDM5IGRlbGV0aW9ucygtKQ0KIGRl
bGV0ZSBtb2RlIDEwMDY0NCBtZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5L2xpYnFtaS9maWxl
cy8wMDAxLWJ1aWxkLXVzZS1weXRob24zLWV2ZXJ5d2hlcmUucGF0Y2gNCiByZW5hbWUgbWV0YS1v
ZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkve2xpYnFtaV8xLjMwLjguYmIgPT4gbGlicW1p
XzEuMzIuMi5iYn0gKDc3JSkNCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0
aXZpdHkvbGlicW1pL2ZpbGVzLzAwMDEtYnVpbGQtdXNlLXB5dGhvbjMtZXZlcnl3aGVyZS5wYXRj
aCBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicW1pL2ZpbGVzLzAwMDEtYnVpbGQt
dXNlLXB5dGhvbjMtZXZlcnl3aGVyZS5wYXRjaA0KZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0DQpp
bmRleCBlMzQ1ZDI4MDMuLjAwMDAwMDAwMA0KLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9saWJxbWkvZmlsZXMvMDAwMS1idWlsZC11c2UtcHl0aG9uMy1ldmVyeXdoZXJlLnBhdGNo
DQorKysgL2Rldi9udWxsDQpAQCAtMSwzMyArMCwwIEBADQotRnJvbSAxODk1MjhlODc5ZTQwOTli
NDRhYWUyNmEyYWYwY2IxNmFhYTk2ZGI2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQ0KLUZyb206
IGdvYXB1bmsgPGdvYXB1bmtAcmlzZXVwLm5ldD4NCi1EYXRlOiBNb24sIDEzIFNlcCAyMDIxIDEz
OjQ1OjQxICswMjAwDQotU3ViamVjdDogW1BBVENIXSBidWlsZDogdXNlIHB5dGhvbjMgZXZlcnl3
aGVyZQ0KLQ0KLS0tLQ0KLSBidWlsZC1hdXgvcW1pLWNvZGVnZW4vcW1pLWNvZGVnZW4gICAgICAg
ICAgICAgICAgICB8IDIgKy0NCi0gZXhhbXBsZXMvc2ltcGxlLXRlc3Rlci1weXRob24vc2ltcGxl
LXRlc3Rlci1weXRob24gfCAyICstDQotIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQ0KLQ0KLWRpZmYgLS1naXQgYS9idWlsZC1hdXgvcW1pLWNvZGVnZW4v
cW1pLWNvZGVnZW4gYi9idWlsZC1hdXgvcW1pLWNvZGVnZW4vcW1pLWNvZGVnZW4NCi1pbmRleCAx
ZmVhN2MxLi4xMDkyYzhlIDEwMDc1NQ0KLS0tLSBhL2J1aWxkLWF1eC9xbWktY29kZWdlbi9xbWkt
Y29kZWdlbg0KLSsrKyBiL2J1aWxkLWF1eC9xbWktY29kZWdlbi9xbWktY29kZWdlbg0KLUBAIC0x
LDQgKzEsNCBAQA0KLS0jIS91c3IvYmluL2VudiBweXRob24NCi0rIyEvdXNyL2Jpbi9lbnYgcHl0
aG9uMw0KLSAjIC0qLSBNb2RlOiBweXRob247IHRhYi13aWR0aDogNDsgaW5kZW50LXRhYnMtbW9k
ZTogbmlsOyBjLWJhc2ljLW9mZnNldDogNCAtKi0NCi0gIw0KLSAjIFRoaXMgcHJvZ3JhbSBpcyBm
cmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0IHVu
ZGVyDQotZGlmZiAtLWdpdCBhL2V4YW1wbGVzL3NpbXBsZS10ZXN0ZXItcHl0aG9uL3NpbXBsZS10
ZXN0ZXItcHl0aG9uIGIvZXhhbXBsZXMvc2ltcGxlLXRlc3Rlci1weXRob24vc2ltcGxlLXRlc3Rl
ci1weXRob24NCi1pbmRleCBhZjkwNjVhLi5hMzVlNTA1IDEwMDc1NQ0KLS0tLSBhL2V4YW1wbGVz
L3NpbXBsZS10ZXN0ZXItcHl0aG9uL3NpbXBsZS10ZXN0ZXItcHl0aG9uDQotKysrIGIvZXhhbXBs
ZXMvc2ltcGxlLXRlc3Rlci1weXRob24vc2ltcGxlLXRlc3Rlci1weXRob24NCi1AQCAtMSw0ICsx
LDQgQEANCi0tIyEvdXNyL2Jpbi9lbnYgcHl0aG9uDQotKyMhL3Vzci9iaW4vZW52IHB5dGhvbjMN
Ci0gIyAtKi0gTW9kZTogcHl0aG9uOyB0YWItd2lkdGg6IDQ7IGluZGVudC10YWJzLW1vZGU6IG5p
bDsgYy1iYXNpYy1vZmZzZXQ6IDQgLSotDQotICMNCi0gIyBUaGlzIHByb2dyYW0gaXMgZnJlZSBz
b2Z0d2FyZTsgeW91IGNhbiByZWRpc3RyaWJ1dGUgaXQgYW5kL29yIG1vZGlmeSBpdCB1bmRlcg0K
LS0tIA0KLTIuMzQuMQ0KLQ0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZp
dHkvbGlicW1pL2xpYnFtaV8xLjMwLjguYmIgYi9tZXRhLW9lL3JlY2lwZXMtY29ubmVjdGl2aXR5
L2xpYnFtaS9saWJxbWlfMS4zMi4yLmJiDQpzaW1pbGFyaXR5IGluZGV4IDc3JQ0KcmVuYW1lIGZy
b20gbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzAuOC5iYg0K
cmVuYW1lIHRvIG1ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvbGlicW1pL2xpYnFtaV8xLjMy
LjIuYmINCmluZGV4IGExY2ZlMjljYy4uM2E5MWE1YmQ1IDEwMDY0NA0KLS0tIGEvbWV0YS1vZS9y
ZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzAuOC5iYg0KKysrIGIvbWV0YS1v
ZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9saWJxbWkvbGlicW1pXzEuMzIuMi5iYg0KQEAgLTEyLDEy
ICsxMiw4IEBAIERFUEVORFMgPSAiZ2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIg0KIA0KIGluaGVy
aXQgbWVzb24gcGtnY29uZmlnIGJhc2gtY29tcGxldGlvbiBnb2JqZWN0LWludHJvc3BlY3Rpb24N
CiANCi1TUkNSRVYgPz0gIjk1MTA4YjZlZWJmZWZhNjYyMWExYzM0NTY1ZjU2MmVlY2E5MzA4Yjki
DQotIyBwYXRjaCAwMDAxIGlzIG9uIG1haW4gYnJhbmNoIHVwc3RyZWFtDQotU1JDX1VSSSA9ICJc
DQotICAgIGdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbW9iaWxlLWJyb2FkYmFuZC9saWJx
bWkuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1xbWktMS0zMCBcDQotICAgIGZpbGU6Ly8wMDAx
LWJ1aWxkLXVzZS1weXRob24zLWV2ZXJ5d2hlcmUucGF0Y2ggXA0KLSINCitTUkNSRVYgPSAiYzZi
MzhjYzI3NTI4NzNjMGM2YzFmOGM0NzJkOWRkZWEyYjM0ZWM3MiINCitTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvbW9iaWxlLWJyb2FkYmFuZC9saWJxbWkuZ2l0O3Byb3Rv
Y29sPWh0dHBzO2JyYW5jaD1xbWktMS0zMiINCiANCiBTID0gIiR7V09SS0RJUn0vZ2l0Ig0KIA0K
LS0gDQoyLjM0LjENCg0K

