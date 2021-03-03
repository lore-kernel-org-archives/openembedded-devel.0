Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.87])
 by mx.groups.io with SMTP id smtpd.web11.4542.1614764142159951207
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 03 Mar 2021 01:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.onmicrosoft.com header.s=selector1-siemens-onmicrosoft-com header.b=VVEYJ+SC;
 spf=pass (domain: siemens.com, ip: 40.107.20.87, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BBkMibXRyLx6uZsJvkLfk4X1EpDMdtZJVf23jjBVTT7/yHeCAUpQAk9NG6ZvLkc8ImE2BPIEXC51kcU0gAjdcUYPksZLdKPLGau+6MJC9D3IZGGtEV4LfswlzJvNxf3fG9YcnRywGCrrKfvXWG7IlqZSJolLLHdxXAR/gv6bDtfWBGCzQazeHjYHNoZJ1m/uwaFc7WpkN/2og3kG8a73N5lREaZjpbpizsWDxVjyuqDR+54HQisLi73moRIL8CclNp1WuRw8kmVmgsbnwnGZxaSmLyTao6kkHkUpcnfbcIkDx2s23V8VCZgMz8jAsWWB4YgmvfhUZsIuoukKA34qPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zYu0UOa8DrijgTtH/jBomH7kvvlzXUWRaYPQsUA11E=;
 b=b77vmApHJTjosZYFsLU/MaJsLmJH6EwSStO/gIktjBvll9HTDkDkK/cCJiYvOowJuWlEQk9mDQhH+WglnrE+V3/Yb8fXSAzvIdEKsFJ7eOP1rvafoNwczhnhu8oGWpBh3bDwyNPFcOzn9sjgiwzBSr29ReJfWYpwUqmREhrWS0OaM9uj3V+hDO43LtNFmplaJ9CtGsmkisn7OWWPIrgKx+P6VGgDEiRO10THK/mEbePGvqGVqfaUDDHt6ChPdv0JFy3nrvB8NHgKz6P2i+l5ZOOl0qCx1hK145abfl5JN8U4G+GuiItAbp1VzJRJvvxxoftzWeyhM67YCBH5WQKbng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=siemens.onmicrosoft.com; s=selector1-siemens-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8zYu0UOa8DrijgTtH/jBomH7kvvlzXUWRaYPQsUA11E=;
 b=VVEYJ+SCx3okkyGhFcpCiKZp6+AhH5w6blXP1AuxNE5emcPwWBKwxl8Wza7jAkcO1uQD7s+m2NVdnrOTUJXbtNUQ6LxIKP+XYSxBL4OOR5lloUDIltuBLMmx67ieVHmP+zNQPXtYK6vMR8WZ841r6JsxmNsELQY6ZurByN2AqGI=
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:138::9)
 by DB8PR10MB3943.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:14a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 09:35:39 +0000
Received: from DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80]) by DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::954a:7239:f088:8c80%6]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 09:35:39 +0000
From: "Andrej Valek" <andrej.valek@siemens.com>
To: akuster <akuster808@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
Thread-Topic: [oe][meta-oe][dunfell][PATCH] jsoncpp: Upgrade to 1.9.4
Thread-Index: AQHXCfitNJEQWslojEGfQCjlR422SqpnAewwgAsKmBA=
Date: Wed, 3 Mar 2021 09:35:39 +0000
Message-ID: 
 <DB8PR10MB39775E558353970FAA9C030092989@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
References: <20210223082553.29759-1-andrej.valek@siemens.com>
 <f9cfbc7e-4faf-7d7c-0fc0-60029eb3e43f@gmail.com>
 <DB8PR10MB3977B069CAEEBB902BC04448929F9@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: 
 <DB8PR10MB3977B069CAEEBB902BC04448929F9@DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_Enabled=true;
 MSIP_Label_a59b6cd5-d141-4a33-8bf1-0ca04484304f_SetDate=2021-03-03T09:35:37Z;
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
x-ms-office365-filtering-correlation-id: e90291b7-18dc-41e2-153b-08d8de27b54d
x-ms-traffictypediagnostic: DB8PR10MB3943:
x-microsoft-antispam-prvs: 
 <DB8PR10MB3943A32431E1C48A91B19D3692989@DB8PR10MB3943.EURPRD10.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 abvOVBOCuNOP9t4ajQeSpXHbxBblCYTI+MQ/xNtNnVwssAWMa/uRNzu/+qLbCIn5RW/CBk+qtPwhf5a7ibuQftXm+3KINDNy8aotUd0tjOTqGB15DLjktz3uqYY+WjVnr60K3FmfZwHCIQ2Nnzf3OzjFHL5Fkp9Rgme+0fxVA4Doaeas2yPVy7harsxPToEdtqlXGWlCotFtfSuYf22zR77uaVMl62EK331bcCTfYGIN8ZR5EToUUn6tWS3Pr1U4yJrMoVB/RSUmBWPYHkPt3DcwrkjbVYQVevasqdw6Y9LBJ9JE4NX6lp6vLtg/9t/sGSz5vVtz64d/gNu5KBFIat35f4mCYsk+x/v8qvWUwBjSJMmJUFQGnncXLJoxGWrQ/ScqZ2iWT+PE4k9wgwtJB4Mhj00PWT8wwJiQt+gV21YdTY/mqrl/tiGeYpcszNd7sG/vXSgrGY43fUKbNCjMO1uhsWnk/KMzXny2epq45yhe1moT2HZtzB+tbzLO3XaPcxrjWXCQfOCmb73Tuzz4Z6DTPo9dKbDOFsg/+dGOtot+K/ApTDEXDLd1fxL4oV93rGBfwbc+EZUAyPAdjBF0OOAAfUKtLNW/WZJcN19wAsA=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(39860400002)(376002)(136003)(396003)(55236004)(6506007)(71200400001)(186003)(7696005)(26005)(76116006)(64756008)(478600001)(66446008)(966005)(66476007)(66946007)(66556008)(55016002)(6916009)(2906002)(316002)(5660300002)(83380400001)(33656002)(8936002)(86362001)(52536014)(8676002)(4326008)(9686003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 =?utf-8?B?YUdia3NHY0ttbTZITFhBSnBCWTBuZ0VLbmtydEMwc3VJY21hbzF2MFo1YWJV?=
 =?utf-8?B?d0Q4ZjdXSndleU5NV005MnZsa0tURzl5MGt6SGhSWG5yYTF4VTZqMytmaTRI?=
 =?utf-8?B?aE5YMmtzS2VSS0R6QjBtc1E2SFd1dVUvL1VpbHlmaG9waHlXemxoeUpDY1U4?=
 =?utf-8?B?QUh3bGdZTkR4VE56Q0lqWXhsZFBwMUZoMlBVRTlSdE1DandnZjdKWHNUWDZ3?=
 =?utf-8?B?RnlJU3BaSlZMSm1raFQ4Tk55YjdQS013R25rWHpBbTl0VWIyam5oUFh6dmow?=
 =?utf-8?B?ZExtNE5RNXBoRjBHUkR4eVo1MHNPYkF4aXRETjk3cEl5SWdtUUlkUm12MFZa?=
 =?utf-8?B?eC9Edk0vUFlYYlJGOTFuaTdOcFU3bWVkR3ZQVXZyT0JmSGJwRWdyaEhodmg5?=
 =?utf-8?B?UDJPSnlSRGxjT3ZDc0ZwMmZ5RiswSmxTZVhCMFR4S0xXcFJrZ2d4R0x6czU1?=
 =?utf-8?B?dC9HZlBobStocHAzYngxMEEzeGF4QXRhWlFtWGlkRVJLWExnc1U2RjdsZldY?=
 =?utf-8?B?RTRqcy9qTWU3cHZlZng1eWRPZ25xaG54NnFvVnBjU1ZVYkpXOCtOazBpNE1H?=
 =?utf-8?B?OFVXeW9TY2hzQjlYcUkxRkhwc2QzTlM5RnlybnpGYU5nM1RxNDZaVUNGUGJ2?=
 =?utf-8?B?NWhHUUE4Z1o0SU9weGRtejVyRUN4QTd4dEd4c0Z6U1hDOXFyVU9qUzBnNmZ1?=
 =?utf-8?B?aTMzdEV4cGJjeVBwZEM2aUY4eVA2Nk9YSFFlUEFrb0FKSkQvcFFuV3Z2VE5C?=
 =?utf-8?B?NExEaXVockcyMVNGNHJlRi9kaDVPa1diUHNjSnFCaHpTdnBoNUdSR1diTzN4?=
 =?utf-8?B?YzFVcFJPMjE0dW5JRmdzTE0xamFTSTNlSHVkbUlZbzM3cDFKT1A2SVlBYmJC?=
 =?utf-8?B?eWJqZ0dzQkRNRlBwamNxYk9GTkRqUEZob1NrQXVZYXYyQVZZNTJqMXpLWStC?=
 =?utf-8?B?UCtJSjdrVFFLZTZMVnNRUHJIa2MyWXRJSDhyaHZ2U2xTTG5DUjhabTlwQWg2?=
 =?utf-8?B?QXdVMHlaYjE1YnFNeHdiVFNvR2dXcFVKUDlaSkswZ0cwVUV4aWlMMVBvT3ZS?=
 =?utf-8?B?RjVxYkwyQ2txWkVacFA0amUxZ1kyeHU3eUZsdUJLMlVROEdjbXJYQ0RpTWhu?=
 =?utf-8?B?cWpTbmo2Z08yaHhYenBaVStnMEREalkyZUxrVkVRdHljVzV6SkVYME1FQlNX?=
 =?utf-8?B?Nll6L3JyRllmaUtHa21NbC9nclF1ajNWTE9CZGEwczZPMitFQitUQVVuVUNV?=
 =?utf-8?B?SFF1bUdyR3c0OFZaZHZJTHcyMVZvUjBPZ2pqR1pYRjJrSjN5TmJUVUNaWi9v?=
 =?utf-8?B?eG1FcXEwNjJGNEdMS2NJSU9iSEZRTmxEcnhTOWcvQnBuYSttVlNKc0FZeDFZ?=
 =?utf-8?B?YmNKR2NBeTlJb2FIZkpjRjc0MDVZRng1S05yeDh3U2UxMEVuQkhEbzV2TUdG?=
 =?utf-8?B?MVprL1hhN3Z3NXlLK2ZlNlQreEhTVFNSMjlZWjh4TDVKWmVtekJKdm0rT3pI?=
 =?utf-8?B?NE9QQXprQUZ6WXVtVklFMjFpYk1VYVVmeHZiaTRuVHhRYW9OaVFJTjZ3U1BK?=
 =?utf-8?B?aE1jcE1HZGh1VVIwTk1hck1nOUVhdUFTN2E4eG9tVUVidVVUZXBFVlUrL25T?=
 =?utf-8?B?TG1WTU4yQWlNWUpSVjd2WVdoZERpS2RHWW5oZmRrNnEydlRJR21RbXBlTlZ4?=
 =?utf-8?B?aXU2T0k5NEJpS2dwajZTMm8zZEs3ci9rZ0s1V3ptR3ZrZkh3cURrNWFscitL?=
 =?utf-8?Q?L6gquxRl5t7Wo1CCXMESMR8Dqg2GMRzkwN7PD+x?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB8PR10MB3977.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: e90291b7-18dc-41e2-153b-08d8de27b54d
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 09:35:39.9196
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pMeGm2YsQU46r20dw1Bw+7ml7Or3+tqTyp1o3E7P75zhYS065D1xt+dQpwb/NpHSIWLQchnSM7yZ8E9V4eRTcryez3n+r2VL80Qwfqde8Rg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3943
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQXJtaW4sDQoNCkRpZCB5b3UgaGF2ZSBzb21lIHRpbWUgdG8gbG9vayBhdCB0aGF0Pw0KDQpS
ZWdhcmRzLA0KQW5kcmVqDQoNCj4gSGkgQXJtaW4NCj4NCj4gUmVnYXJkaW5nIHRvIE9CSlNfTElC
UywgaXQgd2FzIGFkZGVkIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL29wZW4tc291cmNlLXBhcnNl
cnMvanNvbmNwcC9wdWxsLzExOTcvIC4gQnV0IHdoeSB0byBpbnN0YWxsIGl0PyBBcmVuJ3QgdGhl
IGhlYWRlcnMgYW5kIGxpYnMgZW5vdWdoPyBQcmV2aW91cyB2ZXJzaW9ucyBkb24ndCBoYXZlIHRo
aXMgImZlYXR1cmUiLg0KPg0KPlJlZ2FyZGluZyB0byBhZGRpbmcgaW50byBkdW5mZWxsL21hc3Rl
ci4gSSB3YW50ZWQgdG8gYXNrIGlmIGl0J3MgcG9zc2libGUgdG8gYWRkIGl0IGFsc28gaW50byBk
dW5mZWwgKyBtYXN0ZXIgYnJhbmNoLiBJZiBub3QsIHRoZW4gSSBoYXZlIHRvIHNlYXJjaCBmb3Ig
c2VjdXJpdHkgZml4ZXMgb25seSBmb3IgZHVuZmVsbCBicmFuY2guDQo+DQo+IFJlZ2FyZHMsDQo+
IEFuZHJlag0KPg0KPj4+ICAtIGRvIG5vdCBpbnN0YWxsIG9iaiBmaWxlcw0KPj4gV2hhdCBraW5k
IG9mIHVwZGF0ZSBpcyB0aGlzLg0KPj4NCj4+IFdoYXQgcHJvYmxlbSBpcyBub3QgaW5zdGFsbCBv
YmogZml4aW5nPw0KPj4NCj4+IFRoZXNlIGNoYW5nZXMgYXJlIG5vdCBpbiBNYXN0ZXIuDQo+Pg0K
Pj4gLWFybWluDQo+Pj4NCj4+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWogVmFsZWsgPGFuZHJlai52
YWxla0BzaWVtZW5zLmNvbT4NCj4+PiAtLS0NCj4+PiAgLi4uL3JlY2lwZXMtZGV2dG9vbHMvanNv
bmNwcC97anNvbmNwcF8xLjkuMy5iYiA9PiBqc29uY3BwXzEuOS40LmJifSAgIHwgNCArKy0tDQo+
Pj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pICByZW5h
bWUgDQo+Pj4gbWV0YS1vZS9yZWNpcGVzLWRldnRvb2xzL2pzb25jcHAve2pzb25jcHBfMS45LjMu
YmIgPT4gDQo+Pj4ganNvbmNwcF8xLjkuNC5iYn0gKDgyJSkNCj4+Pg0KPj4+IGRpZmYgLS1naXQg
YS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvanNvbmNwcC9qc29uY3BwXzEuOS4zLmJiDQo+Pj4g
Yi9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMvanNvbmNwcC9qc29uY3BwXzEuOS40LmJiDQo+Pj4g
c2ltaWxhcml0eSBpbmRleCA4MiUNCj4+PiByZW5hbWUgZnJvbSBtZXRhLW9lL3JlY2lwZXMtZGV2
dG9vbHMvanNvbmNwcC9qc29uY3BwXzEuOS4zLmJiDQo+Pj4gcmVuYW1lIHRvIG1ldGEtb2UvcmVj
aXBlcy1kZXZ0b29scy9qc29uY3BwL2pzb25jcHBfMS45LjQuYmINCj4+PiBpbmRleCBlNDE5MDdk
ZTQuLmEwMmZmNGE0ZCAxMDA2NDQNCj4+PiAtLS0gYS9tZXRhLW9lL3JlY2lwZXMtZGV2dG9vbHMv
anNvbmNwcC9qc29uY3BwXzEuOS4zLmJiDQo+Pj4gKysrIGIvbWV0YS1vZS9yZWNpcGVzLWRldnRv
b2xzL2pzb25jcHAvanNvbmNwcF8xLjkuNC5iYg0KPj4+IEBAIC0xMywxMyArMTMsMTMgQEAgTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5TRTttZDU9ZmEyYTIzZGQxZGM2YzEzOWYzNTEw
NTM3OWQ3NmRmMmIiDQo+Pj4gIA0KPj4+ICBQRSA9ICIxIg0KPj4+ICANCj4+PiAtU1JDUkVWID0g
IjZhYmEyM2Y0YTg2MjhkNTk5YTllZjdmYTQ4MTFjNGZmNmU0MDcwZTIiDQo+Pj4gK1NSQ1JFViA9
ICI5MDU5ZjVjYWQwMzBiYTExZDM3ODE4ODQ3NDQzYTUzOTE4YzMyN2IxIg0KPj4+ICBTUkNfVVJJ
ID0gImdpdDovL2dpdGh1Yi5jb20vb3Blbi1zb3VyY2UtcGFyc2Vycy9qc29uY3BwIg0KPj4+ICAN
Cj4+PiAgUyA9ICIke1dPUktESVJ9L2dpdCINCj4+PiAgDQo+Pj4gIGluaGVyaXQgY21ha2UNCj4+
PiAgDQo+Pj4gLUVYVFJBX09FQ01BS0UgKz0gIi1EQlVJTERfU0hBUkVEX0xJQlM9T04gLURKU09O
Q1BQX1dJVEhfVEVTVFM9T0ZGIg0KPj4+ICtFWFRSQV9PRUNNQUtFICs9ICItREJVSUxEX1NIQVJF
RF9MSUJTPU9OIC1EQlVJTERfT0JKRUNUX0xJQlM9T0ZGIC1ESlNPTkNQUF9XSVRIX1RFU1RTPU9G
RiINCj4+PiAgDQo+Pj4gIEJCQ0xBU1NFWFRFTkQgPSAibmF0aXZlIg0KPj4+DQo+Pj4gDQo+Pj4N
Cg0K
