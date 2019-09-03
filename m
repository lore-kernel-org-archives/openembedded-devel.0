Return-Path: <eero.aaltonen@vaisala.com>
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
	(mail-eopbgr140053.outbound.protection.outlook.com [40.107.14.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF5C7F22D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2019 06:50:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=J5+XX+5L3iATbHVxd6WVaucFYqrLatQoGy2Ok0MeYTJ//S0UE/+rxL+VJN3Mh+EcH+CSOon5PqzjRnJgkAlAtnuoGGmBUBZ1lmp80j35n2Ufxky59Dpn9yeh55d8A5h47Q8Xzh1XxZofzhHpn2pKXJxecUew+lHgTiqiQUSWKOpmFz8HWEmgM7AyJepC5xdL98DgdJ3lyhyMaJGoag6FfwwKR5CnVXuFh8Y26jZkDmMgV+ZUbFxMO/ZS9obixhIPrd0chbyB8/BVACa+Xz2meZwTUgMM7ATR26gym7RlEYuU03W2fRNIqdtpejFy3KkN6ounu+OgQSp2YG/uYkGmQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qnxjlkKf1jfLO8S9ruei/FUaPzzlFcGzEsuEadtYa1w=;
	b=IrQCr7jx3wfp0fYu7tmkAQzoSrg0JJtWi4AcYh4Qct1dqyNIqE2d4CtDrcuRoarveUp0ujJTvxM86AoU7UcBRhI+Z2r6MDH4lL/+YpDDX8ehB85zwmsgPWiih6R6h3pSOOuInd31mzL0RCfrr/oaP3i0FLEqej6nWYP/1OMZQt8w7RNEjn2UQITj0myatBi6ovBiDi0viW5ayA5xObiPBn2WR9fUI3H+q8qcslkuC3eoLxOolaDlvCsWSfneI75Id++zo9i6X8Lh64WjMczijOKCnQf4e1vxvIdyPwG5/gp+vwDDB5wCKttDgl/CbSuQWHeON3D3Y84z7V4mvPDZMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=vaisala.com;
	dmarc=pass action=none header.from=vaisala.com; 
	dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=qnxjlkKf1jfLO8S9ruei/FUaPzzlFcGzEsuEadtYa1w=;
	b=ihPFp2wFv1lZw6f5VIDFF4wBqLmPj5Ogc5rOYN6j4fR4e9n12B8j2d8PGuhaAlaQMX5sTwv2Y4RHf03SFR133+cw0V9KA2YSNJse+Dp4RY3g4FRBKxuXMJdJRD7gCEXUqei4eTYs1Rsu8JzA/vOW5yVaf9/E7Ct9Phuw9HXX3YQ=
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com (52.133.4.143) by
	HE1PR0602MB2794.eurprd06.prod.outlook.com (10.175.31.143) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2220.18; Tue, 3 Sep 2019 06:50:14 +0000
Received: from HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::4d44:1cc6:7501:85a7]) by
	HE1PR0602MB3436.eurprd06.prod.outlook.com
	([fe80::4d44:1cc6:7501:85a7%5]) with mapi id 15.20.2220.021;
	Tue, 3 Sep 2019 06:50:14 +0000
From: Aaltonen Eero <eero.aaltonen@vaisala.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-oe][PATCH v2 0/1] Recipe for docopt.cpp option
	parsing library
Thread-Index: AQHVXYwiLINK+Sm3SUykRC059x0WdqcZjJOA
Date: Tue, 3 Sep 2019 06:50:14 +0000
Message-ID: <9618a72ef695047a673d7617d892df004b29e299.camel@vaisala.com>
References: <20190826180437.GA18874@localhost>
	<20190828103355.27234-1-eero.aaltonen@vaisala.com>
In-Reply-To: <20190828103355.27234-1-eero.aaltonen@vaisala.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0401CA0084.eurprd04.prod.outlook.com
	(2603:10a6:3:19::52) To HE1PR0602MB3436.eurprd06.prod.outlook.com
	(2603:10a6:7:89::15)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=eero.aaltonen@vaisala.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
x-originating-ip: [193.143.230.131]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4e32b894-42c7-43eb-dea5-08d7303af91b
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600166)(711020)(4605104)(1401327)(2017052603328)(7193020);
	SRVR:HE1PR0602MB2794; 
x-ms-traffictypediagnostic: HE1PR0602MB2794:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <HE1PR0602MB2794E8BC91F90AA92B5E2DF9F5B90@HE1PR0602MB2794.eurprd06.prod.outlook.com>
x-tenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 01494FA7F7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(376002)(346002)(136003)(366004)(39850400004)(189003)(199004)(316002)(3846002)(118296001)(966005)(50226002)(2501003)(66556008)(66446008)(64756008)(66946007)(66476007)(8936002)(86362001)(476003)(5660300002)(25786009)(478600001)(6436002)(6306002)(5640700003)(14454004)(6116002)(53936002)(6246003)(99286004)(81156014)(446003)(26005)(71190400001)(71200400001)(52116002)(8676002)(6506007)(386003)(256004)(7736002)(4744005)(6916009)(6512007)(2906002)(2616005)(36756003)(2351001)(102836004)(66066001)(11346002)(186003)(6486002)(229853002)(305945005)(81166006)(76176011)(486006)(99106002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:HE1PR0602MB2794;
	H:HE1PR0602MB3436.eurprd06.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: vaisala.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V9yRFvhHRYgb52s1OUPjAIhZYPSSm67Tgr8PUwaG1Z1D0VKYXDhCSVJdwcTOGMA8ZUQxvzv9ZoydwBMC43kT1CYci8EfRzJVozzFfWhnOqUvN/kyeCfSlp1lofjkvm2bKioAKZqqO7cwZep206yiShSW1/r5gXGJZ1NRDnw4zCx2B1tRD5J9gPDUOjoNNZk1EA7d1QkUbxlOTA3CPs7vgVL3OpFiLCI5IqNkcWgkU5fPbBUjWW4gOE+Kc6itsmle5rmE6a1ZKuUgj+fhm/pCYEhHW7z74DE8cPR98VNIYkcXcJS0WHLQnjtHzzeUH1ftWb3xbitjqbv2xrrfVMbTCZq+oBLS8sY00WIax1jATzkyhZWiPbUL75MaZ2Q0u7C8X+DdNR50c5oiboubYSWLwLoga9uW/iB5g/PdegoJCpw=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e32b894-42c7-43eb-dea5-08d7303af91b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Sep 2019 06:50:14.4502 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5K1UBGpDIPseZ4KNDwUSRfRMKvVzAx5egp3ELsD5j+InHfq1FCZGw2Xem3eYi0no51sD9SYntuGqSFI9tPrYIio+g8aap0mHnkahGr/2Rc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0602MB2794
Subject: Re: [meta-oe][PATCH v2 0/1] Recipe for docopt.cpp option parsing library
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
X-List-Received-Date: Tue, 03 Sep 2019 06:50:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <8FACF6C115FD9A428F84DBC201F4DBD1@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64

T24gV2VkLCAyMDE5LTA4LTI4IGF0IDEwOjM0ICswMDAwLCBBYWx0b25lbiBFZXJvIHdyb3RlOg0K
PiBUaGFuayB5b3UgZm9yIHRoZSBmZWVkYmFjay4gSGVyZSBpcyB0aGUgcmV2aXNlZCBwYXRjaC4N
Cj4gDQo+IENoYW5nZXM6DQo+ICogU1JDX1VSSSBwcm90b3RvY29sIGlzICJodHRwcyINCj4gKiBS
ZW1vdmVkIHVzZSBvZiBnaXRwa2d2DQo+IA0KPiBBbiBvcGVuIHF1ZXN0aW9uLiBJIGVhcmxpZXIg
d29uZGVyZWQgd2hldGhlciB0aGUgcmVzdWx0aW5nIHBhY2thZ2VzDQo+IHNob3VsZCBiZQ0KPiBu
YW1lZCAiZG9jb3B0LmNwcCIgb3IgImxpYmRvY29wdC5jcHAiLiBJIGRpZCBhIHF1aWNrIHNlYXJj
aCBhbmQgaXQNCj4gc2VlbXMgb24NCj4gVWJ1bnR1IHRoZSBwYWNrYWdlcnMgYXJlIG5hbWluZyB0
aGUgcmVzdWx0aW5nIGJpbmFyeSBwYWNrYWdlcyB3aXRoDQo+IHRoZQ0KPiAibGliIiBwcmVmaXgN
Cj4gDQpodHRwczovL3VidW50dS5wa2dzLm9yZy8xOC4wNC91YnVudHUtdW5pdmVyc2UtYW1kNjQv
bGliZG9jb3B0LWRldl8wLjYuMi0yX2FtZDY0LmRlYi5odG1sDQoNCg0KQnVtcC4gQW55IG1vcmUg
Y29tbWVudHMgb24gdGhpcz8NCkFuZCB3aGljaCBuYW1lIHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlh
dGUgaW4gT0U/DQoNCi1FZXJvIEFhbHRvbmVuDQoNCg==

