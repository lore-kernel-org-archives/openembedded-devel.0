Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.8835.1592651303005355374
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 20 Jun 2020 04:08:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=n2ngQffl;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=2308; q=dns/txt; s=axis-central1;
  t=1592651303; x=1624187303;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pRnuXD6XCVAn0Q1cwqxN7CGmxxOKqAsNWcOIboLL4RQ=;
  b=n2ngQffliUzxz3rdSuMj0SolA3EJ6INDOriT6tWXYRRMApxC6v0Td3X+
   p/0aYuzdRg97wZGIu5F4X/gS/2nwxjM9UUV8oYHnd5WLtP1qmYBVdMzcg
   6JcMtMDqPyojNiX4kO5yY9oAQ6Dg6nPqpUxkx3f2aSZP9NQcqATbvYtAB
   z4MXONw16E6umhxzV0nOM2l5J8Fjenl/qrkWy5Xcb1SgohSlXp8SN6CMf
   lNfQs/s/EIfNn1OBGhmWLbpe4yINeK/3gI9iWunZmhr1RhhkYH83w39bZ
   ARdjIevA2425IMWh9Uls7KneFipNgSbZI3+gCkQze/2zUsnrMO4tnb5tX
   w==;
IronPort-SDR: 98tkrjVcDm/0BVePh7tmaxnx4muUnmE+jDQ4VFPUiFppKivbhSAAukTZlnDSlBsWVIlekShj24
 IWDwD57bFfrqigs4a5b6KtF/2su303Ewx7d5UanwMiMpDKdzYrCYQEELc0crGwYBG01zV9Y7HF
 TWac0LUnrYKPbYfuS5QJdCxJodWoDZn4eLkzBiatzJ2wvOmvrsMYrK5pSim9JP5Jn0AHfzgd25
 cQg3PGj84rJutnOj4NnavHJ5gZ9SRE3UCED6xtXmojiDjaKGxVQyQjv4GCWS3zvqCovEKlc9JG
 P1A=
X-IronPort-AV: E=Sophos;i="5.75,258,1589234400"; 
   d="scan'208";a="10018335"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: Khem Raj <raj.khem@gmail.com>, =?utf-8?B?QW5kcmVhcyBNw7xsbGVy?=
	<schnitzeltony@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename recipe
Thread-Topic: [oe] [PATCH 10/10] libgit2: upgrade 1.0.0 -> 1.0.1 / rename
 recipe
Thread-Index: AQHWRi1kBOGRhlaHc0+RgHssJEqIMKjf9F4AgAABuQCAAALggIABX+MA
Date: Sat, 20 Jun 2020 11:08:19 +0000
Message-ID: <2162972d9efc41a3bfb7a0ca4a6b964e@XBOX03.axis.com>
References: <20200619113201.2811033-1-schnitzeltony@gmail.com>
 <20200619113201.2811033-10-schnitzeltony@gmail.com>
 <e7646f40-9032-0b77-5969-9afa9a883704@gmail.com>
 <CALbNGRR3bTe4ATHS-2505iGUOsQq+H3YPqRoLc-+cHCYvNmNLg@mail.gmail.com>
 <079febc3-4665-d650-22af-03f6fac48454@gmail.com>
In-Reply-To: <079febc3-4665-d650-22af-03f6fac48454@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgS2hlbSBSYWoNCj4gU2VudDogZGVuIDE5IGp1bmkg
MjAyMCAxODowNQ0KPiBUbzogQW5kcmVhcyBNw7xsbGVyIDxzY2huaXR6ZWx0b255QGdtYWlsLmNv
bT4NCj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3Bl
bmVtYmVkZGVkLm9yZz4NCj4gU3ViamVjdDogUmU6IFtvZV0gW1BBVENIIDEwLzEwXSBsaWJnaXQy
OiB1cGdyYWRlIDEuMC4wIC0+IDEuMC4xIC8gcmVuYW1lDQo+IHJlY2lwZQ0KPiANCj4gT24gNi8x
OS8yMCA4OjU1IEFNLCBBbmRyZWFzIE3DvGxsZXIgd3JvdGU6DQo+ID4gT24gRnJpLCBKdW4gMTks
IDIwMjAgYXQgNTo0OCBQTSBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPiB3cm90ZToNCj4g
Pj4NCj4gPj4NCj4gPj4NCj4gPj4gT24gNi8xOS8yMCA0OjMyIEFNLCBBbmRyZWFzIE3DvGxsZXIg
d3JvdGU6DQo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWFzIE3DvGxsZXIgPHNjaG5pdHplbHRv
bnlAZ21haWwuY29tPg0KPiA+Pj4gLS0tDQo+ID4+PiAgLi4uL2xpYmdpdDIve2xpYmdpdDJfMS4w
LjAuYmIgPT4gbGliZ2l0Ml9naXQuYmJ9ICAgICAgICAgICAgICAgfCAzDQo+ICsrLQ0KPiA+Pg0K
PiA+PiBJIHRoaW5rIHdlIGhhdmUgYmVlbiBwcmVmZXJyaW5nIHRvIHVzZSBQViB2aWEgcmVjaXBl
IG5hbWVzIGlmDQo+IHBvc3NpYmxlLg0KPiA+PiB3aGljaCB0aGlzIHJlY2lwZSBpcyBhbHJlYWR5
IGRvaW5nLCBpcyB0aGVyZSBhbnkgYmVuZWZpdCBvZiByZW5hbWluZw0KPiBpdA0KPiA+PiB0byBf
Z2l0ID8NCj4gPiBSZW5hbWluZzoNCj4gPiAqIG5lZWRzIGV4dHJhIGVmZm9ydHMgdG8gY3JlYXRl
IGRpZmYgd2hpbGUgd29ya2luZyBvbiBhIHJlY2lwZQ0KPiA+ICogbWlnaHQgY2F1c2UgaXNzdWVz
IG9uIGh1Z2UgZGlmZnMNCj4gPg0KPiA+IFNoYWxsIEkgc3dpdGNoIGJhY2sgdG8gb2xkIHNjaGVt
ZSBhbmQgc2VuZCBWMj8NCj4gPg0KPiANCj4gU28gb25lIGVhc3kgcHJvYmxlbSB5b3UgcnVuIGlu
dG8gd2l0aCBfZ2l0IHJlY2lwZXMgaXMgdGhhdCBTUkNSRVYgZ2V0cw0KPiB1cGRhdGVkIGJ1dCBQ
ViBkb2VzIG5vdCwgdGhlIGlzc3VlcyB3aXRoIHJlbmFtaW5nIHJlY2lwZXMgaXMgYXMgeW91DQo+
IGRlc2NyaWJlZCBhbmQgYWxzbyBnaXQgaGlzdG9yeSB0cmFja2luZyBpcyBhIGJpdCBwYWluZnVs
IHRvbywgSSBhbSBub3QNCj4gaGFyZCBvcGluZWQgZWl0aGVyIHdheS4NCj4gDQo+IExldHMga2Vl
cCB0aGUgX1BWIHZlcnNpb24gaWYgaXRzIGEgcHJvcGVyIHJlbGVhc2UgU1JDUkVWIHRoYXQgd2Ug
YXJlDQo+IGp1bXBpbmcgdG8uDQo+IA0KPiA+IEFuZHJlYXMNCg0KT25lIHJlYXNvbiB0byBrZWVw
IHRoZSB2ZXJzaW9uIGluIHRoZSBmaWxlbmFtZSBpcyBiZWNhdXNlIHlvdSBjYW5ub3QgZG8gDQp2
ZXJzaW9uZWQgYmJhcHBlbmRzIG90aGVyd2lzZS4gSS5lLiwgaXQgaXMgbm90IHBvc3NpYmxlIHRv
IGRvIGEgDQoibGliZ2l0Ml8xLjAuJS5iYmFwcGVuZCIgaWYgdGhlIHJlY2lwZSBpcyBjYWxsZWQg
ImxpYmdpdDJfZ2l0LmJiIi4NCg0KLy9QZXRlcg0KDQo=
