Return-Path: <mohamad.noor.alim.hussin@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id EA6877F33A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Dec 2019 08:11:55 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	30 Dec 2019 00:11:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,374,1571727600"; d="scan'208";a="301203995"
Received: from fmsmsx106.amr.corp.intel.com ([10.18.124.204])
	by orsmga001.jf.intel.com with ESMTP; 30 Dec 2019 00:11:56 -0800
Received: from fmsmsx117.amr.corp.intel.com (10.18.116.17) by
	FMSMSX106.amr.corp.intel.com (10.18.124.204) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Mon, 30 Dec 2019 00:11:56 -0800
Received: from FMSEDG002.ED.cps.intel.com (10.1.192.134) by
	fmsmsx117.amr.corp.intel.com (10.18.116.17) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Mon, 30 Dec 2019 00:11:55 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
	by edgegateway.intel.com (192.55.55.69) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Mon, 30 Dec 2019 00:11:52 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=QbJ27bFoI2ktIiUfRNMd/3taZOVK8hWAlxcBABMZ/mNor8WK8XY+rliOmo3Ljp08yRc1gUxDnujSEYbYrG0dwbkDe9FsaPraoBeLFYlHeqbA4Pp4X4gFzXicEvH6xKQJ+DXlcKqATKJO23uXgOA1esnzue7NNPLk+PdAd2sbqBJp9Gi7lZkfseDd2X58ekmZbwgXFDiAJMYdsRS3DIBRmxM3OqsJd3FaFtJFmGPl3KBKDJNHwd2z0Zx4X+Km23gp/DJNlcssKen5XLs14sMpWvU95HHGbnkcfiTat0USEHGlTTFjOUnGjiJGiMrfENu+0JHUmqLC+MmXM8XvQVFMFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6w6FORC7yJsU863ymBk+4+xX8Yw3HL9u7dAy6NyATrY=;
	b=lFB/+le06TAeSE329V0HjS0DrnEUQYfHVZi4lqzFHSBegs3OLTsrbtV/dEyhN2dfHIx6PORI93W6lXIzzrIeseByEUtmRS1drEuoCg7aROmNU5hKcY2NrMarFPDxleTBqS2mNNlG3j42ukmt91LTo46l8N12hKHFbG1a3GzBXpTTJ7ue8Ew9v2pXnx+u8a3ltxK9336JeXdWl6b7hNMIHgiAzPCl4Qrdh6I09XUxnpbkS6atboAKQ5lsG+tr7af2WNLWtMB2isgDL2iEOAEB1V5cy8lxII4G1zSYdRCONlA/twDezdsvdJai+C4k+Qapra04rx1+3TY2PX6SnBmG3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
	smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com; 
	dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com; 
	s=selector2-intel-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=6w6FORC7yJsU863ymBk+4+xX8Yw3HL9u7dAy6NyATrY=;
	b=LFgT2Th7YhX6GtGhDLKUmOiD04bgz1Vj5p+cy/87t30vvarbopE+v+rxWVfO0KXV/OF68g8L98N+Jt9UV63EkGmIE5ZpyrVbaDj/TSswBihY8/ltVWluTBwnhY2LyfREKgIs34/SPbPTCWJy9VkAobAhUBdoEFhzkyZ3jmujaBM=
Received: from MN2PR11MB3869.namprd11.prod.outlook.com (20.179.150.80) by
	MN2PR11MB3789.namprd11.prod.outlook.com (20.178.252.141) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2581.12; Mon, 30 Dec 2019 08:11:37 +0000
Received: from MN2PR11MB3869.namprd11.prod.outlook.com
	([fe80::8944:83c:1c3:6565]) by MN2PR11MB3869.namprd11.prod.outlook.com
	([fe80::8944:83c:1c3:6565%5]) with mapi id 15.20.2581.007;
	Mon, 30 Dec 2019 08:11:37 +0000
From: "Hussin, Mohamad Noor Alim" <mohamad.noor.alim.hussin@intel.com>
To: Richard Leitner <richard.leitner@skidata.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-java][PATCH] icedtea7-native: Fix compilation error
	due to format-overflow
Thread-Index: AQHVvKT4J6U/SKHjJUaLb6jyVVZDpqfSVkjg
Date: Mon, 30 Dec 2019 08:11:37 +0000
Message-ID: <MN2PR11MB3869D24614B757D80030053D8D270@MN2PR11MB3869.namprd11.prod.outlook.com>
References: <20191205024315.20529-1-mohamad.noor.alim.hussin@intel.com>
	<21dcaf2a-8a4f-4c03-e3a9-64dcd57afe83@skidata.com>
In-Reply-To: <21dcaf2a-8a4f-4c03-e3a9-64dcd57afe83@skidata.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
dlp-reaction: no-action
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=mohamad.noor.alim.hussin@intel.com; 
x-originating-ip: [192.198.147.207]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8c4fecf3-d441-439c-d007-08d78cffe48a
x-ms-traffictypediagnostic: MN2PR11MB3789:
x-microsoft-antispam-prvs: <MN2PR11MB378936C15078A7BC53AC5CC68D270@MN2PR11MB3789.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1265;
x-forefront-prvs: 0267E514F9
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(366004)(136003)(39860400002)(13464003)(199004)(189003)(2906002)(5660300002)(66476007)(52536014)(316002)(64756008)(110136005)(66446008)(66556008)(66946007)(76116006)(478600001)(8676002)(81156014)(81166006)(26005)(7696005)(53546011)(55016002)(8936002)(33656002)(9686003)(86362001)(186003)(966005)(71200400001)(6506007);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MN2PR11MB3789;
	H:MN2PR11MB3869.namprd11.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nF9WGxjFtwsRUEQE38yw0pixKIS/sRY7EMCIEfWHwi87OvSs/ZoTzYpBYidCtNWE7DscJBPj4qHf6vbIt31J0lQCkq4R3IF+qFB8zqaRBB0KGHNEYcMUacjSzsceyKxzEYkJpCbYZnQ8p+mMQYjKlCP3zD1EStJk0RY7WowYBvnvv5UCJ4p+vMqb0ikE01sIbxdNhTy3MqhQEamQaJoINTD+s/YrKtruJx35N16lOtMJhE/b8u61wOWjQrRYrcUY3Fvr3FDqhUrJ5rkSJ+o9Q56BMnMKpysncEB5WNga3Q852akUKc2ySCrHWUGvPiw5+NSzQUEEFyzxg44mUj6fuZ/SvbkZ5SvRAee5Lgo25oL+XREoymXEgWnrQbF/2y+/lM3CgIzt4F6kqMqxFcqITLPB4Z6RANzcNg3eMQqRUBiJ4fZ1j8yIeYgUj+1Audip/BLUlt1vVcDDJafxLm1SQHq02APTLQk+85bKkwh5KDzGafnt6yd9Xa6BZ1BsGT7BBbGAA62yEQxreWpBF01ASV6GkuY6iZSuitSIAy6A6Hk=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c4fecf3-d441-439c-d007-08d78cffe48a
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Dec 2019 08:11:37.3347 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WRV1IfhQu7UtvfbFhBHRJBXoo/Mm9P+UKzGJuO6vohi5eER0smSh1GxP5iTpfBnzwGQxE9gdvfFbMdDQ7mVPU4u78ZI1x0PE7xDBqtlYfEh7dNSSIPHUXcJ738+QUO4G
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB3789
X-OriginatorOrg: intel.com
Subject: Re: [meta-java][PATCH] icedtea7-native: Fix compilation error due to format-overflow
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
X-List-Received-Date: Mon, 30 Dec 2019 08:11:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgUmljaGFyZCwNCg0KSSBhbSB1c2luZyBnY2MgOC4zLjAuIEkgZ2V0IHRoaXMgZXJyb3Igd2hp
bGUgY29tcGlsaW5nIHRoZSBzb3VyY2UgY29kZSBob3RzcG90L3NyYy9zaGFyZS92bS9hZGxjL291
dHB1dF9jLmNwcCB3aGljaCByZWxhdGVkIHRvIHNwcmludGYuIA0KU2VlIHRoZSBlcnJvciBsb2cg
YmVsb3cuDQoNCi93b3Jrc3BhY2UvcG9reS9idWlsZC90bXAvd29yay94ODZfNjQtbGludXgvaWNl
ZHRlYTctbmF0aXZlLzIuMS4zLXIxLjAvaWNlZHRlYS0yLjEuMy9idWlsZC9vcGVuamRrLWJvb3Qv
aG90c3BvdC9zcmMvc2hhcmUvdm0vYWRsYy9vdXRwdXRfYy5jcHA6MTIzOTozNDogZXJyb3I6IOKA
mF9pZHjigJkgZGlyZWN0aXZlIHdyaXRpbmcgNCBieXRlcyBpbnRvIGEgcmVnaW9uIG9mIHNpemUg
YmV0d2VlbiAyIGFuZCAxMiBbLVdlcnJvcj1mb3JtYXQtb3ZlcmZsb3c9XQ0KICAgICAgICAgICBz
cHJpbnRmKGxlZnRfcmVnX2luZGV4LCIsaW5zdCVkX2lkeCVkIiwgbGVmdF9pbmRleCwgbGVmdF9v
cF9pbmRleCk7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+DQovd29ya3NwYWNlL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2ljZWR0ZWE3
LW5hdGl2ZS8yLjEuMy1yMS4wL2ljZWR0ZWEtMi4xLjMvYnVpbGQvb3Blbmpkay1ib290L2hvdHNw
b3Qvc3JjL3NoYXJlL3ZtL2FkbGMvb3V0cHV0X2MuY3BwOjEyMzk6MzQ6IG5vdGU6IGRpcmVjdGl2
ZSBhcmd1bWVudCBpbiB0aGUgcmFuZ2UgWy0yMTQ3NDgzNjQ4LCA5OTk5XQ0KSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIC91c3IvaW5jbHVkZS9zdGRpby5oOjg3MywNCiAgICAgICAgICAgICAgICAgZnJv
bSAvd29ya3NwYWNlL3Bva3kvYnVpbGQvdG1wL3dvcmsveDg2XzY0LWxpbnV4L2ljZWR0ZWE3LW5h
dGl2ZS8yLjEuMy1yMS4wL2ljZWR0ZWEtMi4xLjMvYnVpbGQvb3Blbmpkay1ib290L2hvdHNwb3Qv
c3JjL3NoYXJlL3ZtL2FkbGMvYWRsYy5ocHA6MzMsDQogICAgICAgICAgICAgICAgIGZyb20gL3dv
cmtzcGFjZS9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9pY2VkdGVhNy1uYXRpdmUv
Mi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1aWxkL29wZW5qZGstYm9vdC9ob3RzcG90L3NyYy9z
aGFyZS92bS9hZGxjL291dHB1dF9jLmNwcDoyNzoNCi91c3IvaW5jbHVkZS94ODZfNjQtbGludXgt
Z251L2JpdHMvc3RkaW8yLmg6MzY6MzQ6IG5vdGU6IOKAmF9fYnVpbHRpbl9fX3NwcmludGZfY2hr
4oCZIG91dHB1dCBiZXR3ZWVuIDEyIGFuZCAzMiBieXRlcyBpbnRvIGEgZGVzdGluYXRpb24gb2Yg
c2l6ZSAxOA0KICAgcmV0dXJuIF9fYnVpbHRpbl9fX3NwcmludGZfY2hrIChfX3MsIF9fVVNFX0ZP
UlRJRllfTEVWRUwgLSAxLA0KICAgICAgICAgIH5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fl5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fg0KICAgICAgIF9fYm9zIChfX3MpLCBfX2ZtdCwgX192
YV9hcmdfcGFjayAoKSk7DQogICAgICAgfn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fg0KL3dvcmtzcGFjZS9wb2t5L2J1aWxkL3RtcC93b3JrL3g4Nl82NC1saW51eC9pY2VkdGVh
Ny1uYXRpdmUvMi4xLjMtcjEuMC9pY2VkdGVhLTIuMS4zL2J1aWxkL29wZW5qZGstYm9vdC9ob3Rz
cG90L3NyYy9zaGFyZS92bS9hZGxjL291dHB1dF9jLmNwcDoxMjUyOjM3OiBlcnJvcjog4oCYX2lk
eOKAmSBkaXJlY3RpdmUgd3JpdGluZyA0IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSBiZXR3
ZWVuIDIgYW5kIDEyIFstV2Vycm9yPWZvcm1hdC1vdmVyZmxvdz1dDQogICAgICAgICAgICAgc3By
aW50ZihyaWdodF9yZWdfaW5kZXgsIixpbnN0JWRfaWR4JWQiLCByaWdodF9pbmRleCwgcmlnaHRf
b3BfaW5kZXgpOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+
fn5+fn5+fg0KDQpCeSB0aGUgd2F5LCB0aGlzIHBhdGNoIGZpbGUgInJlY2lwZXMtY29yZS9pY2Vk
dGVhL29wZW5qZGstNy0wM2IxNDcvaWNlZHRlYS1ob3RzcG90LWhhbmRsZS1nY2M3LWZvcm1hdC1v
dmVyZmxvdy5wYXRjaCIgaXMgc2V0IHRvIGFwcGx5PW5vIA0KaW4gcmVjaXBlIGZpbGUgaHR0cHM6
Ly9naXQueW9jdG9wcm9qZWN0Lm9yZy9jZ2l0L2NnaXQuY2dpL21ldGEtamF2YS90cmVlL3JlY2lw
ZXMtY29yZS9pY2VkdGVhL29wZW5qZGstNy1yZWxlYXNlLTAzYjE0Ny5pbmMjbjkyLg0KU28sIHRo
YXQgcGF0Y2ggZmlsZSB3aWxsIG5vdCBhcHBseSBkdXJpbmcgZG9fcGF0Y2guDQoNClJlZ2FyZHMs
DQpBbGltIEh1c3Npbg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogUmljaGFy
ZCBMZWl0bmVyIDxyaWNoYXJkLmxlaXRuZXJAc2tpZGF0YS5jb20+IA0KU2VudDogRnJpZGF5LCBE
ZWNlbWJlciAyNywgMjAxOSA3OjAwIFBNDQpUbzogSHVzc2luLCBNb2hhbWFkIE5vb3IgQWxpbSA8
bW9oYW1hZC5ub29yLmFsaW0uaHVzc2luQGludGVsLmNvbT47IG9wZW5lbWJlZGRlZC1kZXZlbEBs
aXN0cy5vcGVuZW1iZWRkZWQub3JnDQpTdWJqZWN0OiBSZTogW29lXSBbbWV0YS1qYXZhXVtQQVRD
SF0gaWNlZHRlYTctbmF0aXZlOiBGaXggY29tcGlsYXRpb24gZXJyb3IgZHVlIHRvIGZvcm1hdC1v
dmVyZmxvdw0KDQpIaSwNCg0KT24gMDUvMTIvMjAxOSAwMzo0MywgbW9oYW1hZC5ub29yLmFsaW0u
aHVzc2luQGludGVsLmNvbSB3cm90ZToNCj4gRnJvbTogTW9oYW1hZCBOb29yIEFsaW0gSHVzc2lu
IDxtb2hhbWFkLm5vb3IuYWxpbS5odXNzaW5AaW50ZWwuY29tPg0KPiANCj4gR2V0dGluZyBhIGNv
bXBpbGF0b24gZXJyb3IgZHVlIHRvIGZvcm1hdC1vdmVyZmxvdy4gV29ya2Fyb3VuZCB0byANCj4g
c3VwcHJlc3MgdGhlIGVycm9yIG1lc3NhZ2UgYnkgaWdub3JlIHRoZSB3YXJuaW5nLg0KDQpTYW1l
IGFzIGZvciBqZGsgOCwgQUZBSUsgdGhlc2Ugd2FybmluZ3Mgc2hvdWxkIGJlIGZpeGVkIGJ5IHJl
Y2lwZXMtY29yZS9pY2VkdGVhL29wZW5qZGstNy0wM2IxNDcvaWNlZHRlYS1ob3RzcG90LWhhbmRs
ZS1nY2M3LWZvcm1hdC1vdmVyZmxvdy5wYXRjaA0KDQpXaGVyZS93aHkgZG8geW91IGdldCB0aGVt
Pw0KDQpyZWdhcmRzO1JpY2hhcmQuTA0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNb2hhbWFkIE5v
b3IgQWxpbSBIdXNzaW4gDQo+IDxtb2hhbWFkLm5vb3IuYWxpbS5odXNzaW5AaW50ZWwuY29tPg0K
PiAtLS0NCj4gICByZWNpcGVzLWNvcmUvaWNlZHRlYS9pY2VkdGVhNy1uYXRpdmUuaW5jIHwgMiAr
LQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL3JlY2lwZXMtY29yZS9pY2VkdGVhL2ljZWR0ZWE3LW5hdGl2ZS5pbmMg
DQo+IGIvcmVjaXBlcy1jb3JlL2ljZWR0ZWEvaWNlZHRlYTctbmF0aXZlLmluYw0KPiBpbmRleCBi
NTc4Y2IyLi4wMzI5ZDcxIDEwMDY0NA0KPiAtLS0gYS9yZWNpcGVzLWNvcmUvaWNlZHRlYS9pY2Vk
dGVhNy1uYXRpdmUuaW5jDQo+ICsrKyBiL3JlY2lwZXMtY29yZS9pY2VkdGVhL2ljZWR0ZWE3LW5h
dGl2ZS5pbmMNCj4gQEAgLTI2LDcgKzI2LDcgQEAgQ1hYRkxBR1NfYXBwZW5kID0gIiAtZm5vLXRy
ZWUtZHNlIg0KPiAgIENYWF9hcHBlbmQgPSAiIC1zdGQ9Z251Kys5OCINCj4gICANCj4gICAjIFdP
UktBUk9VTkQ6IGlnbm9yZSBlcnJvcnMgZnJvbSBuZXcgY29tcGlsZXJzIC1DRkxBR1NfYXBwZW5k
ID0gIiANCj4gLVduby1lcnJvcj1zdHJpbmdvcC1vdmVyZmxvdyAtV25vLWVycm9yPXJldHVybi10
eXBlIg0KPiArQ0ZMQUdTX2FwcGVuZCA9ICIgLVduby1lcnJvcj1zdHJpbmdvcC1vdmVyZmxvdyAt
V25vLWVycm9yPXJldHVybi10eXBlIC1Xbm8tZXJyb3I9Zm9ybWF0LW92ZXJmbG93Ig0KPiAgIA0K
PiAgIGluaGVyaXQgbmF0aXZlIGphdmEgYXV0b3Rvb2xzIHBrZ2NvbmZpZw0KPiAgIGluaGVyaXQg
b3Blbmpkay1idWlsZC1oZWxwZXINCj4gDQo=

