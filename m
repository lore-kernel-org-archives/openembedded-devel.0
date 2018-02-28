Return-Path: <zakiah.md.ismail@intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id A708F77DCD
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Feb 2018 04:01:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Feb 2018 20:01:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,403,1515484800"; d="scan'208";a="31198846"
Received: from pgsmsx101.gar.corp.intel.com ([10.221.44.78])
	by orsmga003.jf.intel.com with ESMTP; 27 Feb 2018 20:01:58 -0800
Received: from pgsmsx109.gar.corp.intel.com (10.221.44.109) by
	PGSMSX101.gar.corp.intel.com (10.221.44.78) with Microsoft SMTP Server
	(TLS) id 14.3.319.2; Wed, 28 Feb 2018 12:01:57 +0800
Received: from pgsmsx103.gar.corp.intel.com ([169.254.2.160]) by
	PGSMSX109.gar.corp.intel.com ([169.254.14.206]) with mapi id
	14.03.0319.002; Wed, 28 Feb 2018 12:01:57 +0800
From: "Md Ismail, Zakiah" <zakiah.md.ismail@intel.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Dependency loop in cryptsetup
Thread-Index: AdOwRwoR1Kgn94eTS/+PgBRAOALaiP//fKSA//95R8A=
Date: Wed, 28 Feb 2018 04:01:56 +0000
Message-ID: <1A5BB22468458840B08C979DDA869BF27EB7CA@PGSMSX103.gar.corp.intel.com>
References: <1A5BB22468458840B08C979DDA869BF27EB738@PGSMSX103.gar.corp.intel.com>
	<0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
In-Reply-To: <0ca3f04d-dd55-cbbb-3b3e-dba03f54ebd6@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.0.116
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNWIyNmI2MmYtMTQ3Zi00YmMxLTlkODktZDQ3MzhjYWU4YzRiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjIuNS4xOCIsIlRydXN0ZWRMYWJlbEhhc2giOiJmUGRHcTF5QStid1ZMcDk3OWxkMzducG1NOGt2eFwvN3ptZng3SFBVRUt5NzE3cmw1MTJITExNOWtYWUZqK3BYWCJ9
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
X-List-Received-Date: Wed, 28 Feb 2018 04:01:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

WWVzLiBDdXJyZW50bHkgdXNpbmcgT0UtQ29yZSByb2NrbyBicmFuY2gsIGNvbW1pdCBhOGViMDYw
Y2JiYmIwMDU4MWU4MjYwZGQ2YmZjMzFjZmY1NTU4ZThmLg0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogW21haWx0bzpyYWoua2hlbUBnbWFpbC5jb21dIA0KU2Vu
dDogV2VkbmVzZGF5LCBGZWJydWFyeSAyOCwgMjAxOCAxMTo1OSBBTQ0KVG86IE1kIElzbWFpbCwg
WmFraWFoIDx6YWtpYWgubWQuaXNtYWlsQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBEZXBlbmRlbmN5IGxvb3Ag
aW4gY3J5cHRzZXR1cA0KDQoNCg0KT24gMi8yNy8xOCA3OjQ4IFBNLCBNZCBJc21haWwsIFpha2lh
aCB3cm90ZToNCj4gSGksDQo+IA0KPiBJIHdhbnQgdG8gZW5hYmxlIGN5cnB0c2V0dXAgaW4gc3lz
dGVtZCBieSBhZGRpbmcgUEFDS0FHRUNPTkZJR19hcHBlbmRfcG4tc3lzdGVtZCA9ICIgY3J5cHRz
ZXR1cCIgaW4gbXkgbG9jYWwuY29uZjsgaG93ZXZlciwgSSBlbmNvdW50ZXIgdGhlIGRlcGVuZGVu
Y3kgbG9vcCBpc3N1ZS4gVGhlIGlzc3VlIGlzIHNpbWlsYXIgdG8gdGhpczogaHR0cHM6Ly9idWd6
aWxsYS55b2N0b3Byb2plY3Qub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTg1Ni4gVGhlIGRpZmZlcmVu
Y2UgaXMgSSdtIHVzaW5nIHRoZSBsYXRlc3QgY29tbWl0IGZyb20gbWV0YS1vcGVuZW1iZWRkZWQg
cm9ja28gYnJhbmNoLiBQbGVhc2UgYWR2aXNlIG9uIHRoZSBzdGVwcyB0byBzb2x2ZSB0aGlzIGlz
c3VlLiBUaGFua3MgaW4gYWR2YW5jZSENCj4gDQoNCmFyZSB5b3UgdXNpbmcgbGF0ZXN0IG9mIHJv
Y2tvIGZvciBPRS1Db3JlIGFzIHdlbGwgPw0KDQo+IFJlZ2FyZHMsDQo+IFpha2lhaA0KPiANCj4g
DQo=

