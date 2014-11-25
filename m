Return-Path: <biannm@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 885F972275
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 09:31:33 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="43943434"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 Nov 2014 17:28:19 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id sAP9VH82000319
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Nov 2014 17:31:17 +0800
Received: from G08CNEXMBPEKD02.g08.fujitsu.local ([10.167.33.84]) by
	G08CNEXCHPEKD03.g08.fujitsu.local ([10.167.33.85]) with mapi id
	14.03.0181.006; Tue, 25 Nov 2014 17:31:36 +0800
From: "Bian, Naimeng" <biannm@cn.fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH 4/6] [meta-oe] printproto: Port printproto from
	openembedded
Thread-Index: AQHQB9HM7aPcMFuGmUa0IW+aYsNqOpxwfhuggAAMVACAAIg3wA==
Date: Tue, 25 Nov 2014 09:31:38 +0000
Message-ID: <30DC4EDFD798C94083F3E083754532CC73DDB832@G08CNEXMBPEKD02.g08.fujitsu.local>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-5-git-send-email-biannm@cn.fujitsu.com>
	<CAJTo0LZeC5tu7fQcKFEhuHVvPjx77V8NwOwTtP9GqFVKDvtG-A@mail.gmail.com>
	<30DC4EDFD798C94083F3E083754532CC73DDB681@G08CNEXMBPEKD02.g08.fujitsu.local>
	<CAJTo0LZ86QxZgsugoDPuJ-Rjim3V03eFGE0=7VSoJkj6eKi_9g@mail.gmail.com>
In-Reply-To: <CAJTo0LZ86QxZgsugoDPuJ-Rjim3V03eFGE0=7VSoJkj6eKi_9g@mail.gmail.com>
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
X-List-Received-Date: Tue, 25 Nov 2014 09:31:36 -0000
Content-Language: zh-CN
Content-Type: text/plain; charset="shift_jis"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IEJ1cnRv
biwgUm9zcw0KPiBTZW50OiBUdWVzZGF5LCBOb3ZlbWJlciAyNSwgMjAxNCA1OjE0IFBNDQo+IFRv
OiBPRS1kZXZlbA0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0ggNC82XSBbbWV0YS1vZV0gcHJp
bnRwcm90bzogUG9ydCBwcmludHByb3RvIGZyb20NCj4gb3BlbmVtYmVkZGVkDQo+IA0KPiBPbiAy
NSBOb3ZlbWJlciAyMDE0IGF0IDAxOjE0LCBCaWFuLCBOYWltZW5nIDxiaWFubm1AY24uZnVqaXRz
dS5jb20+IHdyb3RlOg0KPiANCj4gPiBObywgSSBkb24ndCBoYXZlIGEgcGxhbiB0byBhZGQgZXZl
cnkgcmVjaXBlIGZyb20gb2UtY2xhc3NpYy4gXl9eIFRoZXNlDQo+ID4gcmVjaXBlcyBqdXN0IHVz
ZWQgYnkgb3VyIGRpc3Ryby4NCj4gPiBJdCBsb29rcyBsaWtlIHdlIHNob3VsZCBjaGFuZ2Ugb3Vy
IHNwZWNpZmljYXRpb24uDQo+ID4NCj4gDQo+IFNlbmRpbmcgaW4gcmVjaXBlcyB0aGF0IHlvdSd2
ZSBwb3J0ZWQgaXMgbXVjaCBhcHByZWNpYXRlZCwgYnV0IGluIHRoaXMgY2FzZQ0KPiBhcyBhbGwg
b2YgdGhlc2UgWCByZWNpcGVzIGFyZSBub3QgdXNlZCBieSBhbnkgWCBzZXJ2ZXJzIGF2YWlsYWJs
ZSBpbiBPRSB5b3UNCj4ga2VlcCB0aGVtIGxvY2FsbHkuICBJbiBhbGwgaG9uZXN0eSB1bmxlc3Mg
eW91J3JlIHVzaW5nIGFuIG9sZCBYIHNlcnZlciB0aGV5J3JlDQo+IG5vdCBuZWVkZWQgYW55d2F5
Lg0KPiANCg0KVGhhbmtzIGZvciB5b3VyIGV4cGxhbmF0aW9uLiBJdCdzIGhlbHBmdWwgdG8gbWUg
DQpJIHdpbGwgY29uc2lkZXIgd2hldGhlciBpdCdzIG5lY2Vzc2FyeSB0byB1cGdyYWQgb3VyIFgg
aW1wbGVtZW50YXRpb24uDQoNClJlZ2FyZHMNCiBCaWFuDQoNCj4gUm9zcw0KPiAtLQ0KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRk
ZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnDQo+IGh0dHA6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vb3BlbmVtYmVkZGVkLWRldmVsDQo=

