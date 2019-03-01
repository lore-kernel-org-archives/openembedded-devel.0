Return-Path: <prvs=95684d004=Alistair.Francis@wdc.com>
Received: from esa3.hgst.iphmx.com (esa3.hgst.iphmx.com [216.71.153.141])
	by mail.openembedded.org (Postfix) with ESMTP id 848637CDCD
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  1 Mar 2019 20:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
	t=1551473459; x=1583009459;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=egCo2Dp5fIakVa+Y8lZuo/Md9Jro/aXq69CKkhNu5BQ=;
	b=dfhGrRXHY6MSnrNgRloOaQ0YIcWl1ChnvdsXoMdjnZIMDPXT/4lSnsnt
	eYzvbmwzYxGAmltV1CnzkvvBGrPe78KcsS2gM/OK9v0YIkSmSv7V18Vfe
	iuxmETKhPVSPZ0S1VI1OhUt2FHDsTqDkcQ1VmyGjM/o1wr9n7aU4zc8bq
	SUDaFvd6/fEUPuI4MeHA4ZCXufe+ZFPtSM+M43CsDMIWvWUnFwNWrSSSm
	bVJWbYzvpueEg/Q1fV5M/xw9926qNb/bsF7yMMRkBHSfa4Yb8fj9mKOqV
	P3+Ir2XOnyXHFoCaElw3KqDYKRc3f6CQ2ESpO1m7FXzFZNzc5v+9Ecuid w==;
X-IronPort-AV: E=Sophos;i="5.58,429,1544457600"; d="scan'208";a="107499826"
Received: from mail-dm3nam03lp2052.outbound.protection.outlook.com (HELO
	NAM03-DM3-obe.outbound.protection.outlook.com) ([104.47.41.52])
	by ob1.hgst.iphmx.com with ESMTP; 02 Mar 2019 04:43:53 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=sharedspace.onmicrosoft.com; s=selector1-wdc-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=egCo2Dp5fIakVa+Y8lZuo/Md9Jro/aXq69CKkhNu5BQ=;
	b=WWSU4zHlEq0jC6VflNRJUnXbDjU0jN+nR1QYZSLG70HPEg6U/85vIwoUC+LFaJFt1/N1GiUUaUy1IcY989czgNvV38Bq9cXUuneZ3luyy80m3lUMfSvHUYcFoHb0g/hhkjjY2eLin/vLnfP6/6WW3kW2R5GFTzg7NqWP2EYWYnI=
Received: from MWHPR04MB0401.namprd04.prod.outlook.com (10.173.48.18) by
	MWHPR04MB1022.namprd04.prod.outlook.com (10.174.250.17) with Microsoft
	SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1665.16; Fri, 1 Mar 2019 20:43:51 +0000
Received: from MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c]) by
	MWHPR04MB0401.namprd04.prod.outlook.com
	([fe80::f55c:272b:6401:1b8c%10]) with mapi id 15.20.1643.022;
	Fri, 1 Mar 2019 20:43:51 +0000
From: Alistair Francis <Alistair.Francis@wdc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [PATCH v2 2/2] mimic: Initial commit of version 1.2.0.2
Thread-Index: AQHU0G96Ey7aI6ydEkC9kBQ06UwfUA==
Date: Fri, 1 Mar 2019 20:43:51 +0000
Message-ID: <20190301204310.8500-2-alistair.francis@wdc.com>
References: <20190301204310.8500-1-alistair.francis@wdc.com>
In-Reply-To: <20190301204310.8500-1-alistair.francis@wdc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: git-send-email 2.20.1
x-clientproxiedby: BYAPR02CA0011.namprd02.prod.outlook.com
	(2603:10b6:a02:ee::24) To MWHPR04MB0401.namprd04.prod.outlook.com
	(2603:10b6:300:70::18)
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=Alistair.Francis@wdc.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [199.255.45.64]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ecf999c4-17ea-4b1b-5e74-08d69e869c95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);
	SRVR:MWHPR04MB1022; 
x-ms-traffictypediagnostic: MWHPR04MB1022:
x-ms-exchange-purlcount: 1
wdcipoutbound: EOP-TRUE
x-microsoft-exchange-diagnostics: =?utf-8?B?MTtNV0hQUjA0TUIxMDIyOzIzOlYvVTNHOFFJSitjNTZNa0psVFlVZmhvR1Az?=
	=?utf-8?B?WHJzTWZ4bFp3bEY1aXY5Tk5FV1JIczRLeE1QTUJnbEhHQzJYNEVneVFCVXdv?=
	=?utf-8?B?UmdGSVpUWUEzMy9XeTVUaUVTZWk1UE81eW4rQm1reWpGQ3RrNHZDZnNmTXI5?=
	=?utf-8?B?SVZuWUpoWDhGa2pKbXdGbWVNcVdEU1pLT1N0bVk1UHhsaGJ4NnR4amNSSm85?=
	=?utf-8?B?VmkxWGt0TTJ1NmFoMllzUnZmZUFKcUlHYzV0SDhmZCtaeDJhQWhPVGhab0pG?=
	=?utf-8?B?d3FtOUoyUDY1NUpnREhQc3RXU0JNZEZKQlRIb29uU3NVRXgvTTJrSVZRYmdv?=
	=?utf-8?B?ci9ZQlVqM2VhU1FlcGplN2N0MXpvQmJubGpsQVFId0k3dXloYkdUaU9GZTl6?=
	=?utf-8?B?NkJTU0MySWhiZzNOK3h6UzFaVnhYSXg1RmFNUytWQk1la0M4dGk1bUkrWXFx?=
	=?utf-8?B?aE54MTZrbm1SNnMreHk0ME41VzBucXUyUVlTTmkydk1Yakw2eUlGNEpmUVp2?=
	=?utf-8?B?cjZnV0sra1pKRFZJZmpDaDZoaGhCaXJHdTE5aEdOQzRIVmF2TGRBSDdMaHZj?=
	=?utf-8?B?bVkrb1ZVc2IrNXZhUkI1WW1QWjZaNVJyN3l5NEJXaG43bkp1MmVkTEpDOTNF?=
	=?utf-8?B?cHRHT0ZEdm83UENzT1VpTWQ4Qi93ZThUdFQveVE2QzdtY0tUL3N2ZzMzUU9O?=
	=?utf-8?B?cTVKaCtyUUhYc2p3b1pTcGJGUVBNMzZXN1pOdHNwVHo1Mmd6TlZ3NjZYYUwx?=
	=?utf-8?B?YzVnaVAxL3BYZFU3d1EzMGRwdUsweWRGVnR3OGdwRnVnZDZsL0JZMmEyQmx0?=
	=?utf-8?B?alFKTG1aempyTVdlei9WQndVMlRPNTI3cnp2bU1ZK2FJS3FOempwRGx5WkU5?=
	=?utf-8?B?R254NWRydWRNOFBuSU5ybU0rM0V3b3RlaXpXR1k2VFhLbE0zeDUwMnkrS01p?=
	=?utf-8?B?dFdMNml5NkdMeE1TeFNiTmxieUdlZXJKNnVkWENGUGc3VjhZVzNXZGx1dXVh?=
	=?utf-8?B?VVkrdFhWNWJ0ZzlMQkcrcWlsZjh2WjJ3bDlMVUxnZ2pwU2RoQTh3OFBIUUVS?=
	=?utf-8?B?bHYrbDNOcUVONlB4cXRrTjUzN3NnM2ZkNldFeHdYRjlpRmNTSTM0b2F5WEtq?=
	=?utf-8?B?bXVFUHFoSGFwQ2VoOHpKaTU0VUpLVjFOblN1K1pVampEM3JRODhxcWorZmhz?=
	=?utf-8?B?M2E1bVVCa200Qk5pS2h2YWVtQmVYSVZtL0VhVDJCY3pmbzF4Smk1ekwzazNj?=
	=?utf-8?B?cXlzMjR4VEo4Wjk0S1pVNmZuU2tFd3A4MHBsWTdsS0lRZ1pRMEw2MnkzZi8y?=
	=?utf-8?B?dWpxMUdsc21SUWsrVDRMOG1nWCtnbVhOQmNhZWFyUGZuWWZzU3IxT2dlMTBD?=
	=?utf-8?B?cmtFZzdNNHl2azQrNS9lT3I5dnB4MVRhNlJTd2MyT3VsZWtKVHVYV1pjMDly?=
	=?utf-8?B?OUxia3FDZGcxNDR2eWhIYTFpa3pKOWJ0ME0rR0pWSVhRV2ZCdmFnRDJzK1gx?=
	=?utf-8?B?OHBFdVpINGxiaWZRanRWNmZwMWY1N3BxdHJEUzNqNjQ1LzBxelR1R094Vlpv?=
	=?utf-8?B?bDE2VlRSMW5lOFJVYlFmOVE0ZWRHQnpJQmtjWFIxWVVDOWFBR1NkR0FJcUQy?=
	=?utf-8?B?UmZ6SWxvSVIvdnlpWkhLWTlhTnFyMHRVbnIyNG5BU0FwK2NlQitzYUtsRWhQ?=
	=?utf-8?B?RXdnNEpSL3dBUndSSHZHS1hTYzlhYkFDbmtFSFdHRGZaSG93Znp2aGZyaWlT?=
	=?utf-8?B?SUVFQTI3dk8weGxtRUdmQXJMZktwU0I4M29Makp4SDVYMzdwRXY0Yko1aVBE?=
	=?utf-8?B?Q0orTTVaMzdpSWw2dTUzWkwyaldsZVJVVi9maUxWU0tFbmc9PQ==?=
x-microsoft-antispam-prvs: <MWHPR04MB1022FA9753864E2AB5E7B22090760@MWHPR04MB1022.namprd04.prod.outlook.com>
x-forefront-prvs: 09634B1196
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10019020)(376002)(346002)(366004)(396003)(136003)(39860400002)(199004)(189003)(24433001)(53936002)(5660300002)(36756003)(6506007)(1076003)(66066001)(2501003)(6512007)(5640700003)(102836004)(486006)(86362001)(2906002)(476003)(6306002)(316002)(386003)(44832011)(2616005)(25786009)(71190400001)(71200400001)(76176011)(6916009)(97736004)(446003)(8676002)(68736007)(72206003)(81156014)(4326008)(14454004)(50226002)(54906003)(52116002)(11346002)(478600001)(256004)(6436002)(26005)(99286004)(8936002)(105586002)(2351001)(186003)(305945005)(6486002)(7736002)(106356001)(81166006)(3846002)(6116002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:MWHPR04MB1022;
	H:MWHPR04MB0401.namprd04.prod.outlook.com; FPR:; SPF:None;
	LANG:en; PTR:InfoNoRecords; A:1; MX:1; 
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: pcyeCKf6sO1wiE0QwS6MlHv5yDlFdshOAHSFSEG4hWzhBmKmguSbvK/dTN691vl7Vo82BoJbNTpBcrzWpzO4KPoeWPps+9ClgoFfBB53bAsgiP0oHZjJvivfy/w63FL0QdKbPql5q5DaiIqdune5sPvisoHoR4AoniV3vldHI/8pqHYGfEPy4jc64hxC5nnekxu/X4uVG307OQpZBz58dm7Tqa2hFiqSaeDjNRKY/uyUNfXvBgOouWSu7y04SABDt4ZJfphHc2gvZI8gdfR0VwscY5FWveLZW9pxvLur/7xd3kAPL/fZiT4b3Rsyns7CCEWoqHYQlNlxd8fzEr3k10aOovWg6Po0D1rGU5K2S4Mh0woUWJOBGP2DbI0vzz9cVwZIokyYtbbvLBiENOItdaRQjyrEFno9gN+r3ZlJ/qI=
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf999c4-17ea-4b1b-5e74-08d69e869c95
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Mar 2019 20:43:50.6402 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR04MB1022
Subject: [PATCH v2 2/2] mimic: Initial commit of version 1.2.0.2
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
X-List-Received-Date: Fri, 01 Mar 2019 20:50:57 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-ID: <1C61CFC84E3DF14294BB51DAE1565580@namprd04.prod.outlook.com>
Content-Transfer-Encoding: base64

U2lnbmVkLW9mZi1ieTogQWxpc3RhaXIgRnJhbmNpcyA8YWxpc3RhaXIuZnJhbmNpc0B3ZGMuY29t
Pg0KLS0tDQogLi4uL3JlY2lwZXMtbXVsdGltZWRpYS9taW1pYy9taW1pY18xLjIuMC4yLmJiIHwg
MjcgKysrKysrKysrKysrKysrKysrKw0KIDEgZmlsZSBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCsp
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IG1ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEv
bWltaWMvbWltaWNfMS4yLjAuMi5iYg0KDQpkaWZmIC0tZ2l0IGEvbWV0YS1tdWx0aW1lZGlhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9taW1pYy9taW1pY18xLjIuMC4yLmJiIGIvbWV0YS1tdWx0aW1lZGlh
L3JlY2lwZXMtbXVsdGltZWRpYS9taW1pYy9taW1pY18xLjIuMC4yLmJiDQpuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KaW5kZXggMDAwMDAwMDAwLi5jYjRiMWIzNjUNCi0tLSAvZGV2L251bGwNCisrKyBi
L21ldGEtbXVsdGltZWRpYS9yZWNpcGVzLW11bHRpbWVkaWEvbWltaWMvbWltaWNfMS4yLjAuMi5i
Yg0KQEAgLTAsMCArMSwyNyBAQA0KK1NVTU1BUlkgPSAiQSBmYXN0IGxpZ2h0d2VpZ2h0IFRleHQt
dG8tc3BlZWNoIGVuZ2luZSINCitERVNDUklQVElPTiA9ICJNaW1pYyBpcyBhIGZhc3QsIGxpZ2h0
d2VpZ2h0IFRleHQtdG8tc3BlZWNoIGVuZ2luZSBkZXZlbG9wZWQgYnkgTXljcm9mdCBBLkkuIGFu
ZCBWb2NhbGlELCBiYXNlZCBvbiBDYXJuZWdpZSBNZWxsb24gVW5pdmVyc2l0eeKAmXMgRmxpdGUg
KEZlc3RpdmFsLUxpdGUpIHNvZnR3YXJlLiBNaW1pYyB0YWtlcyBpbiB0ZXh0IGFuZCByZWFkcyBp
dCBvdXQgbG91ZCB0byBjcmVhdGUgYSBoaWdoIHF1YWxpdHkgdm9pY2UuIg0KK0hPTUVQQUdFID0g
Imh0dHBzOi8vbWltaWMubXljcm9mdC5haS8iDQorU0VDVElPTiA9ICJtdWx0aW1lZGlhIg0KKw0K
KyMgIk1pbWljIGlzIGF2YWlsYWJsZSB1bmRlciBwZXJtaXNzaXZlIEJTRC1saWtlIGxpY2Vuc2Vz
Ig0KK0xJQ0VOU0UgPSAiTUlULVggJiBcDQorICAgICAgICAgICBQRCAmIFwNCisgICAgICAgICAg
IENNVS1UZXggJiBcDQorICAgICAgICAgICBCU0QgJiBcDQorICAgICAgICAgICBCU0QtMi1DbGF1
c2UgJiBcDQorICAgICAgICAgICBCU0QtMy1DbGF1c2UgJiBcDQorICAgICAgICAgICBmbGl0ZSAm
IFwNCisgICAgICAgICAgIChmbGl0ZSAmIFN1bikgJiBcDQorICAgICAgICAgICBCZWxsQmlyZCAm
IFwNCisgICAgICAgICAgIEFwYWNoZS0yLjAgXA0KKyAgICAgICAgICAgIg0KK0xJQ19GSUxFU19D
SEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTQxNmVmMWNhNTE2NzcwN2ZlMzgxZDdiZTMzNjY0
YTMzIg0KKw0KK0RFUEVORFMgPSAiY3VybC1uYXRpdmUgaWN1Ig0KKw0KK1NSQ1JFViA9ICI2N2U0
M2JmMGZhNTYwMDgyNzZiODc4ZWMzNzkwYWE1ZjMyZWIyYTE2Ig0KK1NSQ19VUkkgPSAiZ2l0Oi8v
Z2l0aHViLmNvbS9NeWNyb2Z0QUkvbWltaWMuZ2l0Ig0KKw0KK2luaGVyaXQgYXV0b3Rvb2xzDQor
DQorUyA9ICIke1dPUktESVJ9L2dpdCINCi0tIA0KMi4yMC4xDQoNCg==

