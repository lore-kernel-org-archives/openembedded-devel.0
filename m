Return-Path: <jbriance@cisco.com>
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	by mail.openembedded.org (Postfix) with ESMTP id ADCA96AC37
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=4230; q=dns/txt; s=iport;
	t=1450178702; x=1451388302;
	h=from:to:subject:date:message-id:references:in-reply-to:
	content-transfer-encoding:mime-version;
	bh=Jn41q9/H1ljVGSWtRbE7YtojCPSZl9NYCXVnuDg+O1A=;
	b=QnodILZdFlJfwOlRX0H1S1UQEWcf9F33afw5/4GL9gWi7+3Mie6dSl6j
	gZTxUjQ9lBdyeRnUd7HpCrzWZ9wk+TvquNGIHWS0DXwitVWkyQ6hOsLd2
	I+3cWvIlp5tFKrd3DMbfNt2Jb04BPKuZakdSzK5Dy4T3C4KLXmrK2pU84 E=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0D6BQAp+G9W/4UNJK1egzpSbQa8KIEgA?=
	=?us-ascii?q?Q2BYxcMhSBKAhyBHjgUAQEBAQEBAX8LhDQBAQEDAQEBASAROhAHBAIBCBEEAQE?=
	=?us-ascii?q?DAiMDAgICJQEKFAEICAIEEwiIHwgOq1aSCwEBAQEBAQEBAQEBAQEBAQEBAQEag?=
	=?us-ascii?q?QGFVYR9h3eBSQWWfAGFOIUigmaBY0mXAYNzAR8BAUKCRIFAcgEBgykGPYEIAQE?=
	=?us-ascii?q?B?=
X-IronPort-AV: E=Sophos;i="5.20,431,1444694400"; d="scan'208";a="217455472"
Received: from alln-core-11.cisco.com ([173.36.13.133])
	by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	15 Dec 2015 11:25:01 +0000
Received: from XCH-ALN-007.cisco.com (xch-aln-007.cisco.com [173.36.7.17])
	by alln-core-11.cisco.com (8.14.5/8.14.5) with ESMTP id tBFBP1eb022967
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:25:01 GMT
Received: from xch-aln-008.cisco.com (173.36.7.18) by XCH-ALN-007.cisco.com
	(173.36.7.17) with Microsoft SMTP Server (TLS) id 15.0.1104.5;
	Tue, 15 Dec 2015 05:25:00 -0600
Received: from xch-aln-008.cisco.com ([173.36.7.18]) by XCH-ALN-008.cisco.com
	([173.36.7.18]) with mapi id 15.00.1104.009;
	Tue, 15 Dec 2015 05:25:00 -0600
From: "Julien Brianceau (jbriance)" <jbriance@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] QT5 application NOT generating core dump upon receiving
	segmentation fault
Thread-Index: AQHRNyiU8l+4kYkGT0eQy4Y1mIni6Z7L5ARQ
Date: Tue, 15 Dec 2015 11:25:00 +0000
Message-ID: <e230104b40e44ffd95a1dc7dab186765@XCH-ALN-008.cisco.com>
References: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
	<db278e3a48e24cc1b48e6630554815c0@XCH-ALN-008.cisco.com>
	<CADySD0FqHWC57y4YOeMMENAzisbzpewuY=asaubzgsvN_MXLSg@mail.gmail.com>
In-Reply-To: <CADySD0FqHWC57y4YOeMMENAzisbzpewuY=asaubzgsvN_MXLSg@mail.gmail.com>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.60.62.150]
MIME-Version: 1.0
Subject: Re: QT5 application NOT generating core dump upon receiving segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 11:25:02 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SnVzdCB0byBiZSBzdXJlLCBjYW4geW91IHRyeSB0aGUgZm9sbG93aW5nIGV4cG9ydCBiZWZvcmUg
bGF1bmNoaW5nIHlvdXIgUXQgYXBwIG9uIHlvdXIgdGFyZ2V0Og0KDQogICAgZXhwb3J0IFFUX1FQ
QV9FTkFCTEVfVEVSTUlOQUxfS0VZQk9BUkQ9MQ0KDQpJdCBjb3VsZCB3b3JrYXJvdW5kIHRoZSBz
aWduYWwgaGFuZGxlciBpbnN0YWxsYXRpb24sIGNmLiBodHRwOi8vY29kZS5xdC5pby9jZ2l0L3F0
L3F0YmFzZS5naXQvdHJlZS9zcmMvcGxhdGZvcm1zdXBwb3J0L2ZiY29udmVuaWVuY2UvcWZidnRo
YW5kbGVyLmNwcD9oPTUuNCNuNzENCg0KSnVsaWVuDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0t
LS0tDQpGcm9tOiBvcGVuZW1iZWRkZWQtZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQu
b3JnIFttYWlsdG86b3BlbmVtYmVkZGVkLWRldmVsLWJvdW5jZXNAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZ10gT24gQmVoYWxmIE9mIEFua3VyIFR5YWdpDQpTZW50OiBtYXJkaSAxNSBkw6ljZW1icmUg
MjAxNSAxMjowNg0KVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTdWJqZWN0OiBSZTogW29lXSBRVDUgYXBwbGljYXRpb24gTk9UIGdlbmVyYXRpbmcgY29yZSBk
dW1wIHVwb24gcmVjZWl2aW5nIHNlZ21lbnRhdGlvbiBmYXVsdA0KDQpIaSwNCg0KSSBhbSB1c2lu
ZyBRdDUuNC4xIHdpdGggZWdsZnMgUVBBLg0KDQpJcyB0aGVyZSBhIHdheSB0byBhdm9pZCBxdCBz
aWduYWwgaGFuZGxlciBkdXJpbmcgY29tcGlsYXRpb24gPyBJIHdvdWxkIGxpa2UNCmF2b2lkIHBh
dGNoaW5nIFF0IGNvZGUuDQoNClRoYW5rcw0KQW5rdXINCk9uIDE2LURlYy0yMDE1IDEyOjAwIGFt
LCAiSnVsaWVuIEJyaWFuY2VhdSAoamJyaWFuY2UpIiA8amJyaWFuY2VAY2lzY28uY29tPg0Kd3Jv
dGU6DQoNCj4gSGksDQo+DQo+IFdoYXQgZXhhY3QgdmVyc2lvbiBvZiBRdDUgYW5kIHdoaWNoIFF0
IFFQQSBwbGF0Zm9ybSBkbyB5b3UgdXNlIHdpdGggeW91cg0KPiBraXQgPw0KPg0KPiBBIHF1aWNr
IGdyZXAgc2hvd3MgdGhpczoNCj4gaHR0cDovL2NvZGUucXQuaW8vY2dpdC9xdC9xdGJhc2UuZ2l0
L3RyZWUvc3JjL2NvcmVsaWIva2VybmVsL3FjcmFzaGhhbmRsZXIuY3BwP2g9NS41I240MDksDQo+
IGl0IGNvdWxkIGV4cGxhaW4geW91ciBpc3N1ZSBpZiBpdCBpcyBjYWxsZWQuDQo+DQo+IEp1bGll
bg0KPg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBvcGVuZW1iZWRkZWQt
ZGV2ZWwtYm91bmNlc0BsaXN0cy5vcGVuZW1iZWRkZWQub3JnIFttYWlsdG86DQo+IG9wZW5lbWJl
ZGRlZC1kZXZlbC1ib3VuY2VzQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmddIE9uIEJlaGFsZiBPZiBB
bmt1cg0KPiBUeWFnaQ0KPiBTZW50OiBtYXJkaSAxNSBkw6ljZW1icmUgMjAxNSAxMToyNw0KPiBU
bzogb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gU3ViamVjdDog
W29lXSBRVDUgYXBwbGljYXRpb24gTk9UIGdlbmVyYXRpbmcgY29yZSBkdW1wIHVwb24gcmVjZWl2
aW5nDQo+IHNlZ21lbnRhdGlvbiBmYXVsdA0KPg0KPiBIaSwNCj4NCj4gSSBhbSBydW5uaW5nIGEg
UVQ1IGJhc2VkIGFwcGxpY2F0aW9uIG9uIFRJIEFNMzM1eCBFVk0ga2l0LiBJIGFtIHVzaW5nDQo+
IG1ldGEtYXJhZ28gZGFpc3kgY29uZmlndXJhdGlvbi4NCj4NCj4gTXkgc3lzdGVtIGlzIGNvbmZp
Z3VyZWQgdG8gZ2VuZXJhdGUgY29yZSBkdW1wIGFuZCBjb3JlIGR1bXBzIGFyZSBnZW5lcmF0ZWQN
Cj4gd2hlbmV2ZXIgYXBwbGljYXRpb24gcmVjZWl2ZXMgc2VnbWVudGF0aW9uIGZhdWx0IChleHBl
Y3RlZCkuDQo+DQo+IEJ1dCB3aGVuIG15IFFUNSBiYXNlZCBhcHBsaWNhdGlvbiByZWNlaXZlZCBT
SUdTRUdWLCB0aGVuIG5vIGNvcmUgZHVtcCBpcw0KPiBnZW5lcmF0ZWQuIEl0IGRpZXMgd2l0aG91
dCAiU2VnbWVudGF0aW9uIGZhdWx0IiBtZXNzYWdlIG9uIHN0ZG91dC4NCj4NCj4gVG8gZGVidWcg
dGhpcyBmdXJ0aGVyLCBJIGFkZGVkIG51bGxwdHIgZGVyZWZlcmVuY2UgaW4gbXkgYXBwbGljYXRp
b24gbWFpbigpDQo+IGJlZm9yZSBRQXBwbGljYXRpb24gb2JqZWN0IGlzIGNyZWF0ZWQgYW5kIHdo
ZW4gZXhlY3V0ZWQsIGNvcmUgZHVtcCB3YXMNCj4gY3JlYXRlZC4NCj4gV2hlbiBJIG1vdmVkIG51
bGxwdHIgZGVyZWZlcmVuY2UgYWZ0ZXIgUUFwcGxpY2F0aW9uIG9iamVjdCBpcyBjcmVhdGVkLCB0
aGVuDQo+IG5vIGNvcmUgZHVtcCB3YXMgY3JlYXRlZC4gQXBwbGljYXRpb24gZGllZCB3aXRob3V0
IGFueSBtZXNzYWdlLg0KPg0KPiBTbyBpdCBzZWVtcyBRVCBpcyBoYW5kbGluZyBTSUdTRUdWIGFu
ZCBub3QgYWxsb3dpbmcgdG8gY3JlYXRlIGNvcmUgZHVtcC4NCj4NCj4gSXMgaXQgZXhwZWN0ZWQg
PyBJIGJlbGlldmUgbm90LiBXaGF0IHdyb25nIGFtIEkgZG9pbmcgYW5kIGhvdyB0byBmaXggdGhp
cyA/DQo+DQo+IHRoYW5rcw0KPiBBbmt1cg0KPiAtLQ0KPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXw0KPiBPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBs
aXN0DQo+IE9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+IGh0dHA6
Ly9saXN0cy5vcGVuZW1iZWRkZWQub3JnL21haWxtYW4vbGlzdGluZm8vb3BlbmVtYmVkZGVkLWRl
dmVsDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4gT3BlbmVtYmVkZGVkLWRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3RzLm9wZW5lbWJlZGRlZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCj4NCi0tIA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18NCk9wZW5lbWJlZGRlZC1kZXZl
bCBtYWlsaW5nIGxpc3QNCk9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL29wZW5lbWJl
ZGRlZC1kZXZlbA0K

