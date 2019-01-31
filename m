Return-Path: <dan.callaghan@opengear.com>
X-Greylist: delayed 143300 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 01 Feb 2019 12:40:40 UTC
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-eopbgr740085.outbound.protection.outlook.com [40.107.74.85])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF4F7BF8B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Feb 2019 12:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qq0McjxkS8HOfkhzdhDSZUYlsUtCrIxCU1SiZOaCOBM=;
	b=ZxW/SzDe76nJkYiZRyQtCsdIgQ4iqEnX5fQRvn7gIsgrlGJWykwRbxHwuU06zAgW7OiGUDjoYS32RZEIEtuzHQcaDr++URK8AqaqARr2Y/JHoFjC5JmODKhEQ4RAiFo+KkHM2pUupZzSMBE3AJCxW+rTYNQzKBFUwqGwUK9MoIc=
Received: from BYAPR15MB3192.namprd15.prod.outlook.com (20.179.56.94) by
	BYAPR15MB2231.namprd15.prod.outlook.com (52.135.196.158) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.17; Thu, 31 Jan 2019 22:36:37 +0000
Received: from BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b]) by BYAPR15MB3192.namprd15.prod.outlook.com
	([fe80::99e0:6b82:2ac:514b%2]) with mapi id 15.20.1580.019;
	Thu, 31 Jan 2019 22:36:37 +0000
From: "Callaghan, Dan" <dan.callaghan@opengear.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-python][PATCH 2/2] python-slip-dbus: add a python3
	version of the recipe
Thread-Index: AQHUuGyC9s1xmak6AkyT0pQFSeyRKg==
Date: Thu, 31 Jan 2019 22:36:37 +0000
Message-ID: <1548974017-sup-2539@galangal.danc.bne.opengear.com>
References: <20190130072152.27331-1-dan.callaghan@opengear.com>
	<20190130072152.27331-2-dan.callaghan@opengear.com>
	<CAMKF1spFaYBgu308Xy59wWC5yksRr2Rib=gj_hN_FoM7Gh0e=w@mail.gmail.com>
In-Reply-To: <CAMKF1spFaYBgu308Xy59wWC5yksRr2Rib=gj_hN_FoM7Gh0e=w@mail.gmail.com>
Accept-Language: en-AU, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SYXPR01CA0115.ausprd01.prod.outlook.com
	(2603:10c6:0:2d::24) To BYAPR15MB3192.namprd15.prod.outlook.com
	(2603:10b6:a03:103::30)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=dan.callaghan@opengear.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [60.241.24.90]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR15MB2231;
	6:fFC6t5wiFxQYB3ZikM2yPNp5CNur2mQbLd+DRuJPralEToElMs1l/rdZmFYNiyhyOBYFuL/1NPnucvrmu8/NCzzdSLPnnK7t4fLXLLSP4hcRkY1zoZ6TYylT0OdmkZENAXQ38OKRufkiJAsGNhD9ThDzFGXb0R3K3b/vtaYsnzCJ1to8VqQBRIH7PfeuB6BkSv5pYEwvXPdI+ESuIveIiO8JhP5eAGz1LtVSO/hCiLk/FCqcgE8eNNhTkcFz3uqGdWIwRYNUbxrFz9MZJRIPS5z6ZNuToljBfIGK+MAJbCIIaYeF1DPblvsi7fYpGNGmVLZRyLjWrErSAiZdplX3p2oTroMF5676VRwdFfUa0m+hnjZDbEagwzYc0eJbUPkh9snNlB2klK/iFqdxvMtCBEmwq8KSZSVLWxfoODub3weFhAAXi4JHPriV8zlV6WvxubawN7Vw20MQzriKuprmTg==;
	5:0xsq4aMlggSXbQEInndseMkr4SL+6JQMpCDNMPIhGpnnsUeDfPUGo2btVJY0SqAWdKx+IHtbCGrZ/L3qmSnEueXEBt6ycOOVuAVBtRebh2kqirdpPxw+1nRWHfjL+ZiMAJzz6nJvZdTwHaHB343OdSisPlTEXS/ch1XefHcAlRLmllzN2w+xS+avDMCJapYB6w6zImzgyIB5zVWsjUMUfA==;
	7:c+zwyEanHKii2jjqdUSwVE1Fd1Ylk5Ysu5e4s5oXMkBBdI5jicRUk6K10IQNDYO7kpNrAMnLMaAa8Pl27m05ylf36BWnGcT9RMEWHdZjKcux1E59qpJN6kBKSEozk9egXwZA/M18N73L3Cf4Vs0OfA==
x-ms-office365-filtering-correlation-id: 2453fd74-a76e-435e-d180-08d687cc8f7d
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR15MB2231; 
X-MS-TrafficTypeDiagnostic: BYAPR15MB2231:|BYAPR15MB2231:
x-microsoft-antispam-prvs: <BYAPR15MB223133E8C3DA309BF8EE8ADB96910@BYAPR15MB2231.namprd15.prod.outlook.com>
x-forefront-prvs: 09347618C4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(39840400004)(366004)(376002)(346002)(199004)(189003)(14444005)(256004)(8676002)(6246003)(186003)(6512007)(6916009)(7736002)(446003)(39060400002)(6486002)(99286004)(6306002)(11346002)(386003)(486006)(53546011)(6436002)(14454004)(68736007)(316002)(86362001)(8936002)(6506007)(3846002)(4326008)(66066001)(76176011)(6116002)(53936002)(476003)(52116002)(26005)(305945005)(81156014)(2906002)(478600001)(229853002)(102836004)(81166006)(25786009)(106356001)(71190400001)(105586002)(71200400001)(97736004)(52400400003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR15MB2231;
	H:BYAPR15MB3192.namprd15.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: opengear.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lbAJBeXOucdDqmRFEOsrLYD2PK0iC+dFV2fuBFXFEcSTwMKolmWuJa1/UaNxD6Z6zvdqqT01jE5lGU4z++IdY5bqqd/HPZ0mxOk9KwIkF1X1Q8VS6PHWQqaB4jlZhauElGPnfSBMMZr7NUeEbouR+v+rMKd9n45ML7OTHhuV53TdPf4tg+OlDGX3gIO0I5YV5EtWCL2heVU1KbyQiNXf9A3wejkLGZiguY4LgpRwwhD6Y8obN7XMWQ2YiVijMjgAZwxU2N02npUNIVDvf07xwIdN6EMct8cNU+Ro/x0pD0DxqG/56mFO3UDdmZh3DP8tj166JaxRrYzqrAt7loWWvUytOf6qR/P6VhdVPV/3iibbywam2d5sfVzAmHawMd464y+E0xr4Gn03VlLnYwMDtKVbdaIvLAkg9kM80Dr18PQ=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 2453fd74-a76e-435e-d180-08d687cc8f7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jan 2019 22:36:36.8258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB2231
X-Microsoft-Exchange-Diagnostics: 1; BYAPR15MB2231;
	23:H+gs3sb9S7VwE7q6VVtcbjn89++brn8w17+70j/TztsG6D12nldbeJOr09fOveZqPudC8I1beJgu65ruhk0yKO4NSblz4SnooJYhWCEX4r1hthQ28YOx1nXZpdTTRvdqq3Q03js/Ps3aT+/VKATsCg==
X-OriginatorOrg: opengear.com
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 2/2] python-slip-dbus: add a python3 version of the recipe
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
X-List-Received-Date: Fri, 01 Feb 2019 12:40:41 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <80083B862BD5A041AD483EA6B4D98EB0@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64

RXhjZXJwdHMgZnJvbSBLaGVtIFJhaidzIG1lc3NhZ2Ugb2YgMjAxOS0wMS0zMSAwOToyODowMiAt
MDg6MDA6DQo+IE9uIFRodSwgSmFuIDMxLCAyMDE5IGF0IDc6NDMgQU0gQ2FsbGFnaGFuLCBEYW4N
Cj4gPGRhbi5jYWxsYWdoYW5Ab3BlbmdlYXIuY29tPiB3cm90ZToNCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IERhbiBDYWxsYWdoYW4gPGRhbi5jYWxsYWdoYW5Ab3BlbmdlYXIuY29tPg0KPiA+IC0t
LQ0KPiA+ICAuLi4vcHl0aG9uL3B5dGhvbi1zbGlwLWRidXMuaW5jICAgICAgICAgICAgICAgfCAy
OSArKysrKysrKysrKysrKysrKw0KPiA+ICAuLi4vcHl0aG9uL3B5dGhvbi1zbGlwLWRidXNfMC42
LjUuYmIgICAgICAgICAgfCAzMSArLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIC4uLi9weXRob24v
cHl0aG9uMy1zbGlwLWRidXNfMC42LjUuYmIgICAgICAgICB8ICAyICsrDQo+ID4gIDMgZmlsZXMg
Y2hhbmdlZCwgMzIgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pDQo+ID4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tc2xp
cC1kYnVzLmluYw0KPiA+ICBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1weXRob24vcmVjaXBlcy1k
ZXZ0b29scy9weXRob24vcHl0aG9uMy1zbGlwLWRidXNfMC42LjUuYmINCj4gPg0KPiANCj4gdGhp
cyBwYXRjaCBkb2VzIG5vdCBhcHBseSBjbGVhbmx5LCBzZWNvbmRseSBpdCBzYXlzIHBhdGNoIDIv
MiB3aGljaA0KPiBzZWVtcyB0byBiZSBwYXJ0IG9mIHNlcmllcw0KPiB3aGVyZSAxLzIgaXMgbWlz
c2luZy4NCg0KT2gsIHNvcnJ5IGFib3V0IHRoYXQuIFllcyB0aGVyZSBhcmUgaW5kZWVkIHN1cHBv
c2VkIHRvIGJlIHR3byBwYXRjaGVzOg0KDQogICAgW21ldGEtcHl0aG9uXVtQQVRDSCAxLzJdIHB5
dGhvbi1zbGlwLWRidXM6IHVwZGF0ZSB0byAwLjYuNQ0KICAgIFttZXRhLXB5dGhvbl1bUEFUQ0gg
Mi8yXSBweXRob24tc2xpcC1kYnVzOiBhZGQgYSBweXRob24zIHZlcnNpb24gb2YgdGhlIHJlY2lw
ZQ0KDQpJIHNlbnQgdGhlbSBib3RoIG9uIDMwIEphbiBidXQgdGhleSBkaWRuJ3QgYXBwZWFyIGlu
IHRoZSBsaXN0IGFyY2hpdmVzICANCnN0cmFpZ2h0IGF3YXkgc28gSSB0aG91Z2h0IHRoZXJlIG1p
Z2h0IGJlIGEgbW9kZXJhdGlvbiBxdWV1ZSB3aGVyZSB0aGV5IA0KYXJlIGhlbGQgdXA/IE9yIG1h
eWJlIGl0IGlzIHNvbWUgZGVmaWNpZW5jeSBpbiBvdXIgY29ycG9yYXRlIE91dGxvb2szNjUgDQpl
bWFpbC4uLiA6LSgNCg0KLS0gDQpEYW4gQ2FsbGFnaGFuIDxkYW4uY2FsbGFnaGFuQG9wZW5nZWFy
LmNvbT4NClNvZnR3YXJlIEVuZ2luZWVyDQpPcGVuZ2VhciA8aHR0cHM6Ly9vcGVuZ2Vhci5jb20v
Pg0K

