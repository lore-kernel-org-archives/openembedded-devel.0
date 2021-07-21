Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.805.1626909282725608728
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Jul 2021 16:14:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=QDHs0e4o;
 spf=pass (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=28363971ff=joe.slater@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 16LNC1Lj016754
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 23:14:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=fh7YISVbe32+XC7znJyemsRfI5wFPXknyrN5tKAd7nE=;
 b=QDHs0e4o6Dw5jiU5kty2LDYtvUxIGurLpZPq56E9tvBiadU9LJK6UAXmtmzhAyRC5ZEl
 l1Ut3cxsfW7prm3IZOmZ+ABc0QTfb7SZ6qKj6j1AV/k+uMRPR1ZUdL4MtWpcE2G7UQaL
 wU3O3o1XqGl+ndk7m92P0asYdK1Tb6w7Xw6W8oO8SD6BGmTiVmBemBAYdiFVBLgoWCtP
 +qiJYzhWALWQtv1ixO0SbwGx8UIlvMfHMCl5fbGAaab/qb3a4BJT1bXnAPqR1fJGPjRa
 JmxMs2dGOz7fI9NAmzQzi5dxbA2qmAaNacBmod7pJLZkyJDRhE0h4NiubBI8RNCJFKSL 3A== 
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2046.outbound.protection.outlook.com [104.47.66.46])
	by mx0a-0064b401.pphosted.com with ESMTP id 39xd3r0pjg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Jul 2021 23:14:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gZxBIk52qqjFMtCmEwso8V3Uc52M34X9kcgWdmeeQYZ3XTAY2X055CleoJ2V6nh1108I9nkioJ8FcvBYv/ClLnmZuZx+ytfNDcTcriNbtRpY0ljm3U+84A2jIy0pp2qSi4ImtS6WTGjn0Yvbbg2R0ZD2tmbcQjl4HaoxlM7Lg3dtCT3dbxeJlDkcfd/hf17O/jxG3n7lPr9q9EIuBEvh8UtOxElLaOv9tmSdZOFOKqqGiz2OlXfLZBHiv8j+2lDfgBAEv8XnJ0AzKiavSFp4Js6twZKN4gM4d8A78TAgFc6AB+sxo1lwdZIqSOYS4OENQ0Q01gD3fdi+JuagMYFI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fh7YISVbe32+XC7znJyemsRfI5wFPXknyrN5tKAd7nE=;
 b=Kl7QEG0Np5bqLFgSIBoit5VDmU7Aq3cCZ8O86qqvy9VNpxgmIcYp6bmpUcs1uW6Dcf4k1VXF/3ayBmwNjiBbgdxswvnZ7rTvsbtkSzZGoXTq2and2gV3Cik5GQIUuGu7QJnNEZK4E8SK4lFBX7tFLeJWtrSD7UWtLhW8P6yjvlamlLHYMD/1hIIbuLB8UvNUoBcaog7m5UwIjzkjOFTrHPBXibiGyX8rTrKsHSENg9OR0Fw04N9e8mM4BjJ2sATWi9tN7Xe1kSw/x/zFBvVmEZrlngv5CHMjQQ8hVMyXbAYtKKjGu7QSE8razK32CFsdMZgquzNuy9yn25cVWX79kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BYAPR11MB2999.namprd11.prod.outlook.com (2603:10b6:a03:90::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Wed, 21 Jul
 2021 23:14:38 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::21e7:f902:62e6:1f04%7]) with mapi id 15.20.4352.025; Wed, 21 Jul 2021
 23:14:38 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: "MacLeod, Randy" <Randy.MacLeod@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade 8.2.0 -> 8.3.1
Thread-Topic: [hardknott][meta-python][PATCH 1/1] python3-pillow: Upgrade
 8.2.0 -> 8.3.1
Thread-Index: AQHXfm7w82vsf3DBN0KgY9IjPc/4d6tODq8AgAAAwXA=
Date: Wed, 21 Jul 2021 23:14:38 +0000
Message-ID: 
 <BY5PR11MB399278F377E2055FB90422FD88E39@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20210721202801.27916-1-joe.slater@windriver.com>
 <107cd529-e534-03fd-0e72-298327cf972b@windriver.com>
In-Reply-To: <107cd529-e534-03fd-0e72-298327cf972b@windriver.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: windriver.com; dkim=none (message not signed)
 header.d=none;windriver.com; dmarc=none action=none
 header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d1313ac4-f52b-4af3-443d-08d94c9d4fd6
x-ms-traffictypediagnostic: BYAPR11MB2999:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BYAPR11MB29990529260B23ED33B4A97288E39@BYAPR11MB2999.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:568;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 YZb7wPOdHYP7jHZcLjwKJH41sN6fmxpPLmDaM6f0gpD4vYZViINeTkuPfwect3BR6tg0zy3koZjMQ8u79dssrGA1BRgSt1ONNptFaECULFmLtclZp63EEwBQ+g8OusKNCD7me4zw7frRQ0uASmo9YGnaLgN+7LAEe2I23qS0YP/hE8wk5c/x/XCdBQ1Cj5qDgExXDrmVF2Y3RXOS9M8EPWlV9dzrjJohwH7CzM0nL8Tt3TAUxbcG16P+SSEpWb2wEpcldoTRIurIUbSAeAldH/jZh2SYe7jZ5H3UdEiak7thN6MpbJoG1431ItsICQcj0y5uwn91+akY3cpSiPbC2dp9BmV1jfdcreyLh+a1jnJtGnARz7S3hPrdAEvU30awLZSfKwCuhKsKwq9YgwGWUgapOicZGam/6OuBEiYiVGsudOiZIgR2o81aa5p2LNZRMjDEHKx/vj/J2fOCPwKZ5EBvWorVeZBeoPXDxAMPZOSVGuIOZcWD1C2dnd1R61nlvkpmvjyGCzWQS/m5NYth8TvVkWrEcd+qJMtb5EMhS6KGN6YIuueRT+CS7gIIEgerYKBnGr4SMLHZKM/MVZyobhO1sVa+eNglj4jChjT0n9Ezut0Rmgr1YNfoA1XajNGZD4AkGOcHe5b51GWydF+LRRghJ4cxF7foI1UHzEOEQpxTRedPC038hdlKOAKIye1/rDnrXz3oKAAHXQqKYqSvNg==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(39850400004)(366004)(346002)(376002)(396003)(66476007)(2906002)(66556008)(64756008)(66446008)(66946007)(76116006)(966005)(186003)(478600001)(83380400001)(8936002)(8676002)(9686003)(71200400001)(52536014)(122000001)(38100700002)(7696005)(316002)(26005)(5660300002)(110136005)(55016002)(33656002)(86362001)(53546011)(6506007)(38070700004);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?MFVQR1BuWno1dGRCa2JEUmIzMmtpUk9USnBOaVEvMExuZE5GaDhlODJnT2pX?=
 =?utf-8?B?Rm1FN0VLVkg4T3pLN3FrUEFtMlhhaUxUajNHTld6QmEwSWpHTjQ1MXJRM1RC?=
 =?utf-8?B?ajF3UXk4bjhmOEUyM2dMaG15RkR3am1kak1INktHUXFMRnhwK2pCQjVRZWVV?=
 =?utf-8?B?aWdXRUdJUXVSNmYxam82N29kNEwvYkFwQjFVaDVaZzlIRWUzMDlRVmhZemlX?=
 =?utf-8?B?ei91MjNPYzVFdjZqNlF1aTVlSGFxTFROU005OFJDTktwbFM2RXc4WEdCUTF2?=
 =?utf-8?B?ODg4OFIxN2ZXamliNktpSmZmZkwrVjRRQnVVcWFIejI3cmVMNmg1TnR1TDVI?=
 =?utf-8?B?UDZYQksrcnRFcU1haFBibFNjNlVkVnI1UUZMN25wbnpyTE9Gb0d4Rjl1YjRi?=
 =?utf-8?B?QlYyZ2xDa1FReC93VW5sNWMxSnpXcWJXS2dZQWo2ZUR5K056Z3JUVTFTMWwx?=
 =?utf-8?B?QzdaWWx4eko0Y0NxOGM5SmIvUk9PYTd6YnJaTFVBR3RGbXhQOHkxYnBNdkhT?=
 =?utf-8?B?NUhZQUMwL1VCeG5KQUMvS3pzWEU4blI3d2kyV3RyYUl0QXhrazQ0TUY0L3VF?=
 =?utf-8?B?emZJZFZjL21pRE1ObE10NFdrak5IZ3ZiRTAvenlicytNa2Z1ZEI3cWpyNzVv?=
 =?utf-8?B?MEZTMHdmZDhQZGR6Q3l4eCszUGdhMEJ4alFLazV0TTZCazl1bHRrMHVwNmQr?=
 =?utf-8?B?RlkwQkdRS1pGYVlYRVM0MENBTDl3djdWZXNMcUFMc0czKzE4VGlIdE9leHdM?=
 =?utf-8?B?MWpqd1Z2TkJkbmVOR2VsR1gyeWRUTDdVaHFMUzhYSXFWVW9sTHhIS1k2dThp?=
 =?utf-8?B?OUw3Z1htYmpqMzFTR3BZL0FWRTRXOEJEbTJCQ1JQdWJkaENaL1FHZUlzWHYy?=
 =?utf-8?B?Z1UzWWNxM3BrdmdFR3ZnM3BqY2hJcUptSDZlN1RCR3hoSjBxbHV6U09icExm?=
 =?utf-8?B?Mlc2d0ovVEhXaWozd2dUUVRYOGIwQ3dybk9uQU5DWWFpMm9WVnpEeVlTTWs3?=
 =?utf-8?B?OU5udGhmazdObjJQZUwrYnNVck9RUzhIVkUxM0xkcDFxekEvMUJCQ0lOZFlX?=
 =?utf-8?B?dXJBcjNIeHh5RkFhMmxBWFA3NkVNWnloZmM2MU9mbkdINEhLMnRKNGJnSXAx?=
 =?utf-8?B?MkNuMHRoNlN2MnRPbW1VSEx6UUtreWxWU2pUQzZFK2Y1dm5OZy91Rk0vTU9E?=
 =?utf-8?B?VmZob3d5Rnd3cEJmK2J0eTVTZkFRSVlIMjRrNTZOOXFHaDJuTkM5K2ZWdWg5?=
 =?utf-8?B?L3l0SU0wZEJnWUcvVDl3d3dDbERON0ZaWGoxdXliNDc5SVVvTXg0UGZJWG9o?=
 =?utf-8?B?VWZyVDBydk5lUm85Vzc2VWJra3B1Nkx1d1lVVzYrdGV6QWtRaVlHSmpkQTRU?=
 =?utf-8?B?Z09oUUxBWWtaVW9lajkvTkpjZWdkcW1sdnhCQWs5VjBGSnN2NitCWTZyVGk3?=
 =?utf-8?B?bDBxVk1OU1ZZd3p4bDBiTWVucHpsN2kxQVJIM2xqRWx1Z3JRS2dOUmFscFZl?=
 =?utf-8?B?TnlDQng4V080YVhrSUp6MkRPeU9XNUFNa2NHM29qaEVGSFF0dkczdURBaVh2?=
 =?utf-8?B?UDAybk55L2lFT2UwV0c0cnhla3VZanlYcHd1Z1ZXSTNUd3NKVlUvTFAyclhy?=
 =?utf-8?B?cGZuUENmNFNCdkVITVNiaHg1VjlGK0pPL2VWbXdSQ2NZNmNFcVU3TG41ZnpV?=
 =?utf-8?B?S1RPamVoRzBKaDg3dHpEVk9memJYczdiUGkxd1k1Y1BzZWxJT2N1Mm91RWlI?=
 =?utf-8?Q?Ijs6tDzkPPfQDOjI0g=3D?=
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1313ac4-f52b-4af3-443d-08d94c9d4fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2021 23:14:38.1245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lLT//SRFsNMCsJ9pjl7qqMgnDG3MZ7frK/Qc1H73TMLRGf96BzwllV87oPJnBVIuRUc4mLIzX7b4om5V+vonzDLPI8M1O1asG7vPQv9kk3o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB2999
X-Proofpoint-GUID: lcSPWsQXX8TPQI1EWQqbCm_rMC3uaQHM
X-Proofpoint-ORIG-GUID: lcSPWsQXX8TPQI1EWQqbCm_rMC3uaQHM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-07-21_11,2021-07-21_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2107210139
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q1ZFIGZpeC4NCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNYWNMZW9k
LCBSYW5keSA8UmFuZHkuTWFjTGVvZEB3aW5kcml2ZXIuY29tPg0KPiBTZW50OiBXZWRuZXNkYXks
IEp1bHkgMjEsIDIwMjEgNDoxMiBQTQ0KPiBUbzogU2xhdGVyLCBKb3NlcGggPGpvZS5zbGF0ZXJA
d2luZHJpdmVyLmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZw0KPiBTdWJqZWN0OiBSZTogW2hhcmRrbm90dF1bbWV0YS1weXRob25dW1BBVENIIDEvMV0g
cHl0aG9uMy1waWxsb3c6IFVwZ3JhZGUNCj4gOC4yLjAgLT4gOC4zLjENCj4gDQo+IE9uIDIwMjEt
MDctMjEgNDoyOCBwLm0uLCBKb2UgU2xhdGVyIHdyb3RlOg0KPiA+IEZyb206IExlb24gQW5hdmkg
PGxlb24uYW5hdmlAa29uc3Vsa28uY29tPg0KPiA+DQo+ID4gVXBncmFkZSB0byByZWxlYXNlIDgu
My4xOg0KPiANCj4gSXQgbG9va3MgbGlrZSA4LjMgaGFzIHNvbWUgQVBJIENoYW5nZXM6DQo+IA0K
PiBodHRwczovL3BpbGxvdy5yZWFkdGhlZG9jcy5pby9lbi9zdGFibGUvcmVsZWFzZW5vdGVzLzgu
My4wLmh0bWwNCj4gDQo+IHNvIGl0J3MgbGlrZWx5IG5vdCBhIGdvIGZvciBoYXJka25vdHQgYnV0
IEkgZGlkbid0IGNsb25lIGFuZCBleGFtaW5lIHRoZSBzcmMgcmVwby4NCj4gDQo+IA0KPiBXYXMg
eW91IGdvYWwgdG8gZml4IGEgQ1ZFIEpvZSBvciBzb21ldGhpbmcgZWxzZT8NCj4gDQo+IC4uL1Jh
bmR5DQo+IA0KPiANCj4gPg0KPiA+IC0gQ2F0Y2ggT1NFcnJvciB3aGVuIGNoZWNraW5nIGlmIGZw
IGlzIHN5cy5zdGRvdXQNCj4gPiAtIEhhbmRsZSByZW1vdmluZyBvcmllbnRhdGlvbiBmcm9tIGFs
dGVybmF0ZSB0eXBlcyBvZiBFWElGIGRhdGENCj4gPiAtIE1ha2UgSW1hZ2UuX19hcnJheV9fIHRh
a2Ugb3B0aW9uYWwgZHR5cGUgYXJndW1lbnQNCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IExlb24g
QW5hdmkgPGxlb24uYW5hdmlAa29uc3Vsa28uY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEtoZW0g
UmFqIDxyYWoua2hlbUBnbWFpbC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogVHJldm9yIEdhbWJs
aW4gPHRyZXZvci5nYW1ibGluQHdpbmRyaXZlci5jb20+DQo+ID4NCj4gPiBGaXhlcyBDVkUtMjAy
MS0zNDU1Mi4NCj4gPiAoY2hlcnJ5IHBpY2tlZCBmcm9tIGNvbW1pdCBhNWZjNjAwNzFmMGEwYTE2
MDk2NzkyYzRlMTk3MGQzMWY1OTY0NTM5KQ0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogSm9lIFNs
YXRlciA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3tweXRo
b24zLXBpbGxvd184LjIuMC5iYiA9PiBweXRob24zLXBpbGxvd184LjMuMS5iYn0gICAgICB8IDQg
KystLQ0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkNCj4gPiAgIHJlbmFtZSBtZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi97cHl0
aG9uMy1waWxsb3dfOC4yLjAuYmINCj4gPiA9PiBweXRob24zLXBpbGxvd184LjMuMS5iYn0gKDg2
JSkNCj4gPg0KPiA+IGRpZmYgLS1naXQNCj4gPiBhL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9v
bHMvcHl0aG9uL3B5dGhvbjMtcGlsbG93XzguMi4wLmJiDQo+ID4gYi9tZXRhLXB5dGhvbi9yZWNp
cGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpbGxvd184LjMuMS5iYg0KPiA+IHNpbWlsYXJp
dHkgaW5kZXggODYlDQo+ID4gcmVuYW1lIGZyb20NCj4gPiBtZXRhLXB5dGhvbi9yZWNpcGVzLWRl
dnRvb2xzL3B5dGhvbi9weXRob24zLXBpbGxvd184LjIuMC5iYg0KPiA+IHJlbmFtZSB0byBtZXRh
LXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLXBpbGxvd184LjMuMS5iYg0K
PiA+IGluZGV4IDMyNDEyMzBkMS4uMDQ1MzU3YTZhIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtcGlsbG93XzguMi4wLmJiDQo+ID4g
KysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1waWxsb3df
OC4zLjEuYmINCj4gPiBAQCAtNSwxMSArNSwxMSBAQCBIT01FUEFHRSA9ICJodHRwczovL3BpbGxv
dy5yZWFkdGhlZG9jcy5pbyINCj4gPiAgIExJQ0VOU0UgPSAiTUlUIg0KPiA+ICAgTElDX0ZJTEVT
X0NIS1NVTSA9DQo+ICJmaWxlOi8vTElDRU5TRTttZDU9MDMzN2IxMTYyMzNkYTQ2MTZhZTlmZGIx
MzBiZjZmMWEiDQo+ID4NCj4gPiAtU1JDX1VSSSA9ICJnaXQ6Ly9naXRodWIuY29tL3B5dGhvbi1w
aWxsb3cvUGlsbG93LmdpdDticmFuY2g9OC4yLnggXA0KPiA+ICtTUkNfVVJJID0gImdpdDovL2dp
dGh1Yi5jb20vcHl0aG9uLXBpbGxvdy9QaWxsb3cuZ2l0O2JyYW5jaD04LjMueCBcDQo+ID4gICAg
ICAgICAgICAgIGZpbGU6Ly8wMDAxLXN1cHBvcnQtY3Jvc3MtY29tcGlsaW5nLnBhdGNoIFwNCj4g
PiAgICAgICAgICAgICAgZmlsZTovLzAwMDEtZXhwbGljaXRseS1zZXQtY29tcGlsZS1vcHRpb25z
LnBhdGNoIFwNCj4gPiAgICINCj4gPiAtU1JDUkVWID89ICJlMGUzNTNjMGVmNzUxNjk3OWE5YWVk
Y2UzNzkyNTk2NjQ5Y2U0NDMzIg0KPiA+ICtTUkNSRVYgPz0gIjkyOTMzYjg2NTc0YjljODA3NjRi
ZjUyYzM1N2VkMjllMWVmNTMzODIiDQo+ID4NCj4gPiAgIGluaGVyaXQgc2V0dXB0b29sczMNCj4g
Pg0KPiA+DQo+IA0KPiANCj4gLS0NCj4gIyBSYW5keSBNYWNMZW9kDQo+ICMgV2luZCBSaXZlciBM
aW51eA0K
