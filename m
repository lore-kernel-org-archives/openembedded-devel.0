Return-Path: <M.Vovard@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E235DC001E0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 08:27:47 +0000 (UTC)
Received: from mickerik.phytec.de (mickerik.phytec.de [91.26.50.163])
 by mx.groups.io with SMTP id smtpd.web10.156557.1692174465439398288
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Aug 2023 01:27:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@phytec.de header.s=a4 header.b=UQuS/2pX;
 spf=pass (domain: phytec.de, ip: 91.26.50.163, mailfrom: m.vovard@phytec.de)
DKIM-Signature: v=1; a=rsa-sha256; d=phytec.de; s=a4; c=relaxed/simple;
	q=dns/txt; i=@phytec.de; t=1692174461; x=1694766461;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=aY+e1XNv3otXkKC1yGIPVWVc4XvrQxtrZ3W+SdM8PHU=;
	b=UQuS/2pXYF0njgT6XlQ2ez+qtf6y/8rDByUqUcosv1+djAw+uULBiapOtKxh9i2z
	PYtXCkvgJfLoGVTqivqJb8RmiruchanDgMe8E+JFdLYwalJsVjw/mYWJsJk4f0kx
	fS/YHIBSodhQ9g6uXydRihf+y49LpgariIoDR+MQQ5M=;
X-AuditID: ac14000a-923ff70000007ecb-3d-64dc887d0be5
Received: from florix.phytec.de (Unknown_Domain [172.25.0.13])
	(using TLS with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client did not present a certificate)
	by mickerik.phytec.de (PHYTEC Mail Gateway) with SMTP id 27.87.32459.D788CD46; Wed, 16 Aug 2023 10:27:41 +0200 (CEST)
Received: from Florix.phytec.de (172.25.0.13) by Florix.phytec.de
 (172.25.0.13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Wed, 16 Aug
 2023 10:27:41 +0200
Received: from Florix.phytec.de ([fe80::a802:84f9:c56c:4c6d]) by
 florix.phytec.de ([fe80::a802:84f9:c56c:4c6d%5]) with mapi id 15.01.2375.018;
 Wed, 16 Aug 2023 10:27:41 +0200
From: Marine Vovard <M.Vovard@phytec.de>
To: "martin.jansa@gmail.com" <martin.jansa@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-python][PATCH 0/1] Remove X11 from
 REQUIRED_DISTRO_FEATURES from Kivy
Thread-Topic: [oe] [meta-python][PATCH 0/1] Remove X11 from
 REQUIRED_DISTRO_FEATURES from Kivy
Thread-Index: AQHZzsQGX4Z7Cusxg0Cx92wcPY7fvK/sd/yA
Date: Wed, 16 Aug 2023 08:27:41 +0000
Message-ID: <d3801dce3e1f09b39e1bdf1b206ee3681da62c8e.camel@phytec.de>
References: <20230814144304.2395362-1-m.vovard@phytec.de>
	 <CA+chaQfZgtcjXxuqYw4=Zq8b9Xt4Vw=_ToQRn0P8bRnF8POxZQ@mail.gmail.com>
In-Reply-To: <CA+chaQfZgtcjXxuqYw4=Zq8b9Xt4Vw=_ToQRn0P8bRnF8POxZQ@mail.gmail.com>
Accept-Language: en-US, de-DE
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.25.0.11]
Content-Type: text/plain; charset="utf-8"
Content-ID: <8061CF3E42584847BFB23649AA4325F5@phytec.de>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnkeLIzCtJLcpLzFFi42JZI8nAq1vbcSfFYNUeU4tff6cwW1w8vJTZ
	gclj56y77B7nNq5gDGCK4rJJSc3JLEst0rdL4MrY//MsS0ELW8XUvllMDYwfWLsYOTkkBEwk
	TrcdZOxi5OIQEljCJPF63zso5wGjxIwZT5khnE2MEr/7drKAtLAJaEgceHEDqIqDQ0TAVGLK
	vUyQMLNArMT502eYQGxhgXiJFV++sIPYIgIJEg827mSFsI0kDq++xwhiswioSuze0A42klfA
	TeLJ4yY2iF2NjBL3Fn5nBklwCgRK3HiyiA3EZhSQlehseMcEsUxcYtOz71AvCEgs2XOeGcIW
	lXj5+B9UXF7ixK1pTCB3MgtoSqzfpQ/RaiHxs+cYC4StKDGl+yE7xA2CEidnPmGZwCg+C8mG
	WQjds5B0z0LSPQtJ9wJG1lWMQrmZydmpRZnZegUZlSWpyXopqZsYQZEmwsC1g7FvjschRiYO
	xkOMEhzMSiK8Pby3UoR4UxIrq1KL8uOLSnNSiw8xSnOwKInz3u9hShQSSE8sSc1OTS1ILYLJ
	MnFwSjUwuizNq31tbWrCZxdXM6VOvPP7Ym+3HVa7AvKm7XT2bdvsey0tIKNTMuiYwyPXkyqP
	V369J3uTj89k2cXTB/7N1c/tOfP62bYZh1yDGH+9WZO56dWzRb3HOra+55rN2hHvsSKs4Ne+
	9aobL3Wu0Y593+5YX9azsHfBopsqzRaeQfNS82wiYpa1K7EUZyQaajEXFScCAEUPJDOiAgAA
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 08:27:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104416

T24gTW9uLCAyMDIzLTA4LTE0IGF0IDE3OjI4ICswMjAwLCBNYXJ0aW4gSmFuc2Egd3JvdGU6DQo+
IE9uIE1vbiwgQXVnIDE0LCAyMDIzIGF0IDQ6NDPigK9QTSBNYXJpbmUgVm92YXJkIDxNLlZvdmFy
ZEBwaHl0ZWMuZGU+DQo+IHdyb3RlOg0KPiA+IEknbSBub3Qgc3VyZSBpZiByZW1vdmluZyBYMTEg
aXMgdGhlIGdvb2Qgb3B0aW9uLiBNYXliZSB3ZSBjb3VsZCB0cnkNCj4gPiB0bw0KPiA+IHNheSBp
dCdzIGVpdGhlciBXYXlsYW5kIG9yIFgxMSBpbiB0aGUgZGlzdHJvIGlmIGl0J3MgcG9zc2libGUg
d2l0aA0KPiA+IFlvY3RvLg0KPiA+IA0KPiANCj4gDQo+IG1ldGEvY29uZi9kb2N1bWVudGF0aW9u
LmNvbmY6QU5ZX09GX0RJU1RST19GRUFUVVJFU1tkb2NdID0gIldoZW4gYQ0KPiByZWNpcGUgaW5o
ZXJpdHMgdGhlIGZlYXR1cmVzX2NoZWNrIGNsYXNzLCBhdCBsZWFzdCBvbmUgaXRlbSBpbiB0aGlz
DQo+IHZhcmlhYmxlIG11c3QgYmUgaW5jbHVkZWQgaW4gRElTVFJPX0ZFQVRVUkVTLiINCg0KSSB3
aWxsIHVzZSB0aGF0IHRvIGltcHJvdmUgbXkgcGF0Y2gsIHRoYW5rIHlvdSAhDQoNCg==

