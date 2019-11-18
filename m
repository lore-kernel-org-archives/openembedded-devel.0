Return-Path: <jhofstee@victronenergy.com>
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
	(mail-eopbgr10100.outbound.protection.outlook.com [40.107.1.100])
	by mail.openembedded.org (Postfix) with ESMTP id 323FF7F87F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Nov 2019 07:35:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=ftoLlLFzLoSKcQErwyXYyApaqp89SaIPrjwdLwweffvXnTBIkYh0eMGiTAwdabbX1J9wRNMhF/sQ1K6vPxJDcIcFrDs1dpEqarQCsE3DXtkKrXmhB3TTyBduUh7CIIdMTrSaSx2rprZYX7r/wIaie6oGhIy23zB0Oh8ZUGHLj7jMkuhy3ntZkmvwu5kc2tzPFrEp8JlgeeSAMVawensR335rT0dHDEOB+kAO1u1niVfFcqtf00a0YroFK3/Iqv3Tixn4+OR/rxVJ7cf8OEUv+L+L1xAzjlsI7XwLPl7SyXBhQl5UdG/yhZfyNU8NAhqLcQ1xvtKK5i2dSb+7mqhWzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iKa6lUUU33aDgGuX+ZugLJdV3MvnGduLp+KG6gDmpRI=;
	b=fADnFU1Qmn8eB8r8HKE9Xy56Ba9RVs5XLDeNhIaf5T2tDp0mpFVAugqiyEKX/dq8E98iNtmjy+l/886gOGuTpse+BJ91fzRNQI1GGA3IHZ7MAmdvP+oDwLyEwnYN+JUhzAjgmoGosM+ryo903mwqimpqlRwt4RW5S+F7U/MiHRAvrP3sjudwOrKL3zuB8QQY4/ya6KRoLRAEwMP79y/sa2PKqLDIcBVsolYwXq9sAf+TR/g6XCu963Bikc1RsXjKE63sZ4dIJeciwAwELhFn8N3aIo4aT/+fxhgrp1BHA65sElQatYXzETEeRXFjvBpPrspq3VZrSwJLp3MX+WusnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=victronenergy.com; dmarc=pass action=none
	header.from=victronenergy.com; dkim=pass header.d=victronenergy.com;
	arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=victronenergy.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=iKa6lUUU33aDgGuX+ZugLJdV3MvnGduLp+KG6gDmpRI=;
	b=CGt9DBgfzqLGWhD44i3WXbG7lCrXeAdG6qFTYp2dmqeHfV7H0m3j5uRwXXwHpZYH3uHJFfyBbidLuaaFw3+6aoEN6LTUMtsJPFo+gkhGN5sDq6GfpkKFkHQLqrY2OT0DMU1yW7rURreKuBHqZiC+bwYGIdX+kHVBqJPjro24qRo=
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com (10.173.82.19) by
	VI1PR0701MB2782.eurprd07.prod.outlook.com (10.173.80.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2474.12; Mon, 18 Nov 2019 07:35:10 +0000
Received: from VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8]) by
	VI1PR0701MB2623.eurprd07.prod.outlook.com
	([fe80::dc67:84fb:5210:adb8%8]) with mapi id 15.20.2474.012;
	Mon, 18 Nov 2019 07:35:10 +0000
From: Jeroen Hofstee <jhofstee@victronenergy.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-qt4][PATCH 0/2] fix qt4 for zeus
Thread-Index: AQHVnZA1pOVfbe9HvE2w/5DckYGk1KeQQQQAgABJQgA=
Date: Mon, 18 Nov 2019 07:35:10 +0000
Message-ID: <40bb0e3c-9521-0023-5c08-da5ddd975939@victronenergy.com>
References: <20191117214427.20073-1-jhofstee@victronenergy.com>
	<314811743.THUKncEJB5@shodan>
In-Reply-To: <314811743.THUKncEJB5@shodan>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
x-originating-ip: [2001:1c01:3bc5:4e00:461c:a8ff:fee1:70b5]
x-clientproxiedby: AM3PR04CA0128.eurprd04.prod.outlook.com (2603:10a6:207::12)
	To VI1PR0701MB2623.eurprd07.prod.outlook.com
	(2603:10a6:801:b::19)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=jhofstee@victronenergy.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 94b73b76-68d1-43a7-c9f8-08d76bf9d754
x-ms-traffictypediagnostic: VI1PR0701MB2782:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <VI1PR0701MB27826D269DA88AD3E55483AEC04D0@VI1PR0701MB2782.eurprd07.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0225B0D5BC
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(4636009)(39850400004)(396003)(376002)(346002)(136003)(366004)(189003)(199004)(110136005)(25786009)(66446008)(64756008)(66556008)(66476007)(66946007)(58126008)(316002)(478600001)(14454004)(36756003)(5660300002)(966005)(2616005)(65806001)(446003)(476003)(86362001)(11346002)(486006)(6246003)(81166006)(81156014)(8676002)(76176011)(7736002)(8936002)(6116002)(4326008)(46003)(2906002)(71190400001)(71200400001)(2501003)(99286004)(65956001)(4744005)(53546011)(6506007)(386003)(305945005)(6306002)(6512007)(102836004)(256004)(52116002)(186003)(6436002)(31696002)(6486002)(229853002)(31686004);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR0701MB2782;
	H:VI1PR0701MB2623.eurprd07.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: victronenergy.com does not
	designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MRBEscC3qkOWcVqKDa5L6f0vBidIc8dRpUEKWZYg82ct2v3iXgYwURmugOd2Moa7scrM9AOPZyqI5bzIDUYeNBmRddGBmuHNKMrjVwKbENf8pUhfmYooVqUF0xZgKF4lbs0M9gdk7jNVNVr1MA4fffecYr2csveiR87sDogDb8fD1oAvcZXrwOAF44HR1sgWhEG5KCNpSAyx/hQRb/AIrcuhRabYk2r1VmQHWoI22rvlBsB8VHpht1sUM4Y2WCJAB081MZhDAnEuf+PGnM9De9z/wl9VNtJa0leQECIcuL/NPHogkeCfg0fEcv1/X6EEWjvZxKWce4AUFsExcn/8b2ynNFdDLTfu9unh6j8pp0/VLznY/02uOWRZUmZDB9g+IKMRakBM4GI8kOikSF+W1eWiYzjathkdXJAabk7O+4TxE5dHfd1l7VN2kMHnABDIK5iCdFu3OzifaMFCfLHbpDq/CXO2pCbNXUTbkKZSdpg=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: victronenergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b73b76-68d1-43a7-c9f8-08d76bf9d754
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2019 07:35:10.1290 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60b95f08-3558-4e94-b0f8-d690c498e225
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KAxGNDoshaBxD7KvXQrnBAP0ZZKKt+fHc/ia45gU4XsKqBRMA1IRYVS7GCjZ/eejYpBPVWnPhpmwbZQeOVj9ffQVoljMckb5OsMsJUDPou4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0701MB2782
Cc: Adrian Bunk <bunk@stusta.de>
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
X-List-Received-Date: Mon, 18 Nov 2019 07:35:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3FD09CF16A62AA44B8A09DC8F5C0D045@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64

SGVsbG8gUGF1bCwNCg0KT24gMTEvMTgvMTkgNDoxMiBBTSwgUGF1bCBFZ2dsZXRvbiB3cm90ZToN
Cj4gSGkgSmVyb2VuDQo+DQo+IE9uIE1vbmRheSwgMTggTm92ZW1iZXIgMjAxOSAxMDo0NDozNyBB
TSBOWkRUIEplcm9lbiBIb2ZzdGVlIHdyb3RlOg0KPj4gR2NjIDkuMiBtaXNjb21waWxlcyB0aGUg
Zm9yZWFjaCByZXN1bHRpbmcgaW4gYnJva2VuIGFwcGxpY2F0aW9ucy4NCj4+IFRoaXMgYmFja3Bv
cnRzIGEgZml4IGZyb20gcXQ1IHRvIG1ha2UgaXQgd29yayBhZ2Fpbi4gVGhlIGZpeCBpcw0KPj4g
bm90IHdyaXR0ZW4gZm9yIHRoaXMgaXNzdWUsIGJ1dCBpdCBkb2VzIHNvbHZlIGl0Lg0KPj4NCj4+
IEFzIGEgcHJlcGFydGlvbiBpdCBpbmNsdWRlcyBzb21lIHdoaXRlc3BhY2UgZml4ZXMsIHNvIHRo
ZSBwYXRjaGVzDQo+PiBhcmUgYWxpZ25lZCBpbiB0aGUgU1JDX1VSSS4NCj4+DQo+PiBKZXJvZW4g
SG9mc3RlZSAoMik6DQo+PiAgICBxdDQ6IGZpeCB3aGl0ZXNwYWNlIHNvIGl0IGFsaWducw0KPj4g
ICAgcXQ0OiB1cGRhdGVzIGZvciBnY2MgOS4yDQo+IEkndmUgbWVyZ2VkIGJvdGggb2YgdGhlc2Uu
IEkndmUgYWxzbyBjcmVhdGVkIHpldXMgYW5kIHdhcnJpb3IgYnJhbmNoZXMuIChGb3INCj4gbm93
IEkgaGF2ZSBhc3N1bWVkIHRoZXNlIHR3byBzaG91bGQgbm90IGJlIG9uIHdhcnJpb3IgLSBsZXQg
bWUga25vdyBpZiB0aGF0J3MNCj4gbm90IGNvcnJlY3QuKQ0KDQoNClRoYW5rcywgV2FycmlvciBz
ZWVtcyB0byBoYXZlIGdjYyA4LjMgd2hpY2ggaW5kZWVkIGRvZXNuJ3QgbmVlZA0KdGhlIGZpeCwg
c2VlIGh0dHBzOi8vZ29kYm9sdC5vcmcvei9YRkVEbmEuDQoNCldpdGgga2luZCByZWdhcmRzLA0K
DQpKZXJvZW4NCg0K

