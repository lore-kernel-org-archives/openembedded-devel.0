Return-Path: <MANJUKUM@xilinx.com>
X-Greylist: delayed 48928 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 09 Aug 2018 15:29:53 UTC
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
	(mail-sn1nam01on0040.outbound.protection.outlook.com [104.47.32.40])
	by mail.openembedded.org (Postfix) with ESMTP id 236D16093A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Aug 2018 15:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=2ViJ/2SC6yU2EYV3LEWKCpMKa87OFwtCBWERcyAEb4s=;
	b=gB42tjdR7QcZjRZHYw6cwmA/mJNn8kRU+MZzGPQg+HHmh4+P8AvPU5804A0qM8JX974kvKSjU20RRjS639d0ZSvb8YR5101YPUrxYC3ilE4eZ+UTcFJcYTkW5+sGWHd8tleejVTqsD6fOiL+yN+9JwKj8Gl7VP0P3kIlX82eo/Q=
Received: from BYAPR02MB4583.namprd02.prod.outlook.com (52.135.239.210) by
	BYAPR02MB4565.namprd02.prod.outlook.com (52.135.239.204) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1017.15; Thu, 9 Aug 2018 14:55:40 +0000
Received: from BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::8524:66ba:f3be:bce6]) by
	BYAPR02MB4583.namprd02.prod.outlook.com
	([fe80::8524:66ba:f3be:bce6%3]) with mapi id 15.20.1038.023;
	Thu, 9 Aug 2018 14:55:40 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: akuster808 <akuster808@gmail.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [PATCH] wireshark_2.6.1.bb: Fix the configure error on git
	describe
Thread-Index: AQHUL+t7gplyp/fnkkOmtZtVaVJCLqS3ghQQ
Date: Thu, 9 Aug 2018 14:55:40 +0000
Message-ID: <BYAPR02MB458332A5F9D09A529BBB5342B9250@BYAPR02MB4583.namprd02.prod.outlook.com>
References: <1533778721-28693-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<4b304730-403e-daec-ca87-b7a4423a31dc@gmail.com>
In-Reply-To: <4b304730-403e-daec-ca87-b7a4423a31dc@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [73.231.161.32]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BYAPR02MB4565;
	6:tih+fdA0c/VPjv2D+9//NRrmRK11yOwcE22eTurKZmKYWONWjP09czH9gWO3GM0skWoedYUEiiM5JjhKP6kCwmNxYqMLAMv4rZyLztINseqM9qJDq7QmNjkZpHc/U41q9jl2qmMHf12PKsIWuHWW/6DQsew7RtBP0oUAMC6bmvMycLka1B0A4g1ilGxQZuCDLLfXmH1PAv6ntes8gapHKdyvLRW7KRq8QBDIqn66x6YWUt00WWeKwZBjoJ59j8N9qtSS5KWLOcMCf7VKJciCLo7K5eTKe+zvXVPvc5+DjWKDJtvg0kwdN7lUYbfskl+NVsDo3CNVYGvQ4b/txXnSV5l2sy87TgHAF8PLpWGKiB/JD2al7TgzbfyLjGooQ+hu+dIAUnsxkW8G7IjTLRkVhg0nxpISYaKcj55h2L4w+IdDMpKxZDyPOqEJOCoGbkaYzHUYG9McRzWsDdiQpAe1Eg==;
	5:OeCBhVmWA2sDvXABLtAkF8BiZaByCgr/TK+Kmn67/uX3z+HkZvM5jTfGcZusylKCMrQES/H+ID4VMizCgl1cjHIFV0LR3VF2550pp+jPIzL3wNSlI8LDxHDAleVglzHh1291DIsCQ++DDm/o7+xZ+Yt3rrtQvqTZtVm+9hjqu14=;
	7:PSxIEC4Ct3KDOsIwQhxqboT+JEKlHFi1WwN8ywJmoaMD4WiLgpO53srEICNQxiNa6tK3/EZM1DahFku/N7HffYWdqeT4u4B9NqdVSihCT0HBmnZ8vjXluUiYLgKxEJkbboUGsPgowG4myrs4UpGklQur7qOj7RyxPq1stohOg8ECkTOp9FjEb9/c4SML0wgOlVEsVoewxU2ThRup6RTrrcUCx2xMEhNxvIrkweLNGD6TR//NudMyhbY6y/NFfIaX
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 36cf55c8-f646-47f0-b151-08d5fe082c93
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(7020095)(4652040)(8989117)(4534165)(4627221)(201703031133081)(201702281549075)(8990107)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:BYAPR02MB4565; 
x-ms-traffictypediagnostic: BYAPR02MB4565:
x-microsoft-antispam-prvs: <BYAPR02MB4565C77B7306449B77530ADAB9250@BYAPR02MB4565.namprd02.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:(85827821059158)(264703809997249)(192813158149592); 
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(8211001083)(6040522)(2401047)(5005006)(8121501046)(10201501046)(3231311)(944501410)(52105095)(93006095)(93001095)(3002001)(6055026)(149027)(150027)(6041310)(20161123560045)(20161123562045)(20161123564045)(20161123558120)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(6072148)(201708071742011)(7699016);
	SRVR:BYAPR02MB4565; BCL:0; PCL:0; RULEID:; SRVR:BYAPR02MB4565; 
x-forefront-prvs: 0759F7A50A
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(136003)(346002)(39860400002)(376002)(396003)(366004)(189003)(199004)(13464003)(33656002)(476003)(6436002)(5660300001)(8936002)(102836004)(97736004)(14454004)(256004)(478600001)(53546011)(316002)(2900100001)(81166006)(81156014)(39060400002)(55016002)(486006)(9686003)(186003)(105586002)(76176011)(305945005)(11346002)(2501003)(99286004)(74316002)(7736002)(25786009)(110136005)(26005)(3846002)(5250100002)(6116002)(2906002)(6506007)(86362001)(7696005)(72206003)(229853002)(14444005)(68736007)(66066001)(8676002)(106356001)(6246003)(53936002)(446003);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR02MB4565;
	H:BYAPR02MB4583.namprd02.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
x-microsoft-antispam-message-info: hqPVrmP0j0Rw9BQA+y6RTpcOn1MF7VNBC5gC3Ja/UDcncDoxIqzmsrrQai0TS4CYkfM8V8YZ/HAoLaEumluw3GUPLKCQMG1XLlBAU8Qd3R3QpEDmBc1b3912ytgdu9MjQ/SsoBlnAVYdBHT5stFxXDfERocT/IXG0F29jP2b3koQQp10QfXkz8YJDmWM5U+0WOWr3JIAmkoq/5H7Hj74PQou+ZYDTMbWMdapHD+Lk28Fi2srBqimwd0XvsbJZ48T7TzPCTMMFVmNhp6rvd0DjinCNWDCFTNr7/Mf+9ua43cnwdviycaeBumVMwtP4nqrxzEpw9riohqjkNaLdVYOIUWfW1DXZeKxsvRE/OjFmtE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36cf55c8-f646-47f0-b151-08d5fe082c93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Aug 2018 14:55:40.2602 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB4565
Subject: Re: [PATCH] wireshark_2.6.1.bb: Fix the configure error on git describe
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
X-List-Received-Date: Thu, 09 Aug 2018 15:29:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQXJtaW4sDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYWt1c3Rl
cjgwOCBbbWFpbHRvOmFrdXN0ZXI4MDhAZ21haWwuY29tXQ0KPiBTZW50OiBUaHVyc2RheSwgQXVn
dXN0IDA5LCAyMDE4IDc6MTYgQU0NCj4gVG86IE1hbmp1a3VtYXIgSGFydGhpa290ZSBNYXRoYSA8
TUFOSlVLVU1AeGlsaW54LmNvbT47IG9wZW5lbWJlZGRlZC0NCj4gZGV2ZWxAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiBTdWJqZWN0OiBSZTogW29lXSBbUEFUQ0hdIHdpcmVzaGFya18yLjYuMS5i
YjogRml4IHRoZSBjb25maWd1cmUgZXJyb3Igb24gZ2l0DQo+IGRlc2NyaWJlDQo+IA0KPiBNYW5q
dWt1bWFyLA0KPiANCj4gDQo+IE9uIDA4LzA4LzIwMTggMDY6MzggUE0sIE1hbmp1a3VtYXIgTWF0
aGEgd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBmaXhlcyB0aGUgZm9sbG93aW5nIGVycm9yIGR1cmlu
ZyBkb19jb25maWd1cmUgdGFzaw0KPiA+DQo+ID4gfCBmYXRhbDogTm8gbmFtZXMgZm91bmQsIGNh
bm5vdCBkZXNjcmliZSBhbnl0aGluZy4NCj4gPiB8IENNYWtlIEVycm9yIGF0IENNYWtlTGlzdHMu
dHh0OjMwODYgKHN0cmluZyk6DQo+ID4gfCAgIHN0cmluZyBiZWdpbiBpbmRleDogMSBpcyBvdXQg
b2YgcmFuZ2UgMCAtIDANCj4gPiB8DQo+ID4NCj4gPiBVc2luZyAtLWFsd2F5cyBpcyBhIGZhbGxi
YWNrIGZvciBmZXRjaGluZyB1bmlxdWVseSBhYmJyZXZpYXRlZCBjb21taXQNCj4gPiBvYmplY3QN
Cj4gDQo+IFRoZXJlIGlzIGFuIHVwZ3JhZGUgdG8gMi42LjIgc2l0dGluZyBpbiBtYXN0ZXItbmV4
dC4gSGF2ZSB5b3UgY2hlY2tlZCB0aGF0DQo+IHZlcnNpb24/DQo+IA0KDQpXaWxsIHRyeSBpdCBv
dXQgbm93IGFuZCBrZWVwIHlvdSBwb3N0ZWQNCg0KVGhhbmtzLA0KTWFuanUNCg0KPC4uLj4NCg0K

