Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD694C7618E
	for <webhook@archiver.kernel.org>; Wed, 26 Apr 2023 17:29:55 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.2308.1682530191437351303
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Apr 2023 10:29:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=KyIpS7a7;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1682530191;
  x=1714066191;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=KjIppElm6XHcbhnLgQIO+iGitgpPjxuqAcDpXvkJpHg=;
  b=KyIpS7a7NmgvWLVae4ZC+G6UFKnSie9MMsnCx577YNs9o31gf+DN7drw
   oafbKER0TxYbX94QQ8JVQ6VPfsBBZp+i725/bdOMyrIfsi3zwXDPFS6Qn
   aO4uePT2URkX5SDOSD0RKwd3fHMh//hn5mlsN4aPk+pr/k2R7l9brjNun
   FpEHczXl5INS8OQ7QYtenFehUbIJxHkw9iNIZUiYWdwcFi3zQjc8+g2PV
   U/HHsOPTI3ZWTI6sl3xRFFT0i7G28+tpR7ApX6FodmvpAENj8pGxla3HR
   ra2cxQLGrWODFW4LjnB3lrEJUzLUmqFVFV5OAGadbVobo8cxEmKCELi9l
   g==;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RepqOBg3mIGPeRKrjmJdSX1N/DcbEhTUuH8IMBwOyyEgywi74h2nhymJqnK1DxVyWK5liZzNK7EmaCgSklOSbweJrIX+fzqp6eut9I9OuNgS09p/C/Oa88ia2/gfzTsaaD7AYv/1UxOUqnj9VfL3dwYOCCI91VkkrvVZk081clhMjsUPM9HoIHyhC5pw0a5myv9EQ/ABpiyjmk5lfvd0K2RI8NSmU3vo7l+NwoBzhTGnebHRQjxwLU86p0NLYUcLAu56YK9UkpbuiQqC94by/wLzevICUf4+pJULq2yEv1YCS2iH0ZiWkynkr9kkyH9fxtLgH0M/Nq+LGajYU614gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KjIppElm6XHcbhnLgQIO+iGitgpPjxuqAcDpXvkJpHg=;
 b=fP/bTlhsL3e4psaRaWz4tTljzP4+/3nf9QRmshf7MP4KXiwzEmPbwHJvK9moP8uIaS2aTT2h4jNBS5wNquYfEqU/3ONH4ZhTX1Zs72r4Zj1CmthZxE4Mf/1qd5i7gcWmMiF5jDS/N9ydG2N+sn+Oqb9aW5uSbqdNwI4qmDViVnXmQSv6SYej9OOl+a9/r52cmxsbOY2fjONQ8hlHxVA062CCtSe0MwVCQMei+DR9unAUyD5OvNLUt9a/ycADtp7pfXsg6g0h6j8uSXtEmJcPLZ2hcz5guT/bHLs+9ONqeQiPpj7xtkFHhkVkxSqCkPrmnfIM6N+3rgKoEnipy4Ab/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=axis.com; dmarc=pass action=none header.from=axis.com;
 dkim=pass header.d=axis.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis365.onmicrosoft.com; s=selector2-axis365-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KjIppElm6XHcbhnLgQIO+iGitgpPjxuqAcDpXvkJpHg=;
 b=o0URBwnbo7N8nwZ3MqmTSpkoajOxHBRcpS37467gKnf+aIRWD9FPVcuAukgs4eqHlCMYCLsM8I05Qsi7UD0N5fqzcg721CUU3qxcrm8Eqa95C8Ho9Pkh1lJXwr/XE6fz5IZva091GT/tlG/qFYxUJE1l/+VlOWNmKzCDj3YuTyM=
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Zoltan Boszormenyi <zboszor@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add
 PREFERRED_[R]PROVIDER_virtual/opencl-icd
Thread-Topic: [oe] [meta-oe][PATCH 3/3] meta-oe/conf/layer.conf: Add
 PREFERRED_[R]PROVIDER_virtual/opencl-icd
Thread-Index: AQHZUl65fBREvOqcJEWTWmDZUN51ta8+IheA
Date: Wed, 26 Apr 2023 17:29:45 +0000
Message-ID: <DB5PR02MB10213D9166C80E435523C7EB3EF659@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20230309081036.3179583-1-zboszor@gmail.com>
 <20230309081036.3179583-3-zboszor@gmail.com>
In-Reply-To: <20230309081036.3179583-3-zboszor@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=axis.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB5PR02MB10213:EE_|PAXPR02MB7958:EE_
x-ms-office365-filtering-correlation-id: e8a0efe2-1161-43ad-d3e3-08db467bd422
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jzrcCbkgDCl2wvOaRBYY+G/MI/ZcrteSljRmPQ9XGDxagF73tf/7kigHFKJEnoHPjA7Iy5MJLq21H66DikCXOuwT2xAZuhJ9OeYqEh0zHwvfvR83bS5ONBlR8I/RSO7fHKbZatstESlX7G6Ub2Gz6jCq1xTxyu0d2hP8uNMRAUOdCM8SIzx0oIdWjEB4CHHN5pTmPxPVX0zq7H7HpSlmeEN8VgU/hi8//N4KMPlifNytsyDaG+QCNZ6XA1jvf62p9M4P7121JZV950P6WTh7NMSpiHIQX8dIrxXE2PTNzogkWFH0qfTBDJVzjycllC+KOQEJaQMxwH0QfbeqlL9Tjfrs69Hy0H4Jevx94q0wgZiGtfJDFnP0fHL6q5gR+F2rt9v0T7YYQcdDP6X1301SLG8Ubvg6C5p83DUdzMvMos2Nocz5wyLzXfOn4hkfyuqIzSzsO9fGjYDY1FKKZFF1F9mDKePI0Rex3HLtqa6hGgUaX0LVva3tUxfnhBSLMSWeF85wyVMOACzbZ/0xejSF5D2pMHfnXz32IiDIQI8XuhWDVsHvgD6CPPl3iOxuvEvvEoORogVol7IPatPr8ZkXNxuX3eH8paDvtpMuddZ2/3mq86g1stCQdeIx7DEQBMz2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB5PR02MB10213.eurprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(376002)(396003)(346002)(366004)(451199021)(6916009)(122000001)(41300700001)(38070700005)(44832011)(4326008)(83380400001)(66946007)(64756008)(66446008)(66476007)(76116006)(26005)(8936002)(66556008)(53546011)(7696005)(6506007)(33656002)(316002)(71200400001)(8676002)(52536014)(5660300002)(38100700002)(2906002)(86362001)(478600001)(9686003)(55016003)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dG1wb0VVb2ZlZFE4RU5MVVUzSUhhOTZ0MWViTStGMDIvYjMrMXF0YXlYazhT?=
 =?utf-8?B?eHJsb21zWENta2RlcWNtNUtrT2dNbnFhVGdjdEU0azdUdmNuMk80WEpFaUZm?=
 =?utf-8?B?U1BMREd4a3lsdEp3eHAxQ3dBS1BDWG12TnUzK1Iva2h1TFRLS1JvTWJHZWZs?=
 =?utf-8?B?b1p2ZkxCMVVkZTVrUWtNbTBIcjM2clQvS1VlaWN4MzZOemN3UnYwbyt4OENF?=
 =?utf-8?B?U0piaDFXeEhsSXBVajF0SUZRaGhMcXo0U0xETnUwMTlDT1BtOXRhaVNMNUZQ?=
 =?utf-8?B?emFqODJURFRhUGdKbmNNRmR0c29HclpiQWdMNmlGOUcwMHRMUW5iSXl5eW9I?=
 =?utf-8?B?RGVxWldIMFhLaHZYVUpZV2VPdXVwR3NqdWViQUdmZTBCUFhmZjRTbFRSUmVZ?=
 =?utf-8?B?ZW52U2FEVWg2OVRyNWhrTWwxSUo5Y0JZcldtdEJKOXB0RmNSVjdGem5IZlo4?=
 =?utf-8?B?aElxeGFqVEtjU3BPT3pRV1VWNTNwZThEenFwWVM0aVF2SnpMR0NvRDd1QkJz?=
 =?utf-8?B?RWZqNXc1UFlnM2xmU3NKQm1ROWdmTFVJNEc0M2o1NXorQkszQ1VJMWJPTm9R?=
 =?utf-8?B?L09WRFM0MXJjL2hROWRxZUZVMGZ2L01hOEJyNWR6UUJRREFCSVJGcUZiWWwv?=
 =?utf-8?B?L0l6VitMa2RueTNrWXVJUHVBK1diVWpQYWNVemtzNXBWOHp5ellWWXFvL3Iw?=
 =?utf-8?B?K0dqWnp6ak1BbURxSWxoQVlDMnQ5dWdqUThNc3BXVk1rZm1tZXptMGFQcEY5?=
 =?utf-8?B?eERnT0c2c2YrRmlweGpEY2gwcWZJT2h3TTNQUENKZHlBMjczU0xFdGJiL0Nw?=
 =?utf-8?B?a250UHZHdmdMREwxbFJ0Unduc0VyNGJHL0dYU3FWVFhQUUljbC9GcjR4OEM2?=
 =?utf-8?B?TnBHOVlSMzhBUVNteE9LSlJXUTFheFFxSDdkZkYxVDgvaVlha3kvVjhEYTNE?=
 =?utf-8?B?d1Z6TmVKY3BheG1LR1J3MTR3WXVRelFKc0hSTlVTWmRWK2tKNzJzbStrejBt?=
 =?utf-8?B?V0xUTHhCVitOSGxQdk1HNHd4bUJRSWwvMHhHUUN2cUp5RVNpc0lmak5wcjA1?=
 =?utf-8?B?a0xSaStSbUVMUjRGU2dUWEdoUi9kQVJNYUdobysybGVubVVZcHFXbkNMeWFI?=
 =?utf-8?B?VXVwdktsK1ZScXdvVnNQY0Nkb2tBTDdhSi9nWmkvaVo0L3FqcXpUZmhQVXE0?=
 =?utf-8?B?UjA0K2dJcEpBWXVyRXJheUYrYjViQ25UTkRva3J2VGFRK3BwK3RMc0JmM3RB?=
 =?utf-8?B?ZFdIdkh3Q2FzaVFLUHNZWHEzRnVkZDBpeVVDeUJKbUJPeXQzOFk0SnN6RytT?=
 =?utf-8?B?MnVoVStFU0UzRGVXYSs4bDhFUlgzSWUxQkl1K3Evb01zZWdGSjFYUVpGUmlM?=
 =?utf-8?B?cG54NmhsNE52SldKbHdLTW5GOG9qQVVlUEp6eHpDMTBUY0lWOTRDOXU0b2Ev?=
 =?utf-8?B?ak1sbC81aXVHMUxJVm54SEw4aGNzV095eThEN2ovbHV1RXNCT0VrTXR1MDYz?=
 =?utf-8?B?NmhkcWNEZWNmWWtvUHg4ck9PQnp1RFo3bERSbHkyV2tYNnBVT0RsZ1RXYkgy?=
 =?utf-8?B?aTBueFBvSG03cVl1VGViZ3ZPMm9NbUxFV3VxUm95eE1ab3BDaFU4VTRHaXJi?=
 =?utf-8?B?YzdBaHhzaFpPaXNkOGRFaUxuNVlmMmpUNWtlakFRUmN5cjUrNU80dkhYNzho?=
 =?utf-8?B?Vk42NjBoQnRHdHZrSkpvc2xNMWJCVjVxbmhVd3lBZWFic0JBY3BuQ29GVjdy?=
 =?utf-8?B?TDJEeDlET004dm03d3pZdXpqMVJFSm9NbmR5NUFDUStHTFN6dGg1UDNJVnNE?=
 =?utf-8?B?Nmc2SHFiSDF4YXJhTGM1OWh5VWU4UkVBbjRPbjJJcWVEcWpqbmtESHdPTjZL?=
 =?utf-8?B?L3ErMTNaUVRkV1hFeUgvZCtHOHhaNFN5TkwvbnBHL2dtYlYwK2hIWW9ITHV6?=
 =?utf-8?B?bm9tczFXQ2pCZnlvWnBRWW1nUWI1YSt5dURpdHBiRmxaa2s2RVgyMGJFOWNo?=
 =?utf-8?B?M1lZaWhCeDBpVWtSTXViTE90WWF2K3IzanR4NGJiOURyT1NpOEdiaXkwc1VM?=
 =?utf-8?B?eUZjajc2ckNpbEY4cTFVZ3BFT1RWU1d2ZEkxeVpBaEFucVkzZnFYU0hTZVRE?=
 =?utf-8?Q?JdGY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB5PR02MB10213.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a0efe2-1161-43ad-d3e3-08db467bd422
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 17:29:45.6737
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZtJYxbQC5kPn9E0H0u7AJyIG8vHL6Ec/SDoMvgc4E2DTYUISltF3BRrjlRHmrFtE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR02MB7958
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Apr 2023 17:29:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102200

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+IE9uIEJlaGFsZiBPZiBab2x0YW4gQm9zem9ybWVueWkNCj4gU2VudDogZGVuIDkg
bWFycyAyMDIzIDA5OjExDQo+IFRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZw0KPiBDYzogWm9sdMOhbiBCw7ZzesO2cm3DqW55aSA8emJvc3pvckBnbWFpbC5jb20+
DQo+IFN1YmplY3Q6IFtvZV0gW21ldGEtb2VdW1BBVENIIDMvM10gbWV0YS1vZS9jb25mL2xheWVy
LmNvbmY6IEFkZCBQUkVGRVJSRURfW1JdUFJPVklERVJfdmlydHVhbC9vcGVuY2wtaWNkDQo+IA0K
PiBTZWxlY3Qgb3BlbmNsLWljZC1sb2FkZXIgYXMgdGhlIHByZWZlcnJlZCBwcm92aWRlciBmb3Ig
Ym90aA0KPiBidWlsZCBhbmQgcnVudGltZS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFpvbHTDoW4g
QsO2c3rDtnJtw6lueWkgPHpib3N6b3JAZ21haWwuY29tPg0KPiAtLS0NCj4gIG1ldGEtb2UvY29u
Zi9sYXllci5jb25mIHwgMiArKw0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0K
PiANCj4gZGlmZiAtLWdpdCBhL21ldGEtb2UvY29uZi9sYXllci5jb25mIGIvbWV0YS1vZS9jb25m
L2xheWVyLmNvbmYNCj4gaW5kZXggYTFmNTA4NzllLi5hZWUxZmE3ODYgMTAwNjQ0DQo+IC0tLSBh
L21ldGEtb2UvY29uZi9sYXllci5jb25mDQo+ICsrKyBiL21ldGEtb2UvY29uZi9sYXllci5jb25m
DQo+IEBAIC01MCw2ICs1MCw4IEBAIFBSRUZFUlJFRF9SUFJPVklERVJfbGliZGV2bWFwcGVyID0g
Imx2bTIiDQo+ICBQUkVGRVJSRURfUFJPVklERVJfYW5kcm9pZC10b29scy1jb25mID89ICJhbmRy
b2lkLXRvb2xzLWNvbmYiDQo+ICAjIENvbmZpZ3VyZXMgd2hldGhlciBjb3JldXRpbHMgb3IgdXV0
aWxzLWNvcmV1dGlscyBpcyB1c2VkLg0KPiAgUFJFRkVSUkVEX1BST1ZJREVSX2NvcmV1dGlscyA9
ICJjb3JldXRpbHMiDQo+ICtQUkVGRVJSRURfUFJPVklERVJfdmlydHVhbC9vcGVuY2wtaWNkID89
ICJvcGVuY2wtaWNkLWxvYWRlciINCj4gK1BSRUZFUlJFRF9SUFJPVklERVJfdmlydHVhbC9vcGVu
Y2wtaWNkID89ICJvcGVuY2wtaWNkLWxvYWRlciINCg0KVGhlcmUgYXJlIG5vIHJ1bnRpbWUgZGVw
ZW5kZW5jaWVzIG9uIHZpcnR1YWwvb3BlbmNsLWljZCBpbiBtZXRhLW9wZW5lbWJlZGRlZC4gDQpS
dW50aW1lIGRlcGVuZGVuY2llcyBvbiB2aXJ0dWFsLy4uLiBhcmUgYWxzbyBjb25zaWRlcmVkIHdy
b25nIGFzIHRoZXkgDQpkbyBub3Qgd29yayBhcyBleHBlY3RlZCAodGhleSBvbmx5IHdvcmsgYXMg
bG9uZyBhcyB5b3UgZG8gbm90IHRyeSB0byANCmNyZWF0ZSBhIHBhY2thZ2UgZmVlZCBBRkFJVUks
IHdoaWNoIGlzIHdoeSBPRS1Db3JlIHVzZXMgVklSVFVBTC1SVU5USU1FXy4uLg0KaW5zdGVhZCku
IFNvIHdoeSBkbyB5b3UgbmVlZCB0byBzZXQgUFJFRkVSUkVEX1JQUk9WSURFUl92aXJ0dWFsL29w
ZW5jbC1pY2QgDQooYW5kIGFkZCB0aGUgY29ycmVzcG9uZGluZyBSUFJPVklERVM6JHtQTn0gdG8g
b2NsLWljZCBhbmQgb3BlbmNsLWljZC1sb2FkZXIpPw0KDQo+IA0KPiAgU0lHR0VOX0VYQ0xVREVS
RUNJUEVTX0FCSVNBRkUgKz0gIiBcDQo+ICAgIGZic2V0LW1vZGVzIFwNCj4gLS0NCj4gMi4zOS4y
DQoNCi8vUGV0ZXINCg0K

