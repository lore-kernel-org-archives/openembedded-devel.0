Return-Path: <p.chernikov@yadro.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C492C4167B
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 11:01:37 +0000 (UTC)
Received: from mta-04.yadro.com (mta-04.yadro.com [89.207.88.248])
 by mx.groups.io with SMTP id smtpd.web11.28813.1701860492111266168
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Dec 2023 03:01:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yadro.com header.s=mta-04 header.b=DVTfORh5;
 dkim=pass header.i=@yadro.com header.s=mta-03 header.b=papA+WmA;
 spf=pass (domain: yadro.com, ip: 89.207.88.248, mailfrom: p.chernikov@yadro.com)
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-04.yadro.com 4F269C0015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-04;
	t=1701860487; bh=Fe1DPEb01bqMgELdiL4FXisKgCvh5eeZdJYs8AYPZqs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=DVTfORh5C/hSanKkmj13gSFVoOuZNCpZrZAGOAW7mJw6qV7CAD3BtKMR+jWN8zQt4
	 SQGzQH8uII4JpwmdjqLmwlTF8DdiWh/MQDTw8ciJw3FYJlJLQsKIKictv2h5vmAxQB
	 l2DfePHzxaEzyPq+NW64YpN6hdbHgGWb5kA6XX2bv/FRgGsrXMo1U4hLydK0mJPaQ5
	 nJOA2frbiudmk/m0nKieszNNDw9STGjZj26MgHPZlspA2RnEN/6d9FVE217OUMQhay
	 cF1YqUZuBccUiQK7eEDz/dVhgJ2NbhCDjX1ZSpVMCiZOpDO4LoxnTXrJKfPrJhkynT
	 zb3L/LOo7inkQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yadro.com; s=mta-03;
	t=1701860487; bh=Fe1DPEb01bqMgELdiL4FXisKgCvh5eeZdJYs8AYPZqs=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version:From;
	b=papA+WmAlL8U2vhvFHMMHZLfWTwekQuyqgnLeT4NqWFkKpyUviH7bRJr+cvX4XVtE
	 jn4RkX2zQ6v2M/Ob9khRCoBn+sZ/riYhVGuEEmyjlZHd0KmbHCwok9b7ygmraPkX0y
	 7ajXUUzOmj6OPqWUloRMmikzi3S4CVG/N/+8kCcq6/Eutm8Hs2xBDM1lBJRERVu6AV
	 PcvfsiFtyAtjUZ12RYLFqaCT3/vUfDXwnzRVqWZQ7tdbYJ2xq4f5LUYeEQRPKLMIX/
	 imeoGE5nU5aRuAoc+wyNqSEko3MjMEXxyxm3CXDrvWnGAb0HaI/v4Lf54yujHCGbx6
	 vwqLejtX6ZKhQ==
From: Petr Chernikov <p.chernikov@yadro.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag from
 extra_oecmake
Thread-Topic: [oe] [PATCH] abseil-cpp: remove -Dcmake_cxx_standard=14 flag
 from extra_oecmake
Thread-Index: AQHaJr1vhdbQLgX/GE+KdFaQLxpSeLCZC70AgAB7ugCAALdU8IAB2n7g
Date: Wed, 6 Dec 2023 11:01:26 +0000
Message-ID: <2474bdddf872480b8c776713d425c315@yadro.com>
References: <20231204141856.2977926-1-p.chernikov@yadro.com>
 <CAMKF1sqszUOsKDu42Z73AvLBMta4tauXCaCm_ZJbOa7UXVPUzg@mail.gmail.com>
 <CAMKF1sqf=jKN3tbeO9nn2Gc2dgLh8Ctaw=_BwaLVHoahAg_KpQ@mail.gmail.com>
 <1cd20d51c6d841a69a77c80904b03372@yadro.com>
In-Reply-To: <1cd20d51c6d841a69a77c80904b03372@yadro.com>
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
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Dec 2023 11:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107237

UmFqLCBpcyBteSB0ZXN0aW5nIGVub3VnaCB0byBhcHBseSBjaGFuZ2VzPw0KDQoNCi0tLS0tT3Jp
Z2luYWwgTWVzc2FnZS0tLS0tDQpGcm9tOiBQZXRyIENoZXJuaWtvdiANClNlbnQ6IFR1ZXNkYXks
IERlY2VtYmVyIDUsIDIwMjMgMTA6NTMgQU0NClRvOiAnS2hlbSBSYWonIDxyYWoua2hlbUBnbWFp
bC5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1
YmplY3Q6IFJFOiBbb2VdIFtQQVRDSF0gYWJzZWlsLWNwcDogcmVtb3ZlIC1EY21ha2VfY3h4X3N0
YW5kYXJkPTE0IGZsYWcgZnJvbSBleHRyYV9vZWNtYWtlDQoNCkhpIFJhaiwgDQpUaGFuayB5b3Ug
Zm9yIGZlZWRiYWNrIQ0KDQpJJ3ZlIGp1c3QgdGVzdGVkIGNvbXBpbGF0aW9uIHZpYSBjbGFuZyB1
c2luZyBtZXRhLWNsYW5nIGxheWVyIC0gdGhpcyBpcyBmaW5lDQoNCkkndmUgYWxzbyB0ZXN0ZWQg
YG5hdGl2ZWAgY29tcGlsYXRpb24gdXNpbmcgYm90aCBnY2MgYW5kIGNsYW5nLCB0aGlzIGlzIE9L
IHRvby4NCkJ1dCBJIGRvbid0IGtub3cgaG93IHRvIHRlc3QgbmF0aXZlc2RrLCBhbnkgdGhvdWdo
dHMgYWJvdXQgdGhpcyBraW5kIG9mIGNvbXBpbGF0aW9uPw0KDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiANClNlbnQ6IFR1
ZXNkYXksIERlY2VtYmVyIDUsIDIwMjMgMTo0NiBBTQ0KVG86IFBldHIgQ2hlcm5pa292IDxwLmNo
ZXJuaWtvdkB5YWRyby5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcNClN1YmplY3Q6IFJlOiBbb2VdIFtQQVRDSF0gYWJzZWlsLWNwcDogcmVtb3ZlIC1E
Y21ha2VfY3h4X3N0YW5kYXJkPTE0IGZsYWcgZnJvbSBleHRyYV9vZWNtYWtlDQoNCsKr0JLQvdC4
0LzQsNC90LjQtSEg0JTQsNC90L3QvtC1INC/0LjRgdGM0LzQviDQvtGCINCy0L3QtdGI0L3QtdCz
0L4g0LDQtNGA0LXRgdCw0YLQsCHCuw0KDQpoZXJlIGlzIGEgcHJvYmxlbSB3aGljaCBtaWdodCBi
ZSByZWxhdGVkIHRvIHRoaXMgY2hhbmdlDQoNCmh0dHBzOi8vZXJyb3JzLnlvY3RvcHJvamVjdC5v
cmcvRXJyb3JzL0RldGFpbHMvNzQ1MTY1Lw0KDQpPbiBNb24sIERlYyA0LCAyMDIzIGF0IDc6MjLi
gK9BTSBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4NCj4NCj4NCj4gT24g
TW9uLCBEZWMgNCwgMjAyMyBhdCA2OjIz4oCvQU0gUGV0ciBDaGVybmlrb3YgPHAuY2hlcm5pa292
QHlhZHJvLmNvbT4gd3JvdGU6DQo+Pg0KPj4gT2xkIHZlcnNpb25zIG9mIGFic2VpbC1jcHAgY291
bGQgbm90IGJlIGNvbXBpbGVkIHVzaW5nIEMrKyBTdGFuZGFyZCAxNy4NCj4+IEZvciBub3cgdGhp
cyBjbWFrZSBmbGFnIGlzIG5vdCBuZWVkZWQuDQo+DQo+DQo+IENhbiB5b3UgY2hlY2sgaWYgdGhp
cyB3b3JrcyB3aXRoIGNsYW5nIGNvbXBpbGVyIGFzIHdlbGwNCj4+DQo+Pg0KPj4NCj4+IFNpZ25l
ZC1vZmYtYnk6IFBldHIgQ2hlcm5pa292IDxwLmNoZXJuaWtvdkB5YWRyby5jb20+DQo+Pg0KPj4g
ZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1j
cHBfZ2l0LmJiIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJzZWlsLWNw
cF9naXQuYmINCj4+IGluZGV4IGY4NDdlYmYxNS4uNDcwNWI2ZjhjIDEwMDY0NA0KPj4gLS0tIGEv
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2Fic2VpbC1jcHAvYWJzZWlsLWNwcF9naXQuYmINCj4+
ICsrKyBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9hYnNlaWwtY3BwL2Fic2VpbC1jcHBfZ2l0
LmJiDQo+PiBAQCAtMjYsNyArMjYsNiBAQCBpbmhlcml0IGNtYWtlDQo+Pg0KPj4gIEVYVFJBX09F
Q01BS0UgPSAiLURCVUlMRF9TSEFSRURfTElCUz1PTiBcDQo+PiAgICAgICAgICAgICAgICAgICAt
REJVSUxEX1RFU1RJTkc9T0ZGICAgIFwNCj4+IC0gICAgICAgICAgICAgICAgIC1EQ01BS0VfQ1hY
X1NUQU5EQVJEPTE0IFwNCj4+ICAgICAgICAgICAgICAgICAgIC1EQUJTTF9FTkFCTEVfSU5TVEFM
TD1PTiBcDQo+PiAgICAgICAgICAgICAgICAgICINCj4+DQo+Pg0KPj4gLT0tPS09LT0tPS09LT0t
PS09LT0tPS0NCj4+IExpbmtzOiBZb3UgcmVjZWl2ZSBhbGwgbWVzc2FnZXMgc2VudCB0byB0aGlz
IGdyb3VwLg0KPj4gVmlldy9SZXBseSBPbmxpbmUgKCMxMDcyMDQpOiBodHRwczovL2xpc3RzLm9w
ZW5lbWJlZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvbWVzc2FnZS8xMDcyMDQNCj4+IE11
dGUgVGhpcyBUb3BpYzogaHR0cHM6Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL210LzEwMjk3MDkz
MC8xOTk3OTE0DQo+PiBHcm91cCBPd25lcjogb3BlbmVtYmVkZGVkLWRldmVsK293bmVyQGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcNCj4+IFVuc3Vic2NyaWJlOiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWIgW3Jhai5raGVtQGdtYWlsLmNvbV0N
Cj4+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+Pg0K

