Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 33CD371633
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Feb 2015 12:13:00 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="58144866"
Received: from localhost (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 24 Feb 2015 20:09:23 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t1OCC9b0002688;
	Tue, 24 Feb 2015 20:12:09 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD01.g08.fujitsu.local ([10.167.33.80]) with mapi id
	14.03.0181.006; Tue, 24 Feb 2015 20:13:07 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: Joe MacDonald <Joe_MacDonald@mentor.com>
Thread-Topic: [oe] [meta-networking][PATCH v2 2/2] postfix: fix bug of
	main.cf_2.0
Thread-Index: AQHQSb49PBRfnEbLt0yqa1ujgceyoZz+H+mAgAAErACAAZxWoA==
Date: Tue, 24 Feb 2015 12:13:03 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DF4332@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1424073156-18834-1-git-send-email-biannm@cn.fujitsu.com>
	<1424073156-18834-3-git-send-email-biannm@cn.fujitsu.com>
	<20150223191307.GA8949@mentor.com> <20150223192949.GB8949@mentor.com>
In-Reply-To: <20150223192949.GB8949@mentor.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH v2 2/2] postfix: fix bug of main.cf_2.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 Feb 2015 12:13:04 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

SGkgSm9lLA0KDQpTb3JyeSBmb3IgbXkgbGF0ZSByZXBseSAoVGhlIGxhc3Qgd2VlayB3YXMgQ2hp
bmVzZSBOZXcgWWVhciBeX14pLg0KQW5kIHRoYW5rcyBmb3IgeW91ciBjb25maXJtYXRpb24uDQoN
ClRoYW5rcw0KIEJpYW4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBK
b2UgTWFjRG9uYWxkIFttYWlsdG86Sm9lX01hY0RvbmFsZEBtZW50b3IuY29tXQ0KPiBTZW50OiBU
dWVzZGF5LCBGZWJydWFyeSAyNCwgMjAxNSAzOjMwIEFNDQo+IENjOiBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3
b3JraW5nXVtQQVRDSCB2MiAyLzJdIHBvc3RmaXg6IGZpeCBidWcgb2YNCj4gbWFpbi5jZl8yLjAN
Cj4gDQo+IFtSZTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtQQVRDSCB2MiAyLzJdIHBvc3RmaXg6
IGZpeCBidWcgb2YgbWFpbi5jZl8yLjBdIE9uDQo+IDE1LjAyLjIzIChNb24gMTQ6MTMpIEpvZSBN
YWNEb25hbGQgd3JvdGU6DQo+IA0KPiA+IEhpIEJpYW4sDQo+ID4NCj4gPiBJIG1lcmdlZCB0aGUg
b3RoZXIgcG9zdGZpeCBjaGFuZ2UsIGJ1dCB0aGlzIG9uZSBJJ20gbGVzcyBzdXJlIGFib3V0Lg0K
PiA+IElzIHRoaXMgYWN0dWFsbHkgaW5jb3JyZWN0PyAgVGhlIHN0YW5kYXJkIHBsYWNlIHRvIGlu
c3RhbGwgcG9zdGZpeCBpcw0KPiA+IGluIC91c3IvbGliZXhlYyBhbmQgdGhhdCBzZWVtcyB0byBi
ZSB3aGVyZSB3ZSBpbnN0YWxsIGl0IGFzIHdlbGwuDQo+IA0KPiBPa2F5LCBJJ3ZlIGp1c3QgY29u
ZmlybWVkIHRoYXQgdGhpcyBpcyB0aGUgY3VycmVudCBsb2NhdGlvbiBhZnRlciBhbGwsIEknbGwN
Cj4gbWVyZ2UgdGhpcyBhcyB3ZWxsLiAgVGhhbmtzLg0KPiANCj4gLUouDQo+IA0KPiA+DQo+ID4g
LUouDQo+ID4NCj4gPiBbW29lXSBbbWV0YS1uZXR3b3JraW5nXVtQQVRDSCB2MiAyLzJdIHBvc3Rm
aXg6IGZpeCBidWcgb2YgbWFpbi5jZl8yLjBdIE9uDQo+IDE1LjAyLjE2IChNb24gMTU6NTIpIEJp
YW4gTmFpbWVuZyB3cm90ZToNCj4gPg0KPiA+ID4gICR7ZXhlY19wcmVmaXh9L2xpYmV4ZWMvJHtQ
Tn0gPT4gJHtsaWJleGVjZGlyfQ0KPiA+ID4NCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJpYW4gTmFp
bWVuZyA8Ymlhbm5tQGNuLmZ1aml0c3UuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiAgbWV0YS1uZXR3
b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9wb3N0Zml4L2ZpbGVzL21haW4uY2ZfMi4wIHwgMiArLQ0K
PiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+
ID4NCj4gPiA+IGRpZmYgLS1naXQNCj4gPiA+IGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtZGFl
bW9ucy9wb3N0Zml4L2ZpbGVzL21haW4uY2ZfMi4wDQo+ID4gPiBiL21ldGEtbmV0d29ya2luZy9y
ZWNpcGVzLWRhZW1vbnMvcG9zdGZpeC9maWxlcy9tYWluLmNmXzIuMA0KPiA+ID4gaW5kZXggYmIz
MTQ1MS4uOWUxMDc3ZiAxMDA2NDQNCj4gPiA+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVz
LWRhZW1vbnMvcG9zdGZpeC9maWxlcy9tYWluLmNmXzIuMA0KPiA+ID4gKysrIGIvbWV0YS1uZXR3
b3JraW5nL3JlY2lwZXMtZGFlbW9ucy9wb3N0Zml4L2ZpbGVzL21haW4uY2ZfMi4wDQo+ID4gPiBA
QCAtMzAsNyArMzAsNyBAQCBxdWV1ZV9kaXJlY3RvcnkgPSAvdmFyL3Nwb29sL3Bvc3RmaXgNCj4g
PiA+IG1haWxfc3Bvb2xfZGlyZWN0b3J5ID0gL3Zhci9zcG9vbC9tYWlsICByZWFkbWVfZGlyZWN0
b3J5ID0gbm8NCj4gPiA+IGNvbW1hbmRfZGlyZWN0b3J5ID0gL3Vzci9zYmluIC1kYWVtb25fZGly
ZWN0b3J5ID0NCj4gPiA+IC91c3IvbGliZXhlYy9wb3N0Zml4DQo+ID4gPiArZGFlbW9uX2RpcmVj
dG9yeSA9IC91c3IvbGliL3Bvc3RmaXgNCj4gPiA+ICBtYWlsX293bmVyID0gcG9zdGZpeA0KPiA+
ID4gIHNldGdpZF9ncm91cCA9IHBvc3Rkcm9wDQo+ID4gPiAgdW5rbm93bl9sb2NhbF9yZWNpcGll
bnRfcmVqZWN0X2NvZGUgPSA0NTANCj4gPiA+IC0tDQo+ID4gPiAxLjkuMQ0KPiA+ID4NCj4gPiAt
LQ0KPiA+IC1Kb2UgTWFjRG9uYWxkLg0KPiA+IDp3cQ0KPiANCj4gDQo+IA0KPiAtLQ0KPiAtSm9l
IE1hY0RvbmFsZC4NCj4gOndxDQo=

