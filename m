Return-Path: <pascal.bach@siemens.com>
X-Greylist: delayed 68648 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 18 Jun 2019 08:06:13 UTC
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
	(mail-eopbgr60051.outbound.protection.outlook.com [40.107.6.51])
	by mail.openembedded.org (Postfix) with ESMTP id BEE477C37F
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Jun 2019 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=siemens.onmicrosoft.com; s=selector2-siemens-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=SZhQ21QQ0CFuw5KjAYuddGzPFibLQmX41cblZFHw4lY=;
	b=XJwAz6+QDXCSKLzoQh/J3ewnup7nRfj4lp6xPoUwXxe9rqRH1K9UivCgrUl+AcVuAk9QCYSCoe8pxVzxUx0YZvglY2kAYuSz+Ke5PqFHk2TeafGvUynvVDE7uG6Aj/yWAyWEtVcISzbnqkhUymYIDteGSLb6brF+3h05z1NrtjM=
Received: from VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM (20.179.31.210) by
	VE1PR10MB3374.EURPRD10.PROD.OUTLOOK.COM (20.179.31.159) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1987.11; Mon, 17 Jun 2019 10:27:09 +0000
Received: from VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dd69:6ec0:60d8:5fd1]) by
	VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM
	([fe80::dd69:6ec0:60d8:5fd1%5]) with mapi id 15.20.1987.014;
	Mon, 17 Jun 2019 10:27:09 +0000
From: "Bach, Pascal" <pascal.bach@siemens.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCHv2] protobuf: 3.6.1 -> 3.8.0
Thread-Index: AQHVHDSIHLXyFbTrAUaKKkEhDo0QWqabjWoAgAQoFrA=
Date: Mon, 17 Jun 2019 10:27:09 +0000
Message-ID: <VE1PR10MB3421B81E954419DD786D1703F5EB0@VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM>
References: <20190606065308.23766-1-pascal.bach@siemens.com>
	<CAMKF1so=LUh2W27sVt5dhB6ASpOW0F9WqL-F48nJYimZN8Av2A@mail.gmail.com>
In-Reply-To: <CAMKF1so=LUh2W27sVt5dhB6ASpOW0F9WqL-F48nJYimZN8Av2A@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-document-confidentiality: NotClassified
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=pascal.bach@siemens.com; 
x-originating-ip: [185.46.214.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3fcc9e77-0eec-4fef-7d65-08d6f30e5aaf
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
	SRVR:VE1PR10MB3374; 
x-ms-traffictypediagnostic: VE1PR10MB3374:
x-ms-exchange-purlcount: 4
x-microsoft-antispam-prvs: <VE1PR10MB337402FED7307DED57DC7E31F5EB0@VE1PR10MB3374.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4303;
x-forefront-prvs: 0071BFA85B
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(396003)(366004)(39860400002)(136003)(346002)(376002)(199004)(189003)(13464003)(305945005)(7736002)(316002)(73956011)(64756008)(66556008)(66476007)(66946007)(6436002)(2906002)(6116002)(6246003)(6506007)(53546011)(76176011)(7696005)(55016002)(6306002)(478600001)(53936002)(14444005)(256004)(9686003)(3846002)(45080400002)(14454004)(71200400001)(71190400001)(81156014)(74316002)(8676002)(186003)(68736007)(66446008)(229853002)(11346002)(446003)(966005)(76116006)(33656002)(66066001)(8936002)(81166006)(486006)(476003)(26005)(102836004)(6916009)(99286004)(25786009)(5660300002)(52536014)(4326008)(86362001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VE1PR10MB3374;
	H:VE1PR10MB3421.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: siemens.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: V7BWEV9YL0kgg5Lxg0AlAq0M5WvQ3vzd7Jc8b3XqtGTe9dk8GQxwIcWA2zSkmlFe6vOPySQ5XGB3OBY1K5tVkVTUOG3YvFv0/5m4OVKJT6e2lMkweP+tHVm+8v3ma4NK7/mooSXTczk4EWo0ehM6MOLMO8lAxecDfTGKpBEg2sbOU27GfrUrxEwy+JHh56ENfcsrX+9kSqcuglHDLcGnK1LpTpLThOnpu6lVJKoYlPPg1DTzZfTUMMRG149Jiyu9YnnGIA1LDfrfR0UUnTioHeG5BkQKk5DSTAtT5EBh0V3EB4F9f2VPxyQEsLuG37TOOVnEOJ5QIK9jW1au+WRACJw7/i82mtcsY8fHWwQOT75BScwiszq4YXlhmxrSsZg1L9wULvJ6AOdfc/uay9Li5j6LDE1SsVdh7XG5jnadr0k=
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fcc9e77-0eec-4fef-7d65-08d6f30e5aaf
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2019 10:27:09.2887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pascal.bach@siemens.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR10MB3374
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCHv2] protobuf: 3.6.1 -> 3.8.0
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
X-List-Received-Date: Tue, 18 Jun 2019 08:06:14 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SSB1cGRhdGVkIHB5dGhvbi1wcm90b2J1ZiBhbmQgcHl0aG9uMy1wcm90b2J1ZiBhY2NvcmRpbmds
eS4gSSBhbHNvIGhhZCB0byBhZGQgYSBwYXRjaCB0byBwcm90b2J1ZiBpdHNlbGYgdG8gbWFrZSB0
aGluZ3Mgd29yay4NCg0KQnV0IEkgdGhpbmsgSSBtZXNzZWQgdXAgdGhlIG1haWwgc28gaXQgYXJy
aXZlZCBhcyBhIG5ldyBwYXRjaCBzZXJpZXMgaW5zdGVhZCBvZiBhIG5ldyByZXZpc2lvbiBvZiB0
aGUgb2xkIG9uZToNCmh0dHBzOi8vcGF0Y2h3b3JrLm9wZW5lbWJlZGRlZC5vcmcvc2VyaWVzLzE4
MTgyLyB2cyBodHRwczovL3BhdGNod29yay5vcGVuZW1iZWRkZWQub3JnL3Nlcmllcy8xNzk5NS8N
Cg0KUGFzY2FsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBS
YWogPHJhai5raGVtQGdtYWlsLmNvbT4NCj4gU2VudDogRnJlaXRhZywgMTQuIEp1bmkgMjAxOSAy
MDo1Nw0KPiBUbzogQmFjaCwgUGFzY2FsIChTSSBCUCBSJkQgWkcgRlcpIDxwYXNjYWwuYmFjaEBz
aWVtZW5zLmNvbT4NCj4gQ2M6IG9wZW5lbWJlZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtDQo+IGRl
dmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbb2VdIFttZXRhLW9l
XVtQQVRDSHYyXSBwcm90b2J1ZjogMy42LjEgLT4gMy44LjANCj4gDQo+IE9uIFdlZCwgSnVuIDUs
IDIwMTkgYXQgMTE6NTMgUE0gUGFzY2FsIEJhY2ggPHBhc2NhbC5iYWNoQHNpZW1lbnMuY29tPg0K
PiB3cm90ZToNCj4gPg0KPiA+IFNpbXBsZSB1cGRhdGUgdG8gbGF0ZXN0IHJlbGVhc2UNCj4gPg0K
PiANCj4gSSBndWVzcyB5b3UgYWxzbyBuZWVkIHRvIGJyaW5nIHB5dGhvbi1wcm90b2J1ZiB1cHRv
IHNwZWVkIGFzIHdlbGwuIEkgc2VlIHRoaXMNCj4gZmFpbHVyZQ0KPiBodHRwczovL2V1cjAxLnNh
ZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZlcnJvcg0K
PiBzLnlvY3RvcHJvamVjdC5vcmclMkZFcnJvcnMlMkZEZXRhaWxzJTJGMjQ4NjkwJTJGJmFtcDtk
YXRhPTAyJTdDMDENCj4gJTdDcGFzY2FsLmJhY2glNDBzaWVtZW5zLmNvbSU3Qzg5NThmYmIwZGFi
MjQzZDQyZmExMDhkNmYwZmExZGU0JTcNCj4gQzM4YWUzYmNkOTU3OTRmZDRhZGRhYjQyZTE0OTVk
NTVhJTdDMSU3QzAlN0M2MzY5NjEzNTQzNjA3MTcyMDkmDQo+IGFtcDtzZGF0YT0zU1pST0dKRFlW
QTN5U1pENGclMkZXNTE0eWhOUmlSZVl1S01UJTJCS2xwJTJCcXdzDQo+ICUzRCZhbXA7cmVzZXJ2
ZWQ9MA0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBQYXNjYWwgQmFjaCA8cGFzY2FsLmJhY2hAc2ll
bWVucy5jb20+DQo+ID4gLS0tDQo+ID4gIC4uLi9wcm90b2J1Zi97cHJvdG9idWZfMy42LjEuYmIg
PT4gcHJvdG9idWZfMy44LjAuYmJ9ICAgICAgICAgICAgICAgfCA2ICsrLS0tLQ0KPiA+ICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKSAgcmVuYW1lDQo+ID4g
bWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3twcm90b2J1Zl8zLjYuMS5iYiA9Pg0K
PiA+IHByb3RvYnVmXzMuOC4wLmJifSAoOTUlKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL21ldGEt
b2UvcmVjaXBlcy1kZXZ0b29scy9wcm90b2J1Zi9wcm90b2J1Zl8zLjYuMS5iYg0KPiA+IGIvbWV0
YS1vZS9yZWNpcGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzMuOC4wLmJiDQo+ID4gc2lt
aWxhcml0eSBpbmRleCA5NSUNCj4gPiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZGV2dG9v
bHMvcHJvdG9idWYvcHJvdG9idWZfMy42LjEuYmINCj4gPiByZW5hbWUgdG8gbWV0YS1vZS9yZWNp
cGVzLWRldnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzMuOC4wLmJiDQo+ID4gaW5kZXggY2Y3MmQ5
Y2E3Li4wODkyMTc4YzAgMTAwNjQ0DQo+ID4gLS0tIGEvbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xz
L3Byb3RvYnVmL3Byb3RvYnVmXzMuNi4xLmJiDQo+ID4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRl
dnRvb2xzL3Byb3RvYnVmL3Byb3RvYnVmXzMuOC4wLmJiDQo+ID4gQEAgLTEwLDExICsxMCw5IEBA
IExJQ19GSUxFU19DSEtTVU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0U7bWQ1PTM3YjU3NjJlMDdmMGFm
OGM3NGNlODBhOGJkYTQyNjZiIg0KPiA+ICBERVBFTkRTID0gInpsaWIiDQo+ID4gIERFUEVORFNf
YXBwZW5kX2NsYXNzLXRhcmdldCA9ICIgcHJvdG9idWYtbmF0aXZlIg0KPiA+DQo+ID4gLVBWIC49
ICIrZ2l0JHtTUkNQVn0iDQo+ID4gK1NSQ1JFViA9ICIwOTc0NTU3NWE5MjM2NDAxNTRiY2YzMDdm
YmE4YWVkZmY0N2YyNDBhIg0KPiA+DQo+ID4gLVNSQ1JFViA9ICI0OGNiMThlNWM0MTlkZGQyM2Q5
YmFkY2ZlNGU5ZGY3YmRlMTk3OWIyIg0KPiA+IC0NCj4gPiAtU1JDX1VSSSA9ICJnaXQ6Ly9naXRo
dWIuY29tL2dvb2dsZS9wcm90b2J1Zi5naXQ7YnJhbmNoPTMuNi54IFwNCj4gPiArU1JDX1VSSSA9
ICJnaXQ6Ly9naXRodWIuY29tL2dvb2dsZS9wcm90b2J1Zi5naXQ7YnJhbmNoPTMuOC54IFwNCj4g
PiAgICAgICAgICAgICBmaWxlOi8vcnVuLXB0ZXN0IFwNCj4gPiAgICAgICAgICAgICBmaWxlOi8v
MDAwMS1wcm90b2J1Zi1maXgtY29uZmlndXJlLWVycm9yLnBhdGNoIFwgICINCj4gPiAtLQ0KPiA+
IDIuMTEuMA0KPiA+DQo+ID4gLS0NCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXw0KPiA+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
PiBPcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IGh0dHBzOi8v
ZXVyMDEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwJTNBJTJGJTJG
bGlzdHMNCj4gPiAub3BlbmVtYmVkZGVkLm9yZyUyRm1haWxtYW4lMkZsaXN0aW5mbyUyRm9wZW5l
bWJlZGRlZC0NCj4gZGV2ZWwmYW1wO2RhdGE9MA0KPiA+DQo+IDIlN0MwMSU3Q3Bhc2NhbC5iYWNo
JTQwc2llbWVucy5jb20lN0M4OTU4ZmJiMGRhYjI0M2Q0MmZhMTA4ZDZmMGZhDQo+IDFkZTQlDQo+
ID4NCj4gN0MzOGFlM2JjZDk1Nzk0ZmQ0YWRkYWI0MmUxNDk1ZDU1YSU3QzElN0MwJTdDNjM2OTYx
MzU0MzYwNzE3MjA5DQo+ICZhbXA7c2QNCj4gPg0KPiBhdGE9U2ljYU9LMFhGSmFQdHBqMmlwRzFr
JTJCY2pTNTJmNGYyZFZ5S2RIbGNhUDlNJTNEJmFtcDtyZXNlcnZlZA0KPiA9MA0K

