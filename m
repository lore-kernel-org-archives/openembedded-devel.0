Return-Path: <Yongxin.Liu@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A9F087BE9A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2019 02:59:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0A2xCBU028770
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Jan 2019 18:59:22 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.249]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0415.000;
	Wed, 9 Jan 2019 18:59:02 -0800
From: "Liu, Yongxin" <Yongxin.Liu@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Thread-Topic: [oe] [meta-oe][PATCH] pmdk: fix install error
Thread-Index: AQHUp+NdqedK10XUdkWS1jyEzHU+hqWnPC6A//98DbCAAQ2tAIAANvSA///QZzA=
Date: Thu, 10 Jan 2019 02:59:01 +0000
Message-ID: <597B109EC20B76429F71A8A97770610D129EDC9A@ALA-MBD.corp.ad.wrs.com>
References: <20190109061610.34471-1-yongxin.liu@windriver.com>
	<CAMKF1sqOE7M7boiRNyqjtNXJxECv5bZyD2SG9MXNOwet+8ZJdw@mail.gmail.com>
	<597B109EC20B76429F71A8A97770610D129ED63A@ALA-MBD.corp.ad.wrs.com>
	<CAMKF1sqJTnt6R7F83Ta47Kbt3nzyeT5-LYYgyzAm2Q6y0j2Gaw@mail.gmail.com>
	<83702874-3257-4d80-e601-6e2f770eeb42@windriver.com>
In-Reply-To: <83702874-3257-4d80-e601-6e2f770eeb42@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.171]
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] pmdk: fix install error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Jan 2019 02:59:48 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IE1hY0xlb2QsIFJhbmR5DQo+
IFNlbnQ6IFRodXJzZGF5LCBKYW51YXJ5IDEwLCAyMDE5IDA1OjM2DQo+IFRvOiBMaXUsIFlvbmd4
aW4NCj4gQ2M6IEtoZW0gUmFqOyBvcGVuZW1iZWRlZC1kZXZlbA0KPiBTdWJqZWN0OiBSZTogW29l
XSBbbWV0YS1vZV1bUEFUQ0hdIHBtZGs6IGZpeCBpbnN0YWxsIGVycm9yDQo+IA0KPiBPbiAxLzkv
MTkgMToxOCBQTSwgS2hlbSBSYWogd3JvdGU6DQo+ID4gT24gV2VkLCBKYW4gOSwgMjAxOSBhdCAy
OjE3IEFNIExpdSwgWW9uZ3hpbiA8WW9uZ3hpbi5MaXVAd2luZHJpdmVyLmNvbT4NCj4gd3JvdGU6
DQo+ID4+DQo+ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogS2hl
bSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFpbC5jb21dDQo+ID4+PiBTZW50OiBXZWRuZXNkYXks
IEphbnVhcnkgOSwgMjAxOSAxODowNg0KPiA+Pj4gVG86IExpdSwgWW9uZ3hpbg0KPiA+Pj4gQ2M6
IG9wZW5lbWJlZGVkLWRldmVsDQo+ID4+PiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bUEFU
Q0hdIHBtZGs6IGZpeCBpbnN0YWxsIGVycm9yDQo+ID4+Pg0KPiA+Pj4gT24gVHVlLCBKYW4gOCwg
MjAxOSBhdCAxMDoyMCBQTSBZb25neGluIExpdQ0KPiA8eW9uZ3hpbi5saXVAd2luZHJpdmVyLmNv
bT4NCj4gPj4+IHdyb3RlOg0KPiA+Pj4+DQo+ID4+Pj4gLnNvIGZpbGVzIGFyZSBub3QgZ2VuZXJh
dGVkIGluIHVzci9sb2NhbC9saWIvIGJ1dCBpbiB1c3IvbG9jYWwvbGliNjQuDQo+ID4+Pj4NCj4g
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25neGluIExpdSA8eW9uZ3hpbi5saXVAd2luZHJpdmVyLmNv
bT4NCj4gPj4+PiAtLS0NCj4gPj4+PiAgIG1ldGEtb2UvcmVjaXBlcy1leHRlbmRlZC9wbWRrL3Bt
ZGtfMS40LjIuYmIgfCA0ICsrLS0NCj4gPj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvbWV0YS1v
ZS9yZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1ka18xLjQuMi5iYiBiL21ldGEtDQo+ID4+PiBvZS9y
ZWNpcGVzLWV4dGVuZGVkL3BtZGsvcG1ka18xLjQuMi5iYg0KPiA+Pj4+IGluZGV4IDNkYTIyYTk3
MC4uYWYyMjI5ZjFjIDEwMDY0NA0KPiA+Pj4+IC0tLSBhL21ldGEtb2UvcmVjaXBlcy1leHRlbmRl
ZC9wbWRrL3BtZGtfMS40LjIuYmINCj4gPj4+PiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZXh0ZW5k
ZWQvcG1kay9wbWRrXzEuNC4yLmJiDQo+ID4+Pj4gQEAgLTQzLDEwICs0MywxMCBAQCBkb19pbnN0
YWxsKCkgew0KPiA+Pj4+ICAgICAgICAgIG12ICR7RH0vdXNyL2xvY2FsL2Jpbi9kYXhpbyAke0R9
JHtiaW5kaXJ9Lw0KPiA+Pj4+DQo+ID4+Pj4gICAgICAgICAgaW5zdGFsbCAtZCAke0R9JHtsaWJk
aXJ9DQo+ID4+Pj4gLSAgICAgICBtdiAke0R9L3Vzci9sb2NhbC9saWIvKnNvKiAke0R9JHtsaWJk
aXJ9Lw0KPiA+Pj4+ICsgICAgICAgbXYgJHtEfS91c3IvbG9jYWwvbGliNjQvKnNvKiAke0R9JHts
aWJkaXJ9Lw0KPiA+Pj4+DQo+ID4+Pg0KPiA+Pj4gSSB3b25kZXIgaWYgdGhpcyBzaG91bGQgYmUg
dXNpbmcgL3Vzci9sb2NhbC8ke2Jhc2VfbGliZGlyfSBoZXJlDQo+ID4+DQo+ID4+IFNpbmNlICR7
YmFzZV9saWJkaXJ9IGlzICIvbGliNjQiLCBzaG91bGQgd2UgdXNlDQo+ICIvdXNyL2xvY2FsJHti
YXNlX2xpYmRpcn0iID8NCj4gPj4gT3IgaXQgaXMgZmluZSB0byBnbyB3aXRoICIvdXNyL2xvY2Fs
Ly9saWI2NCIgYWZ0ZXIgcGFyc2luZz8NCj4gPg0KPiA+IHVzaW5nIC91c3IvbG9jYWwke2Jhc2Vf
bGliZGlyfSBpcyBmaW5lDQo+IA0KPiBJdCdzIGEgbGl0dGxlIG9kZCB0aGF0IHRoZSBkZWZhdWx0
IHByZWZpeCBpcyAvdXNyL2xvY2FsIHJhdGhlcg0KPiB0aGFuIC91c3IgLiBJdCB3b3VsZCBtYWtl
IHNlbnNlIHRvIHN0YXJ0IHdpdGggL3Vzci9sb2NhbCBpbg0KPiBlYXJseSBkZXZlbG9wbWVudCBi
dXQgdGhlIGZpcnN0IGNvbW1pdCB0byBwbWRrIG9uIGdpdGh1YiB3YXMNCj4gaW4gMjAxNC4uLg0K
PiANCj4gSWYgdGhpcyBpcyBwYXJ0IG9mIHRoZSBzeXN0ZW0sIHVzZSAvdXNyLCBpZiBpdCdzIGEg
aGFjayBvcg0KPiBhbiBpbnN0YWxsIG93bmVkIGJ5IHRoZSBsb2NhbCBzeXN0ZW0gYWRtaW4sIHVz
ZSAvdXNyL2xvY2FsLg0KPiBBcyBwZXIsIGZvciBleGFtcGxlOg0KPiAgICBodHRwczovL3JlZnNw
ZWNzLmxpbnV4Zm91bmRhdGlvbi5vcmcvRkhTXzMuMC9maHMvY2gwNHMwOS5odG1sDQoNCkluIGNv
bmZpZ3VyZSBmaWxlIG9mIHBtZGssIEkgZmluZCB0aGUgZm9sbG93aW5nIHNlbnRlbmNlcy4NCg0K
ICAgIGlmIHRlc3QgIngkcHJlZml4IiA9ICJ4Tk9ORSIgOyB0aGVuIA0KICAgICAgcHJlZml4PSIv
dXNyL2xvY2FsIg0KICAgIGZpDQogICAgaWYgdGVzdCAieCRleGVjX3ByZWZpeCIgPSAieE5PTkUi
IDsgdGhlbiANCiAgICAgIGV4ZWNfcHJlZml4PSRwcmVmaXgNCiAgICBmaQ0KICAgIFBSRUZJWD0k
cHJlZml4DQoNClNvIGluIGJiIGZpbGUsIGV2ZW4gJHtwcmVmaXh9IGlzIC91c3IsICJvZV9ydW5t
YWtlIFBSRUZJWD0ke3ByZWZpeH0gREVTVERJUj0ke0R9IGluc3RhbGwiIA0KZG9lc24ndCBzZXQg
UFJFRklYIHRvIC91c3IgZm9yIHBtZGsgaW5zdGFsbGF0aW9uLg0KDQoib2VfcnVubWFrZSBwcmVm
aXg9L3VzciBERVNURElSPSR7RH0gaW5zdGFsbCIgd29ya3MuIA0KDQpJZiB5b3UgYXJlIE9LIHdp
dGggdGhpcyBjaGFuZ2UsIEkgd2lsbCBzZW5kIHBhdGNoIFYyLg0KDQoNClRoYW5rcywNCllvbmd4
aW4NCg0KDQo+IA0KPiAuLi9SYW5keQ0KPiANCj4gPg0KPiA+Pg0KPiA+Pg0KPiA+PiBUaGFua3Ms
DQo+ID4+IFlvbmd4aW4NCj4gPj4NCj4gPj4+PiAgICAgICAgICBpbnN0YWxsIC1kICR7RH0ke2xp
YmRpcn0vcGtnY29uZmlnDQo+ID4+Pj4gLSAgICAgICBtdiAke0R9L3Vzci9sb2NhbC9saWIvcGtn
Y29uZmlnLyoucGMNCj4gJHtEfSR7bGliZGlyfS9wa2djb25maWcvDQo+ID4+Pj4gKyAgICAgICBt
diAke0R9L3Vzci9sb2NhbC9saWI2NC9wa2djb25maWcvKi5wYw0KPiAke0R9JHtsaWJkaXJ9L3Br
Z2NvbmZpZy8NCj4gPj4+Pg0KPiA+Pj4+ICAgICAgICAgIGluc3RhbGwgLWQgJHtEfSR7aW5jbHVk
ZWRpcn0NCj4gPj4+PiAgICAgICAgICBtdiAke0R9L3Vzci9sb2NhbC9pbmNsdWRlLyogJHtEfSR7
aW5jbHVkZWRpcn0vDQo+ID4+Pj4gLS0NCj4gPj4+PiAyLjE0LjQNCj4gPj4+Pg0KPiA+Pj4+IC0t
DQo+ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18N
Cj4gPj4+PiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQo+ID4+Pj4gT3BlbmVtYmVk
ZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4+PiBodHRwOi8vbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KPiANCj4g
DQo+IC0tDQo+ICMgUmFuZHkgTWFjTGVvZA0KPiAjIFdpbmQgUml2ZXIgTGludXgNCg==

