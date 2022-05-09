Return-Path: <t.remmet@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34376C433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 06:15:52 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [195.145.39.210])
 by mx.groups.io with SMTP id smtpd.web09.28813.1652076944357343233
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 May 2022 23:15:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@phytec.de header.s=a4
 header.b=sIHf7r5N;
 spf=pass (domain: phytec.de, ip: 195.145.39.210,
 mailfrom: t.remmet@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1652076940; x=1654668940;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WZoeU29Ir1cYS+N0oOXIpaj/LMXpOo6y3UJacNFRrZQ=;
	b=sIHf7r5Ncy+OUkHE2Z7X3hy62hf9/FPaEaGfQu8xUpXeZqL4Z8ikXr7PNEOlCfqu
	2lHCGmXSOwVJ8BwHJ3IgJMkyY+nvz48TBsG2/nSxG3053ntjkaSMqL4/SLY8FfHI
	gBOJRB1esGhoHYJB+J8UyxwO28xKcGACcCOY/edTuDI=;
X-AuditID: c39127d2-ee139700000022f0-c5-6278b18ccc42
Received: from Diagnostix.phytec.de (Diagnostix.phytec.de [172.16.0.119])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id
 93.E1.08944.C81B8726; Mon,  9 May 2022 08:15:40 +0200 (CEST)
Received: from Berlix.phytec.de (172.16.0.117) by Diagnostix.phytec.de
 (172.16.0.119) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 9 May
 2022 08:15:40 +0200
Received: from Berlix.phytec.de ([fe80::2d82:c2a2:5905:87c2]) by
 berlix.phytec.de ([fe80::2d82:c2a2:5905:87c2%3]) with mapi id 15.01.2375.018;
 Mon, 9 May 2022 08:15:40 +0200
From: Teresa Remmet <T.Remmet@phytec.de>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>, "raj.khem@gmail.com"
	<raj.khem@gmail.com>, "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-networking][PATCH] meta-networking: Add meta-phython
 to BBFILES_DYNAMIC
Thread-Topic: [oe] [meta-networking][PATCH] meta-networking: Add meta-phython
 to BBFILES_DYNAMIC
Thread-Index: AQHYYb9oD4G2nkU5H0aNNBSNV1qZB60Snm8AgANU9AA=
Date: Mon, 9 May 2022 06:15:40 +0000
Message-ID: <cdddbab33fb8c269175e4e7baef3707e80b27341.camel@phytec.de>
References: <20220506121216.3099707-1-t.remmet@phytec.de>
	 <f8dcd63b-ec64-adc2-97ca-c877db64b8f0@windriver.com>
	 <025371e6-098d-4335-c2b4-5468f861eec4@gmail.com>
In-Reply-To: <025371e6-098d-4335-c2b4-5468f861eec4@gmail.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.0.116]
Content-Type: text/plain; charset="utf-8"
Content-ID: <0CECFB2346060242BA0B5C7095B0A013@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: 
 H4sIAAAAAAAAA+NgFuplkeLIzCtJLcpLzFFi42JZI8BQrtuzsSLJYP8HK4urLXsZLS4eXsps
	0XZ9FqMDs8fOWXfZPc5tXMHosX7LVqYA5igum5TUnMyy1CJ9uwSujK8vHzAVNIlUTJ3+mqWB
	8YBwFyMnh4SAicTyST9ZQGwhgfVMEos2OXUxcgHZTxkl5r2bxQzhbGSUeNjexAhSxSagIfHy
	RDcTSEJEYC+jRPP7RcwgCWGBRIkpW86xgtgiAkkS8781ABVxANlWElPOyoOEWQRUJM492sYG
	YvMKuEnMm3CLCWLBUkaJZQ/XgJ3BKWArcfjAX7BljAKyEhs2nAebzywgLrHp2XdWiLMFJJbs
	gYhLCIhKvHz8DyquINHW0wm2l1lAU2L9Ln2IVguJyZfXsEHYihJTuh+yQ9wgKHFy5hOWCYxi
	s5BsmIXQPQtJ9ywk3bOQdC9gZF3FKJSbmZydWpSZrVeQUVmSmqyXkrqJERhlhyeqX9rB2DfH
	4xAjEwfjIUYJDmYlEd79fRVJQrwpiZVVqUX58UWlOanFhxilOViUxHnv9zAlCgmkJ5akZqem
	FqQWwWSZODilGhhTzOYlcqSx+zHeut3VJXfYb/UyryMLv/3q/Nzrm7To3LZygaWPjbkPR7a8
	MD0/R2nuJb7Iyb/5JvR/FTod+mC35XWnuBvHw5UZ562zcF+RbPgu3Uv26qnl8/QD+QXfObXt
	Cg+wXWrmdWFyzbOCfTpH3P0nZOqZ+ufP49n/6PM5x7X/Fpqdl9BUYinOSDTUYi4qTgQAzb3R
	LqACAAA=
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 06:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96983

QW0gRnJlaXRhZywgZGVtIDA2LjA1LjIwMjIgdW0gMjA6MjIgLTA3MDAgc2NocmllYiBLaGVtIFJh
ajoNCj4gDQo+IE9uIDUvNi8yMiAyMDowNiwga2FpIHdyb3RlOg0KPiA+IE9uIDUvNi8yMiA4OjEy
IFBNLCBUZXJlc2EgUmVtbWV0IHdyb3RlOg0KPiA+ID4gQWN0aXZhdGUgcmVjaXBlcyBpbiBkeW5h
bWljLWxheWVycyBvZiBtZXRhLW5ldHdvcmtpbmcuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYt
Ynk6IFRlcmVzYSBSZW1tZXQ8dC5yZW1tZXRAcGh5dGVjLmRlPg0KPiA+ID4gLS0tDQo+ID4gPiAg
IG1ldGEtbmV0d29ya2luZy9jb25mL2xheWVyLmNvbmYgfCAzICsrKw0KPiA+ID4gICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspDQo+ID4gPiANCj4gPiA+IGRpZmYgLS1naXQgYS9tZXRh
LW5ldHdvcmtpbmcvY29uZi9sYXllci5jb25mIGIvbWV0YS0NCj4gPiA+IG5ldHdvcmtpbmcvY29u
Zi9sYXllci5jb25mDQo+ID4gPiBpbmRleCAzMDY5Y2ZiNmEzOWQuLmE3ZDZkYThmZDdkNyAxMDA2
NDQNCj4gPiA+IC0tLSBhL21ldGEtbmV0d29ya2luZy9jb25mL2xheWVyLmNvbmYNCj4gPiA+ICsr
KyBiL21ldGEtbmV0d29ya2luZy9jb25mL2xheWVyLmNvbmYNCj4gPiA+IEBAIC0yNCwzICsyNCw2
IEBAIFNJR0dFTl9FWENMVURFX1NBRkVfUkVDSVBFX0RFUFMgKz0gIiBcDQo+ID4gPiAgICAgd2ly
ZWd1YXJkLXRvb2xzLT53aXJlZ3VhcmQtbW9kdWxlIFwNCj4gPiA+ICAgICB3aXJlbGVzcy1yZWdk
Yi0+Y3JkYSBcDQo+ID4gPiAgICINCj4gPiA+ICtCQkZJTEVTX0RZTkFNSUMgKz0gIiBcDQo+ID4g
PiArICAgIG1ldGEtcHl0aG9uOiR7TEFZRVJESVJ9L2R5bmFtaWMtbGF5ZXJzL21ldGEtcHl0aG9u
L3JlY2lwZXMtDQo+ID4gPiAqLyovKi5iYiBcDQo+ID4gPiArIg0KPiA+ID4gDQo+ID4gVGhhbmtz
LCBJIG1ldCB0aGUgc2FtZSBpc3N1ZS4gQlRXLCB0aGVyZSBpcyBhIHR5cG8gaW4gdGhlIHRpdGxl
LCANCj4gPiAncy9waHl0aG9uL3B5dGhvbi8nLg0KPiANCj4gdGhhbmtzIEkgaGF2ZSB0YWtlbiBj
YXJlIG9mIHRoaXMsIG5vIG5lZWQgdG8gc2VuZCB2Mg0KDQpUaGFuayB5b3UgZm9yIGZpeGluZyB0
aGF0Lg0KDQpUZXJlc2ENCg0KPiA+IC0tIA0KPiA+IEthaSBLYW5nDQo+ID4gV2luZCBSaXZlciBM
aW51eA0KPiA+IA0KPiA+IA0KPiA+IA0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4g
TGlua3M6IFlvdSByZWNlaXZlIGFsbCBtZXNzYWdlcyBzZW50IHRvIHRoaXMgZ3JvdXAuDQo+ID4g
Vmlldy9SZXBseSBPbmxpbmUgKCM5Njk3NSk6IA0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVk
ZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC9tZXNzYWdlLzk2OTc1DQo+ID4gTXV0ZSBUaGlz
IFRvcGljOiBodHRwczovL2xpc3RzLm9wZW5lbWJlZGRlZC5vcmcvbXQvOTA5MzE2MzQvMTk5Nzkx
NA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwrb3duZXJAbGlzdHMub3BlbmVt
YmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOiANCj4gPiBodHRwczovL2xpc3RzLm9wZW5lbWJl
ZGRlZC5vcmcvZy9vcGVuZW1iZWRkZWQtZGV2ZWwvdW5zdWINCj4gPiBbcmFqLmtoZW1AZ21haWwu
Y29tXQ0KPiA+IC09LT0tPS09LT0tPS09LT0tPS09LT0tDQo+ID4gDQotLSANClBIWVRFQyBNZXNz
dGVjaG5payBHbWJIIHwgUm9iZXJ0LUtvY2gtU3RyLiAzOSB8IDU1MTI5IE1haW56LCBHZXJtYW55
DQoNCkdlc2Now6RmdHNmw7xocmVyOiBEaXBsLi1JbmcuIE1pY2hhZWwgTWl0ZXpraSwgRGlwbC4t
SW5nLiBCb2RvIEh1YmVyIHwNCkhhbmRlbHNyZWdpc3RlciBNYWlueiBIUkIgNDY1NiB8IEZpbmFu
emFtdCBNYWlueiB8IFN0Lk5yLiAyNjY1MDA2MDgsIERFDQoxNDkwNTk4NTUNCg==

