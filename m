Return-Path: <sander.visser.2@consultant.volvo.com>
Received: from mail-gw3.it.volvo.com (mail-gw3.it.volvo.com [192.138.110.232])
	by mail.openembedded.org (Postfix) with ESMTP id 77F187DAC4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:26:23 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.60,397,1549926000"; d="scan'208";a="1035391643"
From: "Visser Sander (2) (Consultant)" <sander.visser.2@consultant.volvo.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Python3 in sumo+thud does not package sha1 support in crypt
Thread-Index: AdT7YpXlzjKvlA/qT9aMXSkfHSkIwgABtVaAADJtHSA=
Date: Fri, 26 Apr 2019 13:26:21 +0000
Message-ID: <HE1PR05MB46355B6713A3451E9021BA7EC53E0@HE1PR05MB4635.eurprd05.prod.outlook.com>
References: <HE1PR05MB46350C84FDF6E1F7F6C448D8C53D0@HE1PR05MB4635.eurprd05.prod.outlook.com>
	<9c2be11a-2877-5059-35c3-58abc0d34f7b@gmail.com>
In-Reply-To: <9c2be11a-2877-5059-35c3-58abc0d34f7b@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=sander.visser.2@consultant.volvo.com; 
x-originating-ip: [199.247.36.90]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2869d847-cef2-44c0-d6cd-08d6ca4ac62a
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600141)(711020)(4605104)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:HE1PR05MB4523; 
x-ms-traffictypediagnostic: HE1PR05MB4523:
x-microsoft-antispam-prvs: <HE1PR05MB45234EA8E05CEC7F479105BEC53E0@HE1PR05MB4523.eurprd05.prod.outlook.com>
x-forefront-prvs: 001968DD50
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(136003)(346002)(366004)(376002)(39860400002)(396003)(13464003)(199004)(189003)(8676002)(26005)(52536014)(71200400001)(68736007)(6246003)(33656002)(2906002)(9686003)(6436002)(55016002)(74316002)(7696005)(476003)(486006)(25786009)(229853002)(2501003)(5660300002)(81166006)(81156014)(7736002)(305945005)(8936002)(446003)(11346002)(53546011)(478600001)(6116002)(3846002)(97736004)(102836004)(86362001)(14454004)(66946007)(73956011)(316002)(64756008)(66556008)(66476007)(66446008)(5024004)(14444005)(71190400001)(186003)(76176011)(76116006)(66066001)(110136005)(256004)(53936002)(99286004)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:HE1PR05MB4523;
	H:HE1PR05MB4635.eurprd05.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:0; MX:1; 
received-spf: None (protection.outlook.com: consultant.volvo.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: uW3bnCkmi834goxe6s14sgoHgbQw68uFVR4YGsk/NhHRIN8HN+qpZZcr2euU8vbrI1wWXxh8W+wGr6H1dLppztfGhKRjkBGyid/53X3vXYXadGKVm1EWtkn87omaxj3stYmDQ4iINYefnLn6fHXWTGZ2IImBzFE6I1YhRvGDhy5qNOWuF2F+EcWFBpjUNsu3ngNrJ23nASiOLwV4NJeWNQ1s1bqa7yQJSZfuF6J2TSBF+YO6NbKLwV1sGRyDDNxDpizIv9FU7Rnva22Y2Qhm3pWlHWZsPNPus5Qi1kn8vginm39HJrzhlyQG10Rn7aPI6V18f6WJT+Uif+0YA5DvrsxemAcHxRI+wnkQ0es8MR5kl5x1iSPjUgKFNmU180XF/bvYzC6Bb4EYv1qruakio3TALsEwIT4cIMtSWJh3e6U=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2869d847-cef2-44c0-d6cd-08d6ca4ac62a
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2019 13:26:21.8619 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f25493ae-1c98-41d7-8a33-0be75f5fe603
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR05MB4523
X-OriginatorOrg: consultant.volvo.com
Subject: Re: Python3 in sumo+thud does not package sha1 support in crypt
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
X-List-Received-Date: Fri, 26 Apr 2019 13:26:24 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UGF0Y2ggc3VibWl0dGVkLiBUZXN0ZWQgZm9yIHN1bW8gdG8gcmVtb3ZlIGNyeXB0IHJlbGF0ZWQg
LnNvIGZyb20gcHl0aG9uMy1taXNjDQoNCkJUVy4gSWYgSSB3YW50IHRvIG92ZXJyaWRlIHRoZSBw
eXRob24zLW1hbmlmZXN0Lmpzb24gcGFydCBvZiB0aGUgcHl0aG9uMyByZWNpcGU7IGhvdyBjYW4g
SSBkbyB0aGF0Pw0KDQpJIGF0dGVtcHRlZCB0byBhZGQgYSBjdXN0b20gcHl0aG9uMy1tYW5pZmVz
dC5qc29uIGluIG15IGN1c3RvbSBsYXllciB0aGF0IGhhcyBoaWdoZXIgcHJvcCB0aGFuIHBva3ku
IEkgb2JzZXJ2ZSB0aGF0IG15IGpzb24gaXMgaW5zdGFsbGVkIHRvIHRoZSAkV09SS1NQQUNFLCBi
dXQgcGFja2FnZSBzcGxpdHRpbmcgaXMgc3RpbGwgZG9uZSB1c2luZyB0aGUgLmpzb24gZnJvbSBw
b2t5IG1ldGEgbGF5ZXIuLi4NCg0KL1JlZ2FyZHMgU2FuZGVyDQoNCi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQpGcm9tOiBha3VzdGVyODA4IFttYWlsdG86YWt1c3RlcjgwOEBnbWFpbC5jb21d
IA0KU2VudDogZGVuIDI1IGFwcmlsIDIwMTkgMzoxOQ0KVG86IFZpc3NlciBTYW5kZXIgKDIpIChD
b25zdWx0YW50KTsgb3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNClN1
YmplY3Q6IFJlOiBbb2VdIFB5dGhvbjMgaW4gc3Vtbyt0aHVkIGRvZXMgbm90IHBhY2thZ2Ugc2hh
MSBzdXBwb3J0IGluIGNyeXB0DQoNCg0KDQpPbiA0LzI1LzE5IDU6MzEgQU0sIFZpc3NlciBTYW5k
ZXIgKDIpIChDb25zdWx0YW50KSB3cm90ZToNCj4gSGkNCj4NCj4gSXQgc2VlbXMgIiR7bGliZGly
fS9weXRob24ke1BZVEhPTl9NQUpNSU59L2xpYi1keW5sb2FkL19zaGExLiouc28iIGlzIG1pc3Np
bmcgaW4gc3VtbyBhbmQgdGh1ZC4gSXQgaXMgbGlzdGVkIGluIHJvY2tvICh2aWEgc2hhKikgYW5k
IGluIHdhcnJpb3IgdmlhIF9zaGExLiouc28NCj4NCj4gV291bGQgYSBwYXRjaCB0b3dhcmRzIHRo
dWQvc3VtbyBiZSBhY2NlcHRlZCB3aGVyZSBfc2hhMS4qLnNvIGlzIGFkZGVkIHRvIHRoZSBjcnlw
dCBmaWxlcz8NClllcw0KDQotIEFybWluDQo+DQo+IC9SZWdhcmRzIFNhbmRlcg0KPg0KPiBUaGlz
IGVtYWlsIG1lc3NhZ2UgYW5kIGFueSBhdHRhY2htZW50cyBtYXkgY29udGFpbiBjb25maWRlbnRp
YWwgaW5mb3JtYXRpb24gYW5kIG1heSBiZSBwcml2aWxlZ2VkLiBJZiB5b3UgYXJlIG5vdCB0aGUg
aW50ZW5kZWQgcmVjaXBpZW50IG9yIG90aGVyd2lzZSBub3QgYXV0aG9yaXplZCB0byByZWNlaXZl
IHRoaXMgbWVzc2FnZSwgeW91IGFyZSBwcm9oaWJpdGVkIHRvIHVzZSwgY29weSwgZGlzY2xvc2Ug
b3IgdGFrZSBhbnkgYWN0aW9uIGJhc2VkIG9uIHRoaXMgZW1haWwgb3IgYW55IGluZm9ybWF0aW9u
IGNvbnRhaW5lZCBoZXJlaW4uIElmIHlvdSBhcmUgbm90IHRoZSBpbnRlbmRlZCByZWNpcGllbnQs
IHBsZWFzZSBhZHZpc2UgdGhlIHNlbmRlciBpbW1lZGlhdGVseSBieSByZXBseWluZyB0byB0aGlz
IGVtYWlsIGFuZCBwZXJtYW5lbnRseSBkZWxldGUgdGhpcyBtZXNzYWdlIGFuZCBhbnkgYXR0YWNo
bWVudHMgZnJvbSB5b3VyIHN5c3RlbS4NCg0K

