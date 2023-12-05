Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB08BC10DC3
	for <webhook@archiver.kernel.org>; Tue,  5 Dec 2023 07:53:28 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web10.95456.1701762806760372949
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Dec 2023 23:53:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=hQWa3OeD;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=mhLjxTo3;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 29F24C0007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1701762803; bh=ydFrVVvoGcn9GcJbSTWjxTUYhvt/Ax6UOISiLeuLNLU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=hQWa3OeDv3eYKFiPYJ/0UX9fxT4yzLM0KeOmrBDW9GnAbsn5OhuR8BRBQHIyUy9vF
	 ve7YCOEBcsFD1+GhI2Ch6HcOXbse7Qa/fPJKNT2Tx85bajtN4khukQcnz/jRhAX5hK
	 r+OiqUs5mlmnKpMLOigXlZ94yBWhwTY5fTTr5GM0XE7Gc62OkCQOj9AgwYWPFFF4T7
	 ZCCm75J3ttC6V1fDemcJjyNjpsAHNckMs8wmun1GV83uPSju4fliDmNblwfAm07Di5
	 3gAv96XFPAjIq86dq3ELs66YnqGVARSq4WOv3fMop+Upa4U/uW2JfNDgc2UAMESHe3
	 4zIkkt37L4rCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1701762803; bh=ydFrVVvoGcn9GcJbSTWjxTUYhvt/Ax6UOISiLeuLNLU=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=mhLjxTo3qlLMnUbgRfOwlEwdRJTfnYzXYEVw79rarrhBmU5cKgAOGb8OvsmXCZLQM
	 dUMBEJtcjCVzDhQWrdXbUJLikYwVw6z4wG5anBwS5BlaDKKOJddSyNK2j+UIQF5Suo
	 /94TdvGPXhIh7djIAsjOwLSMTarwLFqfv8lN1QQUIZqXPB1Oc+4cB8tiHVPJ4rZ5Bi
	 UNA2hY8JO3M25P5dZbqiRwCSK59VLggwHeqpbb+IVybxoxOyfdadn1RcI+CrVypVxj
	 UiEGduRPWY23H9aQSqaVm4J9Q3kV3R8B7YZTMMRmz5gtKH3YVHxjbBVuN85pPuflUR
	 oPtDpfzzAaSmg==
From: Petr Chernikov <p.chernikov@yadro.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Thread-Topic: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag
 from extra_oecmake
Thread-Index: AQHaJr1vhdbQLgX/GE+KdFaQLxpSeLCZC70AgAB7ugCAALdU8A==
Date: Tue, 5 Dec 2023 07:53:22 +0000
Message-ID: <1cd20d51c6d841a69a77c80904b03372@yadro.com>
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
 <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
 <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
Accept-Language: ru-RU, en-US
Content-Language: ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 Dec 2023 07:53:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107221

SGkgUmFqLCANClRoYW5rIHlvdSBmb3IgZmVlZGJhY2shDQoNCkkndmUganVzdCB0ZXN0ZWQgY29t
cGlsYXRpb24gdmlhIGNsYW5nIHVzaW5nIG1ldGEtY2xhbmcgbGF5ZXIgLSB0aGlzIGlzIGZpbmUN
Cg0KSSd2ZSBhbHNvIHRlc3RlZCBgbmF0aXZlYCBjb21waWxhdGlvbiB1c2luZyBib3RoIGdjYyBh
bmQgY2xhbmcsIHRoaXMgaXMgT0sgdG9vLg0KQnV0IEkgZG9uJ3Qga25vdyBob3cgdG8gdGVzdCBu
YXRpdmVzZGssIGFueSB0aG91Z2h0cyBhYm91dCB0aGlzIGtpbmQgb2YgY29tcGlsYXRpb24/DQoN
Cg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+IA0KU2VudDogVHVlc2RheSwgRGVjZW1iZXIgNSwgMjAyMyAxOjQ2IEFNDQpUbzog
UGV0ciBDaGVybmlrb3YgPHAuY2hlcm5pa292QHlhZHJvLmNvbT4NCkNjOiBvcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gW1BBVENIXSBh
YnNlaWwtY3BwOiByZW1vdmUgLURjbWFrZV9jeHhfc3RhbmRhcmQ9MTQgZmxhZyBmcm9tIGV4dHJh
X29lY21ha2UNCg0KwqvQktC90LjQvNCw0L3QuNC1ISDQlNCw0L3QvdC+0LUg0L/QuNGB0YzQvNC+
INC+0YIg0LLQvdC10YjQvdC10LPQviDQsNC00YDQtdGB0LDRgtCwIcK7DQoNCmhlcmUgaXMgYSBw
cm9ibGVtIHdoaWNoIG1pZ2h0IGJlIHJlbGF0ZWQgdG8gdGhpcyBjaGFuZ2UNCg0KaHR0cHM6Ly9l
cnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0YWlscy83NDUxNjUvDQoNCk9uIE1vbiwg
RGVjIDQsIDIwMjMgYXQgNzoyMuKAr0FNIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IHdy
b3RlOg0KPg0KPg0KPg0KPiBPbiBNb24sIERlYyA0LCAyMDIzIGF0IDY6MjPigK9BTSBQZXRyIENo
ZXJuaWtvdiA8cC5jaGVybmlrb3ZAeWFkcm8uY29tPiB3cm90ZToNCj4+DQo+PiBPbGQgdmVyc2lv
bnMgb2YgYWJzZWlsLWNwcCBjb3VsZCBub3QgYmUgY29tcGlsZWQgdXNpbmcgQysrIFN0YW5kYXJk
IDE3Lg0KPj4gRm9yIG5vdyB0aGlzIGNtYWtlIGZsYWcgaXMgbm90IG5lZWRlZC4NCj4NCj4NCj4g
Q2FuIHlvdSBjaGVjayBpZiB0aGlzIHdvcmtzIHdpdGggY2xhbmcgY29tcGlsZXIgYXMgd2VsbA0K
Pj4NCj4+DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogUGV0ciBDaGVybmlrb3YgPHAuY2hlcm5pa292
QHlhZHJvLmNvbT4NCj4+DQo+PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L2Fic2VpbC1jcHAvYWJzZWlsLWNwcF9naXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
YWJzZWlsLWNwcC9hYnNlaWwtY3BwX2dpdC5iYg0KPj4gaW5kZXggZjg0N2ViZjE1Li40NzA1YjZm
OGMgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvYWJzZWlsLWNwcC9h
YnNlaWwtY3BwX2dpdC5iYg0KPj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2Vp
bC1jcHAvYWJzZWlsLWNwcF9naXQuYmINCj4+IEBAIC0yNiw3ICsyNiw2IEBAIGluaGVyaXQgY21h
a2UNCj4+DQo+PiAgRVhUUkFfT0VDTUFLRSA9ICItREJVSUxEX1NIQVJFRF9MSUJTPU9OIFwNCj4+
ICAgICAgICAgICAgICAgICAgIC1EQlVJTERfVEVTVElORz1PRkYgICAgXA0KPj4gLSAgICAgICAg
ICAgICAgICAgLURDTUFLRV9DWFhfU1RBTkRBUkQ9MTQgXA0KPj4gICAgICAgICAgICAgICAgICAg
LURBQlNMX0VOQUJMRV9JTlNUQUxMPU9OIFwNCj4+ICAgICAgICAgICAgICAgICAgIg0KPj4NCj4+
DQo+PiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPj4gTGlua3M6IFlvdSByZWNlaXZlIGFsbCBt
ZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+PiBWaWV3L1JlcGx5IE9ubGluZSAoIzEwNzIw
NCk6IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9t
ZXNzYWdlLzEwNzIwNA0KPj4gTXV0ZSBUaGlzIFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvbXQvMTAyOTcwOTMwLzE5OTc5MTQNCj4+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRk
ZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPj4gVW5zdWJzY3JpYmU6IGh0
dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YiBb
cmFqLmtoZW1AZ21haWwuY29tXQ0KPj4gLT0tPS09LT0tPS09LT0tPS09LT0tPS0NCj4+DQo=

