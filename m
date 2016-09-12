Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 433D9762B4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Sep 2016 01:35:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u8C1ZciR021879
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 11 Sep 2016 18:35:38 -0700
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.175]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Sun, 11 Sep 2016 18:35:37 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "Joe MacDonald (Joe_MacDonald@mentor.com)" <Joe_MacDonald@mentor.com>,
	"Asselstine, Mark" <Mark.Asselstine@windriver.com>,
	=?utf-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@googlemail.com>
Thread-Topic: [oe] [PATCH 5/5] samba: fix build by linking with bfd instead
	of gold
Thread-Index: AQHSDCTYxhzkDV9t9keeb86dimcOjKB1EbwA
Date: Mon, 12 Sep 2016 01:35:36 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A2BDD11@ALA-MBA.corp.ad.wrs.com>
References: <1473020112-25797-1-git-send-email-schnitzeltony@googlemail.com>
	<1473020112-25797-5-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRQ_gPdw6O53fVeX5gUnpppM7GreKxy2Q02iovJukV_YCQ@mail.gmail.com>
In-Reply-To: <CALbNGRQ_gPdw6O53fVeX5gUnpppM7GreKxy2Q02iovJukV_YCQ@mail.gmail.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.131]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 5/5] samba: fix build by linking with bfd instead	of gold
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
X-List-Received-Date: Mon, 12 Sep 2016 01:35:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBbbWFpbHRvOm9wZW5lbWJlZGRlZC1k
ZXZlbC0NCj4gYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnXSBPbiBCZWhhbGYgT2YgQW5k
cmVhcyBNw7xsbGVyDQo+IFNlbnQ6IFN1bmRheSwgU2VwdGVtYmVyIDExLCAyMDE2IDg6MDYgUE0N
Cj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFN1Ympl
Y3Q6IFJlOiBbb2VdIFtQQVRDSCA1LzVdIHNhbWJhOiBmaXggYnVpbGQgYnkgbGlua2luZyB3aXRo
IGJmZCBpbnN0ZWFkIG9mIGdvbGQNCj4gDQo+IE9uIFN1biwgU2VwIDQsIDIwMTYgYXQgMTA6MTUg
UE0sIEFuZHJlYXMgTcO8bGxlcg0KPiA8c2Nobml0emVsdG9ueUBnb29nbGVtYWlsLmNvbT4gd3Jv
dGU6DQo+ID4gVXNlIHRoaXMgd29ya2Fyb3VuZCBhcyBsb25nIGFzIHRoZXJlIGlzIG5vIGJldHRl
ciAodXBzdHJlYW0pIGZpeA0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogQW5kcmVhcyBNw7xsbGVy
IDxzY2huaXR6ZWx0b255QGdvb2dsZW1haWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBtZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1jb25uZWN0aXZpdHkvc2FtYmEvc2FtYmFfNC40LjUuYmIgfCAyICstDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1i
YS9zYW1iYV80LjQuNS5iYiBiL21ldGEtDQo+IG5ldHdvcmtpbmcvcmVjaXBlcy1jb25uZWN0aXZp
dHkvc2FtYmEvc2FtYmFfNC40LjUuYmINCj4gPiBpbmRleCBlMzVkNTI3Li4zMjA1YzVkIDEwMDY0
NA0KPiA+IC0tLSBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rpdml0eS9zYW1iYS9z
YW1iYV80LjQuNS5iYg0KPiA+ICsrKyBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLWNvbm5lY3Rp
dml0eS9zYW1iYS9zYW1iYV80LjQuNS5iYg0KPiA+IEBAIC04OCw3ICs4OCw3IEBAIEVYVFJBX09F
Q09ORiArPSAiLS1lbmFibGUtZmhzIFwNCj4gPiAgICAgICAgICAgICAgICAgICINCj4gPiAgRElT
QUJMRV9TVEFUSUMgPSAiIg0KPiA+DQo+ID4gLUxERkxBR1MgKz0gIi1XbCwteixyZWxybywteixu
b3ciDQo+ID4gK0xERkxBR1MgKz0gIi1XbCwteixyZWxybywteixub3cgJHtAYmIudXRpbHMuY29u
dGFpbnMoJ0RJU1RST19GRUFUVVJFUycsICdsZC1pcy1nb2xkJywgJyAtZnVzZS0NCj4gbGQ9YmZk
ICcsICcnLCBkKX0iDQo+ID4NCj4gPiAgZG9faW5zdGFsbF9hcHBlbmQoKSB7DQo+ID4gICAgICBp
ZiAke0BiYi51dGlscy5jb250YWlucygnUEFDS0FHRUNPTkZJRycsICdzeXN0ZW1kJywgJ3RydWUn
LCAnZmFsc2UnLCBkKX07IHRoZW4NCj4gPiAtLQ0KPiA+IDIuNS41DQo+ID4NCj4gMS4gVGhpcyBk
aWQgbm90IG1ha2UgaXQgaW50byBtYXN0ZXIgYnV0IGlzIHN0aWxsIGluIG1hc3Rlci1uZXh0Lg0K
PiAyLiBKYWNraWUgSHVhbmcgaGFzIHNlbnQgYSBwYXRjaCBvbmx5IGJsYWNrbGlzdGluZyBvbiBh
cm0gWzFdID0+IHNlZW1zDQo+IG9ubHkgYXJtIGhhcyB0aGlzIGJ1Zw0KPiANCj4gWzFdIGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL3BpcGVybWFpbC9vcGVuZW1iZWRkZWQtZGV2ZWwvMjAx
Ni1TZXB0ZW1iZXIvMTA5MDM2Lmh0bWwNCg0KUGxlYXNlIHNlZSBteSByZXBseSBvbiB0aGlzOg0K
aHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvcGlwZXJtYWlsL29wZW5lbWJlZGRlZC1kZXZl
bC8yMDE2LVNlcHRlbWJlci8xMDkwNzEuaHRtbA0KDQo+IA0KPiA9PiBJIHdvdWxkIGxpa2UgdG8g
c2VuZCBhIHBhdGNoIGNoYW5naW5nIHRvIGJmZCBsaW5rZXIgb25seSBvbiBhcm0uDQoNCkkgYWdy
ZWUgaWYgaXQncyBjb25maXJtZWQgb25seSBhcm0gaGFzIHRoaXMgaXNzdWUuDQoNClRoYW5rcywN
CkphY2tpZQ0KDQo+IEFnYWluc3Qgd2hpY2ggYnJhbmNoIHNoYWxsIEkgY3JlYXRlIHRoaXMgcGF0
Y2g/DQo+IA0KPiBBbmRyZWFzDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg==

