Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.3098.1613700130514286707
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Feb 2021 18:02:11 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: J/F6ynCAUWj+12qEhsP6XYwlK4MwYvbvigv8U22jlIbGREYdqjddRths2vAa7K+RiE+DLHkSCD
 N+7BO9r/47Dg==
X-IronPort-AV: E=McAfee;i="6000,8403,9899"; a="171386500"
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="171386500"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2021 18:02:09 -0800
IronPort-SDR: uVBIj2Pr0de6zL7PwIC2UR+GbqAnAd13KoKJ4tIKjOcgI8ReBVi4mfzv4S3SEh+KLHkwEpdXQU
 dd37FuWUyjWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,187,1610438400"; 
   d="scan'208";a="362769493"
Received: from kmsmsx603.gar.corp.intel.com ([172.21.219.143])
  by orsmga003.jf.intel.com with ESMTP; 18 Feb 2021 18:02:07 -0800
Received: from pgsmsx601.gar.corp.intel.com (10.108.199.136) by
 kmsmsx603.gar.corp.intel.com (172.21.219.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 19 Feb 2021 10:02:06 +0800
Received: from pgsmsx601.gar.corp.intel.com ([10.108.199.136]) by
 pgsmsx601.gar.corp.intel.com ([10.108.199.136]) with mapi id 15.01.2106.002;
 Fri, 19 Feb 2021 10:02:06 +0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: "Rahul.Taya@kpit.com" <Rahul.Taya@kpit.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "nisha.parrakat@kpit.com" <nisha.parrakat@kpit.com>,
	"harpritkaur.bhandari@kpit.com" <harpritkaur.bhandari@kpit.com>
Subject: Re: [oe] [meta-python2][dunfell][PATCH] python: Add fix for CVE-2019-9674
Thread-Topic: [oe] [meta-python2][dunfell][PATCH] python: Add fix for
 CVE-2019-9674
Thread-Index: AQHXBgDhr0HTZCzdoEyZ3I3fHBJt1KpeNFQA
Date: Fri, 19 Feb 2021 02:02:06 +0000
Message-ID: <35a621b6fbc2297e4ee7508aaaeaae60d67eb441.camel@intel.com>
References: <20210216152349.30824-1-Rahul.Taya@kpit.com>
In-Reply-To: <20210216152349.30824-1-Rahul.Taya@kpit.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.108.32.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <FF9271CFD1416D40BB9F2A82250277D2@intel.com>
Content-Transfer-Encoding: base64

T24gVHVlLCAyMDIxLTAyLTE2IGF0IDIwOjUzICswNTMwLCBSYWh1bCBUYXlhIHdyb3RlOg0KPiAr
KiBicG8tMzYyNjA6IEFkZCBwaXRmYWxscyB0byB6aXBmaWxlIG1vZHVsZSBkb2N1bWVudGF0aW9u
DQo+ICsNCj4gK1dlIHNhdyB2dWxuZXJhYmlsaXR5IHdhcm5pbmcgZGVzY3JpcHRpb24gKGluY2x1
ZGluZyB6aXAgYm9tYikgaW4NCj4gRG9jL2xpYnJhcnkveG1sLnJzdCBmaWxlLg0KPiArVGhpcyBn
YXZlIHVzIHRoZSBpZGVhIG9mIGRvY3VtZW50YXRpb24gaW1wcm92ZW1lbnQuDQo+ICsNCj4gK1Nv
LCB3ZSBtb3ZlZCBhIGxpdHRsZSBiaXQgZm9yd2FyZCA6UA0KPiArQW5kIHRoZSBkb2MgcGF0Y2gg
Y2FuIGJlIGZvdW5kIChwcikuDQo+ICsNCj4gKyogZml4IHRyYWlsaW5nIHdoaXRlc3BhY2UNCj4g
Kw0KPiArKiDwn5Oc8J+kliBBZGRlZCBieSBibHVyYl9pdC4NCj4gKw0KPiArKiBSZWZvcm1hdCB0
ZXh0IGZvciBjb25zaXN0ZW5jeS4NCj4gKw0KPiArVXBzdHJlYW0tU3RhdHVzOg0KPiBCYWNrcG9y
dFsNCj4gaHR0cDovL2FyY2hpdmUudWJ1bnR1LmNvbS91YnVudHUvcG9vbC9tYWluL3AvcHl0aG9u
My41L3B5dGhvbjMuNV8zLjUuMi0ydWJ1bnR1MH4xNi4wNC4xMi5kZWJpYW4udGFyLnh6DQo+IF0N
Cg0KSXQgbG9va3MgbGlrZSB0aGlzIGlzIGp1c3QgYSBkb2N1bWVudGF0aW9uIGNoYW5nZSB0aGF0
IGlzIGNoYW5naW5nIGENCmZpbGUgdGhhdCBJIGRvbid0IHRoaW5rIHdlIHBhY2thZ2UuIElzIHRo
aXMgc29tZXRoaW5nIHRoYXQgd2Ugc2hvdWxkDQpjYXJlIGFib3V0Pw0KDQpUaGFua3MsDQoNCkFu
dWoNCg0K
