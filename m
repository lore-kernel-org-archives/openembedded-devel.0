Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CA3E970660
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 01:14:24 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43920016"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2014 09:11:10 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAP1E7Ml001178
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:14:07 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Tue, 25 Nov 2014 09:14:26 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 4/6] [meta-oe] printproto: Port printproto from
	openembedded
Thread-Index: AQHQB9HM7aPcMFuGmUa0IW+aYsNqOpxwfhug
Date: Tue, 25 Nov 2014 01:14:26 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DDB681@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
	<CAJTo0LZeC5tu7fQcKFEhuHVvPjx77V8NwOwTtP9GqFVKDvtG-A@mail.gmail.com>
In-Reply-To: <CAJTo0LZeC5tu7fQcKFEhuHVvPjx77V8NwOwTtP9GqFVKDvtG-A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.167.226.31]
MIME-Version: 1.0
Subject: Re: [PATCH 4/6] [meta-oe] printproto: Port printproto from	openembedded
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
X-List-Received-Date: Tue, 25 Nov 2014 01:14:27 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IEJ1cnRv
biwgUm9zcw0KPiBTZW50OiBNb25kYXksIE5vdmVtYmVyIDI0LCAyMDE0IDY6MzEgUE0NCj4gVG86
IE9FLWRldmVsDQo+IFN1YmplY3Q6IFJlOiBbb2VdIFtQQVRDSCA0LzZdIFttZXRhLW9lXSBwcmlu
dHByb3RvOiBQb3J0IHByaW50cHJvdG8gZnJvbQ0KPiBvcGVuZW1iZWRkZWQNCj4gDQo+IE9uIDI0
IE5vdmVtYmVyIDIwMTQgYXQgMDY6NDUsIEJpYW4gTmFpbWVuZyA8Ymlhbm5tQGNuLmZ1aml0c3Uu
Y29tPiB3cm90ZToNCj4gDQo+ID4gIG1ldGEtb2UvcmVjaXBlcy1ncmFwaGljcy94b3JnLXByb3Rv
L3ByaW50cHJvdG9fMS4wLjUuYmIgfCAxNg0KPiA+ICsrKysrKysrKysrKysrKysNCj4gPg0KPiAN
Cj4gUmVhbGx5PyAgQXJlIHlvdSBqdXN0IHRyeWluZyB0byBhZGQgZXZlcnkgcmVjaXBlIGZyb20g
b2UtY2xhc3NpYyB0byBtZXRhLW9lLA0KPiBvciBpbiB0aGlzIGNhc2UgYXJlIHlvdSBhY3R1YWxs
eSB1c2luZyBYUHJpbnQ/ICBYUHJpbnQgd2FzIHJlbW92ZWQgZnJvbQ0KPiB4c2VydmVyIGluIDIw
MDggYmVjYXVzZSBpdCBkaWRuJ3QgYWN0dWFsbHkgd29ya1sxXSAtIHRoYXQncyAqc2l4KiB5ZWFy
cw0KPiBhZ28uICBtZXRhLW9lIGRvZXNuJ3QgbmVlZCBwb2ludGxlc3MgcmVjaXBlcyB0aGF0IGFy
ZSB1bm1haW50YWluZWQsIGFuZA0KPiBpZiB5b3UncmUgdXNpbmcgYW4gYW5jaWVudCBYIHNlcnZl
ciBhbmQgZW5hYmxlIFhQcmludCwgdGhlbiB5b3UgY2FuIGFsc28NCj4gY2FycnkgdGhlIFhQcmlu
dCBwcm90by9saWJzLg0KPiANCg0KTm8sIEkgZG9uJ3QgaGF2ZSBhIHBsYW4gdG8gYWRkIGV2ZXJ5
IHJlY2lwZSBmcm9tIG9lLWNsYXNzaWMuIF5fXg0KVGhlc2UgcmVjaXBlcyBqdXN0IHVzZWQgYnkg
b3VyIGRpc3Ryby4gDQpJdCBsb29rcyBsaWtlIHdlIHNob3VsZCBjaGFuZ2Ugb3VyIHNwZWNpZmlj
YXRpb24uDQoNClJlZ2FyZHMNCiBCaWFuDQoNCj4gUm9zcw0KPiANCj4gWzFdDQo+IGh0dHA6Ly9j
Z2l0LmZyZWVkZXNrdG9wLm9yZy94b3JnL3hzZXJ2ZXIvY29tbWl0Lz9pZD0xYzhiZDMxOGZiYWY2
NTg5MGUNCj4gZjE2ZmUyNmM3NmRkNWU2ZjE0ZGZkZQ0KPiAtLQ0KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFp
bGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+
IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVk
ZGVkLWRldmVsDQo=

