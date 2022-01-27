Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F260C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 21:04:10 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.3872.1643317448721624643
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 13:04:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=o5NrkK8N;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643317449;
  x=1674853449;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=tI6pbnzkKqhEM9C8NAvH/JuVGgCroO5940eHdN8TGAo=;
  b=o5NrkK8NwglKNopeJxX7/oziZJHhiibQK/DWbXZy+HlQyAGqk/DMa2qX
   lc4dKjbNXUBOqrRx1E4iE0SHZyzrcci8GalIzK6M0sxMpaNM2RORsHLuA
   0oaZS2C+FMl02s+9WLhRHSYh9yRFG5+YAti7gtzEuOVyiTzZI2t3JqKOB
   6lwlFHgtyFGGV6gJJ6QG0h/O0sQm1mbTkuhTCiDyW1cuPBTX/TiS2LQdi
   1mH5xAjC4M2A9azO6e4VuSs1eHeDwbcozEU8grMicBpHUh1UiIEapUKrM
   VWTo82e75hnpKU/iFK7YbvXzezdBR0mSohKJEZ/dLq0+en+B6OXUOkH3I
   w==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Khem Raj
	<raj.khem@gmail.com>
CC: Fabio Estevam <festevam@denx.de>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>, Heiko Schocher <hs@denx.de>,
	Alexandre BELLONI <alexandre.belloni@bootlin.com>
Subject: RE: [oe] [PATCH v2 meta-oe] rtc-tools: Add a recipe
Thread-Topic: [oe] [PATCH v2 meta-oe] rtc-tools: Add a recipe
Thread-Index: AQHYEuMrpJMUSuWK7kKK2QJ0jebOyax1l4iAgAHE2ZA=
Date: Thu, 27 Jan 2022 21:04:06 +0000
Message-ID: <66a50b06d9314c8780ef653331d9ea06@axis.com>
References: <20220126182232.1790127-1-festevam@denx.de>
 <CAMKF1spmTzkh_egyGhyXgkfBag_eHMDZCHoaTQSPHpemo=MYbw@mail.gmail.com>
 <CAP9ODKoyVa0NUzghEAQSRdXOtx_Zbmov+LGYXwz04tSn09GYOA@mail.gmail.com>
In-Reply-To: 
 <CAP9ODKoyVa0NUzghEAQSRdXOtx_Zbmov+LGYXwz04tSn09GYOA@mail.gmail.com>
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
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 21:04:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95129

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWxA
bGlzdHMub3BlbmVtYmVkZGVkLm9yZyA8b3BlbmVtYmVkZGVkLQ0KPiBkZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgT3RhdmlvIFNhbHZhZG9yDQo+IFNlbnQ6IGRlbiAy
NiBqYW51YXJpIDIwMjIgMjA6MDENCj4gVG86IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+
DQo+IENjOiBGYWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBkZW54LmRlPjsgb3BlbmVtYmVkZWQtZGV2
ZWwgPG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47IEhlaWtv
IFNjaG9jaGVyIDxoc0BkZW54LmRlPjsgQWxleGFuZHJlDQo+IEJFTExPTkkgPGFsZXhhbmRyZS5i
ZWxsb25pQGJvb3RsaW4uY29tPg0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0ggdjIgbWV0YS1v
ZV0gcnRjLXRvb2xzOiBBZGQgYSByZWNpcGUNCj4gDQo+IEVtIHF1YS4sIDI2IGRlIGphbi4gZGUg
MjAyMiDDoHMgMTU6MzIsIEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+IGVzY3JldmV1
Og0KPiA+ID4gK2RvX2luc3RhbGwoKSB7DQo+ID4gPiArICAgICAgIG9lX3J1bm1ha2UgaW5zdGFs
bA0KPiA+ID4gK30NCj4gDQo+IElJUkMgdGhpcyBpcyB0aGUgZGVmYXVsdCBzbyBFWFRSQV9PRU1B
S0UgKHJlbW92aW5nIHRoaXMgdGFzaykgd291bGQganVzdA0KPiB3b3JrLg0KDQpOby4gVGhlcmUg
aXMgYSBkZWZhdWx0IGJhc2VfZG9fY29tcGlsZSgpIGluIGJhc2UuYmJjbGFzcyB0aGF0IHJ1bnMg
DQpvZV9ydW5tYWtlIGlmIGEgTWFrZWZpbGUgZXhpc3RzLCBidXQgdGhlIGRlZmF1bHQgYmFzZV9k
b19pbnN0YWxsKCkgDQpkb2VzIG5vdGhpbmcuDQoNCi8vUGV0ZXINCg0K

