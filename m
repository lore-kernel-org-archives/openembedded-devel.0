Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04BA9C25B47
	for <webhook@archiver.kernel.org>; Fri, 27 Oct 2023 20:40:09 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.79])
 by mx.groups.io with SMTP id smtpd.web10.17012.1698439206106062971
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Oct 2023 13:40:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=selector1 header.b=WSKH6C3C;
 spf=pass (domain: axis.com, ip: 40.107.20.79, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDvG92hrp9gdotRLoWqkJzcs6SR55QuvLORfVRAoE/5fb6t7c74kjQOROtd5ndaE3nkoJSy3t+IxVW4Li96bc6nIXmDyzJbJOkkh5tZwspYc3hl8UO9pXQBPUXpH3hOd9APhprI9vkKA93PMjJ318T6gAP8xyVmv/vCBUiNSMQOLKioBHI/1aOZa4O7Ww1hjpXi5XyWcDJGgdt++9ipXfZqd2JfKyPbkmbdlHf/cIUcykwTJKneyDkOUvueMgk1OXPpPChSYfVrmGxag8gGD7lDkAVJA3ESGTiek3G+wt1WCBg6wVcoHNLjFTzSv0/YEiUgVUJ02OUKPUoh4TWk0+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FqSkqWLxO7ldZoWXcgnhJCFOQwet/3u/7kH9sOPdNLQ=;
 b=mFwmaTnIvkjyVPI1Fo4+7psuI5tXwixw7Kvk5cjH+maizJa8bnUL62+cxK7lUgiCunKCDAd8poBh0YXOHSmJmcpnJ9PD2+i2qjqVDaYjQaskxWKLfK1X8KdEnjWBMSALia1q/F0tfuPdBMsqnTgJOr/3IgFTi4oaTSV0LqHOvLLUtILmhul2dBv9Fd2mccS2TQd9Aw4hlFBPydUp7Hkqf+xuScISiPUnVgjql4yvXu3cc1Z97mIQVQ3tfHJX7DgNio+zc4spf0nu91H+8y4eVcGM+jHVE4kXj4YDIylmI70DvKucKwQa4xULSHXcwuGHctiJqjUBuCbp3wZg1ykMNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FqSkqWLxO7ldZoWXcgnhJCFOQwet/3u/7kH9sOPdNLQ=;
 b=WSKH6C3Cpf+WCVT0l2yf4f5tbPcmW3EV3gqzk5tntmt8DfjgDFZuxQhnB8jx0LhWBz0pyxO6UxQLB2UaDY5QvC4ETsq2gkg85aRGVQgs/iXkvZV9zDtk2S74U08zysG+8LSsPbwiIroohbhhvwWclQNH3QTgx788p34p1ox/bH0=
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com (2603:10a6:10:4a8::17)
 by DU0PR02MB8449.eurprd02.prod.outlook.com (2603:10a6:10:3c9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.24; Fri, 27 Oct
 2023 20:40:02 +0000
Received: from DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093]) by DB5PR02MB10213.eurprd02.prod.outlook.com
 ([fe80::1b86:94ad:137d:4093%6]) with mapi id 15.20.6907.032; Fri, 27 Oct 2023
 20:40:02 +0000
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
Thread-Topic: [oe] [PATCH v2] connectivity: add pcapplusplus recipe
Thread-Index: AQHaCQ6zKdpJd7CGoUan4PmTOsflWLBeFnRg
Date: Fri, 27 Oct 2023 20:40:02 +0000
Message-ID: 
 <DB5PR02MB102132E9626696DE2B38664C1EFDCA@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20231027194914.78513-1-peron.clem@gmail.com>
In-Reply-To: <20231027194914.78513-1-peron.clem@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|DU0PR02MB8449:EE_
x-ms-office365-filtering-correlation-id: 9f9b6a9d-9259-4114-acf3-08dbd72ce50c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 odnKhx0dVXVsnS8xwU8dbBvLwe0xmMG87oxR6XCrpjvrrVfAvzQdlsnG7UjuGRJfEy2yYNmJGTcOHGpenOBdhw1rgEAFPfbhRkUlLP42h8bmRWXqciqP9k2vGMgiOl58p9tjsuszPej7QAQHB71C94WSbirbbJ/RZQdRTFFV4RmR3SPPdTtqqQvIChz5CD7SVZB4Yk38bXRiXZHwMt07yiTKxyPsBQ3fylS5QC6WCFP3EUAhMgdxztuJLfHtrs39tfj+mZbJD4GggRlNtFQBg0QLdk280goelAwAlX/Q0/BufBwGNpgbduyp+wL1LR2qA1KabTmBdNOr+eyV5VHHrQ8ZvUv7yjdEFR4TI9Y7wOk8yjC7PpF3jgxeXkTuR7uOD2vSi9WVqZ7nttrUCIURZUJszE04EEBhGeWV90jaGVL36keCWaXR2uMeu0K5ft1xFGo+WOIQSF8bu9XWKESdR2Z/1zoRz7dwBFGwa2+UJcDWqVBgyMRWhkDX9AvMOYyEw9lJ9FNc0yOOPHzpDw9uGbeLOsHpWCWIe/h6tyekSQ3eCeNsM4Zm7nsWPmfnmA0yfsVBQVQ1KOI2RJAa+UH7X6fOepYL206Qd0K4ILX+Pm4=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(346002)(39860400002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(38070700009)(55016003)(76116006)(66556008)(66446008)(66476007)(66946007)(316002)(64756008)(110136005)(33656002)(38100700002)(86362001)(122000001)(83380400001)(9686003)(26005)(478600001)(71200400001)(53546011)(6506007)(7696005)(2906002)(52536014)(44832011)(41300700001)(8676002)(8936002)(5660300002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?cGtXUDlsc1UxQlhGeHRHRk1ldWJrem9kZ2dPenNDSjJUS210SlFRYWtWSUg1?=
 =?utf-8?B?c1VXRVNsQThCQ2JCZUNoS0w3ejdDV0t5MU51Y0d0NjZIQk1ucENoWHo2RCtv?=
 =?utf-8?B?VUNMTEx1cUJ0QzBNYUJRL05HVWo0QXRCL3V0akwrbFFZanhpUFNUb3JVUlFV?=
 =?utf-8?B?emttS2RXRXZtS2JQWjJOSkh6L1RhZG1jc2RudmN5TEphSXA4dFRvMlRsbFdw?=
 =?utf-8?B?b2c0WkwxYW9aNWp2WGlrSEZvMyt6K2VaVWN3dUdaQ2lUcjJ0c296SkVpNGVO?=
 =?utf-8?B?cC9wRjJibmJmM2pST3p5aXJnZHlaQUk4RVZsOERJOFNmQW44bC9mRDA5TkhJ?=
 =?utf-8?B?QnZub1VSUlFxQlVNQnh3ZEdJVkRtOG90NWZ4M1VUT29qVzJhKytURGZuRjhM?=
 =?utf-8?B?WHMvMjUwMFFURVpXM2ZBaHFldFcxbVkxb0ZIVE9uUXA4b2RDOFkvRC9TQjBs?=
 =?utf-8?B?dUFTSk9SclhhQ1BTNG55UzByV1hYcVc0WFFXQVAybW55aUg0VlRsSjNRNGFW?=
 =?utf-8?B?UmhHUUgvSC8xVm9VTlhhY1dFY2t0ZCtUcjR6L1JJZzNrOFVGRmh3bHhhbDNt?=
 =?utf-8?B?WGlYc0NmdGV3L1Y0azdTS1hiRGUwNm43bHMvWFFxRndBQm9xT1dQa0p2ZU10?=
 =?utf-8?B?Skp6bVovamJqRkdZTkQvWm44TkV5THVzR3ZObmI3WGdoQ3I0OUkxUnk3Z05o?=
 =?utf-8?B?dUEyTW9SUFNMbXhZMEh3SnVvbnVaQUhEK2pwZklkK0l3UExBdkhGY3RySVU2?=
 =?utf-8?B?a0hVTHI0MnFYKytkK3dtcmhodjFGN1QvVzRXT1lSK3pTRFFjQkprRENOQmlw?=
 =?utf-8?B?VXlrQ2FGZldkNWptdkhhVmdWSU9lMFNoa1dGUDdMZVFabHJUL1IwdHQ4OHd0?=
 =?utf-8?B?TDRseVo1enlaL3hYM2QxVTlhaExoaTNQc0oyQUw5ODhHemZacHBOUjZFU21L?=
 =?utf-8?B?d1JQY2dhd2kxczRkbmlFMVdnUStnWGRLY1F0M3Z2TStaMzR3MkVlVmYybG0w?=
 =?utf-8?B?TDBhSkRuNk5oVTAwdEpLRy9sTTIvNVZYZXJFbjdxOEE2amJmNFJtazNXdzNO?=
 =?utf-8?B?M2M5V09mRk83T2pzbkg2SUpKK2tubHR3SjBnVUloMm5kamFHd2RRRERhemhB?=
 =?utf-8?B?Y3VYWXlTd3dVMUJTOVRsdldremxteElMcy9EclFnREV5MllrcW9xUGg4K3pB?=
 =?utf-8?B?cVRXeFVRWGRESXU3Nk51S3lnN212czhkZzBwNXdUanRiY1Z6UGkybG11Q0Zh?=
 =?utf-8?B?RER6V3BBSkFOUzdBQngvdU1uY1IzbEhzM3oyMU80TzBPNUVTNWlRTkRjQ2Nh?=
 =?utf-8?B?NGNQRGQxdHNTamtXVzB5aWl1WEVsam5GdlVsRDRWUnk3c1RKOTR0R1Q4clN2?=
 =?utf-8?B?bWpkWUYyZ2hYMTJUN3NRUU9zK1BCVW8xMGg0RTJ1d2NIZTAyUEJEWXNIbUs1?=
 =?utf-8?B?VklYMEpUOVY2UFRCWlNMT2JFdFNrYlEvQUhaRnYzL0dRaTNBUmk1bStnZndO?=
 =?utf-8?B?WWxNM2p2NlJlTSs4RHg2L2FUcXEzbmNhdXVLdDBqa09nZTF4blNoY3dXU0dB?=
 =?utf-8?B?UEtaUnFaWVNldS9qK2pJcm0vSzNYOS82WGY5VStLbEhpSjBKM1diUEdlVlgz?=
 =?utf-8?B?TDc3NHdhcWdPL2JDRUkzdEIvWmdUMWZUMW1mMDVKVUNhTlh2SkNyTjhHOXBl?=
 =?utf-8?B?OWt3azlCL3dUNDFkMHc3UVN4TFkvVCtHeFFYbDRyMll1cEc4YzV4SzA3WEs1?=
 =?utf-8?B?K2IvT3d6MGVZWTIvajZMczRwZE9oRStqUTNieUVidDRuazVuWmdPTi83Nmt4?=
 =?utf-8?B?eVQ3WlFCMkxVa2tad0lBOCs5R3Nkb0NLUnlwd3R5LzVncitNUSthVVhvaFhK?=
 =?utf-8?B?SmQwN0dITTM0MGQ1cjV2WTVKamdKMzJpUTRURkl6cU1LUC9pZ1JyMVZCcWFh?=
 =?utf-8?B?QmpqTG1wMVlRS25VOHhER0pjWE1NRERRZ200aThGUFkxcWdTS2d5NDNLaW8v?=
 =?utf-8?B?cHU0ekJlSnpGZFBwWUZXazVPdXBwbUJBejNxZG5wbVlLdHFlaWhwRC9TSCtU?=
 =?utf-8?B?T0ZEZnZWeUNpQXAxUlRWUmRjK0xFY0xlam9HRmVJUXp3V05GbEJibjBac3RF?=
 =?utf-8?Q?w1VI=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f9b6a9d-9259-4114-acf3-08dbd72ce50c
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2023 20:40:02.3970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RytJz+CURti1cXeTFpyy2elQHCyXnUF6IbzzXBW46rbQtJVg0Dj8S0ZiGrYifoIY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR02MB8449
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Oct 2023 20:40:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105783

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBDbMOpbWVudCBQw6lyb24NCj4gU2VudDogZGVuIDI3IG9r
dG9iZXIgMjAyMyAyMTo0OQ0KPiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNCj4gQ2M6IENsw6ltZW50IFDDqXJvbiA8cGVyb24uY2xlbUBnbWFpbC5jb20+DQo+
IFN1YmplY3Q6IFtvZV0gW1BBVENIIHYyXSBjb25uZWN0aXZpdHk6IGFkZCBwY2FwcGx1c3BsdXMg
cmVjaXBlDQoNCkEgbW9yZSBzdGFuZGFyZCBzdWJqZWN0IHdvdWxkIGJlIHNvbWV0aGluZyBsaWtl
Og0KDQpwY2FwcGx1c3BsdXM6IEFkZCByZWNpcGUNCg0KPiANCj4gQWRkIFBjYXBQbHVzUGx1cyAy
My4wOSByZWNpcGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBQw6lyb24gPHBlcm9u
LmNsZW1AZ21haWwuY29tPg0KPiAtLS0NCj4gIC4uLi9wY2FwcGx1c3BsdXMvcGNhcHBsdXNwbHVz
XzIzLjA5LmJiICAgICAgICB8IDIxICsrKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAyMSBpbnNlcnRpb25zKCspDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9yZWNp
cGVzLWNvbm5lY3Rpdml0eS9wY2FwcGx1c3BsdXMvcGNhcHBsdXNwbHVzXzIzLjA5LmJiDQo+IA0K
PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLQ0KPiBjb25uZWN0aXZpdHkvcGNhcHBsdXNw
bHVzL3BjYXBwbHVzcGx1c18yMy4wOS5iYiBiL21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkv
cGNhcHBsdXNwbHVzL3BjYXBwbHVzcGx1c18yMy4wOS5iYg0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAuLjM5YzY5NDJjOA0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L21ldGEtb2UvcmVjaXBlcy1jb25uZWN0aXZpdHkvcGNhcHBsdXNwbHVzL3BjYXBwbHVzcGx1c18y
My4wOS5iYg0KPiBAQCAtMCwwICsxLDIxIEBADQo+ICtTVU1NQVJZID0gIkEgbXVsdGlwbGF0Zm9y
bSBDKysgbGlicmFyeSBmb3IgY2FwdHVyaW5nLCBwYXJzaW5nIGFuZCBjcmFmdGluZyBvZiBuZXR3
b3JrIHBhY2tldHMiDQo+ICtIT01FUEFHRSA9ICJodHRwczovL3BjYXBwbHVzcGx1cy5naXRodWIu
aW8vIg0KPiArQlVHVFJBQ0tFUiA9ICJodHRwczovL2dpdGh1Yi5jb20vc2VsYWRiL1BjYXBQbHVz
UGx1cy9pc3N1ZXMiDQo+ICtTRUNUSU9OID0gImxpYnMvbmV0d29yayINCj4gK0xJQ0VOU0UgPSAi
VW5saWNlbnNlIg0KPiArTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9OTEx
NjkwZjUxYWYzMjI0NDAyMzdhMjUzZDY5NWQxOWYiDQo+ICsNCj4gK0RFUEVORFMgPSAibGlicGNh
cCINCj4gKw0KPiArU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3NlbGFkYi9QY2FwUGx1c1Bs
dXMuZ2l0O3Byb3RvY29sPWh0dHBzO2JyYW5jaD1tYXN0ZXIiDQo+ICtTUkNSRVYgPSAiNGNmOGVk
NDRmOWRkMTQ1Zjg3NGRjMWRkNzQ3ZGZlZmNmY2FiNzViZSINCj4gKw0KPiArUyA9ICIke1dPUktE
SVJ9L2dpdCINCj4gKw0KPiAraW5oZXJpdCBjbWFrZQ0KPiArDQo+ICtQQUNLQUdFQ09ORklHID8/
PSAiIg0KPiArUEFDS0FHRUNPTkZJR1tleGFtcGxlc10gPSAiLURQQ0FQUFBfQlVJTERfRVhBTVBM
RVM9T04sLURQQ0FQUFBfQlVJTERfRVhBTVBMRVM9T0ZGIg0KPiArUEFDS0FHRUNPTkZJR1tzaGFy
ZWRdID0gIi1EQlVJTERfU0hBUkVEX0xJQlM9T04sLURCVUlMRF9TSEFSRURfTElCUz1PRkYiDQoN
CkRpZCB5b3UgcmVhbGx5IG1lYW4gdG8gbm90IGVuYWJsZSB0aGUgInNoYXJlZCIgUEFDQUtFR0NP
TkZJRywgDQphbmQgdGh1cyBvbmx5IGJ1aWxkIHN0YXRpYyBsaWJyYXJpZXM/IFRoYXQgc2VlbXMg
dmVyeSBvZGQuDQoNCj4gK1BBQ0tBR0VDT05GSUdbdGVzdHNdID0gIi1EUENBUFBQX0JVSUxEX1RF
U1RTPU9OLC1EUENBUFBQX0JVSUxEX1RFU1RTPU9GRiINCj4gK1BBQ0tBR0VDT05GSUdbenN0ZF0g
PSAiLURMSUdIVF9QQ0FQTkdfWlNURD1PTiwtRExJR0hUX1BDQVBOR19aU1REPU9GRix6c3RkIg0K
DQpTaW5jZSBpdCBpcyB1bmxpa2VseSB0aGF0IGFueW9uZSB3YW50cyB0byBlbmFibGUgdGhlIGV4
YW1wbGVzIGFuZCANCm9ubHkgYnVpbGQgc3RhdGljYWxseSwgSSB3b3VsZCBzdWdnZXN0IHJlcGxh
Y2luZyB0aGUgZmlyc3QgdHdvIA0KUEFDS0FHRUNPTkZJR3MgYWJvdmUgd2l0aDoNCg0KRVhUUkFf
T0VDTUFLRSArPSAiLURCVUlMRF9TSEFSRURfTElCUz1PTiAtRFBDQVBQUF9CVUlMRF9FWEFNUExF
Uz1PRkYiDQoNCkFuZCB1bmxlc3MgeW91IHBsYW4gb24gYWRkaW5nIHB0ZXN0IHN1cHBvcnQsIHlv
dSBtYXkgYXMgd2VsbCByZW1vdmUgdGhlIA0KdGVzdHMgUEFDS0FHRUNPTkZJRyB0b28sIGFuZCBt
YWtlIHRoYXQ6DQoNCkVYVFJBX09FQ01BS0UgKz0gIi1EQlVJTERfU0hBUkVEX0xJQlM9T04gLURQ
Q0FQUFBfQlVJTERfRVhBTVBMRVM9T0ZGIC1EUENBUFBQX0JVSUxEX1RFU1RTPU9GRiIgDQoNCkFu
ZCBpZiBlaXRoZXIgb2YgdGhvc2UgdGhyZWUgbWF0Y2hlcyB0aGUgdXBzdHJlYW0gZGVmYXVsdHMs
IA0KeW91IGNhbiBvZiBjb3Vyc2UgcmVtb3ZlIGl0IGFsdG9nZXRoZXIuDQoNCj4gLS0NCj4gMi4z
OS4zIChBcHBsZSBHaXQtMTQ1KQ0KDQovL1BldGVyDQo=

