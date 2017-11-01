Return-Path: <MANJUKUM@xilinx.com>
Received: from NAM01-BN3-obe.outbound.protection.outlook.com
	(mail-bn3nam01on0061.outbound.protection.outlook.com [104.47.33.61])
	by mail.openembedded.org (Postfix) with ESMTP id D7FCE71E4B
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Nov 2017 22:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xilinx.onmicrosoft.com; s=selector1-xilinx-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=2JoP9U+7CgTw0Vix1ALVebBmuFE5di8N33XI56pByEE=;
	b=zVzWaIKqv+BzjrLuHJ15oZmo+bSBit+fpCLkg16bim35aSJv4snCl2zaYXeAh3K/T4Qdu0wnXALhYBG713UKUmeaoGW1nCYng4t6Z5oiinY4RrXd8pKsmIR1yhSTktJWZ32arVlybkjJkLFUonGZVp1BrKcD1VmYmPCkUNk1o0Q=
Received: from BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) by
	BL2PR02MB2163.namprd02.prod.outlook.com (10.167.97.25) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id
	15.20.178.6; Wed, 1 Nov 2017 22:04:36 +0000
Received: from BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6]) by BL2PR02MB2163.namprd02.prod.outlook.com
	([fe80::a426:106c:5e1:52a6%13]) with mapi id 15.20.0178.014;
	Wed, 1 Nov 2017 22:04:36 +0000
From: Manjukumar Harthikote Matha <MANJUKUM@xilinx.com>
To: Martin Jansa <martin.jansa@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH v2] whetstone_1.2.bb: Add whetstone
	benchmark
Thread-Index: AQHTTcTnSWgf4HU48Um4S+4IlIkgC6MAHvpw
Date: Wed, 1 Nov 2017 22:04:35 +0000
Message-ID: <BL2PR02MB216333B40F256CAAE56FFCDAB95F0@BL2PR02MB2163.namprd02.prod.outlook.com>
References: <1508957346-6324-1-git-send-email-manjukumar.harthikote-matha@xilinx.com>
	<CA+chaQcB-cw8tRBPoVoGq0Dn54Czh7RMuHpSFRcHq=VgMWt08g@mail.gmail.com>
In-Reply-To: <CA+chaQcB-cw8tRBPoVoGq0Dn54Czh7RMuHpSFRcHq=VgMWt08g@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=MANJUKUM@xilinx.com; 
x-originating-ip: [149.199.62.254]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; BL2PR02MB2163;
	6:J+mtkH6AHazo8e1RkFTDoLIyU60M6GTlYtJ9xqOzF15ELE6UfiwOEv3VcpfCJykPeGFSv3xKpaLxin8zaI+CmPEAwx7rT/c4meEhqwEdOj27oGNlfLguxdkJwpCL4hQ/JSdleib5ZRX+teJD7aysx8lkZqPU5O6OkCUgC4wCdzbdyUf1XBbjrU7xIwwTWkmOLuA5xG4CeOHgQ2Q/iqWOdUfgxivWyeqU1TXVncO4shUP6ku4EZYKon5+NKb3wnqaa0HWiHzbp/wshgOLmYsAMFtlheHKCOePRXdOIMDp+dPeTBYz7vO+8V0cJYKa7kxCzoX8ugX2gjLujqSAmG0iOuTk1RhERa1G+c3FHBYI3Pg=;
	5:Etqk3Si0XlmO5PDMMqxyg8PVZPZf/wsHSiFMRYSWOC4LcuHww0pdxCewEJCa9KLGBSDO4cEm/vFl4Uj94CLg2UrRd4icWsh8v/p+UNiQ/CWj8z4PG0WIyD61CsoMIMLjlpW7g4NTmk1bYaOnCVs6+gJyD1VJE0R93fgS5fV7ZKE=;
	24:CJcmOfD4gSQ9DbxlrZZvy0nEe5hEzCtFy9kREuWQ8MaFU5ObFL6CWvD2PcfwKDNNXWSBirfrUrcQEjYnjPLBgzRCZbW21POE8xoD5AObcGw=;
	7:GqARKY9uIjDKIWLU/XzdMjlcgxSbT6Zv/JBCo9xPqkPUrv+4VLawz4kiyeWSdAVekDhj7d/sCDYdY0ap7DgxXZo7jFuvYtzxv6QO9oxdC13Ns2aql84GgZvPei/0673SXkTJArxf7jurppjsKT+L3BHwrjsEWcGnoReFkHzMbsjGA7PEzcUYTbA0C6yjUibfO1CgYEdtCVEt1s1vjS77GWYl2EVemTxWW3h+XQ73gZpfJ9PnlBzC9rjDBXdz3CeN
x-ms-exchange-antispam-srfa-diagnostics: SSOS;
x-ms-office365-filtering-correlation-id: 9baa729e-e5ca-43a1-a21e-08d521748a2f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(48565401081)(4534020)(4602075)(2017052603199);
	SRVR:BL2PR02MB2163; 
X-MS-TrafficTypeDiagnostic: BL2PR02MB2163:|BL2PR02MB2163:
x-exchange-antispam-report-test: UriScan:(264703809997249)(192813158149592)(21748063052155); 
x-microsoft-antispam-prvs: <BL2PR02MB21639CF9D7B1C197AD27CBFDB95F0@BL2PR02MB2163.namprd02.prod.outlook.com>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(93006095)(93001095)(10201501046)(3231020)(3002001)(100000703101)(100105400095)(6055026)(6041248)(20161123562025)(20161123560025)(20161123564025)(20161123555025)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(6072148)(201708071742011)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:BL2PR02MB2163; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:BL2PR02MB2163; 
x-forefront-prvs: 0478C23FE0
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(376002)(189002)(24454002)(199003)(68736007)(5660300001)(6916009)(6436002)(105586002)(2950100002)(6506006)(7696004)(101416001)(189998001)(33656002)(106356001)(2900100001)(81156014)(81166006)(229853002)(7736002)(25786009)(8676002)(4326008)(316002)(74316002)(6246003)(19273905006)(53386004)(5250100002)(97736004)(14454004)(478600001)(966005)(39060400002)(54356999)(50986999)(76176999)(606006)(53936002)(72206003)(53546010)(86362001)(55016002)(102836003)(3846002)(6116002)(790700001)(3660700001)(9326002)(66066001)(236005)(8936002)(9686003)(6306002)(19609705001)(54896002)(2906002)(3280700002)(99286004)(563064011);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2PR02MB2163;
	H:BL2PR02MB2163.namprd02.prod.outlook.com; FPR:; SPF:None;
	PTR:InfoNoRecords; MX:1; A:1; LANG:en; 
received-spf: None (protection.outlook.com: xilinx.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 9baa729e-e5ca-43a1-a21e-08d521748a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2017 22:04:35.9218 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL2PR02MB2163
X-Microsoft-Exchange-Diagnostics: 1; BL2PR02MB2163;
	23:LGnKAVWHH0YcdThccfU1o7dzM49PZZZckadG8KC2rBUEDP+up5Yp80snUjX9XoSANFpGvc5eR1GSZ5Lsc1bb5pecP6pu2mCk+tyZeTebp8td1TOub6o9CHzO0VAQd+B/RiMnDvw7BnfIoUUDlZCuJQ==
X-OriginatorOrg: xilinx.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] whetstone_1.2.bb: Add whetstone benchmark
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
X-List-Received-Date: Wed, 01 Nov 2017 22:37:59 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFydGluLA0KDQpXaWxsIHNlbmQgYSB2MyB3aXRoIGhlYWRlciBmb3IgbGljZW5zZSBjaGVj
a3N1bS4NCkhvd2V2ZXIsIEkgZG9u4oCZdCB0aGluayB0aGVzZSByZWNpcGVzIHdpbGwgYmUgdXBn
cmFkZWQgaW4gbmVhciBmdXR1cmUuDQoNClRoYW5rcywNCk1hbmp1DQoNCkZyb206IE1hcnRpbiBK
YW5zYSBbbWFpbHRvOm1hcnRpbi5qYW5zYUBnbWFpbC5jb21dDQpTZW50OiBXZWRuZXNkYXksIE9j
dG9iZXIgMjUsIDIwMTcgMTI6MTAgUE0NClRvOiBNYW5qdWt1bWFyIEhhcnRoaWtvdGUgTWF0aGEg
PE1BTkpVS1VNQHhpbGlueC5jb20+DQpDYzogb3BlbmVtYmVkZGVkLWRldmVsIDxvcGVuZW1iZWRk
ZWQtZGV2ZWxAbGlzdHMub3BlbmVtYmVkZGVkLm9yZz4NClN1YmplY3Q6IFJlOiBbb2VdIFttZXRh
LW9lXVtQQVRDSCB2Ml0gd2hldHN0b25lXzEuMi5iYjogQWRkIHdoZXRzdG9uZSBiZW5jaG1hcmsN
Cg0KV2h5IGRvbid0IHlvdSByZWZlcmVuY2UgdGhlIGxpY2Vuc2UgZnJvbSB0aGUgd2hldHN0b25l
LmMgaGVhZGVyPw0KDQpVc2luZyBDT01NT05fTElDRU5TRV9ESVIgd29uJ3QgcmVhbGx5IHdvcmsg
Zm9yIExJQ19GSUxFU19DSEtTVU0gdG8gY2F0Y2ggZGlmZmVyZW50IGxpY2Vuc2UgaWYgdGhpcyBy
ZWNpcGUgaXMgZXZlciB1cGdyYWRlZCB0byBkaWZmZXJlbnQgdmVyc2lvbi4NCg0KVGhlIHNhbWUg
ZG9lcyBhcHBseSB0byB5b3VyIDJuZCByZXZpZXcuDQoNCk9uIFdlZCwgT2N0IDI1LCAyMDE3IGF0
IDg6NDkgUE0sIE1hbmp1a3VtYXIgTWF0aGEgPG1hbmp1a3VtYXIuaGFydGhpa290ZS1tYXRoYUB4
aWxpbnguY29tPG1haWx0bzptYW5qdWt1bWFyLmhhcnRoaWtvdGUtbWF0aGFAeGlsaW54LmNvbT4+
IHdyb3RlOg0KVGhlIFdoZXRzdG9uZSBiZW5jaG1hcmsgaXMgYSBzeW50aGV0aWMgYmVuY2htYXJr
IGZvciBldmFsdWF0aW5nIHRoZQ0KcGVyZm9ybWFuY2Ugb2YgY29tcHV0ZXJzLg0KDQpodHRwczov
L2VuLndpa2lwZWRpYS5vcmcvd2lraS9XaGV0c3RvbmVfKGJlbmNobWFyaykNCg0KU2lnbmVkLW9m
Zi1ieTogTWFuanVrdW1hciBNYXRoYSA8bWFuanVrdW1hci5oYXJ0aGlrb3RlLW1hdGhhQHhpbGlu
eC5jb208bWFpbHRvOm1hbmp1a3VtYXIuaGFydGhpa290ZS1tYXRoYUB4aWxpbnguY29tPj4NCi0t
LQ0KIG1ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvd2hldHN0b25lL3doZXRzdG9uZV8xLjIuYmI8
aHR0cDovL3doZXRzdG9uZV8xLjIuYmI+IHwgMTggKysrKysrKysrKysrKysrKysrDQogMSBmaWxl
IGNoYW5nZWQsIDE4IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1vZS9y
ZWNpcGVzLWJlbmNobWFyay93aGV0c3RvbmUvd2hldHN0b25lXzEuMi5iYjxodHRwOi8vd2hldHN0
b25lXzEuMi5iYj4NCg0KZGlmZiAtLWdpdCBhL21ldGEtb2UvcmVjaXBlcy1iZW5jaG1hcmsvd2hl
dHN0b25lL3doZXRzdG9uZV8xLjIuYmI8aHR0cDovL3doZXRzdG9uZV8xLjIuYmI+IGIvbWV0YS1v
ZS9yZWNpcGVzLWJlbmNobWFyay93aGV0c3RvbmUvd2hldHN0b25lXzEuMi5iYjxodHRwOi8vd2hl
dHN0b25lXzEuMi5iYj4NCm5ldyBmaWxlIG1vZGUgMTAwNjQ0DQppbmRleCAwMDAwMDAwLi5lOTMx
OGViDQotLS0gL2Rldi9udWxsDQorKysgYi9tZXRhLW9lL3JlY2lwZXMtYmVuY2htYXJrL3doZXRz
dG9uZS93aGV0c3RvbmVfMS4yLmJiPGh0dHA6Ly93aGV0c3RvbmVfMS4yLmJiPg0KQEAgLTAsMCAr
MSwxOCBAQA0KK0RFU0NSSVBUSU9OID0gIkNQVSBiZW5jaG1hcmsgdG8gbWVhc3VyZSBmbG9hdGlu
ZyBwb2ludCBwZXJmb3JtYW5jZSINCitMSUNFTlNFID0gIlBEIg0KK0xJQ19GSUxFU19DSEtTVU0g
PSJmaWxlOi8vJHtDT01NT05fTElDRU5TRV9ESVJ9L1BEO21kNT1iMzU5N2QxMjk0Njg4MWUxM2Ni
M2I1NDhkMTE3Mzg1MTxmaWxlOi8vL1xcJCU3YkNPTU1PTl9MSUNFTlNFX0RJUiU3ZFxQRDttZDU9
YjM1OTdkMTI5NDY4ODFlMTNjYjNiNTQ4ZDExNzM4NTE+Ig0KKw0KK1NSQ19VUkkgPSAiaHR0cDov
L3d3dy5uZXRsaWIub3JnL2JlbmNobWFyay93aGV0c3RvbmUuYyINCitTUkNfVVJJW21kNXN1bV0g
PSAiZDhlYjJjZDcxMDRiYjVhMTJkNjE0YWM2ZDNmMWY5ZmIiDQorU1JDX1VSSVtzaGEyNTZzdW1d
ID0gIjMzM2U0Y2VjYTA0MmMxNDZmNjNlZWM2MDU1NzNkMTZhZThiMDcxNjZjYmM0NGExN2JlYzFl
YTk3YzZmMWVmYmYiDQorDQorUyA9ICIke1dPUktESVJ9Ig0KKw0KK2RvX2NvbXBpbGUgKCkgew0K
KyAgICAgICAke0NDfSAke0NGTEFHU30gJHtMREZMQUdTfSAtT2Zhc3QgLW8gd2hldHN0b25lIHdo
ZXRzdG9uZS5jIC1sbQ0KK30NCisNCitkb19pbnN0YWxsICgpIHsNCisgICAgICAgaW5zdGFsbCAt
RG0gMDc1NSB3aGV0c3RvbmUgJHtEfSR7YmluZGlyfS93aGV0c3RvbmUNCit9DQorDQotLQ0KMi43
LjQNCg0KLS0NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
DQpPcGVuZW1iZWRkZWQtZGV2ZWwgbWFpbGluZyBsaXN0DQpPcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZzxtYWlsdG86T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5l
bWJlZGRlZC5vcmc+DQpodHRwOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL29wZW5lbWJlZGRlZC1kZXZlbA0KDQo=

