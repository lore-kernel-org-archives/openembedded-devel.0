Return-Path: <tom.hochstein@nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 635A4E7AD48
	for <webhook@archiver.kernel.org>; Tue,  3 Oct 2023 13:38:50 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.46])
 by mx.groups.io with SMTP id smtpd.web11.108118.1696340325085872870
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Oct 2023 06:38:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@nxp.com header.s=selector2 header.b=qXHtEce1;
 spf=pass (domain: nxp.com, ip: 40.107.241.46, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NADARYuPEwHmeeUfbuxkKwVeGG52bu9v+lciG8+/vWl2EUQWg4gL7BO+WPckYR7bNEycSKJIY4FEvKDghLg18Ynm3IFER/x0NRtNC006pa7SRhl66QykdAs5+901+LoEnpoVN4GeEBx+OV1van93YA22T710XkK//23jnT19BQPRuPX8mvBG4qLpVNApgf7nMzJoq7LbgebSQAMUEsdcSHsfZq8GYdke2YYdf6kN5P4EHtvTwKHBUDdYFgx3RO1hZ5mzvV7K3lGN4f7ySt9W9xOzhNOpXMIyNkAiRSMkljnjmhrs0jVZB+RpTKnfoxtBDxn4HzAg/EY2M+8wjKKSKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Shr5hs6FvHmfii5MGsPK+TaHmOjIIARB9RE9cUCd84Q=;
 b=nSq2knYqBgSTTZh/BpkYAGolGH/ZGgzUXdyRCBLHVUIiI2PXcRyUXsfPy/SoKn4Y1Xkmlm50egnooQMcXnFOhkyzBIbO9gIWZOqeF8W1kjLSkd1pQMCNPG/SD2TQYXFlFoove7YVRs/QssUhURuXAIKMMxK4aaz1D9t6O4Dz/rIM0Y2ABRsxFHPhwhDOMO87RWFU0tEWXE2jsqHs6ofVEgaXHWiwG0dfh3WesEEq09ooV4DW+uh7C2QHEMdifURHvdbGSQKgMNvIqesZ2dQq0/ZWeIpDycA3DfqXelQJLCPxSFetTMvN4NscZ1acKp6ZKEJI/qzFCa3JgIRgaqD7GA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Shr5hs6FvHmfii5MGsPK+TaHmOjIIARB9RE9cUCd84Q=;
 b=qXHtEce1ONzZxBiI+CZQXRzqZ8sn3U2BrCnTNUyuBs/X50WlNx4R0pu7T/88251RJvEF5LEbJYLvyU5/KdlFi9MELwnWJWRgoCDg4rGfDjlP7SWwZK8q1Ir9OjMXC0yllZV6y4/MmXXkaLAy8zZia6wqgqxDkhLeIa5XlNZfoZY=
Received: from DU0PR04MB9696.eurprd04.prod.outlook.com (2603:10a6:10:314::6)
 by AM9PR04MB8384.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.33; Tue, 3 Oct
 2023 13:38:41 +0000
Received: from DU0PR04MB9696.eurprd04.prod.outlook.com
 ([fe80::4939:b4b:824e:49cd]) by DU0PR04MB9696.eurprd04.prod.outlook.com
 ([fe80::4939:b4b:824e:49cd%7]) with mapi id 15.20.6838.024; Tue, 3 Oct 2023
 13:38:41 +0000
From: Tom Hochstein <tom.hochstein@nxp.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [meta-multimedia][PATCH] libcamera: Avoid build break in
 signature recalculation
Thread-Topic: [meta-multimedia][PATCH] libcamera: Avoid build break in
 signature recalculation
Thread-Index: AQHZ9VcMNvAUS8e8DESGEEIS+IRGUrA3zXAAgAAjz6A=
Date: Tue, 3 Oct 2023 13:38:41 +0000
Message-ID: 
 <DU0PR04MB9696DB38588F0EE1508653E6E2C4A@DU0PR04MB9696.eurprd04.prod.outlook.com>
References: <20231002173644.3284604-1-tom.hochstein@nxp.com>
 <169632534898.277971.10586575068039243782@ping.linuxembedded.co.uk>
In-Reply-To: 
 <169632534898.277971.10586575068039243782@ping.linuxembedded.co.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9696:EE_|AM9PR04MB8384:EE_
x-ms-office365-filtering-correlation-id: f42c28e3-2b78-47f0-27e0-08dbc4160e6c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BJBv037+jHwobw/kWHjNHzgsJ0iQ5lddE4B6YdwIMiCC3pvhPv0yQPb8KMbJS81MUes2pRRH0b+IduxYtjiqF7HCQpCxz298zi/r0yDbjv+v/exhwrmb1SeAB7Gsi2nILHRzjFk6oKy1Rz6uJFBgwuIstlSgmXMmLEKq41AaE4sT+eJkDrWFdhsbSjbyeyKlHgTit685mYU8EE7YLLAnf+4jipdRsX/bH2N7owsYtqJB0kykdMx4WrKZMKTyLXCDeUBAdhUAfIrJn8TvfOr7Dd/pqojulG1f16jU5lk4k5QKEHhZwIxb11N3qGWQ7+g/pw9TNQY2MiodTXL1R8yDqSo2gf5y7ecIRSrFV8lWEipGFY57uYC0spywJt6YmKXM2KPdcwbIr/MGq4ArxSfQJmgavjg9wkFWvpU9Ijo8sFduteNrS6OPEzSNxzC4d8k+K1QT89txRj8k1727KHyLVqOFL0rYwPslnX+EMQ4EKNMyKLNeChjYag7YU4yYNwAJUhfpR9HmzwiL0jaeal1kTWxJyNjXLWq9BvtYkQ4Npv9orOf95hMZzPlT6GpllSAs287Mv009f/Ko/JQR44bHPhSkM2KcWY5KLmv5UrI/2MMYKUsLBQChCThSPIDqDT3G
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9696.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(396003)(366004)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(2906002)(44832011)(122000001)(33656002)(52536014)(8936002)(83380400001)(5660300002)(8676002)(86362001)(66476007)(41300700001)(26005)(66946007)(66446008)(64756008)(66556008)(55016003)(76116006)(9686003)(53546011)(55236004)(478600001)(7696005)(6506007)(316002)(110136005)(38070700005)(71200400001)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?QVhVSytqWUVBdGVSSWJHQnZwS1J1dFVjR0NHTUdMVkhYVDNvMnhrOTliUzhP?=
 =?utf-8?B?U3lNM20yaVRRTDNsVzBwQjJNd2JoSDJkU08wWjV4MmtvS2RKYUs2NVNCUTlu?=
 =?utf-8?B?Yi9YdlFRdE5Wc2NuTnNpb25qUUJKY0xLUHhxYm9ldG4zL2hIRG1xaVY2ZVlz?=
 =?utf-8?B?TlRrRVpoNzNkcXpvRG1hRHh5K3VuVUFaMVM0cDFQV1FwMzdUSmNORzBzNzky?=
 =?utf-8?B?R2pLSWJRbmRKM0wxTlZFYmNXaWR6R2d6eEZvQm5lWlF2MSs0UnlpWDdKRDRN?=
 =?utf-8?B?NkVlOVQ4OGVwL0FLRnpWU09yV1poeE5wNm5EUkJjckdteHFEUVlSMk1kSEFS?=
 =?utf-8?B?T1RiZmpDTUxVMlJVRkxkaE9VanFiNjNBODRtcmlFZXNFcTNnaHREZ0p2TEpB?=
 =?utf-8?B?Mm9zWUphdzlzaE9Vdkd6ME1pVnY2enJVZU1GRVdLVXJIQ3F0T2NFMHdjY2pr?=
 =?utf-8?B?Z2tuOTVYd0JFL1RGNXMwZmFNMU56dDJmS1ZlNytZajFMeUZoVTliS0dacXpl?=
 =?utf-8?B?TTA4RElPczc1SkFOQWEwSDZBMXNxQmJqK0paZU1CVWlBZmg1anM3WGZXN1o2?=
 =?utf-8?B?ZXE0SWxSWmNlc2o2WTRkazZnY0RncWRqT1lERTZ6dlM1Z3FjTm9wT3ZKeGRr?=
 =?utf-8?B?ZFdBVXR0eER2bDMrRGhOLzRSMFc5RVVGOXVnOU1ycW1yeVFCanV4OXdBdm5W?=
 =?utf-8?B?d3NZcy94bDlkbVJHVGxWY3doM2xzRjhlOUMxeVBqeTdNb2oyV21KdTFLcG93?=
 =?utf-8?B?V01KNWZGeGsycXZIN2VqRWVGR2Z0UnlxYWdZNnBWL290c09wSWJMWStiajV5?=
 =?utf-8?B?R2tuR0dIeGdmSEpac0lwbVRFaEFDOVY1dmhjS3J6VjI3WUppVGZnSkkvbTJo?=
 =?utf-8?B?dzZ1U01XbGppY0p2TVVFNVlZTE1jYXRmbnBjb09OakVCUXBaRzZCZ3U1Qk9H?=
 =?utf-8?B?TEZrV2N0TDJUQ0FYclhvT0lGNzBWSEZrVGNmRHFhSXloQ0VaYnJZamFsaVJE?=
 =?utf-8?B?c0VGMElrTHhSaUxiTUVyYXMyZlVCdUJXTFlSYlJFbXQrc2YyaTM2MURmYXZX?=
 =?utf-8?B?RitWV21FQmtRaFEwVGpEaE1abmRlcFBSOFVLdjE4RGk3dkoxRlczdERoczJw?=
 =?utf-8?B?U2JvbW16cXpEU3B6RElDcDJtL3FZakZLNUlJK2kvYzRNZXlzaDZMQXlKNW1K?=
 =?utf-8?B?MG9xM0lnRko4RmFkSmROcUgvMkVrUExGTndCMW5VZWhVekF3SXlRMTEyK055?=
 =?utf-8?B?VGc4ZEQxcEIvVDRMdGt3Q2VnRHVVcG1wS3UxdnFDMENvZFl6U29oWGxNSnl6?=
 =?utf-8?B?VmEzT05VQ3VaMFRmSmh1RnFxNEczazhaQW1LaFRpbmxVYlJvajlEK2ppRnpG?=
 =?utf-8?B?Y1AyS0dUc21PU0RTTlQ0Z3p2U1F5cjNhQmJIbnIrUFM1am4wa1dHcTlmWkhF?=
 =?utf-8?B?NmZXRUZnMGxldXdQSG9wVmRZb29mVTFYU1E2WDV2RFI2dUE0eUI5QlphdEll?=
 =?utf-8?B?NGhTVG1nbUlHTzdENi9Fc2k4SFgyR0RNcWhYQ29mb3dDMjI3OFNua2lZc2o0?=
 =?utf-8?B?SEEwd0UxcllGYWtJMW96Qkh3N1lJK2pyaFU2SHpxTFk5VGE3QXltV1Zhblcv?=
 =?utf-8?B?ZWJSTEFJSjhDYjMxeXlKMEZ1VnR5aEs2WU1qUVZvZldoTklqcjFzbFNUbkwr?=
 =?utf-8?B?U0lvVmlzSjBkT0J0N0VnVVVxWEwwWEh0dzVRSHNjTzZFMCtORVd6aU1MMlRN?=
 =?utf-8?B?ZERLRDh4OC9Oa2lKUTBicC9xZlFnUWE5U1QwdzFpNlFsbHBGMitZMVRFWmhk?=
 =?utf-8?B?WFVWUnFVZWFSSU4vVmIxNGhBVk5xeXg1MndjNy8wL2JVcFc5RE5XYS8zVFFW?=
 =?utf-8?B?TGQ1bU9jMDl3d2VxZGx6TldGSWp4YU10TytGbk1KYlNmb1Nnb3NnMnl5TlBF?=
 =?utf-8?B?QXR1YmlOMXQwUUZxSURVVFpIMm02VzVrZThsU0ZsRWxiWkQwd0tHbHJjNEpv?=
 =?utf-8?B?MWFHS2JJSmFsTEVVRFJjWFJ1NEc1cTI5UTdTdDEvZUlhd2Z5Z0plOEJCVEdY?=
 =?utf-8?B?OHZrd0FzaG55eXp5ZUdzUkZvbTNINk5sd1YvRy9rVVNpdHFyTkZXVFAvWVpF?=
 =?utf-8?Q?juqSv10U9HKUxSZ6CLycwX8kd?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9696.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f42c28e3-2b78-47f0-27e0-08dbc4160e6c
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2023 13:38:41.3242
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: C7qPhCkC1OfwL2B5HhcL4qF8O3HNl+AsCXowSiot3wOMlwiIFUpX2aXP5Va+Y39wqp++lTmC9DMsxllgni3NeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8384
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Oct 2023 13:38:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105322

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2llcmFuIEJpbmdoYW0g
PGtpZXJhbi5iaW5naGFtQGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IFR1ZXNkYXksIE9jdG9i
ZXIgMywgMjAyMyA0OjI5IEFNDQo+IFRvOiBUb20gSG9jaHN0ZWluIDx0b20uaG9jaHN0ZWluQG54
cC5jb20+OyBvcGVuZW1iZWRkZWQtDQo+IGRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
Q2M6IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6
IFttZXRhLW11bHRpbWVkaWFdW1BBVENIXSBsaWJjYW1lcmE6IEF2b2lkIGJ1aWxkIGJyZWFrIGlu
DQo+IHNpZ25hdHVyZSByZWNhbGN1bGF0aW9uDQo+IA0KPiBRdW90aW5nIFRvbSBIb2Noc3RlaW4g
KDIwMjMtMTAtMDIgMTg6MzY6NDQpDQo+ID4gVGhlIHNpZ25hdHVyZSByZWNhbGN1bGF0aW9uIHRh
c2sgY2FuIGZhaWw6DQo+ID4gYGBgDQo+ID4gLy4uLi9idWlsZC90bXAvd29yay9hcm12OGEtcG9r
eS1saW51eC9saWJjYW1lcmEvMV8wLjAuNC0NCj4gcjAvdGVtcC9ydW4uZG9fcmVjYWxjdWxhdGVf
aXBhX3NpZ25hdHVyZXNfcGFja2FnZS45Mzc0MjE6IGxpbmUgMTU0Og0KPiAvLi4uL2J1aWxkL3Rt
cC93b3JrL2FybXY4YS1wb2t5LWxpbnV4L2xpYmNhbWVyYS8xXzAuMC40LQ0KPiByMC9naXQvc3Jj
L2lwYS9pcGEtc2lnbi1pbnN0YWxsLnNoOiBObyBzdWNoIGZpbGUgb3IgZGlyZWN0b3J5DQo+ID4g
YGBgDQo+ID4NCj4gPiBUaGlzIGhhcHBlbnMgd2hlbmV2ZXIgJHtTfSBpcyByZW1vdmVkIGFuZCBw
YWNrYWdlcyBhcmUgcmV0cmlldmVkIGZyb20NCj4gPiBzc3RhdGUgY2FjaGUuDQo+ID4NCj4gPiBJ
bnN0ZWFkIG9mIHRyeWluZyB0byBmaXggdGhlIHRhc2ssIGF2b2lkIHRoZSBpc3N1ZSBhbHRvZ2V0
aGVyIGJ5DQo+ID4gcGVyZm9ybWluZyB0aGUgc2lnbmF0dXJlIHJlY2FsY3VsYXRpb24gZGlyZWN0
bHkgaW4gZG9fcGFja2FnZS4NCj4gDQo+IFdpbGwgdGhpcyBzdGlsbCBoYXBwZW4gYWZ0ZXIgYW55
IGNhbGxzIHRvIHN0cmlwPyAoaS5lLiB0aGUgYmluYXJpZXMgd2lsbA0KPiBub3QgYmUgbW9kaWZp
ZWQgYWZ0ZXIgdGhpcyBzdGVwPykNCg0KWWVzLiBUaGUgcnVuLmRvX3BhY2thZ2Ugc2NyaXB0IGRv
ZXMgaGF2ZSB0aGUgcmVjYWxjdWxhdGlvbiBjYWxsIGFzIHRoZQ0KZmluYWwgbGluZSBpbiB0aGUg
ZG9fcGFja2FnZSBmdW5jdGlvbiwgd2hpY2ggaXMgYWZ0ZXIgdGhlIGNhbGwgdG8NCnNwbGl0X2Fu
ZF9zdHJpcC4NCg0KPiANCj4gLS0NCj4gS2llcmFuDQo+IA0KPiANCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IFRvbSBIb2Noc3RlaW4gPHRvbS5ob2Noc3RlaW5AbnhwLmNvbT4NCj4gPiAtLS0NCj4g
PiAgLi4uL3JlY2lwZXMtbXVsdGltZWRpYS9saWJjYW1lcmEvbGliY2FtZXJhXzAuMS4wLmJiICAg
ICAgICB8IDcgKysrKystLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEtbXVsdGltZWRpYS9yZWNp
cGVzLQ0KPiBtdWx0aW1lZGlhL2xpYmNhbWVyYS9saWJjYW1lcmFfMC4xLjAuYmIgYi9tZXRhLW11
bHRpbWVkaWEvcmVjaXBlcy0NCj4gbXVsdGltZWRpYS9saWJjYW1lcmEvbGliY2FtZXJhXzAuMS4w
LmJiDQo+ID4gaW5kZXggZWNlMWJlNmYzLi4yYTNjNjQ3M2UgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0
YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJjYW1lcmEvbGliY2FtZXJhXzAuMS4w
LmJiDQo+ID4gKysrIGIvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9saWJjYW1l
cmEvbGliY2FtZXJhXzAuMS4wLmJiDQo+ID4gQEAgLTUwLDggKzUwLDExIEBAIGRvX2luc3RhbGw6
YXBwZW5kKCkgew0KPiA+ICAgICAgY2hycGF0aCAtZCAke0R9JHtsaWJleGVjZGlyfS9saWJjYW1l
cmEvdjRsMi1jb21wYXQuc28NCj4gPiAgfQ0KPiA+DQo+ID4gLWFkZHRhc2sgZG9fcmVjYWxjdWxh
dGVfaXBhX3NpZ25hdHVyZXNfcGFja2FnZSBhZnRlciBkb19wYWNrYWdlIGJlZm9yZQ0KPiBkb19w
YWNrYWdlZGF0YQ0KPiA+IC1kb19yZWNhbGN1bGF0ZV9pcGFfc2lnbmF0dXJlc19wYWNrYWdlKCkg
ew0KPiA+ICtkb19wYWNrYWdlOmFwcGVuZCgpIHsNCj4gPiArICAgIGJiLmJ1aWxkLmV4ZWNfZnVu
YygiZG9fcGFja2FnZV9yZWNhbGN1bGF0ZV9pcGFfc2lnbmF0dXJlcyIsIGQpDQo+ID4gK30NCj4g
PiArDQo+ID4gK2RvX3BhY2thZ2VfcmVjYWxjdWxhdGVfaXBhX3NpZ25hdHVyZXMoKSB7DQo+ID4g
ICAgICBsb2NhbCBtb2R1bGVzDQo+ID4gICAgICBmb3IgbW9kdWxlIGluICQoZmluZCAke1BLR0R9
L3Vzci9saWIvbGliY2FtZXJhIC1uYW1lICIqLnNvLnNpZ24iKTsgZG8NCj4gPiAgICAgICAgICBt
b2R1bGU9IiR7bW9kdWxlJS5zaWdufSINCj4gPiAtLQ0KPiA+IDIuMjUuMQ0KPiA+DQo+ID4NCg==

