Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.640.1586991769063399225
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Apr 2020 16:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=U6FY+0dZ;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=4430; q=dns/txt; s=axis-central1;
  t=1586991769; x=1618527769;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4U4zG21aEU4Lf01ZNIgiDDPnepqSju+gvfrE1QomXvI=;
  b=U6FY+0dZo19Dp9nU6vfFWryH36NESO1FG5aiqJ54I9B35XIGX/pYxOlo
   9/Og1PPx/pDThmJxGrvD3dlT7NyZmMomfDRn+JfGv+3JO93t4thmGoPOX
   CYLSlfs9oGDaCYz9sMPwa2mEhENCqhf0WWM8kPLxyo7ElzzvsEP1fzGuS
   UqfmxYau30BL190ihiEXKaWJnErhkY0n6uaEr3XTHEL04yD3mir27wpIt
   BAgWp7FhRr94sWG5XtACOXbQOoy+lHn/PJJE1B+z7j6wrHwTsAeqQ1BHO
   4u4Lrvc5Sf6UG1LEET2J0WGeEBV/fYGeJFnISUQbmve7hnKJnsPxNg8/l
   Q==;
IronPort-SDR: CU2DCJa4O3hxInI7R86pTT6jzXwN8cO+fqRUvSzfW9ExAPJCn3zqsF5keYF1EN9ikzzDrRjkFd
 SwEJyDQ7xBA+uokUuVJsyhtIJVHPRoisnuvedoQInxkDDadjMvFZU+piXQr4rgIcyM5NVDwyuV
 yCO/JQ5P5SavW/rbw/tjtJSZxVqiPm3uF1U2fez+qCrRf9j86LiWUuEJdgKtFtLrv6LfZ+XbwE
 mdGN2Ys1s6H9rEGdFjwCT6LXDyLrPz5TM9t+l2PxsCFftTQ9NxvVMrcMDG1YL7U6/d0RrIbLIM
 T3k=
X-IronPort-AV: E=Sophos;i="5.72,388,1580770800"; 
   d="scan'208";a="7466619"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Trevor Gamblin <trevor.gamblin@windriver.com>, Khem Raj
	<raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
Thread-Topic: [oe] [meta-webserver][PATCH] apache2: upgrade 2.4.41 -> 2.4.43
Thread-Index: AQHWEpXYxKygSqEqHUC20YBFrX3QUKh5FBWAgAAZiACAAZ2lkA==
Date: Wed, 15 Apr 2020 23:02:44 +0000
Message-ID: <07865a3bea714ee88fb74d336ab10831@XBOX03.axis.com>
References: <20200414194933.31798-1-trevor.gamblin@windriver.com>
 <CAMKF1sps=ihwMcTFkSBTSdtZDbGEfotpjbje9hhdaAkv=g4X9w@mail.gmail.com>
 <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
In-Reply-To: <695157d6-c8d1-dca0-df48-cd5d233da330@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Return-Path: peter.kjellerstedt@axis.com
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgVHJldm9yIEdhbWJsaW4NCj4gU2VudDogZGVuIDE1
IGFwcmlsIDIwMjAgMDI6MTANCj4gVG86IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+
IENjOiBvcGVuZW1iZWRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJl
ZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLXdlYnNlcnZlcl1bUEFUQ0hdIGFw
YWNoZTI6IHVwZ3JhZGUgMi40LjQxIC0+DQo+IDIuNC40Mw0KPiANCj4gT24gNC8xNC8yMCA2OjM4
IFBNLCBLaGVtIFJhaiB3cm90ZToNCj4gPiBhcGFjaGUtd2Vic29ja2V0cyBkb2VzIG5vdCBsaWtl
IGl0DQo+ID4gDQo+ID4gaHR0cHM6Ly9lcnJvcnMueW9jdG9wcm9qZWN0Lm9yZy9FcnJvcnMvRGV0
YWlscy80MDM3NzEvDQo+IA0KPiBUaGFua3MsIHdpbGwgdGFrZSBhIGxvb2sgYXQgaXQgYW5kIHJl
LXNlbmQuDQoNCkl0IGFwcGVhcnMgdGhleSBoYXZlIGFkZGVkIGNyb3NzIGNvbXBpbGF0aW9uIHN1
cHBvcnQgdG8gYXB4cywgYnV0IA0KaXQgY2xhc2hlcyB3aXRoIHRoZSBjaGFuZ2VzIGRvbmUgaW4g
T0UgdG8gbWFrZSBpdCBzdXBwb3J0IGNyb3NzIA0KY29tcGlsYXRpb24uIEkgdHJpZWQgdG8gc29s
dmUgaXQgYnkgYmFzaWNhbGx5IHJlbW92aW5nIHRoZSBPRSANCmNoYW5nZXMsIGJ1dCBpdCB3YXMg
bm90IGFzIHNpbXBsZSBhcyB0aGF0LiBJbiB0aGUgZW5kIHdlIHdvcmtlZCANCmFyb3VuZCBpdCB3
aXRoIHRoaXMgcXVpY2sgZml4Og0KDQphcGFjaGVfc3lzcm9vdF9wcmVwcm9jZXNzX2FwcGVuZCgp
IHsNCiAgICAgICAgIyBEaXNhYmxlIGFweHMnIGJ1aWx0IGluIGNyb3NzIGNvbXBpbGF0aW9uIHN1
cHBvcnQgYW5kIHJlbHkgb24gd2hhdCB0aGUNCiAgICAgICAgIyByZWNpcGUgc2V0cyB1cC4NCiAg
ICAgICAgc2VkIC1pICdzISRkZXN0ZGlyID0gLiohJGRlc3RkaXIgPSAiIjshJyAke1NZU1JPT1Rf
REVTVERJUn0ke2JpbmRpcl9jcm9zc3NjcmlwdHN9L2FweHMNCn0NCg0KSG93ZXZlciwgSSBob3Bl
IHlvdSBjYW4gY29tZSB1cCB3aXRoIGEgYmV0dGVyIHNvbHV0aW9uIHRoYXQgDQphY3R1YWxseSBt
YWtlcyB1c2Ugb2Ygd2hhdCB0aGV5IGRpZCB1cHN0cmVhbSBhbmQgdGh1cyBsZXNzZW4gDQp0aGUg
Y2hhbmdlcyB0aGF0IGhhdmUgdG8gYmUgYXBwbGllZCBieSBPRS4NCg0KLy9QZXRlcg0KDQo+ID4g
T24gVHVlLCBBcHIgMTQsIDIwMjAgYXQgMTI6NDkgUE0gVHJldm9yIEdhbWJsaW4NCj4gPiA8dHJl
dm9yLmdhbWJsaW5Ad2luZHJpdmVyLmNvbT4gd3JvdGU6DQo+ID4+IExJQ0VOU0UgZmlsZSB3YXMg
dXBkYXRlZCBkdWUgdG8gYSB0eXBvIGZpeC4NCj4gPj4NCj4gPj4gTm90ZSB0aGF0IHRoaXMgdXBn
cmFkZSBmaXhlcyB0d28gQ1ZFUyBhZmZlY3RpbmcgdmVyc2lvbnMNCj4gPj4gMi40LjQxIGFuZCBl
YXJsaWVyOg0KPiA+Pg0KPiA+PiBDVkU6IENWRS0yMDIwLTE5MjcNCj4gPj4gQ1ZFOiBDVkUtMjAy
MC0xOTM0DQo+ID4+DQo+ID4+IFNlZToNCj4gPj4gaHR0cHM6Ly9udmQubmlzdC5nb3YvdnVsbi9k
ZXRhaWwvQ1ZFLTIwMjAtMTkyNw0KPiA+PiBodHRwczovL252ZC5uaXN0Lmdvdi92dWxuL2RldGFp
bC9DVkUtMjAyMC0xOTM0DQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IFRyZXZvciBHYW1ibGlu
IDx0cmV2b3IuZ2FtYmxpbkB3aW5kcml2ZXIuY29tPg0KPiA+PiAtLS0NCj4gPj4gICAuLi4vYXBh
Y2hlMi97YXBhY2hlMl8yLjQuNDEuYmIgPT4gYXBhY2hlMl8yLjQuNDMuYmJ9ICAgICAgICB8IDYg
KysrLQ0KPiAtLQ0KPiA+PiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pDQo+ID4+ICAgcmVuYW1lIG1ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBh
Y2hlMi97YXBhY2hlMl8yLjQuNDEuYmIgPT4NCj4gYXBhY2hlMl8yLjQuNDMuYmJ9ICg5NyUpDQo+
ID4+DQo+ID4+IGRpZmYgLS1naXQgYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNo
ZTIvYXBhY2hlMl8yLjQuNDEuYmINCj4gYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2Fw
YWNoZTIvYXBhY2hlMl8yLjQuNDMuYmINCj4gPj4gc2ltaWxhcml0eSBpbmRleCA5NyUNCj4gPj4g
cmVuYW1lIGZyb20gbWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTJf
Mi40LjQxLmJiDQo+ID4+IHJlbmFtZSB0byBtZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2Fw
YWNoZTIvYXBhY2hlMl8yLjQuNDMuYmINCj4gPj4gaW5kZXggYTM0NzM0YzIwLi4yZmZmMTUzZmMg
MTAwNjQ0DQo+ID4+IC0tLSBhL21ldGEtd2Vic2VydmVyL3JlY2lwZXMtaHR0cGQvYXBhY2hlMi9h
cGFjaGUyXzIuNC40MS5iYg0KPiA+PiArKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBk
L2FwYWNoZTIvYXBhY2hlMl8yLjQuNDMuYmINCj4gPj4gQEAgLTI0LDkgKzI0LDkgQEAgU1JDX1VS
SV9hcHBlbmRfY2xhc3MtdGFyZ2V0ID0gIiBcDQo+ID4+ICAgICAgICAgICAgICBmaWxlOi8vdm9s
YXRpbGVzLjA0X2FwYWNoZTIgXA0KPiA+PiAgICAgICAgICAgICAgIg0KPiA+Pg0KPiA+PiAtTElD
X0ZJTEVTX0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9ZDUyZDBmZDBiYzc4OGYwNjhl
NjQ3MTE2YzAxZGRmY2QiDQo+ID4+IC1TUkNfVVJJW21kNXN1bV0gPSAiZGZjNjc0ZjhmNDU0ZTNi
YzJkNGNjZDczYWQzYjVmMWUiDQo+ID4+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMTMzZDQ4
Mjk4ZmU1MzE1YWU5MzY2YTBlYzY2MjgyZmE0MDQwZWZhNWQ1NjYxNzQ0ODEwNzdhZGU3ZDE4ZWE0
MCINCj4gPj4gK0xJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PWJkZGVk
ZGZhYzgwYjJjOWE4ODIyNDFkMDA4YmI0MWMzIg0KPiA+PiArU1JDX1VSSVttZDVzdW1dID0gIjc5
MWM5ODZiMWU3MGZlNjFlYjQ0MDYwYWFjYzg5YTY0Ig0KPiA+PiArU1JDX1VSSVtzaGEyNTZzdW1d
ID0NCj4gImE0OTc2NTJhYjNmYzgxMzE4Y2RjMmEyMDMwOTBhOTk5MTUwZDg2NDYxYWNmZjk3YzEw
NjVkYzkxMGZlMTBmNDMiDQo+ID4+DQo+ID4+ICAgUyA9ICIke1dPUktESVJ9L2h0dHBkLSR7UFZ9
Ig0KPiA+Pg0KPiA+PiAtLQ0KPiA+PiAyLjE3LjENCj4gPj4NCj4gPj4NCg==
