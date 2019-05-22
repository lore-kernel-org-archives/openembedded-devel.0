Return-Path: <prvs=604521429f=alejandro.delcastillo@ni.com>
X-Greylist: delayed 1851 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 May 2019 16:10:57 UTC
Received: from mx0b-00010702.pphosted.com (mx0b-00010702.pphosted.com
	[148.163.158.57])
	by mail.openembedded.org (Postfix) with ESMTP id AD3357E3D6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 May 2019 16:10:57 +0000 (UTC)
Received: from pps.filterd (m0098779.ppops.net [127.0.0.1])
	by mx0b-00010702.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4MFaQZa023994; Wed, 22 May 2019 10:40:07 -0500
Received: from nam04-co1-obe.outbound.protection.outlook.com
	(mail-co1nam04lp2058.outbound.protection.outlook.com [104.47.45.58])
	by mx0b-00010702.pphosted.com with ESMTP id 2sn4e98rsj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-SHA384 bits=256 verify=NOT);
	Wed, 22 May 2019 10:40:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nio365.onmicrosoft.com; s=selector1-nio365-onmicrosoft-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2Ej4X1kd/yjfGwjeHTyogQg8PaOdyDvKQ/nbIFu1KcU=;
	b=K9X660ks3eNIsfbhP35prcKPP4Hvd82m6YOd/NLUE0mpsJW1RpuYApM3A82eD7uzeHItrgGlk+poNMqVHBv0RZHn4CYmPQq6Kj8RfQOVolNe+O//QoQe/HERyr7yfdXlOFcRC6gx43ubyRRH2ritaHLXsJQTpE+gb+OKKk3co+g=
Received: from SN6PR04MB4221.namprd04.prod.outlook.com (52.135.71.147) by
	SN6PR04MB5327.namprd04.prod.outlook.com (20.177.255.81) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1922.15; Wed, 22 May 2019 15:40:04 +0000
Received: from SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::70d5:e6a1:16e0:110a]) by
	SN6PR04MB4221.namprd04.prod.outlook.com
	([fe80::70d5:e6a1:16e0:110a%5]) with mapi id 15.20.1900.024;
	Wed, 22 May 2019 15:40:04 +0000
From: Alejandro Del Castillo <alejandro.delcastillo@ni.com>
To: Khem Raj <raj.khem@gmail.com>
Thread-Topic: [EXTERNAL] Re: [oe] [meta-webserver][PATCH] apache2: add all
	extra/*.conf to conffiles
Thread-Index: AQHVD/At4swbn9wQi0W+d+V3qWJ0yaZ2UT8AgAD4GwA=
Date: Wed, 22 May 2019 15:40:03 +0000
Message-ID: <71129f81-1a95-f695-924f-4137477560bf@ni.com>
References: <20190521161348.20347-1-alejandro.delcastillo@ni.com>
	<CAMKF1spQMMOoKqt0zD1MwBnX3D8MF4PPjO=1eBe_y5RKGdWZTQ@mail.gmail.com>
In-Reply-To: <CAMKF1spQMMOoKqt0zD1MwBnX3D8MF4PPjO=1eBe_y5RKGdWZTQ@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0701CA0014.namprd07.prod.outlook.com
	(2603:10b6:803:28::24) To SN6PR04MB4221.namprd04.prod.outlook.com
	(2603:10b6:805:30::19)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [130.164.62.198]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f19cf3af-bcee-4a9d-0772-08d6decbc22f
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
	SRVR:SN6PR04MB5327; 
x-ms-traffictypediagnostic: SN6PR04MB5327:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <SN6PR04MB53271887BE10B201AEBCB22886000@SN6PR04MB5327.namprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0045236D47
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(396003)(39860400002)(346002)(376002)(136003)(366004)(199004)(189003)(71200400001)(25786009)(71190400001)(11346002)(31696002)(36756003)(6436002)(31686004)(76176011)(99286004)(186003)(86362001)(476003)(2616005)(102836004)(52116002)(446003)(6486002)(478600001)(68736007)(6512007)(486006)(256004)(14444005)(6306002)(66066001)(229853002)(14454004)(316002)(6916009)(53936002)(966005)(66446008)(2906002)(8936002)(305945005)(73956011)(66946007)(66476007)(66556008)(6116002)(3846002)(4326008)(7736002)(64756008)(26005)(8676002)(81166006)(5660300002)(81156014)(386003)(6506007)(6246003)(53546011);
	DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR04MB5327;
	H:SN6PR04MB4221.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: ni.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2CLZqaCZ4gVqjziII0vdG8uDMEMGj4FUVYNDv/ApHIfmYjFseiO4SF1DcH+X/diogQ4qCbSL/6DsKXsg1L5QuY4h1uOho4fzNb/jh8XsGfV6w7g4+UR2D0foTEDHB4HunkS2tFFk7KVllMDgQ6yxwFcXHqG47ElYrLcLOEeizq591rDDBn7teiiEHqWZv/dKM//+kaE19YHZ4cJC6lAbWeRn5CQ6btxrFyehOJ1D+mMOHUq1t4fLPc3mfBxUpyxTy1ixt7LSW/uuN+Fcq7htqVXreI2ZlEQHpxzTzgcjNuPdeR6wrhyGMU5cMjV49UolbpilBjF0s/H2TzPalZAH+9/ApgIq4IRlJ2X4f8KPykEoWROMFIWxaxAENqK9AUXpYtD8ZJAkepK0IP6AMM4gLjsMNsuVkfVjbIdCjMarkJg=
MIME-Version: 1.0
X-OriginatorOrg: ni.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19cf3af-bcee-4a9d-0772-08d6decbc22f
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2019 15:40:03.9601 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 87ba1f9a-44cd-43a6-b008-6fdb45a5204e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR04MB5327
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-22_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=inbound_policy_notspam policy=inbound_policy
	score=30
	priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
	bulkscore=0
	spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=30 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905220110
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-webserver][PATCH] apache2: add all extra/*.conf to conffiles
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
X-List-Received-Date: Wed, 22 May 2019 16:10:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <3087737B10C14343BB346A4D702A346E@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

YWgsIGJhZCBjb25maWd1cmF0aW9uIG9uIG15IG1hY2hpbmUsIHdpbGwgc2VuZCBjb3JyZWN0IHYy
IHNob3J0bHkNCg0KT24gNS8yMS8xOSA3OjUyIFBNLCBLaGVtIFJhaiB3cm90ZToNCj4gSGkgQWxl
amFuZHJvDQo+IFBsZWFzZSByZWJhc2UvdGVzdCBpdCBvbiBtYXN0ZXIgaWYgeW91IGFyZSBwcm9w
b3NpbmcgaXQgZm9yIG1hc3Rlci4NCj4gDQo+IE9uIFR1ZSwgTWF5IDIxLCAyMDE5IGF0IDEyOjAx
IFBNIEFsZWphbmRybyBkZWwgQ2FzdGlsbG8NCj4gPGFsZWphbmRyby5kZWxjYXN0aWxsb0BuaS5j
b20+IHdyb3RlOg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEFsZWphbmRybyBkZWwgQ2FzdGlsbG8g
PGFsZWphbmRyby5kZWxjYXN0aWxsb0BuaS5jb20+DQo+PiAtLS0NCj4+ICAgbWV0YS13ZWJzZXJ2
ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTJfMi40LjM0LmJiIHwgMyArKy0NCj4+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQ0KPj4NCj4+IGRp
ZmYgLS1naXQgYS9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8y
LjQuMzQuYmIgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8y
LjQuMzQuYmINCj4+IGluZGV4IDY2NDJmMmJkYS4uODdlNDFjMjBlIDEwMDY0NA0KPj4gLS0tIGEv
bWV0YS13ZWJzZXJ2ZXIvcmVjaXBlcy1odHRwZC9hcGFjaGUyL2FwYWNoZTJfMi40LjM0LmJiDQo+
PiArKysgYi9tZXRhLXdlYnNlcnZlci9yZWNpcGVzLWh0dHBkL2FwYWNoZTIvYXBhY2hlMl8yLjQu
MzQuYmINCj4+IEBAIC0xNTIsNyArMTUyLDggQEAgUEFDS0FHRVMgPSAiJHtQTn0tc2NyaXB0cyAk
e1BOfS1kb2MgJHtQTn0tZGV2ICR7UE59LWRiZyAke1BOfSINCj4+ICAgQ09ORkZJTEVTXyR7UE59
ID0gIiR7c3lzY29uZmRpcn0vJHtCUE59L2h0dHBkLmNvbmYgXA0KPj4gICAgICAgICAgICAgICAg
ICAgICAgJHtzeXNjb25mZGlyfS8ke0JQTn0vbWFnaWMgXA0KPj4gICAgICAgICAgICAgICAgICAg
ICAgJHtzeXNjb25mZGlyfS8ke0JQTn0vbWltZS50eXBlcyBcDQo+PiAtICAgICAgICAgICAgICAg
ICAgICR7c3lzY29uZmRpcn0vaW5pdC5kLyR7QlBOfSAiDQo+PiArICAgICAgICAgICAgICAgICAg
ICR7c3lzY29uZmRpcn0vJHtCUE59L2V4dHJhLyogXA0KPj4gKyAgICAgICAgICAgICAgICAgICAk
e3N5c2NvbmZkaXJ9L2luaXQuZC8ke0JQTn0iDQo+Pg0KPj4gICAjIHdlIG92ZXJyaWRlIGhlcmUg
cmF0aGVyIHRoYW4gYXBwZW5kIHNvIHRoYXQgLnNvIGxpbmtzIGFyZQ0KPj4gICAjIGluY2x1ZGVk
IGluIHRoZSBydW50aW1lIHBhY2thZ2UgcmF0aGVyIHRoYW4gaGVyZSAoLWRldikNCj4+IC0tDQo+
PiAyLjIxLjANCj4+DQo+PiAtLQ0KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18NCj4+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+IE9w
ZW5lbWJlZGRlZC1kZXZlbEBsaXN0cy5vcGVuZW1iZWRkZWQub3JnDQo+PiBodHRwczovL3VybGRl
ZmVuc2UucHJvb2Zwb2ludC5jb20vdjIvdXJsP3U9aHR0cC0zQV9fbGlzdHMub3BlbmVtYmVkZGVk
Lm9yZ19tYWlsbWFuX2xpc3RpbmZvX29wZW5lbWJlZGRlZC0yRGRldmVsJmQ9RHdJQmFRJmM9SV8w
WXdvS3k3ejVMTVRWZHlPNllDaUUydXpJMWpqWlp1SVBlbGNTaml4QSZyPXdOY3JMMmFrUm42amZ4
aEhhS2F2VXJKQl9DOUpBTVh0eW5qTGQ4WnpnWFEmbT1qSnpJdWw3U1lHSVpld0VlZ01MZTBZNV80
dE81UVJVMVNxbVZkRnc4bUt3JnM9SFZXSFl4dGltcEFYTTFFcDRuTmprZG9QWkFhTDUzSnlnd2o4
Vk9ybG9hUSZlPQ0KDQotLSANCkNoZWVycywNCg0KQWxlamFuZHJvDQo=

