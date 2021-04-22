Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web12.8504.1619070581331642488
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Apr 2021 22:49:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.onmicrosoft.com header.s=selector2-fujitsu-onmicrosoft-com header.b=m5xrJx4J;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.33, mailfrom: zangrc.fnst@fujitsu.com)
IronPort-SDR: QTJuHFsgIp1kwI+EJbAiqicn4WAZ4tLbQ/S1Jp8GH90iOhV+/L0+Ki6YMNQWVSs7tfNZ5QdsCf
 MOaDGAQTj5dFuQfRsIUbGurTKRT6qb4BAIaJAm5VryfVGRcc5rLmpVGdUxNx9lovnQ4dSrH5IU
 JdftH1rfkyJ6c4Q9iAGaaLKjyI5BUydulYuBIWBsTXioIX7Cbrf4ZaMh7XaNcgMHkfwFmib++M
 9ltB+CuHjNkxx5YcZPUr4YfSd2dQMpw1uCT3DUTCp1eyjJ76Mn2ipyN6pPbTfSxRJWrze4xjNd
 1hE=
X-IronPort-AV: E=McAfee;i="6200,9189,9961"; a="30184779"
X-IronPort-AV: E=Sophos;i="5.82,241,1613401200"; 
   d="scan'208";a="30184779"
Received: from mail-ty1jpn01lp2059.outbound.protection.outlook.com (HELO JPN01-TY1-obe.outbound.protection.outlook.com) ([104.47.93.59])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2021 14:49:38 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CqxxERGmaLxph+nqht99GWtqfXXcqFX961gvyFyO4DEutm4n1d+llfuT51WjWGjSBmrJlGpMvtf+xYy5Ln/5Gv07mTbpFelQZq6n3+bOYunaATz+SOVdIy6YRhrYGP99jR8/Dlxn7F83p8G8/EErMX4pnBFILVKweQZiMnjBdpMzUfCCidrjWf1sQD08E0ZCA/GllJA1Sx6q6g5xSdSS74Y9d5JK+b9GP87nqkLFvHX1G63r5tdZzQCQ2zQ1Ng3/SqHCkLrLPNkNk9bLLgsJNVtqnlkXmDvqL4uwQQS1zmEEO3VB8qrV4rwic7kbgu6TA8OqI25kxMPtbpmtEhj+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8eil18W+mjvYuVXf5mlb6uUm5bg35t8uMesOT8gfRo=;
 b=KyQNKrD/cp2uvFTyVk/ZaPlxz5X2W4N5hlF56gPHZP+MkGJqItdxJtRDn/LAfwqkUD/+3dj+3mvyU06d6Z9E0XxEvobjUc0QChnJzju9OWiBMiYMleYCGXZ2FygI4yGW9l5CYj49yiKinB4G5ciYaous2jmt+L2Qhuy4SOExKsrF9TPJjPXmqtJ0dO+zAcZZq8N5Clj2FMAm5iNbL4LRY7B1VTnIBh1qMaaIDeAbES5HsS+C9yhHaDDnTE8aj2/08iK5etmS3N6F5nw0VhkZxPXkEC2kLwBUTj8K0DzYjZFkOSSoslt552yIJ6HrJe3vSfaIwKOuxycpCMhqSytT+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k8eil18W+mjvYuVXf5mlb6uUm5bg35t8uMesOT8gfRo=;
 b=m5xrJx4Jf4vvOMtZbjj9mIK7i0dQ/8vc2lhVgxayocJgjfSA01CWZDz6IKhWan4oCyxxAf5fZxtIARIaxem2ngmYgY13XSqO6VOotN8V9jW/yhTWrhNkcRQlCmvu7WPhRrXmtC1punOfC624j/CF26oi143dQ05GKHoUxuyFQGU=
Received: from TYCPR01MB6448.jpnprd01.prod.outlook.com (2603:1096:400:98::9)
 by TYCPR01MB5934.jpnprd01.prod.outlook.com (2603:1096:400:40::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.21; Thu, 22 Apr
 2021 05:49:35 +0000
Received: from TYCPR01MB6448.jpnprd01.prod.outlook.com
 ([fe80::d9f5:2a96:eae2:27a4]) by TYCPR01MB6448.jpnprd01.prod.outlook.com
 ([fe80::d9f5:2a96:eae2:27a4%4]) with mapi id 15.20.4042.024; Thu, 22 Apr 2021
 05:49:35 +0000
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: Leon Anavi <leon.anavi@konsulko.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 2/5] python3-argcomplete: Upgrade 1.12.2 -> 1.12.3
Thread-Topic: [oe] [meta-python][PATCH 2/5] python3-argcomplete: Upgrade
 1.12.2 -> 1.12.3
Thread-Index: AQHXNoQ+SB9G7CoQwUG+P1iF9CmkS6rAA91Q
Date: Thu, 22 Apr 2021 05:49:35 +0000
Message-ID: 
 <TYCPR01MB6448F875405FF6ABEE92272CF5469@TYCPR01MB6448.jpnprd01.prod.outlook.com>
References: <20210421075843.17725-1-leon.anavi@konsulko.com>
 <20210421075843.17725-2-leon.anavi@konsulko.com>
In-Reply-To: <20210421075843.17725-2-leon.anavi@konsulko.com>
Accept-Language: zh-CN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: konsulko.com; dkim=none (message not signed)
 header.d=none;konsulko.com; dmarc=none action=none header.from=fujitsu.com;
x-originating-ip: [180.96.28.100]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3ef5032f-e7f5-42cb-3559-08d90552692e
x-ms-traffictypediagnostic: TYCPR01MB5934:
x-microsoft-antispam-prvs: 
 <TYCPR01MB5934D0DC6246C5E35F264E90F5469@TYCPR01MB5934.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 bAMXCFxM39rmTgChLUudvS5YRezjYv5FZrkOvMCm63BuAcgDefZQWAhIDICvuftpPF+2HqMqcjBkRLVdisk1Z82sD9UlyE8/YtmDnb+9M6zeIWVEPkj8vkznUYo7suQzp48tWE4d3Frs62Ca4uwKHi3Hq8UelSyJFfL6mW1auo4RqfkNED0i9d5juKaFEIQ6eyOhgu4vBvrmmHzrDbOAtZdGcuBjaJZAgXDay3bFRNTpoWU54chSIwMmwOVrFuPhmWe0ZKspoOIK5Yrqa7Ldd2htquIkJBenZ5qcuk3HFTROWUQ26fceJohEoSlcADr6u6yAwgX7dvudstqYioTnHpA42Dpj0CMR3e2bbk7h5oi0dCdvbcYS0WmcheljFuTEqAG7Owkpc9PrG4565JYPP8OPn/xLe4V/z1vUVtGRVHoKTxKS8PmAv2vIjyn9IQMA3X6ERL5IenCZy//ixsp9VqMSi+GGVsNgpT3pnmhYYNCEkxaZ7ooJpM+r6OqDJ14rzWu7oZrPWwD1MB6c/3fwktgM2f+6ev0I+EmRB4GHWyiAafxa3UWUO6G75Eq+ph2Vgv342eVmxPwmMP0qm3vk6nsgVoJ0b37M/srIsKOAqUe+wg0/glrn0HwxvSyzqpQH6BMyUnQSw9oBZ59yM72M5e2h6lhzYcivjCt2fTW4CFj7q9If1Xv7dX7v4mJSNZCv
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB6448.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(9686003)(55016002)(478600001)(122000001)(86362001)(33656002)(83380400001)(110136005)(6506007)(186003)(316002)(53546011)(7696005)(8676002)(71200400001)(66446008)(8936002)(26005)(66476007)(52536014)(5660300002)(76116006)(66946007)(64756008)(66556008)(85182001)(2906002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?gb2312?B?S04rNEFGQzNIdVVwd0MvTUVZUHhubjA2SHlMRGJwUVB5ZEFHZHY0YTg1QjBQ?=
 =?gb2312?B?Z1hHQnBqRkFVcmdCNXNvRnZ3MmFTZHZzeUpIWS9WTXdsMWpNN1gwZVh1dU1n?=
 =?gb2312?B?RFZPK2FjY21rZzdSUEIxcmJpVWdxdVcyN2Y1THJDeE0yZ2tPa1o3SWlzN1da?=
 =?gb2312?B?TlhYeG5sNUV1bEtQY1VGb0tNT1BkRmZkbENpSzk5YmY1NityTFZubDYyK24v?=
 =?gb2312?B?NG84WWFXTXZpY1VuVE9LemI1di9ya05FUmJ4NFF0T2RtalJGNnpXUnlUR1NE?=
 =?gb2312?B?Mnd5MDVzREtWTFRBS0VXMlZhYmVGMlgzcXAyTUtTNFRCdnRaRUtRSjlsNGJ2?=
 =?gb2312?B?dFBzNS9ZTDl3MWdoQkRXejFRNXdWMXhJRkswSHZxNy8yYmRKMVp5Y2dzU3hi?=
 =?gb2312?B?SXgyN2x4RmFpSnB2dDZxS24zU3BEODBoVVdtV1F3S1JTWE5HTlBBa0R6L1lJ?=
 =?gb2312?B?ZUc5MEFrNVkwNy9LYmRWZFcwdzFLQmRDU09xckhsQkQvVFJEdmw5RVYrVElH?=
 =?gb2312?B?K2VoMWtKMlViK0EyaFVSYWxZUkhjYnVITGl5akJPUE0yK1FybGdPM2V4ZzlR?=
 =?gb2312?B?Z3JkbHR4b2thVTNiTXlaaFR5eE5IY1hOL2Y1SUJmbXg2bDVQVnZ6Q0lLbzlH?=
 =?gb2312?B?MDZ6Q0NrU0t1QmZmcUsxYWZncTFua1E1czQveVF6d2JYR01ZYVhOV3hzYWVT?=
 =?gb2312?B?R25ySzVLUy9WVk05cVFaMzVHRFZtNVlQekJ0d2MwSVBGZFNzZGorcUZGTHhJ?=
 =?gb2312?B?KzJ4Y3l2cUNNUmJwRU1PT1EwQ3pZN2lNOTc0ZitCcHM0dUZsNTU2bW80WDhN?=
 =?gb2312?B?STA3SzFOcmh5YTR3VG55bDhMQUZNWHhlNDRVWW5NMDhzVXMrWXVqZ2NoK2Fi?=
 =?gb2312?B?T2VTZ3dhRTFUckJ4MjUyL1pCajV0TmFuNEF6c3B6ajdIeXFKclZQbmRRVlhF?=
 =?gb2312?B?bFRzY3N5NFVZQjZ4bGgwV0JRUlBSRmc4UU9VcnBSZ3dxZnlzNVNCYlJOTVpO?=
 =?gb2312?B?TDlyRVlnQSs3b3JHbGdWbEF6YzAwaFRneHUwd2J3Y0gxWjBrSytxeERabWhv?=
 =?gb2312?B?NWNmcnF3WTEreFpqRjdJTEE5Tzc3MDJRb25xR2JZU3d6WW1zMjRNRklyVXVB?=
 =?gb2312?B?cDVYUGxkcXVaR2RNbnFlZmloVWpTNDVJYXlIQjdSUnFoeW1aem9QWktCYWMx?=
 =?gb2312?B?YnJSSlNPTlltb0Y2b2xBQVRFaGZOMXpOcUhuT3RSMXNwMG1CWm9saUFrcHFT?=
 =?gb2312?B?cVpCdHE4dFJyTmorTERNZXAzQWxhVy9Hd1oxVjlHeWpGZUoxRFQzbGRMVkk4?=
 =?gb2312?B?dDcrVE5jdjRHRFVlcFdsUzdYb1hVOWZzUmVpTVJUUXpYeHFBM3FGTXg5L3Bp?=
 =?gb2312?B?c240ZEsveW9XS2IrWDMyM0MvS0lyaisza2U2TUxVcjZhdFBtM08yeGdIcVRY?=
 =?gb2312?B?VFRINmJjdS9jR1Fvb0ZWZlcyanBuY2NJTzNBaXJMTkI1Snp1cGZiOHl4K1pZ?=
 =?gb2312?B?MWNlU09SVnVDYUMzb1lhRUdCM0Y1elA2d1NOUmJJTm54V3hjMU51T1g0czND?=
 =?gb2312?B?aHhUR3FudDFvZ29IM2xjNHpGUkhtWG40alBpWm5MYWpTMUFCR29JSGVITGFl?=
 =?gb2312?B?VVl4Q2x1amt3blBNTkpma3VqK2pFNUtCZG10eW9iL0FYTGFjSjZoRXFIS2RC?=
 =?gb2312?B?Y3dCUzEwbmw1TndLWElicDJKRjZrZTg2cnpjNDd4UnBzWWU4TVlWSjFpeHNN?=
 =?gb2312?Q?IGWi4LmZHve17ujXoI59pvlIXW4b/k7WhF6ErUY?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB6448.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef5032f-e7f5-42cb-3559-08d90552692e
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2021 05:49:35.9271
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yhbM8LgtLlDnV1gBTBdjBwcHjXejLJ17Eir2q/tuBDHDMIcXLAvNyYFd0FPVWlgPj1sDb11AkUDBn7j99H9PUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB5934
Content-Language: zh-CN
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64

SGVsbG8sIHRoaXMgdXBkYXRlIG5lZWRzIHRvIGFkZCBSREVQRU5EUyBvZiBweXRob24zLWlvLiBX
aGVuIHlvdSB1cGRhdGUgcHl0aG9uMy0qLCB5b3UgbmVlZCB0byBydW50aW1lIHRlc3QsIGZvciBl
eGFtcGxlOg0KDQpyb290QHFlbXV4ODYtNjQgOn4jIHB5dGhvbjMNClB5dGhvbiAzLjkuNCAoZGVm
YXVsdCwgQXByIDQgMjAyMSwgMTg6MjM6NTEpDQpbR0NDIDEwLjMuMF0gb24gbGludXgNClR5cGUg
ImhlbHAiLCAiY29weXJpZ2h0IiwgImNyZWRpdHMiIG9yICJsaWNlbnNlIiBmb3IgbW9yZSBpbmZv
cm1hdGlvbi4NCj4+PiBpbXBvcnQgYXJnY29tcGxldGUNClRyYWNlYmFjayAobW9zdCByZWNlbnQg
Y2FsbCBsYXN0KToNCkZpbGUgIi91c3IvbGliL3B5dGhvbjMuOS9zaXRlLXBhY2thZ2VzL2FyZ2Nv
bXBsZXRlL3NoZWxsXyBpbnRlZ3JhdGlvbi5weSAiLCBsaW5lIDQsIGluIDxtb2R1bGU+DQpmcm9t
IHNobGV4IGltcG9ydCBxdW90ZQ0KTW9kdWxlTm90Rm91bmRFcnJvcjogTm8gbW9kdWxlIG5hbWVk
ICdzaGxleCcNCkR1cmluZyBoYW5kbGluZyBvZiB0aGUgYWJvdmUgZXhjZXB0aW9uLCBhbm90aGVy
IGV4Y2VwdGlvbiBvY2N1cnJlZDoNClRyYWNlYmFjayAobW9zdCByZWNlbnQgY2FsbCBsYXN0KToN
CkZpbGUgIjxzdGRpbj4iLCBsaW5lIDEsIGluIDxtb2R1bGU+DQpGaWxlICIvdXNyL2xpYi9weXRo
b24zLjkvc2l0ZS1wYWNrYWdlcy9hcmdjb21wbGV0ZS9fXyBpbml0X18gLnB5IiwgbGluZSAxMSwg
aW4gPG1vZHVsZT4NCmZyb20gLnNoZWxsXyBpbnRlZ3JhdGlvbiBpbXBvcnQgc2hlbGxjb2RlDQpG
aWxlICIvdXNyL2xpYi9weXRob24zLjkvc2l0ZS1wYWNrYWdlcy9hcmdjb21wbGV0ZS9zaGVsbF8g
aW50ZWdyYXRpb24ucHkgIiwgbGluZSA2LCBpbiA8bW9kdWxlPg0KZnJvbSBwaXBlcyBpbXBvcnQg
cXVvdGUNCk1vZHVsZU5vdEZvdW5kRXJyb3I6IE5vIG1vZHVsZSBuYW1lZCAncGlwZXMnDQoNCj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogb3BlbmVtYmVkZGVkLWRldmVsQGxp
c3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gPG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1i
ZWRkZWQub3JnPiBPbiBCZWhhbGYgT2YgTGVvbiBBbmF2aQ0KPiBTZW50OiBXZWRuZXNkYXksIEFw
cmlsIDIxLCAyMDIxIDM6NTkgUE0NCj4gVG86IG9wZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVu
ZW1iZWRkZWQub3JnDQo+IENjOiBMZW9uIEFuYXZpIDxsZW9uLmFuYXZpQGtvbnN1bGtvLmNvbT4N
Cj4gU3ViamVjdDogW29lXSBbbWV0YS1weXRob25dW1BBVENIIDIvNV0gcHl0aG9uMy1hcmdjb21w
bGV0ZTogVXBncmFkZSAxLjEyLjIgLT4NCj4gMS4xMi4zDQo+IA0KPiBVcGdyYWRlIHRvIHJlbGVh
c2UgMS4xMi4zOg0KPiANCj4gLSBIZWxwIHN0cmluZyBzdXBwb3J0IGZvciBmaXNoDQo+IC0gQWRk
IG9wdGlvbiB0byB1c2UgdGVtcGZpbGVzIGZvciBJUEMNCj4gLSBGaXggbXVsdGlwbGUgY29tbWFu
ZCByZWdpc3RyYXRpb24gZm9yIG5vbi1iYXNoIHNoZWxscw0KPiAtIFJlZ2lzdGVyIGF1dG8gY29t
cGxldGlvbiBmb3IgYW4gYXJiaXRyYXJ5IG5hbWUgdXNpbmcgYSBnaXZlbg0KPiAgIGV4dGVybmFs
IHNjcmlwdA0KPiAtIFNraXAgY29tcGxldGlvbnMgZnJvbSBhY3RpdmUgc3VicHJvY2VzcyBjb21w
bGV0ZXINCj4gLSBGaXggd2FybmluZ3MgcmVnYXJkaW5nIGludmFsaWQgZXNjYXBlIHNlcXVlbmNl
cw0KPiANCj4gU2lnbmVkLW9mZi1ieTogTGVvbiBBbmF2aSA8bGVvbi5hbmF2aUBrb25zdWxrby5j
b20+DQo+IC0tLQ0KPiAgLi4uaG9uMy1hcmdjb21wbGV0ZV8xLjEyLjIuYmIgPT4gcHl0aG9uMy1h
cmdjb21wbGV0ZV8xLjEyLjMuYmJ9IHwgMiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pICByZW5hbWUNCj4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0
b29scy9weXRob24ve3B5dGhvbjMtYXJnY29tcGxldGVfMS4xMi4yLmJiID0+DQo+IHB5dGhvbjMt
YXJnY29tcGxldGVfMS4xMi4zLmJifSAoODIlKQ0KPiANCj4gZGlmZiAtLWdpdA0KPiBhL21ldGEt
cHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXJnY29tcGxldGVfMS4xMi4y
LmJiDQo+IGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hcmdj
b21wbGV0ZV8xLjEyLjMuYmINCj4gc2ltaWxhcml0eSBpbmRleCA4MiUNCj4gcmVuYW1lIGZyb20N
Cj4gbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1hcmdjb21wbGV0
ZV8xLjEyLjIuYmINCj4gcmVuYW1lIHRvDQo+IG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYXJnY29tcGxldGVfMS4xMi4zLmJiDQo+IGluZGV4IGEwOGY4ODJhYjEu
LjNlYjRlNWMyN2MgMTAwNjQ0DQo+IC0tLSBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMv
cHl0aG9uL3B5dGhvbjMtYXJnY29tcGxldGVfMS4xMi4yLmJiDQo+ICsrKyBiL21ldGEtcHl0aG9u
L3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtYXJnY29tcGxldGVfMS4xMi4zLmJiDQo+
IEBAIC0zLDcgKzMsNyBAQCBIT01FUEFHRSA9ICJodHRwczovL2dpdGh1Yi5jb20va2lzbHl1ay9h
cmdjb21wbGV0ZSINCj4gIExJQ0VOU0UgPSAiQXBhY2hlLTIuMCINCj4gIExJQ19GSUxFU19DSEtT
VU0gPQ0KPiAiZmlsZTovL0xJQ0VOU0UucnN0O21kNT0yZWU0MTExMmE0NGZlNzAxNGRjZTMzZTI2
NDY4YmE5MyINCj4gDQo+IC1TUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiZGUwZTEyODIzMzA5NDBk
NTJlYTkyYTgwZmVhMmU0YjllMGRhMTkzMmFhYTU3MGY4NGQyNjg5MzlkMTg5N2IwNA0KPiAiDQo+
ICtTUkNfVVJJW3NoYTI1NnN1bV0gPQ0KPiAiMmM3ZGJmZmQ4YzA0NWVhNTM0OTIxZTYzYjBiZTZm
ZTY1ZTg4NTk5OTkwZDhkYzQwOGFjOGM1NDJiNzJhNTQ0NSINCj4gDQo+ICBQWVBJX1BBQ0tBR0Ug
PSAiYXJnY29tcGxldGUiDQo+IA0KPiAtLQ0KPiAyLjE3LjENCg0K
