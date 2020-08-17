Received: from NAM10-BN7-obe.outbound.protection.outlook.com (NAM10-BN7-obe.outbound.protection.outlook.com [40.107.92.84])
 by mx.groups.io with SMTP id smtpd.web12.47132.1597682584759601216
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2020 09:43:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=TmQvs13J;
 spf=pass (domain: windriver.com, ip: 40.107.92.84, mailfrom: joe.slater@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzIeuhISAGHMexQqDuBiiyf/nU8cieim2DFfEe/y9zG922ubCsiRtGF/ozVy2EyYqbUnmuicsIgbbu5nN8xfbDAPbEKKNhrHu5vAC/MUru3AAwt0a28ARPztLoxt2hxp+81plft8cYYiSXWBLYocH5CsYUc2J4LOQb78zwl4QuEimpgTq5vp0Xmyr9SrIIyui0+Wr4BX5wq8LTx6OmhHHPdiy5JGCDIOTvNqfUCm+1MCnySBLbJO/melPPRnljXpHnC/SJAfGjqndK+qjqkNQTRIjsQPo3KxcEhIMSjEpcZdWbF+oSdCoT4p+ek5yWBv8gT36ncL9IIUH8kKWJglCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAMwFo4eLnjfMQ4WQoS04lq0dqGLJo1rGYuPLUlp6fg=;
 b=WQCgCwuu0QrNjxs3gp45+IrY0BHkU6gkvDqy3Cmx+fZJop2/plPLLEngysn/BL1SPHFrLEarKCdaF0wWH0/MfAfveUT+LGnlQkeIu3L5O8b6Q8FZwkJUR3DBMZNqrDyCszdiFKPQPXXsefhlMaiX01zXSX58Hvjv8FEz1ZWZpRrQipdZi2CXkvg3QzMXO07F8TWwH9bdoHdx8WMMkUj+RLxditWmQm3EZvpZfSxq7+dFHqKFYSY+PQA1GfpeRyHAx7T5vkQ9h1I17csY2Rcq1xQxGofsX1+p/jcvN83SZ3m5XwQH8nmHCnHOJ1jc+/bCb6RXi61uL2cn1Lqkv+wPYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAMwFo4eLnjfMQ4WQoS04lq0dqGLJo1rGYuPLUlp6fg=;
 b=TmQvs13JYvf2tu5xe/UVmi/FAUvIYblvAmVQO7i1Vgej6Y4R8tv61jJHOkjTXXJUEQhrn0vrt2KoKxTk2CL0kH0XrADIm/30ZG+0usSkQEtD6M6dfExgevOuBhvzF/OTkcmoz73oCaOmWvg6zueURiCelzuZoQlnGZSrDn25bsE=
Received: from BY5PR11MB3992.namprd11.prod.outlook.com (2603:10b6:a03:188::10)
 by BY5PR11MB4166.namprd11.prod.outlook.com (2603:10b6:a03:191::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3283.22; Mon, 17 Aug
 2020 16:43:03 +0000
Received: from BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6]) by BY5PR11MB3992.namprd11.prod.outlook.com
 ([fe80::d93e:4c0f:e4a9:dfc6%2]) with mapi id 15.20.3283.028; Mon, 17 Aug 2020
 16:43:03 +0000
From: "Joe Slater" <joe.slater@windriver.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>, "MacLeod,
 Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [oe] [meta-networking][PATCH 1/1] aoetool: make builds reproducible
Thread-Topic: [oe] [meta-networking][PATCH 1/1] aoetool: make builds
 reproducible
Thread-Index: AQHWcamTOtWM/IwdPEWR1A/USiXNRqk2ne2AgAXpWwA=
Date: Mon, 17 Aug 2020 16:43:03 +0000
Message-ID: 
 <BY5PR11MB39920F3D3CA5811C58DCAC03885F0@BY5PR11MB3992.namprd11.prod.outlook.com>
References: <20200813194015.3412-1-joe.slater@windriver.com>
 <CAMKF1sreu9ygY8TK0biqdsfHkYFGHL3m_E-y-g_+5F4DZ0xBpg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sreu9ygY8TK0biqdsfHkYFGHL3m_E-y-g_+5F4DZ0xBpg@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=windriver.com;
x-originating-ip: [24.4.218.114]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 762012c8-682e-478c-e475-08d842cc9c0c
x-ms-traffictypediagnostic: BY5PR11MB4166:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: 
 <BY5PR11MB4166AA9A2D8640CE0F494534885F0@BY5PR11MB4166.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 s3AqO3E8soELpwK1o30AKT+D1FklNJDEOB2tgaABZ2LeH7UJzAxfMzPCvhlqBxPkRFKmWCtrs8SJGj0cMy0HphlxlI0aX5l/Vn0AMhcEs4uqGVREyJI/rM9SsiQGuiaPxevXrB0cXSPfej2nDKGrEDx8/9zX/JWPMTcym4a1/1OUZ+zvr/KVDelnl0iQBnPl6J4Sgj8VfQ9wZAWGpRHWnctXPItWM8bcBXn4sDMab7QiYnIic5375YNWJw/kvc+pCBFhd6l4WAbVmDapcNlFc+HC22QhiWtLWq5nVFTXU5O3V6/BMzKjUeasWF1/e6JwqHOVf+Hi1waqHcQk0fj706/+vgJXS7bsjGioKIz4m3qVufEcSoFe5loSFSjGSSr/5FGj2GCUOT8SSr4zvUwDjQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3992.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39850400004)(346002)(376002)(396003)(136003)(366004)(8676002)(6916009)(478600001)(186003)(26005)(107886003)(316002)(8936002)(33656002)(4326008)(52536014)(86362001)(9686003)(55016002)(7696005)(5660300002)(83380400001)(66446008)(66556008)(966005)(66476007)(76116006)(71200400001)(54906003)(66946007)(2906002)(6506007)(64756008)(53546011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 
 SHHZhvF+2j3NHMXTyQ9v7vsNF2LKU6JIaeONFk6a1dUnpAFi2ti7Vmpbkjt39Z6FXQsyMdHjCtgTEV/DJkCtubPiR8gS3gGkwOD4+KtkDrJ1BkR/F3t1OFzvuOPM6CmUWn7avF79sOedUCB5qhzhK6YDO/OpRSp7jfhv/sUMThJaFrwzThJaYI67hc5J+Nnf6qh9XCT2wbZimcx6MIpHf/jve5x7zwtmxC3965upvK1znTSRAIDyw+X81yvkwUgtOpqkN6v0KtQfAXwGKwjoIE4nkc16FVnwPkfWaWqs02JAtdgAmyhOAfcJBOFltkx3fMmS96yeo/0A6rlqJgd5yoRbpeRqQYEOx6QiL1WbXKtm0x1LSkGIywtM4gNLDnvH6CTYEilaSBtTK+1ojEzJ6088ikOZdw65xLXHDF9H2r8BOlSkvfaYW3GRSrqsoVTaj8S36mkdLY4jbnP0Jo2C2cRIV0HbaqmTWJQhgvkmVeJnh5WEs7kDkMh2851moEMnn6oAc74Bl9DoViVnzQi5nIg89drx7v26tyn59/fDQgrlkeesWyU4TCTTLhqti0Xxk8OwbZ/9pKdHSQcfs8AB8rNTBsNj90xpe3fcayUzWF17EYtKZDwvVEzOCkDTz6pTOxKKFqE2bDLyRkPM8fgUTw==
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3992.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 762012c8-682e-478c-e475-08d842cc9c0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Aug 2020 16:43:03.0468
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oQO+tGj4lO8dHn4LTVgTF0xqB+/pXcg8kat+6dQzcoHDrmBcTVwxFG1ACUMTna/2SVDyPXPgfySRZ+aKpARykAOTDhGd9iGdU+9ZtDk4ZHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4166
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

RmluZSB3aXRoIG1lLCBidXQgSSB0aG91Z2h0IHRoZXJlIGNvdWxkIGJlIHNvbWUgcmVhc29uIHRo
ZXkgUkVBTExZIHdhbnQgLU8uICBBc3N1bWluZyBpdCBidWlsZHMsIEknbGwgc2VuZCBhIFYyDQoN
CkpvZQ0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4gDQpTZW50OiBUaHVyc2RheSwgQXVndXN0IDEzLCAyMDIwIDM6MjUgUE0N
ClRvOiBTbGF0ZXIsIEpvc2VwaCA8am9lLnNsYXRlckB3aW5kcml2ZXIuY29tPg0KQ2M6IG9wZW5l
bWJlZGVkLWRldmVsIDxvcGVuZW1iZWRkZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz47
IE1hY0xlb2QsIFJhbmR5IDxSYW5keS5NYWNMZW9kQHdpbmRyaXZlci5jb20+DQpTdWJqZWN0OiBS
ZTogW29lXSBbbWV0YS1uZXR3b3JraW5nXVtQQVRDSCAxLzFdIGFvZXRvb2w6IG1ha2UgYnVpbGRz
IHJlcHJvZHVjaWJsZQ0KDQpPbiBUaHUsIEF1ZyAxMywgMjAyMCBhdCAxMjo0MCBQTSBKb2UgU2xh
dGVyIDxqb2Uuc2xhdGVyQHdpbmRyaXZlci5jb20+IHdyb3RlOg0KPg0KPiBTdHJpcCBob3N0IHBh
dGggaW5mb21hdGlvbiBvdXQgb2YgYmluYXJpZXMgYnkgbm90IHN1cHByZXNzaW5nIGRlZmF1bHQg
DQo+IENGTEFHUy4NCj4NCj4gU2lnbmVkLW9mZi1ieTogSm9lIFNsYXRlciA8am9lLnNsYXRlckB3
aW5kcml2ZXIuY29tPg0KPiAtLS0NCj4gIC4uLi9hb2V0b29scy9hb2V0b29scy9yZXByb2R1Y2li
bGUtYnVpbGQucGF0Y2ggICAgICAgfCAxMiArKysrKysrKysrKysNCj4gIC4uLi9yZWNpcGVzLXN1
cHBvcnQvYW9ldG9vbHMvYW9ldG9vbHNfMzYuYmIgICAgICAgICAgfCAgMSArDQo+ICAyIGZpbGVz
IGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCANCj4gbWV0
YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9hb2V0b29scy9hb2V0b29scy9yZXByb2R1Y2li
bGUtYnVpbGQucA0KPiBhdGNoDQo+DQo+IGRpZmYgLS1naXQgDQo+IGEvbWV0YS1uZXR3b3JraW5n
L3JlY2lwZXMtc3VwcG9ydC9hb2V0b29scy9hb2V0b29scy9yZXByb2R1Y2libGUtYnVpbGQNCj4g
LnBhdGNoIA0KPiBiL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvYW9ldG9vbHMvYW9l
dG9vbHMvcmVwcm9kdWNpYmxlLWJ1aWxkDQo+IC5wYXRjaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0
NA0KPiBpbmRleCAwMDAwMDAwMDAuLjQ5MzlhYjI1Yw0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvYW9ldG9vbHMvYW9ldG9vbHMvcmVwcm9k
dWNpYmxlLWINCj4gKysrIHVpbGQucGF0Y2gNCj4gQEAgLTAsMCArMSwxMiBAQA0KPiArLS0tIGEv
TWFrZWZpbGUNCj4gKysrKyBiL01ha2VmaWxlDQo+ICtAQCAtNDAsNyArNDAsOCBAQCBOUEVSU0hF
TEY9MTYNCj4gKyBDT05GX1NDUklQVFMgPSBhb2UtZGlzY292ZXIgYW9lLWludGVyZmFjZXMgYW9l
LW1rc2hlbGYgDQo+ICthb2UtcmV2YWxpZGF0ZSBhb2UtZmx1c2ggYW9lLXN0YXQgIFBST0dTID0g
YW9lcGluZyBhb2VjZmcgDQo+ICthb2Utc2FuY2hlY2sgIENPTU1BTkRTIDo9ICR7Q09ORl9TQ1JJ
UFRTfSBhb2UtbWtkZXZzIGFvZS12ZXJzaW9uIA0KPiArY29yYWlkLXVwZGF0ZSAke1BST0dTfSAt
Q0ZMQUdTID0gLVdhbGwgLU8gLWcNCj4gKysjIFdlIGNvdWxkIHN0aWxsIG92ZXJyaWRlIHRoaXMg
b24gdGhlIGNvbW1hbmQgbGluZS4NCj4gKytDRkxBR1MgKz0gLVdhbGwgLU8gLWcNCg0KUGVyaGFw
cyB1c2UgPz0gaGVyZSwgc2luY2UgLU8gd2lsbCBvdmVycmlkZSB0aGUgZGVmYXVsdCBvcHRpbWl6
YXRpb24gdGhhdCBiaXRiYWtlIHdpbGwgcGFzcyBpbiBlbnYNCg0KPiArIFNBTkNIRUNLTElCUyA9
IC1scHRocmVhZA0KPiArDQo+ICsgQU9FX1BJTkdfT0JKID0gYW9lcGluZy5vIGxpbnV4Lm8NCj4g
ZGlmZiAtLWdpdCBhL21ldGEtbmV0d29ya2luZy9yZWNpcGVzLXN1cHBvcnQvYW9ldG9vbHMvYW9l
dG9vbHNfMzYuYmIgDQo+IGIvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9hb2V0b29s
cy9hb2V0b29sc18zNi5iYg0KPiBpbmRleCA5YjczYjQ0MmEuLjYwZjNkYzliMiAxMDA2NDQNCj4g
LS0tIGEvbWV0YS1uZXR3b3JraW5nL3JlY2lwZXMtc3VwcG9ydC9hb2V0b29scy9hb2V0b29sc18z
Ni5iYg0KPiArKysgYi9tZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0L2FvZXRvb2xzL2Fv
ZXRvb2xzXzM2LmJiDQo+IEBAIC0xMyw2ICsxMyw3IEBAIFJSRUNPTU1FTkRTXyR7UE59ID0gImtl
cm5lbC1tb2R1bGUtYW9lIg0KPiAgU1JDX1VSSSA9ICJodHRwOi8vc291cmNlZm9yZ2UubmV0L3By
b2plY3RzLyR7QlBOfS9maWxlcy8ke0JQTn0vJHtCUE59LSR7UFZ9LnRhci5neiBcDQo+ICAgICAg
ICAgICAgIGZpbGU6Ly9hb2Utc3RhdC1uby1iYXNoaXNtLnBhdGNoIFwNCj4gICAgICAgICAgICAg
ZmlsZTovL21ha2VmaWxlLWFkZC1sZGZsYWdzLnBhdGNoIFwNCj4gKyAgICAgICAgICAgZmlsZTov
L3JlcHJvZHVjaWJsZS1idWlsZC5wYXRjaCBcDQo+ICAgICAgICAgICINCj4gIFNSQ19VUklbbWQ1
c3VtXSA9ICJiZmYzMGRhYTk4OGE2NWY2OWQ0NDQ4Y2U0NzI2YTZkYiINCj4gIFNSQ19VUklbc2hh
MjU2c3VtXSA9ICJmYjVlMmNkMGRlNzY0NGNjMWVjMDRlZTNhZWI0MzIxMWNmNzQ0NWEwYzE5ZTEz
ZDZiM2VkNWE4ZmJkZjIxNWZmIg0KPiAtLQ0KPiAyLjI0LjENCj4NCj4gDQo=
