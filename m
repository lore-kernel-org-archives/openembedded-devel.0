Return-Path: <prvs=991f25a9b=Alistair.Francis@wdc.com>
Received: from esa5.hgst.iphmx.com (esa5.hgst.iphmx.com [216.71.153.144])
	by mail.openembedded.org (Postfix) with ESMTP id 8E6DF7D5BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Apr 2019 20:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1554495185; x=1586031185;
	h=from:to:cc:subject:date:message-id:
	content-transfer-encoding:mime-version;
	bh=uf1W/gxaqDrXpv4DaHLF1Xt5lXWNasMFbUkbcRJbPBs=;
	b=pfU4VsI1JQfS2RMdxuFs0ll6E+oHfGpjjx/RSskMp5KXVTapU+CP/g44
	qR553xTHhrjqYfDGJH1QIV14aWUVwYtMnXkmaHvVB+oDA5dtYY5WAaBVg
	g0hbfndQBq/FIf36Krk4ZlaNx6Nu3sNqMFTNAA+dkWl8cStUibtdQpX32
	d2l/qRNgAj37Bux2xCuZgI8P1dtkXfYGHk0U0IrKbHMQz8UDR6UdwPxwO
	xNSA36jQGBX7Wm00SX8UQsV4Uvm5dT+JdM0sb7TlSKSW7VTjaxa5m+9NF
	gaUyqQdkoT6VJ/D59WwuGRvJ8Zv/xBiH+fS5l3TuDy8G+Uz/jJM4Wf7EU Q==;
X-IronPort-AV: E=Sophos;i="5.60,313,1549900800"; d="scan'208";a="106472929"
Received: from mail-sn1nam02lp2054.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.54])
	by ob1.hgst.iphmx.com with ESMTP; 06 Apr 2019 04:13:04 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=uf1W/gxaqDrXpv4DaHLF1Xt5lXWNasMFbUkbcRJbPBs=;
	b=B+XboyYdfBIGr/BmI417IJCZxyZll+DSMioHc2CZjruqTnFjDxLtVOq7nrTV3yEWZg8RM0LZkDmSEPBMzH8ixEyhSHyzmkQ6C357FOS2KZatHnx6ZJgwHmtTI0mh0ZISyJhJrMRlaIi9NeNsT4hUPf+OrLbvbWTs+mfxpAzaczA=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB4055.namprd04.prod.outlook.com (52.135.215.150) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1771.16; Fri, 5 Apr 2019 20:13:03 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1750.014;
	Fri, 5 Apr 2019 20:13:03 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v4 2/6] libfann: Initial commit
Thread-Index: AQHU6+v5ebzK0iT72UKqYTMBLerTYQ==
Date: Fri, 5 Apr 2019 20:13:02 +0000
Message-ID: <20190405201126.27771-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR05CA0022.namprd05.prod.outlook.com
	(2603:10b6:a03:c0::35) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: dc73e2d6-0e16-4687-d649-08d6ba031b5d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600139)(711020)(4605104)(4618075)(2017052603328)(7193020);
	SRVR:BYAPR04MB4055; 
x-ms-traffictypediagnostic: BYAPR04MB4055:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB4055E7F10779BEDD4C2D7D2990510@BYAPR04MB4055.namprd04.prod.outlook.com>
x-forefront-prvs: 0998671D02
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(136003)(396003)(346002)(376002)(366004)(189003)(199004)(7736002)(386003)(6506007)(316002)(102836004)(50226002)(54906003)(81166006)(44832011)(4326008)(81156014)(476003)(6916009)(99286004)(52116002)(1076003)(106356001)(186003)(105586002)(2616005)(2351001)(2906002)(97736004)(71200400001)(71190400001)(25786009)(68736007)(2501003)(6436002)(6116002)(305945005)(53936002)(8936002)(36756003)(486006)(6486002)(72206003)(5640700003)(26005)(6306002)(86362001)(6512007)(14454004)(478600001)(66066001)(5660300002)(3846002)(256004)(8676002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB4055;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: qAuJhwmyPnvCmRKMhOLvshtAroQv6V59py1NdCfGdCRHybf/Puhg2DpMFDDw4w3AoK1h7pVlQOKfyrjOjmwtZ67Z6wzJiFddGXEGuOukdNNKk8jxVn93yJ1CzcWCPa/iI29JY6a9Cen1RkEW8Bb4hUIvu+Mu7/W3OCWa/29lQ6pLovjGQKwzfQbB8AkObkE5CuJVHyj+zG0zyJwSwed1rj96tuh54vC+VzCXbryVVPTv3NclgAFgZDz1w/1ujmWfwbHDFfDPlcdpS0p8r4ljfrXcwUbZyE9vlHKwHoL43K2ewiTef4REKaEe+LICVMCbzB3n2W3c0WNq5J+jtYP7cdQkFc3Hb2+5Mx6CVOmFcTTFoYOURpTW9nSJ9R1UQTo7siA6CU5uj9rwLUjPwhhsa1lODcmMst4OOJ7dhxlUHRA=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc73e2d6-0e16-4687-d649-08d6ba031b5d
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Apr 2019 20:13:03.0209 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4055
Subject: [PATCH v4 2/6] libfann: Initial commit
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
X-List-Received-Date: Fri, 05 Apr 2019 20:13:03 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VXNlIHRoZSBjdXJyZW50IG1hc3RlciBicmFuY2ggaW5zdGVhZCBvZiB0aGUgbGFzdCByZWxlYXNl
IGluIDIwMTMuDQoNClNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIEZyYW5jaXMgPGFsaXN0YWlyLmZy
YW5jaXNAd2RjLmNvbT4NCi0tLQ0KIG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0L2xpYmZhbm4vbGli
ZmFubl9naXQuYmIgfCAxNyArKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAxNyBp
bnNlcnRpb25zKCspDQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtb2UvcmVjaXBlcy1zdXBwb3J0
L2xpYmZhbm4vbGliZmFubl9naXQuYmINCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1z
dXBwb3J0L2xpYmZhbm4vbGliZmFubl9naXQuYmIgYi9tZXRhLW9lL3JlY2lwZXMtc3VwcG9ydC9s
aWJmYW5uL2xpYmZhbm5fZ2l0LmJiDQpuZXcgZmlsZSBtb2RlIDEwMDY0NA0KaW5kZXggMDAwMDAw
MDAwLi5jOTg2ZTE3NzUNCi0tLSAvZGV2L251bGwNCisrKyBiL21ldGEtb2UvcmVjaXBlcy1zdXBw
b3J0L2xpYmZhbm4vbGliZmFubl9naXQuYmINCkBAIC0wLDAgKzEsMTcgQEANCitTVU1NQVJZID0g
IkZhc3QgQXJ0aWZpY2lhbCBOZXVyYWwgTmV0d29yayAoRkFOTikgTGlicmFyeSINCitERVNDUklQ
VElPTiA9ICJGYXN0IEFydGlmaWNpYWwgTmV1cmFsIE5ldHdvcmsgKEZBTk4pIExpYnJhcnkgaXMg
YSBmcmVlIG9wZW4gc291cmNlIG5ldXJhbCBuZXR3b3JrIGxpYnJhcnksIHdoaWNoIGltcGxlbWVu
dHMgbXVsdGlsYXllciBhcnRpZmljaWFsIG5ldXJhbCBuZXR3b3JrcyBpbiBDIHdpdGggc3VwcG9y
dCBmb3IgYm90aCBmdWxseSBjb25uZWN0ZWQgYW5kIHNwYXJzZWx5IGNvbm5lY3RlZCBuZXR3b3Jr
cy4iDQorSE9NRVBBR0UgPSAiaHR0cHM6Ly9naXRodWIuY29tL2xpYmZhbm4vZmFubiINCitTRUNU
SU9OID0gImxpYnMvZGV2ZWwiDQorDQorTElDRU5TRSA9ICJMR1BMdjIuMSINCitMSUNfRklMRVNf
Q0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLm1kO21kNT1mMTQ1OTlhMmYwODlmNmZmOGM5N2UyYmFh
NGUzZDU3NSINCisNCitpbmhlcml0IGNtYWtlDQorDQorU1JDUkVWID89ICI3ZWMxZmM3ZTViZDcz
NGYxZDNjODliMDk1ZTYzMGU4M2M4NmI5YmUxIg0KK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNv
bS9saWJmYW5uL2Zhbm4uZ2l0O2JyYW5jaD1tYXN0ZXIgXA0KKyAgICAgICAgICAiDQorDQorUFYg
PSAiMi4yLjArZ2l0JHtTUkNQVn0iDQorDQorUyA9ICIke1dPUktESVJ9L2dpdCINCi0tIA0KMi4y
MS4wDQoNCg==

