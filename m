Return-Path: <jhofstee@victronenergy.com>
X-Greylist: delayed 35667 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 28 Jan 2019 11:01:51 UTC
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10107.outbound.protection.outlook.com [40.107.1.107])
	by mail.openembedded.org (Postfix) with ESMTP id DB0E67C468
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Jan 2019 11:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=xAtNUW403YVvCTxIRSMbzXbfpo63LodXtSWxlMzcvl0=;
	b=0qqUkTdWFN13R5pM5znR4BxcnNOEU+WLQrumpWKRwDAP6V8FDw/bG1Lzw8LU6aEJO91M68s4J0vRWMfAa4ahV3pvMo4Roq7BQsloOpP4MGRlYo381LaqebZ3V7LLGfZBT8qlhA+SeX+Sz5EzEJGDDOTRGswWOiBVFLh3mU9qwuA=
Received: from VI1PR0701MB2687.eurprd07.prod.outlook.com (10.173.80.135) by
	VI1PR0701MB2463.eurprd07.prod.outlook.com (10.168.139.12) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1580.10; Mon, 28 Jan 2019 08:29:33 +0000
Received: from VI1PR0701MB2687.eurprd07.prod.outlook.com
	([fe80::ec6f:b409:48:f813]) by
	VI1PR0701MB2687.eurprd07.prod.outlook.com
	([fe80::ec6f:b409:48:f813%9]) with mapi id 15.20.1580.012;
	Mon, 28 Jan 2019 08:29:33 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe][PATCH] nodejs 8.14.0 -> 8.15.0
Thread-Index: AQHUtn/kmWBVrDFo/k+betQ6YhtTDqXEWi6A
Date: Mon, 28 Jan 2019 08:29:33 +0000
Message-ID: <8c7eeda1-8dae-5755-a6fb-b2ece947c619@victronenergy.com>
References: <1548621326-6160-1-git-send-email-jhofstee@victronenergy.com>
In-Reply-To: <1548621326-6160-1-git-send-email-jhofstee@victronenergy.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
x-originating-ip: [2001:1c01:3b04:4900:d0b8:b883:54d5:7586]
x-clientproxiedby: AM5PR0102CA0024.eurprd01.prod.exchangelabs.com
	(2603:10a6:206::37) To VI1PR0701MB2687.eurprd07.prod.outlook.com
	(2603:10a6:801:8::7)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR0701MB2463;
	6:t/OHRyTOcOOphX/VYB+jBA1mKWs1uRaoDokpohHlA25AP474vJHbQgPYxvfXlhZDazBt0WlrQ+S4HW2cJTupkgM3rczQAvrCqZE7wSQN8WKLJm5ixS/zgBa3eSoNhxA5EEqdZv/kBP2xT/zBH+RAG3Pd/1I12PrXUARjI92hYtVzgiz0PoYyNS+VnOmZD92IyN2Y1T1kY3MLdBGQq+GlEDP6CYNTdJrgOxbY81rPvMD1fD0T5bFVU2u9YSH0I1m6htSL9u4uMxicffuq/Gh3FtQxywcbvGc5XJwtQlNxAU3RqvAa/ri9IZqfnXgfh9jvmoc7MFuINR7rktWf4F2N0a72aialpuwAY80ytKe2tuWNf7upIfnVudNTXJl7C71+G0kbWtukK+9MZV8khkfF88oSf3v+McWO7is+mBPtsZHnhXf79w3lS8dPUXl4SXQYT7AJpMzPLAJ7DerkfRsAGg==;
	5:NIpgc5W9dgDwFWUB1zzeb57fFaQyluuij7a6hoEesFu4LV5dbrIEsa0kRT8xm0hXLLsW8SqQizH2f3oci/M0vVhPddyRaRPTBQ/S9bUSjYhe2tSmpme1Lu2865Crno+WFUMpX3iLhy5xrywnSUC+b2qARhmj+mOXQpCQZViQ1NsgJc25RIgcAtt7VKfYtyIpMqTWtLg0JjkPGaDoRL5PkA==;
	7:MfoiGLCv/wAwtGwfV1nWxp7nGMtANpStSXFVQqCjNRVqU6+l/9XJdP5vG1CHSV45AfZ1LdbKgjmkhKwNcOa/j3N8Qb7cmzdyxhbWKbT84y+mMmfK8HSiwAIsLirgGrO/P0SdGrZ34DQZprX7ukeQLg==
x-ms-office365-filtering-correlation-id: b114b00d-d5ad-4c84-4d07-08d684fabaaa
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(2017052603328)(7153060)(7193020);
	SRVR:VI1PR0701MB2463; 
x-ms-traffictypediagnostic: VI1PR0701MB2463:
x-microsoft-antispam-prvs: <VI1PR0701MB246360C963661DCEB39E7D64C0960@VI1PR0701MB2463.eurprd07.prod.outlook.com>
x-forefront-prvs: 0931CB1479
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39840400004)(136003)(366004)(396003)(346002)(376002)(199004)(189003)(446003)(11346002)(256004)(14444005)(6916009)(186003)(99286004)(31686004)(52116002)(486006)(46003)(4744005)(316002)(476003)(2616005)(478600001)(65956001)(65806001)(68736007)(58126008)(64126003)(14454004)(65826007)(76176011)(2501003)(102836004)(71200400001)(86362001)(305945005)(36756003)(4326008)(71190400001)(81166006)(6116002)(8676002)(97736004)(8936002)(229853002)(105586002)(106356001)(53936002)(107886003)(6246003)(2906002)(5640700003)(6436002)(6512007)(6506007)(386003)(53546011)(25786009)(7736002)(6486002)(31696002)(81156014)(2351001);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2463;
	H:VI1PR0701MB2687.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: CqyjkCmmIcHQmeBiSHhPSnEU+vIi4ALYDlH4871/bGcYKP0aHQcdUKGfXHxgY+khi0x/wpSpe9M9NWy10bZn3yORq3exoCGi0peJtN/eDq/wqwTx6hutha62w0vZd2f6X8rN7bT0QPjX9CaD2viY8GTFi8XHtljD+/r1SgBd5kfzsNrUR6CdswmDnC9yOwZrSzka9cX3asjZ9tR1k8JDnBiTOGObDnktUUKSH+GoDnvK+ZPmhJINu6y+mGj8sEQngObc8PfFq6zSMcnWx26Gl+CXYK/Hg0rZ86JuNPQ6bhdys+JeVaaCP71EGZSPirJQ21QX6D05OmTEG0Sr9yynlFmFZS/T+qTocS1SOf/bvogGY98dBm/BFjjj42/rzhls//VBY/MpuVGnTHdv3uH2xPeMyA43belhmAtrH1o16/A=
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b114b00d-d5ad-4c84-4d07-08d684fabaaa
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2019 08:29:32.6285 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2463
Cc: Matthijs Vader <mvader@victronenergy.com>
Subject: Re: [PATCH] nodejs 8.14.0 -> 8.15.0
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
X-List-Received-Date: Mon, 28 Jan 2019 11:01:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <F888A9FAF52B344AB0BC91924CF1A6B5@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQoNCk9uIDEvMjcvMTkgOTozNSBQTSwgSmVyb2VuIEhvZnN0ZWUgd3JvdGU6DQo+IEZyb206
IE1hdHRoaWpzIFZhZGVyIDxtdmFkZXJAdmljdHJvbmVuZXJneS5jb20+DQo+DQo+IFVwZGF0ZSBu
b2RlanMgdG8gbGF0ZXN0IDgueCBzdGFibGUgcmVsZWFzZSA4LjE1LjAuDQo+DQo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHRoaWpzIFZhZGVyIDxtdmFkZXJAdmljdHJvbmVuZXJneS5jb20+DQo+IFNpZ25l
ZC1vZmYtYnk6IEplcm9lbiBIb2ZzdGVlIDxqaG9mc3RlZUB2aWN0cm9uZW5lcmd5LmNvbT4NCj4g
LS0tDQo+ICAgLi4uL3JlY2lwZXMtZGV2dG9vbHMvbm9kZWpzL3tub2RlanNfOC4xNC4wLmJiID0+
IG5vZGVqc184LjE1LjAuYmJ9ICAgIHwgNCArKy0tDQo+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gICByZW5hbWUgbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL25vZGVqcy97bm9kZWpzXzguMTQuMC5iYiA9PiBub2RlanNfOC4xNS4wLmJifSAoOTYl
KQ0KDQoNClRoaXMgcGF0Y2ggaXMgbm90IGluY2x1ZGVkIGluIHBhdGNod29yayBpdCBzZWVtcy4g
RG9lcyB0aGUgc3ViamVjdCBuZWVkIA0KYSBzcGFjZQ0KYmV0d2VlbiBbb2VdIGFuZCBbcGF0Y2hd
IHBlcmhhcHM/DQoNClJlZ2FyZHMsDQoNCkplcm9lbg0KDQo=

