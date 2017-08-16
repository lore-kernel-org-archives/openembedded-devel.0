Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F84671C0F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Aug 2017 13:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id 054FE18324;
	Wed, 16 Aug 2017 15:05:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id DyPybU0X76yl; Wed, 16 Aug 2017 15:05:28 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bastet.se.axis.com (Postfix) with ESMTPS id E77E81834B;
	Wed, 16 Aug 2017 15:05:27 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C618D1E083;
	Wed, 16 Aug 2017 15:05:27 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA9241E080;
	Wed, 16 Aug 2017 15:05:27 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP;
	Wed, 16 Aug 2017 15:05:27 +0200 (CEST)
Received: from XBOX03.axis.com (xbox03.axis.com [10.0.5.17])
	by seth.se.axis.com (Postfix) with ESMTP id AE8ABE51;
	Wed, 16 Aug 2017 15:05:27 +0200 (CEST)
Received: from XBOX02.axis.com (10.0.5.16) by XBOX03.axis.com (10.0.5.17) with
	Microsoft SMTP Server (TLS) id 15.0.1263.5;
	Wed, 16 Aug 2017 15:05:27 +0200
Received: from XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776]) by
	XBOX02.axis.com ([fe80::50c3:4d2f:4507:7776%21]) with mapi id
	15.00.1263.000; Wed, 16 Aug 2017 15:05:27 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH] start-stop-daemon: Only create a link in
	${base_sbindir} if necessary
Thread-Index: AQHTFo6WyUW+Mhoho02DNWf5iFtpLaKG8vrQ
Date: Wed, 16 Aug 2017 13:05:27 +0000
Message-ID: <e6fc92f1632f49c293a6682eba94057d@XBOX02.axis.com>
References: <20170816112351.6854-1-pkj@axis.com>
	<CA+chaQe6-aw0U46i1rPpU0rmhURa_kSincAtdTJVmx7PA_8AdA@mail.gmail.com>
In-Reply-To: <CA+chaQe6-aw0U46i1rPpU0rmhURa_kSincAtdTJVmx7PA_8AdA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.0.5.60]
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] start-stop-daemon: Only create a link in ${base_sbindir} if necessary
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
X-List-Received-Date: Wed, 16 Aug 2017 13:05:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QmFoLCBJIGhhdmUgYmVlbiBvbiB2YWNhdGlvbiBmb3IgdG9vIGxvbmcuIHYyIGNvbWluZyB1cOKA
pg0KDQovL1BldGVyDQoNCkZyb206IE1hcnRpbiBKYW5zYSBbbWFpbHRvOm1hcnRpbi5qYW5zYUBn
bWFpbC5jb21dDQpTZW50OiBkZW4gMTYgYXVndXN0aSAyMDE3IDE0OjUzDQpUbzogUGV0ZXIgS2pl
bGxlcnN0ZWR0IDxwZXRlci5ramVsbGVyc3RlZHRAYXhpcy5jb20+DQpDYzogb3BlbmVtYmVkZGVk
LWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1Ympl
Y3Q6IFJlOiBbb2VdIFttZXRhLW9lXVtQQVRDSF0gc3RhcnQtc3RvcC1kYWVtb246IE9ubHkgY3Jl
YXRlIGEgbGluayBpbiAke2Jhc2Vfc2JpbmRpcn0gaWYgbmVjZXNzYXJ5DQoNCk1pc3NpbmcgU09C
IGxpbmUuDQoNCk9uIFdlZCwgQXVnIDE2LCAyMDE3IGF0IDE6MjMgUE0sIFBldGVyIEtqZWxsZXJz
dGVkdCA8cGV0ZXIua2plbGxlcnN0ZWR0QGF4aXMuY29tPG1haWx0bzpwZXRlci5ramVsbGVyc3Rl
ZHRAYXhpcy5jb20+PiB3cm90ZToNCklmIHVzcm1lcmdlIGlzIGVuYWJsZWQgaW4gRElTVFJPX0ZF
QVRVUkVTLCB0aGVuICR7YmFzZV9zYmluZGlyfSBhbmQNCiR7c2JpbmRpcn0gYXJlIHNldCB0byB0
aGUgc2FtZSBwYXRoIGFuZCB0aGUgc3ltYm9saWMgbGluayBmcm9tDQoke2Jhc2Vfc2JpbmRpcn0v
c3RhcnQtc3RvcC1kYWVtb24gdG8gJHtzYmluZGlyfS9zdGFydC1zdG9wLWRhZW1vbiBjYW4NCihh
bmQgc2hvdWxkKSBub3QgYmUgY3JlYXRlZC4NCi0tLQ0KIC4uLi9yZWNpcGVzLXN1cHBvcnQvc3Rh
cnQtc3RvcC1kYWVtb24vc3RhcnQtc3RvcC1kYWVtb25fMS4xNy4yNS5iYjxodHRwOi8vc3RhcnQt
c3RvcC1kYWVtb25fMS4xNy4yNS5iYj4gIHwgNiArKysrLS0NCiAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1vZS9yZWNp
cGVzLXN1cHBvcnQvc3RhcnQtc3RvcC1kYWVtb24vc3RhcnQtc3RvcC1kYWVtb25fMS4xNy4yNS5i
YjxodHRwOi8vc3RhcnQtc3RvcC1kYWVtb25fMS4xNy4yNS5iYj4gYi9tZXRhLW9lL3JlY2lwZXMt
c3VwcG9ydC9zdGFydC1zdG9wLWRhZW1vbi9zdGFydC1zdG9wLWRhZW1vbl8xLjE3LjI1LmJiPGh0
dHA6Ly9zdGFydC1zdG9wLWRhZW1vbl8xLjE3LjI1LmJiPg0KaW5kZXggNWVlNDQ3MmNkLi5jYzI3
MjdiNzUgMTAwNjQ0DQotLS0gYS9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9zdGFydC1zdG9wLWRh
ZW1vbi9zdGFydC1zdG9wLWRhZW1vbl8xLjE3LjI1LmJiPGh0dHA6Ly9zdGFydC1zdG9wLWRhZW1v
bl8xLjE3LjI1LmJiPg0KKysrIGIvbWV0YS1vZS9yZWNpcGVzLXN1cHBvcnQvc3RhcnQtc3RvcC1k
YWVtb24vc3RhcnQtc3RvcC1kYWVtb25fMS4xNy4yNS5iYjxodHRwOi8vc3RhcnQtc3RvcC1kYWVt
b25fMS4xNy4yNS5iYj4NCkBAIC0zMSw2ICszMSw4IEBAIGRvX2luc3RhbGxfYXBwZW5kICgpIHsN
Cg0KICAgICAjIHN1cHBvcnQgZm9yIGJ1Z2d5IGluaXQuZCBzY3JpcHRzIHRoYXQgcmVmZXIgdG8g
YW4gYWx0ZXJuYXRpdmUNCiAgICAgIyBleHBsaWNpdCBwYXRoIHRvIHN0YXJ0LXN0b3AtZGFlbW9u
DQotICAgIG1rZGlyIC1wICR7RH0vc2Jpbi8NCi0gICAgbG4gLXNmIC91c3Ivc2Jpbi9zdGFydC1z
dG9wLWRhZW1vbiAke0R9L3NiaW4vc3RhcnQtc3RvcC1kYWVtb24NCisgICAgaWYgWyAiJHtiYXNl
X3NiaW5kaXJ9IiAhPSAiJHtzYmluZGlyfSIgXTsgdGhlbg0KKyAgICAgICAgbWtkaXIgLXAgJHtE
fSR7YmFzZV9zYmluZGlyfQ0KKyAgICAgICAgbG4gLXNmICR7c2JpbmRpcn0vc3RhcnQtc3RvcC1k
YWVtb24gJHtEfSR7YmFzZV9zYmluZGlyfS9zdGFydC1zdG9wLWRhZW1vbg0KKyAgICBmaQ0KIH0N
Ci0tDQoyLjEyLjANCg0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fDQpPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQt
ZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZzxtYWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmc+DQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KDQo=

