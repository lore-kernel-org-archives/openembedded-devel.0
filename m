Return-Path: <chris.laplante@agilent.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
	by mail.openembedded.org (Postfix) with ESMTP id B26E77F98C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2019 14:48:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=Cwb8ET6RaVLSXAmc5IEGDtB1+6fQ250iq1RKroBAdp04rnVHL3K2h2rVw9M/8AR7G/GpHIoWEIZ51n1YQM1K8irNk9pPH/fiOtxolTOUwJ9DEa7MSG5bDQEvkVaa7wK+DMc9LQ/0NpykxZaWesF68QyA/RT06bZjYLJStMUOSgHZjYtE4Q8GHRgHRFaryknKiBKtR15BznwNCpSJ7ToxmJcf5U+bZ6lTeiyYmeY94ptea+LwZobCUvE8iLklnyODbYrNgOQtA1KbCwx5ZaQQ8o1C+MWyG8bxG2JOjspHbq03F5Q5sOJPuKZX0uwftg/poRm6F0AK973JNC7nVXNa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LytA0sygcZgDO5hauMcwR7dEW/Cy+XVBruhHeO7+INI=;
	b=J8TKZeIJozhV2hkwrsKK6yXNa94LnFlXUua7ukuArKj6UHkFnwsXBjpRr/I7xCEE6Cw2qejEwjljcHzBb3J6Tp5jmcSuJ6fYkETkMq90K39wMQipSJpN4qRf3UevHjv2aLVGgnIh5xfLXWZkPshe6QZxJmCXsE35z9fjOVFwGpQ45+ju9APEcIt5YNAz1psLYfkh2+pOvT4WD5fCstAKYMqT9YChfvCT6KcxibwaKQKqwdH8jU0e91lWcRuB7YTEIYDHf48n4TQu4hGMN+t5hMdvaP8EIMRKcwZvpphkbaidZZPPiUnX2dsqYprLjKJcjIuPHatnT6hNWl++jMQh/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=agilent.com;
	dmarc=pass action=none header.from=agilent.com; 
	dkim=pass header.d=agilent.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=LytA0sygcZgDO5hauMcwR7dEW/Cy+XVBruhHeO7+INI=;
	b=Rh9ldxWlDKcjXdqnPKKvWjOYZpVX7JMlVyS4gVM83o8fqDv3T+LAMCxMrvdLP8HEORCvQLHEKnEYQjlkfOCTDIEi7WZMq9YxtBpm1x1WTBa5DMf7Vy+Kw4THZB4qPjwSQ1Cy0WVL7RiYTKhocW8eJ81jj0SvHw1Bj2e7bVRnX6E=
Received: from CY4PR12MB1653.namprd12.prod.outlook.com (10.172.71.137) by
	CY4PR12MB1175.namprd12.prod.outlook.com (10.168.167.10) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2408.24; Thu, 7 Nov 2019 14:48:14 +0000
Received: from CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::38c8:b362:f0b6:5134]) by
	CY4PR12MB1653.namprd12.prod.outlook.com
	([fe80::38c8:b362:f0b6:5134%8]) with mapi id 15.20.2408.028;
	Thu, 7 Nov 2019 14:48:14 +0000
From: "chris.laplante@agilent.com" <chris.laplante@agilent.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] Support for OpenJDK 9+
Thread-Index: AQHVZ0gU5pgtlyO8106HiWTgwi9PtKcj07QAgACZg4CAJLksIIA2/6wA
Date: Thu, 7 Nov 2019 14:48:13 +0000
Message-ID: <CY4PR12MB1653332D03E68DF8C59AB10A8B780@CY4PR12MB1653.namprd12.prod.outlook.com>
References: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
	<20190909205704.GA14642@localhost>
	<6454a666-ebbe-ab60-533d-b60ffb927682@skidata.com>
	<CY4PR12MB16534186A02A4649C5D9F17F8B9F0@CY4PR12MB1653.namprd12.prod.outlook.com>
In-Reply-To: <CY4PR12MB16534186A02A4649C5D9F17F8B9F0@CY4PR12MB1653.namprd12.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=chris.laplante@agilent.com; 
x-originating-ip: [4.16.127.92]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 46bd5ba7-d906-4f19-28bd-08d763918487
x-ms-traffictypediagnostic: CY4PR12MB1175:
x-microsoft-antispam-prvs: <CY4PR12MB11752A65F3BC4C030FD65AE48B780@CY4PR12MB1175.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0214EB3F68
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(366004)(376002)(396003)(136003)(346002)(39860400002)(29502001)(189003)(199004)(99286004)(6116002)(256004)(2501003)(6506007)(74316002)(52536014)(2906002)(66066001)(81166006)(5660300002)(26005)(6436002)(71200400001)(102836004)(55016002)(478600001)(76176011)(14454004)(229853002)(110136005)(71190400001)(8676002)(9686003)(486006)(305945005)(6246003)(186003)(81156014)(4744005)(25786009)(7736002)(86362001)(7696005)(316002)(8936002)(446003)(66946007)(11346002)(66446008)(76116006)(476003)(64756008)(14444005)(33656002)(66476007)(66556008)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR12MB1175;
	H:CY4PR12MB1653.namprd12.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: agilent.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E9zKWrExFBSkOnpUlgsGaf26UI+mNTxeGnEuqB0ib/DMA2ua1LRmM23E2L8oA/5iGaoFx67ZjYkE5hrSj6+MG5E2JR/FD60AE35af2QgUAPRm82spIfPd6TG8GlRldjbhbP40L3tyBe8jLf8sQ1yxUbr50DwPE7d5kgVoYY2QoxNcLdKWwlq9HvbLTVCrc2tvBils/BHKo+FUtP/anosGuoG0gLHZq0VznY+UH31fvdxSQvo63eOwMZ2iN4NmsIVEu5pOnZJeH3CSs5prhWxM9YJFIKobi7tX8nh4Pbc8fjGDtJe2Xnl1g00+VztYUWQ/H0IVVxPsSFNYKN4gmAKWzfroXGsuyevO4gij0h8+2WSeZBOV0Yr0VnULzG68dXFcPaeeLADaC4+cM0xac9dpoA6QGsKbPfrBrmh5smfPmoJFSKh7gO6iTRIJUuzxV6j
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46bd5ba7-d906-4f19-28bd-08d763918487
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2019 14:48:13.9753 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qVpe2T3+klTYHeMhxPh4OeQAQE+smAvq1F/e9Iv7K2wRirvSEIi8CQloVPXVUa41vlQpfxB+9NjS5sw2WO+8o/XfKrEI2aO6YAAMj2IgK/8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1175
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
X-List-Received-Date: Thu, 07 Nov 2019 14:48:15 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

PiA+ID4+IFdlIHJlY2VudGx5IGdvdCBhIHJlcXVlc3QgdG8gYWRkIHN1cHBvcnQgZm9yIEphdmEo
T3BlbkpkaykgOSsuDQo+ID4gPj4gSSBjYW1lIHRvIHdvbmRlciBpZiB0aGVyZSB3YXMgYW55IGxp
bWl0YXRpb25zIHByZXZlbnRpbmcgdGhlIHVzZSBvZg0KPiA+ID4+IE9wZW5qZGsgOSsgb24gYXJt
Pw0KPiA+DQo+ID4gTm9uZSB0aGF0IEknbSBhd2FyZSBvZi4uLg0KPiANCj4gSSBoYXZlIGEgc29t
ZXdoYXQgcmVsYXRlZCBxdWVzdGlvbi4gSXMgdGhlcmUgYSB0ZWNobmljYWwgcmVhc29uIHRoYXQg
d2UncmUgc3RpbGwgdXNpbmcgR05VIENsYXNzcGF0aD8gVGhhdCBwcm9qZWN0IGxvb2tzIHRvIGJl
DQo+IHRob3JvdWdobHkgYWJhbmRvbmVkIHNpbmNlIDIwMTIuIEFzIHlvdSBtYXkgaGF2ZSBzZWVu
IGxhc3QgbmlnaHQgSSBzdWJtaXR0ZWQgc29tZSBwYXRjaGVzIHRvIGZpeCBzb21lICJzaW1wbGUi
IGJ1Z3MgaW4gQmlnRGVjaW1hbC4NCj4gQnkgInNpbXBsZSIsIEkgbWVhbiB0aGUga2luZCBvZiBi
dWcgdGhhdCBJJ2QgZXhwZWN0IHRvIGJpdGUgbWFueSB1c2VycywgYXMgb3Bwb3NlZCB0byBhbiBl
c290ZXJpYyBvciBjb3JuZXItY2FzZSBidWcuDQo+IA0KPiBJZiBpdCdzIGp1c3QgdGhhdCBubyBv
bmUgaGFzIGV2ZXIgdm9sdW50ZWVyZWQgdG8gbW92ZSB0byBzb21ldGhpbmcgbmV3ZXIsIHRoZW4g
SSBtYXkgYmUgYWJsZSB0byBoZWxwLiBObyBjb21taXRtZW50cyB5ZXQgdGhvdWdoLg0KDQpCdW1w
Pw0K

