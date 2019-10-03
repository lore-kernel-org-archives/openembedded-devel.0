Return-Path: <chris.laplante@agilent.com>
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730074.outbound.protection.outlook.com [40.107.73.74])
	by mail.openembedded.org (Postfix) with ESMTP id 4B18E6C4DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Oct 2019 15:08:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=JGaIi7brD8JI9szjM22iabLhcSpAACfsGp4pkSWp3WiQqCIIwngzdoUqdUCZ7jGlBA19Do0y2puqFAhhEHIrYYnZyVi+zrN5R7m2eeE//Knh897WvwBNuC4o2kTkjiTIT0Ulsu+RKdiwcMRByAvpJkMTDFKBPzybIIv0ynQFRWlD55nZ9dthhhBTGK7+qxPBz+SyKB4QccwvtZiIgeR3aru1yycubH6UCnpKQq4qN7u2Y7Z6fb7qZZFU9mtwB+cPRnrTUe/PPJFdd/aAKZHdi/OZlGId7LT3bRKT+jkBTB4GqCqk07bbjHacfHv4SGRozGPxkWEPhDy950j70WkvRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4TwId8NzUsNNhc5oZyctY0JkO7UrqN1qiIbMt3aI6/w=;
	b=kUr8A0STE3VV47n0DpWwahUnwtrkEmsPcYUIZZWYSVLRvUJ8NVNCwJrfejU4El9CpO4yaDTbGliZmNVMrtp0rf+BJLgUbZh9rCALF8231umNgeexw7ro0xprsw/TeD4Z7VXmWih79rKZ1asuUg9rKN4kkWr1LLY+0LzOIV6SmdV8qX+eO6mE9NzRl0vkeggcQ5WvxDOiSumNKfKpqW/h8wgIrqGC0krxY+vjUY17FBMqI8zhCb+b59ihmtxQjNCOdyPVxRPNhJgXWVxnor5IYeJ5emWnacn2zfbJ/fDc50Ws/Dmy+Is0TgMPwDAtasg2pLCJzag5jR6nf2LF+AVQXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=4TwId8NzUsNNhc5oZyctY0JkO7UrqN1qiIbMt3aI6/w=;
	b=f68ZP99a0C4X7zROYmRPNhgfveG01sS9EW/VepakRfQdiLNAAmO09/G6InEpNJfuPvNb132JHWhmVFKUbXkUztGyBpt22QZd3D3Cczr4N9m+kCGdftWwRv0kJM4C+uJjOfx7l2rbWXwRAL8mzm/X/0kqOIQ6SCNz3Edy15Fyxio=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1367.namprd12.prod.outlook.com (10.168.166.147) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2305.20; Thu, 3 Oct 2019 15:08:40 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::fdcf:99b9:ab44:4986]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::fdcf:99b9:ab44:4986%5]) with mapi id 15.20.2305.023;
	Thu, 3 Oct 2019 15:08:40 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Support for OpenJDK 9+
Thread-Index: AQHVZ0gU5pgtlyO8106HiWTgwi9PtKcj07QAgACZg4CAJLksIA==
Date: Thu, 3 Oct 2019 15:08:40 +0000
Message-ID: <CY4PR12MB16534186A02A4649C5D9F17F8B9F0@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
	<20190909205704.GA14642@localhost>
	<6454a666-ebbe-ab60-533d-b60ffb927682@skidata.com>
In-Reply-To: <6454a666-ebbe-ab60-533d-b60ffb927682@skidata.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22c92873-f5f1-4226-a1dd-08d7481392e4
x-ms-traffictypediagnostic: CY4PR12MB1367:
x-microsoft-antispam-prvs: <CY4PR12MB1367A6005E8450BC3268C66F8B9F0@CY4PR12MB1367.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 01792087B6
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(136003)(346002)(376002)(39860400002)(366004)(189003)(199004)(29502001)(11346002)(446003)(476003)(52536014)(5660300002)(8936002)(229853002)(2501003)(7736002)(6436002)(55016002)(486006)(9686003)(25786009)(6246003)(186003)(305945005)(71200400001)(14454004)(74316002)(81166006)(4744005)(14444005)(71190400001)(256004)(8676002)(81156014)(7696005)(6506007)(76116006)(316002)(110136005)(76176011)(66556008)(86362001)(66446008)(102836004)(66946007)(66476007)(26005)(99286004)(33656002)(3846002)(6116002)(478600001)(66066001)(2906002)(64756008);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1367;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Yp4Lpw5ptfkxVluugb+lKv1sMopq1jCarA3ioh0KQeBuiyW1wLgrbNKymTnhIpeT2Y3sq5zFl3B87lYpa6t0f06xse/O4VXvvfjlnyMiLezBvgylQj6kzTqJbyiwA0+70LaJJii/zVAi1z5Dotkd4JwNlRhfOtpnj/+9sFQc46BJLJqoMsJT8yaflMsNxk9C/Kh1xlLy0IRBAy9JujnD+2qRs/2uGtTn2qqHdwDk3MWKJhHmuc/fwLIrVByf4UviU+yCLoQcpuu7vRJbK2w8TldZmsdOLv7QuG2FRq1iQwnClgG6/jIXR2M+3aY4yyvpXoIEONSR4N5YeGzAqp0YvaOSZ4efOkiWpILiVebmfEVLA+4As3GZ4eBSdtaG2+8/i7UR7o/AAWfoqc9zK2A3zAmnRimFjQ65UPoBxzyRPHY=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22c92873-f5f1-4226-a1dd-08d7481392e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2019 15:08:40.0830 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3E3UJ33VhSYDqyGMiX5/DL8Dr0Pizh1lMvITOmXdB4uVH5CGIQZIuJXNlOTKrJXhdsDXIJyWKLqPh34cd+od6JWiloJtzaUf1jwKnw+Ynng=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1367
Subject: Re: Support for OpenJDK 9+
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
X-List-Received-Date: Thu, 03 Oct 2019 15:08:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+PiBXZSByZWNlbnRseSBnb3QgYSByZXF1ZXN0IHRvIGFkZCBzdXBwb3J0IGZvciBKYXZhKE9w
ZW5KZGspIDkrLg0KPiA+PiBJIGNhbWUgdG8gd29uZGVyIGlmIHRoZXJlIHdhcyBhbnkgbGltaXRh
dGlvbnMgcHJldmVudGluZyB0aGUgdXNlIG9mDQo+ID4+IE9wZW5qZGsgOSsgb24gYXJtPw0KPiAN
Cj4gTm9uZSB0aGF0IEknbSBhd2FyZSBvZi4uLg0KDQpJIGhhdmUgYSBzb21ld2hhdCByZWxhdGVk
IHF1ZXN0aW9uLiBJcyB0aGVyZSBhIHRlY2huaWNhbCByZWFzb24gdGhhdCB3ZSdyZSBzdGlsbCB1
c2luZyBHTlUgQ2xhc3NwYXRoPyBUaGF0IHByb2plY3QgbG9va3MgdG8gYmUgdGhvcm91Z2hseSBh
YmFuZG9uZWQgc2luY2UgMjAxMi4gQXMgeW91IG1heSBoYXZlIHNlZW4gbGFzdCBuaWdodCBJIHN1
Ym1pdHRlZCBzb21lIHBhdGNoZXMgdG8gZml4IHNvbWUgInNpbXBsZSIgYnVncyBpbiBCaWdEZWNp
bWFsLiBCeSAic2ltcGxlIiwgSSBtZWFuIHRoZSBraW5kIG9mIGJ1ZyB0aGF0IEknZCBleHBlY3Qg
dG8gYml0ZSBtYW55IHVzZXJzLCBhcyBvcHBvc2VkIHRvIGFuIGVzb3RlcmljIG9yIGNvcm5lci1j
YXNlIGJ1Zy4gDQoNCklmIGl0J3MganVzdCB0aGF0IG5vIG9uZSBoYXMgZXZlciB2b2x1bnRlZXJl
ZCB0byBtb3ZlIHRvIHNvbWV0aGluZyBuZXdlciwgdGhlbiBJIG1heSBiZSBhYmxlIHRvIGhlbHAu
IE5vIGNvbW1pdG1lbnRzIHlldCB0aG91Z2guICANCg0KVGhhbmtzLA0KQ2hyaXMNCg==

