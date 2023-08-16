Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2AFDC001DF
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:29:27 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.156576.1692174558928473062
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=napIed0Y;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692174556; x=1694766556;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rHQH4X2z9BOzC47KY3RadHA+vplBTu2lHToIYne+hm8=;
	b=napIed0Y4E9AJPGBwscGndaDqHc/1ZHWiMSAJR9qfc9VEQAuTVtR0ldU7urSRYRO
	5JsE0dGQ/chc/Ly3iDC/yEaj3IJdrsecJqVeZzf1rz+EPsl3RrdYnYZ4Le+0pYdz
	BUODsg/wK1ETUeWxXkXwDfj89K8+a0WzyuA3PZ83MLk=;
X-AuditID: ac14000a-923ff70000007ecb-4e-64dc88dc54f7
Received: from berlix.phytec.de (Unknown_Domain [172.25.0.12])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 19.87.32459.CD88CD46; Wed, 16 Aug 2023 10:29:16 +0200 (CEST)
Received: from Florix.phytec.de (172.25.0.13) by Berlix.phytec.de
 (172.25.0.12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Aug
 2023 10:29:15 +0200
Received: from Florix.phytec.de ([fe80::a802:84f9:c56c:4c6d]) by
 florix.phytec.de ([fe80::a802:84f9:c56c:4c6d%5]) with mapi id 15.01.2375.018;
 Wed, 16 Aug 2023 10:29:15 +0200
From: Marine Vovard <M.Vovard@phytec.de>
To: "raj.khem@gmail.com" <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 1/1] python3-kivy: Remove X11 from
 REQUIRED_DISTRO_FEATURES
Thread-Topic: [oe] [meta-python][PATCH 1/1] python3-kivy: Remove X11 from
 REQUIRED_DISTRO_FEATURES
Thread-Index: AQHZzsJi+wQIIqIVoEe6DZzgndBTjK/seG+A
Date: Wed, 16 Aug 2023 08:29:15 +0000
Message-ID: <f6312bf8408ddf1c16b006842c6f32fc0535880e.camel@phytec.de>
References: <20230814144304.2395362-1-m.vovard@phytec.de>
	 <20230814144304.2395362-2-m.vovard@phytec.de>
	 <CAMKF1spwnmK54urhY_=Pq_TjGXJjoNfd9PFoy6gjcQ6wcSDnQw@mail.gmail.com>
In-Reply-To: <CAMKF1spwnmK54urhY_=Pq_TjGXJjoNfd9PFoy6gjcQ6wcSDnQw@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <D980D37C9DC7314BBBD7E775761D0782@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42JZI8nAo3un406KweJWfouLh5cyW7Rdn8Xo
	wOSxc9Zddo9zG1cwBjBFcdmkpOZklqUW6dslcGVs+vaCsaBJrOLXz6OMDYw7RLsYOTgkBEwk
	vq8S6GLk4hASWMIk8byngRXCecAosWPqC+YuRk4gZxOjxOePmSA2m4CGxIEXNxhBbBEBXYnn
	n/+ygNjMArES50+fYQKxhQWSJd6ve8kGUZMi8XTbBRYI20hi+tQT7CA2i4CqxMV/38BsXgE3
	ieZPT5ggFgPtujW5C2wBp0CgxI3lvWBDGQVkJTob3jFBLBOX2PTsOyuILSEgILFkz3lmCFtU
	4uXjf1BxeYkTt6YxgXzJLKApsX6XPkSrhcTm2T2MELaixJTuh1A3CEqcnPmEZQKj+CwkG2Yh
	dM9C0j0LSfcsJN0LGFlXMQrlZiZnpxZlZusVZFSWpCbrpaRuYgTFmQgD1w7GvjkehxiZOBgP
	MUpwMCuJ8Pbw3koR4k1JrKxKLcqPLyrNSS0+xCjNwaIkznu/hylRSCA9sSQ1OzW1ILUIJsvE
	wSnVwDgj7tOMNP8nQgEy01p2enLk7Zzd895yfWPk+w8WzddWcijMlJA7fy3RXNI/Xvs75/l9
	ig7OJzI2TeoPf5j93bFi+kath+cOlzdt65hoMP3TweRAmY9H5l29kv6zLGBn0pWdAT7bW7eU
	9aauLZA8VRb+Is/y6cEY6b68m6+bSmf7ftK9+/f6jmQlluKMREMt5qLiRAA03VezoQIAAA==
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:29:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104417

T24gTW9uLCAyMDIzLTA4LTE0IGF0IDA4OjE3IC0wNzAwLCBLaGVtIFJhaiB3cm90ZToNCj4gT24g
TW9uLCBBdWcgMTQsIDIwMjMgYXQgNzo0M+KAr0FNIE1hcmluZSBWb3ZhcmQgPE0uVm92YXJkQHBo
eXRlYy5kZT4NCj4gd3JvdGU6DQo+ID4gDQo+ID4gV2UgY2FuIHVzZSBwdXJlIFdheWxhbmQgYW5k
IHRoZXJlZm9yZSBYMTEgaXMgbm90IHJlcXVpcmVkIGFsbCB0aGUNCj4gPiB0aW1lLg0KPiA+IA0K
PiANCj4gV291bGQgaXQgYWxzbyBidWlsZCB3aGVuIHgxMSBvciB3YXlsYW5kIG5laXRoZXIgYXJl
IGluDQo+IERJU1RST19GRUFUVVJFUyA/DQo+IElmIG5vdCB0aGVuIEkgZ3Vlc3MgYSBjaGVjayBz
aG91bGQgYmUgbWFkZSB0byBjaGVjayBzdWNoIHRoYXQgYXRsZWFzdA0KPiBvbmUgb2YgdGhlc2Ug
ZGlzdHJvDQo+IGZlYXR1cmVzIGFyZSBwcmVzZW50Lg0KPiANCg0KSW5kZWVkLCBmcm9tIHdoYXQg
SSB1bmRlcnN0b29kIHlvdSBuZWVkIHdheWxhbmQgb3IgeDExIChvciBib3RoKcKgDQp0byBtYWtl
IGl0IHdvcmsuIEknbSB0aGlua2luZyBhYm91dCBhZGRpbmcgdGhlIGZvbGxvd2luZyBsaW5lOg0K
DQpBTllfT0ZfRElTVFJPX0ZFQVRVUkVTID0gIngxMSB3YXlsYW5kIg0KDQpJIHdpbGwgc2VuZCBh
IG5ldyBwYXRjaCB3aXRoIHRoaXMgbW9kaWZpY2F0aW9uIGlmIGl0IHNlZW1zIG9rLg0KIA0KPiA+
IFNpZ25lZC1vZmYtYnk6IE1hcmluZSBWb3ZhcmQgPG0udm92YXJkQHBoeXRlYy5kZT4NCj4gPiAt
LS0NCj4gPiDCoG1ldGEtcHl0aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMta2l2
eV8yLjEuMC4uYmIgfCAyICstDQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvbWV0YS1weXRob24vcmVjaXBl
cy1kZXZ0b29scy9weXRob24vcHl0aG9uMy0NCj4gPiBraXZ5XzIuMS4wLi5iYiBiL21ldGEtcHl0
aG9uL3JlY2lwZXMtZGV2dG9vbHMvcHl0aG9uL3B5dGhvbjMtDQo+ID4ga2l2eV8yLjEuMC4uYmIN
Cj4gPiBpbmRleCBjYTFmYzVmOTYuLjkzODk0Yzg2MCAxMDA2NDQNCj4gPiAtLS0gYS9tZXRhLXB5
dGhvbi9yZWNpcGVzLWRldnRvb2xzL3B5dGhvbi9weXRob24zLWtpdnlfMi4xLjAuLmJiDQo+ID4g
KysrIGIvbWV0YS1weXRob24vcmVjaXBlcy1kZXZ0b29scy9weXRob24vcHl0aG9uMy1raXZ5XzIu
MS4wLi5iYg0KPiA+IEBAIC00Myw3ICs0Myw3IEBAIGV4cG9ydCBLSVZZX0dSQVBISUNTDQo+ID4g
wqBLSVZZX0NST1NTX1NZU1JPT1Q9IiR7UkVDSVBFX1NZU1JPT1R9Ig0KPiA+IMKgZXhwb3J0IEtJ
VllfQ1JPU1NfU1lTUk9PVA0KPiA+IA0KPiA+IC1SRVFVSVJFRF9ESVNUUk9fRkVBVFVSRVMgKz0g
IngxMSBvcGVuZ2wgZ29iamVjdC1pbnRyb3NwZWN0aW9uLQ0KPiA+IGRhdGEiDQo+ID4gK1JFUVVJ
UkVEX0RJU1RST19GRUFUVVJFUyArPSAib3BlbmdsIGdvYmplY3QtaW50cm9zcGVjdGlvbi1kYXRh
Ig0KPiA+IA0KPiA+IMKgREVQRU5EUyArPSAiIFwNCj4gPiDCoMKgwqDCoCBnc3RyZWFtZXIxLjAg
XA0KPiA+IC0tDQo+ID4gMi4yNS4xDQo+ID4gDQo+ID4gDQo+ID4gLT0tPS09LT0tPS09LT0tPS09
LT0tPS0NCj4gPiBMaW5rczogWW91IHJlY2VpdmUgYWxsIG1lc3NhZ2VzIHNlbnQgdG8gdGhpcyBn
cm91cC4NCj4gPiBWaWV3L1JlcGx5IE9ubGluZSAoIzEwNDM1MCk6DQo+ID4gaHR0cHM6Ly9saXN0
cy5vcGVuZW1iZWRkZWQub3JnL2cvb3BlbmVtYmVkZGVkLWRldmVsL21lc3NhZ2UvMTA0MzUwDQo+
ID4gTXV0ZSBUaGlzIFRvcGljOg0KPiA+IGh0dHBzOi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9t
dC8xMDA3Mzc4NzEvMTk5NzkxNA0KPiA+IEdyb3VwIE93bmVyOiBvcGVuZW1iZWRkZWQtZGV2ZWwr
b3duZXJAbGlzdHMub3BlbmVtYmVkZGVkLm9yZw0KPiA+IFVuc3Vic2NyaWJlOg0KPiA+IGh0dHBz
Oi8vbGlzdHMub3BlbmVtYmVkZGVkLm9yZy9nL29wZW5lbWJlZGRlZC1kZXZlbC91bnN1YsKgWw0K
PiA+IHJhai5raGVtQGdtYWlsLmNvbV0NCj4gPiAtPS09LT0tPS09LT0tPS09LT0tPS09LQ0KPiA+
IA0KDQo=

