Return-Path: <neenareddy.busireddy@nxp.com>
Received: from emea01-am1-obe.outbound.protection.outlook.com
	(mail-am1on0058.outbound.protection.outlook.com [157.56.112.58])
	by mail.openembedded.org (Postfix) with ESMTP id E15536612C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2016 20:49:28 +0000 (UTC)
Received: from VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140) by
	VI1PR04MB1584.eurprd04.prod.outlook.com (10.164.84.142) with Microsoft
	SMTP Server (TLS) id 15.1.497.12; Wed, 11 May 2016 20:34:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
	s=selector1-nxp-com;
	h=From:To:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=n934e0NiPrvD4cs7jD2fPTLqvNPlVPajNaEGM6qtCTg=;
	b=aT4snUFNLZduKrXQinhtTz+b+R2YBQNTQ5p+vemfrLxRCd6gz0rgDTVseq/QYH0Gu52BT3/M8tesVKCZg/AEFjonaCEpaGc9dtyowKiYMoYX1/RthO6q2Ch1/hRB4bWgtH+xp4HD3ZMKHlA3vIyW4jLRpogHJvcjIxvptNGTXV0=
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com (10.164.84.141) by
	VI1PR04MB1582.eurprd04.prod.outlook.com (10.164.84.140) with Microsoft
	SMTP Server (TLS) id 15.1.492.11; Wed, 11 May 2016 20:19:51 +0000
Received: from VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) by
	VI1PR04MB1583.eurprd04.prod.outlook.com ([10.164.84.141]) with mapi id
	15.01.0492.016; Wed, 11 May 2016 20:19:51 +0000
From: Neena Busireddy <neenareddy.busireddy@nxp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Thread-Topic: [oe] [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to
	replace mesa-glut
Thread-Index: AQHRq730rn0rl+3Vd0OqDksB5PrR/Z+0LDcg
Date: Wed, 11 May 2016 20:19:51 +0000
Message-ID: <VI1PR04MB15835D77C649B90F872FA3EC91720@VI1PR04MB1583.eurprd04.prod.outlook.com>
References: <1462995709-6171-1-git-send-email-neenareddy.busireddy@nxp.com>
	<1462995709-6171-2-git-send-email-neenareddy.busireddy@nxp.com>
	<DAB557BF-26BA-45FA-A533-DE7A45C92B6D@gmail.com>
In-Reply-To: <DAB557BF-26BA-45FA-A533-DE7A45C92B6D@gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=nxp.com;
x-originating-ip: [192.88.168.49]
X-MS-Office365-Filtering-Correlation-Id: 51d85022-31c1-4876-3b96-08d379d99bcf
x-microsoft-exchange-diagnostics: 1; VI1PR04MB1582;
	5:NYkRin2pY/jbTsMw0k0hxLM+TgA9uflHqGj2GtNAjZvt8z/qlLRceNIZ1tIcM0DGqvKa3msDLUR8kHZjHVCKqxFMLFF9rNOgho480Otnez1t6v93to849Vx+40FpvvJOBAbINB85YL3HHUlV7Z3ibQ==;
	24:PFQ1X+apY0u3J1kbZkS4SVwCQM6S4Y7V7IUthWUotpN6l2aD156hr2cboGiytibk7k3ghvTRysi9CUwPtWXk+O454bGDYHiYu1GEInfDVu8=;
	7:rrf9aNH5MjhwnDtCiEucUbvcivDkyNgKuT97+9dAujhIfKbAlnw0a20H/qxEvj7QST/vC/9cT4MXtZZttrlEw74jLWtgTSBgwk4aZsGRqFH4n1OmvkareoqSBE8a7wJNnhb8rLx+czlK67wsZUvPh9qZatxyygoR2hb46/ciyiaCy2xohhZNQ11Dtiu+QYTP;
	23:oO0i0nGOjvwTHnVC+QD+3mir6CcYrmr6odFk2lZ+VpV2vV+aWoDaj1vAF7bi3nKq11Ajx9K9zFS12mIzyqcNOMXhkV5ifpydoLmrF5P4I10r03sdhO1beTHNrOsmVRqDfabrn2WcTlHjfm5jGNI6hXEUeo1v5bpgSKYuYScOJa+YQfdUtSXHSHmlPtpIsuCU
x-microsoft-antispam: UriScan:;BCL:0;PCL:0;RULEID:;SRVR:VI1PR04MB1582;
x-microsoft-antispam-prvs: <VI1PR04MB1582E1A90BD9DBAD4AB1B3ED91720@VI1PR04MB1582.eurprd04.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(2401047)(8121501046)(5005006)(10201501046)(3002001)(6055026);
	SRVR:VI1PR04MB1582; BCL:0; PCL:0; RULEID:; SRVR:VI1PR04MB1582; 
x-forefront-prvs: 0939529DE2
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(6009001)(24454002)(377454003)(2501003)(102836003)(3846002)(6116002)(2906002)(9686002)(1220700001)(586003)(86362001)(575784001)(19580395003)(19580405001)(5002640100001)(3280700002)(122556002)(81166006)(92566002)(66066001)(8936002)(1720100001)(2900100001)(33656002)(2950100001)(74316001)(76576001)(5008740100001)(5004730100002)(11100500001)(3660700001)(87936001)(5001770100001)(5003600100002)(77096005)(107886002)(189998001)(15975445007)(76176999)(54356999)(50986999)(106116001);
	DIR:OUT; SFP:1101; SCL:1; SRVR:VI1PR04MB1582;
	H:VI1PR04MB1583.eurprd04.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
spamdiagnosticoutput: 1:23
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2016 20:19:51.6723 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB1582
X-Microsoft-Exchange-Diagnostics: 1; VI1PR04MB1584;
	2:2/MsebbOReo19qGoZQke1rWG8eQ6mJRAnJ9nWecber36g3PyjN00wEBYryd2hzabOHWzkO7ydye7mrRZz/+o2BfDFAPqyvZCz07G7ps+amEjMYCdBUotVHo/NtpQa155r7vDUXzwtXPQ1lNyj7J3tUkKTELdZuLUzPF+3rXyHInY0zN713FD5fc5PFUJFKp6;
	23:t7wotvexd0kMb1qePBB5uBApNZ76S8fGNaN+Umrp44W+QvVJypS80i4pFf3UAdiXxtW88f64wCmt5tStu9vpWZ9qbAitVp058/jRCpTJpcPHtdostmhj5lAn4DvrNtSXYg6LFhhNsVLk1Xi5Qz6xT0BojN9RADY1n7B5j7BDzt2qVv1gRwricut8hup2N2yj
X-OriginatorOrg: nxp.com
Subject: Re: [meta-oe][PATCH 2/2] freeglut: Add a recipe freeglut to	replace mesa-glut
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
X-List-Received-Date: Wed, 11 May 2016 20:49:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgS2hlbSwNCg0KPiBPbiBNYXkgMTEsIDIwMTYsIGF0IDEyOjQxIFBNLCBOZWVuYSBCdXNpcmVk
ZHkgPG5lZW5hcmVkZHkuYnVzaXJlZGR5QG54cC5jb20+IHdyb3RlOg0KPiANCj4gRnJlZUdMVVQg
aXMgYSBmcmVlLXNvZnR3YXJlL29wZW4tc291cmNlIGFsdGVybmF0aXZlIHRvIHRoZSBPcGVuR0wg
DQo+IFV0aWxpdHkgVG9vbGtpdCAoR0xVVCkgbGlicmFyeS4NCj4gTW9yZSBpbmZvcm1hdGlvbiBh
Ym91dCB0aGlzIGxpYnJhcnkgY2FuIGJlIGZvdW5kIGluIA0KPiBodHRwOi8vZnJlZWdsdXQuc291
cmNlZm9yZ2UubmV0Lw0KPiANCj4gU2lnbmVkLW9mZi1ieTogTmVlbmEgQnVzaXJlZGR5IDxuZWVu
YXJlZGR5LmJ1c2lyZWRkeUBueHAuY29tPg0KPiAtLS0NCj4gbWV0YS1vZS9yZWNpcGVzLWdyYXBo
aWNzL2ZyZWVnbHV0L2ZyZWVnbHV0XzMuMC4wLmJiIHwgMTcgDQo+ICsrKysrKysrKysrKysrKysr
DQo+IDEgZmlsZSBjaGFuZ2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IGNyZWF0ZSBtb2RlIDEwMDY0
NCBtZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvZnJlZWdsdXQvZnJlZWdsdXRfMy4wLjAuYmINCj4g
DQo+IGRpZmYgLS1naXQgYS9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3MvZnJlZWdsdXQvZnJlZWds
dXRfMy4wLjAuYmIgDQo+IGIvbWV0YS1vZS9yZWNpcGVzLWdyYXBoaWNzL2ZyZWVnbHV0L2ZyZWVn
bHV0XzMuMC4wLmJiDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAuLjc2
NzFlNzUNCj4gLS0tIC9kZXYvbnVsbA0KPiArKysgYi9tZXRhLW9lL3JlY2lwZXMtZ3JhcGhpY3Mv
ZnJlZWdsdXQvZnJlZWdsdXRfMy4wLjAuYmINCj4gQEAgLTAsMCArMSwxNyBAQA0KPiArREVTQ1JJ
UFRJT04gPSAiRnJlZUdMVVQgaXMgYSBmcmVlLXNvZnR3YXJlL29wZW4tc291cmNlIGFsdGVybmF0
aXZlIHRvIHRoZSBPcGVuR0wgXA0KPiArICAgICAgICAgICAgICAgVXRpbGl0eSBUb29sa2l0IChH
TFVUKSBsaWJyYXJ5Ig0KPiArTElDRU5TRSA9ICJYLUNvbnNvcnRpdW3igJ0NCg0KVGhpcyBzZWVt
cyBhIG5ldyBsaWNlbnNlIHR5cGUuIENhbiB5b3UgcG9pbnQgdG8gdGhlIHRleHQgZm9yIHRoaXMg
Pw0KW05lZW5hIEJ1c2lyZWRkeV0gV2UgY2FuIHVzZSBNSVQgaW5zdGVhZCBvZiBYLUNvbnNvcnRp
dW0sIHNpbmNlIGl0IGlzIGFuIE1JVCB2YXJpYW50Lg0KDQo+ICtMSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT04OWMwYjU4YTNlMDFjZTNkODI1NGM5ZjU5ZTc4YWRmYiINCj4g
Kw0KPiArU1JDX1VSSSA9ICJodHRwczovL3NvdXJjZWZvcmdlLm5ldC9wcm9qZWN0cy8ke0JQTn0v
ZmlsZXMvJHtCUE59LyR7UFZ9LyR7QlBOfS0ke1BWfS50YXIuZ3oiDQo+ICtTUkNfVVJJW21kNXN1
bV0gPSAiOTBjM2NhNGRkOWQ1MWNmMzIyNzZiYzUzNDRlYzk3NTQiDQo+ICtTUkNfVVJJW3NoYTI1
NnN1bV0gPSAiMmE0M2JlODUxNWIwMWVhODJiY2ZhMTdkMjlhZTBkNDBiZDEyODM0MmYwOTMwY2Qx
ZjM3NWYxZmY5OTlmNzZhMiINCj4gKw0KPiAraW5oZXJpdCBjbWFrZQ0KPiArDQo+ICsjIGRlcGVu
ZHMgb24gdmlydHVhbC9saWJ4MTENCj4gK1JFUVVJUkVEX0RJU1RST19GRUFUVVJFUyA9ICJ4MTEi
DQo+ICsNCj4gK1BST1ZJREVTICs9ICJtZXNhLWdsdXQiDQo+ICsNCj4gK0RFUEVORFMgPSAidmly
dHVhbC9saWJ4MTEgbGlieG11IGxpYnhpIHZpcnR1YWwvbGliZ2wgbGliZ2x1IGxpYnhyYW5kciIN
Cj4gLS0NCj4gMS45LjENCj4gDQo+IC0tDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fDQo+IE9wZW5lbWJlZGRlZC1kZXZlbCBtYWlsaW5nIGxpc3QNCj4g
T3BlbmVtYmVkZGVkLWRldmVsQGxpc3RzLm9wZW5lbWJlZGRlZC5vcmcNCj4gaHR0cDovL2xpc3Rz
Lm9wZW5lbWJlZGRlZC5vcmcvbWFpbG1hbi9saXN0aW5mby9vcGVuZW1iZWRkZWQtZGV2ZWwNCg0K

