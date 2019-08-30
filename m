Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 690127F3A2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2019 04:07:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id C83DF18551;
	Fri, 30 Aug 2019 06:07:32 +0200 (CEST)
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id JnQXwG8k7Ilw; Fri, 30 Aug 2019 06:07:31 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id E224218527;
	Fri, 30 Aug 2019 06:07:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFCB01A0D3;
	Fri, 30 Aug 2019 06:07:30 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C42081A0D2;
	Fri, 30 Aug 2019 06:07:30 +0200 (CEST)
Received: from thoth.se.axis.com (unknown [10.0.2.173])
	by boulder02.se.axis.com (Postfix) with ESMTP;
	Fri, 30 Aug 2019 06:07:30 +0200 (CEST)
Received: from XBOX04.axis.com (xbox04.axis.com [10.0.5.18])
	by thoth.se.axis.com (Postfix) with ESMTP id B7D5D26B2;
	Fri, 30 Aug 2019 06:07:30 +0200 (CEST)
Received: from XBOX04.axis.com (10.0.5.18) by XBOX04.axis.com (10.0.5.18) with
	Microsoft SMTP Server (TLS) id 15.0.1395.4;
	Fri, 30 Aug 2019 06:07:30 +0200
Received: from XBOX04.axis.com ([fe80::210a:724b:68cb:a917]) by
	XBOX04.axis.com ([fe80::210a:724b:68cb:a917%22]) with mapi id
	15.00.1395.000; Fri, 30 Aug 2019 06:07:30 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Hongxu Jia <hongxu.jia@windriver.com>, "Alejandro Enedino Hernandez
	Samaniego" <alejandro.enedino.hernandez-samaniego@xilinx.com>,
	"raj.khem@gmail.com" <raj.khem@gmail.com>
Thread-Topic: [oe] [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
Thread-Index: AQHVXoKYfvJR0ztsRk6i0QCoDBxmUacSffGAgABJAoCAAD9REA==
Date: Fri, 30 Aug 2019 04:07:30 +0000
Message-ID: <0dce6aadbb574a01892cb847bada6523@XBOX04.axis.com>
References: <1566955456-20194-1-git-send-email-hongxu.jia@windriver.com>
	<1567094248-9489-1-git-send-email-hongxu.jia@windriver.com>
	<7246b4cb-1358-8afc-eb4c-a80788bead19@xilinx.com>
	<99b98099-6aa3-33c1-0168-6def305be825@windriver.com>
In-Reply-To: <99b98099-6aa3-33c1-0168-6def305be825@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH V3] cryptsetup: add libdevmapper to RDEPENDS
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
X-List-Received-Date: Fri, 30 Aug 2019 04:07:32 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwt
Ym91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIDxvcGVuZW1iZWRkZWQtDQo+IGRldmVsLWJv
dW5jZXNAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4gT24gQmVoYWxmIE9mIEhvbmd4dSBKaWENCj4g
U2VudDogZGVuIDMwIGF1Z3VzdGkgMjAxOSAwMzozMg0KPiBUbzogQWxlamFuZHJvIEVuZWRpbm8g
SGVybmFuZGV6IFNhbWFuaWVnbyA8YWxlamFuZHJvLmVuZWRpbm8uaGVybmFuZGV6LQ0KPiBzYW1h
bmllZ29AeGlsaW54LmNvbT47IHJhai5raGVtQGdtYWlsLmNvbQ0KPiBDYzogb3BlbmVtYmVkZGVk
LWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtvZV0gW1BBVENI
IFYzXSBjcnlwdHNldHVwOiBhZGQgbGliZGV2bWFwcGVyIHRvIFJERVBFTkRTDQo+IA0KPiBPbiA4
LzMwLzE5IDU6MTAgQU0sIEFsZWphbmRybyBFbmVkaW5vIEhlcm5hbmRleiBTYW1hbmllZ28gd3Jv
dGU6DQo+ID4NCj4gPiBIZXkgSG9uZ3h1LA0KPiA+DQo+ID4gT24gOC8yOS8xOSA4OjU3IEFNLCBI
b25neHUgSmlhIHdyb3RlOg0KPiA+PiBTaW5jZSBjb21taXQgW2xpYmRldm1hcHBlci9sdm0yOiBm
b3JjZSByZWNpcGUgbGliZGV2bWFwcGVyIHRvDQo+IHBvcHVsYXRlDQo+ID4+IHN5c3Jvb3Qgb25s
eV0gYXBwbGllZCwgaWYgcmVjaXBlIERFUEVORFMgb24gbGliZGV2bWFwcGVyLCB3ZSBoYXZlIHRv
DQo+ID4+IGFkZCBpdCB0byBwYWNrYWdlcyBSREVQRU5EUyB0byBmaXggW2ZpbGUtcmRlcHNdIFFB
IGlzc3VlDQo+ID4+DQo+ID4+IFNraXAgW2J1aWxkLWRlcHNdIGFuZCBbZmlsZS1yZGVwc10gUUEg
Y2hlY2tpbmcsIGFkZCBsdm0yIHRvIERFUEVORFMNCj4gd2lsbA0KPiA+PiB0cmlnZXIgY2lyY3Vs
YXIgZGVwZW5kZW5jaWVzLCB1c2UgcmVjaXBlIGxpYmRldm1hcHBlciB0byByZXBsYWNlLA0KPiA+
PiBpZ25vcmUgdGhlIFFBIGNoZWNraW5nIGlzIGZpbmUuDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYt
Ynk6IEhvbmd4dSBKaWE8aG9uZ3h1LmppYUB3aW5kcml2ZXIuY29tPg0KPiA+PiAtLS0NCj4gPj4g
ICBtZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2NyeXB0c2V0dXAvY3J5cHRzZXR1cF8yLjIuMC5iYiB8
IDYgKysrKysrDQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0K
PiA+PiBkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNpcGVzLWNyeXB0by9jcnlwdHNldHVwL2NyeXB0
c2V0dXBfMi4yLjAuYmINCj4gYi9tZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2NyeXB0c2V0dXAvY3J5
cHRzZXR1cF8yLjIuMC5iYg0KPiA+PiBpbmRleCA2ZWJmMWUyLi4xOTQ4NDJlIDEwMDY0NA0KPiA+
PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2NyeXB0c2V0dXAvY3J5cHRzZXR1cF8yLjIu
MC5iYg0KPiA+PiArKysgYi9tZXRhLW9lL3JlY2lwZXMtY3J5cHRvL2NyeXB0c2V0dXAvY3J5cHRz
ZXR1cF8yLjIuMC5iYg0KPiA+PiBAQCAtMTYsNiArMTYsMTAgQEAgREVQRU5EUyA9ICIgXA0KPiA+
PiAgICAgICB1dGlsLWxpbnV4IFwNCj4gPj4gICAiDQo+ID4+DQo+ID4+ICtSREVQRU5EU18ke1BO
fSA9ICIgXA0KPiA+PiArICAgIGxpYmRldm1hcHBlciBcDQo+ID4+ICsiDQo+ID4+ICsNCj4gPj4g
ICBTUkNfVVJJDQo+ID0iJHtLRVJORUxPUkdfTUlSUk9SfS9saW51eC91dGlscy8ke0JQTn0vdiR7
QGQuZ2V0VmFyKCdQVicpLnNwbGl0KCcuJylbDQo+IDBdfS4ke0BkLmdldFZhcignUFYnKS5zcGxp
dCgnLicpWzFdfS8ke0JQfS50YXIueHoiDQo+ID4+ICAgU1JDX1VSSVttZDVzdW1dID0gImY3ODE4
MDgyMDU2ZTViYzBiZTEyZTRjN2ZjMjAzNDVhIg0KPiA+PiAgIFNSQ19VUklbc2hhMjU2c3VtXSA9
DQo+ICI5ZDhmOGNhYzI4MzZhMTYyM2MwNzViNWNiYTk2MDMyMjcxZGM4MWEyOGIyYWEyN2ZiZDgz
MzFlODMxNDE2YmIxIg0KPiA+PiBAQCAtODUsNCArODksNiBAQCBFWFRSQV9PRUNPTkYgKz0gIi0t
ZGlzYWJsZS1saWJhcmdvbjIiDQo+ID4+DQo+ID4+ICAgRklMRVNfJHtQTn0NCj4gKz0iJHtAYmIu
dXRpbHMuY29udGFpbnMoJ0RJU1RST19GRUFUVVJFUycsJ3N5c3RlbWQnLCcke2V4ZWNfcHJlZml4
fS9saWINCj4gL3RtcGZpbGVzLmQvY3J5cHRzZXR1cC5jb25mJywNCj4gPj4gJycsIGQpfSINCj4g
Pj4NCj4gPj4gK0lOU0FORV9TS0lQXyR7UE59ICs9ICJidWlsZC1kZXBzIGZpbGUtcmRlcHMiDQo+
ID4+ICsNCj4gPj4gICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVzZGsiDQo+ID4NCj4g
Pg0KPiA+IFRoaXMgaXMgdGhlIGVycm9yIEknbSBnZXR0aW5nIGF0IGRvX3Jvb3RmcyBhZnRlciB0
aGUgbGF0ZXN0IHZlcnNpb24NCj4gb2YNCj4gPiB0aGlzIHBhdGNoOg0KPiA+DQo+ID4gZG9fcm9v
dGZzOiBDb3VsZCBub3QgaW52b2tlIGRuZi4gQ29tbWFuZA0KPiA+IEVycm9yOg0KPiA+ICDCoFBy
b2JsZW06IGNvbmZsaWN0aW5nIHJlcXVlc3RzDQo+ID4gIMKgIC0gbm90aGluZyBwcm92aWRlcyBs
aWJkZXZtYXBwZXIgbmVlZGVkIGJ5IGNyeXB0c2V0dXAtMi4yLjAtDQo+IHIwLnNreWxha2VfNjQN
Cj4gPiAgwqAgLSBub3RoaW5nIHByb3ZpZGVzIGxpYmRldm1hcHBlci5zby4xLjAyKCkoNjRiaXQp
IG5lZWRlZCBieQ0KPiBjcnlwdHNldHVwLTIuMi4wLXIwLnNreWxha2VfNjQNCj4gPiAgwqAgLSBu
b3RoaW5nIHByb3ZpZGVzIGxpYmRldm1hcHBlci5zby4xLjAyKEJhc2UpKDY0Yml0KSBuZWVkZWQg
YnkNCj4gY3J5cHRzZXR1cC0yLjIuMC1yMC5za3lsYWtlXzY0DQo+ID4gIMKgIC0gbm90aGluZyBw
cm92aWRlcyBsaWJkZXZtYXBwZXIuc28uMS4wMihETV8xXzAyXzk3KSg2NGJpdCkgbmVlZGVkDQo+
IGJ5IGNyeXB0c2V0dXAtMi4yLjAtcjAuc2t5bGFrZV82NA0KPiA+ICh0cnkgdG8gYWRkICctLXNr
aXAtYnJva2VuJyB0byBza2lwIHVuaW5zdGFsbGFibGUgcGFja2FnZXMgb3IgJy0tDQo+IG5vYmVz
dCcgdG8gdXNlIG5vdCBvbmx5IGJlc3QgY2FuZGlkYXRlIHBhY2thZ2VzKQ0KPiANCj4gU29ycnkg
Zm9yIHRoZSBpbmNvbnZlbmllbmNlLCBJIHdpbGwgaGF2ZSBhIGxvb2sgYXQgdGhlIGlzc3VlDQo+
IA0KPiAvL0hvbmd4dQ0KPiANCj4gPiBDaGVlcnMsDQo+ID4NCj4gPiBBbGVqYW5kcm8NCg0KV2Vs
bCwgdGhlIGVycm9yIHNob3VsZCBiZSBvYnZpb3VzIGdpdmVuIHRoYXQgYWZ0ZXIgdGhlIGxhdGVz
dCBjaGFuZ2VzIA0KdG8gbGliZGV2bWFwcGVyIGFuZCBsdm0yLCB0aGUgbGliZGV2bWFwcGVyIHJl
Y2lwZSBubyBsb25nZXIgYnVpbGRzIGEgDQpsaWJkZXZtYXBwZXIgcGFja2FnZSwgaXQgaXMgYnVp
bHQgYnkgbHZtMiwgYnV0IGNyeXB0c2V0dXAgb25seSBkZXBlbmRzIA0Kb24gbGliZGV2bWFwcGVy
IGFuZCBzbyB0aGVyZSBpcyBub3RoaW5nIHRvIHRlbGwgYml0YmFrZSB0aGF0IGl0IG5lZWRzIA0K
dG8gYnVpbGQgbHZtMi4gSSBiZWxpZXZlIHRoZSBjb3JyZWN0IHNvbHV0aW9uIGlzIHRvIGFkZDoN
Cg0KUFJFRkVSUkVEX1JQUk9WSURFUl9saWJkZXZtYXBwZXIgPSAibHZtMiINCg0KdG8gbWV0YS1v
ZS9jb25mL2xheWVyLmNvbmYuIFdpdGggdGhhdCBhZGRlZCBhbmQgdGhlIGV4cGxpY2l0IFJERVBF
TkRTIA0Kb24gbGliZGV2bWFwcGVyIGluIGNyeXB0c2V0dXAsIEkgZG8gbm90IHRoaW5rIHlvdSBu
ZWVkIHRvIHNraXAgbmVpdGhlciANCmJ1aWxkLWRlcHMgbm9yIGZpbGUtcmRlcHMgaW4gdGhlIGNy
eXB0c2V0dXAgcmVjaXBlIGFueW1vcmUuDQoNCi8vUGV0ZXINCg0K

