Return-Path: <zakiah.md.ismail@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2A3B97875F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 04:42:00 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 20:42:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,404,1515484800"; d="scan'208";a="20725038"
Received: from kmsmsx151.gar.corp.intel.com ([172.21.73.86])
	by fmsmga007.fm.intel.com with ESMTP; 27 Feb 2018 20:42:01 -0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.160]) by
	KMSMSX151.gar.corp.intel.com ([169.254.10.67]) with mapi id
	14.03.0319.002; Wed, 28 Feb 2018 12:42:00 +0800
From: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Dependency loop in cryptsetup
Thread-Index: AdOwRwoR1Kgn94eTS/+PgBRAOALaiP//fKSA//95R8CAAIo3gP//doNw
Date: Wed, 28 Feb 2018 04:42:00 +0000
Message-ID: <1A5BB22468458840B08C979DDA869BF27EBA5F@PGSMSX103.gar.corp.intel.com>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
	<0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
	<1A5BB22468458840B08C979DDA869BF27EB7CA@PGSMSX103.gar.corp.intel.com>
	<4d770b95-e279-7fda-8322-64911ac47431@gmail.com>
In-Reply-To: <4d770b95-e279-7fda-8322-64911ac47431@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOWE4MzJkNjQtMDIyNC00MzBhLTkyZTAtOTIwOTZjZGI1NjNiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJtZW5PVDFBd0lubUtscmQ5cWxZQmNvVzZUYWhsdXFGXC9tM015cG5jd1dOZWl5ZElvYytGSjZwZUxBOHVPRmRPciJ9
x-originating-ip: [172.30.20.205]
MIME-Version: 1.0
Subject: Re: Dependency loop in cryptsetup
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
X-List-Received-Date: Wed, 28 Feb 2018 04:42:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UmVtb3ZpbmcgbGliZ2NyeXB0IGZyb20gREVQRU5EUyBpbiBtZXRhLW9lL3JlY2lwZXMtc3VwcG9y
dC9jcnlwdHNldHVwL2NyeXB0c2V0dXBfMS43LjQuYmIgZG9lc24ndCBzb2x2ZSB0aGUgaXNzdWUu
IFRoZSBkZXBlbmRlbmN5IGxvb3BzIGFyZSBzdGlsbCB0aGVyZS4NCg0KLS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCkZyb206IEtoZW0gUmFqIFttYWlsdG86cmFqLmtoZW1AZ21haWwuY29tXSAN
ClNlbnQ6IFdlZG5lc2RheSwgRmVicnVhcnkgMjgsIDIwMTggMTI6MTEgUE0NClRvOiBNZCBJc21h
aWwsIFpha2lhaCA8emFraWFoLm1kLmlzbWFpbEBpbnRlbC5jb20+OyBvcGVuZW1iZWRkZWQtZGV2
ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KU3ViamVjdDogUmU6IFtvZV0gRGVwZW5kZW5jeSBs
b29wIGluIGNyeXB0c2V0dXANCg0KDQoNCk9uIDIvMjcvMTggODowMSBQTSwgTWQgSXNtYWlsLCBa
YWtpYWggd3JvdGU6DQo+IFllcy4gQ3VycmVudGx5IHVzaW5nIE9FLUNvcmUgcm9ja28gYnJhbmNo
LCBjb21taXQgYThlYjA2MGNiYmJiMDA1ODFlODI2MGRkNmJmYzMxY2ZmNTU1OGU4Zi4NCg0KRG9l
cyByZW1vdmluZyBsaWJnY3J5cHQgZnJvbSBERVBFTkRTIGluDQptZXRhLW9lL3JlY2lwZXMtc3Vw
cG9ydC9jcnlwdHNldHVwL2NyeXB0c2V0dXBfMS43LjQuYmINCmhlbHA/DQo+IA0KPiAtLS0tLU9y
aWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLaGVtIFJhaiBbbWFpbHRvOnJhai5raGVtQGdt
YWlsLmNvbV0NCj4gU2VudDogV2VkbmVzZGF5LCBGZWJydWFyeSAyOCwgMjAxOCAxMTo1OSBBTQ0K
PiBUbzogTWQgSXNtYWlsLCBaYWtpYWggPHpha2lhaC5tZC5pc21haWxAaW50ZWwuY29tPjsgb3Bl
bmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDogUmU6IFtv
ZV0gRGVwZW5kZW5jeSBsb29wIGluIGNyeXB0c2V0dXANCj4gDQo+IA0KPiANCj4gT24gMi8yNy8x
OCA3OjQ4IFBNLCBNZCBJc21haWwsIFpha2lhaCB3cm90ZToNCj4+IEhpLA0KPj4NCj4+IEkgd2Fu
dCB0byBlbmFibGUgY3lycHRzZXR1cCBpbiBzeXN0ZW1kIGJ5IGFkZGluZyBQQUNLQUdFQ09ORklH
X2FwcGVuZF9wbi1zeXN0ZW1kID0gIiBjcnlwdHNldHVwIiBpbiBteSBsb2NhbC5jb25mOyBob3dl
dmVyLCBJIGVuY291bnRlciB0aGUgZGVwZW5kZW5jeSBsb29wIGlzc3VlLiBUaGUgaXNzdWUgaXMg
c2ltaWxhciB0byB0aGlzOiBodHRwczovL2J1Z3ppbGxhLnlvY3RvcHJvamVjdC5vcmcvc2hvd19i
dWcuY2dpP2lkPTExODU2LiBUaGUgZGlmZmVyZW5jZSBpcyBJJ20gdXNpbmcgdGhlIGxhdGVzdCBj
b21taXQgZnJvbSBtZXRhLW9wZW5lbWJlZGRlZCByb2NrbyBicmFuY2guIFBsZWFzZSBhZHZpc2Ug
b24gdGhlIHN0ZXBzIHRvIHNvbHZlIHRoaXMgaXNzdWUuIFRoYW5rcyBpbiBhZHZhbmNlIQ0KPj4N
Cj4gDQo+IGFyZSB5b3UgdXNpbmcgbGF0ZXN0IG9mIHJvY2tvIGZvciBPRS1Db3JlIGFzIHdlbGwg
Pw0KPiANCj4+IFJlZ2FyZHMsDQo+PiBaYWtpYWgNCj4+DQo+Pg0K

