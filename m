Received: from EUR01-HE1-obe.outbound.protection.outlook.com (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.78])
 by mx.groups.io with SMTP id smtpd.web08.4648.1614157432757935194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Feb 2021 01:03:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=GzXl2oet;
 spf=pass (domain: siemens.com, ip: 40.107.13.78, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTo8tugoXoVokfl3RVNRNS76vRgjyLlfv4fGYOT0zzj6l95O131aQDzCQIJjUBO2coCd9VIqtX1lQACIgwJrpBGrTm0r/hCRGBA5OQ3D432pg9f6c6y3iDKlyh7L/al5NVcqu/N31SuByUEPwbleEdDT4KPd9/9gTercTDIX0gtYJz+WyQLqe6hdXdJTn1XUA3GATo7g2nLNUbHcqP/hL7jRC08WuW2cb0dz9eRsGSkw5YZD7Hvq9nO5Ya9nz24Yer8D09BGwKV2aDR+2jkqGxEkapr9GmHq0hZ/BPJSX1ILahhWywZ+dg06WNaUVca8iXePAjECCxmOF6E5sPQgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wJUVede/xDnkkt4vJptNO+w5xdEvkVieCWElGi/y2s=;
 b=QHUvhyHzKjwv0yumY4Hz+UwEryvFDOcI5dnk0sN1t2nj8VlTuJODMYs7GT92sCJ9tZCbLesoqkdg6ukupcYoeVDmdG3Inqx/GeiQUg9QmBQBSyRZYRNue5w+KIlNQ9zN7ajZ8iBVg3Ot8PuR3IMpXEvz6pA7twRAbZgxvG1UecJk7dN0LlKJCQed87D7fHvoDyr9djXe/gIKgIrjhPwyGS3vMCjriyXnPPZx+jz4duxTIkMoTBpEoJnMwIYAyq/aRoAuicZk4aOYfeE2CIuS9mj5FsE+O1B5eOjLb1EiPGIXG27febGd38g7WIJEZqC4ZsBnYbmJvGfDpbtc0G0R6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7wJUVede/xDnkkt4vJptNO+w5xdEvkVieCWElGi/y2s=;
 b=GzXl2oet4Uy5fya+jgfdCWUNIj7PNOs1H4qQzJvKkwp9JNlj+mKXgcr+5rqqxOhN+ttQvvP10QewuOIZdYS+uJn72jG4vuDR7fr3yPIktAl7kApIOGQHPSEaWLJFXBClQ6lGcBz1VQs7sVud1MWgNId7DJc2ed7eCsYRJ18aicE=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB9PR10MB4730.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:252::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.27; Wed, 24 Feb
 2021 09:03:50 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80%8]) with mapi id 15.20.3868.033; Wed, 24 Feb 2021
 09:03:50 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: akuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
Thread-Topic: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
Thread-Index: AQHXCfitNJEQWslojEGfQCjlR422SqpnAeww
Date: Wed, 24 Feb 2021 09:03:49 +0000
Message-ID: 
 <DB8PR10MB3977B069CAEEBB902BC04448929F9@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210223082553.29759-1-andrej.valek@siemens.com>
 <f9cfbc7e-4faf-7d7c-0fc0-60029eb3e43f@gmail.com>
In-Reply-To: <f9cfbc7e-4faf-7d7c-0fc0-60029eb3e43f@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-02-24T09:03:47Z;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Method=Standard;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Name=restricted-default;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ActionId=285c479f-b44c-4fc6-98e7-0139d85bcd0c;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_ContentBits=0
document_confidentiality: Restricted
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=siemens.com;
x-originating-ip: [165.225.200.172]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 3fc5c7d1-3599-4226-3f01-08d8d8a31a10
x-ms-traffictypediagnostic: DB9PR10MB4730:
x-microsoft-antispam-prvs: 
 <DB9PR10MB473007B9ADE30D4FA8C51542929F9@DB9PR10MB4730.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 miNmXPzQxuoeyCab8C5fp9Wd7dOaAWYna2uZl2A3xCE13WlpchljYlsoPi6mZdtQNCGYw1fDg01kATX2sMs7F0cmhbzVLrTYsF9mp4FUc0JEWv1NBjRy39wnjXkBsOIQNq5YxMZaLBaiH/S7Q6zsriUCLI7nOvSUWYNBKsAmDFwAFS6dsDDIau/uUoJJ0dLoEiOTj5LBZ2yH0dZ/nDDSdHE0OE2uewnA+v1NYJc1G/lcvODbG3TP6oz0A8rTfXDWzTr+XammTkflluLHUAg/1zcrz0XyvQNSHDypmo8ZoLYnbA6VUIt56a8qWo6nmMCGzhZH5ix60/RFC7L/UstnNk+/d2cN3sMpmQ/xKKMtualHhRopzU/2ghVe5WF+D8ff6fZikUcItGCJVM1QrFOYYgOw+2Wqaz4rOFIst75/zFCX8YcpsTKtNFmWK7VypkhVEI97CpkLEOUI/MwsaYo6nsSWRiDPLoonqLQ0gavJUUJSDcVsl1wOYdg1UFg3ssXDDYUuoCgG+bl7iY3nFIfRlFRwauips3UPLIIbrVlF+ps+WYuveMcp6lAoapvNjh2y3wkKP6TLc6v4TZ1KggRNFFOV4ubC7O3GroiFjsKQPpI=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(66946007)(55016002)(966005)(9686003)(316002)(4326008)(52536014)(66476007)(8676002)(64756008)(186003)(66556008)(8936002)(2906002)(86362001)(5660300002)(55236004)(26005)(6506007)(83380400001)(6916009)(66446008)(478600001)(76116006)(33656002)(71200400001)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?YXpYcnFFVFAybktRNnJEREZuMVdPWTgweUFXam1NWmtTSVdsK0l3ckJiWXpR?=
 =?utf-8?B?dkhQS1RaV3N6NUZudFMvNXhZekJTcVd3aGtFK2Mwa3BDYVNCanJQZU0ydmcy?=
 =?utf-8?B?ck5ma3prOWg0ZTFKcGJ4RnVpdXhFbUNZUHExSWtkeGNnV2JiR2QrMnZDS1l1?=
 =?utf-8?B?alJJaVVLQWFXanpiSVNrS04rMVdGNTllUXR4M0UvT2FlUjJhQVhtcE4yaE9m?=
 =?utf-8?B?YTlOR1lkTkZwVml3ZkZkU0dyL1Z2Y01FZmxKM2ZSV3lLcTVpQk5JRlA4QWVt?=
 =?utf-8?B?NXgySm5mbDQ5a1ZpQ2hmMnBIdW1XSkxQN2FQS1ZXZHJYNlkwUFBJZlU5Sk9h?=
 =?utf-8?B?eHNpRzBDSUlzWWFwenE2UVp0SmpmQ2RSRjBNYmxmNVhyYTU0VnM0czdENVVl?=
 =?utf-8?B?OXRTSHkrTzdJc2tWUGpFTDlUMHl1dEdpWW1wNzN4Zis5cXAxY1FsTjZXTlNq?=
 =?utf-8?B?Q0xIN2hZSHcxalNYNDh6V09NMzdKV2lsbFplSGluc3pvbk1Fd0JjcE5ZeDYz?=
 =?utf-8?B?SnF3VGdyV3JHTFRpTkR1Vk44bjVMTWphWGZBUzJWUkJsUnlVb0pNWnNWNXpw?=
 =?utf-8?B?U2VmeE10dm9BeDlRd0xpazFyNEQvMVRvZXpkUkVyNDZ5V29vNlc4Y3Q1UTFR?=
 =?utf-8?B?ZzBsTGVyaHE5eVB0eHpGOFg2Z2NrcldHc1NxaGNTZWwzZzhUcGxSVzNHNGkx?=
 =?utf-8?B?NU8zYmk2S051VGhZazU1elM5Rlo5ZTVhdjIxdHNIazlvZlg0ODA5eTZjZUpE?=
 =?utf-8?B?VHZ2VWxnSHNGdCtCbXFEblExOVpRWlpDT3FRaWQ4RDJtblpNdnY2L0k2bnVI?=
 =?utf-8?B?SWtjY2RGWGxmc1o5STh0RjZnaGVGa3Q1aHlId0M1c0pKbTRSTElaRTV5RS9K?=
 =?utf-8?B?Nnppb2ZiR21ES0IxdnJPRkEyVTBZWlhhU3k0RlJBeWtXOE0zYy93Vmh0RWtJ?=
 =?utf-8?B?ZjNCK0w3bi84ck94OW1KeU5QRzZ2WFFXVTFXS21lek9zbFBlNnZFdXBHSFRP?=
 =?utf-8?B?N25HQ0laVGZrVVg4KzBPeEtnUnVlWUNBR2F5ZzRRSTdlNWZOR0JZT25UcG9i?=
 =?utf-8?B?MDhUVjlRakhYeTV6V0FtQzE5UWJXQy9BMExyRWNOQTF2aDRpYzlnU25acEVZ?=
 =?utf-8?B?dkpMdzNBellOV0VIM2prOUhEazk2TE1kZ0lSLy9wZzhkeVZPbVVWWmMrZjVW?=
 =?utf-8?B?Rm10UnZpV1JaM3dMN2xKZHExZktUTjdqSmVrR2g5bXNKZW9lVEwreUxxb2ls?=
 =?utf-8?B?TEE5MTJ2OG5EeEV0cHNKL1hRbU43ZUcyVDZ3cVlMV1AvQXZUWFFUVjI4cXlC?=
 =?utf-8?B?TStaK1d0clovcWVrU1B4aVlVdnUvdFRvU2cvclAyMnhEL044SmpkVitGV0NC?=
 =?utf-8?B?WjR6RzhWZElwMWdsaUxuWGMrTXRqOHVueDB6WUZnUDZXd012TmlkejRjSEoy?=
 =?utf-8?B?a04reGFXTGNXc1huY1ZhaXQxRXJzb0hQMExEOUZFVmwxV3JzSWZURGdXbG82?=
 =?utf-8?B?QndEbHpyOWxhMFFlaGRhS2s4Qlg1Skl3clpZMnJubm4rZVcwbDJPZVp5U1Qx?=
 =?utf-8?B?NXhyM2JBOVRFeWFiOVlNYVowVnh5TEk2RXlxUVgyRVFjWnZENWxucEZZcmt4?=
 =?utf-8?B?dkZvSXhFZ2dGVHhHeHZ0Z0ZrQU5xbDJabk1taUovS0xsMTYreEZzZlhPYk9S?=
 =?utf-8?B?REpKcUxwWjBQT0ZkZWNRc0xSaWloeGZVZmNxbCtVd3RkekJyV2dpTGpvNExa?=
 =?utf-8?Q?AHsu7WulSMnsMvjMVP9rHYUiuR24lBEdTuRHNHv?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc5c7d1-3599-4226-3f01-08d8d8a31a10
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2021 09:03:49.9923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uL4+Y3GfzKLvccOMZ+MMQyi5iWPEh3/lACBTud9jqpwSXgFNWl4AXRkCptp36zCAhFnUar31g1FM2aZq97ym+wR/5YoHKxGLOPEWLVbVTrk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB4730
Content-Class: 
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQXJtaW4NCg0KUmVnYXJkaW5nIHRvIE9CSlNfTElCUywgaXQgd2FzIGFkZGVkIGhlcmUgaHR0
cHM6Ly9naXRodWIuY29tL29wZW4tc291cmNlLXBhcnNlcnMvanNvbmNwcC9wdWxsLzExOTcvIC4g
QnV0IHdoeSB0byBpbnN0YWxsIGl0PyBBcmVuJ3QgdGhlIGhlYWRlcnMgYW5kIGxpYnMgZW5vdWdo
PyBQcmV2aW91cyB2ZXJzaW9ucyBkb24ndCBoYXZlIHRoaXMgImZlYXR1cmUiLg0KDQpSZWdhcmRp
bmcgdG8gYWRkaW5nIGludG8gZHVuZmVsbC9tYXN0ZXIuIEkgd2FudGVkIHRvIGFzayBpZiBpdCdz
IHBvc3NpYmxlIHRvIGFkZCBpdCBhbHNvIGludG8gZHVuZmVsICsgbWFzdGVyIGJyYW5jaC4gSWYg
bm90LCB0aGVuIEkgaGF2ZSB0byBzZWFyY2ggZm9yIHNlY3VyaXR5IGZpeGVzIG9ubHkgZm9yIGR1
bmZlbGwgYnJhbmNoLg0KDQpSZWdhcmRzLA0KQW5kcmVqDQoNCj4+ICAtIGRvIG5vdCBpbnN0YWxs
IG9iaiBmaWxlcw0KPiBXaGF0IGtpbmQgb2YgdXBkYXRlIGlzIHRoaXMuDQo+DQo+IFdoYXQgcHJv
YmxlbSBpcyBub3QgaW5zdGFsbCBvYmogZml4aW5nPw0KPg0KPiBUaGVzZSBjaGFuZ2VzIGFyZSBu
b3QgaW4gTWFzdGVyLg0KPg0KPiAtYXJtaW4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWog
VmFsZWsgPGFuZHJlai52YWxla0BzaWVtZW5zLmNvbT4NCj4+IC0tLQ0KPj4gIC4uLi9yZWNpcGVz
LWRldnRvb2xzL2pzb25jcHAve2pzb25jcHBfMS45LjMuYmIgPT4ganNvbmNwcF8xLjkuNC5iYn0g
ICB8IDQgKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pICByZW5hbWUgDQo+PiBtZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvanNvbmNwcC97anNv
bmNwcF8xLjkuMy5iYiA9PiANCj4+IGpzb25jcHBfMS45LjQuYmJ9ICg4MiUpDQo+Pg0KPj4gZGlm
ZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9qc29uY3BwL2pzb25jcHBfMS45LjMu
YmIgDQo+PiBiL21ldGEtb2UvcmVjaXBlcy1kZXZ0b29scy9qc29uY3BwL2pzb25jcHBfMS45LjQu
YmINCj4+IHNpbWlsYXJpdHkgaW5kZXggODIlDQo+PiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lw
ZXMtZGV2dG9vbHMvanNvbmNwcC9qc29uY3BwXzEuOS4zLmJiDQo+PiByZW5hbWUgdG8gbWV0YS1v
ZS9yZWNpcGVzLWRldnRvb2xzL2pzb25jcHAvanNvbmNwcF8xLjkuNC5iYg0KPj4gaW5kZXggZTQx
OTA3ZGU0Li5hMDJmZjRhNGQgMTAwNjQ0DQo+PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9v
bHMvanNvbmNwcC9qc29uY3BwXzEuOS4zLmJiDQo+PiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvanNvbmNwcC9qc29uY3BwXzEuOS40LmJiDQo+PiBAQCAtMTMsMTMgKzEzLDEzIEBAIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWZhMmEyM2RkMWRjNmMxMzlmMzUx
MDUzNzlkNzZkZjJiIg0KPj4gIA0KPj4gIFBFID0gIjEiDQo+PiAgDQo+PiAtU1JDUkVWID0gIjZh
YmEyM2Y0YTg2MjhkNTk5YTllZjdmYTQ4MTFjNGZmNmU0MDcwZTIiDQo+PiArU1JDUkVWID0gIjkw
NTlmNWNhZDAzMGJhMTFkMzc4MTg4NDc0NDNhNTM5MThjMzI3YjEiDQo+PiAgU1JDX1VSSSA9ICJn
aXQ6Ly9naXRodWIuY29tL29wZW4tc291cmNlLXBhcnNlcnMvanNvbmNwcCINCj4+ICANCj4+ICBT
ID0gIiR7V09SS0RJUn0vZ2l0Ig0KPj4gIA0KPj4gIGluaGVyaXQgY21ha2UNCj4+ICANCj4+IC1F
WFRSQV9PRUNNQUtFICs9ICItREJVSUxEX1NIQVJFRF9MSUJTPU9OIC1ESlNPTkNQUF9XSVRIX1RF
U1RTPU9GRiINCj4+ICtFWFRSQV9PRUNNQUtFICs9ICItREJVSUxEX1NIQVJFRF9MSUJTPU9OIC1E
QlVJTERfT0JKRUNUX0xJQlM9T0ZGIC1ESlNPTkNQUF9XSVRIX1RFU1RTPU9GRiINCj4+ICANCj4+
ICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSINCj4+DQo+PiANCj4+DQoNCg==
