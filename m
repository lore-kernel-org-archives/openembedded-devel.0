Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9FEC433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 16:33:15 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.8018.1636129993831028462
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 05 Nov 2021 09:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=B1p1XjYk;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1636129994;
  x=1667665994;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=27Fx7WGWTn/2hhDsVVW4lFUEHsjEXMhCiDB4sEwSoKc=;
  b=B1p1XjYkNSNb4LLrIchYmZkd/HxLPAuGNO9Kc44GFWNbRcu1z5hjaxtA
   WVt7qegMQcKD+eyonAKzXrjXC8mGVNlpI6TeVtvwBjC4b7EJ+scvtEnlb
   ArRF6KXIQ3upgh9tKRdtNc8owqGQW7Az6m0KnmQigDG+2fY8YzTwa7TUc
   JGyVP0dSCNqb4bWBW0fJC8RhfENYjlAHSsNnjprMloHhc0o96MMcmBpNs
   doNB3jXB8bgeJ3JG8bqD88nCRUrX1wxhNN8/CeYGHNF2iSaEc2rBEu2xR
   DUJ3C7lkrGpan67NjmXxHXySDynUw4UwXzsg0UPhUAWTvUJJ6rzm7AuIQ
   g==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: "maxims@google.com" <maxims@google.com>, openembedded-devel
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] Depending on other package's features.
Thread-Topic: [oe] Depending on other package's features.
Thread-Index: AQHX0cVbAp3twD2eyUK3dFW4ebK1SKv1HoYg
Date: Fri, 5 Nov 2021 16:33:11 +0000
Message-ID: <654beb1c1d7d449e8d6f85e427b8f2eb@axis.com>
References: 
 <CAFR_W8rkzPWCN9BnHXjZTcu58sBYfGOsOAT-rUyUKB1_k59X4w@mail.gmail.com>
In-Reply-To: 
 <CAFR_W8rkzPWCN9BnHXjZTcu58sBYfGOsOAT-rUyUKB1_k59X4w@mail.gmail.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 05 Nov 2021 16:33:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93845

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTWF4aW0gU2xveWtvIHZpYQ0KPiBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IFNlbnQ6IGRlbiA0IG5vdmVtYmVyIDIwMjEgMjI6NDYNCj4gVG86IG9w
ZW5lbWJlZGRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5v
cmc+DQo+IFN1YmplY3Q6IFtvZV0gRGVwZW5kaW5nIG9uIG90aGVyIHBhY2thZ2UncyBmZWF0dXJl
cy4NCg0KVGhpcyB0eXBlIG9mIHF1ZXN0aW9ucyBiZWxvbmcgb24gdGhlIA0Kb3BlbmVtYmVkZGVk
LWNvcmVAbGlzdHMub3BlbmVtYmVkZGVkLm9yZyBtYWlsaW5nIGxpc3QuDQoNCj4gDQo+IEhpIGFs
bCwNCj4gDQo+IFRoZSByZWNpcGUgdGhhdCBJJ20gd29ya2luZyBvbiBmb3Igb3VyIHN5c3RlbSAo
bGV0J3MgY2FsbCBpdCBBKSBoYXMgYQ0KPiBkZXBlbmRlbmN5IG9uIGEgY2VydGFpbiBmZWF0dXJl
IGJlaW5nIGVuYWJsZWQgaW4gYW5vdGhlciBwYWNrYWdlIChCKS4NCj4gU28sIGluIEIsIHdlIGhh
dmU6DQo+IA0KPiBQQUNLQUdFQ09ORklHW25pY2UtZmVhdHVyZV0gPSAiLi4uIg0KPiANCj4gYW5k
IG15IHJlY2lwZSAob3IgcmF0aGVyLCB0aGUgdG9vbCBidWlsdCBieSB0aGUgcmVjaXBlKSwgbmVl
ZHMgdGhhdA0KPiBmZWF0dXJlIHRvIGJlIGVuYWJsZWQgdG8gd29yayBwcm9wZXJseS4gV2hhdCdz
IHdvcnNlLCBpcyB0aGF0IHRoaXMgaXMNCj4gYSBydW50aW1lIGRlcGVuZGVuY3ksIHNvIGlmIHNv
bWVib2R5IGp1c3QgZm9yZ2V0cyB0byBlbmFibGUgdGhhdA0KPiBmZWF0dXJlLCB0aGUgaW1hZ2Ug
d2lsbCBidWlsZCBmaW5lLCBidXQgdGhlIHRvb2wgd29uJ3Qgd29yay4gSSB3b3VsZA0KPiBsaWtl
IHRoaXMgdG8gYmUgYSBidWlsZCB0aW1lIGZhaWx1cmUuDQo+IA0KPiBNeSBwbGFuIGlzIHRvIGNo
YW5nZSByZWNpcGUgQSwgc28gdGhhdCBpZiB0aGUgIm5pY2UtZmVhdHVyZSIgaXMNCj4gZW5hYmxl
ZCwgdGhlIHBhY2thZ2Ugd2lsbCBQUk9WSURFIG9uZSBtb3JlIHRoaW5nOg0KPiANCj4gUFJPVklE
RVMgKz0gIiR7UE59LW5pY2UtZmVhdHVyZSINCj4gDQo+IGFuZCBpbiBteSByZWNpcGUgQiwgSSds
bCBkZWNsYXJlIHRoaXMgYXMgYSBkZXBlbmRlbmN5Og0KPiANCj4gUkRFUEVORFM6JHtQTn0gKz0g
InBhY2thZ2UtYS1uaWNlLWZlYXR1cmUiLg0KDQpQUk9WSURFUyBpcyBmb3IgYnVpbGQgdGltZSBw
cm92aWRlcyBvZiByZWNpcGVzLiBZb3UgY2Fubm90IG1peCBpdCANCndpdGggUkRFUEVORFM6JHtQ
Tn0gd2hpY2ggaXMgZm9yIHJ1bnRpbWUgZGVwZW5kZW5jaWVzIGZvciBwYWNrYWdlcy4NCg0KPiBO
b3cgSSdtIHRoaW5raW5nLCB3b3VsZG4ndCBpdCBiZSBncmVhdCBpZiBwYWNrYWdlIEEgY291bGQg
c3BlY2lmeQ0KPiBleHRyYSBQUk9WSURFUyB3aGVuIHRoZSBmZWF0dXJlIGlzIGNvbmZpZ3VyZWQ/
IFRoaXMgd291bGQgYmUgc2ltaWxhcg0KPiB0byB0aGUgd2F5IGl0J3MgZG9uZSBmb3IgcGFja2Fn
ZSdzIFI/REVQRU5EUzoNCj4gDQo+ICAgICAgUEFDS0FHRUNPTkZJRyA/Pz0gImYxIGYyIGYzIC4u
LiINCj4gICAgICBQQUNLQUdFQ09ORklHW2YxXSA9ICJcDQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLS13aXRoLWYxLCBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgLS13aXRob3V0
LWYxLCBcDQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgYnVpbGQtZGVwcy1mb3ItZjEsIFwN
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICBydW50aW1lLWRlcHMtZm9yLWYxLCBcDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcnVudGltZS1yZWNvbW1lbmRzLWZvci1mMSwgXA0KPiAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHBhY2thZ2Vjb25maWctY29uZmxpY3RzLWZvci1mMSBc
DQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJvdmlkZXMtZm9yLWYxIFwNCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAiDQo+IA0KPiBUaGUgbGFzdCBsaW5lIHdvdWxkIGJlIGEgY2hh
bmdlIHRoYXQgSSBwcm9wb3NlLiBJdCBsb29rcyBsaWtlIGl0IHdvdWxkDQo+IGJlIHJlbGF0aXZl
bHkgZWFzeSB0byBpbXBsZW1lbnQgdGhpcyBpbiBiYXNlLmJiY2xhc3MNCj4gDQo+IFdoYXQgZG8g
eW91IHRoaW5rPyBXaWxsIHRoaXMgYmUgdXNlZnVsPyBEaWQgSSBtaXNzIGFuIGV4aXN0aW5nIHdh
eSB0byBkbw0KPiB0aGlzPw0KPiANCj4gVGhhbmtzLA0KPiANCj4gLS0NCj4gLU1TDQoNCi8vUGV0
ZXINCg0K

