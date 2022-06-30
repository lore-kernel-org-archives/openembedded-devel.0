Return-Path: <javier.viguera@digi.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81FD2C43334
	for <webhook@archiver.kernel.org>; Thu, 30 Jun 2022 10:40:20 +0000 (UTC)
Received: from outbound-ip23a.ess.barracuda.com
 (outbound-ip23a.ess.barracuda.com [209.222.82.205])
 by mx.groups.io with SMTP id smtpd.web09.23638.1656585613033778577
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Jun 2022 03:40:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@digi.com header.s=selector1 header.b=VnA5Z5NU;
 spf=pass (domain: digi.com, ip: 209.222.82.205,
 mailfrom: javier.viguera@digi.com)
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2169.outbound.protection.outlook.com [104.47.58.169]) by
 mx-outbound10-172.us-east-2a.ess.aws.cudaops.com (version=TLSv1.2
 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 30 Jun 2022 10:40:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V1nx30qtmlczzuZeEtNcdkG+XXgL61wn7LQlU4Zh6Z23ZjMV3Qzk9g8tQQc+oKHY9/KWzm44geby/1ikH02DLoq+rVawnHpz1/nLms+gSlD3D5Cr3VTtZkR2aBJtxg/onXme0YDoNH5q4gZTP51e12n1S9Q4b7rI0zxdhOIBCjuD0v4AAogHSKK0dC26B3zZ5IczTh/w8kwhzcJLctvYbNCAWO2l4MHAIqOQYbq8RWYCJKM8rtpOEo3sIsb/b/KpDIQ7vqy/4Jx7Z/OL5MlolRY7DbGPhKiKedhEDgSUe10ycyOK5jF1ZQ1qqmpIi56nKUuNuCjwZH67Nd4Tfv2bFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4suGWuPCGuS/0hcqqOaiZd1U+QGRCQ+xNC8zp4EuNuI=;
 b=dboxxbpkbKoJqsUSOInlnYHpWKDe0qz4PzpfRTScKChXzMH+wBpoEkBfXdF+gFyLttA28lQoeKoUP2hlODHCFkch3kFhj+eN5n4wBLTd0o6JxB0+fdApHGo5v6UcbIBt9IAvTCfIiJsoGQr2QoM9TohcrVKqQtviX75pehcWUB17HPc6IjrO5SnynvreH4mGdD8TvUjNsqPxZHMleYlkXTsQJt1DP17LbthI2R8zI+1RaU2biu9EmUrVESATpLkRXSAqkwAZA+CEAWzVqkh24Wdwv6/MO3YY0OhE62657ZQIdZzCANSLFRpS6f8AII0U02wW9rLah3hzbWfW14CywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=digi.com; dmarc=pass action=none header.from=digi.com;
 dkim=pass header.d=digi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digi.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4suGWuPCGuS/0hcqqOaiZd1U+QGRCQ+xNC8zp4EuNuI=;
 b=VnA5Z5NUqZy3UvjIsWTc0tJesaJD97EFCElbiuz+abMwdwWltDBvnnrAfURNWbtxBAyi0yk6yAmK+CNm+3zRtU9HX/bGc7RNbRcwn1fjch0QOP77yi04kKJhJyOjE76lciLWtw0eSCUAPvJzMKSkjIX4/p4scTgkCHMjHP5GpyEY7LE688q/pzRV8tY7QYuApZz3bJ6qvE/0iwYanKMPUYSR0AIHB4eT/0Lzy5IAMxiX75qtGa9o034+NP3mNPByk8m4XB0DearzKxT521DJDHd427K8hDTlD7bk0SynBu4y0aZd9HnJpb3RCMZ8UbuP4Jes9VLvu0EFxFaCYkJSsw==
Received: from BLAPR10MB5156.namprd10.prod.outlook.com (2603:10b6:208:321::24)
 by BLAPR10MB4961.namprd10.prod.outlook.com (2603:10b6:208:332::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 10:40:09 +0000
Received: from BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::21a2:d9b:70e9:aac1]) by BLAPR10MB5156.namprd10.prod.outlook.com
 ([fe80::21a2:d9b:70e9:aac1%7]) with mapi id 15.20.5395.014; Thu, 30 Jun 2022
 10:40:09 +0000
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "akuster808@gmail.com" <akuster808@gmail.com>
Subject: RE: [oe] [meta-networking][kirkstone][PATCH] networkmanager: fix
 build with enabled ppp
Thread-Topic: [oe] [meta-networking][kirkstone][PATCH] networkmanager: fix
 build with enabled ppp
Thread-Index: AQHYiitQKFh0vBsNTkmCOfwEvVlvC61moJ4AgAEl5dA=
Date: Thu, 30 Jun 2022 10:40:09 +0000
Message-ID: 
 <BLAPR10MB51565170D5103B0EE78637F5E0BA9@BLAPR10MB5156.namprd10.prod.outlook.com>
References: <20220627133914.14615-1-javier.viguera@digi.com>
 <dbae2f04-a763-9fc4-b4d5-32ed3d6f9dcd@gmail.com>
In-Reply-To: <dbae2f04-a763-9fc4-b4d5-32ed3d6f9dcd@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=digi.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e048c714-5bd8-4e18-767e-08da5a84e7a0
x-ms-traffictypediagnostic: BLAPR10MB4961:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 uXyVqQ01GT0uP2NyGX2r1SEFjxJTQMPYVlkEO8wpVrKeNL+ZR54zJDrvRyUg365248jTXxjo09NCohINBsYwlQ5EYKhlUES81enJy+K4yXyZ2WHKI0g4p+0YFLaE2obXNBIUvShHniKJoOKCCF6onwudUEHMmet2VM+5PJm/AuZ47X4ebWx9OQ8UbyNYyH94jra20YHSv8625wz/VWzRK/Ox1CZHoLQZvqNl8d20LGAIkGeyRIMaPvhAjXtas+2273pg1YP95eiAQ2Io28/pbv3v7bm9JTxrS1SIlXdym0jthDzXy+OQa+vN6wDYOwI1u/pXamsCvK2OQUAK/l/oqXVWgUxY+gaxjE+EMK0fGpNPBn0CrBWcHyQyhBh4ja35IjWX/dpfS/M6BlISDo82BM0zqAmtzFPDX8Ogk+e7AbuE93SboEFwCHcB+hHIXz8eSQElYtgmhXqbgzLPSuFrhzf1gzKeqQd2o+6S+2JaD4+KKVZPV8K6yaoZjEP5aGHXsZPK3h1qcr1lm8iJ99WIN9R3xkuyydiTQc4MNF3cGS8F0bUlxg85ZTSVCz02aFF+PDmfe0uTNnz5ApHyy8AYDFMLGYiH3rUDqzKbrN4caiWLWFv0OHhAzHRo9Uzro47CSceUvFrSxZWhnK2JqZNwU8oc+db2AsatnYIbIPmMOJNWuhtFj7DqM4YTQ28IpNASQtrM4shEURTNOExXm2xlyXvh9I7z9AOH110YVNuJ0dyqbosKqDBSUFPMPeGghTaTOu+TnDoqLOuwJl3cAhRg2737yw0SDFPrstaq8IKXOIHiYwc+KyHL+jOO3dI6FEOj
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BLAPR10MB5156.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(136003)(366004)(39850400004)(396003)(71200400001)(53546011)(122000001)(478600001)(33656002)(6506007)(9686003)(26005)(316002)(41300700001)(186003)(38070700005)(110136005)(76116006)(7696005)(38100700002)(55016003)(66946007)(83380400001)(8936002)(2906002)(66446008)(52536014)(4744005)(66556008)(8676002)(5660300002)(66476007)(86362001)(64756008)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?Z1MrOTJyYTNiRDdBYkdmaElNTWVZaDNlaGU2dWFua1gwbXFSYUxPYi85R0tR?=
 =?utf-8?B?VndFRzBub2RJcm5mV090TkJCS3VQNEZHdTBKNjVSdWxMZVp3NHFRYTdtVUVo?=
 =?utf-8?B?Y0hJTTEwN3JtVEh4dnJJSm1HakpCVkdTK08xL2dUR2tmU2dGYUdxMk1XSEJq?=
 =?utf-8?B?NkJCUTJsNUZFZ0hOa2lqQzdoWm1vRnVUUkhOS2RkRmk5dDhFa2kzbzdrUlRx?=
 =?utf-8?B?eWJWQmR1dU9NRFNjNERjSFZkSUhtekthZXpNVjNLMWtRSTg0ZFpSUDRUcjRh?=
 =?utf-8?B?OWtyMmc2ZmR5QXlCNDNHQ3NScUk1Z3d0eGJ4ZTR1U29EN21FNWFwQzgyK0dR?=
 =?utf-8?B?b2RqR0FuOFRWSEtscUpSM2R4WUVsWHZXRHd0anhkM3ZKc2tqUnJockZqa3hx?=
 =?utf-8?B?WWVKQnM4ejRBSWdGWDgrcjJlNEVSV1FmRFpOMEdZdkZ0WlpteVBvWERKRDdJ?=
 =?utf-8?B?Mnc4VnhCMHQ1VVFNR09rcVNXVm0xOVBkaVMrMUJEUkxoQ2xJUVZ0NXd5SnJl?=
 =?utf-8?B?azhYSGtVMFlHNmVPMXVyVmhJRkQ2QWxaOFp1TmQ1aTFoQzNxWmVxL3NjV3BS?=
 =?utf-8?B?aFFrRUZUUUxuS3BlZk1DYkxSa2R5MmkrN2g2YnBkQWd5elhQYldQVGJxZDJ4?=
 =?utf-8?B?eHh6ZGRnbytITDMzNEliT0pjdkx2OWNUNldNeWV4TWNDb3VGbXF3L29CR1F2?=
 =?utf-8?B?bEdJdHZzbHgwVVBSOTFmMlpOQ0RZb3hQWFFFbDdocko5WE4zVUQrWGFnOFpH?=
 =?utf-8?B?N1ZFK25jT21QZDNDZUVOYVRVMFRoZmhmR0cyM0FjanNaaUJhUm1VUWRvQ2ky?=
 =?utf-8?B?VlFnRHBKQkxDZW41THhVTmRETzdRbkdRaFpteTU0bGc4RklKbEVmTnpBODk1?=
 =?utf-8?B?ZjdvMDRBOFhLVml5TVBoL1ZyWWM0L2djaGJ2V3g2YlJEcnF1aEE1dzBvY0Ey?=
 =?utf-8?B?aEdsVENVMm40eTZucTJaZ2NzbWduOHlCeFMwT0lFQktaa1RtYkdvb0hhdmhv?=
 =?utf-8?B?M3hObmNLeGlleVJIUVBYT083aURLNVZUL3JheFZjMzlmbnh3UmpkUHRWUGg4?=
 =?utf-8?B?Rko1d1NZRGc5eVM3MmdYek9DWUpFRkcyQ3pRb0ViS0FqYUdtU0YvKzNkaXdD?=
 =?utf-8?B?dmdIcEZnL0xMaTUzcG82REk0dW80UU9POTZnV1duYWkxV3pKQmNhTGdOZTZR?=
 =?utf-8?B?TUYrOHFDRHludFo2N0xuVGdPRWMrdEkyN24vamNPaTlDOHlaMDZtbkVBV2NB?=
 =?utf-8?B?eE1Ic2tJRVd0Y0ZHN3luSldoWC8rUW5GTCs3U0ZTNHBiQWVsVDN0dHYvVGRj?=
 =?utf-8?B?dTVjUUk2YUxGdzJsWU5pTlZnaTQwblpQcWlmSjlqYXdEbDJaM3ExTkpHU1Bj?=
 =?utf-8?B?MUVqMzR2b0hPYzBPai81T2YzY0xaZ2dCSFlPZWJ6ZU5uUjh2eTRDRUZDYU9B?=
 =?utf-8?B?aEZ3MmFrMlAvZHpCSXJoOFBIRUpIdXFwSVZtdHRIc2RRN3VXQjFWOTlqWkxI?=
 =?utf-8?B?SkgvNEFiLysvbVNHb1VYd1VFUXNlemJXR3k1S24zcU1KQ01adlhLa0tEckFU?=
 =?utf-8?B?M1YrMFcxMWVBN0l2RmxmUGdaMVlQWllZL3ErSUtwMkwrbk5tcFlSbkdCYlJs?=
 =?utf-8?B?RjZJM1Z5c0U0TVZEQkVBNlNyQUNtczRLdnRFNENFNVlGY0gyY28weURzcTBQ?=
 =?utf-8?B?WXBMVDdRbmNNQzNQZ2VqTVpMZFo4WUkxK0hyNllPM0lNZU9Fc09ZbXArdFZV?=
 =?utf-8?B?dnJxZU1Rc0JpQmF0Sk9SWXVpdVU0V2N6YjUrQmxuZ2tCNk5zTWNFa293K3BI?=
 =?utf-8?B?NkpuYTVRNjJpbkZlM2RXMXFZejRlQ0dicDFrZlJPRFVTWWVtZDk0UXN3UmFi?=
 =?utf-8?B?VVJpQTMraFRTRXlqQSs2OVd5M0JTZ1dDVEh2elRhUlBXZjlLdXM0MEg4Vjlo?=
 =?utf-8?B?ZnNma0srTWxpYzFQeG1OSWRrbStkRjB3NjNVUmdxeTNKV3lRbndrUlhiazda?=
 =?utf-8?B?dHQ1OUZ1MzZ2bWhIMHVZVHRST3pUZFRKVnVuS25rdVhndThvSGIvQUlvVi9M?=
 =?utf-8?B?bGpyaStmWlJIbGJjTEdrUmg4SlFWam1mOVFmRmZVRlF6WDdsdHNQall5ZjAx?=
 =?utf-8?Q?OhUg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: digi.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BLAPR10MB5156.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e048c714-5bd8-4e18-767e-08da5a84e7a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jun 2022 10:40:09.4113
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: abb4cdb7-1b7e-483e-a143-7ebfd1184b9e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 gT5BJooOAoU0jHCKD671wPGIGFedyeWQ7fAH6hktKcFSK20RPDTBIg4RbccYEWZNByLIbLPgSbZ5bl/rNQjyTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4961
X-BESS-ID: 1656585611-102732-5443-60513-1
X-BESS-VER: 2019.1_20220627.1822
X-BESS-Apparent-Source-IP: 104.47.58.169
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
 rules version 3.2.2.241041 [from
	cloudscan12-45.us-east-2a.ess.aws.cudaops.com]
	Rule breakdown below
	 pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS112744 scores of
 KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Jun 2022 10:40:20 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97635

SGkgUmFqLA0KDQpZZXMgaXQgZmFpbGVkIGV4YWN0bHkgdGhlIHNhbWUgaW4gKm1hc3RlciouIEZv
ciBleGFtcGxlIGJ1aWxkaW5nIG1hc3RlciBmb3IgcWVtdWFybSBmYWlscyB3aXRoOg0KDQp8IEhh
cyBoZWFkZXIgInBwcGQvcHBwZC5oIiA6IFlFUw0KfCBQcm9ncmFtIHBwcGQgL3NiaW4vcHBwZCAv
dXNyL3NiaW4vcHBwZCBmb3VuZDogTk8NCnwgDQp8IC4uL05ldHdvcmtNYW5hZ2VyLTEuMzguMC9t
ZXNvbi5idWlsZDo1NzE6NDogRVJST1I6IEFzc2VydCBmYWlsZWQ6IHBwcGQgcmVxdWlyZWQgYnV0
IG5vdCBmb3VuZCwgcGxlYXNlIHByb3ZpZGUgYSB2YWxpZCBwcHBkIHBhdGggb3IgdXNlIC1EcHBw
PWZhbHNlIHRvIGRpc2FibGUgaXQNCg0KLS0ganZpZ3VlcmENCg0KLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogV2Vk
bmVzZGF5LCBKdW5lIDI5LCAyMDIyIDE5OjA2DQpUbzogVmlndWVyYSwgSmF2aWVyIDxKYXZpZXIu
VmlndWVyYUBkaWdpLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnDQpDYzogYWt1c3RlcjgwOEBnbWFpbC5jb20NClN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5l
dHdvcmtpbmddW2tpcmtzdG9uZV1bUEFUQ0hdIG5ldHdvcmttYW5hZ2VyOiBmaXggYnVpbGQgd2l0
aCBlbmFibGVkIHBwcA0KDQpkbyB3ZSBuZWVkIHRoaXMgcGF0Y2ggb24gbWFzdGVyIHRvbyB3aGVy
ZSB3ZSBoYXZlIG5ldHdvcmttYW5hZ2VyIDEuMzgNCg0K

