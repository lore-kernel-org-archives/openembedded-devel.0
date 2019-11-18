Return-Path: <jhofstee@victronenergy.com>
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr70093.outbound.protection.outlook.com [40.107.7.93])
	by mail.openembedded.org (Postfix) with ESMTP id 153717D718
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 11:01:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=K/LepsiX1CSxqN0qxLkWa6X9SGVrq0Ej2b5S+nLJltr7MsxF54KdM3oG/z+g9MDhctibsQxz5YprpQa8pD/LTGjrhWAcs681tteAIJDRCqnwvzOrXNVPo5V4A7tWDmZ3r6mveEQPO/TH7ImxfFi9bUXtWyqpG8VMjEMd57j4z/fJZCX2jcYvKS99LCXHhY7QsucAux286N9ysFmqn9BU6ZZpzpctFLknqsrk6Ip02/RQyt39i95Ta+7EimDaho4LoSB2jL3l3dbipFUy/Kibxy54HhfYTQUU3bTgIRZOLj44S1kCjZU8F+DGZUs4aKNDHCPs75NcKXUc4q30ZvCD3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JRTiQWLtP99phhBkUD1NXcTt3B28ah8f+m0otDyTpnA=;
	b=g14Tb110yCG77zvHpKzU8En8L7WzQyMQrN2nSIfah/Uc6dqF6rBgngzruumZVnRp9Di2V/aOqs7RVsKJTK+IvXrMrsbXoQofnDwPI19MkOWfroWeO8jzcRDHUh9XUZQOV5GRuXh2v1KucHj5t+8S2aXcIKmd37ZmYQ7zx2Qf6Jtqgkx2CjBJRoAUS75hxD4ucSaWvpTJosPz2x23F67/LCGEMn0W/jEm0tKh5FmSnPe8QTWMxItnv3Bec3qayjSxnxbFTlJf/OpCqakPYTz14ikQYnGpTjlvyzgtNoNEawuBSuKbx3Krdfgy/9tLAV3ogmy2u5eJJIDY9f6k7Y1/2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=victronenergy.com; dmarc=pass action=none
	header.from=victronenergy.com; dkim=pass header.d=victronenergy.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=JRTiQWLtP99phhBkUD1NXcTt3B28ah8f+m0otDyTpnA=;
	b=0gVvr+JbAoj1d2Ke1vDpphRE0jcuM3HNt4d6x+3SkQxh5auQlM7DJwYc13yVADyDSnUmJpfp3t2a+ahx86AB8/+Kilm3wwTHBPw/bS7tfxkwBkZWA7ZqtguWtbVo7KVMBEw9vFAymVymxw0QD+8oEJKJ6yrUlcVhDKhS93eUXvA=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
	VI1PR0701MB2366.eurprd07.prod.outlook.com (10.168.134.19) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.9; Mon, 18 Nov 2019 11:01:09 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8]) by
	VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8%8]) with mapi id 15.20.2474.015;
	Mon, 18 Nov 2019 11:01:09 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "Mikko.Rapeli@bmw.de" <Mikko.Rapeli@bmw.de>,
	"paul.eggleton@linux.intel.com" <paul.eggleton@linux.intel.com>
Thread-Topic: [oe] [meta-qt4][PATCH 0/2] fix qt4 for zeus
Thread-Index: AQHVnZA1pOVfbe9HvE2w/5DckYGk1KeQQQQAgABkpYCAAB4rgA==
Date: Mon, 18 Nov 2019 11:01:09 +0000
Message-ID: <e5beec9d-74a7-d60d-af9f-71f4c4d527aa@victronenergy.com>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
	<314811743.THUKncEJB5@shodan> <20191118091305.GE3527@hiutale>
In-Reply-To: <20191118091305.GE3527@hiutale>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
x-originating-ip: [213.126.8.10]
x-clientproxiedby: AM4PR05CA0013.eurprd05.prod.outlook.com (2603:10a6:205::26)
	To VI1PR0701MB2623.eurprd07.prod.outlook.com
	(2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c28eae0a-62e4-41bd-2103-08d76c169dca
x-ms-traffictypediagnostic: VI1PR0701MB2366:
x-microsoft-antispam-prvs: <VI1PR0701MB23663A2C1698B4BEDEFA2FE7C04D0@VI1PR0701MB2366.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39850400004)(136003)(396003)(376002)(366004)(346002)(199004)(189003)(229853002)(6246003)(58126008)(8676002)(11346002)(2501003)(5660300002)(99286004)(486006)(52116002)(102836004)(76176011)(81156014)(81166006)(54906003)(476003)(86362001)(446003)(256004)(316002)(53546011)(6506007)(386003)(478600001)(2616005)(110136005)(31696002)(66446008)(64756008)(66556008)(66476007)(66946007)(6486002)(14454004)(25786009)(36756003)(71190400001)(71200400001)(2906002)(8936002)(6512007)(305945005)(6436002)(6116002)(7736002)(26005)(31686004)(3846002)(186003)(4326008)(65806001)(66066001)(65956001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2366;
	H:VI1PR0701MB2623.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4Y8AZnO71UTVdczGXMu8Ql+CEFIrb0Z8aNK/iAdzxFbAI4dYcPK2bb2Zu6cUrm8QIWIgdD98WUVBdjCo4zlTdKDyMg34TsmMQdTCRr+STt3bb1HD19vwJiMMScO5NULV19MROJt2Eeh4wXVxR77k+Ymt/s+PbCRiduK8i5o5CFiqxyT1bdsN0xuADpWNu2KuWTLF9/e9VfWQ/brQZJq03mtSXVsmbyWvtJCABc5oyiOGiNGY5dL5UoGZha18gqagpfgAKhEZMi8Np4xvTTb+axDo+3JmKePl7wgJKRxb8k1lxffwVuc27SAWFqls3+oszJ2H3IRo434vZwxTMhjxZbrgNLi2dWyeORLO1s2jk98RXjfORv9nrA1Kk86HCJ0B8YNu77qFSb89nl6QFgS76DQTY3+j5xgwOB9/tkAqpLl7JMlW3wTLzRfOoTLtVBYi
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c28eae0a-62e4-41bd-2103-08d76c169dca
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 11:01:09.2022 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tkAuwHiU4CidgzPt9/H1pwt4K+qvy4u7yVSNXpsDAejcbSYvBDk0kasm8Ttf64z34fsLM7Oe1vSUI9SwHo1Mxdg0uBnJwVpEGphNmN9F3eM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2366
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	"bunk@stusta.de" <bunk@stusta.de>
Subject: Re: [meta-qt4][PATCH 0/2] fix qt4 for zeus
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
X-List-Received-Date: Mon, 18 Nov 2019 11:01:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <DC3FABEC94AFD04FBD6746CB9D976432@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8gTWlra28sDQoNCk9uIDExLzE4LzE5IDEwOjEzIEFNLCBNaWtrby5SYXBlbGlAYm13LmRl
IHdyb3RlOg0KPiBPbiBNb24sIE5vdiAxOCwgMjAxOSBhdCAwNDoxMjo1NlBNICsxMzAwLCBQYXVs
IEVnZ2xldG9uIHdyb3RlOg0KPj4gSGkgSmVyb2VuDQo+Pg0KPj4gT24gTW9uZGF5LCAxOCBOb3Zl
bWJlciAyMDE5IDEwOjQ0OjM3IEFNIE5aRFQgSmVyb2VuIEhvZnN0ZWUgd3JvdGU6DQo+Pj4gR2Nj
IDkuMiBtaXNjb21waWxlcyB0aGUgZm9yZWFjaCByZXN1bHRpbmcgaW4gYnJva2VuIGFwcGxpY2F0
aW9ucy4NCj4+PiBUaGlzIGJhY2twb3J0cyBhIGZpeCBmcm9tIHF0NSB0byBtYWtlIGl0IHdvcmsg
YWdhaW4uIFRoZSBmaXggaXMNCj4+PiBub3Qgd3JpdHRlbiBmb3IgdGhpcyBpc3N1ZSwgYnV0IGl0
IGRvZXMgc29sdmUgaXQuDQo+Pj4NCj4+PiBBcyBhIHByZXBhcnRpb24gaXQgaW5jbHVkZXMgc29t
ZSB3aGl0ZXNwYWNlIGZpeGVzLCBzbyB0aGUgcGF0Y2hlcw0KPj4+IGFyZSBhbGlnbmVkIGluIHRo
ZSBTUkNfVVJJLg0KPj4+DQo+Pj4gSmVyb2VuIEhvZnN0ZWUgKDIpOg0KPj4+ICAgIHF0NDogZml4
IHdoaXRlc3BhY2Ugc28gaXQgYWxpZ25zDQo+Pj4gICAgcXQ0OiB1cGRhdGVzIGZvciBnY2MgOS4y
DQo+PiBJJ3ZlIG1lcmdlZCBib3RoIG9mIHRoZXNlLiBJJ3ZlIGFsc28gY3JlYXRlZCB6ZXVzIGFu
ZCB3YXJyaW9yIGJyYW5jaGVzLiAoRm9yDQo+PiBub3cgSSBoYXZlIGFzc3VtZWQgdGhlc2UgdHdv
IHNob3VsZCBub3QgYmUgb24gd2FycmlvciAtIGxldCBtZSBrbm93IGlmIHRoYXQncw0KPj4gbm90
IGNvcnJlY3QuKQ0KPiBJdCB0aGlzIG9rIGZyb20gbGljZW5zaW5nIHBvaW50IG9mIHZpZXcgc2lu
Y2UgTElDRU5TRSA9ICJMR1BMdjIuMSB8IEdQTHYzIj8NCj4NCj4gSSBzdXNwZWN0IHRoZSBMR1BM
djIuMSBpcyBub3QgY29ycmVjdCBpZiBHUEx2MyBsaWNlbnNlZCBwYXRjaGVzIGZyb20gcXQ1IGFy
ZSB0aGVyZSB0b28uDQo+DQoNClNpbmNlIHRoZSBsaWNlbnNlIG9mIHRoZSBmaWxlIHRoaXMgcGF0
Y2ggaXMgY29taW5nIGZyb20gaXMgdGhlIHNhbWUNCmFzIGluIHF0NCwgSSBkb24ndCB1bmRlcnN0
YW5kIGhvdyB5b3Ugc3VzcGVjdCB0aGF0IGl0IGNvbmZsaWN0cy4NCg0KV2l0aCBraW5kIHJlZ2Fy
ZHMsDQoNCkplcm9lbg0KDQoNCg==

