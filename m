Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.112])
 by mx.groups.io with SMTP id smtpd.web09.3864.1628659074049396505
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 10 Aug 2021 22:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@skidata.com header.s=selector1 header.b=zng5Qy7M;
 spf=pass (domain: skidata.com, ip: 40.107.7.112, mailfrom: richard.leitner@skidata.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MYO+VPMghoHdSgJ9fDqCFNLmxxsE/AH6Fvb5zpcO4/zShqCSoON5X7oHnF6L6jT/mg9JBF/m10QcBoK0iBQNMRpaKNGCQlEpqDAqQ5OFN7H47F40yc+R+7fDYILrNK265hO/Bud92h/+cYSoz2Crbun/aB5/EMlzwGAKfwUU+buPztS2XYKsz37DlfiWWMZoJk42FywoEm9pNdaOTARMofqW5ZKBS5AYhhVSLFKniaDwzUj9e6ND2TaMb7iRHPUElahnDRRZEa0JlDw/RdIwYdlDLpTim96H9ssYhaMV55ryB7vZBmZX+02EZgbTiMJ/4qL83jHdD3p7cAQ6+acLDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+12nimCn+hsLgISqeLDze4+/2vnbAp/qHfMKjK8cuU=;
 b=m6Lsu5MehrcC8sTDQkZn6g2ebFkFNyAuKvpw8NglFow8OMtvNurLYmMx68uvrhMcy3FI6dPfjoEMyK/4uFBJooQQePqPtdgNow3NHWNaKlL/f4EPPrrHjJSS9FpvxbfgD6k16I8EzKO+2wgrDKaOkY8AWRUnCXuqQ8m2v/qAu9bp03F4zl4G4SwUO0maoetQGTbgkbLdKIIdhqr6aNhfv12uJST17/lbp6+Zbj2WDRj3jkT0vYI/01rGBpGjYmIGf4vkjBgTXoYGHw6AF8bBjhvSg+QVJR15XH3PVRKoCA8TzKlsCoZ8F93kdHaqrSzZIp5iWo3FmoiyB8vRpBAzbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=skidata.com; dmarc=pass action=none header.from=skidata.com;
 dkim=pass header.d=skidata.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=skidata.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+12nimCn+hsLgISqeLDze4+/2vnbAp/qHfMKjK8cuU=;
 b=zng5Qy7M6aPew1tTUR07tx3vKPA9fLATWl3WoeRKy7YgWl14G84Bs5regjsc2+9YEnl8RoEl0NU7qMQemtBSprNZB3q62e26LLI+633IkB25uOilAJkpVHl3UIZucx3K954YlKO/eUDIgHVal7CSu/N1kax6IDuMYDPDrUy7qHAW5n9Frql+d0mWQ33ym3TVsvXsT5C/I2XR/q1LaWpJOq0Uhb0oMCEKA8okToEmlCmofNbCFtgdVRb6exjVyCbcbPLy4Knx3UWV4TfPAHq0kqofYK7l3vzPYsrIA0bMaU/oT9YC8IPB6UcRY1PbZ/zGCmxh4cmIO8ssFJmKavMpPQ==
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com (2603:10a6:800:1b3::19)
 by VI1PR05MB4318.eurprd05.prod.outlook.com (2603:10a6:803:42::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 05:17:51 +0000
Received: from VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::ecf1:3be2:cf9a:a102]) by VE1PR05MB7376.eurprd05.prod.outlook.com
 ([fe80::ecf1:3be2:cf9a:a102%7]) with mapi id 15.20.4394.025; Wed, 11 Aug 2021
 05:17:51 +0000
From: "Richard Leitner" <richard.leitner@skidata.com>
To: "jainsaloni0918@gmail.com" <jainsaloni0918@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, "otavio@ossystems.com.br"
	<otavio@ossystems.com.br>, "raj.khem@gmail.com" <raj.khem@gmail.com>,
	"nisha.parrakat@kpit.com" <nisha.parrakat@kpit.com>, Saloni Jain
	<Saloni.Jain@kpit.com>
Subject: Re: [oe] [meta-java][dunfell][PATCH] xerces-j: Whitelisted CVE-2018-2799
Thread-Topic: [oe] [meta-java][dunfell][PATCH] xerces-j: Whitelisted
 CVE-2018-2799
Thread-Index: AQHXfT8VSqGJmoTZjkmGpQUCrBcc+att5fYA
Date: Wed, 11 Aug 2021 05:17:51 +0000
Message-ID: <YRNdfmGFBksc09v+@ltleri2>
References: <20210720081140.21159-1-jainsaloni0918@gmail.com>
In-Reply-To: <20210720081140.21159-1-jainsaloni0918@gmail.com>
Accept-Language: en-AT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=skidata.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8523d0aa-f04e-4483-442c-08d95c875dbd
x-ms-traffictypediagnostic: VI1PR05MB4318:
x-microsoft-antispam-prvs: 
 <VI1PR05MB43181E17A403AFF50623CC4DF0F89@VI1PR05MB4318.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Ji0HH8cfWEm+T5RXpppf4HDRv95wiU9IK753uUdO1W2i9YF/zYCjp/6W0MvVZPX9rwyvfYhTLaWc8WXQo8IpbjueLavKDcnkZ8LvyJ2rGG1NNA789l7camvLEF9gU6JCtn2QpPqq6DrJTigmqlcI/Kmo/3uVo7hTEwYshdmtQscBMlearOT3A0XaEz9xMeb5ttdgJ6TAVN9s9AtwfOj47JkwvE9Qvpmo2Pzt2BIk74h3qwls3stgseOW+jT1s4q7uJgFwFCPf0fKyfsANDcz8TXN/2bVLrKuXn/3jj4DUEZUr3RJSjG/HAF5oNp3RSV9087cArn82ALNI2INv0bV2H9Q4ZpCVnMmJOm9AemoT+kRpxFnjO+Bu3jYD1Qs5yhV7QM9Cd0pmsS/rxzVM+Gm/XdZVk+aTv+L4hsW7wmPXEAdo+zybohwray7fRNCs+QDDLA4uK2lbotOwNj6yNXvDTQoNOAOyeVTNwg/UpFbKpJzboSram0uLHsbjNpv9/fhJyA4oJIJBChBAu1DCfHBGiWHpUCgvssHnzfufuXTbM/UaayjBIM7oiCDJ5rBDFAJlUcJdgyXmdMOIksaTepeFTE7BMFLi/O63h0t+/Oc/JW8Lwgt0+3l/U522kmdVdSGqxADMMt19PHpwlbEqQGtWf/o/lDm7aSXYgOrqjNlQoiqohhOw53zODVOB+kMGoYfQvjrAlBDcCttm0gGel7OQLjhwet++ooxNgMkeZA13IanYoQ4yIp7PrwXnBHTV2vH+fwSEek1Y3qusYrZ/WTu8h1cv2RdiDJrcgTl8v3X38I=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR05MB7376.eurprd05.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(136003)(346002)(39850400004)(376002)(396003)(4326008)(186003)(5660300002)(122000001)(966005)(38100700002)(83380400001)(6506007)(478600001)(316002)(54906003)(71200400001)(26005)(91956017)(76116006)(66446008)(66946007)(66476007)(66556008)(64756008)(2906002)(6916009)(86362001)(6486002)(8676002)(38070700005)(6512007)(33716001)(9686003)(8936002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?dUZ2WWsvSVQ1WkJUZjJ3Z3pDWmtlc2RmRzdaYUsyckhJMWM1SGY3bG1KUFlG?=
 =?utf-8?B?SDNPdy84N25RcGRKRjNMSDJSZGhCdE5keGlvSmRLQm84am1tUXJ5Tzg3MmJy?=
 =?utf-8?B?MmVjUU1GUzh5d0ovcGpVVDJkaVFRUXEzUCs4Y0VOczhjSHB0MHVlbjR4K0Fj?=
 =?utf-8?B?bkNKemdyb1llNmJOei96S0JVTVR6NXMydy83RXlUL25xTkw1dlVxdGRNZENW?=
 =?utf-8?B?RUJFV0hCZWhIMjJyekdlbXJsYXZjZzBaWXNYMm1TWkh0bDEyUVFWdzgxT2Iw?=
 =?utf-8?B?Zkp3a1ZWWnB0dlJ1c2kzQnhKZ2FJb3YxVTRjcmtTd2dFY3o4clBiOXBveTFI?=
 =?utf-8?B?dXRBa05UL1o5ME9xcEVpY2xkQ1NHUUZyZmJRdEhHc29KMG5KaWhReDBIK2pR?=
 =?utf-8?B?dFZkRVV6bWxCNk9wRVdOdGd3M2EvOUd2VnM1M1dXLzV2am1NaUo5K2wxWWlJ?=
 =?utf-8?B?L3VuWU1rVXNzRUw1MUJmU2ZNQ1IvOVJnOGNNU3NuanZiMHc0RElLZUlwN09u?=
 =?utf-8?B?SmJzSFZnMXBLU3RBMlAvR2dmVkl2dzVKSEtSTmFqdEZWV0Nva2xUZ1JveWxl?=
 =?utf-8?B?MmhKaW42QzhiQ25jOGo1ZlBWbUoyMFFWVDNlaHFraDNDMiswMlhmcExKYWZI?=
 =?utf-8?B?YzhGMk8vQy8yTzNlMC9wRTZVM3lmYXBIMjRDa2trMXVOcTFpbTJrVGVuSUo4?=
 =?utf-8?B?cjdjZmJpZERCZ2Z6andIS29YSU9iMkFqUEFHK1FUejJrZjR2c0Q4VDFZNUxi?=
 =?utf-8?B?cUtrcHZXYlBpRU1ENVJLNTBON3VrNlBVMW5iVHNtMDg0SHE3U2dDRHZxalh0?=
 =?utf-8?B?ZkIrMlZpNnJBVGVlakxobHFYS1hZb290MGtYb0dLU21lcTlWMFFWSk14aDB2?=
 =?utf-8?B?ZEtqc1NYVlplN3pGZ2FoYm1CdVF5Q1dEVEdRYjkzY2pSSHg4WTVXVExRQWww?=
 =?utf-8?B?WW0zL3pJTWdvNUR6Z1dKdG8zWnFiY2RtbjNDS0Fvbi9IbmRMQ3FqejlqNmQ0?=
 =?utf-8?B?NVh2RWZZWVFGUTVZL2I1WExieDFkSnQ2VnZpY2dUaXloRGUzcFJjMmpDT2cy?=
 =?utf-8?B?SG5TMlhpbmdEZGNDVDR4dW4yU21vM3NROEgxSy9VQnFJckNuZGtzVDEvUUFw?=
 =?utf-8?B?N2RSOFFpR3YxekZ5T2tVdnhIQlN4SS9hdXNWTURzeko0UVBPNS9WT0hqRmJL?=
 =?utf-8?B?bXFvWWxIVFRuNCtWR1dPOW9RUmdYSUtoeGtzTTZNRGNpelA5STlQd0pITWVF?=
 =?utf-8?B?cmlhTDkxSXJtSXMySXp4Q2QwNUNySTE2TFdWR2lNanl1N3BKWEVkSWdJbUhr?=
 =?utf-8?B?NEx4eXV5V1ZVcW9aSTNzNE1MUHBqZytaamo5b09mL1U3MEF3Nk9TQzRtRWs3?=
 =?utf-8?B?cjJkalpTR3hYb0lWUUYzZGJPYWRrQ3VvekZMUjAyeEFUcW9Xa1luNmFQMjRY?=
 =?utf-8?B?WUdvSmN4UEVZSXdpTitPdWlNcTR0SHRJZ0llaWZZM1VGL2VROXBlNnNndGZD?=
 =?utf-8?B?MytPQ0k4ZlVwTkFWTnFOZG1nc0M5V09ZaGhiMlB3U3AvQ3hROWQzTHJ4b1cr?=
 =?utf-8?B?YUx5MTJsanV1L09HNlhMQjNyNDFTUUJqODNVNldKZU5vKzdKd1RTNTB5UUV0?=
 =?utf-8?B?UWNySFBJRmlyVE5lMG1ldElYZ3JrSm01dVpudG9DUnY5c0VjRDhGeUFmOVE1?=
 =?utf-8?B?ekZOYUh4cnpwQWszNVJZWktXZVdLUVJLem9tYk9CUHNXYzkydTE0TW0xU1l6?=
 =?utf-8?Q?TWNMmoId8Ekmf3tvrd3/UDX6P7kwI9RnVE1B2jf?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: skidata.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VE1PR05MB7376.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8523d0aa-f04e-4483-442c-08d95c875dbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2021 05:17:51.1934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e5733095-4425-4f08-b6ba-487b9a46a425
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXCSye2tw3qENx8aRDprcs4aZfqpwRIoHwlDlP4FhOoRy5OlTVn4O/gEu15ys7JGrNynqRGqmISIsjJ8Jm67zgGNdN/URPdi+aT9fmVIlNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR05MB4318
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <98C7179418CF9B4D8FA24E58ECFE9DB5@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64

SGksDQp0aGFua3MgZm9yIHRoZSBwYXRjaCBhbmQgc29ycnkgZm9yIHRoZSBsYXRlIHJlcGx5Lg0K
VW5mb3J0dW5hdGVseSB0aGVyZSBhcmUgc29tZSBwcm9ibGVtcyB3aXRoIHlvdXIgcGF0Y2guDQoN
CllvdXIgZ2l0IGF1dGhvciBzZWVtcyB0byBiZSBzZXQgdXAgaW5jb3JyZWN0bHkuIFBsZWFzZSBz
ZXQgaXQgdXANCmNvcnJlY3RseSB1c2luZyB0aGUgZm9sbG93aW5nIGNvbW1hbmRzIGJlZm9yZSBm
b3JtYXR0aW5nIHRoZSBwYXRjaDoNCg0KCSQgZ2l0IGNvbmZpZyB1c2VyLm5hbWUgIkpvaG4gRG9l
Ig0KCSQgZ2l0IGNvbmZpZyB1c2VyLmVtYWlsIGpvaG5kb2VAZXhhbXBsZS5jb20NCg0KT24gVHVl
LCBKdWwgMjAsIDIwMjEgYXQgMDQ6MTE6NDBBTSAtMDQwMCwgU2Fsb25pIEphaW4gdmlhIGxpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcgd3JvdGU6DQo+IFdoaXRlbGlzdGVkIGJlbG93IENWRToNCj4gQ1ZF
LTIwMTgtMjc5OToNCj4gQ1ZFIG9ubHkgYXBwbGllcyB0byBzb21lIE9yYWNsZSBKYXZhIFNFIGFu
ZCBSZWQgSGF0DQo+IEVudGVycHJpc2UgTGludXggdmVyc2lvbnMgd2hpY2ggaXMgYWxyZWFkeSBm
aXhlZCB3aXRoDQo+IHVwZGF0ZXMgYW5kIHRoZSBpc3N1ZSBpcyBjbG9zZWQuDQo+IExpbms6IGh0
dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc2VjdXJpdHkvY3ZlL0NWRS0yMDE4LTI3OTkNCj4gTGlu
azogaHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNTY3NTQyDQoN
CkZ1cnRoZXJtb3JlIHlvdSBhcmUgbWlzc2luZyBhIFNpZ25lZC1PZmYtQnkgbGluZSBoZXJlLiBQ
bGVhc2UgYWRkIGl0Lg0KDQo+IC0tLQ0KPiAgcmVjaXBlcy1jb3JlL3hlcmNlcy1qL3hlcmNlcy1q
XzIuMTEuMC5iYiB8IDYgKysrKysrDQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCsp
DQo+IA0KPiBkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb3JlL3hlcmNlcy1qL3hlcmNlcy1qXzIuMTEu
MC5iYiBiL3JlY2lwZXMtY29yZS94ZXJjZXMtai94ZXJjZXMtal8yLjExLjAuYmINCj4gaW5kZXgg
OThlZjMyZi4uZjJhNDQzNCAxMDA2NDQNCj4gLS0tIGEvcmVjaXBlcy1jb3JlL3hlcmNlcy1qL3hl
cmNlcy1qXzIuMTEuMC5iYg0KPiArKysgYi9yZWNpcGVzLWNvcmUveGVyY2VzLWoveGVyY2VzLWpf
Mi4xMS4wLmJiDQo+IEBAIC0xNCw2ICsxNCwxMiBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcDQo+
ICANCj4gIFNSQ19VUkkgPSAiaHR0cDovL2FyY2hpdmUuYXBhY2hlLm9yZy9kaXN0L3hlcmNlcy9q
L1hlcmNlcy1KLXNyYy4ke1BWfS50YXIuZ3oiDQo+ICANCj4gKyMgQ1ZFIG9ubHkgYXBwbGllcyB0
byBzb21lIE9yYWNsZSBKYXZhIFNFIGFuZCBSZWQgSGF0IEVudGVycHJpc2UgTGludXggdmVyc2lv
bnMuDQo+ICsjIEFscmVhZHkgZml4ZWQgd2l0aCB1cGRhdGVzIGFuZCBjbG9zZWQuDQo+ICsjIGh0
dHBzOi8vYWNjZXNzLnJlZGhhdC5jb20vc2VjdXJpdHkvY3ZlL0NWRS0yMDE4LTI3OTkNCj4gKyMg
aHR0cHM6Ly9idWd6aWxsYS5yZWRoYXQuY29tL3Nob3dfYnVnLmNnaT9pZD0xNTY3NTQyDQo+ICtD
VkVfQ0hFQ0tfV0hJVEVMSVNUICs9ICJDVkUtMjAxOC0yNzk5Ig0KPiArDQo+ICBTID0gIiR7V09S
S0RJUn0veGVyY2VzLTJfMTFfMCINCj4gIA0KPiAgaW5oZXJpdCBqYXZhLWxpYnJhcnkNCj4gLS0g
DQo+IDIuMTcuMQ0KDQpPdGhlcndpc2UgdGhlIHBhdGNoIHNlZW1zIGZpbmUgdG8gbWUuIFNvIEkn
bSBsb29raW5nIGZvcndhcmQgdG8gcmVjZWl2ZQ0KYSB2MiBmcm9tIHlvdSDwn5iJDQoNCnJlZ2Fy
ZHM7cmw=
