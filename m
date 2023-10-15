Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8216C46CA1
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 15:06:27 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.82])
 by mx.groups.io with SMTP id smtpd.web11.94653.1697381740366124555
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Oct 2023 07:55:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@welotec.com header.s=selector1 header.b=PffELM8X;
 spf=pass (domain: welotec.com, ip: 40.107.6.82, mailfrom: p.lobacz@welotec.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvxIZzPgYFfRO3MP8K5PtS833+EizydRPokjqk1vLoKEvq0IqPm3el/EWDrGktOuI+9E/72NDoW5GIMknTAcc4rRyyifdAsJ9AF5ShzkH1phSsAhtORzt7awT/Tju0bFRD6NY694apbcQdDWf0k/MN4D/U06RICnfy+dKbAzDBpUFM2BrbixrOvIcv58k2c+p5kCDOAohG4m+cZxK5GdTxv4oED1tgEraVeJqudwpQnrAteyXGvp+rU+/qGH/6uoDFwpKHsIoeSBWEIg3oLAgdoVYP7kSilNdhm+Q2KPWR3+lRlRYPzBsKrzlr3OyCloJ9Kb6iWohKDM/+ggk+QmKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qh2+ZelTWJ6vT7OoaPWq5Erl7+kaDxbV68XEL9RH0R4=;
 b=HrcFJtnIDy8VWCanlYXQFY4+NUnSZUX5Doa8Y8GlWipdIrLuM0uDD+OYsAiYfqZkgObFzSmNhWWAPgNVVGLaW7o+QVhDnbLtMcGRPmI7aOVJqhE7g3JcEvhEJ1/dDwlMyT7PANCuF9Wk9nSZlrQLD+H/D+NAhGOUw0lPOUiy1VPUM2P7uwVMVX1xcFraKhPVSQ+/2u5SBsJ832WX9l6fDpAmtYjnW7hmVtETA4ePsLTndApQtcg2yjn70NcMdiuGDmpeUvy5s0a8XMbEgjnEC/vxKkVsWh+PPL3Xidw280F7xwggoVDI0XjD7UqYEsVaCt3HvLuD9zGJKiveSPGiZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=welotec.com; dmarc=pass action=none header.from=welotec.com;
 dkim=pass header.d=welotec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=welotec.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qh2+ZelTWJ6vT7OoaPWq5Erl7+kaDxbV68XEL9RH0R4=;
 b=PffELM8X3n95ecMDMEVvmqHUwYeREJDNo5fTlv8YmCXxwK2Ru+yR7zLrXhQM54qggxxEOXtttFpeALCvDxbmtuuH9xACkR2HhAIoEEPaL2ptk3gjH3thospx0Hk/VIUF8Vkb1X8raQz2IIUsyqZN0GMoaFT2En+u2pvLhjjN1r1lBVjeq0SxuK1LzghF8EYk7vDorpgxZ00ktzjXz+FnFPgBuDjvpBa+VJjeJcyXqylgsidUTjlPKSuUEcvorBtUWtjVCTw5yEByyrH7sSl3HdIJitIkFejbHDgaU3WUDjJ1oVrGpnMwB0YLvw+4cQW79Yth3X2yU0BsY2fWb7cdGg==
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com (2603:10a6:803:da::22)
 by VE1PR04MB7392.eurprd04.prod.outlook.com (2603:10a6:800:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Sun, 15 Oct
 2023 14:55:35 +0000
Received: from VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3]) by VI1PR04MB5373.eurprd04.prod.outlook.com
 ([fe80::3090:4af6:ae14:b9c3%6]) with mapi id 15.20.6886.034; Sun, 15 Oct 2023
 14:55:35 +0000
From: =?UTF-8?B?UGlvdHIgxYFvYmFjeg==?= <p.lobacz@welotec.com>
To: Martin Jansa <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [OE-Core][PATCH v14 01/11] package.bbclass: override tar with tar-native
Thread-Topic: [oe] [OE-Core][PATCH v14 01/11] package.bbclass: override tar
 with tar-native
Thread-Index: AQHZ/1cHqNPWuybvs0K9950EbEBLCbBK71wAgAABQgA=
Date: Sun, 15 Oct 2023 14:55:34 +0000
Message-ID: <4866554.31r3eYUQgx@latitude>
References: <20231015110154.53364-1-p.lobacz@welotec.com>
 <CA+chaQfON78OrVdk1Wd1De3DY0f5B_e1p=YiO+TFP2zPaoSSRQ@mail.gmail.com>
In-Reply-To: 
 <CA+chaQfON78OrVdk1Wd1De3DY0f5B_e1p=YiO+TFP2zPaoSSRQ@mail.gmail.com>
Accept-Language: pl-PL, en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=welotec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR04MB5373:EE_|VE1PR04MB7392:EE_
x-ms-office365-filtering-correlation-id: ebb5ea28-66af-44d4-c151-08dbcd8ec93e
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 UF/D6X0O0e3aTxNoIuHsPS/HC0z+q+RuyPODAAU9LutRjcvyL1sDH6YgwfL4SD9DjVlO5Ed5cdBNP3UxuxO1WdbDeVOSPzS4WsEbcMnesJskWyBH2fQHOGZ1c9mU0uP2ytwUTapjjeHYyCbXjHYV4yexGd/cxQjT7owjNyENAiaHgbrc4wyZlmKwwmuqs1k+pjuplsagOh0hF4aYL9aSeWxnGft8hDT1moyEzyrERO5D3IWglg069chS/61iIT3347t1eo4PXnmklWmCVl2oEvR8LIs+GUY6Piv175uN+MYJO5DrT4bERYVIwmPR/2e4vlc1pO+9qNj0c30FHnhY/u4vdMjfF9nySLcfuOPlmPQcqRzPOCGMq2h9YjY2wVk3QLNecjL8803Nag1sKFOhD+keSSc8oqKlnUQ1wlByi6GucqplpYF9A2c1wninubNeDGK1KhaQ9el8k+yBsAAZlV7bSvEVHJNMdT04o7y9qNCm2WtLTM7ZCfZ1+WIa4s5LG+mPopfyB91RwFj4n6x8NPrNUUbuJ5YEnQ53MJ+6DKWAvqP9hEuaCJfPI6VfowxHHdDa/m1qf9zdJaVuUJtfupHBgdgo12pMxDpQ8yjgnhbVIdYn6jCKhoo9cmol+Dcw
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5373.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(376002)(396003)(39830400003)(136003)(346002)(451199024)(186009)(64100799003)(1800799009)(26005)(66574015)(38070700005)(8936002)(8676002)(85202003)(4326008)(71200400001)(66899024)(5660300002)(38100700002)(33716001)(122000001)(83380400001)(41300700001)(478600001)(86362001)(6486002)(966005)(2906002)(85182001)(316002)(6512007)(6506007)(9686003)(53546011)(66946007)(66556008)(66476007)(66446008)(64756008)(91956017)(76116006)(6916009)(39026012);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dlB3Y29GcWMyWW00d0k3Wm9JY0UrSVU0bzV0K1lwN2hGNXR4SDNwZCtxNk1x?=
 =?utf-8?B?LzAyQ0lvVXJINklDQ3gwOW1zbHJxWHFTNzVEMjNJTUxIYUw3dHk1STA2VjFP?=
 =?utf-8?B?QU5pY2E5V2RTQnRPS3d1N1RyNklCMHA2Z25WMUVFZTA4a2FDeXpvVm44V2VS?=
 =?utf-8?B?R2VXL0tqcHdvOWJERklCVXpmRE9NYytvZkdobCtVdERPa2hRZ1MxZ0VGSEsr?=
 =?utf-8?B?RTlvcUkyT0lPSFBUZDJvRllBOUIxQ3IrUlMyVThkdk9CeWVpemNtemUyY1lo?=
 =?utf-8?B?NjJkKzBlVkNKNzNYUmJOelJ3RmdYZC8wTlJoU1plTmxMUnpNMjZKb01wRXRq?=
 =?utf-8?B?b2tURUt3Vk83TVZvSG5VZUdTNDVuWTVxWFFuTzVLeUI2TGQ1cGNUbFdvTmc1?=
 =?utf-8?B?aTdrRnkvSEx0ZUpFWGc0STRjQlN2aGpRWitHNUI4cHExQVJUdWNaS2JIa210?=
 =?utf-8?B?UHYzcUNTSzRSSEJaZjFRaU44RWIyUEJFakhJekpFcDhDNG03d0RvNDRLbWVI?=
 =?utf-8?B?a2t2Vk5jL2NFa0dHcDA2RHhhQVRqbHRPR1o0YWJZVGQ2clYyMXBhWkpleEYy?=
 =?utf-8?B?SFNkTE5iU2xsb20zMjY4bFdxeW52NDVFazd4bnhsOFBzbU1MSU5WRUhtbXZz?=
 =?utf-8?B?YXBtbHFXMkVWSUhMMTVKeWVkQ0FVV096OUF1NEJLWlF6MzFCRUx3T3plcGdM?=
 =?utf-8?B?Wnlsb2VNR3Q3dG9HY1g3TzA1WlIvV0pUakMydytNZE04eGZGekZuN2tCWXla?=
 =?utf-8?B?Wkd3cTJwVGlyczQ5UUI3L09EajdaN0pSdnpJdFlDZHo1ZzZ4eXpoemQ1MXpw?=
 =?utf-8?B?MlpPVHllWTJKVGd6S2I0Y0RqVG5GaitsY09GT1RFbjRhazdTWFY2T3RFd1B6?=
 =?utf-8?B?KzU4bHc4WkFZa1B5aEhtMUR2d2JDNTY4YndEYTRUVzA4TnZlNk5LQU1hak05?=
 =?utf-8?B?V0syQVdmWHNXYWZsMmZtb1MzS0dROFk1SEpJL3puaFNHdGZoaFpHRHFNYWlt?=
 =?utf-8?B?c0szQ29iUWw4N05pNGZadjA3YzMrVW04RHJPdThYMS8yNHF0cXNyNjFDWHVY?=
 =?utf-8?B?ZmJvNDdCaDkzYjRKSmdSOTFlS0tSOXI5WXpVMnhsbk9jeDdHYlROQ0lGWVBQ?=
 =?utf-8?B?N3RjR0JIVndheCtIZkZVRllxUmMvaWpUdzRvVlkrSWJTRm9rYmhFbEUrNHpS?=
 =?utf-8?B?a01ZUmZEd0U4cGVjVkhvUUxzOSt3ck9MaE5jMmRrUkJIN2ZqNWo0OWF6MVpm?=
 =?utf-8?B?OGhPU0hsU2pvQmZOdDcra0N1a0J3NjFqRlJ0WW1Yb0YvZTF5bnk2MWo4WEQw?=
 =?utf-8?B?b0ozd1lXckJ2UFlSK2pacmF6S1VQdms4MnZRN2E3U3AyUVVMSHJaejRzMjJZ?=
 =?utf-8?B?QXdITmVOVEFkWjVQQnFoWVRjejdPRE1HKzhiSVZIUnAyS0FsQWpMMkUwSmxP?=
 =?utf-8?B?Q0lsTWFTajJ3NnVPTDJsUGh5WFFRT1NXa2dyRkZCT2dtb0RXdGV0ZXk5U1gx?=
 =?utf-8?B?UWt4eTg3dEdZRG5FWDVGa1VRcFZtdWxaaDZGZ2VBUWREeVB1SVJ1eGN0Q1lL?=
 =?utf-8?B?emJmOVRFT0RXUGhyQmVQOWNvQVhaektYWXFoVTBpTlEvQUhqaDl1M3R6RWZX?=
 =?utf-8?B?R1FOVldya2tJZDZkaEJjRnFFNmFUQ090RVVDSzBhK0VPYjN6eERHWG94Z01L?=
 =?utf-8?B?K1dYVloway84L1JraURxT3JtZHM0TWMwdGt0ZFZJTTBjS1F2cVFuelZKNG9u?=
 =?utf-8?B?TFNvYi9YakZXL0JHbU1FcnFib2NCcFVtVXFCdk9qSy9heG9QVHFFZFRJSWQx?=
 =?utf-8?B?QWRWYWptd3hxMEIzZXdPL2ZJZVQyRmU3SDhwNCsvVzlrNXoyTFBGNDlhNU1M?=
 =?utf-8?B?SWh4RjF1NUR4ZklkcXJNNnBVaHFZQkRLaWx3cm0vWFdNcGFUMkJOYzhLTlhM?=
 =?utf-8?B?ak5vRzZxeW1lWjVqMFJ6ZmZpcHdqRTR6QVQ2eThpdVJ0K2pKckFtbjRaZ0RT?=
 =?utf-8?B?N1VjSXYzZ1hKTEtmR1JqcnJXcWhTYVFOYllYMjVha29kMUlRc1ROd3psM1gw?=
 =?utf-8?B?SVg0SU5zdFgwWlNFRThZODB5NGp6VnFhcDNGdTdOc0U2ZHRQT3U2diszREZ5?=
 =?utf-8?B?UXlHRXR2TWtGYUNZdzNzbWg5MmYyUEhpcVlmY3dCZWtONVJhQ0tTVit4K2Rk?=
 =?utf-8?B?QUE9PQ==?=
MIME-Version: 1.0
X-OriginatorOrg: welotec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5373.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb5ea28-66af-44d4-c151-08dbcd8ec93e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2023 14:55:34.8000
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 25111a7f-1d5a-4c51-a4ca-7f8e44011b39
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wihReq9tX/hZ7uOJHWq43M+2cqLQ8cNSPnXijBtcwDSYfgxT9CfLUHsy6JsDRv3hmSKN88EU/EC2JaicrCJVOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7392
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <14901B527569BC4C96E385D000EB2466@eurprd04.prod.outlook.com>
Content-Transfer-Encoding: base64
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Oct 2023 15:06:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105540

RG5pYSBuaWVkemllbGEsIDE1IHBhxbpkemllcm5pa2EgMjAyMyAxNjo1MTowNCBDRVNUIE1hcnRp
biBKYW5zYSBwaXN6ZToKPiBXcm9uZyBNTCwgb2UtY29yZSBwYXRjaGVzIHNob3VsZCBnbyB0bwo+
IG9wZW5lbWJlZGRlZC1jb3JlQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcKPiAKPiBPbiBTdW4sIE9j
dCAxNSwgMjAyMyBhdCAzOjE54oCvUE0gUGlvdHIgxYFvYmFjeiA8cC5sb2JhY3pAd2Vsb3RlYy5j
b20+IHdyb3RlOgo+ID4gRHVlIHRvIHRoZSBidWdzIGh0dHBzOi8vc2F2YW5uYWguZ251Lm9yZy9i
dWdzLz82MTkzNCBhbmQKPiA+IGh0dHBzOi8vc2F2YW5uYWguZ251Lm9yZy9idWdzLz81OTE4NCwg
d2hpY2ggYXJlIGZpeGVkIGluCj4gPiB0YXIgdmVyc2lvbiAxLjM1LCB3ZSBuZWVkIHRvIGZvcmNl
IHlvY3RvIHRvIHVzZSBpdCBpbnN0ZWFkCj4gPiBvZiB0aGUgb25lIHByb3ZpZGVkIGJ5IHRoZSBo
b3N0IG1hY2hpbmUuCj4gPiAKPiA+IHBlcmZvcm1fcGFja2FnZWNvcHkgZnVuY3Rpb24gYW5kIG9w
a2ctYnVpbGQgc2NyaXB0LCB3aWxsIHVzZQo+ID4gdGhlIHRhciBwcm92aWRlZCBieSB0YXIgcmVj
aXBlLCB3aGljaCBpcyBhbHJlYWR5IGluIHByb3Blcgo+ID4gdmVyc2lvbi4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogUGlvdHIgxYFvYmFjeiA8cC5sb2JhY3pAd2Vsb3RlYy5jb20+Cj4gPiAtLS0K
PiA+IAo+ID4gIG1ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNzIHwgNyArKysrKy0t
Cj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+
IAo+ID4gZGlmZiAtLWdpdCBhL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNzCj4g
PiBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNzCj4gPiBpbmRleCA3Nzg3MDQy
ZTIxLi41ODA4ODRjZDgzIDEwMDY0NAo+ID4gLS0tIGEvbWV0YS9jbGFzc2VzLWdsb2JhbC9wYWNr
YWdlLmJiY2xhc3MKPiA+ICsrKyBiL21ldGEvY2xhc3Nlcy1nbG9iYWwvcGFja2FnZS5iYmNsYXNz
Cj4gPiBAQCAtNTgsOCArNTgsMTEgQEAgQUxMX01VTFRJTElCX1BBQ0tBR0VfQVJDSFMgPQo+ID4g
IiR7QGFsbF9tdWx0aWxpYl90dW5lX3ZhbHVlcyhkLCAnUEFDS0FHRV9BUkNIUycpfSIKPiA+IAo+
ID4gICMgcnBtIGlzIHVzZWQgZm9yIHRoZSBwZXItZmlsZSBkZXBlbmRlbmN5IGlkZW50aWZpY2F0
aW9uCj4gPiAgIyBkd2FyZnNyY2ZpbGVzIGlzIHVzZWQgdG8gZGV0ZXJtaW5lIHRoZSBsaXN0IG9m
IGRlYnVnIHNvdXJjZSBmaWxlcwo+ID4gCj4gPiAtUEFDS0FHRV9ERVBFTkRTICs9ICJycG0tbmF0
aXZlIGR3YXJmc3JjZmlsZXMtbmF0aXZlIgo+ID4gLQo+ID4gKyMgbWluaW1hbCB0YXIgdmVyc2lv
biAxLjM1IGlzIG5lZWRlZCBhcyBpdCBoYXMgZml4ZWQgYnVncyBmb3Igc3RvcmluZyBBQ0wKPiA+
IGVudHJpZXMgaW4gdGV4dHVhbCByZXByZXNlbnRhdGlvbgo+ID4gKyMgYW5kIGV4dHJhY3Rpbmcg
ZmlsZXMgd2l0aCB4YXR0cnMgdGhhdCBhcmUgcmVhZC1vbmx5OyB0aGlzIG5lZWRzIHRvIHdvcmsK
PiA+IG9ubHkgaWYgYWNsIG9yIHhhdHRyIGFyZSB0dXJuZWQgb24KPiA+ICtQQUNLQUdFX0RFUEVO
RFMgKz0gInJwbS1uYXRpdmUgZHdhcmZzcmNmaWxlcy1uYXRpdmUKPiA+ICR7QGJiLnV0aWxzLmNv
bnRhaW5zX2FueSgnRElTVFJPX0ZFQVRVUkVTJywgJ2FjbCB4YXR0cicsCj4gPiAndGFyLXJlcGxh
Y2VtZW50LW5hdGl2ZScsICcnLCBkKX0iCj4gPiArIyBwZXJmb3JtX3BhY2thZ2Vjb3B5IGFuZCBv
cGtnLWJ1aWxkIHJlcXVpcmUgdGFyIHRvIGJlIGluIHRoZSBQQVRICj4gPiArRVhUUkFOQVRJVkVQ
QVRIICs9ICIke0BiYi51dGlscy5jb250YWluc19hbnkoJ0RJU1RST19GRUFUVVJFUycsICdhY2wK
PiA+IHhhdHRyJywgJ3Rhci1uYXRpdmUnLCAnJywgZCl9Igo+ID4gCj4gPiAgIyBJZiB5b3VyIHBv
c3RpbnN0YWxsIGNhbiBleGVjdXRlIGF0IHJvb3RmcyBjcmVhdGlvbiB0aW1lIHJhdGhlciB0aGFu
IG9uCj4gPiAgIyB0YXJnZXQgYnV0IGRlcGVuZHMgb24gYSBuYXRpdmUvY3Jvc3MgdG9vbCBpbiBv
cmRlciB0byBleGVjdXRlLCB5b3UgbmVlZAo+ID4gCj4gPiB0bwo+ID4gLS0KPiA+IDIuNDIuMAo+
ID4gCj4gPiAKPiA+IApZZWFoIHRoeCBNYXJ0aW4gZm9yIHBvaW50aW5nIHRoYXQgb3V0LCByZS1z
ZW5kaW5nIHRoZSBwYXRjaGVzIGFnYWluIDopCgpCUgpQaW90cgo=

