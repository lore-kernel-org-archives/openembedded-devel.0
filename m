Return-Path: <ismo.puustinen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7B0CD71C1F
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 21:46:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 14:46:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="271490106"
Received: from irsmsx108.ger.corp.intel.com ([163.33.3.3])
	by fmsmga004.fm.intel.com with ESMTP; 07 Jun 2017 14:46:23 -0700
Received: from irsmsx107.ger.corp.intel.com ([169.254.10.129]) by
	IRSMSX108.ger.corp.intel.com ([169.254.11.133]) with mapi id
	14.03.0319.002; Wed, 7 Jun 2017 22:46:22 +0100
From: "Puustinen, Ismo" <ismo.puustinen@intel.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Thread-Topic: [oe] [PATCH] opencv: fix compilation error when OpenCL is
	enabled.
Thread-Index: AQHS3354+t/xtSTvRkijnes6SdIbJ6IZhGuAgABpoPA=
Date: Wed, 7 Jun 2017 21:46:22 +0000
Message-ID: <CCDEB7C6A88959479C736E89D8E0ADC78ED91D5E@IRSMSX107.ger.corp.intel.com>
References: <20170607110854.5275-1-ismo.puustinen@intel.com>
	<1496852475.26945.134.camel@linux.intel.com>
In-Reply-To: <1496852475.26945.134.camel@linux.intel.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 10.0.102.7
dlp-reaction: no-action
x-originating-ip: [163.33.239.182]
MIME-Version: 1.0
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] opencv: fix compilation error when OpenCL is enabled.
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
X-List-Received-Date: Wed, 07 Jun 2017 21:46:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+IFRoZSBwYXRjaCB3aGljaCBjaGFuZ2VzIHRlc3QgbW9kdWxlIGZ1bmN0aW9uIHZpc2lsaWJp
bGl0eSB3YXMgbWlzc2luZw0KPiA+IHNvbWUgT3BlbkNMIHN5bWJvbHMuIEV4cG9ydCBhbHNvIHRo
b3NlLg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSXNtbyBQdXVzdGluZW4gPGlzbW8ucHV1c3Rp
bmVuQGludGVsLmNvbT4NCj4gPiAtLS0NCj4gPiAgLi4uL29wZW5jdi8wMDAxLVRvLWZpeC1lcnJv
cnMtYXMtZm9sbG93aW5nLnBhdGNoICAgfCA0MQ0KPiArKysrKysrKysrKysrKysrKystLS0tDQo+
ID4gIDEgZmlsZSBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPiA+
DQo+IA0KPiBubyBiYiBjaGFuZ2UgdG8gaW5jbHVkZSB0aGlzIHBhdGNoPw0KDQpObywgSSBhbWVu
ZGVkIHRoZSBhbHJlYWR5LXN1Ym1pdHRlZCBwYXRjaCAoZnJvbSAyZTZkNjJmZDQ3YjllNmE4NTkx
NzVlYzU1MjFmNmNlMjUwNWY0YjIzKS4gVGhhdCBwYXRjaCB3YXMganVzdCBtaXNzaW5nIHR3byBv
ciB0aHJlZSBzeW1ib2xzIHdoaWNoIHdlcmUgbm90IGV4cG9ydGVkLCBhbmQgYWxsIHRoZSBjaGFu
Z2VzIHNlZW1lZCB0byBiZWxvbmcgaW50byBvbmUgcGF0Y2guDQoNCkkgY2FuIGFsc28ganVzdCBh
ZGQgYW5vdGhlciBwYXRjaCBpZiBpdCBzZWVtcyBhIGJldHRlciBhcHByb2FjaCBhbmQgYWRkIGl0
IHRvIHRoZSByZWNpcGUuIEkgd2FzIGp1c3QgdGhpbmtpbmcgdGhhdCBpdCB3b3VsZCBiZSBjbGVh
bmVyIHRvIGRvIGl0IHdpdGgganVzdCBvbmUgcGF0Y2guDQoNCklzbW8NCg==

