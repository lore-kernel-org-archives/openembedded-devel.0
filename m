Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 137CA731BC
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Sep 2016 02:52:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u892qUI6027078
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 8 Sep 2016 19:52:30 -0700
Received: from ALA-MBB.corp.ad.wrs.com ([169.254.1.206]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Thu, 8 Sep 2016 19:52:29 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Asselstine, Mark" <Mark.Asselstine@windriver.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] waf-samba.bbclass: Append
	PACKAGECONFIG_CONFARGS to EXTRA_OECONF
Thread-Index: AQHSCazIjI9p9aeLXUCH72fJxaqh/6BwWc5ggAAKVJCAABKjQA==
Date: Fri, 9 Sep 2016 02:52:29 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA0131074BD7@ALA-MBB.corp.ad.wrs.com>
References: <20160908051048.15948-1-jackie.huang@windriver.com>
	<20160908084015.GA2636@jama>
	<1B858668EC6A94408DCA5225FDFA85AA0131074A68@ALA-MBB.corp.ad.wrs.com>
	<CAMKF1soPS9-=t0dpSnxeOdSTPR4NR5xoKckB4RC-boZ4wy1GtA@mail.gmail.com>
	<CAPuovEJymWQrgqGKUVcrXx2C4HM-KCNpN3UUehFqPkM3byzwAA@mail.gmail.com>
In-Reply-To: <CAPuovEJymWQrgqGKUVcrXx2C4HM-KCNpN3UUehFqPkM3byzwAA@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.137]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] waf-samba.bbclass: Append PACKAGECONFIG_CONFARGS to EXTRA_OECONF
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
X-List-Received-Date: Fri, 09 Sep 2016 02:52:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYXNzZWxzbUBnbWFpbC5j
b20gW21haWx0bzphc3NlbHNtQGdtYWlsLmNvbV0gT24gQmVoYWxmIE9mIE1hcmsgQXNzZWxzdGlu
ZQ0KPiBTZW50OiBGcmlkYXksIFNlcHRlbWJlciAwOSwgMjAxNiA5OjQ1IEFNDQo+IFRvOiBvcGVu
ZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzsgSHVhbmcsIEppZSAoSmFja2ll
KQ0KPiBTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtQQVRDSF0gd2FmLXNhbWJh
LmJiY2xhc3M6IEFwcGVuZA0KPiBQQUNLQUdFQ09ORklHX0NPTkZBUkdTIHRvIEVYVFJBX09FQ09O
Rg0KPiANCj4gQWdyZWVkLiBJIHdhcyBsb29raW5nIGF0IHRoaXMgdG9kYXkgYXMgd2VsbCBhbmQg
aWYgd2UgZ28gdGhlDQo+IEVYVFJBX09FQ09ORiByb3V0ZSBpdCBzaG91bGQgYmUgZG9uZSBpbiB0
aGUgcGFja2FnZSByZWNpcGUuDQo+IEFkZGl0aW9uYWxseSBKYWNraWUgSSB3YXMgZ29pbmcgdG8g
cmVzdHJpY3QgdGhlIGJsYWNrbGlzdCB0byBBUk0gYmFzZWQNCj4gb24gdGhlIGJ1aWxkIGZhaWx1
cmUgcmVwb3J0DQo+IChodHRwOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5vcmcvRXJyb3JzL0RldGFp
bHMvODEwMDQvKS4NCj4gDQo+IENvdWxkIHlvdSBpbmNsdWRlIGEgcGF0Y2ggZm9yIHRoaXMsIHNv
bWV0aGluZyBsaWtlOg0KDQpJdCdzIEluY2x1ZGVkIGluIHYyIHdoaWNoIGlzIGp1c3Qgc2VudC4N
Cg0KVGhhbmtzLA0KSmFja2llDQoNCj4gDQo+IC1QTkJMQUNLTElTVFtzYW1iYV0gPz0gIkJST0tF
TjogZmFpbHMgdG8gYnVpbGQgd2l0aCBuZXcgYmludXRpbHMtMi4yNyINCj4gK0JMQUNLTElTVF9S
RUFTT04gPz0gIiINCj4gK0JMQUNLTElTVF9SRUFTT05fYXJtID0gIkJST0tFTjogZmFpbHMgdG8g
YnVpbGQgd2l0aCBuZXcgYmludXRpbHMtMi4yNyINCj4gK1BOQkxBQ0tMSVNUW3NhbWJhXSA/PSAi
JHtCTEFDS0xJU1RfUkVBU09OfSINCj4gDQo+IE9yIGlmIHlvdSB3YW50IEkgd2lsbCBzZW5kIHNv
bWV0aGluZyBvdXQgaW4gdGhlIG1vcm5pbmcuDQo+IA0KPiBNYXJrDQo+IA0KPiBPbiBUaHUsIFNl
cCA4LCAyMDE2IGF0IDk6MjUgUE0sIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdyb3Rl
Og0KPiA+IE9uIFRodSwgU2VwIDgsIDIwMTYgYXQgNjoxOCBQTSwgSHVhbmcsIEppZSAoSmFja2ll
KQ0KPiA+IDxKYWNraWUuSHVhbmdAd2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4+DQo+ID4+DQo+
ID4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4gRnJvbTogb3BlbmVtYmVkZGVk
LWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRl
ZC1kZXZlbC0NCj4gPj4+IGJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxm
IE9mIE1hcnRpbiBKYW5zYQ0KPiA+Pj4gU2VudDogVGh1cnNkYXksIFNlcHRlbWJlciAwOCwgMjAx
NiA0OjQwIFBNDQo+ID4+PiBUbzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmcNCj4gPj4+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW5ldHdvcmtpbmddW1BBVENIXSB3
YWYtc2FtYmEuYmJjbGFzczogQXBwZW5kDQo+ID4+PiBQQUNLQUdFQ09ORklHX0NPTkZBUkdTIHRv
IEVYVFJBX09FQ09ORg0KPiA+Pj4NCj4gPj4+IE9uIFRodSwgU2VwIDA4LCAyMDE2IGF0IDAxOjEw
OjQ4UE0gKzA4MDAsIGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tIHdyb3RlOg0KPiA+Pj4gPiBG
cm9tOiBKYWNraWUgSHVhbmcgPGphY2tpZS5odWFuZ0B3aW5kcml2ZXIuY29tPg0KPiA+Pj4gPg0K
PiA+Pj4gPiBBcHBlbmQgUEFDS0FHRUNPTkZJR19DT05GQVJHUyB0byBFWFRSQV9PRUNPTkYgZm9y
IHdhZi1zYW1iYS5iYmNsYXNzDQo+ID4+PiA+IGJlY2F1c2UgdGhlIFBBQ0tBR0VDT05GSUcgd2ls
bCBub3QgYmUgaGFuZGxlZCBmb3IgYWxsIHJlY2lwZXMgYWZ0ZXINCj4gPj4+ID4gdGhlIGZvbGxv
d2luZyBjb21taXQgaW4gb2UtY29yZToNCj4gPj4+ID4NCj4gPj4+ID4gY29tbWl0IGM5OGZiNWY1
MTI5ZTcxODI5ZmZhYjQ0NDliM2QyODA4MmJjOTVhYjQNCj4gPj4+ID4gQXV0aG9yOiBNYXJ0aW4g
SmFuc2EgPG1hcnRpbi5qYW5zYUBnbWFpbC5jb20+DQo+ID4+PiA+IERhdGU6ICAgVHVlIEF1ZyAz
MCAxNjoxOTo1OCAyMDE2ICswMjAwDQo+ID4+PiA+DQo+ID4+PiA+ICAgICBiYXNlLCBhdXRvdG9v
bHM6IEFwcGVuZCBQQUNLQUdFQ09ORklHX0NPTkZBUkdTIHRvIEVYVFJBX09FQ09ORiBvbmx5IGlu
DQo+ID4+PiBhdXRvdG9vbHMuYmJjbGFzcw0KPiA+Pj4gPg0KPiA+Pj4gPiAgICAgKiByZWNpcGVz
IHdoaWNoIGRvbid0IGluaGVyaXQgYXV0b3Rvb2xzIG9yIGNtYWtlIGJiY2xhc3MgYW5kIHdhbnQg
dG8NCj4gPj4+ID4gICAgICAgdXNlIHRoZSBjb25maWd1cmUgb3B0aW9ucyBmcm9tIFBBQ0tBR0VD
T05GSUcgbmVlZCB0byBoYW5kbGUNCj4gPj4+ID4gICAgICAgUEFDS0FHRUNPTkZJR19DT05GQVJH
UyB0aGVtc2VsdmVzLg0KPiA+Pj4gPg0KPiA+Pj4gPiAgICAgU2lnbmVkLW9mZi1ieTogTWFydGlu
IEphbnNhIDxNYXJ0aW4uSmFuc2FAZ21haWwuY29tPg0KPiA+Pj4gPiAgICAgU2lnbmVkLW9mZi1i
eTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+DQo+
ID4+PiA+DQo+ID4+PiA+IFNpZ25lZC1vZmYtYnk6IEphY2tpZSBIdWFuZyA8amFja2llLmh1YW5n
QHdpbmRyaXZlci5jb20+DQo+ID4+PiA+IC0tLQ0KPiA+Pj4gPiAgbWV0YS1uZXR3b3JraW5nL2Ns
YXNzZXMvd2FmLXNhbWJhLmJiY2xhc3MgfCAyICsrDQo+ID4+PiA+ICAxIGZpbGUgY2hhbmdlZCwg
MiBpbnNlcnRpb25zKCspDQo+ID4+PiA+DQo+ID4+PiA+IGRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvY2xhc3Nlcy93YWYtc2FtYmEuYmJjbGFzcyBiL21ldGEtbmV0d29ya2luZy9jbGFzc2Vz
L3dhZi0NCj4gPj4+IHNhbWJhLmJiY2xhc3MNCj4gPj4+ID4gaW5kZXggNzcyYmM3NS4uYTU4Y2Ey
YyAxMDA2NDQNCj4gPj4+ID4gLS0tIGEvbWV0YS1uZXR3b3JraW5nL2NsYXNzZXMvd2FmLXNhbWJh
LmJiY2xhc3MNCj4gPj4+ID4gKysrIGIvbWV0YS1uZXR3b3JraW5nL2NsYXNzZXMvd2FmLXNhbWJh
LmJiY2xhc3MNCj4gPj4+ID4gQEAgLTIwLDYgKzIwLDggQEAgQ09ORklHVVJFT1BUUyA9ICIgLS1w
cmVmaXg9JHtwcmVmaXh9IFwNCj4gPj4+ID4gICAgICAgICAgICAgICAgICAgIC0tbWFuZGlyPSR7
bWFuZGlyfSBcDQo+ID4+PiA+ICAgICAgICAgICAgICAgICAgIg0KPiA+Pj4gPg0KPiA+Pj4gPiAr
RVhUUkFfT0VDT05GX2FwcGVuZCA9ICIgJHtQQUNLQUdFQ09ORklHX0NPTkZBUkdTfSINCj4gPj4+
DQo+ID4+PiBDYW5ub3Qgd2UgYXBwZW5kIGl0IHRvIENPTkZJR1VSRU9QVFMgYW5kIHJlbW92ZSBF
WFRSQV9PRUNPTkYgZnJvbSB0aGlzDQo+ID4+PiBiYmNsYXNzIGNvbXBsZXRlbHk/DQo+ID4+DQo+
ID4+IFllcywgd2UgY2FuLCBidXQgd2h5IGRvIHdlIG5lZWQgdG8gcmVtb3ZlIEVYVFJBX09FQ09O
RiBmcm9tIHRoaXMgYmJjbGFzcw0KPiA+PiBjb21wbGV0ZWx5PyBJcyBpdCBnb2luZyB0byBiZSBk
ZXByZWNhdGVkPw0KPiA+Pg0KPiA+PiBBbmQgSSBzZWUgdGhhdCBFWFRSQV9PRUNPTkYgIGlzIHVz
ZWQgaW4gc2V2ZXJhbCByZWNpcGVzIHRoYXQgaW5oZXJpdCB3YWYtc2FtYmEsDQo+ID4+IElmIGl0
J3MgcmVtb3ZlIGZyb20gdGhlIGJiY2xhc3MsIGl0J3Mgc2hvdWxkIGFsc28gYmUgcmVtb3ZlZCBm
cm9tIHRob3NlIHJlY2lwZXMsIHJpZ2h0Pw0KPiA+Pg0KPiA+DQo+ID4gRVhUUkFfT0VDT05GIGlz
IHVzdWFsbHkga2VwdCBmb3IgcmVjaXBlIG5hbWVzcGFjZS4NCj4gPg0KPiA+PiBUaGFua3MsDQo+
ID4+IEphY2tpZQ0KPiA+Pg0KPiA+Pj4NCj4gPj4+ID4gKw0KPiA+Pj4gPiAgIyBUaHJlZSBtZXRo
b2RzIGZvciB3YWYgY3Jvc3MgY29tcGlsZToNCj4gPj4+ID4gICMgMS4gYW5zd2VyczoNCj4gPj4+
ID4gICMgICAgT25seSAtLWNyb3NzLWFuc3dlcnMgLSB0cnkgdGhlIGNyb3NzLWFuc3dlcnMgZmls
ZSwgYW5kIGlmDQo+ID4+PiA+IC0tDQo+ID4+PiA+IDIuNy40DQo+ID4+PiA+DQo+ID4+PiA+IC0t
DQo+ID4+PiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQo+ID4+PiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gPj4+ID4gT3BlbmVt
YmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPj4+ID4gaHR0cDovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4g
Pj4+DQo+ID4+PiAtLQ0KPiA+Pj4gTWFydGluICdKYU1hJyBKYW5zYSAgICAgamFiYmVyOiBNYXJ0
aW4uSmFuc2FAZ21haWwuY29tDQo+ID4+IC0tDQo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fDQo+ID4+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5n
IGxpc3QNCj4gPj4gT3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4g
Pj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1i
ZWRkZWQtZGV2ZWwNCj4gPiAtLQ0KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+ID4gT3BlbmVtYmVkZGVkLWRldmVsIG1haWxpbmcgbGlzdA0KPiA+
IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+ID4gaHR0cDovL2xp
c3RzLm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwN
Cg==

