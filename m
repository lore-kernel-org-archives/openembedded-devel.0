Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6043F71B57
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Mar 2017 10:01:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id E06EA18159;
	Fri,  3 Mar 2017 11:01:51 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id te-g3qq19rnN; Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id A65C81808C;
	Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 93FA71A073;
	Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88FEB1A072;
	Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by thoth.se.axis.com (Postfix) with ESMTP id 7D45E7A9;
	Fri,  3 Mar 2017 11:01:50 +0100 (CET)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1210.3;
	Fri, 3 Mar 2017 11:01:50 +0100
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1210.000; Fri, 3 Mar 2017 11:01:50 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>, =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?=
	<schnitzeltony@googlemail.com>
Thread-Topic: [oe] [PATCH] Make use of the new bb.utils.filter() function
Thread-Index: AQHSkrGqV9kUOL9SJ02Fk/ddqs1s2qGAeQUAgAF9h4CAAOlR0A==
Date: Fri, 3 Mar 2017 10:01:50 +0000
Message-ID: <a6cb55b05ed7466bba2ddfca90518e85@XBOX02.axis.com>
References: <20170301173049.1177-1-pkj@axis.com>
	<CALbNGRR3DKMiSBnW+=WrWJVHqUzN5FKNoDh=4Na9s1NCnE1ysg@mail.gmail.com>
	<CA+chaQemN9j4vEXqfV4gtSLKvNdsTyjWyHbsqDhGPnSSBn71kA@mail.gmail.com>
In-Reply-To: <CA+chaQemN9j4vEXqfV4gtSLKvNdsTyjWyHbsqDhGPnSSBn71kA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] Make use of the new bb.utils.filter() function
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
X-List-Received-Date: Fri, 03 Mar 2017 10:01:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IFttYWlsdG86b3BlbmVtYmVkZGVkLWRl
dmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZ10gT24gQmVoYWxmIE9mDQo+IE1hcnRp
biBKYW5zYQ0KPiBTZW50OiBkZW4gMiBtYXJzIDIwMTcgMjE6NDkNCj4gVG86IEFuZHJlYXMgTcO8
bGxlcg0KPiBDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc7IFBl
dGVyIEtqZWxsZXJzdGVkdA0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0hdIE1ha2UgdXNlIG9m
IHRoZSBuZXcgYmIudXRpbHMuZmlsdGVyKCkNCj4gZnVuY3Rpb24NCj4gDQo+IEkgYWdyZWUgd2l0
aCBBbmRyZWFzLCBidXQgSSdtIG5vdCBvcHBvc2VkIHRvIHRoaXMgc28gc3Ryb25nbHkuDQo+IA0K
PiBFc3BlY2lhbGx5IGFzIHNpbWlsYXIgcGF0Y2ggZm9yIG9lLWNvcmUgKGNoYW5naW5nIDgxIGZp
bGVzKSB3YXMgYWxyZWFkeQ0KPiBtZXJnZWQuIFNpbWlsYXJseSB0aGUgZ2V0VmFyIGNsZWFudXAg
cmVjZW50bHkgd2lsbCBhbHNvIGNhdXNlIHNvbWUNCj4gaGVhZGFjaGVzIHdoZW4gY2hlcnJ5LXBp
Y2tpbmcuIFVuZm9ydHVuYXRlbHkgbXkgInNhZmUiIChhcyBpdCB3b24ndA0KPiBicmVhayB0aGUg
YnVpbGQpIHdoaXRlc3BhY2UgY2xlYW51cCB3b24ndCBldmVyIGdldCBtZXJnZWQgdG8gb2UtY29y
ZSwgDQo+IGJlY2F1c2UgaXQncyAidG9vIGludHJ1c2l2ZSIgOi8uDQoNCkJlaW5nIGEgYmlnIGZh
biBvZiB3aGl0ZXNwYWNlcyBjbGVhbnVwcyBJIGNhbiB1bmRlcnN0YW5kIHlvdXIgDQpmcnVzdHJh
dGlvbi4uLg0KDQo+IFNvbWVvbmUgZWxzZSB3aXRoIGFub3RoZXIgb3Bpbmlvbj8NCj4gDQo+IE9u
IFdlZCwgTWFyIDEsIDIwMTcgYXQgMTE6MDIgUE0sIEFuZHJlYXMgTcO8bGxlciA8DQo+IHNjaG5p
dHplbHRvbnlAZ29vZ2xlbWFpbC5jb20+IHdyb3RlOg0KPiANCj4gPiBPbiBXZWQsIE1hciAxLCAy
MDE3IGF0IDY6MzAgUE0sIFBldGVyIEtqZWxsZXJzdGVkdA0KPiA+IDxwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+IHdyb3RlOg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0ZXIgS2plbGxlcnN0
ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQo+ID4NCj4gPiBUQkg6IEkgZG9uJ3Qg
bGlrZSB0aGlzIHBhdGNoOg0KPiA+DQo+ID4gKiBJdCBjb21iaW5lcyB0aGluZ3Mgd2hpY2ggZG8g
bm90IHNoYXJlIHNhbWUgbGFiZWxzIGJ5IGRlc2lnbi4gTmFtaW5nDQo+ID4gICBwYWNrYWdlLWNv
bmZpZ3Mgd2l0aCBzYW1lIGxhYmVsIGFzIGRpc3Ryby1mZWF0dXJlIGlzIGEgbmljZSB0byBoYXZl
DQo+ID4gICBidXQgbm90IGEgZGVzaWduIHJ1bGUuDQo+ID4gKiBUbyBtZSBvbGQgc3R5bGUgZXhw
bGFpbnMgYmV0dGVyIHdoYXQncyBnb2luZyBvbg0KDQpJIGd1ZXNzIHRoYXQgaXMgYSBtYXR0ZXIg
b2Ygbm90IGJlaW5nIHVzZWQgdG8gdGhlIG5ldyBmdW5jdGlvbi4gSSBsaWtlIA0KdGhlIGZhY3Qg
dGhhdCBpbiBtYW55IGNhc2VzIHRoZSBQQUNLQUdFQ09ORklHIGRlZmluaXRpb24gcmVkdWNlcyB0
byBhcyANCnNpbmdsZSBjYWxsIHRvIGJiLnV0aWxzLmZpbHRlcigpLg0KDQo+ID4gKiBIZWF2eS1n
b3ppbGxhLXBhdGNoZXMgdGVuZCB0byBjYXVzZSBoZWFkYWNoZXMgd2hlbiBjaGVycnktcGlja2lu
Zw0KPiA+ICAgdG8gb2xkZXIgcmVsZWFzZSBicmFuY2hlcy4gQW5kIHllcyBJIGtub3cgd2UgaGFk
IHRoZXNlIHBhdGNoZXMgaW4gDQo+ID4gICB0aGUgcGFzdCBhbmQgbm9ib2R5IGNvbXBsYWluZWQu
DQoNCldlbGwsIEkgY2FuIHNwbGl0IGluIGluIDkxIGluZGl2aWR1YWwgcGF0Y2hlcywgaWYgdGhh
dCBpcyBwcmVmZXJyZWQuLi4NCg0KPiA+IEFuZHJlYXMNCg0KRm9yIHRoZSByZWNvcmQsIGhlcmUg
aXMgdGhlIHNlZCBleHByZXNzaW9uIEkgdXNlZCB0byBzd2l0Y2ggdG8gdGhlIA0KZmlsdGVyIGZ1
bmN0aW9uOg0KDQpzZWQgLXJpIC1lICdzL2JiLnV0aWxzLmNvbnRhaW5zXChccyooLikoW14iJ1wn
J10qKVwxLFxzKiguKShbXiInXCcnXSopXDMsXHMqKC4pXDRcNSxccyooLilcNi9iYi51dGlscy5m
aWx0ZXIoXDFcMlwxLCBcM1w0XDMvZycgKiovKiguKQ0KDQooSXQgdXNlcyBaU0ggc3ludGF4IHRv
IGZpbmQgYWxsIGZpbGVzLCB3aGljaCBtZWFucyBiYXNoIHVzZXJzIHdvdWxkIA0KaGF2ZSB0byBj
aGFuZ2UgaXQgdG8gdXNlIGZpbmQgaW5zdGVhZC4pDQoNCi8vUGV0ZXINCg0K

