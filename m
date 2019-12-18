Return-Path: <Peter.Kolbus@garmin.com>
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
	(mail-bn8nam11on2135.outbound.protection.outlook.com
	[40.107.236.135])
	by mail.openembedded.org (Postfix) with ESMTP id 7103690DD5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 21:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
	b=RUxta50XnMMLf7ScKrXeWlyxFO1xKnoKCd1fX4n9JbXjnwDUj9JDVF7qSJZmDxDOBhq59nSJjEZw9fE7QSyqnld1LGFhfhNSfw1O8ERGlHUEw9/V0LjevuhAM4LJijQrL8Dt1WnApCMnf7zf84z5CtFgbmxfuRThYnMFzJIOHuJhrh3x6lAFDmiiMAAo/UFA/py0n5KpN6OQYKUZl3DI9uI3yB8oFkzkVfvS6xbyBWwg47J6i0BF+5USsp5z9brAjA3XoNXHMPWIklc1qtg9YfzbdbC78XeSUV3jW25DBOwUpbTHjgFPOg+IfX2OEuGR3w5Y8Avlg3NDTB1wcKlMhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
	s=arcselector9901;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dmojv1tz+Jo4hltg3a7DE5wOY/KMGRJ3sVRoRnNuYUg=;
	b=Fru3SXq29DZL8Suk/CIDFQ8MUojEce6BM5zcmsPsHGsxzGYrCpCaKL/yoVgzohYprA6JyDEX6rhYHeDkt+zsewoKTM+BRnmXynJX9j653jIYIuMAJ36My/NmHQFrcmsKk6Wb/gaRNYLL6FVI4NnYofbi75e9s7D4lyLCYOC0q/HfQCEWMPWoYeU5JaxLj3Fi6D7Y+Noq3vHeIpt6665eckUl9XDkZwKb4AyESni8Dn3oTTHpvVfd22q+BCmtMULUdK4bSFUUieDB47xdzmEhxmUfIc0+1yWISORVMoAoIkHb1t/JZiX0YjU7jYFvCAegLT0UMtIfkFqsV2CW0l0VWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
	204.77.163.244) smtp.rcpttodomain=gmail.com smtp.mailfrom=garmin.com;
	dmarc=pass (p=none sp=none pct=100) action=none header.from=garmin.com; 
	dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garmin.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=dmojv1tz+Jo4hltg3a7DE5wOY/KMGRJ3sVRoRnNuYUg=;
	b=FJSssxPyFqgA9vFMJP7HdXFW+AW+If7l9nt3XwGLrZiyb9OSwIV5y1FWoB75ET1vJzlaaVpYdLD53+SVJm8SZrDTjviwZ4RntxLv+bthLd1EEzXHVXbGf5Y/a7sUBPFJwYKlQeRupKKKjHLcaV+gmttEM7PnNeeg7os3QIUyFNU=
Received: from CO2PR04CA0179.namprd04.prod.outlook.com (2603:10b6:104:4::33)
	by DM5PR04MB1114.namprd04.prod.outlook.com (2603:10b6:3:9f::23) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2538.18;
	Wed, 18 Dec 2019 21:03:36 +0000
Received: from MW2NAM10FT020.eop-nam10.prod.protection.outlook.com
	(2a01:111:f400:7e89::203) by CO2PR04CA0179.outlook.office365.com
	(2603:10b6:104:4::33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2559.14 via
	Frontend Transport; Wed, 18 Dec 2019 21:03:36 +0000
Authentication-Results: spf=pass (sender IP is 204.77.163.244)
	smtp.mailfrom=garmin.com; gmail.com; dkim=none (message not signed)
	header.d=none; gmail.com; dmarc=pass action=none header.from=garmin.com;
Received-SPF: Pass (protection.outlook.com: domain of garmin.com designates
	204.77.163.244 as permitted sender) receiver=protection.outlook.com;
	client-ip=204.77.163.244; helo=edgetransport.garmin.com;
Received: from edgetransport.garmin.com (204.77.163.244) by
	MW2NAM10FT020.mail.protection.outlook.com (10.13.154.200) with
	Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.2559.14 via Frontend Transport; Wed, 18 Dec 2019 21:03:35 +0000
Received: from OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) by
	olawpa-edge3.garmin.com (10.60.4.226) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
	15.1.1466.3; Wed, 18 Dec 2019 15:03:33 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com (10.5.144.25) by
	OLAWPA-EXMB7.ad.garmin.com (10.5.144.21) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1779.2; Wed, 18 Dec 2019 15:03:28 -0600
Received: from OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c]) by
	OLAWPA-EXMB4.ad.garmin.com ([fe80::d9c:e89c:1ef1:23c%23]) with mapi id
	15.01.1779.002; Wed, 18 Dec 2019 15:03:28 -0600
From: "Kolbus, Peter" <Peter.Kolbus@garmin.com>
To: Khem Raj <raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-python][PATCH] python(3)-requests: add
	DEPENDS_class-native
Thread-Index: AQHVtd+lockCXb6k3k69Qy88kECguqfAw/aA//+chsA=
Date: Wed, 18 Dec 2019 21:03:28 +0000
Message-ID: <627bf93126fd4b758534d3721bd11108@garmin.com>
References: <20191218201337.78070-1-peter.kolbus@garmin.com>
	<796766f9-9aab-f5a0-e8e8-63de05996b27@gmail.com>
In-Reply-To: <796766f9-9aab-f5a0-e8e8-63de05996b27@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.50.4.6]
MIME-Version: 1.0
X-TM-AS-Product-Ver: SMEX-12.5.0.1300-8.5.1010-25112.003
X-TM-AS-Result: No-12.927700-8.000000-10
X-TMASE-MatchedRID: 8+bhjh9TQnE4HKI/yaqRm8zWN98iBBeG+W1UJfANmI6kruf3g9x6xT11
	qDA2H+XsPQSd1AHgE5mGZb2PgWYjg+aDYfgcUOT3aFAKyqG5M2L3N59hBwdmnyiCVsScJChxrk+
	qpsJ8hQ9MAraxXAQN9j1Z6/6pkvauPOMlWjW9f/j2b09s2KGDsH4yToAKzDgmbPfGfHxv+pFRu+
	WjaTTlAus1VUCnv7V7adKpcTtkaPANninsijZbDBIRh9wkXSlFCe1sPOFCidPWxom71UBDLcG18
	AJ4wbud4AXDvRTTvQJg62EFNWAoiCHhSBQfglfssR2Wsjq2lYHrixWWWJYrH0L9tcyTZdAsgxsf
	zkNRlfIYSQiB0ZTudfoLR4+zsDTtEPs/OvZqkzPS3Rxy14J4NzI3GEXl1WHHrxRBxRyp7TxJw0Z
	Xr7fvPSZEfJhf9CJp66XHIc5w+gc=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--12.927700-8.000000
X-TMASE-Version: SMEX-12.5.0.1300-8.5.1010-25112.003
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:204.77.163.244; IPV:CAL; SCL:-1; CTRY:US;
	EFV:NLI; SFV:NSPM;
	SFS:(10019020)(396003)(376002)(346002)(136003)(39860400002)(13464003)(43544003)(199004)(189003)(110136005)(246002)(5660300002)(426003)(478600001)(8676002)(7696005)(2616005)(26005)(36756003)(7636002)(108616005)(24736004)(8936002)(186003)(2906002)(86362001)(26826003)(70206006)(70586007)(53546011)(336012)(76130400001)(356004)(316002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:DM5PR04MB1114;
	H:edgetransport.garmin.com; FPR:; SPF:Pass; LANG:en;
	PTR:extedge.garmin.com; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c9fd994f-8d9c-4675-6bf8-08d783fdbf51
X-MS-TrafficTypeDiagnostic: DM5PR04MB1114:
X-Microsoft-Antispam-PRVS: <DM5PR04MB1114BCD29A50B62DD1E500B1FF530@DM5PR04MB1114.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-Forefront-PRVS: 0255DF69B9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xOxMRHDYMdS6mV1t1b6cWktFGXBuFknQoBz7XFi+1uzzrKpCIDp8xldKoWekKtNqg1r9wgSBzJ4AMmYPWqXoWVhhuWpvZucBpjSvxbkxhR7Cabv48kc7D61i9GGy0c/EdbzeC3MNu6eQgP1FZANqkpthpcFwgnVX2sOzCXMxl/ePxfMX38215O/v/Y1DGf75ZAZBUQQPCEwihFGLrlJIyMIYA2Uc0EiM+5fSQotm1glAlC8jQNlLeZ6tpfm/lkEt6DprHeEWXHflPvotxnf0q8k3vQfvVN8+jV6sW0snWtRc8P/vAlrw3w+F0Jp7wArleLYkKo0HpzI9KC0d5H/49vB6matq+lqNcHVkXYuTvWLBObH+MBTrA+Fvm/kEYx5hp7DFqKvscFrmAJDBTspt0lKxDtBWlrYUla/6+h/kszka2OJCGhy7Rb8bEjIu7jzXDvQPg4fs5SYzNMgYvNm0SenQMakhA1rgBOP4TNvnCy/7QaQ1+JQNqJkQnk/mCDdxvJ76s2XvZ2FbA8TKD/6/7g==
X-OriginatorOrg: garmin.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2019 21:03:35.4602 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fd994f-8d9c-4675-6bf8-08d783fdbf51
X-MS-Exchange-CrossTenant-Id: 38d0d425-ba52-4c0a-a03e-2a65c8e82e2d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38d0d425-ba52-4c0a-a03e-2a65c8e82e2d;
	Ip=[204.77.163.244]; Helo=[edgetransport.garmin.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR04MB1114
Subject: Re: [meta-python][PATCH] python(3)-requests: add DEPENDS_class-native
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
X-List-Received-Date: Wed, 18 Dec 2019 21:03:38 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS2hlbSBSYWogPHJhai5r
aGVtQGdtYWlsLmNvbT4NCj4gU2VudDogV2VkbmVzZGF5LCBEZWNlbWJlciAxOCwgMjAxOSAyOjU2
IFBNDQo+IFRvOiBLb2xidXMsIFBldGVyIDxQZXRlci5Lb2xidXNAZ2FybWluLmNvbT47IG9wZW5l
bWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTog
W29lXSBbbWV0YS1weXRob25dW1BBVENIXSBweXRob24oMyktcmVxdWVzdHM6IGFkZA0KPiBERVBF
TkRTX2NsYXNzLW5hdGl2ZQ0KPiANCj4gQ0FVVElPTiAtIEVYVEVSTkFMIEVNQUlMOiBEbyBub3Qg
Y2xpY2sgYW55IGxpbmtzIG9yIG9wZW4gYW55IGF0dGFjaG1lbnRzDQo+IHVubGVzcyB5b3UgdHJ1
c3QgdGhlIHNlbmRlciBhbmQga25vdyB0aGUgY29udGVudCBpcyBzYWZlLg0KPiANCj4gDQo+IEhp
IFBldGVyDQo+IA0KPiBPbiAxMi8xOC8xOSAxMjoxMyBQTSwgUGV0ZXIgS29sYnVzIHdyb3RlOg0K
PiA+IENoYW5nZS1JZDogSWU4YmQ4MGQ1NmRhNTk5YjI5NDMwZGE2NWIzMDNkNjliYmE0M2ZkZGEN
Cj4gDQo+IElzIHRoaXMgZ2Vycml0IHRhZyB1c2VmdWwgZm9yIHlvdSBvbmNlIHVwc3RyZWFtZWQg
PyBJIGFzayBiZWNhdXNlIGluIGdlbmVyYWwgdGhpcw0KPiB3aWxsIGJlIHJlZHVuZGFudCBpbmZv
cm1hdGlvbiB0aGF0IEkgd291bGQgcHJlZmVyIHRvIG5vdCBoYXZlIGluIGxvZ3MuDQo+IA0KDQpU
aGlzIHRhZyBpc24ndCBuZWVkZWQ7IHlvdSdyZSB3ZWxjb21lIHRvIHJlbW92ZSBmcm9tIHRoaXMg
YW5kIHRoZSBvdGhlciBwYXRjaGVzIEkgc2VudCAob3IsIGxldCBtZSBrbm93IGlmIEkgbmVlZCB0
byBzdWJtaXQgdjIgcGF0Y2hlcykuIEknbGwgdGFrZSBjYXJlIHRoYXQgaXQncyBub3QgcHJlc2Vu
dCBpbiBmdXR1cmUgcGF0Y2hlcy4NCiANCg0KPiA+IC0tLQ0KPiA+ICAgLi4uL3JlY2lwZXMtZGV2
dG9vbHMvcHl0aG9uL3B5dGhvbi1yZXF1ZXN0cy5pbmMgICAgICAgIHwgMTAgKysrKysrKysrKw0K
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1n
aXQgYS9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVxdWVzdHMu
aW5jDQo+ID4gYi9tZXRhLXB5dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24tcmVx
dWVzdHMuaW5jDQo+ID4gaW5kZXggNWZlNWRjMjFmLi5lYTI5ODM4MjEgMTAwNjQ0DQo+ID4gLS0t
IGEvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uLXJlcXVlc3RzLmlu
Yw0KPiA+ICsrKyBiL21ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbi1y
ZXF1ZXN0cy5pbmMNCj4gPiBAQCAtMjMsNiArMjMsMTYgQEAgUkRFUEVORFNfJHtQTn0gKz0gIiBc
DQo+ID4gICAgICAgJHtQWVRIT05fUE59LWlkbmEgXA0KPiA+ICAgIg0KPiA+DQo+ID4gK0RFUEVO
RFNfY2xhc3MtbmF0aXZlICs9ICIgXA0KPiA+ICsgICAgJHtQWVRIT05fUE59LW5kZy1odHRwc2Ns
aWVudC1uYXRpdmUgXA0KPiA+ICsgICAgJHtQWVRIT05fUE59LXB5YXNuMS1uYXRpdmUgXA0KPiA+
ICsgICAgJHtQWVRIT05fUE59LXB5b3BlbnNzbC1uYXRpdmUgXA0KPiA+ICsgICAgJHtQWVRIT05f
UE59LXB5c29ja3MtbmF0aXZlIFwNCj4gPiArICAgICR7UFlUSE9OX1BOfS11cmxsaWIzLW5hdGl2
ZSBcDQo+ID4gKyAgICAke1BZVEhPTl9QTn0tY2hhcmRldC1uYXRpdmUgXA0KPiA+ICsgICAgJHtQ
WVRIT05fUE59LWlkbmEtbmF0aXZlIFwNCj4gPiArIg0KPiA+ICsNCj4gPiAgIENWRV9QUk9EVUNU
ID0gInJlcXVlc3RzIg0KPiA+DQo+ID4gICBCQkNMQVNTRVhURU5EID0gIm5hdGl2ZSBuYXRpdmVz
ZGsiDQo+ID4NCg0K

