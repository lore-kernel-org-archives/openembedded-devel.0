Return-Path: <Mike.Nicholson@viavisolutions.com>
X-Greylist: delayed 5481 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 30 Jan 2017 21:54:50 UTC
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam02on0114.outbound.protection.outlook.com [104.47.36.114])
	by mail.openembedded.org (Postfix) with ESMTP id 39AE86007A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2017 21:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=viavisolutions.onmicrosoft.com; s=selector1-viavisolutions-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=voqXTrD2OVZJ87q8C9rOEtsUUc/VedsHE59bznZu2I8=;
	b=uiOa62bJyd8Fe5SO+ebTsBAqCimp2QQYFtbcbYSeekWblp+1Ig38M+8+vK2sdq3vlzgcHIjQ5jGPv426ju0Tg6hsN5EKOsJe9wkf64BBRGT2rMkismbid+HBhJo/keKFtvN62NCPZAxIfFSeLG16uLinX+qWKSdZyHw86qaVmgE=
Received: from MWHPR18MB1535.namprd18.prod.outlook.com (10.173.243.141) by
	MWHPR18MB1533.namprd18.prod.outlook.com (10.173.243.139) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
	15.1.874.12; Mon, 30 Jan 2017 20:23:28 +0000
Received: from MWHPR18MB1535.namprd18.prod.outlook.com ([10.173.243.141]) by
	MWHPR18MB1535.namprd18.prod.outlook.com ([10.173.243.141]) with mapi id
	15.01.0874.019; Mon, 30 Jan 2017 20:23:28 +0000
From: Mike Nicholson <Mike.Nicholson@viavisolutions.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-qt5]  populate_sdk_ext fails
Thread-Index: AQHSeza3StUu0s7lgkSN8dinj1LB5Q==
Date: Mon, 30 Jan 2017 20:23:28 +0000
Message-ID: <F44878C7-F939-43ED-A849-F9392C7B604D@viavisolutions.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Mike.Nicholson@viavisolutions.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [38.140.22.3]
x-ms-office365-filtering-correlation-id: 4efba5a3-8582-4192-e5a6-08d4494dd9e7
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:(22001);SRVR:MWHPR18MB1533;
x-microsoft-exchange-diagnostics: 1; MWHPR18MB1533;
	7:RLYHckqCvWGayr8P8DCwmnoPCVNAkdL8/I162+ZAFN/1Ro1VGnkvohjWp63BOWnd5ayUC4kBeOn6/9vG1mFRZHlSGffYrdiq0DJDq911C1aD0y8hEo9YepSg5vockkxS/ww5eO/7+GLKfOeqNVKs4yjWH2fkyXHLQubgf78B1shwaaVyxhM8xF2n/GNeCLhyFIBpg9QJGf/Z44Woz03QU/gKsj65TSOa2zYybnjjSYizE3YCT6r8TyEUrRkqHypqN0eEGu+JFeoadWhkBBxuySdEE7goLbn+NkhCkzCXGxtkqyOhzm0oit2k0IFKiffiDiHXPipCIInIImiMHAbpRU3ZPEOJyeoCyPZ75ZqcOKTT8iTR1CQ/b6PRFAMQBxzMxtqZ8/iMCOxRTjDiv5C2m2kBlcll4WRw+qJ50k83pvjF85ikgrdCFETwiTg0kUWjJQU2hKnYuJaGp+M5gvV/9A==
x-microsoft-antispam-prvs: <MWHPR18MB153398164FDA938FC07F852EE74B0@MWHPR18MB1533.namprd18.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(166708455590820)(5213294742642);
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(6040375)(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026)(6041248)(20161123564025)(20161123560025)(20161123555025)(20161123562025)(6072148);
	SRVR:MWHPR18MB1533; BCL:0; PCL:0; RULEID:; SRVR:MWHPR18MB1533; 
x-forefront-prvs: 0203C93D51
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(6009001)(7916002)(39860400002)(39840400002)(39850400002)(39410400002)(39450400003)(504964003)(199003)(189002)(8936002)(3846002)(33656002)(102836003)(81156014)(81166006)(6116002)(2351001)(106116001)(305945005)(106356001)(6506006)(54356999)(7736002)(101416001)(8676002)(6436002)(2501003)(3280700002)(82746002)(105586002)(2906002)(66066001)(110136003)(6916009)(5640700003)(25786008)(5660300001)(122556002)(53936002)(3660700001)(50986999)(38730400001)(92566002)(68736007)(450100001)(6512007)(2900100001)(97736004)(189998001)(6306002)(107886002)(83716003)(77096006)(6486002)(99286003)(86362001)(36756003)(104396002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR18MB1533;
	H:MWHPR18MB1535.namprd18.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
received-spf: None (protection.outlook.com: viavisolutions.com does not
	designate permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: viavisolutions.com
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2017 20:23:28.0212 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c44ec86f-d007-4b6c-8795-8ea75e4a6f9b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR18MB1533
Subject: [meta-qt5] populate_sdk_ext fails
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
X-List-Received-Date: Mon, 30 Jan 2017 21:54:51 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <E955FAED42202443BD08C49A22EC303A@namprd18.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkkgc2VudCB0aGUgZm9sbG93aW5nIHRoZSB0aGUgb3BlbmVtYmVkZGVkLWlzc3Vl
cyBlbWFpbCBsaXN0IGxhc3QgbW9udGggd2l0aCBubyByZXNwb25zZS4gIEkgd2FudGVkIHRvIGZv
bGxvdyB1cCB3aXRoIG9wZW5lbWJlZGRlZC1kZXZlbCBpbiBjYXNlIOKAmGlzc3Vlc+KAmSB3YXNu
4oCZdCB0aGUgcmlnaHQgbWFpbGluZyBsaXN0Lg0KDQpJ4oCZbSBhdHRlbXB0aW5nIHRvIGdlbmVy
YXRlIGFuIGV4dGVuc2libGUgU0RLIHRoYXQgaW5jbHVkZXMgdGhlIG1ldGEtcXQ1IGxheWVyLiAg
R2VuZXJhdGluZyBhIHN0YW5kYXJkIHNkayB2aWEgWW9jdG8gd29ya3MganVzdCBmaW5lIGJ1dCBn
ZW5lcmF0aW5nIHRoZSBleHRlbnNpYmxlIHNkayBmYWlscyB3aXRoIHRoZSBmb2xsb3dpbmcgZXJy
b3I6DQogDQp8IE5PVEU6IEV4ZWN1dGluZyBjcmVhdGVfc2RrX2ZpbGVzIC4uLg0KfCBERUJVRzog
RXhlY3V0aW5nIHNoZWxsIGZ1bmN0aW9uIGNyZWF0ZV9zZGtfZmlsZXMNCnwgdG91Y2g6IGNhbm5v
dCB0b3VjaCAnL2hvbWUvbmljNDcyMjIvUHJvamVjdHMvdmlhdmktcGxhdGZvcm0vdmlhdmktYnNw
L2J1aWxkL3RtcC93b3JrL210cy1wb2t5LWxpbnV4LWdudWVhYmkvdmlhdmktaW1hZ2UtcXQ1LzEu
MC1yMC9zZGstZXh0L2ltYWdlLy9vcHQvcG9reS8yLjEuMS9zeXNyb290cy94ODZfNjQtcG9reXNk
ay1saW51eC91c3IvYmluL3F0NS9xdC5jb25mJzogTm8gc3VjaCBmaWxlIG9yIGRpcmVjdG9yeQ0K
IA0KSXQgYXBwZWFycyB0aGF0IGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL21ldGEtcXQ1L21ldGEt
cXQ1L2Jsb2IvOWFhODcwZWVjZjZkYzdhODc2NzgzOTNiZDU1Yjk3ZTIxMDMzYWI0OC9jbGFzc2Vz
L3BvcHVsYXRlX3Nka19xdDVfYmFzZS5iYmNsYXNzI0w3IHRoZSBkaXJlY3RvcnkgdGhhdCBzaG91
bGQgY29udGFpbiB0aGUgcXQuY29uZiBmaWxlIGRvZXMgbm90IGV4aXN0Lg0KIA0KQXJlIHRoZXJl
IGtub3duIGlzc3VlcyB3aXRoIHRoZSBwb3B1bGF0ZV9zZGtfZXh0IGNvbW1hbmQgYW5kIHRoZSBt
ZXRhLXF0NSBsYXllcj8NCiANCkkgY2FuIGdldCBnZW5lcmF0ZSB0aGUgZXh0ZW5zaWJsZSBTREsg
anVzdCBmaW5lIGlmIEkgbWFrZSB0aGUgZm9sbG93aW5nIGNoYW5nZXM6DQogDQpkaWZmIC0tZ2l0
IGEvY2xhc3Nlcy9wb3B1bGF0ZV9zZGtfcXQ1X2Jhc2UuYmJjbGFzcyBiL2NsYXNzZXMvcG9wdWxh
dGVfc2RrX3F0NV9iYXNlLmJiY2xhc3MNCmluZGV4IGI2Y2U1OTYuLmI2NmZlMjUgMTAwNjQ0DQot
LS0gYS9jbGFzc2VzL3BvcHVsYXRlX3Nka19xdDVfYmFzZS5iYmNsYXNzDQorKysgYi9jbGFzc2Vz
L3BvcHVsYXRlX3Nka19xdDVfYmFzZS5iYmNsYXNzDQpAQCAtNCw2ICs0LDcgQEAgaW5oZXJpdCBx
bWFrZTVfcGF0aHMNCmNyZWF0ZV9zZGtfZmlsZXNfcHJlcGVuZCAoKSB7DQogICAgICMgR2VuZXJh
dGUgYSBxdC5jb25mIGZpbGUgdG8gYmUgZGVwbG95ZWQgd2l0aCB0aGUgU0RLDQogICAgIHF0Y29u
Zj0ke1NES19PVVRQVVR9LyR7U0RLUEFUSE5BVElWRX0ke09FX1FNQUtFX1BBVEhfSE9TVF9CSU5T
fS9xdC5jb25mDQorICAgIG1rZGlyIC1wICR7U0RLX09VVFBVVH0vJHtTREtQQVRITkFUSVZFfSR7
T0VfUU1BS0VfUEFUSF9IT1NUX0JJTlN9DQogICAgIHRvdWNoICRxdGNvbmYNCiAgICAgZWNobyAn
W1BhdGhzXScgPj4gJHF0Y29uZg0KICAgICBlY2hvICdQcmVmaXggPSAke09FX1FNQUtFX1BBVEhf
UFJFRklYfScgPj4gJHF0Y29uZg0KLS0NCjIuNy40DQogDQogDQpUaGFuayB5b3UgaW4gYWR2YW5j
ZSBmb3IgYW55IGhlbHAuDQoNCg0K

