Return-Path: <lewis.muhlenkamp@stryker.com>
X-Greylist: delayed 131441 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 25 Jan 2019 10:03:39 UTC
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr780077.outbound.protection.outlook.com [40.107.78.77])
	by mail.openembedded.org (Postfix) with ESMTP id 1D0CF7C30B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Jan 2019 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=eq5NqF2uaMPBzOGq2KePs8yHX8yUnrPSG3E1jOG8cns=;
	b=qAeUcN2S9q8KjIMHg3ap6+p4+1o7CqLiqO+5zYUufH7jzcBp7XNBroMThZednHBY4v/8wLkAqozNGcVc+D+8n1x4KzWdA3RiJWYwCOWy7LKoge7OiA0HNZ9XJHfSiPrpxTuPT3cGw2Zw+dItAQ0e7BL3X1HwluoSdhIaIQASPss=
Received: from DM6PR01MB4636.prod.exchangelabs.com (20.177.216.161) by
	DM6PR01MB3996.prod.exchangelabs.com (20.176.73.17) with Microsoft SMTP
	Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Thu, 24 Jan 2019 12:32:32 +0000
Received: from DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33]) by DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33%3]) with mapi id 15.20.1537.031;
	Thu, 24 Jan 2019 12:32:32 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [oe] DATETIME seems to be getting updated
Thread-Index: AdSzXLh32X32/CN4S0Wp1vZ2xsrXJwAaXsSAAAaiogA=
Date: Thu, 24 Jan 2019 12:32:32 +0000
Message-ID: <DM6PR01MB46361257C4C830F2223925288F9A0@DM6PR01MB4636.prod.exchangelabs.com>
References: <DM6PR01MB4636E8A23560DB48A9F733678F990@DM6PR01MB4636.prod.exchangelabs.com>
	<CAJTo0LZTOpWUfMPG6N6DU6Q_BDKa+maD_-By-2yC9jAFZACNNQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZTOpWUfMPG6N6DU6Q_BDKa+maD_-By-2yC9jAFZACNNQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.56]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB3996;
	20:iAm7Ao4Fj9WlL8lK/syAsy2HQcFpFgxg8XMvEgTQAcfhrX89ZZEQOA6u88K18nkua43pEOlUsf16RvPAy/rJXCvItNgHrZ/UnRdicyBOaDIpIDBO9ji1YUSrUIk1bwk67i56RcGh2KtQz2TCiELOYoCqrh4Hc6dazgmk79bUP99ieeLY17AA01LnTaB3uukXgk2plHHl7R/8CgRBTINaaRaVdpx0fbtAHJk0G5/E3wRyVul+AoEMY4CN7ZphET44;
	23:Ja8bmkHanVH2H5SYt/VaHnm4y6/Ov4jTmaZlri1DKKi+wlVhxUCGxipn2nevT5nRiQWuJPOSG7Ifg8Rc1h1tFAqusIukc6xfwDrhD+XRLmAfa4Y6Cc5GRzB6HtRL7qQOBHpcbTmDaAK7sNIFFlbzxg==
x-ms-office365-filtering-correlation-id: 4c56e9c6-0349-446c-1569-08d681f8033a
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7167020)(7153060)(7193020);
	SRVR:DM6PR01MB3996; 
X-MS-TrafficTypeDiagnostic: DM6PR01MB3996:|DM6PR01MB3996:
x-microsoft-antispam-prvs: <DM6PR01MB39964E38CBF6BA06608C3CF38F9A0@DM6PR01MB3996.prod.exchangelabs.com>
x-forefront-prvs: 0927AA37C7
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(39860400002)(376002)(396003)(366004)(346002)(199004)(189003)(13464003)(55016002)(8936002)(478600001)(14454004)(99286004)(66066001)(6246003)(4326008)(25786009)(256004)(9686003)(53936002)(86362001)(316002)(15650500001)(81166006)(81156014)(8676002)(6436002)(7736002)(305945005)(71190400001)(229853002)(71200400001)(33656002)(68736007)(3846002)(6116002)(105586002)(6916009)(106356001)(446003)(2906002)(26005)(102836004)(55236004)(486006)(97736004)(6506007)(53546011)(186003)(11346002)(74316002)(7696005)(76176011)(476003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR01MB3996;
	H:DM6PR01MB4636.prod.exchangelabs.com; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JFXa5rf1s+Cg1bsW2AC65umwtZvD+9vDUw5gVf+Y9kF1p3BsWw+Kqlia0QEjgVV6IgeByBQwKeFR6rV9ijCbFe69nhjZamwJ+Y8TS1mb33omH9oCWVYrQVREvpM4D+h9IPBjt4mYZTZOyO0MtNcIgsUOtEnhhZQqk+mn/fNB2w8gpMX41aNZ4qN0zHPHf3b2GwQT1ZOB2iPdp2Lwvxm493sCZagkcmP8qQCpMAo5EYBhnRaHJ8AhGqr58bLhZJhxgCjUVmjEwO6E4U7vZ+TsrIepPOm17HzG3+BbQydByig1hJRLj/c/bcY06IFqOgySNa06Cl1yRiuA2UQG3sziBtbHpzwEUm77mLYSwULptJluiwDmCFysxQiTNrwt6A9w+u+FlaRXpXaOPD5Y0GHlgcNsUZWiMSw7waYANQ6E5zM=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c56e9c6-0349-446c-1569-08d681f8033a
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2019 12:32:32.4273 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB3996
X-OriginatorOrg: stryker.com
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: DATETIME seems to be getting updated
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
X-List-Received-Date: Fri, 25 Jan 2019 10:03:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Um9zcywNCg0KT2guICBJIGRpZCBub3QgcmVhbGl6ZSBiaXRiYWtlLmNvbmYgd2FzIHBhcnNlZCBt
dWx0aXBsZSB0aW1lcy4gIEkgdGhvdWdodCBpdCB3YXMgcGFyc2VkIG9uY2UsIHdoaWNoIGlzIHdo
eSBJIHdhcyBjb25mdXNlZC4NCg0KVGhhbmtzIGZvciBjbGFyaWZ5aW5nLg0KDQpMZXdpcw0KDQot
LS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogQnVydG9uLCBSb3NzIDxyb3NzLmJ1cnRv
bkBpbnRlbC5jb20+IA0KU2VudDogVGh1cnNkYXksIEphbnVhcnkgMjQsIDIwMTkgNDoyMiBBTQ0K
VG86IE11aGxlbmthbXAsIExld2lzIDxsZXdpcy5tdWhsZW5rYW1wQHN0cnlrZXIuY29tPg0KQ2M6
IG9wZW5lbWJlZGRlZC1kZXZlbCA8b3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRl
ZC5vcmc+DQpTdWJqZWN0OiBSZTogW29lXSBEQVRFVElNRSBzZWVtcyB0byBiZSBnZXR0aW5nIHVw
ZGF0ZWQNCg0KT24gVGh1LCAyNCBKYW4gMjAxOSBhdCAwNDozMiwgTXVobGVua2FtcCwgTGV3aXMg
PGxld2lzLm11aGxlbmthbXBAc3RyeWtlci5jb20+IHdyb3RlOg0KPiBJdCBhcHBlYXJzIHRoYXQg
dGhlIERBVEVUSU1FIHZhcmlhYmxlIGlzIGJlaW5nIHVwZGF0ZWQuICBGcm9tIHdoYXQgSSByZWFk
IHRoaXMgc2hvdWxkIG5vdCBiZSBoYXBwZW5pbmcsIGNvcnJlY3Q/DQoNCkRBVEVUSU1FIGlzIGRl
ZmluZWQgYXMgZm9sbG93czoNCg0KREFURSA6PSAiJHtAdGltZS5zdHJmdGltZSgnJVklbSVkJyx0
aW1lLmdtdGltZSgpKX0iDQpUSU1FIDo9ICIke0B0aW1lLnN0cmZ0aW1lKCclSCVNJVMnLHRpbWUu
Z210aW1lKCkpfSINCkRBVEVUSU1FID0gIiR7REFURX0ke1RJTUV9Ig0KDQpTbyBldmVyeSB0aW1l
IGJpdGJha2UuY29uZiBpcyBwYXJzZWQsIHRoZSBkYXRldGltZSBpcyB1cGRhdGVkLiAgVGhpcyBo
YXBwZW5zIG9uY2UgZm9yIHRoZSBtYWluIHByb2Nlc3MsIGFuZCB0aGVuIGFnYWluIGZvciBldmVy
eSB3b3JrZXIgdGhhdCBiaXRiYWtlIHNwYXducy4NCg0KWW91IGNhbiBzaWxlbmNlIHRoZSAnbWV0
YWRhdGEgY2hhbmdlZCcgZXJyb3JzIGJ5IHVzaW5nIHZhcmRlcHNleGNsdWRlIHRvIG1hcmsgaXQg
YXMgYSB2YXJpYWJsZSB0aGF0IGNhbiBjaGFuZ2UgKGdyZXAgb2UtY29yZSBmb3IgZXhhbXBsZXMg
b2YgdXNpbmcgREFURVRJTUUgYW5kIHZhcmRlcHNleGNsdWRlKS4NCg0KUm9zcw0K

