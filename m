Return-Path: <prvs=001f98f39=Alistair.Francis@wdc.com>
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7D2C87D711
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Apr 2019 18:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1555354396; x=1586890396;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-transfer-encoding:mime-version;
	bh=Cuy8RzCdvJCS9/jYp9WZ8pDdoOYEXKYYJ4mzjUAKxc4=;
	b=QfHSK+7Ho29VwMNOvA84FWh80HpIf84Ip4RCRVvEJpngFl+oL0G8O2to
	ZBZV3eztn51sVJ3tgNxWp3IjJCmjf/v+jHI8EuqhSYiD35rjlS8st08eU
	B0D71xC4mQffmiphbcIsEZIsvi/h3h3z3o41b507//nm4VoAllzA1agw8
	lMvF3bhiWkVyA6zPVf/cX+Yxvo8YP5JGMyCUmJSiZ0L6JYc35SnshvLdE
	M5SxUa1VcU9xP/ORxKNs5eJob3D/spij8b5FQgd7j9RuI7ETUvVKpK+wE
	qAzRQbUDGRzYVkJsz3xS4FUufyNsg8YeijW9vls6mo7wET2xOgX6JwFEG g==;
X-IronPort-AV: E=Sophos;i="5.60,354,1549900800"; d="scan'208";a="107759916"
Received: from mail-sn1nam02lp2056.outbound.protection.outlook.com (HELO
	NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.36.56])
	by ob1.hgst.iphmx.com with ESMTP; 16 Apr 2019 02:53:16 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Cuy8RzCdvJCS9/jYp9WZ8pDdoOYEXKYYJ4mzjUAKxc4=;
	b=H7GTYynztmgXjupfoSHDpqbtV2qYdkbdte0izU86ChGBVsVUmp8J4ok3FM+xzE2mkFV/uMxNK9rSjgEphVsJw1uVMHG0DmuPi3h5sis1Om9UA9Ags6udsgCYpVUaJ+S5HBE/S3UXVoRtoBLooJcS+Vz3KV1A34Jzi9XFcmmTsB4=
Received: from BYAPR04MB4901.namprd04.prod.outlook.com (52.135.232.206) by
	BYAPR04MB5414.namprd04.prod.outlook.com (20.178.50.223) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1792.19; Mon, 15 Apr 2019 18:53:14 +0000
Received: from BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c]) by BYAPR04MB4901.namprd04.prod.outlook.com
	([fe80::44e8:bd21:17b:348c%4]) with mapi id 15.20.1792.018;
	Mon, 15 Apr 2019 18:53:14 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-multimedia][PATCH 2/2] mycroft: Bump from 19.2.2 to 19.2.3
Thread-Index: AQHU87x7R0HwdgaOxEOHMfkEYL3mCw==
Date: Mon, 15 Apr 2019 18:53:14 +0000
Message-ID: <20190415185146.14189-2-alistair.francis@wdc.com>
References: <20190415185146.14189-1-alistair.francis@wdc.com>
In-Reply-To: <20190415185146.14189-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.21.0
x-clientproxiedby: BYAPR11CA0054.namprd11.prod.outlook.com
	(2603:10b6:a03:80::31) To BYAPR04MB4901.namprd04.prod.outlook.com
	(2603:10b6:a03:4f::14)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.44.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 485280a9-34a7-48a8-950a-08d6c1d39d61
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
	SRVR:BYAPR04MB5414; 
x-ms-traffictypediagnostic: BYAPR04MB5414:
wdcipoutbound: EOP-TRUE
x-microsoft-antispam-prvs: <BYAPR04MB54146EA19C913A4EA3D820E6902B0@BYAPR04MB5414.namprd04.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(39860400002)(366004)(136003)(396003)(346002)(376002)(189003)(199004)(6916009)(71190400001)(66066001)(8936002)(105586002)(5640700003)(106356001)(68736007)(52116002)(81156014)(86362001)(50226002)(1076003)(71200400001)(81166006)(8676002)(54906003)(7736002)(97736004)(6512007)(2351001)(99286004)(316002)(2501003)(6506007)(26005)(14454004)(72206003)(476003)(486006)(6486002)(5660300002)(305945005)(44832011)(446003)(76176011)(186003)(2616005)(2906002)(11346002)(36756003)(3846002)(478600001)(6436002)(386003)(53936002)(102836004)(256004)(25786009)(6116002)(4326008);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BYAPR04MB5414;
	H:BYAPR04MB4901.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pBUlr3r02fpn69pP+aoYC8KxyxKM+8ApEnE6W/5lbb3f9qmK1DuG7LxyQ1Fn49uhTgS6gYvX8XMJRy6j7OjxoukL2sCfx2TXMKfj4DMZbR5Z8ZAohlSyOQ96HZ0mx09nFuapN0eR/Q5pjH2FCVdp3RtGh/0g8c0a7d4S2fQBOLYTUTWjHOJKiOy0Yr5p0ubd/tKzgMLlv3TTIxR+i3otRs1/lxg4fXikPP9MTp8eX7arWZEkawYzdKCI5MDAMwCMwfUdSKH6pcVNy/TWpdwBvaEtqmExzJnv1A+mYxVJHt2h9qYz/3gimnWD+psEBuN3sXg0SV0wPbnwDGWGC6zBnMj8iZpP8FVtlSRJxz/lvm7JQtL2FLp1DgXO3dvek0XSOFTl4o5AzAZyRO28bqHpkT3bE0ABVZSheU4rgw4psd0=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485280a9-34a7-48a8-950a-08d6c1d39d61
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 18:53:14.4753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB5414
Subject: [meta-multimedia][PATCH 2/2] mycroft: Bump from 19.2.2 to 19.2.3
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
X-List-Received-Date: Mon, 15 Apr 2019 18:53:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogLi4uL215Y3JvZnQve215Y3JvZnRfMTkuMi4yLmJiID0+IG15Y3JvZnRfMTkuMi4z
LmJifSAgICAgICAgIHwgNSArKystLQ0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pDQogcmVuYW1lIG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVk
aWEvbXljcm9mdC97bXljcm9mdF8xOS4yLjIuYmIgPT4gbXljcm9mdF8xOS4yLjMuYmJ9ICg5NiUp
DQoNCmRpZmYgLS1naXQgYS9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL215Y3Jv
ZnQvbXljcm9mdF8xOS4yLjIuYmIgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlh
L215Y3JvZnQvbXljcm9mdF8xOS4yLjMuYmINCnNpbWlsYXJpdHkgaW5kZXggOTYlDQpyZW5hbWUg
ZnJvbSBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL215Y3JvZnQvbXljcm9mdF8x
OS4yLjIuYmINCnJlbmFtZSB0byBtZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL215
Y3JvZnQvbXljcm9mdF8xOS4yLjMuYmINCmluZGV4IGM4YWU1MzQ2OC4uYmVjZDBiZjc5IDEwMDY0
NA0KLS0tIGEvbWV0YS1tdWx0aW1lZGlhL3JlY2lwZXMtbXVsdGltZWRpYS9teWNyb2Z0L215Y3Jv
ZnRfMTkuMi4yLmJiDQorKysgYi9tZXRhLW11bHRpbWVkaWEvcmVjaXBlcy1tdWx0aW1lZGlhL215
Y3JvZnQvbXljcm9mdF8xOS4yLjMuYmINCkBAIC02LDcgKzYsNyBAQCBTRUNUSU9OID0gIm11bHRp
bWVkaWEiDQogTElDRU5TRSA9ICJBcGFjaGUtMi4wIg0KIExJQ19GSUxFU19DSEtTVU0gPSAiZmls
ZTovL0xJQ0VOU0UubWQ7bWQ1PTc5YWE0OTdiMTE1NjRkMWQ0MTllZTg4OWU3YjQ5OGY2Ig0KIA0K
LVNSQ1JFViA9ICI2NzA2YzM3NzgyMDkxMmY4M2MxODM4ZDllYjMyOTUwY2E5ZTM5ZWM3Ig0KK1NS
Q1JFViA9ICI0YjQ1ZGIzNGVjZDk1YjYyZWYyYjY2YThlNTE4MGM2NmNhNzkxYTIxIg0KIFNSQ19V
UkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9NeWNyb2Z0QUkvbXljcm9mdC1jb3JlLmdpdDticmFuY2g9
bWFzdGVyIFwNCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJlbW92ZS1weXRob24tdmVudi5wYXRj
aCBcDQogICAgICAgICAgICBmaWxlOi8vMDAwMi1waXAtcmVxdWlyZW1lbnRzLVJlbW92ZS1vbmVz
LWluc3RhbGxlZC1ieS1PRS5wYXRjaCBcDQpAQCAtNjMsOSArNjMsMTAgQEAgUkRFUEVORFNfJHtQ
Tn0gKz0gInB5dGhvbjMtcGlwIFwNCiAgICAgICAgICAgICAgICAgICAgcHl0aG9uMy14eGhhc2gg
XA0KICAgICAgICAgICAgICAgICAgIg0KIA0KLSMgTXljcm9mdCB1c2VzIEFsc2EgYW5kIFB1bHNl
QXVkaW8NCisjIE15Y3JvZnQgdXNlcyBBbHNhLCBQdWxzZUF1ZGlvIGFuZCBGbGFjDQogUkRFUEVO
RFNfJHtQTn0gKz0gImFsc2Etb3NzIGFsc2EtdXRpbHMgYWxzYS1wbHVnaW5zIGFsc2EtdG9vbHMi
DQogUkRFUEVORFNfJHtQTn0gKz0gInB1bHNlYXVkaW8gcHVsc2VhdWRpby1taXNjIHB1bHNlYXVk
aW8tc2VydmVyIg0KK1JERVBFTkRTXyR7UE59ICs9ICJmbGFjIg0KIA0KICMgTXljcm9mdCBjYW4g
ZG8gdGhpcyBpdHNlbGYgb24gdGhlIHRhcmdldCwgYnV0IGl0J3MgcXVpY2tlciB0byBkbyBpdCBo
ZXJlDQogUkRFUEVORFNfJHtQTn0gKz0gIm1pbWljIg0KLS0gDQoyLjIxLjANCg0K

