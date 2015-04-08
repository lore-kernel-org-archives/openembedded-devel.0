Return-Path: <neena.busireddy@freescale.com>
X-Greylist: delayed 4135 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 08 Apr 2015 19:38:49 UTC
Received: from na01-by2-obe.outbound.protection.outlook.com
	(mail-by2on0116.outbound.protection.outlook.com [207.46.100.116])
	by mail.openembedded.org (Postfix) with ESMTP id 9DC9660097
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 19:38:49 +0000 (UTC)
Received: from BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) by
	BLUPR03MB181.namprd03.prod.outlook.com (10.255.212.146) with Microsoft
	SMTP Server (TLS) id 15.1.136.17; Wed, 8 Apr 2015 19:38:49 +0000
Received: from BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) by
	BLUPR03MB471.namprd03.prod.outlook.com (10.141.78.145) with Microsoft
	SMTP Server (TLS) id 15.1.136.17; Wed, 8 Apr 2015 19:38:48 +0000
Received: from BLUPR03MB471.namprd03.prod.outlook.com ([10.141.78.145]) by
	BLUPR03MB471.namprd03.prod.outlook.com ([10.141.78.145]) with mapi id
	15.01.0136.014; Wed, 8 Apr 2015 19:38:48 +0000
From: Neena Busireddy <neena.busireddy@freescale.com>
To: Otavio Salvador <otavio@ossystems.com.br>, OpenEmbedded Devel List
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt5][PATCH] qt5nmapper: Fix compatibility issue
Thread-Index: AQHQcioDBZa7njxRG06z67fFr3UTgJ1DgZoAgAAAoFA=
Date: Wed, 8 Apr 2015 19:38:48 +0000
Message-ID: <BLUPR03MB4713F89812901BF3F393852F5FC0@BLUPR03MB471.namprd03.prod.outlook.com>
References: <1428517786-17717-1-git-send-email-neena.busireddy@freescale.com>
	<CAP9ODKo-Tj103XpkUVTrodpgkXdHDXOA4+ZZHtx3jQyv2a+xUg@mail.gmail.com>
In-Reply-To: <CAP9ODKo-Tj103XpkUVTrodpgkXdHDXOA4+ZZHtx3jQyv2a+xUg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ossystems.com.br; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [192.88.168.50]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB471;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BLUPR03MB181; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(51704005)(377454003)(51914003)(24454002)(102836002)(15975445007)(92566002)(74316001)(99286002)(2656002)(87936001)(50986999)(54356999)(77096005)(122556002)(62966003)(2900100001)(2950100001)(40100003)(77156002)(46102003)(19580405001)(15395725005)(33656002)(16601075003)(575784001)(76176999)(66066001)(76576001)(107886001)(86362001)(19580395003)(106116001)(32563001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BLUPR03MB471;
	H:BLUPR03MB471.namprd03.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BLUPR03MB471E4389E6D002C6BBE25ABF5FC0@BLUPR03MB471.namprd03.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BLUPR03MB471; BCL:0;
	PCL:0; RULEID:; SRVR:BLUPR03MB471; 
x-forefront-prvs: 0540846A1D
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2015 19:38:48.5760 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 710a03f5-10f6-4d38-9ff4-a80b81da590d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLUPR03MB471
X-OriginatorOrg: freescale.com
Subject: Re: [meta-qt5][PATCH] qt5nmapper: Fix compatibility issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 Apr 2015 19:38:49 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgT3RhdmlvLA0KDQpPbiBXZWQsIEFwciA4LCAyMDE1IGF0IDM6MjkgUE0sIE5lZW5hIEJ1c2ly
ZWRkeSA8bmVlbmEuYnVzaXJlZGR5QGZyZWVzY2FsZS5jb20+IHdyb3RlOg0KPiBxdDVubWFwcGVy
IGFwcCBmYWlscyB0byBydW4gd2l0aCB0aGUgZm9sbG93aW5nIGVycm9yOg0KPg0KPiBmaWxlOi8v
L3Vzci9zaGFyZS9xdDVubWFwcGVyLTEuMC9RdDVfTk1hcHBlci5xbWw6MzQ6NTogVHlwZSBQYW5l
bCB1bmF2YWlsYWJsZQ0KPiAgICAgICAgICBQYW5lbCB7DQo+ICAgICAgICAgIF4NCj4gZmlsZTov
Ly91c3Ivc2hhcmUvcXQ1bm1hcHBlci0xLjAvY29udGVudC9QYW5lbC5xbWw6MTE4Ojk6IFR5cGUg
U3dpdGNoIHVuYXZhaWxhYmxlDQo+ICAgICAgICAgICAgICBTd2l0Y2ggew0KPiAgICAgICAgICAg
ICAgXg0KPiBmaWxlOi8vL3Vzci9zaGFyZS9xdDVubWFwcGVyLTEuMC9jb250ZW50L1N3aXRjaC5x
bWw6ODoyMTogQ2Fubm90IGFzc2lnbiBhIHZhbHVlIHRvIGEgc2lnbmFsIChleHBlY3RpbmcgYSBz
Y3JpcHQgdG8gYmUgcnVuKQ0KPiAgICAgICAgICBwcm9wZXJ0eSBzdHJpbmcgb25UZXh0OiAiT24i
DQo+DQo+IFRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUgc3RyaW5nIGZyb20gb25UZXh0IHRvIG9uVGV4
dHN0cmluZyB3aGljaCB3YXMgDQo+IGludHJvZHVjZWQgd2l0aCBRdCA1LjMNCj4NCj4gU2lnbmVk
LW9mZi1ieTogTmVlbmEgQnVzaXJlZGR5IDxuZWVuYS5idXNpcmVkZHlAZnJlZXNjYWxlLmNvbT4N
Ci4uLg0KDQpUaGUgcGF0Y2ggZmlsZSBuZWVkcyB0byBoYXZlIHRoZSBVcHN0cmVhbS1TdGF0dXMg
ZmllbGQuIEkgdGhpbmsgaXQgd291bGQgYmUgUGVuZGluZy4NCg0KQWdyZWVkLg0KDQouLi4NCj4g
LS0tIGEvcmVjaXBlcy1xdC9leGFtcGxlcy9xdDVubWFwcGVyXzEuMC5iYg0KPiArKysgYi9yZWNp
cGVzLXF0L2V4YW1wbGVzL3F0NW5tYXBwZXJfMS4wLmJiDQo+IEBAIC02LDcgKzYsOCBAQCBMSUNf
RklMRVNfQ0hLU1VNID0gDQo+ICJmaWxlOi8vUkVBRE1FO2JlZ2lubGluZT00NztlbmRsaW5lPTU4
O21kNT05ZmI1YmY3NmQ1NjRiYzUzODENCj4NCj4gIERFUEVORFMgPSAicXRkZWNsYXJhdGl2ZSBx
dGdyYXBoaWNhbGVmZmVjdHMiDQo+DQo+IC1TUkNfVVJJID0gImh0dHA6Ly9xdWl0Y29kaW5nLmNv
bS9kb3dubG9hZC9RdDVfTk1hcHBlcl8xLjAudGd6Ig0KPiArU1JDX1VSSSA9ICJodHRwOi8vcXVp
dGNvZGluZy5jb20vZG93bmxvYWQvUXQ1X05NYXBwZXJfMS4wLnRneiBcDQo+ICsgICAgICAgICAg
IGZpbGU6Ly9jaGFuZ2UtcHJvcGVydHktc3RyaW5nLnBhdGNoIg0KPiAgU1JDX1VSSVttZDVzdW1d
ID0gImRhZmM0MjUyODAxNDRkOGUyODY3ODhlNzVhMGRiYTBmIg0KPiAgU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYwN2ZiZjRjNDQ4ZjAwZDNjNTYzZjllZjhhNTgyYmNiNmU4ZmU1NTBlODBiNTZiZjhk
OTEyN2E0MTdmYWE1M2IiDQoNCk90aGVyIHRoYW4gdGhlIC5wYXRjaCBtaXNzaW5nIGZpZWxkLCBp
dCBpcyBmaW5lLg0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjayBhbmQgVjIgdmVyc2lvbiBpcyBv
biB0aGUgd2F5Lg0KDQotLSANCk90YXZpbyBTYWx2YWRvciAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgTy5TLiBTeXN0ZW1zDQpodHRwOi8vd3d3Lm9zc3lzdGVtcy5jb20uYnIgICAgICAgIGh0
dHA6Ly9jb2RlLm9zc3lzdGVtcy5jb20uYnINCk1vYmlsZTogKzU1ICg1MykgOTk4MS03ODU0ICAg
ICAgICAgICAgTW9iaWxlOiArMSAoMzQ3KSA5MDMtOTc1MA0K

