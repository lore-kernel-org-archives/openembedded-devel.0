Return-Path: <junzhu@nxp.com>
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
	(mail-eopbgr80052.outbound.protection.outlook.com [40.107.8.52])
	by mail.openembedded.org (Postfix) with ESMTP id 7138F7E97A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Aug 2019 01:53:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=dLoIRd5hRsK1DNt5I3zTvNaZnN73bFBLOK0k2cygsqjmUkIp0/2E6GkMyjNtfhLdqoRlkg2V3ogAFfmkKKuBHyuiMatDbkgKYvwX2TzLr5VQN0K+CIYNFmGhjKRhbTvXBnSIvVDgNBi+slNKrHi/TNB0/T4wcLcp2utqtoUbn9AuJmvOrQuCA7QtWEFRtrLb2Y2nxC5LGloVy56kYoxn/tQsOtCORntdoYnqCyK9/UMh7fWM0bJozR7ehw2lPfSBKuxhS+9tbjriy6BRbg0hbCBoVxzJzlLEt7MCpC2eQigLO8kdoyJXQsgxSoHRR58TRdEYjQgsF/zx1PLtZ1whHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rarcLNJ475R7jorp35clvy/MvQ0tb4Xf5WE8w1PyOt8=;
	b=MavGKAUv9md1kUGaz1MgkJaTflZrjOpZgigH8WTQovlJG/4dER7VK11TUyFbK3/pJ+mad7KBUePCnDtv4ijCsnH5FI+0TxkYnRoru/WiVzBUspVj8AKS1djXVz189BOMGDcJPfk7XeRmHhXUhewfOsBBms13S7+Ko/u6IaXptqOEJdwKZWqn6q3SCJ2glOt7WRtG+wJfRK/okHMjdJIyTUXfMNYJSOXNSw0z79l1pHMo8AxesEC16vlySQjlZ1h95M+2I/jUIzM/v6ivHZQihuNNy3ZUSTsNr3hmyq9X+zvAz5iKKrGlce6ufnLIJ6T3q4JDVmTFKC+bKuaNhqb7LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com;
	dkim=pass header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=rarcLNJ475R7jorp35clvy/MvQ0tb4Xf5WE8w1PyOt8=;
	b=WkNibFpUQRgEhlW5PX2OqQfkXvm4pJknRxw5Y9KMljhBgFruWhE55I13idB6qELgykLtfJg2jH+ZaQL4TBXjgp5B+aFrJz7LRKaMTuOkvrC936Ghf0BFs4rgRKC9WHPHlGIyuLXfCQaNnvj7XAaZslV0ywVLzT8BEwrGJ2QcHo0=
Received: from VE1PR04MB6623.eurprd04.prod.outlook.com (20.179.235.29) by
	VE1PR04MB6702.eurprd04.prod.outlook.com (20.179.235.203) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2178.16; Wed, 21 Aug 2019 01:53:42 +0000
Received: from VE1PR04MB6623.eurprd04.prod.outlook.com
	([fe80::5195:72a1:f1d5:2d66]) by
	VE1PR04MB6623.eurprd04.prod.outlook.com
	([fe80::5195:72a1:f1d5:2d66%3]) with mapi id 15.20.2178.018;
	Wed, 21 Aug 2019 01:53:42 +0000
From: Jun Zhu <junzhu@nxp.com>
To: Khem Raj <raj.khem@gmail.com>, akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Re: [oe] [meta-oe][warrior][PATCH]
	packagegroup-tools-bluetooth: Fix blank RDEPENDS list
Thread-Index: AdVXwtwO9OruV14cTDCJtOZ3QxLBgQ==
Date: Wed, 21 Aug 2019 01:53:41 +0000
Message-ID: <VE1PR04MB6623EF311738F49AEF0B968FC5AA0@VE1PR04MB6623.eurprd04.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is ) smtp.mailfrom=junzhu@nxp.com; 
x-originating-ip: [119.31.174.66]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4d09ce5b-d095-4965-b5c9-08d725da64f3
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VE1PR04MB6702; 
x-ms-traffictypediagnostic: VE1PR04MB6702:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VE1PR04MB67025C25D41BC0BE5887E5C5C5AA0@VE1PR04MB6702.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:422;
x-forefront-prvs: 0136C1DDA4
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(199004)(13464003)(189003)(6116002)(305945005)(3846002)(26005)(8936002)(53936002)(74316002)(55016002)(186003)(229853002)(33656002)(6246003)(6306002)(9686003)(486006)(71190400001)(6436002)(66066001)(76116006)(476003)(966005)(71200400001)(316002)(110136005)(2501003)(8676002)(478600001)(256004)(14454004)(5660300002)(81166006)(81156014)(45080400002)(66946007)(7696005)(25786009)(86362001)(6506007)(102836004)(66446008)(53546011)(7736002)(66476007)(66556008)(64756008)(2906002)(99286004)(52536014);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR04MB6702;
	H:VE1PR04MB6623.eurprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: nxp.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 7laHare2A+G1tfarOHT/WY/SuEuI6a6N3+Ni+ry1llO0D2kZNZKb22xYGAPfugluk89X0k6AMBPLEbpqmkUqwOvZ6cl1BgpVheQG2BpCyUMfyi7caycUrjR0i7aaXgNg1NcR1RSkmb+o/n9Kkynr7Aw/SZjj7WkHbCU06Nh8o1arwHQqEybXzmJClGj/0jCx6hQHNFNtJX7ilP5xh3CzwDmZGwydLfERC5Iz9sxaaqyxCuVC37MbQkJduMqzPaOHYd0DqZbX2FT5oKtz3dY4aa8boH37w06cb9ouhHnl/Bix0htL2i72R+6RJCiVgPokLZD+wN8CJsV74OzCEjvtMU30pDIeUpYEUup7VWAePI3I8r9zwiyBjD3Yyh0rrN7+8s0lg0l+4pfkP5UIeuxR2MtWZrxyn5k1ZB8YJtD1N3o=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d09ce5b-d095-4965-b5c9-08d725da64f3
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Aug 2019 01:53:42.0917 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tN1F1GePLl/JZ7vBYrHND2jI3sF7nmFd4I5Oi9fPd+a1UxXqN6uIazaDR7plYYKF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6702
Subject: Re: [meta-oe][warrior][PATCH] packagegroup-tools-bluetooth: Fix blank RDEPENDS list
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
X-List-Received-Date: Wed, 21 Aug 2019 01:53:42 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwYXRjaCBpcyB0aGUgYnJhbmNoIHdhcnJpb3IsIGFuZCBJIHNhdyB0aGUgUmFqJ3MgcGF0
Y2ggaXMgbWVyZ2VkIHRvIG1hc3RlciBhbHJlYWR5Lg0KSSB3b25kZXIgd2hlbiB0aGUgY2hhbmdl
IHdpbGwgbWVyZ2UgdG8gV2Fycmlvcj8NCg0KLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZy
b206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+IA0KU2VudDogMjAxOeW5tDjmnIgxNuaX
pSAyOjI4DQpUbzogYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5jb20+OyBKdW4gWmh1IDxq
dW56aHVAbnhwLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3Jn
DQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1vZV1bd2Fycmlvcl1bUEFUQ0hdIHBhY2thZ2Vncm91
cC10b29scy1ibHVldG9vdGg6IEZpeCBibGFuayBSREVQRU5EUyBsaXN0DQoNCkNhdXRpb246IEVY
VCBFbWFpbA0KDQpPbiA4LzE1LzE5IDExOjE1IEFNLCBha3VzdGVyODA4IHdyb3RlOg0KPg0KPg0K
PiBPbiA4LzE0LzE5IDExOjU0IFBNLCBKdW4gWmh1IHdyb3RlOg0KPj4gVGhpcyByZXZlcnRzIGNv
bW1pdCA1MjFhM2IwMzI2YzU2YjIxMmRkYmI1YmY2ODk5OGU1N2I0OThkZTE0LCB3aGljaCANCj4+
IGNhdXNlcyB0aGUgYmxhbmsgUkRFUEVORFMtJHtQTn0gZm9yIHRoaXMgcGFja2FnZWdyb3VwLg0K
Pj4gLS0tDQo+PiAgIC4uLi9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC10b29scy1ibHVldG9v
dGguYmIgICAgICAgICAgICAgICAgICAgICB8IDQgKysrKw0KPj4gICAxIGZpbGUgY2hhbmdlZCwg
NCBpbnNlcnRpb25zKCspDQo+DQo+IEhhcyB0aGlzIGJlZW4gc3VibWl0dGVkIGZvciBtYXN0ZXI/
DQoNCnRoZXJlIGlzIGEgZGlmZmVyZW50IHBhdGNoIFsxXSB3aGljaCBJIGhhdmUgcXVldWVzIHVw
IGZvciBtYXN0ZXINCg0KPj4gZGlmZiAtLWdpdCANCj4+IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5l
Y3Rpdml0eS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC10b29scy1ibHVldA0KPj4gb290aC5i
YiANCj4+IGIvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wYWNrYWdlZ3JvdXBzL3BhY2th
Z2Vncm91cC10b29scy1ibHVldA0KPj4gb290aC5iYg0KPj4gaW5kZXggOTEzZTMxMS4uZjJhMTZk
YyAxMDA2NDQNCj4+IC0tLSANCj4+IGEvbWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wYWNr
YWdlZ3JvdXBzL3BhY2thZ2Vncm91cC10b29scy1ibHVldA0KPj4gb290aC5iYg0KPj4gKysrIGIv
bWV0YS1vZS9yZWNpcGVzLWNvbm5lY3Rpdml0eS9wYWNrYWdlZ3JvdXBzL3BhY2thZ2Vncm91cC10
b29scy1iDQo+PiArKysgbHVldG9vdGguYmINCj4+IEBAIC0zMSwzICszMSw3IEBAIFJERVBFTkRT
X2JsdWV6NSA9ICIgXA0KPj4gICAgICAgICAgICBwdWxzZWF1ZGlvLW1vZHVsZS1sb29wYmFjaycs
IFwNCj4+ICAgICAgICAgICAnJywgZCl9IFwNCj4+ICAgIg0KPj4gKw0KPj4gKyMgSW5zdGFsbCBi
bHVlejQgdG9vbHMgb3IgYmx1ZXo1IHRvb2xzIGRlcGVuZGluZyBvbiB3aGF0IGlzIHNwZWNpZmll
ZCBpbiB0aGUgZGlzdHJvLg0KPj4gKyMgT3RoZXJ3aXNlIGluc3RhbGwgbm90aGluZy4NCj4+ICtS
REVQRU5EU18ke1BOfSA9ICIke1JERVBFTkRTXyR7QkxVRVp9fSINCj4NCg0KDQpbMV0NCmh0dHBz
Oi8vZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJG
JTJGbGlzdHMub3BlbmVtYmVkZGVkLm9yZyUyRnBpcGVybWFpbCUyRm9wZW5lbWJlZGRlZC1kZXZl
bCUyRjIwMTktQXVndXN0JTJGMjAxMTY2Lmh0bWwmYW1wO2RhdGE9MDIlN0MwMSU3Q2p1bnpodSU0
MG54cC5jb20lN0MyOTZiMWY1MTU5NTY0Y2ZlMWFhODA4ZDcyMWFlNDQ3MSU3QzY4NmVhMWQzYmMy
YjRjNmZhOTJjZDk5YzVjMzAxNjM1JTdDMCU3QzAlN0M2MzcwMTQ5MDQ2Njg4MjQ4MTYmYW1wO3Nk
YXRhPXd1UjRUeXlabEpLSEtWVU4xQVNJUmk4T2V6JTJCaW9zblI2N2ZVRTk4TVczSSUzRCZhbXA7
cmVzZXJ2ZWQ9MA0K

